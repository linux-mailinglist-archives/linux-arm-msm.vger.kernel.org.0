Return-Path: <linux-arm-msm+bounces-95899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKCtAVMHq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:56:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEEE2258C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9CB730CDE87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E8847CC75;
	Fri,  6 Mar 2026 16:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LiZ2bxYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFvfTS6s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EC644CAC9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815676; cv=none; b=mrneFBgQ1RGF5JiopzrkxmRV24HuB2Kz6UqPKWn2/tRHalLpMwPIFh9wrtwNNr32cEPCbj2xmgYt/Jik4/4rvJDTl6suAejebpldDaIRVquECA3DZMr35F8+9Z/QOe6vXKkLV5Oksjwb0H93s8H+pe7eTlb4va8gM0HHA66YWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815676; c=relaxed/simple;
	bh=8WidFnFU6pX9ecJLzeiZrTJ8KzhlV2H6Mjpf2nc28Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2Luh2m3nDS89M1UGHhos5HOMMxCm2F5zwqEscL0FVf/063p4vKNv3YbHiEmPAbNkbMOr/DPKUcFUdC6VatRUTSbJb0j4Atj6xO/MmesB6xhZONyC7QKffPYwNmgKbvDIAZ5wbqfXq8bdpeae9veHSW4UF0UyEM3gzVfZtG8Qf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LiZ2bxYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFvfTS6s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FrEXt3960039
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZb8eZw+Q83o+RlHHgWXaiw17CCH07r6st3FY/t2sq8=; b=LiZ2bxYLzVssMrjQ
	dwtQ6ZtcQ4t6ddMaCjo4d7gdEsCbn9iR82OtxuasTZtEIhnfQY6/RIGT/N2yEFNp
	6qj2VIFaMWgAEnYoJfW9rxw3lerXUmkrEziC0DTWV28eBoOEz4U4lhYiXHKj3ArS
	csoLIY5O3spFkHqNw9RwO/8rtViW7PAU9CAjVps/YGg0t6zMTx49zH1RCCgfbBfD
	KyiFo2rHTC9KwlwMjWE1JRCaZHn02tYfSOM7OiPGlhq/Si5lW5FJ4Nj2gluxSNuq
	Z9RBMxl/QfP3gtdafRSldV+SAuWtsGVhi4AiA0Ejo3IX1HH8b/3p5kG6vyv9Okla
	BFIFDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9cc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3d11b913so5171721485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815671; x=1773420471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZb8eZw+Q83o+RlHHgWXaiw17CCH07r6st3FY/t2sq8=;
        b=QFvfTS6sQ+P/PuYnoSsOfSerdygWsbTrH0hJHHE2ehGeTj+4n3LsJ+5rbN9XJK29/g
         zl0ZhKpITvkvD1gVH7EIDKzlgpzCTMWhgJSXLCqEjU9YXyts5ReZWxkTvnyUHJzLQ//o
         0aJ5KWzFcFyO2lZTfeKi4/j9c/21c+RE8awxaL4k4LUzuvJMJIEDTMEb4jLPSiAExMjS
         7NVgZcqAtizRNzbl4a6hgXfR5+AbfGLj+xrcaQmz5mcIhIV0kVZzdfwVubf3tK0zOZ/4
         TxQWvfrBE8oz1pGuAEI/fnwjZKHkyBsXZ9PthNEq232TyogDYJtsO7hR15ncs83jJ+hF
         vYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815671; x=1773420471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZb8eZw+Q83o+RlHHgWXaiw17CCH07r6st3FY/t2sq8=;
        b=hkFmDzUinT0A8DkFbeBFrigpQx2GhMrc/m1BQ4uimuHeRQziYadhedBsQD3q0bpkP5
         9ZPcNbK2bXhxMQalD85B6q3qcfbFKjg3GORTMxpAHm7QMdmzmRT65DIqXuSZth1394pZ
         OOh2gempyST5YRGroxAPTbrvrbls9Z1j4N1j2vpjCtIln1jIKAiQVZMUcZ6IVcczGe04
         6NDtdmtQprW2i2mixoLZ/eTpPGWMJtK8LM7gJuLb5PMobLPtZbOddV2JVvmAv26qIoP6
         Xxd4sQQiNR3C/uuu8ROMbOuIC9iNoiQnqADcs+kO22ikQ6MHodgRRD/dKhaYPzchdqXC
         75PA==
X-Gm-Message-State: AOJu0Yxfc5mJkOvfvEI37et5a6KGWUaMq53qDiNI9krWF08XSrahOtQt
	EvH2Wd4WvNbh8acZMNjEZdn4D9wJM8SdHdDyLAW9L/bNe1zx+vutmaHnAHnPnJnLGYx420/GFpT
	dVcnNw3zK1mm8bXQGsewxPuaP5sx6W5VQdpzMsez9EMG2T11uHGqa5qrQxbShfquFZ427
X-Gm-Gg: ATEYQzxZMzrjGGs+LWO4LW0Zk8azdQ1okcGFutRLEbVXMA4+29WR1qMN5sBSpJuUY51
	kg8Y+dN3oTEwg+tl+ONQDxG6M+4IeUa2SeLZS3jd6I/I4Xa16jF8vS6VmtOg0+k1fbDqRY+Qnko
	Vi7eTZoC3buNK/3vuieEEDUZxD59JDIOQA+fLiQraOydW9g6UoHSGm12+LgY7BaZGVBJAwpzLtK
	Q2l5Axv2y4kt5YUkXU0Q6IwgEYxoTIj1M3TCHC11+bgRLmw2sBmWZF/bAwfsPPIMdPD3ZDUbJji
	LgMKRzUFW1gxkSwTmweAVQarWlPZwfin+QHDn6o6qW3sop08YCODyfAn1JT3EPIigTghH0M06X+
	YHH0NIifPr4+xwWOW4ZR+hlqy0dUpL6sgxY0qlFmuCgR6eHljLlP89rnypk+1RVDYVz2pZWvvhJ
	0mo3QnznFFeb1udF7DE/uUbsUPdSkKoPtAfaU=
X-Received: by 2002:a05:620a:450e:b0:8c7:19f4:b585 with SMTP id af79cd13be357-8cd6d437e12mr357961785a.43.1772815671542;
        Fri, 06 Mar 2026 08:47:51 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:8c7:19f4:b585 with SMTP id af79cd13be357-8cd6d437e12mr357957685a.43.1772815671045;
        Fri, 06 Mar 2026 08:47:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:29 +0200
Subject: [PATCH 23/24] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-23-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4110;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8WidFnFU6pX9ecJLzeiZrTJ8KzhlV2H6Mjpf2nc28Pk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUQAZ+0aWPY3IVYykrhRri6p7g+LTvnjvKP6
 ufdhY52g+yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFEAAKCRCLPIo+Aiko
 1WrJB/0eS0DHsvjpFfzh4DNP0t5Gk/kPiCgl8jnqQExo+9O/doJAZffcqd/dT4qe22aibnWMn6E
 VTgdGYhjRrKycFpmz/JpnDz+5YABXYX6ABlXi55nugrW1JVtxQUmhRSDsRn3aCEtf2zafBZlBq7
 OuDu67brybndsSHN4tV/NERdu/ww2CF8HaQmPBM+6Kv741dx8X0pMWWcI3ImuhE4uzGwai3iMuH
 +9aWnuJUYxjrHaHKO7fT4UFV/HFFVx1gD9EyMTr9/khOokC8QlQZXRbiSQPbLDxVrtLqqbRYQho
 vD2z9Fi+LabuDcuYVkaLHIm3RpLEmgyqoPGuQa6BjuTNAVs6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfXxQ+LSReLj4Xo
 DdWdH+SoSCr9gRNyhU0PkI007v7nLnEWVGxnVR/S2iYzw5gfJcuVMGTlyoqCSISx0KBzujskVRb
 TyJSnxU74EqBRHC0Fed1QqEvYSGtBZEOAOum68Y9V2wghpZDlGK7LTFEG0i6iXHET6LLG1znAE9
 CZfXF6Fx7wbZTe8CFHK8B9t4a06tLFExYGYngGYHUTgBbObRb82Off/gahlYbWAP9fSxEPMCGn0
 mBczPwLRl8Zf+Jn0p+iFRkr8V2dM7GtyW5EC/8FSuKpzGZZ1eWapTCL6zsMBiTlD1N/XE4a3VlG
 5ZrzqSWgf9tp1S3DL071BiokGE/rwuuKDbfV0Dfi+wVTWPTksUrsA1mKk+QuhGKQCcYAjBSsLQL
 ZzKfA4fJPWhZqtDnuMAZ9PxAmSu3NpuCnYpwUXLemi3bbpMp4tEPq5NG0vfByxexRaUC2iyaNg2
 tAB1OgVYNNaAVvtv+Vw==
X-Proofpoint-ORIG-GUID: z-30N_BbL8V_vlTvsSp_m82HYHYIiP7k
X-Proofpoint-GUID: z-30N_BbL8V_vlTvsSp_m82HYHYIiP7k
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab0538 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SdgSTUjA-qPM3NZmnp0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 8EEEE2258C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.937];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Sort out the remaining UBWC swizzle values, using flags to control
whether level 2 and level 3 swizzling are enabled or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 14 +++-----------
 include/linux/soc/qcom/ubwc.h  | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 49edfabb5e18..ccee20913115 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,8 +18,6 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
@@ -40,7 +38,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
 	.highest_bank_bit = 13,
 };
 
@@ -111,38 +109,32 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2 |
+		 UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0cbd20078ada..953094b73459 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -14,15 +14,6 @@
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
 
-	/**
-	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
-	 *
-	 * UBWC 1.0 always enables all three levels.
-	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
-	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
-	 */
-	u32 ubwc_swizzle;
-
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
 	 *
@@ -30,6 +21,10 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
+
+	unsigned int flags;
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL2	BIT(0)
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL3	BIT(1)
 };
 
 #define UBWC_1_0 0x10000000
@@ -101,11 +96,16 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 		       UBWC_SWIZZLE_ENABLE_LVL2 |
 		       UBWC_SWIZZLE_ENABLE_LVL3;
 
-	if (cfg->ubwc_enc_version < UBWC_4_0)
-		return UBWC_SWIZZLE_ENABLE_LVL2 |
-		       UBWC_SWIZZLE_ENABLE_LVL3;
+	u32 ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			   UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL2)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL2;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL3)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL3;
 
-	return cfg->ubwc_swizzle;
+	return ubwc_swizzle;
 }
 
 static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


