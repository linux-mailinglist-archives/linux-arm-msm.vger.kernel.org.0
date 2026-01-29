Return-Path: <linux-arm-msm+bounces-91091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABJ6ACGnemnF8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:17:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57443AA333
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2554E3014563
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FF0824A3;
	Thu, 29 Jan 2026 00:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvZGQPoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCxZmlO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D37A13A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645672; cv=none; b=fFj3zXRGhJcQE9Gbyd6OVBOUHxzGymAuMujdcYiv2gGkq0JjxJwx7c8V8uWUadMvQ3IkCL3vqo/cJt+2W/F957ip/uHMQCfaYBX7g6tXEA2mivV20MckNJdlwe40INqYYkbwAsVapUkRruLd5AZhkyUsG6OvSBZfj/jSIPCaqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645672; c=relaxed/simple;
	bh=5eJpKmuxLbItsTepk0X6pxPGIn4b/43Nvx2usVbaCUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jc15Kx4E8gE60bDZYQJxy8IxcWaPlVx/c5kfoWYA/d2X/zfTlxghjhnu50fISP5T5Ip7K3Poa/g/oQkxifdsBWNsP+s4hSh5wxlxPI+QgexpKSlMB2YBd85roGiPLGXCZNabsa7hhSLHuKJpnG9JjyqO7LwAlhfvkESlL5hOi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvZGQPoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCxZmlO8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SLpL3S1398770
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NHSUCfK8Nhv
	ZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=; b=VvZGQPoMClaFCvQohw42lwujPJD
	2gGDmOrTo3QRYDaZoGQ9PrMstd6DIKI6UZAVY5m6F2Mqc1WkkgIZqV/ayZgAbIFd
	m8NyevGeixJ2di0dF8HhRXyboddJ5W0d2gQOXSVeTQQ+FdtCKDa1Isd/Aw6luA9b
	pEezqEv+34MhCeNxtJoSxFPT+41I6Yakj95m0mOZOqXzHOOHVEbO6H0NRO++rE2F
	AhsUbRZ86IvxThdfEPhlMLoqRXb8qvDex5FVYWCkOw3Bg3cEgeSdClyxmGDgzHix
	uhXqXCYMix+cxJUi8vsAK7/Xsv1a3mmBD2NRtQfw0DdSDFcoL6InXHBJh7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0av4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:14:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a7a98ba326so3946935ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645669; x=1770250469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHSUCfK8NhvZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=;
        b=PCxZmlO8mLbRh+b/PmJtzzYI4DU7PM57/0LGUnSw5aN9uJzHM7wCYMNAQlt3JXw+vM
         unJxmPBSgxyTKf8pjjtLDfPUv4HV0WeGv+6MGS9JVbFKAPvfBUEPQwNvw6oWzgLW++4X
         Apq8oqwqrB9PJzyCDLIqu9P/JlAtQ9Kwydgt6dTRqeLDwjVpyLhB60k7igk3nYdjy1Xc
         GfqayQFkmfVZMJDAs1dyTIFQx0hwEM0mXmao23LYW2aUHzKAeMy5URJNu7kxGrHDfpMM
         IgNr0Q5D84B1aUGuagiyxMmIuubTs+Hg7pEPyKfUgx6SjZyv4KbOkE0r9vBPua+CgHly
         lvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645669; x=1770250469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NHSUCfK8NhvZQ9rhTXSrpdwuyAZsjwZ6PUcEgeBxSko=;
        b=gpHY3+er4wcW8xSQgtIoAYt3NNHYuCZwZzgAFnHznkdYsS9QzL98GPVDl7m4k4IFYO
         dgAFa5X9kPQ6yggfoyyAxROfuVRbP/41XseSQoKY3LW4bVppfR7LDZ92+ToJKfGMLw+x
         pIo/WQsNUE27rDChcEAtSZFMrXeKPHLkKKmC/V0dsZcg+dyOXx7n91radMfaD60JP9/W
         02oGcc3cxOjdv55mcDcDOsFaijEEocwCy+j207y0oaGvWiqFNjn7BxXbvdRySTBu/muD
         oJ3krffGGfxA2qUdbMNbF/aVmmbCkZDPUQorbmB91bU7RsE17HCt1+9PnadkIfvfM1bz
         Auuw==
X-Forwarded-Encrypted: i=1; AJvYcCWrgoN9mLWJANm+JWnsnqfJYOJPIKm23Az333hokUjcTXWG07QSGMi57sctos49Uh/f8coMeuuMmuAZ4vYk@vger.kernel.org
X-Gm-Message-State: AOJu0YyWE0lHGxW3M4V3EcUgHzcDL5EdpU+tOY6M0guqcxZP9UR60b4l
	J+mDB1IfBv9knozYfIWJer57RkLDLbUu2ra+HryhyRufgXaJveUJxc8/V8uDAkTTgIoY9wlRTPQ
	kmOWRcjyPVpsxGUdXp6izdRKvIrEwixq7NPnUX1yI2gYaV8ggwROR/rSIKdZUFL9Jc8mI
X-Gm-Gg: AZuq6aIGfDjtyJKQ+NvpoH43H8snv43agyLcKQmsVKXljeV8leWcgRDUoiDyopwVAEM
	Tru4CgNXIajcT97knbtQD1Fh8k/9222B0OUF6+qaFMCwVg50fuOTwbQoWQDbiVQUUfmRpIFGwOn
	HnmR0U/kNsl/SdtMuTFfhDCU8VFyXoDNUOB/WHE8AufWcOEG43zh0tOxXhFhC2A/F6e2f+rWXeL
	2izk75/tT03nhUfkjUe+W/z4JolOSJ5NN7HQ8JB9aYV5AN+G6m8aQRxuRQavr1ghfmSykRKzk0v
	dLBabmDiXD7ZmGejJ9OCa3FHtla6G3t+pdKSjplJBFXk6gwI3TqYZCSemr+HeU/aTmarqz8zlRV
	Vmt7Agkga2Bo/2JVxfYMbYWAoV82z2sR8VL01bbsyQ0aY7B/OK8YhPy0kbfqqTjHhRmEZ48um/q
	O62bQ5C8hPF7ClvEVQ5q2LMhbt
X-Received: by 2002:a17:902:f541:b0:295:4d97:84f9 with SMTP id d9443c01a7336-2a8bd502962mr9310545ad.26.1769645668557;
        Wed, 28 Jan 2026 16:14:28 -0800 (PST)
X-Received: by 2002:a17:902:f541:b0:295:4d97:84f9 with SMTP id d9443c01a7336-2a8bd502962mr9310375ad.26.1769645668069;
        Wed, 28 Jan 2026 16:14:28 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:27 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Thu, 29 Jan 2026 05:43:58 +0530
Message-Id: <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX1sBZmsFhyScF
 DGRT1G1OnOQVRR8cVTGFM/b9w4FHPRefHDoa10knqiyqVFxmyoT31H64nqBn4ox88tUpN9nQOvO
 nXXTmbiiHTCJ4LBuqBNHyLMEyuBliISpIOim/lY3JOpVFi0ElEcAa9fw3lPvVgaBTcup7V56UBV
 nohKzm8fIzX1kojOCPj94wVRMUM0zOZO64BOsYsGRBHIt3OzpCbvCmz8JfyTGBIRakG1tATmsWN
 xZg2L6uHjBTEHQV/lV+jxHgFr2zCYnHdSFPTeFE0pDhf+njF+mTwrJ/3bJnBYvLGe4u8d6ot1i/
 gKx+q6da6F12ZahbUqjKtoePVk1pbWDgxBv79BvOCkwWxMcG9MRplaFgYArE75/NzNxzfSWJtdJ
 dwkijo6JyEDZBdwxZPCizfBlPG+atdJ9n37H5KHOPktZ5JcSebDeDBVT/o7pxn4tfVkIo+Ma7ah
 +WZVYTvejk+OkPVnuxA==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697aa665 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=uDRNohyrUr9TWZXFZNYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: feFDyNKOuri8263GJEp9PY7W98rANC9r
X-Proofpoint-GUID: feFDyNKOuri8263GJEp9PY7W98rANC9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91091-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57443AA333
X-Rspamd-Action: no action

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 0899214465ac..0eed4faa8b07 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -487,6 +487,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1


