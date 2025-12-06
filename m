Return-Path: <linux-arm-msm+bounces-84563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF5CAA0BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 448D93140B5C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 04:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31DE2116F4;
	Sat,  6 Dec 2025 04:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kyohsvY9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVlVh5SL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351F21767A
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 04:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764995195; cv=none; b=pX7efPDtAlhuFuE+mG7xCYDg1OUboKqptEMWeBr5iAaMpEAFLKgfo1l+NsIVvbib6oSTIuJfLrHtwbH1m24wu4U5XX3ulFUZ6UPTy1ETC7iK9kWKN08C0uGqqurAz/UUmFW0IPOVN16BlP27kkN2mRE0JvYZhso6G9YsYhGvpdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764995195; c=relaxed/simple;
	bh=Ot80z9B4xTfCEjd6Lfhaev1KL+sIvAeIrjGEDqicm9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZSrz33BlFHpLJ1fk+VXMo79AfUihzPAEOQP3lBvhSGut+CQ930O97PSe0euLJ/x79E5T6I+u32unUhcrolO0f6GpRhXQMKf5NMUbZMnERqKTBeE6KVS0Y888fyaIY36wK4jVnCX5unBSFdEQTdse8uVH2qHEOh76vqDJpTNpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kyohsvY9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVlVh5SL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B60grn01692038
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 04:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hu8/G2En0ETKGGXX8lhZbAP0
	7xXmRzeu4TXO/qDJN6g=; b=kyohsvY9b5gIK5ZVV132WwNNX6yJfrn++PqAVQM8
	gchhMq91Y0qnqN4cgdOSPTZDQfXIDEKUlBBkdt667C+ZotwSODJ6v7pFcJlJVVMC
	kR7ybafxNc9xmbapUVBjaumurIVibe6nchqj39cQwUdniR6Xgw2Wbh+blUwqjHmH
	zmAs7oTx3nxpazR3tgwAn9tWIo1j2j8gKUZY7vOOL1/gHHi5R99HxRNpqoDdUBNj
	dkXvEYblsLZy6ypcVxTcITKocqt+1jS3UMZyGGvP9+k/F9A74M6wWpzrqZKIfkxQ
	X3ALGR2YB2X9AB1E9vqALEiZczH7tKrRGztUtHPvldMWlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ava6f8atb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 04:26:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so846106485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764995192; x=1765599992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hu8/G2En0ETKGGXX8lhZbAP07xXmRzeu4TXO/qDJN6g=;
        b=DVlVh5SL651xgpbb2dPf0tJVNvxy4cpH0YJnSlu2uA1tbFTZ67TNqyDI05J5O4gJgp
         4OhZBpHVxhYjjRimeNlUw5D53RYMzKY9lafGWBwnbfX8imWxV1lSPZFrEvCUNp0jped7
         v8OYLYhJBAm/Flx3ELE40BcnByx0x+q3wtEwhPQefTv6Pw/43HTrfXTfYUe5L1ScYi+1
         JhO2gC+ebJ7XvXWYAQr8YhUV5namuga+6r3msW6555TnG06A5G48pLTGiSo5CCQsZbdk
         ffwaf1wtDK4ml5uSERlyQqjHQ5+oYi6HTOmsBWUNUP0J/autNIEMVBbuJj7Y/+meqEM+
         6xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764995192; x=1765599992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hu8/G2En0ETKGGXX8lhZbAP07xXmRzeu4TXO/qDJN6g=;
        b=K7WZ6yDqKYNcrpccyiyov17rqaM0rxQgXTHBzyShHBKYk6bog4tupFXVk4vp1z3hPz
         Ex8Ym/vzo3l4gzkxXjtJ23R63vOtCXAVngPSaabVUumcqSu+AHRjIrS6Y/EJmpTbFLPU
         pocy6+lI7nEyAZXoiWmZZpJwmNOJ4xdqydV3OUw6zWhbiJMoYrid9KssKi44xpMx4A/H
         YrJB3jnBs3B0i4ricefJb7AUt2YaLSKlzHKtS3K3jsUmkaY2VP1UdeLXiV1h7JRtDqDk
         cCEpnVAX8lcx4dsKEjbuzad7/Mnrqq8gflPZv7buG8l/HeXHX66DJYzNfxu/fogTPDOu
         h8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLDF7V/ktblQUZfB5wJTQVbcrQq9y1lR7dsnaXVu+gB1M71MHvleMT7HHbKhHMUyUzA849LkDXgdFqFaOL@vger.kernel.org
X-Gm-Message-State: AOJu0YwTa1ub7iGwdoCs4LNZTC6VZCUFn//S4N7n3MoX2pB2p1Cjg6rE
	Nfyn4rRfo7rGDCR/bCn6Xr5vynV5Kz3BN2SoFQ1byhDHq6X+QhCE8SqVYwhHA3/ngGn5wwmNY69
	MdFJx2Htc+I5B/IjvG4oej2l6ZHhb1CsgDeYDdXtAD/4ms+rm/lt0avQFStmkOP4PkZpI
X-Gm-Gg: ASbGncthLi+55ANaWWNjNDuKiqZDp+gi2uA098q1GNSzW8cv06xn/PyNmhLyn/3eEAJ
	lzYksVy3Gof2HsUgvdEerfilkw4NA8SpSCdO0JkaqlrYsmDSuDDYb24Vn0oFw0CIf02lvF9hs4T
	FG3yjPJAPyOiKQhhTJrEiuF2W0OL+bx9ZNt+9ApUwxyopCZzNypjStefomJYdXVJBaG1XDG2M2Q
	ZMdovG6RuHkVib2IiUVPW2oyO0gI3AQHl3ZkQrXBUKQq6Ipx4bX+YtHzTcX733NPi/UvqjhXEcc
	Nv17uf+U9/meS8k65ikW2yWh6feGQUjH+FFQZGpO8M6DvSfhiPmiXyqlInqT/MHKs+W6k4LxoWY
	aAJbWhlvCK05AjvHvSaNBjNkUiTbpUeoCn8oSYJ86b9741NHpLhzVCdXcZRhKJ7NpgH0lwQvGnQ
	+YSnMDLtiYmhanNZmXTeSXJjQ=
X-Received: by 2002:a05:620a:25d3:b0:8b2:e666:713 with SMTP id af79cd13be357-8b6a23befd5mr210649385a.42.1764995192548;
        Fri, 05 Dec 2025 20:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOHLd2bPRMxNnPTsz0lp++zEjLAlPwtCJk+xAn1q+7cbKHH+uZHFLA7dyHx0CcMZMPHW8ySw==
X-Received: by 2002:a05:620a:25d3:b0:8b2:e666:713 with SMTP id af79cd13be357-8b6a23befd5mr210647285a.42.1764995192063;
        Fri, 05 Dec 2025 20:26:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2e4afsm2079237e87.95.2025.12.05.20.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:26:30 -0800 (PST)
Date: Sat, 6 Dec 2025 06:26:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
Message-ID: <a2fcngmfmrhc7jltvpmobj2xejdys6txcwbtyro5eyxx5g252b@fj27grtqjv2f>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-5-3b706f8dcc96@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-5-3b706f8dcc96@ixit.cz>
X-Proofpoint-ORIG-GUID: mKe96owe0Hfckfp6PEUJgs0rbbq_T8iZ
X-Authority-Analysis: v=2.4 cv=NYXrFmD4 c=1 sm=1 tr=0 ts=6933b079 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i-udh5MX2JNcMYgkDNsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mKe96owe0Hfckfp6PEUJgs0rbbq_T8iZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAzMyBTYWx0ZWRfX5snesE0TEhPn
 n6mrs5SOSbEehzmPcaTefmhBlPGtIa76Ss2iJ3joBy9Hdr6CJUIu6BNyULwCbwcPBUm4LwZyBQT
 0uX7Fdq9hlBFVM7AEnM4KnybDKJ/hxWG2tXH/OkTefQfGE7mk1XRTH40AhNjDj39Yphko8nhOTT
 ovXHmBFCESzOm8ryc8JRvSMP7OI3wGipIRZrmq26XpbZPlaOJtNrEx85xdkzMu/nFkoHOrBN+Sy
 RPTwRcXcvurDJVhHLqKmOk9vH4WvL/hoolakW8jZKh+y9FUVW5Kfk7cYw6iLLGUEcGIf3McqhF9
 lQSul6Lz1wyNkNsrEVu8+dpo5VZQXouTALphEahRWu8XWGe4z1OsZjurI7TPIH0PUG0utA9M9lD
 R/a/uRCJD8icKiyvpzxcqN1ekSSzqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060033

On Tue, Nov 25, 2025 at 09:29:40PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The drm_panel_remove should take care of disable/unprepare. Remove the
> manual call from the sw43408_remove function.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

