Return-Path: <linux-arm-msm+bounces-103171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPNyLDpm3mmxDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:07:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 581333FC562
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9479C3012B4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755EF3EC2DE;
	Tue, 14 Apr 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP/YenIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cARcr+A6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382C2C3255
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182838; cv=none; b=O6VKsi42EMrM8Z9Y5E0bXYf0kB6H52b6A/P8SFc8b5S77DJU4hG4ZcJnmNdXZXVX47M9//kDhg4N9hFjsZd2kGYHpqnzZbudD49gPTDM+JffXq223Y1g57+D2uVT/K+g0IY1g9iHHLYcxU31J0c+gq3gfTighkMxJrgLpRaVpYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182838; c=relaxed/simple;
	bh=IBb8JJ2A64PlNU6NUTtbFnS1jx2cVcxNUEucb3o92+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfe4QJSsayToySHIkx2g4tyHpdL9hfj05Z68US66YOCfxy7rpcqQQmpJjAOFTjJj6TZY0TqkYszUSFz5Ddh4aUho0fWuN5KCWUYfnK6DVEQMSY8K0FldCpLavuwkiXfR208M0m4I+Zl1osB7bhfDpUZfoZACa/wTuYem1riS8Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP/YenIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cARcr+A6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EG3Nuw966064
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r8YC4bmsxOPBG90j4a6UAmrj
	B7uMPv7sbwMF4a52oOY=; b=nP/YenIR4jOGllbuRsZ7DYI9jfWjRh0N7xtCl0e3
	RC0QgsK3XDEMG8ONwPo1ACluyB9lk20sgbFUBUM8Y74Rt0tsdyuLuys602sduVwL
	asay3EuMq6W+aHUj+O7cMW3W72QnpRWBAo/EalZZL/sFQ1DeBxT04GFHFJ7W6TLW
	OO2NkjU6wKR28tC434Ln4bx1ZRMF6PWWbi6Keoha1UMQPq2/PNocM9zabNxlR4wR
	rrJRGnlPIaKEiChjgH6oE8XVf2A5KIJCSK25nZXLo9QAFBpGgEAPiJ7W5HZeukL/
	nelSBGLS81249AZF6vwVLIgfyddgiZdnjllWQrRok4HeOw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrs1r0nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:07:16 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-47943308b41so5781638b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776182836; x=1776787636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8YC4bmsxOPBG90j4a6UAmrjB7uMPv7sbwMF4a52oOY=;
        b=cARcr+A6wyltjZ1HRva12/RwgVlfj4loHFY/LgS5YmXk1KoDeiHIOu7DPkYWXnN867
         3MraMpVu+RdXewF9f9S4FsB8d2EdyygNUKqYTAeVAJWq7QuzZSV1IlwhtToIiLUCtVZc
         yQj1KLlBtKnhsICNtrmjrEUceGxDZSFz4uVVc6/s1BsLJlWOplCibep/05NfNe/uTDsB
         40LBLRkTAjFLE7L9RsHqeg+Tp9isjaASfeO6kwGvl2zFcL5vtriyoVUHGZ0Q2tKYpN8y
         +x+uReMRY0mdrvHlsXtanauBA5iqlejrnpdnNeClD5kgasu8eRjr4DLiBfFGfmUQ1o6A
         vMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182836; x=1776787636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8YC4bmsxOPBG90j4a6UAmrjB7uMPv7sbwMF4a52oOY=;
        b=OnV3tzO0Dn5HAMZDOvSl8vPtmdZbeqBiS5bCzlJ/BqhkCGsBSDvQvi/01Ws7RdMAHV
         pZwqx+X6ZSAixVYhl2OiCb012g9s16d5W8Hff7tsVu85ENXqBxm3SRnOSucuVOMZ8zJM
         4gD6ZpOHsVxPImGS8R04jgV4JFADwSyz3W1lBsqGSnWtyfsry4AYW/Epu18Jftyp7LXM
         BaUauawFrEvmPn7Pt7XQHr+UR0eKuVk18kXERt5V99ASopw9EN6TBlgJ2u9IHZIR6tSo
         h264oeNUyBcl6dOZ7cCaDA3J7/x6tD+vrvgao9LXHbfNJrWj4hqf1iDj98b8M3lfxTkq
         vrvA==
X-Forwarded-Encrypted: i=1; AFNElJ+gEmUlGJ4IaAHxRr7Y0mG0YDg4RRkQNbqTQHlQHo6opEQBi1Eo4U2B210Q6NpvKLTh8hQUsNDt9rNso6nL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaf6mfOAlWk8cgXfJae2V6n3pzQUpUfLCJvzBILn6m5P78upL2
	bEc8L9CNoo08/s7jKSwE8g8s5QKa3kixskJ7vPsd3RXSv2Re6OC3rwMe6yi4wEEjyNd5cKZrZP8
	qymJ2tT7CNDpqm47/TuBNvKqzZ6vVmThx3+xmmX+OQIGFlHNN3VhKo3TQR3KyacHvfYx6If9iPU
	9E
X-Gm-Gg: AeBDievBKgw5dX0GvAqsVCvZtQM1Qag/XufuNqzUU6PNIMha6+DgIqh0oGll6/ODKrp
	5HFHRun17T0i9rnqoYFiOyWv/CHBNiT4ZBeocpcmUUrhl2awitTGVCsTo6EN0VEH2IS+E583JOg
	dtmFGKNkjFXvJIwsy7YWkh0fig5kJVf56w6iwq7t2CyjpWAymUAKrXDhYwGcGT+e28PlyG0fmfd
	/ZD4rrtI2iVBEZQ0KqX3jgyWw1TbUgXi8tYHfU50lkHWLoVs+6RiwsmKMO/KLdr1tGDefS7XV4n
	+1d2gyk0CA/BeAp+B3WM/TytO3Z+IG5TFDpjKZjqXQ2HkhKwsoR4/VJE8vT9CleKFEVKjiAU+8i
	Z4Bdk1eS1tmtMqPnmsk30WHIcz4H1ZoGOXUDdcm2lFbeSBzvd6AzqlQXJcjUYtfh+kvPd6D/f2p
	GOmt1Hpy0mmxUj5XXOQ56EwRmQ8sfcqQzXdZDMxNmJL51ciQ==
X-Received: by 2002:a05:6808:1391:b0:467:1ad3:7ee with SMTP id 5614622812f47-4789f10b778mr8687037b6e.40.1776182835707;
        Tue, 14 Apr 2026 09:07:15 -0700 (PDT)
X-Received: by 2002:a05:6808:1391:b0:467:1ad3:7ee with SMTP id 5614622812f47-4789f10b778mr8687025b6e.40.1776182835264;
        Tue, 14 Apr 2026 09:07:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe7db21esm1301462e87.51.2026.04.14.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:07:12 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:07:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix UV scanlines calculation for YUV UBWC
 formats
Message-ID: <sgybjwtuj7ke4w2imsezuw62meitngg6hkz4eam5pmz72vv6e7@jqqc66bmz77s>
References: <20260414-topic-sm8x50-msm-dpu1-formats-qc10c-v1-1-0b62325b9030@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-topic-sm8x50-msm-dpu1-formats-qc10c-v1-1-0b62325b9030@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0OSBTYWx0ZWRfX1UdfzAYbweLR
 dFIR8M6Yv65J4D6JKDJu68ZG48uQ5OVMVMn6Hk4GEF5BPDpNzmnT/BbZHkibhNIEvPqXGWdXOrh
 ydTxfdaj8l1G8eUWyOsAk6fSamWw/hvcHBRuMWvkAfEnoZ868CXFsBvWSQKVFSr2oMvulB2Iibs
 wZchTUt2KGgz4u9X83khWWXVU4FL9nGqN8eTcgDlubrQwUitQ2SSg1mX52WqHzrLxcj30rITm0/
 kpSlvOjrwOM8E3jTV1OruCOhop26c+6P5oVqOnKdouzHuOwQmj6+/iTdGFsHVxwds7CHr8/9Fmq
 LXt+OGDrF9wEYNv0AF30wGfOY9+3BUmck9N/Bq7kzpl5TfpacSMHD/7IRUyehv2oFZzjuVcmj9t
 XYc/X8jpsh/W24wbcRB4CXvFTPx+vXVEl972lgyt6lIjxkNVUmmYwtglCuXYW6hRWvG3kzDN0sF
 expN+xNLH7bIlt14UfQ==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=69de6634 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fVZ1-b_OFI8MV6liJMAA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: dFVxvM3iNR7A70DAmWzslKFPAIfuBsqm
X-Proofpoint-ORIG-GUID: dFVxvM3iNR7A70DAmWzslKFPAIfuBsqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140149
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103171-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 581333FC562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 05:14:30PM +0200, Neil Armstrong wrote:
> The UV scanlines is calculated with (height + 1) / 2 unlike
> the Y scanlines, add back the correct scanlines calculation
> for UBWC YUV formats.
> 
> Fixes: 2f3ff6ab8f5c ("drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()")
> Fixes: ada4a19ed21c ("drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

