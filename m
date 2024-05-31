Return-Path: <linux-arm-msm+bounces-21295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 289368D63DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D3C2872C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FF215B578;
	Fri, 31 May 2024 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofrguRcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95115B128
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163727; cv=none; b=YNbA0B09fdovjEqy2X4DmlBDEG0sitd9bXEcjx8ypo3jQqD9qUS4ShdzluVhRlD27Msn4l7ZHf66wgWFMi1xW9dTYoFaiTw1nOstHTEcer2UZ0GnSbCS0llLRyIsToAwb1OFi1Arpt/370SIDXTKjJq8vZN8egYRwmcQHvONZS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163727; c=relaxed/simple;
	bh=lyo6DoR1T47qw0s/zUXANvIo/0bRhgyEL2X616cLkSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4jwS5lDTCCdx/TfxHQ1soqCrenXh7PU52ErlXpFF1pn7/DK7OIRlde94AYwrx/5RknTlOrPBAQo6siq/jL+x+YXh48iLwCQBsOuRubKMl2GzPzgQew69Wwn+QjZkJWql572zvQ/M7+uArMgpofhawWfKbeTYv08jR5GqIt2lo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofrguRcc; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa584ea2ffso1776545276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163725; x=1717768525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EvPGxkGeh0vxIaaLUFs5DBtrq2Asg0GG93EfMulcPz0=;
        b=ofrguRcciblAfm4RrCmmTUTuU8W+CmhZ7zVcvlnYt0nBmx5bkG5/yX2WaLt+ZUQa+c
         PWSct++9Vb7ZnPq0ciCFgrHH4eBGNDlkEbxFfrWxneW4NjdXsZ0h8B+xgw9V6Xwbtrke
         EeQvZS+jrKvU3ZQjRGIV0CcRQTXsNHH8dVLPypVK2gF1J1iJClYugCYUFV2M0+fqvcNG
         GsFsJ1heAfqYXHm9qHZDec+TpuxduRoqgNb2klCjuHHBWmLP3BLo8zDlb0Hp2mLIvjbZ
         AaDto9GNG727MU8JsK4VfpX0V6vhra+xo4EWyq9kYF0+K5N27sooTZqaUR4swuQiT4y1
         MMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163725; x=1717768525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvPGxkGeh0vxIaaLUFs5DBtrq2Asg0GG93EfMulcPz0=;
        b=J+X8GmrBWzlVgIxXdv+0XwncNCEN1mj1BNaK8Ud4ICwiNMG6ZqJiXShmH/5ZJGw2UZ
         13UcoNF8RyL8kH6G0ap4MmOlcDzyRdMYGMVV0KhA+CHBDdo095OPWoFT3zp1ZfcdZImv
         vpYaibJWFtBplqZi3fokAq9O1qBytqsHKa6UbgT3JWyS0GANlAKTTu4yXI5NbndvPyh6
         cu2MDrhBZIs/LKMOEa0/BMMnkXZXcLpyw4f5JJVBSGysAWAwH8q05twugS6dLWS0earY
         ouo6cVAClhCd9yLsFRtjy14pVnZbrG682gj0dPsJncN41F1+qtCSijl4GNWQDewRHA2t
         YjFA==
X-Forwarded-Encrypted: i=1; AJvYcCWXCOp4lCjteyqLcrh86u/HlWI1UsHw/juD4fQUg+RX52mTwcLIEhVnuwFRE8yqApflMwdnkHL00qPIUSXmeBha9ocL0tuk1i1M9NLsKA==
X-Gm-Message-State: AOJu0Yzoyjwr6WomQD9s6KsM2O/rByrF2Mlsvos1orxbrdjU0DcbsEPR
	u3pwBjIOcKYuH2jQJjZb1mWiv5g+4TvMQMPVI76DTvm/cEE/C+0NKSL2eB9jYmKNYvk+RhFKW4r
	d4Y/U3E3lkgX4b64or5htURQgodLn0eGgnaL6eQ==
X-Google-Smtp-Source: AGHT+IH21erP1jpR2j7HxT5llJ4qEM7NVaKsMbmmXcltTPpcKqkk2KCpxCJIHidQBoSw7GS5eD0GRKTDhNYblCXgoLA=
X-Received: by 2002:a25:ec03:0:b0:de6:d0a:ee3d with SMTP id
 3f1490d57ef6-dfa73c4f79bmr1823379276.30.1717163724634; Fri, 31 May 2024
 06:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
 <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr> <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
 <4940120f-d0bb-4131-a190-e1af0e75b47b@linaro.org>
In-Reply-To: <4940120f-d0bb-4131-a190-e1af0e75b47b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 16:55:13 +0300
Message-ID: <CAA8EJpoPed6TJX8kAO7YKMTwpxUKpfW8x40b+GW9owqHv8xhFA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	DT <devicetree@vger.kernel.org>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2024 at 15:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.05.2024 3:06 PM, Dmitry Baryshkov wrote:
>
> [...]
>
> >> +                               power-domains = <&rpmpd MSM8998_VDDCX>;
> >
> > Is it? I don't see this in msm-4.4
>
> Yes, it is. msm-4.4 says VDD_DIG which is &pm8998_s1_level which is CX

Oh, my...

>
> As for the PHY, it's a safe guess to assume it's backed by MX. Maybe
> Jeff could chime in with a confirmation.
>
> Konrad



-- 
With best wishes
Dmitry

