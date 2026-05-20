Return-Path: <linux-arm-msm+bounces-108811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OTfBKrNDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD9590774
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 261DE32130C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202343FBEDA;
	Wed, 20 May 2026 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cnkxh5Ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eddyu0FS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129E3FB7D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288727; cv=none; b=V28YpHyQ4cxt59lN5Tc7GT7JlovDxXmp6jvVwikhhSlEw3Y+2B536cLWJCzlDY8TVlTgxiV0SQSX6Eiq0Oocz7Gzlokc5T5vN2LHwcHAAgMRsbSh/LmfPzClpmKqvfjVmKvkamY7MhGbVWlKjslaIlG1xdY7dAhYItNPNVMfSQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288727; c=relaxed/simple;
	bh=H0u9J4NpHkoALoZnkr4HzilolgHdpafpbEfxO94JORk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MS+OonSWWU8Sa5oh1Q3FFRHOVG930X8mPxxmE3xnV4vGG6R2gKiQOBAdifiBnIa5+Mh/x7uuwNpIOWFiPqmk72dXZwQNiH47u3dSaOfap3Xn4621qzs6jcfJx/wcJy2JxG+1mvTz4nTdq0YvIiqSZNnnmIJERZTPWlcTq5e9/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cnkxh5Ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eddyu0FS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2Kja826519
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xm0vNFmSC6On7sSlFzQL1hlJJzBLrMhRxyzus5igF6c=; b=Cnkxh5Ra7I9FJHHD
	K9yx56yLhwuX1AZCGbU6zkM/Z5w3X7HIvbLPeDcRCmrtdg6LH6KhJIYZMArEksrM
	be6kJEvLRZsUwPQiXm6m8DpnR0BD7L7pQxtsvBNTy+RfQvXF3SDPB4C3q1BWY6+3
	4ui0sddovD0apB6jrUntKWVPyN7iWN9UhFv6JeeJneOboaIn3eRm1blPPrejuWwL
	9RUm32+nX/aqDN+hks/APwgCF2Q1fSRRu99GHsNMWviRASYv4sN9e6v0kwu5Fr3H
	9pHVNHhJrBQ/pwvUkAp9jPAuS2UgDwJxTc0Gmz6eCsddZTlEBrmCY+P0cyqQzgTO
	c8fPUQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6327b45f59dso2184398137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288724; x=1779893524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm0vNFmSC6On7sSlFzQL1hlJJzBLrMhRxyzus5igF6c=;
        b=eddyu0FSEZ9GzNWA8OfuYfiUZUSWtXsH9rT3gtl2CS5AjSpX+VM5Gy7tQruVUdojSJ
         QD46XkUX0rLcjtUgEBKu/u0N5Dg+kgKYqZgce1trsoAUeQDJ4IjYVH9yt3SVu3jr7pOH
         b14wXXiw8ZVz64ae0iMMG4DxS2kI7o4+LowMTunZZkv5kPz6Smqird0UzYCwKdEEDxT2
         jHbJfEbvCnNghy5dPGIHK/y0lPmW+K8d4O1FEK86jaKNS2CWLnQGgAaIEOCpTakiSvVw
         cxA/ocs1vqSA1FsuwBDsIjrjtoUSVtnm+E+vR7WM7rYzSGrKOFupTTuVq8bKeZ1dtKJ4
         t4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288724; x=1779893524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xm0vNFmSC6On7sSlFzQL1hlJJzBLrMhRxyzus5igF6c=;
        b=KBDq0lwKmWeo0j2hSTFpDg5rF1sMIPzEJhb0NcaFKqYpzQtHTd6DbXPtnbeUUU2xiW
         Lc9MuTwhc/SLgjwGoSfEs9gYkGWBjrla6sdqTxqwEPuXOGK36OJgwEDTMw2EwJOk8Sjm
         k1FfkjKWBCcykrx73QDYRUD2TD3EAq5u1G1guRrH3OEhmLe/oevu4Gc0IHCQUXepf9fC
         4dzTU5g8rAQu/+GIe7mFt429sHhPuO34vNju0L2E0HcwLcJEGznoBXtnw7lRUqZQjTY/
         AgZT8TgSQXn9FzW9QB1cn6iaSXe6Lv9VxpnABntzxzmTEo60tcYAvSh1IcGweTUSuNdF
         JnNQ==
X-Gm-Message-State: AOJu0Yyn+kXU9RDMTKd2WE3L6PlzrK04LoKJpzeqqWcXTjhNdyYeaMlD
	sNHDMML2sj5jElmDWaii/lVb79OEtnTQDX80+K681+2eHnfLIcyxchpMvJWgl/LyGa5gpBbjRCJ
	v3Aq2yT/mK5amTlZVh/Mrob5iJrVQ3EoeIgVXv+H7vup8xz0UV3vu2PLa6zqcY8+i6WiL
X-Gm-Gg: Acq92OFna48tn4e/zSr/5Qh4nWYTkaYJgLJBrPPZjJqp7neLAlUH0KAcr296engRavB
	2HrLIwHTyyGLoW4XxON0NXXSljWH5llDFbMU4mZpVSo4vV7BzxD+PGm5pgbF03iqG1I0hwpG7sn
	FTamAmY60wJmwvxY7dJ7+OG87quuf5lZwG599aT1Bc/TIufTOEOoQL3Tf2BD5WrusOK0PGeyYVW
	gzRgMGvWl86dk/YJYmaqqQ3yLij5sa74UjnRt6k+S5Ft+FDXj9DaWXcHRqW631EaXuAD3dhRSc5
	mZTluA/KJhMLHant3pZzSVkA+QabxiGUrg580FcBAqIoirug65+D8vWXnVZWlQNzo29wyIZurQe
	ZYGJq3yLu+13T4WqZRTHhJ1IFHrWXe6gnIHo7dCAToVfbZsCqb6t9wsPYBDrIHAxBzBIAHU7QT8
	KO5757RuIyOL6V2UPb84LskMDpJCWR16T04oA=
X-Received: by 2002:a05:6102:304d:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-63a3d21f6e7mr12724991137.7.1779288723708;
        Wed, 20 May 2026 07:52:03 -0700 (PDT)
X-Received: by 2002:a05:6102:304d:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-63a3d21f6e7mr12724951137.7.1779288723180;
        Wed, 20 May 2026 07:52:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:52:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:32 +0300
Subject: [PATCH v5 25/28] soc: qcom: ubwc: drop macrotile_mode from the
 database
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-25-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5497;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H0u9J4NpHkoALoZnkr4HzilolgHdpafpbEfxO94JORk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpp5Sb3LBHh+2rpBKEPah7kJGpYSpLI6Yojz
 aX2WLcqljSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaQAKCRCLPIo+Aiko
 1b3EB/0ciDXMWMsPPlje7FI4s1MFvATWI/xuJnxAk9fzWaN3Doq0OZdFsE3dw1i25WLHiEqjhFK
 1Y2B6pELjE7EdcTdT/wKz4oLhNAoZZNvfMd3lARKS4HsW7qO4CfNFg3txZxAaXrBrlYJ3hTWA2i
 WDgfHKj5kxEAGVkpXkLyyA8NxnmJANmQy5rzeSYHksymm9CUAMlmtmOz2zaT7Xwa4T6a2ePlE26
 8pwEnkq9XO077+KQpU2nJT2/JS6RxOOEsHImnCVq6ae10YhKBBeVtYxKixPn4kHWIEbPR1GUqKA
 mzc7YyAi0Vov2hwIWqRe5SxMtr+qJLb+PNMOTBihxdZMbDUz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eBoAgvkzcxU8LGJVEW3AZxhk-4qNdjDS
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca94 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lOjMx_-Oxa8n0LcNG1gA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX6YtvLxfVomEq
 XJCNjWsBRXaN8ey8VjoSINYBThMvXI4r9syTUYjHnMugZR67M5KqZ2+wHDIi568q0/VbcvUq//Q
 7Tm4S6lSDh317RstMmqSiE5AXPfqkBZK51Yf5xVbBQ1FTt7JSF2E8UHYShv6R2MkSQyZ+82gk2K
 HPbyv4erNHIS+v+0N8A3755U6eJ7LOfiD7HzZMdtD+WwFXhFFPxwixqa7lqiTR4h3glYdk/zG7q
 0CQcoQGjPP+O4aMEs1dy5HokHbj25XYaMxRTmLr0E4TqkLVDJScMNNt7p5eMAnIBo0SduZi07Wy
 qqcVRUpON68r+P8zMbwCXu2aeowYzHf9gMLnRwa3DUI/JesgMwaM9nEiUVn407tePKbzrx9BIkB
 Ht+lTcuH8hFZatsGXQZAXyjlzm7k+gh5uKz2PsfFRYALHQFZYPi6eN1ZWJFxcqL1kDJY7kVScx0
 patxBATo/aYOxs19+7w==
X-Proofpoint-ORIG-GUID: eBoAgvkzcxU8LGJVEW3AZxhk-4qNdjDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108811-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97CD9590774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All the users have been migrated to using qcom_ubwc_macrotile_mode()
instead of reading the raw value from the config structure. Drop the
field from struct qcom_ubwc_cfg_data and replace it with the calculated
value. Split single UBWC_3_0 into UBWC_3_0 (no macrotile mode) and
UBWC_3_1 (with macrotile mode).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 18 +++---------------
 include/linux/soc/qcom/ubwc.h  | 18 ++++++++----------
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 35cde4e9a238..8dd91d0b3974 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -22,7 +22,6 @@ static const struct qcom_ubwc_cfg_data eliza_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
@@ -30,7 +29,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
@@ -58,15 +56,13 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
@@ -77,19 +73,17 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
-	.ubwc_enc_version = UBWC_3_0,
+	.ubwc_enc_version = UBWC_3_1,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
@@ -97,7 +91,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
@@ -164,7 +157,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
@@ -173,7 +165,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
@@ -182,7 +173,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
@@ -190,7 +180,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
@@ -198,7 +187,6 @@ static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_swizzle = 0,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
-	.macrotile_mode = true,
 };
 
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 254721f5ea3c..fee778360ac2 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,15 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-
-	/**
-	 * @macrotile_mode: Macrotile Mode
-	 *
-	 * Whether to use 4-channel macrotiling mode or the newer
-	 * 8-channel macrotiling mode introduced in UBWC 3.1. 0 is
-	 * 4-channel and 1 is 8-channel.
-	 */
-	bool macrotile_mode;
 };
 
 #define UBWC_1_0 0x10000000
@@ -77,9 +68,16 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
+/*
+ * @qcom_ubwc_macrotile_mode: whether to use 4-channel or 8-channel macrotiling
+ *
+ * The 8-channel macrotiling mode was introduced in UBWC 3.1.
+ *
+ * Returns: false for the 4-channel and true for 8-channel.
+ */
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->macrotile_mode;
+	return cfg->ubwc_enc_version >= UBWC_3_1;
 }
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


