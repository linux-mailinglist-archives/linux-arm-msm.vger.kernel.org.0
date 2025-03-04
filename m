Return-Path: <linux-arm-msm+bounces-50268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FACA4EEEE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 21:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F7C188E7C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 20:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0513B2641F4;
	Tue,  4 Mar 2025 20:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLRykez/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2347E25290A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121931; cv=none; b=ozG2q3Ezlov3BhKD2+B7vTNn5mSf3DmbZVojA4ZEH4y+A5EhWZyhsFl0dMSpAyCKt3jVWvjNaL5+kt0kRz3WH7YyzT8SxXJB2Kg48SqeAVKfKbQ5Hyi56kqkyTd/Iagt6zvqnZmjdRnkspPPQ0DGEABNlJCAT38iiBHNoN/gosI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121931; c=relaxed/simple;
	bh=5CJK1L3DdT2P27pS4L8DUKmYYJnFR7F+MB9nM8vDjq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwEzFMvOCJm8o35XyXpH/AVU3WigYKCNCkUh3Tqx8PvqeAH3hi0WnYzVZADgjq3X9iVIMo8ZQsB6+AqjYgHacluiz6FtWtB+MI+Qr8wf2ReRIXLDU4m8tpcEtkrsUdHRXwrnPukBTBdu0PDTGySqNYkA8Nnpn6aaZQ/y4vGIzDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLRykez/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-547bcef2f96so6897551e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 12:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741121927; x=1741726727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mmSXUaSzYlxPu2USBQ5qryQWG6hHSfkcGFhsLiuIng=;
        b=yLRykez/HSbsccAl3klZNZQqm+dTAeD/0VLjmeTb1XzXJfhMmKA2Ae7rqJV/9BPtks
         N1qgKKdfdzhkczmiQMbMZ1SHf0HL9vdL6gjqyt93ARiB8b03Blubnvg4HeDhsYfhpzYO
         KD4KDeNLRF59PO5NrTv6gYnakgnONv5NbKvsNoCqhBB56AWhiZZ2EIl3smVuLLys7CHm
         tKJN5DH8Hp4LlTDqvQk4LT6pezCVim5EC1ji5bGpM+mwGkp0IHRmmuFISvLNnGMn7Wqb
         rNU+EEUcnoZX3rwkRRWnRHPbucF3j9d3ojXhWK86YABn2x6el0JiNZ6+ASrDekC6IIk8
         5q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741121927; x=1741726727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mmSXUaSzYlxPu2USBQ5qryQWG6hHSfkcGFhsLiuIng=;
        b=FSE5E8o9NYxBjn1T9iwfwVC+Gb6nKgRUFSAN2mKoYRR0LAPvL7NgcGfn6Auk40pDA9
         0M73trvIc0GhoI6gJ2Vmkfw8NI3+WheHN1QwT0ygCB4o7SfgmvNrUzqbeHalqtceD2ie
         Osb7Wvp+FlKznE4ZQ0eDvXnTxEw23m4pdaxiE5Us32reenwCu+Ew441NMMJNEyY1lurl
         82s8qnKwjUV+ZBDtWauIOARN/kN/ftvoqxM1MVulbgm1AEwrmn4NDUwouqcT9H+LcnJA
         u31Uqi9Tttf6yVEmuNAyPLnv0e02vPJFWleiLPeStgDYPKmr2Zgw0GIloAsMn9P2islh
         sTYw==
X-Forwarded-Encrypted: i=1; AJvYcCVE6IRF45TD+vOYAt0bi5sT5XPL8KJvvhThjQYroAILU4sb+5Op1oz/eQicVBFWHEGCArIytdOJSJ8C/oql@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4U8MZesG91s4zm0McMciFMfuYlMyw8ycRic9LS/XY33wDCyPv
	fBpLrT+exoAMoZ4c0bqAZRehKVWMZRmv/Ee+VZiar+ufyojP5ROzi66y+dGwB34=
X-Gm-Gg: ASbGncvXw8YZaC+1A7UENweYb58SECzco9ww74+Mm/W9Qf6M+HEn09nGHVbwvM+e1Ya
	HVfg4+I5rAtr3TfdNZr6wwk9AxClACqW3OHjgUaZH2VviWvjq4XMLKqiMmSXCwGDpVvIuh9xg3t
	QT8ukHYdufjYe2R43lMHvXIEsCKlcVICE1cQVsl75b2k+quE6YLkoMZpcfwtELMHmmCu1V3EOAA
	abQEc0lnSnEH/aRlhbMdmPwFammru8dvrRb/kT0Qpoot9oTR847OWXde6yjBDpJSZSCxmduKXM2
	oWmJDqfYpNCQU25Pj2EP03SbHH8KQXomUlJGZeEoL2C4/tgnVJq+hO5FI9hE66+pewcjKu5zRtp
	8qwZyilaRKLPebD/Hcmry3xYQ
X-Google-Smtp-Source: AGHT+IEkteX/WZFejhteH6gRB1PUmIKU/gh7k+WBHiisHZu0Tfo1WrX2L4UA0SJ992cRS807pAM8qg==
X-Received: by 2002:a05:6512:1289:b0:549:7394:2cfa with SMTP id 2adb3069b0e04-5497d377287mr150803e87.38.1741121927123;
        Tue, 04 Mar 2025 12:58:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549591c8bacsm1132258e87.122.2025.03.04.12.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 12:58:45 -0800 (PST)
Date: Tue, 4 Mar 2025 22:58:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kaustubh Pandey <quic_kapandey@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_rpavan@quicinc.com, 
	quic_sharathv@quicinc.com, quic_sarata@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Message-ID: <7jupetl37t6nshmme5raxavvbjo3vo5eajusroh6j3ccdxnpo5@7qaz2nckghcf>
References: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com>

On Tue, Mar 04, 2025 at 08:51:33PM +0530, Kaustubh Pandey wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Kaustubh Pandey <quic_kapandey@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 9209efcc49b5..ba47786d6474 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -19,7 +19,6 @@
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
> 
> -/delete-node/ &ipa_fw_mem;
>  /delete-node/ &rmtfs_mem;
>  /delete-node/ &adsp_mem;
>  /delete-node/ &cdsp_mem;
> @@ -515,6 +514,13 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
> 
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/qcm6490/ipa_fws.mdt";

"qcom/qcm6490/ipa_fws.mbn". There is no .mdt in linux-firmware.

> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry

