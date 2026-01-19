Return-Path: <linux-arm-msm+bounces-89577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F5D3A124
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FB953065DF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0168433C18B;
	Mon, 19 Jan 2026 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYOUEt0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5e++9j6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C40F33BBC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810489; cv=none; b=sLkG0MKfmW41quwWuSnBY9YY70JMRupJxCdDZiLztRBJwsLPsOE3xOdy8VZk6UiBZBvtPOvugSG3ehoxZ8+dUWCeXPs/QZesWOK0mKTDBZ1bXAYJn1NOMYz5MdVslp7di3xl4YNYO8LdvsdmmJrZUa3tqLWcZxvHMMDEbYAhlu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810489; c=relaxed/simple;
	bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E5zPQcj2U1U/Dski1K2ED1WO3JH+MnscPST6G7Zd90klMwnZKQq8a1lWu65G4uM6YvLOHmZKyiN8ewRLgdJWt6C7vcP3jtjeUd1ctS9TvPdAUs+XzfY0xJo3EU+cmY5J9ALupoXE9UVgiCS/5KvuGPtUh4wnvyqaYzvp1w5QkY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYOUEt0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5e++9j6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J81WKY052108
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=; b=jYOUEt0BYWuVrhzB
	fHkc6UXZhpeuA8O4ZWwd+20yM34hs5Fkdm4bMxJ2yEYjxSBz3YnlXAne8dUIvXqw
	yfwT5NW79P0QJMmUv4NMzYJdVEvJSVZauBX3QhP3a0fkKO95Gla6t7v1D3rijGrq
	UkULtt66gjyfu2Yt1/3uG2RyVPoe0/adIDZ1RDQHQL9YFmkDlonEwxqzt6iaB8ZA
	NM7JZvid1SCVP/BIazkURbpdNAai35ofENsedKhOSP97U2CQy/djp2N6x7vQ/ZSH
	VbS+ZiZTmck25sjJW+U2/8mclwZ556KuEZmJfJKRsGgHkK0cNLP6e3Hr885b1t2D
	vxwXKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqcf13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6ad709d8fso482541985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810485; x=1769415285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
        b=h5e++9j6dqlfTwCTsGGdZGAEjKq6YpHeoGS56X0/y7ca0uEcONFvWB7iBKaRHGmfKh
         IPo8zyeB4ACrHPQHl+cYyJ340KBCWBV/EAMRMi/Ibu5uD5NRlD4rSa7rkYDzu3gcicXI
         CXjv1AoR3yVpFeoRZTInI9CE6101mSU3s8zsITw0rcOw7gH8sXdKbULviENwA9sTjAA1
         hjlEPQW8s4cCiXh3mFwvD7gs/PIPhLzo3/f5jIvA+ZyMHKZDcE6cfYHKoZOf9xvlgLzI
         XpG2pgIHnxV6S97jdeL/LhaFplkNV+vxonBZsUteHkmExDnf2jMLolYdK619BOggbwc1
         UqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810485; x=1769415285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NThq6KSUJeukEL9pMouMMZw++r4/wpGPMWQ27LsLSs=;
        b=Iz6pr8Tyg3ZlNZ0XokB86fGwD6/sIqVx7xj+HVnZLcno8JiqyN60hR1FvPzmiBMf7w
         742HX0Q2zR/tL9BQ24iJe1KSgR3kfIKsjJdYWafcaP9wUzQ79/I+PXm3CK+I2kMgg/so
         l3g8fapw4RYzJCsWM4rutgi8zGnSDNOsZyfl9HDqpX9i71HyCV0MyZg2SnJS48L+n977
         UfuptpGpzZ4ju6VFklpzG83Y7ruSKTlbtz/W0JELgvGlNt7EEjr+BpI9D1GTFZ2bJM6x
         Fkfj8g4Ip1kjx1kLA6lDB71ukEgT//Jxkfe4ZjZIDnwVuyYjLcu8b9AWjn1/pn2KcSDe
         GbAA==
X-Gm-Message-State: AOJu0YwpAaPqQeH0ZBCI2QKdIEDzqQlgj3JRsKHtbmgka4koFvAGe4fE
	lr7OyhLK6IdZD3zvruBj6YhgcjKQXL0GUu4T+XH2ZzCZpNbklNovEtpXvcmHxoF8u0W2je/kdLh
	EAk+Sv+fO9y0gjoXKtrfc0xmNjJ9gR3ZJCwbQ6AAoOM9a6nNEGMPwaHd6Mq32A8lK5hL2f5iY34
	Qa
X-Gm-Gg: AY/fxX46mR14/Zg+OX8qx5ULqBGRW9dMOKdpVacdwPfvckXc+foSmgB1tOnTSU1c84p
	HVBb9lj+rDpw/JEQLwo9z9ZUBTIKrVAVgs6bzSNAm/zqOUfBOTYGfpiD4gLZR8rsm2qnzBRdniW
	Od9m3+O72+Ej5RUvmnsX6aSEXIvytqhf3suNmAlwbx9eQtHRNWRU22uA7UFILYtaAnqVBLBIIvg
	v4rmbt+v3fMfK+q6ZzhTnjGZxIz9y/wGNnj4jbBC8TMD0UOEVdMWCVuZUMFF6XfM1rtyWDX3ED3
	mtvyKIDaZw2N+tRW6OEtkmYCOJSDNLGivnEm0LuOj0925Weex++dXPa23JAMTzz48rwdPwgAUN8
	lQYsHMqvpuOR/IsSIZaEvuEQ7WQMhVI2CeRmE5iUOiZBhUmJefnMFjqRRp9Bq4EK4qKgQJkjtLX
	3HwYXKyC+yQah/wiImM36AaBo=
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id af79cd13be357-8c6a58737e7mr1730834185a.36.1768810485416;
        Mon, 19 Jan 2026 00:14:45 -0800 (PST)
X-Received: by 2002:a05:620a:450b:b0:8c6:a587:377f with SMTP id af79cd13be357-8c6a58737e7mr1730831685a.36.1768810484957;
        Mon, 19 Jan 2026 00:14:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:14:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:14:39 +0200
Subject: [PATCH v2 3/4] drm/msm/dpu: program correct register for UBWC
 config on DPU 8.x+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v2-3-e0c8c630fdd3@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2979;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nlqM4pS5tehTmTBqQ+prrjj8JpfEcAuwIhsTGK973JQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefvWPciqvjeXggjI9TRGgYthCdanfv4U7egB
 9Iij4swhm+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7wAKCRCLPIo+Aiko
 1VJ1B/9YNyZABfqXcN2Uyf9qCt6ZDrbYTxPKKdlQWj1xVwUsjAVwyWSRdpOT+5ryjmRjqlf/kKt
 AG4lFvLBZALJSOitDQIAFXj3TjTKi26Mebk4IkVjAiYUYTxhwWwR0qWp/RxVgyP9V1A2luxImxr
 FUb1yNcGq22/w6TcmEFHp7bamENlqzo9jI7kzrPBoisVdY3a0bb6lL1bAT5MigvnAFck3ebnOpk
 SrG+az6YJ4ea9ovVfwpkWtT6Hdlnhqn9RTC9ahEuDEd65xTb6EY1ISBtle674JDXzQX8p93PCTB
 CTcqBHmL0nrmvIPtAwWDji43ZMCzExr1u1uzpwVbuKihq+dr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3Jd7do-MMM8HCwBBSC0VbNppVbVq6Pls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfXxjB4+2Pbf1LO
 uvrujbEaW+YMN1TmyaxRJocPrf9Bs8OaspR6weSaikGcg3EtUafIcil/TTAUO9bkMqSRnz38C5d
 hLZ+k9Z8gnuM5i9o6yuuo5ValMI8eC+iUs4GAC1iUZOzVPBCZwGX+mFutKcHac0rC/9hQObmD8S
 l48IAMR9pcMSE73j/QpN8d9zuNyTzoL97k83T2RnXUJTbPFo8FR10nhHjeGDjRo/Ca5YXSMsq3P
 9BPQJcoSyIvGWL2RKzrBi+iXUY9STgcjrekIRiMlEFxZidbTfAqFdT/OPkNz4Ose/9rmoeRns4s
 tc9lYeWSvoQpbwE7RVKB/7ldB0x+JDPC35h2sD4KQr6OjkMa8biLNraF2kB8RwLMc52lL+PjSG2
 fqP+22sa6PTx4epUfWW4D1n9lfjT0DNK0W/+W7h9EAw4WVlVrUTgefm79tdoen4YeC+xCTQtYFE
 3DVHjrmUJkzeM8P46Pw==
X-Proofpoint-ORIG-GUID: 3Jd7do-MMM8HCwBBSC0VbNppVbVq6Pls
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696de7f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7tap2HhiP8zdS8EL3YEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190066

Since DPU 8.0 there is a separate register for the second rectangle,
which needs to be programmed with the UBWC config if multirect is being
used. Write pipe's UBWC configuration to the correct register.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b66c4cb5760c..a99e33230514 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -72,6 +72,7 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_UBWC_STATIC_CTRL_REC1         0x1c0
 #define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
@@ -215,7 +216,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	u32 chroma_samp, unpack, src_format;
 	u32 opmode = 0;
 	u32 fast_clear = 0;
-	u32 op_mode_off, unpack_pat_off, format_off;
+	u32 op_mode_off, unpack_pat_off, format_off, ubwc_static_ctrl_off;
 
 	if (!ctx || !fmt)
 		return;
@@ -225,10 +226,17 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		op_mode_off = SSPP_SRC_OP_MODE;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN;
 		format_off = SSPP_SRC_FORMAT;
+		ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	} else {
 		op_mode_off = SSPP_SRC_OP_MODE_REC1;
 		unpack_pat_off = SSPP_SRC_UNPACK_PATTERN_REC1;
 		format_off = SSPP_SRC_FORMAT_REC1;
+
+		/* reg wasn't present before DPU 8.0 */
+		if (ctx->mdss_ver->core_major_ver >= 8)
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL_REC1;
+		else
+			ubwc_static_ctrl_off = SSPP_UBWC_STATIC_CTRL;
 	}
 
 	c = &ctx->hw;
@@ -281,24 +289,24 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(hbb << 4));
 			break;
 		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_3_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(hbb << 4));
 			break;
 		case UBWC_4_0:
-			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
+			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
 					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
 		}

-- 
2.47.3


