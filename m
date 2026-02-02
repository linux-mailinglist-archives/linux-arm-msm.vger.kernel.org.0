Return-Path: <linux-arm-msm+bounces-91507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFCqFMO6gGl3AgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:54:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA893CDAE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 15:54:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B93303063753
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 14:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B64372B23;
	Mon,  2 Feb 2026 14:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVOzYKe2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1737107B
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043597; cv=pass; b=A2Om7RPP69cQ9T8UAjd8KxkzQwq1UG+raNeXsu4bZrmZUZGsDQorWyIr6u1Ej2Pq0T7Kv8lCDChIOJ3Es6p0YWvopE3cnYqSDZ6Ejz479M+SY4jUSsLIP0T0tE/2EbPdN8FYLsjHEDELq/lUcGWPDXh9xLv8kIpaPn/xKruswck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043597; c=relaxed/simple;
	bh=6wKlGaF+HJlYg3oYlybm2siLLYbtx8o9sW8eaq0Ny5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJURxRPh4bTg/wN2lKmEeW4/7ytpophEy74ZCdPmN9HS1oHFEPLcZqtqNwCFDtZQBkU8RWAa0Cx4VHyAa67amvUgrPZfRmxXzZZNdbiitwk08+izPSj3k69j04SQbc5aLLD8VYK0TzapCDF+ScU5W2MkCKz3APKpW+lGQEiSnEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVOzYKe2; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd22b9895so5913239e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770043593; cv=none;
        d=google.com; s=arc-20240605;
        b=QlGX8aXmR9akMuNCqWv/+siafiHxaeytV8paiAW4SKMgBMwj67HKPDCzxxV430xzQW
         Rj2qpVXRnV/1+I1M6oDEvtJolAc83sAhMzBZI1AH2vtRVK9PLfj4WEFsCg4O+n0aU1tP
         l/MeqycD8txHsWV6QREFHOsPimBzk5PPE1RsGMudw8zDs2Zzl32yfGJtFt1rys9samK1
         fmB611GJmd0Bh/fb8D35UWOCAN2zrv1JoIEqD/a411nUMJF7iusQTduG0OubhvYZfZ8h
         Hgs09ES5frylqJ0U54QiZmlhV1hfvasPHdL7N5zHEaOIcEqcnWN2nuu6gx8C00SpLCma
         S3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        fh=3goVkb2iZ8xT/4S0IaLS5VNN3f4owBYPwac8/+Cfa6A=;
        b=AHZ+W50ETPQmoFGwr4fn4ksz3+6DJPAHUMSqDTntEPMEUn0XgtS1yvTjo03iHWptTC
         UJJjZRAxlc/pKFdcnpNsYuyfCy9ej91bqJ+jD4crSBcany+DGrJPbTd5FH8Pzs8/DMvn
         BZbeqjpdKXYOXEqcBe2lfTg19dySpDwHEDqWd1LnY38hDSDjGFxagoFQNlLF7wdp0Wha
         dpB9yNNn6NQvROIhi7ARrb9V0UpcC35221xhCQac40i7J0TqhjjmbH4LlYcV8HE3YE9b
         LIpEMyrw/uSmfzTOwC/1prgBdpSA2KpqtkmIH/T2E5onM8SriXLExOqShGxKtti9nBLT
         Up6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770043593; x=1770648393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        b=fVOzYKe2l2RRcFW+Sf7fGimY+tIcvF5zBMwbbs7M+DLbk0mH85UpGR3Jws6hsrL7ZQ
         gjeXyI2CZajzK2NznroXwsu7OdOwiwaT56j3YR/rIVcCra3Zep39byQ7bXnbiJgnA80w
         c03KOxxv6aHSdSZufwhXe7xg6221bjbExrwu/ii68LoBcV1FpXGkalsGpn7Vyti7RrQ9
         OeJpYNhAXBcR7UouNnwElYV5VJVwN3HcRVcsVQnJUiGTcY1afNNjV+z4S0KaVdj4poUJ
         bUMqzXekNZP8KrUlx8w0xMn8F404sCfaITXKzIbS5WU/GF0hxeR3//Epw7itz8PFJ5RU
         0g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043593; x=1770648393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        b=pR02Zh6fvAb7Aac6718TyVrgZoq3Nw9x6vZCV996RlK2aAx0Oz2EYqg7gXt1BhbtNr
         vXXNStccgnO5EhMwEXuMh+MLerEx4TWFDZNkiz2mJ61lpiU++czp9rVJfVx8VBDNEuz2
         mv9If/eViQeoBlvP+YoQXkG04eKBZLzPfFCQYEnMQPCFHuO0cX40H8KwIG96OSdkY2Ur
         c+FV6cZM2mAsZ6U1x7Uunu0PUKKf6mDTpzjx65+8wooTiguHGIdQtF3t2ghU2DEPE5n3
         J5cvK4patLIJbuhc/WnHkaCCxaCTCrEy4F285GykiQdiGKnprqyLc/97Z58M1FgiYt9M
         qJRw==
X-Forwarded-Encrypted: i=1; AJvYcCX04kV0enQ1UOHVr6nx93DdrqVxNq9XiC8iY82wvp5IGBzAXJMBhsXHP8NmbWTBtBPO+zxiE0qDejPT90ng@vger.kernel.org
X-Gm-Message-State: AOJu0YxHp52aeGdo2Ye302Wxlbdmd4mjhLifAJAPLZ/u4eWz+WCTwwE6
	UbmM7wcsNVMlAfYC9JB8szjVGLhMOALtT+v330ooiVOJz/z4MYp0KK+MFsLdc8HLPaD662X5ReC
	2+jyX8YCbMPP4pvLMWFJ1Zmmr5afiaNtE8+BqQmynmw==
X-Gm-Gg: AZuq6aIvlI8lnADLzkBElQfxXOQkD/xSRT6x4we9g01iK0wUfeQYIGYwmqoS798gwdO
	/DIx9WxxFcRrYiXV3NjNjO6NwRx4TATFWaKkLgS2CXkEKyfy3mvSCKY3CE1qcWTEFNI7hvB+Oda
	EdubXrf0mKiRcniToWoQ18gubs0ISz/smCbvR9H2/+p+EWYvR6DihanAFNK+Sh7xNeWdL/1Lrgj
	Kso2JK0m/5AYThK4FVmiE309lkRtsFPF5rDp8YjL2oXaul4Gzj6GYpOZlJvksw5jbUoXU3k
X-Received: by 2002:a05:6512:3d07:b0:59d:f1c7:3e02 with SMTP id
 2adb3069b0e04-59e0d88d299mr7865289e87.1.1770043593213; Mon, 02 Feb 2026
 06:46:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Feb 2026 15:45:56 +0100
X-Gm-Features: AZwV_QhOzR0E6k1IfUGRMUbn9MQFxH_pvh_89KhmlNk_aUHzuxVlk0zPxkYMZY8
Message-ID: <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91507-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA893CDAE4
X-Rspamd-Action: no action

On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> As pointed out by Konrad during the review of SM8350 / SC8280XP
> patchset, Iris aka Venus description has several flows. It doesn't scale
> MMCX, the frequencies in the OPP table are wrong, etc.
>
> Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> stopping it from being overclocked).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Do you want me to pick up patch2 for v7.0 - or what do you suggest at
this point?

Kind regards
Uffe


> ---
> Changes in v2:
> - Fixed example in the new sm8250-videocc schema
> - Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (8):
>       dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
>       pmdomain: de-constify fields struct dev_pm_domain_attach_data
>       media: dt-bindings: qcom,sm8250-venus: sort out power domains
>       media: iris: scale MMCX power domain on SM8250
>       media: venus: scale MMCX power domain on SM8250
>       arm64: dts: qcom: sm8250: add MX power domain to the video CC
>       arm64: dts: qcom: sort out Iris power domains
>       arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
>
>  .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
>  .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
>  drivers/media/platform/qcom/venus/core.c           |  7 +-
>  drivers/media/platform/qcom/venus/core.h           |  1 +
>  drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
>  include/linux/pm_domain.h                          |  4 +-
>  10 files changed, 140 insertions(+), 46 deletions(-)
> ---
> base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
> change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497
>
> Best regards,
> --
> With best wishes
> Dmitry
>

