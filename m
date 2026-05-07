Return-Path: <linux-arm-msm+bounces-106357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAHSL7eN/GmIRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:03:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0234E8C7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC01C3004905
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5BC3F54B3;
	Thu,  7 May 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUMptlAl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7CJlV3o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF753F23C0
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158999; cv=none; b=k/8RHDiFgqmPBVOu1JrSSGWV8NINlLyMC2suSh1R7KGK4GJFlT89q5SiAc1a+OJzlE+SNwNnxBfthsl0vOJ6/AQ4J2AViktPwDo1JVMzrEJroSd6WLOKcYWWV+GRp5KJUw2KW+uF3Lt2oC6vbMJEp46qsytnR9Fp+kUFFL8tibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158999; c=relaxed/simple;
	bh=Kozu0wunncGvYwCG5EH0ZsQjFu8nlXDiqIvydxEUX6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyf716DrmlqeIHZQCmjLWqIGtPQz+QKQM4DnsNkf+Sn5eXeSkyvxAmW3wIuGn/9eyA3pY8vpqL43SJ4IUmKjjiv2IlECjEc00sDIw5K8DCiAE7v+hdeAFot6kifsQ1Qot+CMwbXaTCa/pOkKGTPG4BF42DmhlH0q5OCaQ0R+L3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUMptlAl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7CJlV3o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477pV1t1424474
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X6KUz3wSpH7ohTMCjp5EmeujJBZNyid0Bpvz882EV38=; b=VUMptlAlo1TVA70F
	61wpVKQ1v996U4LqVu2BBGgtvmovvg0BYn3Z2NxLU8fCqfS6CDyK1kCDilzXTkCT
	in7QpARgnigAnGjcMfEMkxqplib5EPXRzOCRXpqx3Lkkw2LeCIRv06vKsKvVAvTu
	TWQwaWd/A1B1i3NljhonbJia70FJGEMlVTYzcrZBXq6lITkoEZZR8WSozUo4DECd
	I/SqRugFuZqwbGalVaisugiVT2PP45ERn98ZMTH1dgBDIvt5LtqW0YnPJGzpTMLh
	bojmZiF8jYk++nZwFV6/1t3HONfvoUH8oD2HxoIcfuO/3qxNooG4Zv2raG67sjlg
	o1bccg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfs42r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso9446525ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778158993; x=1778763793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6KUz3wSpH7ohTMCjp5EmeujJBZNyid0Bpvz882EV38=;
        b=C7CJlV3oZyuYc3CHvrhcHi5axCcT1vIX3y72KRVM5i8J9ygGBopfmiS1RZ520keF2e
         unO2UN3apro9laKYJnFDwTHk0bBegfsbI5OM9yYIeDw5ln2lwoGwW5tYrbtBGHrpKttj
         8HU0BbXNRvtDkLTz/Xs0fouGqfjERTVHxOaitQk/kP6wNJ+UvejswtrJByOziV/I940g
         6Rczp+PeWRU/KNHe+7kA2d8yCYehIbeyq0CM9eccMVweo02wnTwrNw3RmDuOxYrohk1g
         22ZMdXeP6fBWd8KC/ODEYgW+7aKGYBmCBKBJeqwN87yd5BvTJnk1mgRzNNZgXeDxCqFB
         FJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158993; x=1778763793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6KUz3wSpH7ohTMCjp5EmeujJBZNyid0Bpvz882EV38=;
        b=X8El+F2RxXOh/bLwpugAqd+LqMq9XhqX40Vrdz0BzJzpuUZcBfzfjZLslQ5vOhMi57
         i1FXransQTNEzxSlxm9ep59gBnOffXqbVIiNCop449a1gVcBkmwGA0mYcSG9jok3L98y
         gQ5WnDjylCXwj4MdMmrOu0OX0WAq4h8/FcYIQvUBoOkLid6zNxRg8k9VSFn8pFARuzLm
         zyNQQYEIUnVyyVMs314oAYpl5xiJbfrTcO2bHZ6Gm4dUML547fhcE8lqcaANFDBy3Oks
         Sdx2iV8Njh0AnDtYqdHPIEMxMgAq727kMPzy1FFJ9WretoE6Iea5nqRTSdrhRh2DGOFC
         rQYQ==
X-Gm-Message-State: AOJu0YzMhMzLRBss61Mhr1IjZzJvvREaTrzJseEdyNtUimInOlOaEGs3
	wzzNO6l8KmvpEpn+U4HCQDz0+K/OCGrGQZ4K093LrGvvuOFTCFfJCB438/DAJ4C8dGG2O31hXvH
	2JcvoPI64fqwGIHVNeZokKMKZnks2I3NGJGsN06Xh9RZ60oK0YnQp3aopPnKMwlN6VGyi
X-Gm-Gg: AeBDietJ8Eyky0aAAKJjy67tNPjWYFielibTB5K5TdEMBqmFBPXT+5qqFlFRVKvxzdG
	pWFm5oSEFp9cYO0NBu+VmOVFgSOHbmHCRAPK5W7BL2xYth0T42Y8TqgbGet/WBMrqWTbNZFjMgo
	srO5S/0F79ymBzvBpD0L/X8yjZZmepuLA0mdIpFJyogqXl5me0P9ugRVlEj4O2EVI9M6QFfLuIV
	ShM6cLFC5zyLNBGqdxlX8DubStUaANclTOUZdBISHhPgeUYh+2uUk0z22+H+/JmD6TAqtm/XNHi
	wCH0FXLOaw7/u9gwRqlmux23CHvp3c4UTM0DisHMEcfHXJgxA/kPbl0LpLQdm9/8uMHo01HWnBj
	V8f1YKDWWDFf/Hg0uDNNoPJ75kBXlPYvRgV9I3G02kMRO+ZSwj0/m9Wwyd4/gCXZU0xWPXCTZ9K
	jCAu2wuGcyhuo5+C95lrwkYY9FPyEV9cCGqH1qR10NYosoRA==
X-Received: by 2002:a17:902:8c82:b0:2b7:8a56:7cda with SMTP id d9443c01a7336-2ba79285cc2mr58205305ad.4.1778158991382;
        Thu, 07 May 2026 06:03:11 -0700 (PDT)
X-Received: by 2002:a17:902:8c82:b0:2b7:8a56:7cda with SMTP id d9443c01a7336-2ba79285cc2mr58203655ad.4.1778158989667;
        Thu, 07 May 2026 06:03:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:02:57 +0300
Subject: [PATCH v4 01/29] drm/msm/mdss: correct UBWC programming sequences
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-1-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6675;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kozu0wunncGvYwCG5EH0ZsQjFu8nlXDiqIvydxEUX6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2E/+1U6HEdnE740NkmOXVyfKbayNLqAo9yZ
 Dtd+73Xiu6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhAAKCRCLPIo+Aiko
 1aSfB/4gonTvop5lJAUXSXXvIwDUphUXziJNTZU3Aa3tL2ndJdNPg5yB86gIYa3ZH7nfKERX0Gq
 PYhZ+jF6MQhuZTSvCeSc6C64q+XyI6xxqBnsOSaiINkjZ3d/zcqNhzOJjvhsi2I8p95Rwjk0YH2
 WgR6HxMikNQyGdZpkb2q0aWBqVJBhIAe8TXpV857f8HbqwIVx+Irovjx8BjcUA2vVYQzPPUQ+9C
 BwYwvfaJz2d/PALHzUfNAS3tPa/du6C/5kyJL7FWUQRez4J3llME/b3q6uztt/rx69oKN3VJgOD
 FjIddyeP7h0a88l6C9H40Lnoz174Kr5cI8vIo4vUYeTAzf0n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc8d92 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hQCg4X1xv2bm5S_WMKMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX4aAlfHZk/TLH
 hgYiXBehHWL1o1ahlBBI3NExelEA//+vZvHj0mmarbajPgeNq+byQBI6fo6d15Fe6nZSXp273uK
 8pw4qAu+dX2Pdz57ZUO382XFtxgvWrVWPAlQ7eoojRg2kDxe0EfIeuc6VJs+uyqjRVe0iCJGuqF
 aUD6U1qoyuOUHqgExYyF6ga266/FOjnC+jnIy0hh16FfdCaWRZtZnzkrM2dd4zTL5RIfLH5pRri
 jz9gT988cTG4pURJUFOp3gxZ9ADZpI1xuvPZ7yxcB/pbHX6IBHMa+9TmjXprn9b07c5/mA6iGor
 Jwrl/bQBhdXPb+r7ekjTgHLTXaCNsrwZDZXj2V4Aa8Iael8kkXpi/IwKxLZkHNrsVqYsQHrqiG5
 +CBXOzUHezMygKliivR3xg3avfz1rYWS6b79J17giEy6xNFlQVkGZXTW1MvaJavUT6RXJ5zRQr2
 NAE2q7h5P4IwYGFioGw==
X-Proofpoint-GUID: ChHFuPXDNQK_LyrTooFo37sVc4-4h3EU
X-Proofpoint-ORIG-GUID: ChHFuPXDNQK_LyrTooFo37sVc4-4h3EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 5A0234E8C7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106357-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The UBWC registers in the MDSS region are not dependent on the UBWC
version (it is an invalid assumption we inherited from the vendor SDE
driver). Instead they are dependent only on the MDSS core revision.

Rework UBWC programming to follow MDSS revision and to use required (aka
encoder) UBWC version instead of the ubwc_dec_version.

Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 115 +++++++++++++++--------------------------
 1 file changed, 41 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 90c3fa0681a0..4a6acd468bc8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,22 +166,19 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
+static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
 	if (data->ubwc_enc_version == UBWC_1_0)
 		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
+static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
@@ -199,11 +196,12 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
+static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
+	u32 ver, prediction_mode;
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
@@ -211,45 +209,42 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	if (data->macrotile_mode)
 		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
 
-	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
-
-	if (data->ubwc_enc_version == UBWC_3_0) {
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(0, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	} else {
-		if (data->ubwc_dec_version == UBWC_4_3)
-			writel_relaxed(3, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		else
-			writel_relaxed(2, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
-	}
-}
-
-static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
-{
-	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
-
-	if (data->ubwc_bank_spread)
-		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
-
-	if (data->macrotile_mode)
-		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	if (data->ubwc_dec_version == UBWC_6_0)
-		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_enc_version < UBWC_4_0)
+		prediction_mode = 0;
 	else
-		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
-
-	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+		prediction_mode = 1;
+
+	if (data->ubwc_enc_version >= UBWC_6_0)
+		ver = 5;
+	else if (data->ubwc_enc_version >= UBWC_5_0)
+		ver = 4;
+	else if (data->ubwc_enc_version >= UBWC_4_3)
+		ver = 3;
+	else if (data->ubwc_enc_version >= UBWC_4_0)
+		ver = 2;
+	else if (data->ubwc_enc_version >= UBWC_3_0)
+		ver = 1;
+	else /* UBWC 1.0 and 2.0 */
+		ver = 0;
+
+	writel_relaxed(ver, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(prediction_mode, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+#define MDSS_HW_VER(major, minor, step)	\
+	((((major) & 0xf) << 28) |	\
+	 (((minor) & 0xfff) << 16) |	\
+	 ((step) & 0xffff))
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
+	u32 hw_rev;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -283,43 +278,15 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
-	/*
-	 * ubwc config is part of the "mdss" region which is not accessible
-	 * from the rest of the driver. hardcode known configurations here
-	 *
-	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
-	 * UBWC_n and the rest of params comes from hw data.
-	 */
-	switch (msm_mdss->mdss_data->ubwc_dec_version) {
-	case 0: /* no UBWC */
-	case UBWC_1_0:
-		/* do nothing */
-		break;
-	case UBWC_2_0:
-		msm_mdss_setup_ubwc_dec_20(msm_mdss);
-		break;
-	case UBWC_3_0:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss);
-		break;
-	case UBWC_4_0:
-	case UBWC_4_3:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss);
-		break;
-	case UBWC_5_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	case UBWC_6_0:
-		msm_mdss_setup_ubwc_dec_50(msm_mdss);
-		break;
-	default:
-		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
-			msm_mdss->mdss_data->ubwc_dec_version);
-		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION));
-		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-			readl_relaxed(msm_mdss->mmio + REG_MDSS_UBWC_DEC_HW_VERSION));
-		break;
-	}
+	hw_rev = readl_relaxed(msm_mdss->mmio + REG_MDSS_HW_VERSION);
+
+	if (hw_rev >= MDSS_HW_VER(6, 0, 0))
+		msm_mdss_6x_setup_ubwc(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(5, 0, 0))
+		msm_mdss_5x_setup_ubwc(msm_mdss);
+	else if (hw_rev >= MDSS_HW_VER(4, 0, 0))
+		msm_mdss_4x_setup_ubwc(msm_mdss);
+	/* else UBWC 1.0 or none, no params to program */
 
 	return ret;
 }

-- 
2.47.3


