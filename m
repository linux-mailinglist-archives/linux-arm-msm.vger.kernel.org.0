Return-Path: <linux-arm-msm+bounces-107876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD69FoMQB2qbrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:24:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5854F794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C62931698A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A854948A2A7;
	Fri, 15 May 2026 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4jVhYSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLCuMNHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B2481FD4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845709; cv=none; b=s5T7mAWHQa646FM46FsAaxmPjOfwTOvvVjQFEgiQhQRTzGQz671HQsnXje01G3QjEl2dzj2e3LqYDFNzAsTg8MJk7de0vi/TCKJ/T8N2QzZgchL3QP/AME1NWDKWLDtgWy87kAiMt535CBfbGV6nwWK8ur7B9r8fDrykYrqVB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845709; c=relaxed/simple;
	bh=PZMTLxLwbvZOwA8LX8WRjQ2jAtxisx1shd7n6n36z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kx1Xo4ZUnzk56/3MPQFaHndW6TSR5WWVENGQAoFgeggIpazUd56an+Fk07S69zAz+YvYaEhoeCcuw72tjL5/GBBeM/66BZACtbwIshk0jBzMMmmUo7B0hfCNwHsfD6yY5ZEvi0Fr6WZmMF++USwoG30J6c1fOP2rmzXNfDD5Ins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4jVhYSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLCuMNHm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5iqtb3199796
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=; b=G4jVhYSfQ84ZVdW2
	tx/VeMsX6Ad/DFD+4cCp4rwjNY2QbotmXxorBSrjJ7FB/KjmPBwUYfCdxla1bpYZ
	VqlhHZosF478JDOQV3hlLS91fjl+I1zxFc4aiiFkpQY2S6lmcEzCtEO4K6G4rLC2
	E0W/YCo/SOhcxKOhtKyUBFt3P5DrS+wU+lT52o5ReH3a4LieHPmuiaExSqqY75br
	tHh52PSVX2pkoHbOF0rJbVoYqZPzZmCf++drg0XKANUmLVgoKyYE2jCMezsIDITs
	heJmaROE7nQVMWUj0Rpk1uv8GHUpuzgDbeYH59+KpCTvCtRANk5JXUwo7EBz/E92
	D2BX1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu26n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so121230641cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845702; x=1779450502; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=SLCuMNHmH4Q+TZPUpIJsVJ2vVikDK9rUglRiuiREH6PrrczDZYygJ31NgXPFxG3xFa
         BA1iQaiEnQZoJVFmFTGkYqSbBW5QJT6yQeqpB3LU/VLaabhVbQemc2hAFXNGzkrIGemH
         W/4QtZOExrz35SeNlwd2h2vpB37a44fqcl3yRsdKjGBDhDR4uFKh6Sk5jtn8xR8HvU/g
         XWxvL7rF5oZkmrvI9p50z1N9/G4JzR4u2UVIJQForhNWpISIZQO5z8e8lAYK/8cgsSSg
         6/z8DhUMgdf4hiPV8HBdr4UIriVkF/krNdwuCgESgNFsHoO9P0zKyzRM9rEhkSWGIzeI
         0kWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845702; x=1779450502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=Sqjbp8pr1xnSIplzW+Z4yBh9Gd9K+TeIpfC2cwxuIfGpq29kpLl+B5CLL1KhbDU5Q3
         bUMh3wTrLWOTZulF4CTMxIeCYcEZz9NsaGdgZAkxSULnWZb7AxtTRcwxF8ieiVKlKAy0
         cxut2WaRARKwvw3Ba6N9yBzMZpMERDQHN52mL7je2Nd3qlZga03Q3ZSqS5LuE4jPrOR1
         pGsVc/qQubutHeY//McuhTp/yjQz4ZUXxkh0vTUSZ9NRGjPbpvHb+GtU1/+nwDsPoP0e
         yNinbDotT/cOahjXee+d8lRc4e1i+O7HtmlOmsiqfrc1GnkMx3ndIf8vbkMbble/m3te
         mGpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QOH/6/Ux/WFGm5TlOve3iTZgFDt0xPb9ul/UMD++n9+MfNFwrdpYxxmiIMUvJD0TbHAxwvEXFWcXs/hNG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxlrz9jt10LeFsAhjve95SwUuAyg9tisqBhUNCO8gjaZFu/JlI
	/Ma60s6HrGBOTKECefiyH2LxomJpNmDaJ3Jkc6pkBJROWkW9RN757VmOmYrIe186PP0CWLeHd/F
	E3POeiE40n0+0dPw/79Tdj8e3u+gb1cXjq9IT7MNSzKFkZcwMGrub34FyIV0VjvuKHv9t
X-Gm-Gg: Acq92OENXqagnLWxPDruYAvUf4gbm5fhYousw55ybyuottJoYG3JXZbH6460yENPFZX
	LiHJbK8nl9DWxluDn17SW9b7YrsC8QxaFSgFoKaBXxfDqppM5FvOJ72grACD4jXL6PDwiCVXo+g
	Rt70BNmmi8YagvAvDaTKKTdcdRLLMSdq49AzkXgY6LZXMxNuEbAl9AoXRv8HSuO/eIrSdVd2mPY
	X5RKXt+ALDfydoIj3WIIsA7NmrJI/jOLxvYY7zx27wdmKjtfUGC8a0K+HUUEhcHkGp1PYmKV4Sf
	zleJp3fUoaLSCck9EBgdqFLegEUM1GedME/DFIuaZUHGBl/g+c6P7fx6EUQwVLmKxzxrBYM6OK3
	8jymHbsuz39vVZmTuudQRTTsF756yvryGgbXXzSvi6q1jsX5UurG/2we5XWaicaCXlk95Ue4Qoj
	vgFZLmyUEvQWdIG/G1Txn/4IWKaauG/ba/IzU=
X-Received: by 2002:a05:622a:1b05:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5165a03f084mr50859741cf.18.1778845701516;
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1b05:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5165a03f084mr50859291cf.18.1778845701067;
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:06 +0300
Subject: [PATCH v3 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-7-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2AZDVaVeHjBN9ieMkt6OZ54VG8WgR2+oqvqtNSNqUsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1F9avgrZWq+v0I1pdodAUt/N3MADwO/BeF
 YPULYqOuAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1RavB/kBUB7psisjYBhnxLnD65L34JyEGjWu0//xRyJf6bEggrC5MYMJyqMMS5SD88Eh2lqB90R
 0vmtqmO+8nRwjTRwkR9InqVGyT3eFDNbbakJhttOL1+3NH2CICvrWLR33qvmXRRgq5q/bvCLZrF
 PlH845qsyQsn7vhyCH3WBKX0UKmXzbJEn+drUbaus1AylXbIQ81Bemuw1t9ID4bFGYLBP1QhXMs
 jWgiIVkea93/CTSHlih/9qn407lADicGzS6rP7ZCFsgJeQLWd2lvDka9dUlpaykzuL64oBghucz
 QRIuea9bzmEmzk2xgFyLyIJ9ERuBMhTuXWe/kN+8NQ+SfeF4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a070806 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wBTHiTwF-Qy93MNzjnrNVvcuqKPRs9HX
X-Proofpoint-ORIG-GUID: wBTHiTwF-Qy93MNzjnrNVvcuqKPRs9HX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX5q9tn80j4Jqt
 HBcPSqM2XtKAcl3+jxnUj+V8iBHm3erKZs9vg/3ttDxnphLkSSeJVZ8M6qxGsp6s7YqLjooJmcD
 L5pVlwhpp31yJWYxlzn9ii8pvsQHa4qQhp+SLNyzf5BcdMnEhSm1l0P4BCNuaOC5fS4GOtLBfPJ
 CgAlMKuabLS/uIbh8OLUgxR1MUOFcfKNL5skXs93fBRRbP70+bTBugkKswAeQNiqaVJyySwnRnM
 bw8Apl52MQHpH3uxHlatsaxFftVnSU5cA34RADZ964d6EZ5u3vutGOLtYxEdUbsfxVDzC+LYEzR
 FHSgvX/nxg3TiSV/AHc0BmVPm3r2Hi0td61tuJv3M6vgDeU9QVGvYsGtoA1d7514Px5sttRIYPl
 egOgDJdAIAiNBvr8WNLc07LX93m8dycPEzoZ0FFPaGqTDcbLAvvidpb+BSs/WfQcUJWJhOjTQoi
 sa4ChfRAucFGCiuQOyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: 6EC5854F794
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107876-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 51d8faf6fd1a..e1dc226066c1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -284,6 +284,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 5fbaff5c01ca..8c1c8b19fa99 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -109,6 +109,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -139,6 +140,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -177,6 +179,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -207,6 +210,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3


