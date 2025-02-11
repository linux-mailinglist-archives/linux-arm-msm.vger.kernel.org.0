Return-Path: <linux-arm-msm+bounces-47633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B024A313F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 19:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9243A227D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 18:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874201E231F;
	Tue, 11 Feb 2025 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIcVLdU7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818371E4110
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298097; cv=none; b=MbW5s2Qnz0e+5ySkBC+GgADTGKdrD6rcES7h75bIcZdnLqQMlE0J2hcK7Z1rDMK2zm+CTcRgCApWt21ap5K8GOLZfbtnUa22guq+0yGuoXfEEvvDljDG/yVfNqLlbZ0XyrayMPsEweFr9PtrrM177TaF4KZUGykD9dfN97srOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298097; c=relaxed/simple;
	bh=yHzpB75qrt6L9V798dzn3nFGVe17ID9Yz9uDWiN5boM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQDsl5xRDkwGocjBkyqq/UXc7L2cBX7bLXx2vFVQNzz7DDyJtDu7uwvm1iWSiklL2OEiVGcaPl/9IIoBq2L6aF1zPfABhFY/k4wrOWP/X/uRE46e+uNZs5IZlWvXbOAo22t73s4HB4UngqhBbLrxqcIeV6bRJM5KKKSeDiFMxtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIcVLdU7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dd0dc2226so3326009f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739298094; x=1739902894; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltM+a2uxSbqNoll57t/hl+Ny/dwW4fSjhIoNqgR74iw=;
        b=tIcVLdU7FyNx7JJwMtMB2sVdwIH3hPTSeIrA2vXoux4AEZx4LJ9jDMRPMHIax2dWhB
         D120pHi71LGWs9iMtCAWuseBi7iE8s7FaFaoxiwxlXXr5cNgCJs8HIJ+ThDHDHnH+up5
         bLbthEwW+FMcXbFA+7y5RCpnm604YPsLRN8Hcsbs9yT36Y8g2jtNe2YqcOdrASo6ql6T
         RBjYmGR5GmDjfNtsWUxN4vjQeApM0WCJkDZbOqJByp7Jpp1xuMd0EMX+Yh/jpL6poNWz
         evTwbKc0x15XEtNq4WgZ1ZRa2kHMOsfxvLIuX4JmFKyd5Dfx1gNnGZzcIUPNr0+ZP/tx
         g1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739298094; x=1739902894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltM+a2uxSbqNoll57t/hl+Ny/dwW4fSjhIoNqgR74iw=;
        b=VVZ5/FyqQb0Cbp3sx5h8xBARxizQzLazqBaGqRUSRHhKNeu7Xxiplj8fEuaI5q7UnQ
         AzjV4NFaibbHPi1pdGmp1xNDVjE/2NODvEx3Hg4GaoBPCeN3ChJ1KzQa+/xjyIleYvPi
         /oED1ovL2ulfdTHARP0p+NMqNbDHWJXtEkn42OdXKWvgR8BkN6otn3r8swmjfcYQRIKW
         6ThVsGMh410hovALn6szqSA8mMx7reOzHkGW2DQ0LNxiMiWCMqoh+bXIxU98klgXwmdN
         T4uJOJZqZ0oRIjOEOpg0s88mjZtfWSSVa6PScYboIZQ1NRBoRfocUWx2T+bo1vZHWUzn
         eN/g==
X-Forwarded-Encrypted: i=1; AJvYcCWeJ7+tVVmWF7OJMPFX/Qo1/Vh1u7TdORcOTEBXFUrHoU4XppNXsV1xJX2f44CtuCYVFgfVidiUtTIy14Th@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+1aM1pL5hLvPn8yol3bDih+h9CTEsKRreACroAR9Uf9TeivX
	ZqFVww7p5Ng/YqTQ/I//gyJ5OK6zzvJ+2VBa7Q9Y3p7RFiAyQTCpG4XTZ4YACU0=
X-Gm-Gg: ASbGncvrRAJHL2dCKkBf19q21atJ55wPQbMY23dBwydOBo2fv/dpe6ToJfxr3VvELzJ
	bmIQTdM//V76if3ciwxSSgpz1QGgiYeKtXZA3xHkX2r6/A1teld9gqEvv3ye5H07/E0Ax+BnWFY
	fRG7GEdMxcbvJFsUCEOof0hXKuATAh40FLMwPtYOyV67dD7l2ScvwpNHuHtCQwqWr435Sg0/hc+
	ck41OBX1HFbwpfFFh7sIL4kYhiszurvFB+Uwkl2yX7zYEA8WF6DlsLhZr/kbXxQ4bcIoscZ+Tkw
	5oov09Y5KLDZS+/mAdCgQAUabg==
X-Google-Smtp-Source: AGHT+IH8s48al3LraqkT+TOIwA1K8sIqTbw55FOvBNGZc+9PMaUyZNyKYXua1A0xWaVLj5G742ETew==
X-Received: by 2002:a5d:47af:0:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38dea2ea1d3mr4453f8f.49.1739298093651;
        Tue, 11 Feb 2025 10:21:33 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:70a:7a19:231e:65aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcde66729sm11842301f8f.81.2025.02.11.10.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:21:33 -0800 (PST)
Date: Tue, 11 Feb 2025 19:21:25 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <Z6uVJeQd1DXFFHG1@linaro.org>
References: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
 <Z6txevdftVNww0wD@hovoldconsulting.com>
 <CAMRc=McApxN7TKKKAL2OmfkosKYA9gCYZXQZXFAE_A9a5qykmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McApxN7TKKKAL2OmfkosKYA9gCYZXQZXFAE_A9a5qykmw@mail.gmail.com>

On Tue, Feb 11, 2025 at 06:51:02PM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 11, 2025 at 4:49 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Feb 11, 2025 at 04:01:56PM +0100, Stephan Gerhold wrote:
> > > Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
> > > combo chip using the new power sequencing bindings. All voltages are
> > > derived from chained fixed regulators controlled using a single GPIO.
> > >
> > > The same setup also works for CRD (and likely most of the other X1E80100
> > > laptops). However, unlike the QCP they use soldered or removable M.2 cards
> > > supplied by a single 3.3V fixed regulator. The other necessary voltages are
> > > then derived inside the M.2 card. Describing this properly requires
> > > new bindings, so this commit only adds QCP for now.
> > >
> > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Rebase on qcom for-next, patch 1-2 were applied already
> > > - Mention dummy regulator warning
> > > - Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org
> > > ---
> > > The Linux driver currently warns about a missing regulator supply:
> > >
> > >   pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy regulator
> > >
> > > This supply exists on the WCN7850 chip, but nothing is connected there on
> > > the QCP. Discussion is still open how to hide this warning in the driver,
> > > but since the DT is correct and the same setup is already used on SM8550
> > > upstream, this shouldn't block this patch.
> >
> > I thought Bartosz was gonna fix his driver...
> >
> 
> This is not the same issue. The one you're thinking about[1] was fixed
> by commit ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on
> pre-pwrseq device-trees").
> 
> This warning comes from the PMU driver, not the PCI pwrctrl one for
> the WLAN module. One solution would be to make this supply optional in
> bindings and use regulator_get_optional for the ones we know may be
> unconnected. Does it sound correct?
> 

The supply is optional already in the bindings. It's not optional in the
driver though, because that one uses the bulk regulator API and that
currently provides no way to mark an individual regulator as optional.

We did discuss this on v1 of this patch. I think you did not get back to
Mark's last message yet [2]. :-)

Thanks,
Stephan

[2]: https://lore.kernel.org/linux-arm-msm/f125c7d5-5f85-4ff6-999b-2098ff3103f9@sirena.org.uk/

