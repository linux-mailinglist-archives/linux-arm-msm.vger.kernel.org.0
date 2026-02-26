Return-Path: <linux-arm-msm+bounces-94280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PLEFq4ooGlIfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:04:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8C81A4C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 669253013696
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2E2332914;
	Thu, 26 Feb 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YYDXHf0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE3334C03
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103756; cv=none; b=ppro98wmE6ve+pUSa4rj64HCuBnZghEgz002do+J9mwComNHWUuoWi69WcE8UwsSMwC5R7kwin8EDFPQ+5T2PpjaAZJn41A/O49OIEau+vsCkK+N8IJaGRT8MFbmmxCKA5nue37PruuOIxsKU63L4Ibt0YBbw303P+eV39LCjPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103756; c=relaxed/simple;
	bh=H2+dfOzhoOTIvvxccl70tuUfbzSsTD6qNGOvprkS77k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLyDxOlKuQn0rtTVUp8HZGFuUR+DW4vs2g+gJnNX4Sxyqmdcu/MRIF8lhsjg902mzrfGHHQe9fVv6cISmUW+CKwhA4YbfkRJF9HQUnuvYVHLz2e7CAS+x4ECjXvAAaOrdUgWe7b0br0aOL3qf+NPAG/94SAUM/k6JxR0R2mBkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YYDXHf0C; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso4583935e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 03:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772103753; x=1772708553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRrLhQ0K1Tca3BJr7de/DoI63SU9uCMuh6bjyopMpZ0=;
        b=YYDXHf0CvBnw1WGPJESN6kEJYohokUTnMakryNd4SLA5N22S/TxfzkoAGrOej2bmRx
         483bvuNMKAw/Dnjz50DpbpO3ZrNYOdlECI9+z6cncoE0B88kKMrTcZMJy4wqVpIQkXpt
         vpvbxfNWFb74mTlIO7H1NJXBcyzBhiVgJlgOglmzRmZ3MVeGkOaK86W4LeEr7K2ddDDM
         UDUJdZznOsnvlXKHM1k91nF488Qt+bKTWVi34i+Puz6BaNkFVHiPRPfUjOiMou2f9IoM
         AzcwfjQcXS5BxPo1mMdzjH322fIzHGclunSJn+qFXVgTpZqgzFfrOwpzZnWUhSBVJxLU
         NiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103753; x=1772708553;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRrLhQ0K1Tca3BJr7de/DoI63SU9uCMuh6bjyopMpZ0=;
        b=ihfBAhAKGELbEbdLF/sSwL4/42PWzFqrJKPjVSgibWY81z+11cjH9vKPmXVbjwElQV
         vuz2o/wwy0rftN50K4S/Lzrbu1qs9Xu2Y5xDHyLedCO/AJZ4wkduQHiGYSkzaY1dYt6r
         eub8npdP9DzNd9YV23SO18TygZoSSSviqBwQQpekjkAgMYY1jG+mWaaE/xnG7jRASTIS
         tAzeCcAJ34Xtp3ZqPEm50kN9LQGao9aJUVCzg0sR2rYQ4YLsoNvAJ5BAGoxKzRm9ldyp
         5bL0UyrE4xb3PFJl2SJwJr44QW6m453C+BF514FqBKAtHB1eVDCFjCzt13ywFTgAwXNi
         vVNA==
X-Gm-Message-State: AOJu0Yw01jwE/6ROTLnL2ee2TRDkzmN2stNkABGEYCZETMr0TGxOv0wF
	5qjCCn+8dNiJrf0l5aYvCvpH84kOLIugxshDEbExageCIXJQAGkW1UsxDob1gvCv5ZzhPaN+NG2
	szkBa18o=
X-Gm-Gg: ATEYQzwvsOWmdPPEPGqGoXKdO3OSUcTXIGRocCjewawuyGJ3klZfcG2Gs9zRBYOkZZC
	Y+f4US1RydMrsNzgZXNKh1fuFuJx47bdmRm1+mRZ1p3jOjVNyS0YJY17OMsZ2+SsGcdoXSLXg/G
	KaR+SqXrKji9Us3CWsHPASpp2phPLtxIwwspAZ+F41whhv+G1uwItKJz1eFf/V8qrNEnDdTOa8j
	TTqqjJI6gdlHT5EiCEsIcfGEN9T4XyLAhjUSVsrMhurJTAnfU6SIw0XD2ZY4XK5NFHoevkQtcWZ
	bNMgYwu6B0Eg2GaF8w4fb9pDj6XadTCkypXwVR1dP0DVGxH71u8XzbNVD2YRfjS/Or8fiqHe+md
	Z+QYKsNjTtHkWz+4msFMC7V8RfkWxSdr6pBTfcIcyr+b0P/K2G2hsN9BoqHRQ1kU+VF2FerRau7
	uv69GgqXlGt2t6lsQlO1/L69GuICCdL7dIeKKm16eX0opbuRgFs50Jz/US0/iWEtMRiRn2P2ok7
	ec=
X-Received: by 2002:a7b:ca50:0:b0:483:78e7:ce15 with SMTP id 5b1f17b1804b1-483c33e9899mr27951855e9.13.1772103752860;
        Thu, 26 Feb 2026 03:02:32 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7031f3sm123221655e9.6.2026.02.26.03.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:02:31 -0800 (PST)
Message-ID: <72e46620-f3bd-4c19-b6ab-113707715112@linaro.org>
Date: Thu, 26 Feb 2026 11:02:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: Add debug message to camss-video
 format check
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260226090850.828694-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260226090850.828694-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94280-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 9A8C81A4C5F
X-Rspamd-Action: no action

On 26/02/2026 09:08, Loic Poulain wrote:
> Add a debug trace to video_check_format() to log both the subdev-reported
> format and the format requested by the video node. This makes it easier
> to diagnose mismatches between subdev output and the negotiated V4L2
> pixel format, as well as issues related to plane count, resolution, or
> field settings.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0c76bc2cc574..0852eb6f1315 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -218,6 +218,12 @@ static int video_check_format(struct camss_video *video)
>   	if (ret < 0)
>   		return ret;
>   
> +	dev_dbg(video->camss->dev,
> +		"%s: format is (%ux%u %p4cc/%up field:%u), trying (%ux%u %p4cc/%up field:%u)",
> +		 video->vdev.name, sd_pix->width, sd_pix->height, &sd_pix->pixelformat,
> +		 sd_pix->num_planes, sd_pix->field, pix->width, pix->height, &pix->pixelformat,
> +		 pix->num_planes, pix->field);
> +
>   	if (pix->pixelformat != sd_pix->pixelformat ||
>   	    pix->height != sd_pix->height ||
>   	    pix->width != sd_pix->width ||

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

