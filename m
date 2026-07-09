Return-Path: <linux-arm-msm+bounces-117995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XOo5Ea+gT2o5lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:22:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C970731844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:22:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OXu46jvq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GXiHL7gH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C19F3007CBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AD4273D9F;
	Thu,  9 Jul 2026 13:15:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AF623EAA0
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:15:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602906; cv=none; b=mrJeynBP0s7STEyBdJNje6+HVJK3bTFSVZXKJY3COQuQ/H5PLJPBVK1tI/x8uZrUTJIbVUtOA2RclgrOb4H0foFqQLO4YlLX6h9mkNsOfQ4vVd4ZSqdlB5mljJXfgYmrLHIg9sWygmio21R300et+szeMxANNEzlVjLbeFf5cyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602906; c=relaxed/simple;
	bh=kxHs/fi/spj4z7RXMIsqSTpgi1AKBRAozmoZVIQW0zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqYTmy1XD/RyjIe9esVf/dX4SBJNpkCIYZLq0w7q4iZfE3RG0Qr5beYaUBZdLbcnbIYmiRic4jAEWDsRjZzF3q7EwqgEOq19pGoNNlqSxZVkH0pueDhI3hOqTfSKcLo4akNwWcPx9P81DnRHv7DzonqXTX+xNfGdLldZZKGin3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXu46jvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXiHL7gH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDH11628459
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3J+vb/d0VohjnsZg3ji4uSx
	pD8yDGTVB5E6yxUIvBo=; b=OXu46jvq4wPbLsTFXLhHI7kJAmJSfGxJAh+3/6yz
	ctSRQyiWNT0b8/uZ70rQ3YNBUCAX9soeEdCcUnJhzjPkhV5xxpR2jCYHcqXNoqnH
	Dok5BEdKtsQoxqFNTygCw9+TmA9u6/7JYU/9rS4SgO4Y7sW2DS7PXx83OU5mS4PJ
	xIZ5cOj0PgXW6jcmH+dzUWfUbAu6c5KVvrP5QkghbW+kuLOk8fvg8ksV7TnLT9dI
	f9TanEAm9z9PE7qRsyPL/spVajFm9LYKnDWtN5wTrzeOLrzRlXVmFhw7Cccgd9SN
	MR2N8PXmyQLr6Yi44ee3+x3Gce+V0FjqQX0X/mUs4UZKkw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvutra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:15:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-744e7c40512so188489137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602903; x=1784207703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3J+vb/d0VohjnsZg3ji4uSxpD8yDGTVB5E6yxUIvBo=;
        b=GXiHL7gHW8idZ6/WT9rajMjNdjy31ivaHTeMAb1BzlK5hpIt5c/+SjekrYpPMKh/xD
         r/Zt/lh2U+CLZr6otCQsxnQUVnRbyUM6nq/QnFIAFZZ/v/QPk7bDWLkkVIKD0qKXn6WM
         44WmtT7mVjtXgEMuS2hT2qWryicX7jAgPMqhgOkb7LvDwNfaXZznXv7CLb0ulSRIrB0j
         RsVA+6H2ObKgVKG3gm+SUIDhAJrBWSkbOIiiCoV8/0xnKSq2MYc+ViDYZnTHjWKiIZT9
         J0ehuukrddBFx/oc9hu83U9lgiiiu2BKzh0agShPlJVXkQfxdpdpwxS8nBQdMhCItkXs
         +kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602903; x=1784207703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3J+vb/d0VohjnsZg3ji4uSxpD8yDGTVB5E6yxUIvBo=;
        b=dQRrKqUEGXaVe9+pe+vgd0eBf2y95Y9u0pFyskrh+PZQTbdn6wyz9yaHOjC8MbA5SS
         HZiNIxE7NuV03kqDIxqJ7Q3F4HC8uuIZe1+Kzv30rV0LNvP7AagdAnAzq7E+aqqC77G3
         GLOXE0QJrlQXg4OANxMvSdkmdbSteSJsDE6rXxOdoOTPdQOf9G2eJGyiwe9i3dISw9EP
         b/sXAWImGQ9Y5bb2yfei46SP7tAL/mm1drWx3XHRojQHQqQhf9ACl+CQAPt/ylvY9MPw
         1hZlkc3PP35wPmY9zN9HifyGiIkzbqIj52QdFAFLPziApsEOa0rDOMjXolLIEBMml8au
         X5Mg==
X-Forwarded-Encrypted: i=1; AHgh+Rq25qdVAPITkWKRjfCW2Yw7IIlshoi0jY3F7XTJ1byNvTvx7urYO9GLCWR5ytg+bA/3yLzu8GW5dR9bf8/V@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4loz8yP/HEjqRhaVuT/x6ssTvMba3GL7H4AG5DYyCxXpPhiwG
	1M2ZHEfF/HL8emEIK6XiqmTl4LJj7AvPgICl9ETC/kh71OaUWhb85F8ZVB59HJtAUpIZTutOtJo
	6HkGX1SDi/Ob4FnteqZLY/TulPY8xbs9EeDk98lO7XFDxohAEqUTd8069dQV/XdQMv2UzS5Mdc6
	Ac
X-Gm-Gg: AfdE7cnVyw3+cNgXr0z+nwHkjAW4rlmeWU8gUEgOLw6ia6nGrEFqH0biwqUeRLB/ZDF
	Z3KixBWBTt6fju7j0bkZXxazCnoDllcSbVcMNq7ZQt13XPZtISywmo50ASeAj9KokPVxt3uN/p5
	iQUrIupMi3fFsDlc03SxPkwVZhiW58DUWP1mwbfmp0Ua97k1G1YLa1qZm/cjP1upW/XOTtCW5iM
	QJw1eEVap+wWFmCIUAKXDj1NjX9uKOWzzqHhQOgZEW2Hth2g05+dDCm1TvOJPz3f7tO4vvAUugJ
	NIX5uQrm0E6VYwYBYt3Gz8iNNN80vBotlp4MuW/yku6gNGvnQQ/0MhFRVxO7ZKUkjfSgTNECKS2
	XXvkSADmF9o4tUTQL5cHATU5LpvqeSlS/ddPt9B9dezaOWD9gUCFnzyzF713DYbEEC2nONWhkLk
	kux3oJLa0DNj5tv9Mcq0PasbML
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr4015022137.17.1783602903399;
        Thu, 09 Jul 2026 06:15:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1490:b0:631:af51:7d8e with SMTP id ada2fe7eead31-744e00d15demr4014993137.17.1783602902810;
        Thu, 09 Jul 2026 06:15:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm5179015e87.44.2026.07.09.06.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:15:00 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:14:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-pixel
 context banks
Message-ID: <osurkrrhqgkxtgv6lkose2n7ll5f3ofydl2gnjenogtyxaohvm@7ccuyiaeg2nm>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfXzPU295gnEm8a
 Qqx/0o0C9v5P32mC8FpDjyiC1oLN8K7K3sITJEbHnUROxKp6mjY6qVM6a5YL6dyzG4pUBwrGwcV
 e5xPdBbVg8vZbc0eLN+SdjImf/Pe/oo=
X-Proofpoint-GUID: lajzOw46FBTJa7PIl3ilik6xrb3PmYTS
X-Proofpoint-ORIG-GUID: lajzOw46FBTJa7PIl3ilik6xrb3PmYTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfXyNs7hxxseMeL
 2yeQgll/gQReiNvnakRaomtlr0nv0RnuAr6Sxk3GHedIyqP3jOUc6Q0VTjObl3xuATjSw7Cnu1l
 67XTTTjGUJWFjSpp7ZUe1WQjnH/WuShtqOnV0JnlgielS0V6WBIGi0K4QWjnrImDJYfM9WzAx1X
 hV671i3QFy7B1vPLpiOVBjMkNXYB1gn9oi6+BQjv882lChSnroK0Br3SRctygyNWo2odv2IxcHT
 QhMyNmA5p/m+QpHT/i4QVrF3Owf8Mz9+ksKH/0EVHvNtTI/zti0ayDIXFCaOBD+eu1Des/XA+Np
 +PR0FPktO7PDbde55JYmMAzpiO4ODSWIInTWi/rd6oC48i8gdtn17nj7GF96iFfc+VZ98au9lMG
 arPd22Th2RAYpbmsOnFmSVDbg1gE9iP3cKjONt2/3xgRbWFOJ3BKEsJJPCxFMqnYk7cJM0pkYAq
 V4qMMIXXznMbJZVyPKA==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f9ed8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=tcVzVmk79huRiCZlmVQA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117995-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,7ccuyiaeg2nm:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C970731844

On Thu, Jul 09, 2026 at 06:05:52PM +0530, Vikash Garodia wrote:
> Iris platforms use separate context-bank devices for the pixel and
> non-pixel domains. Add platform hooks to create and destroy those
> subdevices, and wire them up for the affected platforms.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  .../platform/qcom/iris/iris_platform_sm8550.c      | 71 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_sm8550.h      | 24 ++------
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  4 ++
>  4 files changed, 80 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc4390bc596f6239fefa2a2ad2cd3a2bb..fd6bfe7e786be3f8a4885296fb11ba430ded6fd1 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_packet.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
> +             iris_platform_sm8550.o \

No, it's not a separate platform.

>               iris_platform_vpu2.o \
>               iris_platform_vpu3x.o \
>               iris_power.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..bea904a9249bafe1dfa11ff39155d1930402bf7c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +#include "iris_platform_sm8550.h"
> +
> +const char * const sm8550_clk_reset_table[] = { "bus" };
> +
> +const struct platform_clk_data sm8550_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +struct platform_inst_caps platform_inst_cap_sm8550 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 96,
> +	.max_frame_height = 8192,
> +	.max_mbpf = (8192 * 4352) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 489583,
> +	.mb_cycles_fw_vpp = 66234,
> +	.max_frame_rate = MAXIMUM_FPS,
> +	.max_operating_rate = MAXIMUM_FPS,
> +};
> +
> +static int sm8550_init_cb_devs(struct iris_core *core)
> +{
> +	struct device *dev;
> +
> +	dev = iris_create_cb_dev(core, "non-pixel");
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev = dev;
> +
> +	dev = iris_create_cb_dev(core, "pixel");
> +	if (IS_ERR(dev))
> +		goto unreg_np_dev;
> +
> +	core->p_dev = dev;
> +
> +	return 0;
> +
> +unreg_np_dev:
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +	core->np_dev = NULL;
> +
> +	return PTR_ERR(dev);
> +}
> +
> +static void sm8550_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +
> +	core->p_dev = NULL;
> +	core->np_dev = NULL;
> +}
> +
> +const struct iris_context_bank_ops sm8550_cb_ops = {

For a long time I have been asking to fix name prefixes. Now you are
adding one more. No. Please write it as a rule of thumb. All new symbols
in the iris driver should start with iris_.

Moreover, there is nothing sm8550-specific in these hooks. Enable them
for all VPU3.x platforms uniformly.

> +	.init = sm8550_init_cb_devs,
> +	.deinit = sm8550_deinit_cb_devs,
> +};

-- 
With best wishes
Dmitry

