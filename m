Return-Path: <linux-arm-msm+bounces-70601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D33B33C49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64A5C16CDAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBB82DA776;
	Mon, 25 Aug 2025 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HX0CBdcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE22D1308
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116782; cv=none; b=HKGZJvk9AS0pQSecd08MnkG/sendl95xT2dmkgJ3LS5plKq2RhixvvOM/qed0TMju9kXXaGoOGIYCCNDQbnnXevhqNSics5KZhrfoNV/QZKM6tSYe79fZRdV/1R60E0XBf01W8GbJwb/Fu4bNvC1/Zk75Fi8FeEYSrSrNxagPVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116782; c=relaxed/simple;
	bh=qETacxdD+xOMesgXMU0txWNaZ5hKWFtVQbpaLYum4Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDAlj/K/OXK20c5CrCjdTiyy8P2f1pGZA9EyGhrY1gMKmiU4ks1FT8RZnqcjvnpK+9BZbOT+/s737EPr5gEnjxafamvJBZIyEPAsqndDd6QBZbFB37hKyar2CCPoJGLiWrvRZQNM8iU8pBk4PFeOJrh4Lkn3GYX7hrRyL4Im7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HX0CBdcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P7iqfB030813
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M94yiXXN3v2
	OeJTyDLo3KsFMQqNubljS5iZCkUwPSZ8=; b=HX0CBdcNMAbP5YdkvBxw06GNjHs
	dXwFKQKsnZrIvxTZbcsiK1KYW90sEKivlKgJFD+6g+kydNSH/pv1RvvPiu5lwB/X
	ug9ZFCKox4qmhIk7HytzYQncH0GmsuIe7Fg+w0NXw8UWKIcp5V0N/A05Fxz9bTP5
	C1WgmsLC6wIa9EAFyaz4t8sIGIUSbeYF99s5/Wvg0co5WOXC1Tiln9vrArZpojqv
	SJohIZ3/ppYgqky5n0jZgvqLMLnKKw9MSaeYau+zvhcmfWhb9XQSm9rnrnrFs/tG
	RUcuoAsX0+LAX/iv4TfsVtrsKQWXg61JF6S3lQwrMo2urbSluQdvCf8CrmQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfcqq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:12:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b29cdc7417so98717821cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116779; x=1756721579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M94yiXXN3v2OeJTyDLo3KsFMQqNubljS5iZCkUwPSZ8=;
        b=iMRMlv6jsMwzz2WK80oe0vhHX/tSbVzi+mpjM1FSeiGDwBiXaOwQmc25hXxGtel8Ln
         DsPMfftjNpBAh0n0fv/5teuNiglFBtMg1sbm4w4mF5CJmQjbYvz0pQtcJS6F4x6qttod
         8B/6NroUByNL6TNVAfjjydC0Xi/4cAvm+mxIHb7KFHZUF+e2z/epYOafuhNe0X+zH0/t
         +9+yDPWSgNaXs6wVRd3NH+/q9/bHYRLYg/2RwFl2Tjl4UZ2HzkrKx4sTwcrLspeHKNf3
         miKytriQq8ZURtX3sDm/CcMpJGXdr6M7iZWUdZCMIPDK2y/35YP01aDCGIYcLd2TeJqE
         sjNg==
X-Forwarded-Encrypted: i=1; AJvYcCUXv/ZZB0mk2R1hmLEQFfxhqg8W/NZlQO2znqVR3gCQWgqRPAZ7OKnhB6ij48GPSkUAwxayZnRqihxIIYjG@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCF8MR430Qyz0o0mh915lyyZSE9QWqf8VcTWtzm4otp7o1OLH
	CDHeNfd79IvXW3T41coI3ObWhlJ+aqKIo+wn+nRPoJzDfiH/kHNBYLTsrOIL85G7nZ0EpvElF25
	Nus7AfnG0AHchC1pJglNK6ayYeIzbFOEGiC2bTXs3QNubz+FvY5N+6AIh/aRwV4L1GP4T
X-Gm-Gg: ASbGncuNpev5nIbra+ZOF6E38R+EiQK3g4gmNPM2gZmHRspv3nhrHqSaSM1l5+MENtm
	3WUOp9/KKIW9L2GomstdZUUv1WLNof3lkufjcGHAfUaV0NT9hW496k8A9727P0IPz+LMuDcvAQb
	bOPK5L0J5463XBJiVT+mJLkgHGGGsDkeLqP73ShbzVYpPtaC3QgtHdna9+c3z/3pzDm4SakWVa1
	zhu2/WGVPjBcXZijNZ03SkO5f1CwbO02qK4kgeK1SZKtvM9uUUKBedJXLExBtUdodiw1jtGDJ5v
	fhEv/Do4iN8Ig2a5hfdpmM2MJnKD0Gx+ogXoC1wip8dWzG1ta4kUSw==
X-Received: by 2002:a05:622a:4188:b0:4b2:d25d:2f15 with SMTP id d75a77b69052e-4b2d25d317amr35725591cf.20.1756116778654;
        Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2cGVPeIFuXbrWm4z0GxzF/KpOCtFW5IwJGn5xkGyqjVJJolW8huuGhTudz9wm/LFSsEywjw==
X-Received: by 2002:a05:622a:4188:b0:4b2:d25d:2f15 with SMTP id d75a77b69052e-4b2d25d317amr35725231cf.20.1756116778089;
        Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, Stable@vger.kernel.org
Subject: [PATCH 1/3] ASoC: qcom: audioreach: fix potential null pointer dereference
Date: Mon, 25 Aug 2025 11:12:45 +0100
Message-ID: <20250825101247.152619-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX120GJY4tW9Sw
 73SR9eyFas88/+wuvvG8K1sRKB0Oa+hmtnpjnjrfk6PxHRHfLpNe1GaWiNOq96yuXzhqf/qu9YZ
 Xz9LTkGBvlWMv6osKR3t2poYTQ6wouKavcm/glhXA1g8uNqADA2tN7bDrkiaMfvWDdVhV44cEdY
 igC9oLuPK1VyOPdTCzlRcrcu18rO1IDM1biOs0+kRVtzZGEVuggu1uIpYgQfVOwD4CxFZixjYG6
 lBQbOEhdrregJju6hFs34YpVhDq4KuXvAwUCSrZY14nSJ/AyB8pHRvXzBlIg6Yn59XhJTLD3SRa
 dbLoMnWYQP8ExhV6vMJ9WrlD+amVvVDnvpV4Y+moZihq0pA64cjYpVnrSdkuBPi3nMA3ZohP0Xc
 sKHTRA1e
X-Proofpoint-GUID: YXUNtUiPyR3EFilSUaSnzxccwJUKLuz_
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac372b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6m3MDpN89X3R0uDixRgA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YXUNtUiPyR3EFilSUaSnzxccwJUKLuz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

It is possible that the topology parsing function
audioreach_widget_load_module_common() could return NULL or an error
pointer. Add missing NULL check so that we do not dereference it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: <Stable@vger.kernel.org>
Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index ec51fabd98cb..c2226ed5164f 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -607,8 +607,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 		return PTR_ERR(cont);
 
 	mod = audioreach_parse_common_tokens(apm, cont, &tplg_w->priv, w);
-	if (IS_ERR(mod))
-		return PTR_ERR(mod);
+	if (IS_ERR_OR_NULL(mod))
+		return mod ? PTR_ERR(mod) : -ENODEV;
 
 	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
 
-- 
2.50.0


