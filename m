Return-Path: <linux-arm-msm+bounces-89580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09495D3A12D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 386893001BEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAE933CEA3;
	Mon, 19 Jan 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkInDYfe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBGd9+z7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7333CEA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810643; cv=none; b=lgoNGlJrnS/XUDIxvVcwArl33iqcBjL1SIMLgYVaWTRGvTbfh18yScrPalzYnqZAK7vzAq/Vr78biW1b7v2VLQ0jKAgxpUq4dDUtuBjC5d5WGO0+CS/qT9wVY4jLCvee+9OESljaBHBQH9cnJzTep8tMdRRPlAlWqFuKOdHfUOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810643; c=relaxed/simple;
	bh=rvlLamNB1d8AxWI8yQdhDfj/WRXPqvKE6wjpg+ZGkfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7zBVa0YcuqsTHfu/jj/jKt8hmf+QvCPefPK65kXely4aPr+DIbhKNQo93i3GvDzB0veaaiP13kvP4gbEi05i+dZ71MzWOo/H8vrCeU/EESwnVLuRn+c29wYiqNFUCLR1CNf3jyYO0RDxi4tJIWNk/LOuddBgSGWVYxI/0TVv8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkInDYfe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBGd9+z7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J7sV321742574
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=; b=UkInDYfeu5xWblOq
	DAVT1XskVc27rpyqoqeSm7p50dCup0/1+iOBuoJxFJWu3V3I0kMagqUm/Jn6aYRr
	EktTEbiVW53DV70B1kx2Auxlr8GFnL0mcWb1ugpy6a7nBHZijAT24gowk1CxwNgE
	2T58ALEVucJ3HZ5QgnNWAo28Hos0n4+yMBrBf6wZLiG/bB4mcavaeLVVhOakuH3G
	DTnazyxp2CO2tFhEvZX4C2KNGghUL/RxasNhWBLZ4Mq0ecMD2XSr0Ln8iwXnMFGk
	A8E6sQ1gbVOnfOO/wxdc2xY+2g2tHzqSLXgSzqZRztwWNM4vhbWLS758k26HMWfk
	R0GQyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu83x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:17:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b4058909so385605485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810640; x=1769415440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=;
        b=DBGd9+z7OCf9kVQK5qLmB3Jw1zGzSpCxvpq+rAm9G2kVlMfCdFYJom6Ib3p8GZ84zX
         Ftflc/FcuPbubR86ai9GmVWITZSfZ5muK5oOFRzAyRzKwJeV4mCmxbRycoifUTo3wqDg
         meH2ZPMoip4YxhzF95HvpP5Jew1+sdV/18d3OgyhM6zkSQWh6HL1LeCMJK/hZ4sj050L
         JpfV2uHP/2zbErvjt90YONuBvANAXMcbAFS6zTdQVU2NAQyqIfSzlwRFfQ5j95VFTEuW
         MWjO2jcEq7wdW0fSDUnv/fjLmeKp+T2j9eWsWVrwD1Kb1UKmKWT90WwIMS2ezZL66qPk
         5Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810640; x=1769415440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=76Smpb7OAuPrJPWLjQuPjMFitzxPMEeAECFWrSbRqDA=;
        b=Hv5c8imqqKCDKiDm0i79YWxG1m+cMjJZpT54B992V1iRJ3N/YaG/kJjpQX1I6UvaBF
         Ss449//ynqgyZm1zOPx584ORxMD6SiTfScpV1jAvVN7iCCg7PSWwBpMPyCIxTfaZ0/U/
         7S4yCJeNI29mRpU9ya55q0hZzARnG6eiIvXCuXiAvwB7VBo3JQCZpO9QyqHFHtn0cAuJ
         flFjacbF1V9ZY8kZZYfWeSZaG2YEFvP+93n3PwqxR+6RNoBGSn1P8QsISwxX/rLLgi5t
         OsF2QuuVrUwhg6hnf69OzYfvT3bSNI6ucyihP1mpik7xBjXNfl12iEKpFd06LZIp/uFj
         lLlg==
X-Gm-Message-State: AOJu0YzeP4vQ1FX7ZiCcoNfW4OMoGzpSqnIbMUQ2HS+Gzi9oF49vsT9y
	Z2yLbE9wURvnpPoWrZdzxp2s4o6uQnUlpGTU31rvq9rSMUGWmrCgbICr9/cfqAebntbeDp8rgXD
	8lmTLgrnU0N62OKthjkB/hZqyv+/SBreCWD1nugLSUGZLXKnJTsriwVL+h5opt5Ib20Ad
X-Gm-Gg: AY/fxX7QFNal1t9OUSl3FGYl5QXlBmJrHEUZazuSUtXhsHnRhz2WgPIobLtenaCYB2n
	QXPQBdNXvxiB2Tsj6ltLhCpyf5ZG9piH1NidBA9nsnTGV0/h4YlCYHlB5l3wuWl19VUd47El+ge
	eb+ROPF0koNg1ChLpTYY9tgXJ/pU2h9t7QFYcCH0HEPZufDTuWQszc84HsyrNFXA1BgN3yWYKOb
	W6YzeYj7J8GdlbxdzG/APVlnrtpql2Iu7NJoVLUH0SYA6/eC4/4jxONkn2CLvPPiL6XGYcYp+SL
	ngPFl/8cpBfcO9kn8CFfDyF9pHBfESgiUwve8j4NHAHh+sawWz58+3SVcF0wk256/UsC1zlV6Nv
	xwzbxLn3+FstYb02/K8ZyklrITajY76UNJxMcBjnofUCFh1QZB7IePngLHfbhoVA+3fbTTk9TOK
	2dV75K98hvbGDvRNdPmpapHYQ=
X-Received: by 2002:a05:620a:bc2:b0:8c5:310d:3b1e with SMTP id af79cd13be357-8c6a66f6bb5mr1518899285a.33.1768810639769;
        Mon, 19 Jan 2026 00:17:19 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8c5:310d:3b1e with SMTP id af79cd13be357-8c6a66f6bb5mr1518896885a.33.1768810639275;
        Mon, 19 Jan 2026 00:17:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384dbec4dsm29636391fa.20.2026.01.19.00.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:17:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 10:17:14 +0200
Subject: [PATCH v3 1/4] drm/msm/mdss: correct HBB programmed on UBWC 5.x
 and 6.x devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-msm-ubwc-fixes-v3-1-34aaa672c829@oss.qualcomm.com>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rvlLamNB1d8AxWI8yQdhDfj/WRXPqvKE6wjpg+ZGkfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbeiLRc6MfZfjLwLgU9ZLO+AmHQLpKNEG53lTe
 uFIrNKomZ6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3oiwAKCRCLPIo+Aiko
 1ZiYCACKIFBdBuVY28Simiz9YBlSWLg7vfCkIdbVslZHYkeWy+BmVuv0O1Ne8FFUiw3KIWTX1C+
 Blz4BoZakElqDCeCKgu/N63/gkM5NPFytkeUQ4cHgHtcceXl4bG47umALc9V1NJAfM1tDOb5/0c
 VX7JYAynZSWnkpn//AVfb4bweJ/n71hPBkUZWjtO8+BI6A4c5FCLxyw+hfAhkEyFzj99A6JIX52
 mNtQgQuTjMgV9j9EekWH2LxvKeWItXo9Kr/LhQQZjCPCye24ph6NJAQZmEk83C5w7/e2f88sbUO
 TP0dvVar7Di6T9yZf38+ThRugmLsSv25DeTeKGA8k15VJmcQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NyBTYWx0ZWRfX7xeX+AiYeszU
 7Rfyuy6i0NA3K+44voYGaLYKH5lLXF26ny5KakxgANFBQT7msrR6OVS4fQHTtYkGiuB2xXIyoAd
 hBp9ymF1J1w1280zixKN1jfm9CyIi++dOSy7BKbk16qvsiUmS4hwg+k1UJv3XcUei8tavUtDBfl
 idoyaqpCXotvyHFbKjig7lR6ocdwt52xgFrOcGjC3eA1+Kpp28wuJO7qrMKEsaAvrvdh6XJKJQ9
 H3orxXmzWhtiYUFrslfFADEwhXxeIsg3uOPsJNwFQ8E/4WH+pjYgT1NMwmJCR5QCjMeMMNSZaLt
 tMbpLvXRp3kgZWHxeX6zq4thkZXpheRuddKxxMTHZPQYvKszyiIY+hXi5FnXPPGtanFdxh5BB1v
 yGu2J8qkCykJkGExVeX3oUqo3WIa8a5/zTh1c4HTZWVH3zVGs/5rbrGpiwsSC+vxT5A3zkwQHQE
 4+vwyxzoe0zsu80NaoA==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696de890 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VBuLEOLxEfejlaYavu0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PY6ObrQBfjl2tUVWZS1eQPlr6BFA_NRh
X-Proofpoint-GUID: PY6ObrQBfjl2tUVWZS1eQPlr6BFA_NRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190067

As in the previous generations, on UBWC 5.x and 6.x devices the Highest
Bank Bit value should be programmed into the hardware with the offset of
-13.  Correct the value written into the register to prevent
unpredictable results.

Fixes: 227d4ce0b09e ("drm/msm: Offset MDSS HBB value by 13")
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..910242f5a71f 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -229,7 +229,7 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
-		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;

-- 
2.47.3


