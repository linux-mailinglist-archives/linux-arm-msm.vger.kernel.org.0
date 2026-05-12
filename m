Return-Path: <linux-arm-msm+bounces-107126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DTODvxMA2pq3AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:53:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF05241A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47E3B3139F4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C34C3CAA2F;
	Tue, 12 May 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDDXRJpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FjFVxVvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF43C9882
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600734; cv=none; b=i7XYn4og17QoBi9uSI6TseLXYRfpBczlnDoZJiyqe4paDXeCnK1Lii6EjrvDXp/+g3ncbgeXu9rtYc8CYLoLco4GBcZjMuzyrrGALo8mDig5psXLEg1P2IF3e5PCC8k0qXCylvdifYwy53PVuGxG5WdgM5Nik/8ZUHvJdxttIGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600734; c=relaxed/simple;
	bh=QNQtSLxUMQ2/nPuJkqhlF9yN9JpF2hCD6F8nM859yyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7++riP1Gvl/KN6LA5PLYgVVgMFjJ3Oz9XqCK7e7JX2EYM/CZMIg+AmCcUdfWUIbnBYfJ3k8k5xsnUstkeu0ugTj6xbXjA1IseEhLmp+VpBP0rj9f7Iv8XHwp2G1EsB4wn0PouOrXu+l703N0Z3A0C5ltc6eGBxbmd4Po00trpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDDXRJpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjFVxVvm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCA3EU144547
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BHXK6eodNkDhZFdtXMYa5MNj
	vlW/UFubxvcOQArCorI=; b=QDDXRJpI1DSSKSbAw/J9IZCxS+1pCW9BF9Ac5XnS
	KbYYSzPW8pOBWjsYrMH57lDTektInZdExAmohF/8TOe8bwGAzN6c+IA+POQ1aule
	uAqhHJXuCNHZy6+jLEYNweRV7+yDYcHvLeSYYLP5UAXX2Ypt4eukPieuIWfQ9K+F
	xLOmT1wPQTYvoWrUBJxtf6VyHPltMMpgoLtFFwr3Cm0t9j9at886Z4zYQ/yApYTT
	z0xnN79m5d74lIWInVPEX8sNNmtjmoffcVniJgjncTtCOs2i89GLeI9Qtke1kQCG
	twL7HUIGfbZZwlOiH7HdyNnadQDqx0E977aq0TC9FRg5fQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43yp8tw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:45:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso81147661cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778600731; x=1779205531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BHXK6eodNkDhZFdtXMYa5MNjvlW/UFubxvcOQArCorI=;
        b=FjFVxVvmWOOWGCjxAf5tNA/D3JMxREV6WjBidC82XL3RQGIoRMYPD7GFn5MI/n702J
         BgBAgQnHFLuOScWDMNayliWs4NotFByQLKtTVAE3gLYOaLB/qRJTW23aM4y74ZsWH4sb
         soKKJrX9dUoAb1yzn+Wy7JmSx1mhHYe7lFwj4cXj1PSaMZaU+OXH9y8h40O2KR7yCiSP
         nmSiHH6Bt3EHg8Yzdo9wFIUBoiPXrAOMbX5JoaIPKhxrYhtVGLQFve7yBT7cMspmxhe3
         G2WZJEUbILkbOwmfz7IqLdCWkyEZN881cSZwT7vfHNYZNMJpxJZJ56K+C9V45Y/w+RaM
         aeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600731; x=1779205531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHXK6eodNkDhZFdtXMYa5MNjvlW/UFubxvcOQArCorI=;
        b=ftsq9NHWq5g8Ez2Z4qUMYdb+3Sq8IKGU7zOsXJHLnIJsnyi+GYoRHEbCkHNws0l0wZ
         oeE+qMpo3Q3PlMjfeNCg0zGbhK5Wcz9qdRLt4XKRX7/ILC9LjanNnJd18T2Xbj4RVC8Q
         DyEjH9nJ8qfPSPBeCsODiMYSciMp5P0HjmmK7ItkFwH5QnVKtzAJ8mn2/7YTy5SONtfu
         J7USmBYIqCE4IZ7e8TdUfNMn0x7d4xj36sDaQLhxLjKzVwduehapg670IDUTWkG19eR1
         yMV82q+Qcy+guUJxjJIZXowzn0CpcsMKZiiWJ6rVwudmEDZjPjk0q1qCd2WNet6QA2+V
         DBWg==
X-Forwarded-Encrypted: i=1; AFNElJ+fPy505+MWWHKOxKOYnpgLzIgSWE23O3M5fv8CNbFQLT6Um5UB5BQO+Yoyx5g2dWbsHvObhFpLGGED99Va@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwZCEtLlwaXHxtJAwahZG91aQP9hheOyBw6PE2t8vFo/VqiKm
	vsIF05Go4NawfsjS8WSFEbZWG38QjDBa3ahSzxwz3MnfNoYN5yrz0wD3edebhJYga4a8+Zu858F
	66gPOgC/CTznO4Rw0R/epoVFOlA23gB9UqYQWK822YwDJ5J/pcnRu3v3wIYWQwvuNaZk/
X-Gm-Gg: Acq92OFt80SYrn5zmQARgMtd7pYpe8Y2n5C3Mwk3kl7U/JsxCYDp4RkYsW+MBUcv18y
	esdUvcSFZbkym273SoMnIsTVe0MW28WgI49gMqis/DInlYaqT9PVX3jFli93i4u6FV7iYN6F//X
	lb3/YOOpkNdMFRYzUNnowRqLitp11yYpjFNU9PnDZDGxU6wpsOZ3PYttFhUFbiPNj4cAGcJKTEw
	PcSKH4y0c1nEelAh3CSzAyp6bmIfhSc5LN+l6mF5YSxxodN1d6/gQ9ZK64BXGZgNuKaNy/UHOFE
	KUnxi6wBO7oEDw0zYartc9xZpCcakbct6nH/63RN+Yc88516GA8aN4FTVVHyBn1iw8RefzxpQ8D
	xTnfVh6CnvgPyI6e1lqXSe5UBs2ozBu4WZCYvNh+O9dZ0v1jXDyg6+YPnOv9+NKkJRHEMYLle/L
	pfTX1lf+1R+CE2Wdi4QlTHylaqTfzw+XLaTVY=
X-Received: by 2002:a05:622a:a9c4:10b0:515:189c:e0f8 with SMTP id d75a77b69052e-515189ce240mr18558601cf.17.1778600731334;
        Tue, 12 May 2026 08:45:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a9c4:10b0:515:189c:e0f8 with SMTP id d75a77b69052e-515189ce240mr18555511cf.17.1778600728762;
        Tue, 12 May 2026 08:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6292993sm33520441fa.41.2026.05.12.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:45:27 -0700 (PDT)
Date: Tue, 12 May 2026 18:45:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v6 1/6] media: qcom: iris: Improve format alignment for
 encoder
Message-ID: <7coyxg22dil6p45bjgi7xescawfdwliprhobp5qiytlplu3swo@kqs6lswo66pp>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
 <20251114-iris_encoder_enhancements-v6-1-d6d35a92635d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-iris_encoder_enhancements-v6-1-d6d35a92635d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PzeJZppV2wrqljV84r_SxSqKx5oSsVDM
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a034b1c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VWJduI6YQviP9SRQ2ZgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE2MyBTYWx0ZWRfX5+m8YOo07fW6
 NMAR5KCMm0jJ3wjbbLhymPRZ4A+UIJrg3OmT7ea86/2w2pUfGJoawQhID+8ZzKI7Po6nmUCyZIU
 fAzMXce1rMCkHMc8bG3g+z+jEC3sUunYOvGISJme4eIb0Qddatnxj8JbWn6OHTHhPzBkFdcM4zd
 peDBeYdg5boqJQXehVrZe+Fgzt2X/xdN39eVn38vVfjb0XnSaG9F+HwevPuE/32KhgOHvEZW8i0
 KVRElo/jBCUhHC7sAWIWhik1hJdqw3Amz95eeQi6iKyDntHXiVK/fhuefqzFWz2joZyCzYZPxbs
 BEm+/lSjG6N42rz1/y8SFWnmpjd1QDbjX9OOhdk60v2NyNO95niKTgyPFeErxiu4/5wRkNPCK9d
 gTDHhst83LkGwT2nYwGmurGMwZN9d41eBebG23y4UhfvqCWN3PwpIHMg1Sgz0Es0xuAt6We2IWH
 b7zOM7Z87nu8xojvYKA==
X-Proofpoint-GUID: PzeJZppV2wrqljV84r_SxSqKx5oSsVDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120163
X-Rspamd-Queue-Id: CEAF05241A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107126-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Nov 14, 2025 at 11:08:58AM +0800, Wangao Wang wrote:
> Add members enc_raw_width, enc_raw_height to the struct iris_inst to
> support codec alignment requirements.
> 
> HFI_PROP_RAW_RESOLUTION needs to be set to the actual YUV resolution.

Why? What is wrong with using the existing fields? If you want to set
defaults, can you set the existing field intead of adding extra fields?

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +--
>  drivers/media/platform/qcom/iris/iris_instance.h         | 4 ++++
>  drivers/media/platform/qcom/iris/iris_venc.c             | 6 ++++++
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

