Return-Path: <linux-arm-msm+bounces-24874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773B923C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8D3B2876B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B226015956C;
	Tue,  2 Jul 2024 11:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PX+uurSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155D3381D9
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719918627; cv=none; b=MHUT29xh3//4lxynOYq8GRvj4d7ECZ1zkYY0CAktiO6b0p9lrJMcFYrV2QcQX5jtP3prX2pJRf4TvltTmry2v3Q5J36LOsd4BmOmAwA9t6glSau34e3LvBzmJdxFvnij28BBH1885JXd6cd8Nq1KHrJjgvdvw5w5R0NjN7JnD0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719918627; c=relaxed/simple;
	bh=SfEjw4cFfxixrvq6qtIfO/ZWv+HyMAbCOPeV0PYn3fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwwnlZksatofxTbpqKRxO3vfGU/1swvZAtILkkFJD3UeScfE5WfbfKcNCBypKZuLPmKbG57bzJRR6ihC4XVTpdIxiw6gfqlKtcHtCt3jnmj9mDQ5nuLSPtU8viLd6e40t7DbAks+7CRo41Lj/UkH5R1XjAw9b//Bh0fszhyyknU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PX+uurSk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso6114969e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719918624; x=1720523424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GUL6InU1s2oamDAjQ14QR1sgjo5CD0g2L+SSERlRdFs=;
        b=PX+uurSkYHA1OXCMSJiiocGz/VMb6MGfNCpF9I17uoPpoPG6CXxgi5NMmn02ea5UiC
         UmGyUuKbwePN7euLN7YLoRTG0ZJ43SIhKLyMnzZnG93mXMzM0zrkZkZTK84//LLAYrOn
         fKn3OUHgPByZjw6vrwr73varjOKs4lBK83v9l/KkWgraRvLgw/brJz/+DBetzxe/v33n
         JC4MXeaSJ7XU0+aYgLx8626K4HXBi/k89ZBlSTlSXlcLaujLorWpUvGmnkCjNP4Wxt3i
         waayR4dzXvH2SB0kyEggRy1eH9QccRjngkEIsKwxU6E1U5E7O2GYr9DxVbbRpqeS1BMq
         i05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918624; x=1720523424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUL6InU1s2oamDAjQ14QR1sgjo5CD0g2L+SSERlRdFs=;
        b=n8eVcNQiHEvCCe+Ep3y8LLg9IkDxWRUHCgDkk+kzx7MBOnTcc2ceYmz3+vrpApe5U6
         7UCWl1QBiC2QmmUfBGwweTF0MDWKo7LpRGvZpLRpBQh506gsEuTYWkAivQI1/oD5qegQ
         ySk0dQgqFWTc0Tvu4iuifSyrLwInAkdu6HSw57GekW9YswupC5Iq8DJ3t0yAoFpC5sJ4
         l7ORXzLk489Qo3yMfXE/ibYmbLcPt9XPo+Ci0m2Bmec2Hqq1IwsRwztc4DfNTwuUZ29M
         nwBsSRenRf2Uo6Hsjn6PiHVGwryJiAfFkW8XyhNWlwcXDJ9H4XE0B5xuxKLtoUKUJljA
         /9wg==
X-Forwarded-Encrypted: i=1; AJvYcCXI4p7zXw93yL81W0f35W5SMnv1zkr0fpLoIbv3qWJRCKwWkKe5+p0KlpdMYn+r1e8HjW6hGPBrvJ+rN7h+20zCWBfhb2RmT7kbQem4Sg==
X-Gm-Message-State: AOJu0YxeGvlV3nE/5wUtxqap/PUSe+xOZ6x2+dANOzIEB6Wr50nHxUhX
	QTRUMV2w/knZ11cdoPzQr7kpL62Gj6sbKvGhBHLsNGSgtak2VVCya70yEIcCjg0=
X-Google-Smtp-Source: AGHT+IHsgF9I8uZJmqTmWCz+zNt8GwFkL2X6pxZhrZeGft31aGGDWcnY7hGJ7WQ7OHecVueU0YVRJA==
X-Received: by 2002:a05:6512:3996:b0:52c:a1ad:18bd with SMTP id 2adb3069b0e04-52e82651a88mr6252854e87.6.1719918623990;
        Tue, 02 Jul 2024 04:10:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab30a68sm1775997e87.242.2024.07.02.04.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 04:10:23 -0700 (PDT)
Date: Tue, 2 Jul 2024 14:10:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-hdk: add the Wifi node
Message-ID: <he7q4mzj7u7t3c4pndu565m727e6hqpf2srrqgbdltjdffugdl@x3xrwteqpki3>
References: <20240702091655.278974-1-amit.pundir@linaro.org>
 <8ba07bbf-e8b1-4244-882b-ff2575368b20@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ba07bbf-e8b1-4244-882b-ff2575368b20@kernel.org>

On Tue, Jul 02, 2024 at 12:42:02PM GMT, Krzysztof Kozlowski wrote:
> On 02/07/2024 11:16, Amit Pundir wrote:
> > Describe the ath12k WLAN on-board the WCN7850 module present on the
> > board.
> > 
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> > Kanged verbatim from 490812872449 ("arm64: dts: qcom: sm8550-qrd: add the Wifi node").
> > 
> >  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 97 +++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > index 12d60a0ee095..c453d081a2df 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> > @@ -279,6 +279,68 @@ platform {
> >  			};
> >  		};
> >  	};
> > +
> > +	wcn7850-pmu {
> > +		compatible = "qcom,wcn7850-pmu";
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
> > +
> > +		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
> > +		/*
> > +		 * TODO Add bt-enable-gpios once the Bluetooth driver is
> > +		 * converted to using the power sequencer.
> 
> I don't understand why hardware description should depend on the driver.
> Either you have this GPIO or not. If you have it, what does it matter if
> there is no driver who can play with it?

Then there is a conflict between BT and PMU, which both will try to
access the gpio (or at least the pinctrl).

-- 
With best wishes
Dmitry

