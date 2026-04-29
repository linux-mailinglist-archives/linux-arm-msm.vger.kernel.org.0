Return-Path: <linux-arm-msm+bounces-105262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJGMFlc78mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:09:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C649803E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6070C312D120
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3E62C15A5;
	Wed, 29 Apr 2026 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPBAdXmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FC4+M9C0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B793FF8BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482136; cv=none; b=XbZDSCPR6da0PLevOk3nn9e1s046vUbPwwcJRJov2OpRMpva1Hwu69VEB6lRttjRLTOQeO35/n6wKhMgSglcDk7V/PtVWgxb7cZsF5qI1ZpQCUVi26us3hapXsJ02nAzjQrpmgpTsoqFJlKfBcC/MzCBGmp7odvvXOeSRrgJ5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482136; c=relaxed/simple;
	bh=nGV1Vleb9T9SpqQBREvA0YZlDOG0M8fVTNUv3Cn43/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O2H1MEKZJpGOCfvdBzAoUr/8rQl+QPIOr6UTU4b2lTBFVQuvW4Ut/pZFiV4NXH23xtLH6gnttdOlEj4aFJ7usB56JRI2ip6gK3hiTnO4EZQStc4R24y/uap8HrJX4spzGNIRyD5qkH0FKHG42oS3gDR5jQSfdhJILUTOknp4hXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPBAdXmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FC4+M9C0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TG5Wkl3857014
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EAqVn8rmQhGBuk9O9Av1mtCrWPGHtYzR712NYUgJqpI=; b=hPBAdXmGCYoPKw7B
	d1T/Cb2kSeM9+rYCy54YAhlPfUqvRQQYIWGMhJCaf4WcMQGhsujRN0MKZULjkFVY
	y59+K714s2/SYUddJVVvO/zqPjsWzk/S6XAav4omng7yZGSclt4d2CwS0zcsY8kI
	z6ZVO9RhGEov56C4ER23ujwzCzqBlt9rs4L8i6WCYThGUU/NDCZkWQAxmnt4kWg9
	8OszhK5LUZoHZgeBFtfdep7+LqBwbmScs5NlinYZp4c/0OuGQrTIKzLImi3so/iu
	T6a86qHySU648dnK+fDFduc8wjtIpJydW1cPNLu7/RZTHC23X7GkqYSc0HDVRPia
	NbVC1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71g8px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:02:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b465bf993cso159265ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482133; x=1778086933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAqVn8rmQhGBuk9O9Av1mtCrWPGHtYzR712NYUgJqpI=;
        b=FC4+M9C0nzLbEPkQMX5jd2W1jfXAwlQJ8oqqfhmil+D9cI2nu7Vr1gbFz/0t0m+neW
         i6LzzhVizl/iyjb/POQZYPhvbNXABuTAqGm4AHQXL1my9SLqjVQMX8j5prQ7ltilSS0W
         3RAJOiXLm4G6mfGMfW+jAOiU4A34ZNFb0Sy6PX2+tXPd3Gr5a46b5wtTcfJCNpXaVUAC
         R7fYkwvCi7xCEolycS7dG/yiJGwuZ2lR74HovPrvV7PA7CTDxg11X/uyVWKpDLUGCOyg
         AAjUYgAmBw+3uAPPfKtFaljixWUT57B0h/f2GQq96KFbJeUi09TOvLLIKMzB/Q4vK2hK
         vksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482133; x=1778086933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EAqVn8rmQhGBuk9O9Av1mtCrWPGHtYzR712NYUgJqpI=;
        b=LmT7I9/pzriwXmrKP6ji9PETfsdojqCZGLz8NVwN2rB0Aon3tKMjSUs/SD7jD+m8g7
         0dCtPvV6r9DqyidV92HuqargUJ1FKZOswCjZTEX103OFwsJvf/ImyiU3sHh6orPUUNJ1
         lrpjyyDQfgeYbtIF53s1ZIEPEGE2HF1zW07UrhguC2rDNUf2Look5iGb2VaaL7DXJ2su
         gxf6StE4RaUp4yq2mjjO8+GQCLUJaLUqiEf1/rmEEY/hGyiPLWv1VhqnGVyT06BSVk08
         KyFErLT+74huP5MkO6Iatjk2x0hohn56BP7K0rn7kE0jMEuR0FvwzLODTkDw1hTMAWGM
         sefQ==
X-Gm-Message-State: AOJu0Ywz+QsZGbzmEPW3B9v/ybriZuNa8DYopcoa1/FHL4s0S8xOcHpv
	qCbejm+3wcbpZ+WRIwtrUj+PyNdMuJjKPZjdjUKrNJrqIW6RNALTk0xfzUGooG7F/jAMADzUBRg
	ofXVMCW5UfyJOTV3nq9yaVWLdpqJF6q9oq+q+lkWhVd5awvD03nvWm4fgsd6MEMfEypNa0RLoJ3
	bK
X-Gm-Gg: AeBDievp2bJAu/DJdrDkMLEMRhTNOwLCOlPjKd2THzYfO8EgS4RBzNZsfKWWOUlvuVi
	DU3nD8XEP0JpkcK6PoFmvl9wwl+FMIYIPqgkiSBHGGYjhskTEmxNLcO61GwceAcYJA2hhj8nPZK
	Em6BUWRoBmKXexP+RxuVXRAN7yX+D3bZiZkq6JrIvEBWgG8HWJEdhSCCkseDBc0s9/alTT6fIxl
	T2ZrEhaCnMYTmL0sIBN/M5hbOsaw2eBqeQI+MhLP1Xr0nj0xb1ubQjsk+Ecmq1ULJsthvmOw68A
	SSAk8WBdbJFOhuoZjwS7MXpD0XF6QLcEvwEVmm4VFdZpB8T8PVYDmVKU1h/k2YLeh3tG5YdYP+f
	3c0R/026Bc35PCWiSgFKnmnxjBLCgq4YofkJO0TXOCzcF2VMmqVY8+t66+v0YJfx+Qwr2
X-Received: by 2002:a17:903:124d:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2b9872f85e0mr43422755ad.7.1777482133240;
        Wed, 29 Apr 2026 10:02:13 -0700 (PDT)
X-Received: by 2002:a17:903:124d:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2b9872f85e0mr43421875ad.7.1777482132511;
        Wed, 29 Apr 2026 10:02:12 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:02:12 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:41 +0530
Subject: [PATCH v5 6/7] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-6-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=1377;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=nGV1Vleb9T9SpqQBREvA0YZlDOG0M8fVTNUv3Cn43/A=;
 b=PZ9lIx7B2mK4TnJ+F7r8qBxvCpXA41gTeFcIFD+HDSVS529yym05f8H3WOUVrH81Akfehi8DO
 kfa52Nnwg0TA5Tdx1MJ2ExYQOfDSixDHvQPJax5+C7rHoqMhdFb3gXs
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: Dc7q5aYP1N5e-ghmU7nq7CFoD5VcggV9
X-Proofpoint-ORIG-GUID: Dc7q5aYP1N5e-ghmU7nq7CFoD5VcggV9
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f23996 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DDoZI6XnaA0zmnrO1bYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfX7WuFugIlAaxq
 o+4NlmmbUNHh9Lzgce62Z03kZ/8f/iuW+QT27bXyVk4ZW9yzlX2qebHK3RZ5RJHqVaxOpp6EHMP
 OnNiGh921xvD2juiA/3bEtjIv9KDlDkbbdudLYowO2iVfR5bmaEisx5M1zpbR4Um0GYaLuKk4Zr
 nwmeBmbEeYBr1k1Tjr8NUrSDa7FoxFFiA0Rb0yvM2YvSumN8gUmh33kdrJfGVMgv89/pfN5VDoi
 ilLuMa3onj0wsh12pNOdhuwQG4Qf/rRfin5rA0DcFQHeuI92obUF2smRlbLHgzn+FpOztSN+7yc
 nZXzlxZttbF9ZFo2asVk4eeTCkttoZp7sDP+nEH+lnbYNi5sBtujH6YryJRYeyK/xuYeL+8UVI7
 7LXfClY9cNc8S6IMGIyNI9/8UC/51hTHIKO5pVOMsOZ9e3o56wi0smPVthn/s8W23z9ONU/gaDb
 /6A4s/IAfBJTiveO11g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290171
X-Rspamd-Queue-Id: D07C649803E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-105262-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,88dc000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the missing QSPI-to-memory interconnect path alongside the existing
configuration path. Without it, the interconnect framework cannot vote for
the bandwidth required by QSPI DMA data transfers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..2dbeb15c84b7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4418,9 +4418,12 @@ qspi: spi@88dc000 {
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
-			interconnects = <&gem_noc MASTER_APPSS_PROC 0
-					&cnoc2 SLAVE_QSPI_0 0>;
-			interconnect-names = "qspi-config";
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc2 SLAVE_QSPI_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
 			power-domains = <&rpmhpd SC7280_CX>;
 			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";

-- 
2.34.1


