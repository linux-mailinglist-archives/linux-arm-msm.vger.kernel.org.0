Return-Path: <linux-arm-msm+bounces-74911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17574B9D618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A52B7AE75A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7F62E7621;
	Thu, 25 Sep 2025 04:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oh7kkAtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198E1A9FA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758774379; cv=none; b=Vnw9D84zxVUkVVsVO6WjJKBIilWiBg55mHBzxa9XMMtdaYu+WSnSht70ZFla6NmHkqjvrEDy1VubJAa1J8OCwfFz6EPUOyq/XIszcrfaLgXutCOvgCWpC0x177uFbZ4Q1HR/bKsLoc0qcR74Ww3hCE/oMPkHlI+p7Wl095YBbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758774379; c=relaxed/simple;
	bh=KwDml+VKamZoZ/8NLyiv7Z5OQFPQYZ/pI7BVR0nIL1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=orcJu+u0LTG2mVVhFNscwCIAsEYbuAkxfip9Xa4J0+dEruWrE8TZI204TFZVbNerrGk7zEP49kzjCXf6r/xQV0cjECgp3uuOcMxEKFFKj4Otunlx4HLqzxL/ZI4l+/Igy+tty8yZpWjW+DYp1ZqPbTltXjDcTd1QAveoC0rKhkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oh7kkAtM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0vM7S002135
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QzN0PbQqJiRihO18yohAMqtH7hCDuoHFkrT
	iBWkA/eM=; b=Oh7kkAtMuA2p0mtB2ggp8lAeo0Ukgqe8k2OkRT2rgazr1YERwHS
	rRtIIpbDDaxRFMjYBf703u37Mpu9FxFbKy1FjFHjhg2frNlrR4ByIIIV8BDxQe2w
	kZV87qe9YhLs63w3Im4JJPAfSy311E0BD6E9J2LAvR99NhXIKXdXqPxI1E037PJs
	56hZSgmlM754c7bbbhZN/MY5tCeIZhuru3LEYnkUcEy8c4FrToTIz5Q3Lijxx3RF
	21HSDb+4FO/bw0z57/75Rl0veZdHyPmACbeEJhaSW0BAk02W01HYq4GLxBMJRwQM
	JNPhx/hTpKshKurEdt6dZ34wnKC9BhPVPpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pqmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:26:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so929436a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 21:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758774374; x=1759379174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzN0PbQqJiRihO18yohAMqtH7hCDuoHFkrTiBWkA/eM=;
        b=UVYByB90I24Zt1/B7Jc02eo3VGR28wKxDGFJHGD5r0w48IvdIRhCtqmonId1gdxNWJ
         cxGvGUJq1Xi144qQP7d3mujxZqQV8O+JTMCbXLx0/YEk4p9kcWgIz49j9w8bG62zYanL
         5QEZJSOOb6xUR8gzz7PKW0oUzyPN9+S77DKRJ1YL4kAZo4d+LrU9w2sl1VWEqic8fji+
         uCXx1TnJxImqszXaNck9Fi4InIr1TjceEN+QnWhQ5IYsjle0s2oHLeO3bap8wQynGwnO
         a0HI/IpL+PyHT6eTv85OqNnu9PA36Wz6BTKoMc6puPVwA90esAEEYE4n6iAqYPoEQmb5
         OCfA==
X-Forwarded-Encrypted: i=1; AJvYcCWVb6aPkIr+XvvzCAywIiE4DO7mPAs8OeskMGu3ZOJK3TEf1ggQmbwMcYxqF/7tpc8cz4IMT29jy03KbPW5@vger.kernel.org
X-Gm-Message-State: AOJu0YyqUBPH9Z8vuf7RV8D4f7t1nliYjE4nb5eG59QiostUJG/JvW+z
	iOIAtsJv/tEFzYHM1yajul7iG8N0myBXcq/zOZOhKdkNTyXhQ0Rm/kHlmxNoUNQdwpSm8HKQVr2
	pm9ELMBDzC1k3+CMRI5NGzsZXR+vTLbB4kMJLXMMC59DQMidcUv9mUHZUme6SBUcv3jSj
X-Gm-Gg: ASbGnct6VHOL5hi/+m7NwrNuf35Jd/EHWaszqa+CDXcgUU/a5ixWGbJL4nL8bC7FHQT
	kcDtAfNZOXSyiq7km1SpRnD4zWn4vLEq1C0TYqsnqX0uvwHKJJE/7lBxPIwzdaSHu6/bQVKaf/p
	ELOGy4J55t0F2lOCXM3xTsWOKAnICtG60G/vaCVMH+jrQIRVUAV3/UvpI/kz8rYWbMCyjh/n8J+
	QMr1P4PmeAeNHMd8Mj0PF75E5mWrvdcv34UxgdEajDFSv+QEGBRDde7hAKCXmxhyESENoN2v13O
	HLQks0SsrT/LEF+VjBqxYk6AhI+mu/+KB//2qHdEA8neY8rPPyjVARt//iVcpBQxpTRamgZfr53
	K
X-Received: by 2002:a17:90b:4a92:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-3342a257491mr2000805a91.7.1758774373693;
        Wed, 24 Sep 2025 21:26:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUZUnSW5Khp9aZB4808Uo4zwgcJwfbzYwCHapgsYczaALl4fGiBeUPgfY1PG8zJwA2k8HfPQ==
X-Received: by 2002:a17:90b:4a92:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-3342a257491mr2000784a91.7.1758774373311;
        Wed, 24 Sep 2025 21:26:13 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33474b1f455sm738211a91.24.2025.09.24.21.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 21:26:12 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to QUPv3 nodes
Date: Thu, 25 Sep 2025 09:56:05 +0530
Message-Id: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9WPQfaZ8i2eS8KChPh_XHgOCjc1nm98i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX8ubJPal2jlAk
 5f6racmsUUb+4O9yoOKWXjZQ0e36LunfmGQPmwfwdMLNGGimZWFmbbqeq4GT6LCNXQuW7Lng9pi
 qlOGYm8DUIvRQiTYJxUNa7TSpscdIvL7+aJmrtXSOZN9170yvXoYmCZL4uArzCn1NcnwHQUzS+s
 bNyyp5yT+5JUZ1vXrCsuS+4pyvfanFv4wGLgVZFHWnGOIShrmHfd3Yo4d+Hrx1FHgks9wftcPjm
 a7XdzntF50dWXO7Plw+UJdnSFLN4lRabcWOSePOmsAq7k+ktbDapI4G/FpIdw4rfru6EKBmbfvq
 qTOgzP4Fdwk8nDa7Km9PbB2Oil23h+2bQncK/ryJ67Bax7czbHb2WD0TFnspgYoBGa1fPcRKdkN
 dwKqHkb4
X-Proofpoint-ORIG-GUID: 9WPQfaZ8i2eS8KChPh_XHgOCjc1nm98i
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4c467 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8rlZebuS5uYMG-XfLoEA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
ensures secure SE assignment and access control, it limits flexibility for
developers who need to enable various protocols on different SEs.

Add the firmware-name property to QUPv3 nodes in the device tree to enable
firmware loading from the Linux environment. Handle SE assignments and
access control permissions directly within Linux, removing the dependency
on TrustZone.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index e72cf6725a52..d566737ee012 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -401,10 +401,12 @@ &iris {
 };
 
 &qupv3_id_0 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 	status = "okay";
 };
 
 &qupv3_id_1 {
+	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 	status = "okay";
 };
 
-- 
2.34.1


