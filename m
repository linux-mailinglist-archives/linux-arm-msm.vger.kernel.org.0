Return-Path: <linux-arm-msm+bounces-116805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jMQWB+OiS2rWXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:43:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A60BF710A93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:43:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D2GfBjLY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NATlTPT2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116805-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116805-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEDEC3002319
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CFF42A780;
	Mon,  6 Jul 2026 12:42:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92C3DEFE2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341722; cv=none; b=f+IC/HRwpyO6bDqjXVkhqKwvyq60mqBf/llPx0B0PlRkkhJcj2u6h8DTiZaOeTwmGc/vhOsHHb3m2juiykVSWWLMdgPQtwlDPU6uGMvPLMqPTYhuat/aJAW1i5zmGvJJoQOF+zYTe1JLLi16O7yLv3Rqc/BNQPp+U23BORUdFIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341722; c=relaxed/simple;
	bh=5d5qoXwl6X/5EBmgduABc6v7RYTqWqznF2Ylbfa9TqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeQQw+LWayfS//4w3UInhen/2al+Kwd1vviHsmup0EAc1YxAxsZhhri1yKxgjrHfKOExN7fGrV49ZDnOxDE7+34Gs+LIC5eUolviB5I77xbP2xD8yOtwkqYpB59okNhsYtGXfnK8oN06Qx7IK0wP2QX0R4gYt024W9X1nkICb+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2GfBjLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NATlTPT2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxHDq391231
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7a8FZgAvm2jtvI2nBoVIO8e
	/0jyCPrf9wufDVot4/A=; b=D2GfBjLYdRe1tLMLQF1YWlnizNBaOHEkRx8Eg8HC
	8dqKiG/a6cYKufC4d7/iy2x37ogIE8KIpXQQfO1F2NRU6qKQn4/tBO76n0uSD4Wm
	XUKDZZEOFmxCMuTZT3qej0eBsA14+iBArEWGQelS00rbBW/QIOMaa1EmsSLG1Cxa
	2IhW1DVVHbARbDv8B0iKq5EWnnUvLk4ObT+O+2Ddfa8PaJhwE1eAozGbpxmTJb6Y
	+ss/uWvVSojTX6HZYxRQO/dlqz6hzictxXfreMihG82MUlqoRkf6GHy7ajLfuAVf
	m/6mudTI+I2j7L3uK9a+fr/NMbTnYg00OQsW1NekaM90Ug==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrr4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:42:00 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5be0d09f5fbso2872551e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341719; x=1783946519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E7a8FZgAvm2jtvI2nBoVIO8e/0jyCPrf9wufDVot4/A=;
        b=NATlTPT2OBA1sMfmqJiuzPUYyFa4/t+5WX4d4rgJARKf2k1UXi/4nbv2qDEcmrhigw
         3D9HJWLzs/vaugtNy+5jT1cmELppi00oApJPXRfMB4xoBRFIdbQCWgPw/AmRyx0vaf2y
         cfJl4bl4hfmQpZqDbfc0N+UxZx0M0jWnIDSyneNg1OrMKeT4UUZ/3kgGU9+DgrSdsLp8
         rFIaonLjin8NHfxDW3WEx79vFGj+6n1cfoOE56ErDFwvWLx4JIh8KJWMdwfpLPKRfwBv
         V+tntSFCP4aEn0G8GwNDGSTZR7hdQQFnpKAuAt9eT59jfs/NXTgGNRD7aXHD/1voROQR
         ISyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341719; x=1783946519;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7a8FZgAvm2jtvI2nBoVIO8e/0jyCPrf9wufDVot4/A=;
        b=sjvQgHamkhDh+TaRokNgRaf8fMbQuSSQuDCQJmL1eQ0i76D2nFiM4Swtr/z7/v/1cv
         3FM74YWOjTwO1Eu/W2MS3lK+Ddr1Vv7aUTuyaWe9RO+ESn5UFGHDdb4ZRvGmRQ8AvYNV
         xlGfNN0DGmzUb2IZZ14MYy0vkuw2erm5skO2JAicSnC7ebh/BU2BT9eFjC+V1gVqIhB7
         f6RV2cvLKUwVUHxDj1IPW9xE1LZIZog12VgrectIA16SQiFdb+rkWNMnTfDrqvKjDNrM
         VI3gNCigspOJZdyzWrh9T9G1CV6HZ/RHy0mGMLTVs6QSe++7uCBfSmGE+DR26KqMQNEW
         wb8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOV6YXm7Ew3X4PpCrxcD38d+zaNnJNihKnMtPJwph2WIkXZ/bzjMOwCxPXJ+hd+21mdo93QwTzxgi7OqDU@vger.kernel.org
X-Gm-Message-State: AOJu0YwBkb48SS3iEwvQ5ud+v9McTrn4WGLjBlHAOtST6pHmiaEXFDUJ
	n4SZkC1HzpytSjYJCJt3RQ+iYR46wky7lyMoVMR9qH9ZobpNSOoyZmmbvitC2zamRk8j2aUOC2t
	8I3Ku7Ymhp/PuAcQg9ANBWz3w+o3G8lVt+dEjKZsLzNQnVi4gAcf6cp4LnlFRcC5+4BgC
X-Gm-Gg: AfdE7cm2EDcaTkS7dMmgzyVJlz0yZHq562FSRkksmZEt4ea/MOK29o9jbjf7XaKBncz
	jyr/dCDGk39UxR2nFs+N2M1LD7sB/PRZEObkQJuKIKKq6J/J46qVSXgf0H5RAbbWpM3I7bXrlgy
	eB0Hl6va1xBj9ItxZgpzYAUTcUOespTo1iOuGvy6XgK/CdP8p4iGj3EFMvCwQxTc0Y7D/ewnq/u
	a6pJ5qoJTtCTMF8oD9Qn5vZXs0qrY9KgjAq2+2L0xNHHWJDUUmR2cPgqNY+jSdVKSpFMRqTIn3M
	jlxxmssbgpYRGdgbtwefcrc5jIGU4klLwrx+PoRHiw4QYV9M/umYNwcYickiGDHxAEi2jOBFx2A
	zFtDnBJCwrlvshwrTUjG6Yjh5NhlVtOddcOOzYrvkMPoM2gGkyn9xrYExrK0S7j4Ghfofs8g71T
	9xq3Wa5D/xpuAa5aerbEDbFx+W
X-Received: by 2002:a05:6122:1809:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5be8952c6d3mr190086e0c.0.1783341719168;
        Mon, 06 Jul 2026 05:41:59 -0700 (PDT)
X-Received: by 2002:a05:6122:1809:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5be8952c6d3mr190070e0c.0.1783341718729;
        Mon, 06 Jul 2026 05:41:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm2849659e87.46.2026.07.06.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:41:57 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:41:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
Message-ID: <7agyvdlmpnvvjnhigs2plukv26johazvxw23qg62v6eroavkih@dz45xwot36mx>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: 1kQZ3nGMfvFBVbYT0GRy7Y0YCGBwKwry
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX9dbC2qTu6p8c
 s4/mII4Wbmj9WDEDHqX+JqNRxD+LmmsuTCyc8HyVZqc29riHPr6o9kJhacxGAlLfaSoq75kz/ao
 G5F1ro/ozjBDyf34/O8ldDuv4ok45SO7+ocNsA9/7Fq/OJOPi/cROvInvLokyTEa+rxE8mxdfg+
 E7QxboinVTTf7kq+BTJP/c1+rHjXFi+AosQ6r4DkHL5xIUPYW4Wly7exvfpHKTgV4Kw0gSjx/sB
 NE0i1krzW4RCCFkXB5LTVOUEaIo+DRa4L6WHw0AJ64XQ+4655zxclvsDRAIUH4gV9XsaJYcW39z
 DcS0HX+BZmGOaKlqQosudEpl3+6ms6ijHqqtt5A17qREmkfSF5kLO8CiORnSgpY1hC1PXB6gS34
 7H8rwuIhSr8fJoM1pCs1la3Y6Uj0Y6cF/EirvNqlBtFgItKID6d2ITlhBO/N4Ae03diHC66V3py
 Qy8eiKfS314VFXXx52A==
X-Proofpoint-ORIG-GUID: 1kQZ3nGMfvFBVbYT0GRy7Y0YCGBwKwry
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX+CHGbkLZLOc/
 OV44knJNPE17NveaGzapX6M2wNTWO3YkNFxvR9ydC0A48krq7nn9LbESNntHhc6vW+4mGiUU63f
 7GdX9hJDilJrItLMNKajxgSjsxcMC4g=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4ba298 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=jnYD6DY7q27B8yBxuWgA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116805-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A60BF710A93

On Mon, Jul 06, 2026 at 10:11:09AM +0300, Atanas Filipov wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Use devm_of_platform_populate() so that child nodes declared under the
> CAMSS device tree node (e.g. OPE) are automatically instantiated as
> platform devices. This is required now that CAMSS is modelled as a
> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..95e655a8b6aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_domain.h>
>  #include <linux/slab.h>
> @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
>  	if (!camss)
>  		return -ENOMEM;
>  
> +	devm_of_platform_populate(dev);

Don't ignore the error code. Also, are the children ready to be probed
at this point? Usually, it should happen _After_ the camss is being
fully set up.

> +
>  	camss->res = of_device_get_match_data(dev);
>  
>  	atomic_set(&camss->ref_count, 0);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

