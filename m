Return-Path: <linux-arm-msm+bounces-113667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ol+ML8LCMmrC5AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:52:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF8269B25D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:52:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LTZ2r4Av;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TaUOiNkm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113667-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113667-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2336830608D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2544A33EA;
	Wed, 17 Jun 2026 15:50:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF31947DD42
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711425; cv=none; b=Bqsl7UGf0VPo7tDv+Y2nnCb67f5CFUQfM3M0cGwQc6ROVKZ/m+ZfMvHU+edX7jB4kXBTPjFTtNbqurBo05J/8igldoGopzgbUsFfA0Nksq/7dCXz0Igayeg+qeFTV3VmL9kMDX9oooQhSURANf8KPVlLkeP8uSv/5r4EdwB6/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711425; c=relaxed/simple;
	bh=2QD1at917VHfOQZ1FFL8/A7RYZ001LMVPGzvMxVSjrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jD9TvUTjIwrSbse8GEaId0jFk1i5t48mjJeD8P4fwDw9+8Y+6ytJULVocP06cMecymdb8nnmqC2bJBxwnCw2TfDTwxf7JN4Pbw4KOk2IQNPQCsIn1msloDMoxfkMiLLSvI5oUZRXTYnK1RY14o7as7TPM6CUzCsDq8aOQB/23hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTZ2r4Av; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaUOiNkm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFfnfI3244836
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0i/236+32Uviug69CXy7TUPGH2NTZVCBU7yo4A1KEOY=; b=LTZ2r4AvufypMFpk
	xZX6YZSfae+BjjucKLzygZCvSDO0/cg0KZEV1lFTn8W18eug7+peXZfLwnnBLn/B
	hhOLOCBhxvFEU7b17bh2ZCW2qvFptQLBifjq9H6eN8ZYvp022bW9MZNWTyRZlzuk
	tl4TswKAcND0fdQ/WU0d2Io3HUpSSoNJy8s62Hyri5vBZbUht/0uebyjV9K62f8o
	SXfWZ0e/l4YM0CEuN00io3EQW+iPmJZ0d607MuTvXZWZPFAlIgAO4hzrn/lAWBD+
	xyx90u3AOD2HRyeDkffZ8cM2v+X/PfA3GI/rNz8GUX4DXU3pfEuEj5NTjq6tdf1b
	zJx2Yw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jr57g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:50:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c152655acfso629293137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711406; x=1782316206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0i/236+32Uviug69CXy7TUPGH2NTZVCBU7yo4A1KEOY=;
        b=TaUOiNkmkZtNDz4s/ddWsj9nxlQjhGyC+CxPCZ2ta+Lfoov3RMHsqmSOv7VuA/REaL
         dU1CfaMz8H3DrW3CMk/zgewjzlSk2/CXrs5JwbCMeJ3DTOX5souKC0f562Hv0zM5f091
         zeJpcEDP6Vv2hNPFzLI3HSpowIdE5QTq9U2ype+3RC742Yh9ehJE4kIagrZBOQe3OHB3
         xci2v5IQ+RAv6hNTurEVbc2zg3oQqqz4D+7j9PsZ/4YJiP/2TcIxCsOwxWzZTCCA0hrE
         le8BkshQN2nYs7jWEEzmI3QtK/s74+asjxhFRohnzyAxfPnxlLKcmpvNUdZ6aWGtNDrJ
         CEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711406; x=1782316206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0i/236+32Uviug69CXy7TUPGH2NTZVCBU7yo4A1KEOY=;
        b=FUyEawvhD/rNrSe+wj5p6hfG8996ehErqBSIhgVvTZ7PumO0nat5EvJzlHZi2xIHJu
         dGqCOmIIpXQAbWLer1/R8oAyLlDVvUU1WHzbdxxltZUNwL06CTguNcBHmcV+Frq05Apj
         CJNdefcfmfoY3Nh6XJJGzTZR5XA9GSRpTSUS/xLr96VB/wDUPWZKSUoZP8FXZzgnXUcB
         1xtOM+UIqMpzoshfNxyDDt2VrIKixVspUlbWgIWnAZPx+GAN/5s4P4SQ3IKnrwRHE0EZ
         HZ0CsDwb6IjeoHCey2yfOBfbEVLijikNfj6ivBzyet43edN1/LMGRphJYRI5FDfsSM2K
         vErw==
X-Forwarded-Encrypted: i=1; AFNElJ/Xmctau8rf7CLQ/JHTwi73CatKXRz6QD7nK1jP9+QaDB9qhazcohdO7p/rTE8xeAmJrm/1hX5Wj2U77FTQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvqqc1iVkUJl12WRuuQ6zQncBJ03/+J2caULAoeY29cefFBkgc
	ioJ014LospizM7jKv7yK0I5EYyARI7Xuxevn9c/cj7YfHeivCzigQuLQ9racdm6Tm53nrq00Nee
	6zSVu8Tl2foXSbBCoXE6ZYBgl5yA65km0rOx4S8YuipfFnDMqgs+2Lum1XFSIC7AMQBzh
X-Gm-Gg: AfdE7cngivaQWLaw1hsHpF1otAIilEjA2uPjIB8jOwoNqeWIwwMUqhWisp+FnpL4I9w
	SLb77o3aZBXE7/gQv1ZOjDC0W4xz9HVUoODC2gQpc0K85CCR0mkGV67ucX3m2qqNxvD8IKZg/b3
	4pPyxERvA4/JXG3fjdkU0FIxmG6m4j4OuWo7GCSDV8Nt41bb5UCE62OTjj/2c0JbHjKQsDdxp3P
	555JIM2aujRtopGyI2APmclQJIs7Uac49ljAoIg6OmAY3NGhXrW0ohMcCLh5f7B+PEHB98kcAgl
	J0ZASdvKjEHB2eJIRUjMVRXRYnI6u4aub9YkZ7nsDLdVzpNtYBKV738ZGi+0iaGjoqDDPFqs3XB
	EBwoWGRfFATJyJpqilUrp3a0WBELK1LZN2PKaXKA7
X-Received: by 2002:a05:6102:15a9:b0:633:3040:ca5d with SMTP id ada2fe7eead31-7245da81133mr2503889137.9.1781711405604;
        Wed, 17 Jun 2026 08:50:05 -0700 (PDT)
X-Received: by 2002:a05:6102:15a9:b0:633:3040:ca5d with SMTP id ada2fe7eead31-7245da81133mr2503851137.9.1781711405091;
        Wed, 17 Jun 2026 08:50:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:50:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:49:35 +0200
Subject: [PATCH v3 6/8] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qce-fix-self-tests-v3-6-ecc2b4dedcfd@oss.qualcomm.com>
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
In-Reply-To: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4074;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z6ypwKanEzjNE5ILHL6Sr+FU2/1s8+CILGLtPtABFCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIbgbJRyM1SL7/IRyPeLefrTlVeUZKYxcUpq
 T+60xv4kl6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCGwAKCRAFnS7L/zaE
 w5iDD/4wFpsj7SRMnRJGvw2fPaGz4bGVZ64y2nkitN8T6RNjmoLN4XgGSklIpcGOKb1Ng349zDg
 CZ6PHTcap9Xqa5jBzsdrBQzd/TDWDUeWJJ+WbX768EF2f11oszyg8n/rfiff1jrdDluFmFA17Y9
 r2UzDtXL8nZietQyPkPF4WqRrgs5VtKFuqUTRlJyBL0RNAOADnWFU8HPhNdAQ2rFZub0mbItNGQ
 XmBEFvEYAyrXB7WZEFmqbMTd8ug5pHnyQRT/V83AUewlHSk3e0sm7ETdurprKIcHaij8hpniO+8
 uN+I16dNkFYFfEfDlkoP0BukQLRmhwU6LjYnlaiLzl+6mbiJUwpouAmioiGn7TYTtI01FerMLkU
 ozOP8wBzH42CzrMcVOF7DHxt8v4M14HtASQEseJ2uA3VHiuv70MbozR5enqTCYlb43p7+4k7YoS
 XoEkJ3P5QNfjycLXJ5wE0RACUgrxOs2Ys6oEg0Bo62SFxbChriUTg/YKx9T/82zRqnU3xtzsyIx
 E6gPwtIAHjlWDeDp7CzHqi+sdvPZwiQglG9CxxmlGdWTI1PJmponCcybu0ahZ/BuLeTiAd9+56K
 ekLf5ax0jr3taF4PhBGqjkZbxZX9AeqyGBuu6K3vBNIiev0Kx8RRDNH1e2FTCz8iPXQ0UBACycZ
 pkU+F1a4uNYHKhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfXyCOWoi/Zeb/M
 r65O00RLTcOIVV+hzhWUmSK/rYgY7LfQbbkDDqrYFwFH7hN6B5EDxKzBKVZ9ZkfGuKRfyP8y8lo
 Q6Brf8h+PuFKtvIc+wgbITw5kbDscGijlm4hHYAHRrXGCioS0fI6uyT1frUR3BrtmwNt/C2wyTH
 y80N/789BdX5vRRnEULde3Vd3wJhfHZSekDwqphYooC0JtKzhUFOdHiT5ReOVwy01OsghgtzsVr
 pnz4gJtYTNe50TKdMx3dxGrRA857iPGO/GNNgyXzawO2tAeUtcX5b2u9iWbP0j2TfkRVVoJa681
 1SGSa1fzPQQG+2c4rWtS/HNUNtq3GuGxX2rOWWHp/1g3FfeOLhlbeG65M+sM/E8wnU7rH9W1LLZ
 NzW5mT2eeFE7yLje/y53FpwGZC7CbBqQq3JrmFybSFNQlDqPKr/MzvL0Vd8CaTDNQyIMEBQKRHX
 Q9KL6bM8Faxb8tMB2UQ==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a32c22e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 4Y2uauRF5YJmriDMLzLuMwCpxFvMa1JU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX1TO+T5ROj37V
 yXRQ19IvYugVxP1g2Dv4FMnC+w9cflcJrreNa3rlpWqQVE8Ul2tmduKQOcd5oacyhKmj60dBeQc
 WfqjNaNrH2DpTxJMX+cywfpirBmbbx4=
X-Proofpoint-GUID: 4Y2uauRF5YJmriDMLzLuMwCpxFvMa1JU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113667-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EF8269B25D

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Cc: stable@vger.kernel.org
Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3aca0397adc1f703aea690c754d60..daea07551118d444d2f749588bdfe2ae2c6c553f 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 118a6878a76b1e86534f60e5d2058b99a689302e..9c1ce69adab8309737e15a50826505898340bcd9 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -194,14 +195,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -262,13 +266,15 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback))) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3


