Return-Path: <linux-arm-msm+bounces-110119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK5oIxFCGGr3hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:24:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E87CD5F2AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97076300229D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A793F20F4;
	Thu, 28 May 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5iYKOAc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4xVWRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B063F39C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974370; cv=none; b=BvBTeJ9D7ClK1Xji9VYBV6VVM5S22Gzh8HOgS6jxPgsRZJLUh/Wcst+F1q2T3DcKR9hX17+m8EFPzhrblZ6hIutri2hv/q3aO4cz8bPei+Koker9iZ0GVr5UQs4nMIEQve1aPllQnwFgs9Wb6MceABs0Jt4PL3Zg00THPBZnWFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974370; c=relaxed/simple;
	bh=4B4oHoxKwPUBj7bZ04rWd+Qm3aCpRupCIEC4hFxTaDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWYUeMsNwqNj9N+0wLUqiVxGsiTAyWshhP+5bTbzOBjTliTVSXYfHwt+5V1WHuudwCzPOKXEOMwWyA4WAjdovebZEnHQOyNXpLDd+suZjfRgiK+C0Eq2MagSePk4pnbJPkaCb2nyXL1TrYNHUmKwcAdhitne69T18NKONaV4U8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5iYKOAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4xVWRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vku8298206
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4useIf4eLqCZe5bOXRzatW9D
	bQChiyEdf+RF+QCQ5+Q=; b=R5iYKOAcT3bwEKJ+H6PZicn2pv4zi5WVmalWCqob
	iEyQidn8MrLgEbbDDAsSdNhXbVom3hP0oMkE11LHOeGrdxlU7DKFKy2Ka66d0Gcy
	eef3wV4J1RRAAZT75YIgF8PSbXw0uQuY7Dbg/Kx05jCSqf6plZ+Le37onO/P0hmH
	ZyeyicVDAsHdUqyPiwwMq36LENgNEawsBQZJZDwMQOU+qnkEvfI89sRObgpj0hes
	xp9IFpouHSyoZyvVOFDu1indYYt9vnAAikHid1LvTtYEOji3sZnAsuEJre/+UGI/
	yyRC6Qmr5qmjixQePXJkgSHFlSh95RztRMgLOugrDjWXXg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajue7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:19:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-58700e12faeso9487152e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779974366; x=1780579166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4useIf4eLqCZe5bOXRzatW9DbQChiyEdf+RF+QCQ5+Q=;
        b=VY4xVWRko8nCif4VnqVarrds5W1RZNlQWEp5GOMKaUWJEO4x2QQGiOB5pDM8hqWjDT
         4spXt/3G6jTZiGTbyr4zaeya3SFNeJN+bSKpsgaLoK5kqlhnm9979fyZt2nIaGzYTE9W
         psUuqov3S6q3w5xB32WoHZF4+ygr2cqQ21sJ6JZkD0z3OZq/UCroAdPJCukEKnvAK1a8
         sr0iSAoNsy3/RLj1650sK9r+qUE/1wEkOm6OLPbUDWtnAFi0PKUuVhF5fIV+eARCWWYI
         PoM5Gz9tBPDNpe/GYQkKfOyj6993SJJQN4E410vB/R4revhPp4NdSwCXVzTu/2DxV8XA
         dm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974366; x=1780579166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4useIf4eLqCZe5bOXRzatW9DbQChiyEdf+RF+QCQ5+Q=;
        b=q+Gy3pPv/A4R22y+b1pvju+YNLLvLFVskRyhMZ1oS39ga2iJFzcHc/WkAJIghiILIc
         11KYrMQdSzTeC5TJhYEg0VfJRMD1qUFc3uoxqOJbRdQNBebsPpQ4IEBRFjrI1abWr/w8
         f/rWh2VIF8sJwM+F/uiNm3qr1sLl6XyF+P9hFdFYeXwDfQNDqhSMnVg5LcP5MfFYPW0b
         /kjYfdrE0cesgr8e4lg1yCO9I56GzMQZUVInLFQ+QIvFO+TM7dlLj/9meh3PSV2vErfJ
         koWOXldzD0JqtjZxwRU9FH+bcOxG/Cff3h7lhXXm/ZroqkWIvQ4xtvFYrfrJRzGNHY8S
         BT/A==
X-Forwarded-Encrypted: i=1; AFNElJ8QzX5Cyf4NN8iFSpaUAynjcHdQkhB+RvzYifvEyzMaDsm/4Ww7yEkInpCe2uWPF1xbq5Vzjm5mUdv/D05v@vger.kernel.org
X-Gm-Message-State: AOJu0YzgdKttsEIWEcLcT5UDYP8WrF0aLuj5tPyLwaQ+U7fY/Js/yjmd
	RIiur3aD0RHox26qRtOqOIlKG2fZb+wUZDfXL3AMvVL2Rvt/hdWU6l+nwW7fUazQHGmmkR9APtS
	yBd7oj0IVsT67RpdxKQGiireOniWqK3THNZeW8g7n2jcjuYyBTO3ffQ/tfQj8sxIpxpkt
X-Gm-Gg: Acq92OGSwPV6bjLU0DxIkXfnpJK22rejeWcey5nCRBZALuMGYU0FlVfxIlurvq5kpLu
	VZUPOO5/udi01DBmNAknccybAUQYy7ZClDIw/jHB5N73PdVjxJX4yIgVOSJLTl+Rzi0S8ysNRa+
	Vz6zDngztTDO55hZl0O3AUdRCQu24tmt4ifWvcPSAdfimNzowdbRMQVIjNUYtK877Z3GGX7GFOP
	yycz1Xe36T3XZBO7vWtpZGLbeXxgPOf+n7vP1ODzPzowJGJ3ItNMCCbI4amgaeZ/ena31f/b2QV
	iH3B0YnqsBsXMSp5GMSa8itwhuv78FmoZkig5jX/uEEfVIszp3nFEMSbUYHLs18XNi+dkvQFfkg
	/6daNMPYgX4fTDOy+Dk5mcHeo47M4UEe9ZIkADaVAk6iRpDW88WVHqj2nyzkYMrdU8WTam+zcWv
	qBko0xcPE90YBIDDTckdbuqqoWqNWYlz8Y0A8F1K0FrPw9vA==
X-Received: by 2002:a05:6122:1d13:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-58660c8bcadmr16307634e0c.6.1779974365766;
        Thu, 28 May 2026 06:19:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1d13:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-58660c8bcadmr16307589e0c.6.1779974365298;
        Thu, 28 May 2026 06:19:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa463312b2sm1891842e87.62.2026.05.28.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:19:24 -0700 (PDT)
Date: Thu, 28 May 2026 16:19:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
        luzmaximilian@gmail.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com,
        Douglas Anderson <dianders@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: Add Microsoft Surface Pro 12in
Message-ID: <q2ffaqisybasi6nfciy4iel44kwxaiqkzc2fv2bo6omrsodbpg@mghuize6kwco>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
 <8ac29ee38ba80a3fbde8bfe43b74b9b936b31cb1.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac29ee38ba80a3fbde8bfe43b74b9b936b31cb1.1778822464.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-GUID: ndTlIm34teUR6OJaiJ7QJA95y475qhvz
X-Proofpoint-ORIG-GUID: ndTlIm34teUR6OJaiJ7QJA95y475qhvz
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a1840de cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NJ6gOXVS0vVz-tHME-0A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNCBTYWx0ZWRfX130LtQqgG7rM
 dXa/ivYsP7bQkjHmYF1Pm5BCVVHp9f//ycd2v68AuoE9JWZsn28+C8VVz/JSlvrRj2tR0SsrfR2
 YoEOHxhrhGDUaAzIFO1PfnMqpZpcCI0R5CNhzKI+U0+68oWrxZ8h04bYB5JaIO+MJSioOmpNq96
 5l6Ict8jDY9IqAhel02E3mIBQhiGxjAq77Bq7g6TEtHFgOXO7qyZiEeuFladSFftE9dlb4lM2rY
 PRvVRO429wLnhmsw1084TosDyGnUW0d84e5y41sW+QG1o8NrIQJB9bzx9UmXsUla1dD1qVhODWA
 xZKcvER7HBwNOLBVoGtdNa3oq/15ALtVY3/ijIgGQyQUDKlgGiMUqlmYHmT2KIaYCnGUcVjBi2G
 mnkgahY5HFaSq+11ynEkgQ+4w2EF48lsV/kyq8dhyTyTmAjVsKwVXz/PXLY9j0TFuUmnxSUqJ7D
 5TWjA6hDS8ApRet4bUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280134
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110119-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,chromium.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E87CD5F2AC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 03:41:52PM +1000, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1201 +++++++++++++++++
>  2 files changed, 1203 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

