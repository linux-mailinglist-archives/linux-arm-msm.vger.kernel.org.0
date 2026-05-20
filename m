Return-Path: <linux-arm-msm+bounces-108807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNOGDojODWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:08:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F6590851
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C3CE30A88B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0E73F9288;
	Wed, 20 May 2026 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/kLwfly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EX0kpncd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BC03F7AA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288722; cv=none; b=EqnBYaplZ/OfgDCUGlQyiyuh2Rc9jGqQMAvsKuIhVJJiYKLXDUghY8Oo/h22X2sRmu2FdBMdJKf0BE5wG/5AQg9edFEUwNM7ISOAHU6DNP/lZtMz/3vLPupnM4jBtoW+aLM+e3hNSC6/E0PBhuFlJRxZ8HG3jnhvfEaLoAc58Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288722; c=relaxed/simple;
	bh=Nxn0ECja9MOevPIO6hY4R3LL49hKUqZQoSFEB/QFA80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7foScZeax3bMRUhcMXp2uEwRhIYD8lw9QlAQmuQHqrCHK0QkhWQRiKDTFAeo/hyLWP7SReYlOrSFlDGgLLkQRnVyJM3XKizKEHjwLQPRv/HPNMGbQFb5R9lmgh8RRfwmhUdg7R0//00Y+cMFZ5lwFF/lakVRErmEVmdCRhfwts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/kLwfly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EX0kpncd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuVVF3680313
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=; b=b/kLwflydCkC2Ciw
	kFMu/ey2k8Bi8oimviQ7NY/zbR+HX3YKUz+cruiz6XGpmeauU25S4o0DIROda8RN
	CUbSeVFt5XjXJjAWRogUhATQdXZdz7cyjO0tNwQBCs4oXlcGxwz3G1eEMp8M1/b8
	PrLo7iK8xCg1W0WxqyxKRzWuIzr+ZNMUhcbTt/6Z2E8cJbHq3ldimJTwoE4wHDFl
	VdeFLfcuB3/ojPlRPVHcQRsyieWG0aQDb5iiV9Zs1Q5XXHMRlTegcmInTyh8jWMw
	lvdrBGUZz5MgfumJleaZ991y9hAHslKoqvECKl5iGfFtjJmp1Jwevaxh3nefnqaE
	yTvHug==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j07qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:00 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-632ad092bc5so8997988137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288720; x=1779893520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=;
        b=EX0kpncd0CprTz18XFNToi8e5aKBaMSrb++b+8MZZTC+6uz+JOy/Ifg9wZpGmsBGTz
         luPHEQxkjKuZrrYGQw/qLwsxKWz+wL5B0JCt0wBqpUZmkWO5j7LKkBr0tyxwsFhiDLTS
         ddTQrgsgNLoCIcW8UxmORWemxnlYHtpZEibIG7M2FbpZfI0g32rHcGOgcYK93s8NOPjF
         L+XlaKXy/eQH792DZ+N89rUlFFLPDrq8XeGwTKj0zXvgmeBjuavOuVJagB4EAGKMWaIr
         MeGB0etEwSxu7s2RAN9ec1sxLo3jMVwZ9V6ZzTi1cVfr4Hh1cXmQJJVi4Dh/YOAquPQq
         fgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288720; x=1779893520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGml7biXVVWjOOR6Y1Gdb7Ld32RnBgrsNfRj6o0i/eM=;
        b=H71HZWVyrdbRdbxNEdNfH1o/8YJ7lO2P9+nL4D5twDm1MUorR4fo2evof7+keGN4dW
         xWVY9PV1AX6sMfYuzRVciPM4zBS/2QWYJgXV4U2YipPthMUkoNeygORIYbgB4rmUljp8
         3Ep9lidu5mXXa1F0I34n67ZspMjJdlrzsB2H0bBlbWxhjxOG75FPJ/XGrkkU634gALZH
         9TVMNeWFXCYHBmx9IPVZcaoOtJjPeYpzWF/0I90utN8nDVQA85O6KnAyH6mg+E022xea
         HRpNiqG8D8+cSLsVENkt7gvdTwgPiOlaIvElT1KT8kVAMv9kxBEt/eLbkecVO9S1C2am
         vnnA==
X-Gm-Message-State: AOJu0Ywg6TiwqvUdhepr71BvD0sFDTEUmFhk7HwackMaqZ2OeQqq5v6A
	O/ZYjIq1xTidLF0BtPcFK2L97MRgQBg8zI6qzjkd46yNB9yCSqj4snuBC/28G/ho7lf4xq9tNYp
	CUYoijbSXF84VAewFn9evhEHE/eNKgwvNBiRIvUpuldMOoKiXatn08tBsq6FYpdMgRmbl
X-Gm-Gg: Acq92OERnIJnwgyXI2qYkRbCSK/xc3CBVnCRyB1qq5o26t0wrNDpScQ34VFSreJgK5l
	SHK+ycY2Wy5X5XqluJ0cIeX74Gyzv4HqNEc5UIdExw8huoswbXSIa5cG2VNvB2Ig00Wb3BG7fOk
	+mTMlIt8/7NEPShzXFgwSzwkPjz3apuuIS5xFsjKarSiF5P6lgsKs5p5Yt1pbayvDicVN/JdoOn
	fv4mm1RGXkMug01SaS/LHs4TK+N5kk1WCgTeza1pH4NYkRJsg1AjiRy9xpfKbZpEGoS5wCIAtH7
	kskThgq7AxYBVYakkHAU3SwCf52P9EWOfUYei3snWYSNHXMGUWtsJ+1yWk/DVJIhwG6qHimg1kh
	CJCN06VXNu4BjWvJQ+2UtBBTGEyJ2mMuJo6eu30UKfzOVfmtZSad2myyWD+XpWM7cd+8E0sULOR
	8IvaheQCsEk118EpcqAAgJdSjoI1plo93UuhI=
X-Received: by 2002:a05:6102:441c:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-63a3cb14138mr14252026137.2.1779288719516;
        Wed, 20 May 2026 07:51:59 -0700 (PDT)
X-Received: by 2002:a05:6102:441c:b0:631:ff40:22b2 with SMTP id ada2fe7eead31-63a3cb14138mr14252000137.2.1779288719051;
        Wed, 20 May 2026 07:51:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:29 +0300
Subject: [PATCH v5 22/28] soc: qcom: ubwc: set min_acc length to 64 for all
 UBWC 1.0 targets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-22-72f2749bc807@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Nxn0ECja9MOevPIO6hY4R3LL49hKUqZQoSFEB/QFA80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpp5YODtCBqznKGqIh3vbdpzCU+HnKI2fzOG
 sBOSSHiqomJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaQAKCRCLPIo+Aiko
 1XyrB/wPZk4u1D78C0EkXEYvIzbh2sirhfwGmTOoja7BN5lMmcbDZmvSOThKitFA1FvpJIzwfFZ
 hjtVqthVfZ6PKFhTbyOhmpgHRGyq7Sg5qOyZEjy2O+0Rhu2UU8NgXycWS7bpx4pDkKcYsESvdT3
 v+FOmROZRLCrHQFv56m25SjMDLHfCbtKzjhQEfCfJtnMpIIhAvlXsfFv9tJxWySwNfGUu4KFjAZ
 jGgFgLIN8jPfon00rOT1gEr8OJc8FYLVynBUMu0eLnfls7Se2JuS4PrWnU3EEeEKd5c8kshKzA5
 4OKE0Zvs7JGXGcLh2niaxGF6llOjt1xuhCc7HGwW8tSFoU/3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0dca90 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5ZsywSmvcCt_NWGkcqUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: PZylYirFY2yWQs81mNhVM2lSKPIQTV3G
X-Proofpoint-ORIG-GUID: PZylYirFY2yWQs81mNhVM2lSKPIQTV3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX6h5sIY3d5bns
 +Eg7fo0HQlFeFhMAbmFNoK2DYV2Z2ue2u0ijk2mzYxM6Qb1dc+TFa6d3IX4WtrIo49tHa0KuBGt
 HyiixK3S/Fnim6Qmef0nxDKvdKmm5AcqrR9NrNzhq9QI0kjNjqDr/mqCB7HTKC5oD+IJx+WjQt7
 qZeGQWnqCY94IUytEzlVJzaPP3ZolHTfzGhzdOL5iOaBZMRoaQQ4UFKn7VCZ0FcFY+68F0Nfjfg
 O9raWRCRtcT7kVOnxIQ8/7bn6Oj/c8axThl7Gl0yxmPmxCfWIog1jhF5yXF2fIz85L33sVovZkM
 qqtRcoh7KFh0EwDqx1WVHOSaXFQsEaPvAfl42S3yDGK8f/bJ+ZgmvAyhG+45hSKRp/Bo0d/kh7T
 zqlSCtAalB99gn7hCu4q6Y6MsTtDDHNJzZb8t8399lKwbsrWSXB/NyA9FOiUkNH5uxwoDNRIax3
 hJ9M73r/ot/HIEeHh9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108807-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F1F6590851
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the documentation, the MAL should be set for all UBWC 1.0
targets, no matter what is the version of the UBWC decoders are present
on the device. The helper comes from DPU / GPU world, where there was no
separate bit to control MAL before UBWC 2.0. As the helper is now being
used by other drivers too, correct the helper to return the correct MAL
value (Iris doesn't support UBWC 1.0 devices for now, so there is no
changes of the behaviour).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 83d2c2a7116c..0b5aa9d0343b 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -75,14 +75,9 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
-/*
- * This is the best guess, based on the MDSS driver, which worked so far.
- */
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_enc_version == UBWC_1_0 &&
-		(cfg->ubwc_dec_version == UBWC_2_0 ||
-		 cfg->ubwc_dec_version == UBWC_3_0);
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


