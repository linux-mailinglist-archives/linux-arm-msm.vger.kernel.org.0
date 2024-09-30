Return-Path: <linux-arm-msm+bounces-32738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BB3989B85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 09:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28B79B22439
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 07:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821E8156C7B;
	Mon, 30 Sep 2024 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jXzGXHR6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA0513D8A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727681548; cv=none; b=hcS1eIqfYGwRZDvAdPwjGzOIfJkNwBHIeznFmjuI8bkGgGlMwjTruxUwnchBBaxNFupdJR69q1dF1ANktlKzpoQsD4KQ7IuZsCYsQ3CRzpV7o9LnAgh9glw5vkLYgLlzRx+lftgJxtqW7UYcV/4AZhqdYjNaxKeAZLlmegbcTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727681548; c=relaxed/simple;
	bh=bENTSqqkz3ZWyvDIrqt4QXFA65BmGIjCfKWO5YLBmB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqHeJnwTiJZIYmW6mqR+aCbnxSXyIQSIWaXNXtrZpQTgEM3nyhEGMGb0Iehckj69M0TusoA3eY1S81+neibmXUL3rlU80L/iATJf73lQ2Yh9o1sbKNH9RLzXuroWg5BjVcCq4KoJFNeC7AMO4g6jqqUbODTy2li+m0LluM0p9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jXzGXHR6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso3412194a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 00:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681546; x=1728286346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4L8BDWjvT1FoY+aWVwXIIXuy6O1ffNNtpnMyJVSb/Ds=;
        b=jXzGXHR6rh+8m7pmjKXrV/ku/q6bjmv/HtDQzoStXJZXh5wXM3ns1DbyhvkS6+2Ylb
         a7yzO2DoptIKx0RZto3DR3sIs4OgulaJF5y/x2QDBQdkLN9jm7UgV16qDuSLKlXwfID1
         BHlbXi0N5TD7zhQ/r/9Rq8kqf6NBTfcYatnAtdf3hivYukoUPdizhEviftgqOR392SPj
         sw/63Dnu9PFfjxX5j+43+1F/mjZz5Aze21AtHkqogcDn7V182UiK8fhNSd/6nuSK12oF
         YyMlbfq43cT4K066fRx4cFG8+V+MS3IW1BoXG7MCzxqp2w688gWq8HRY1saGQ+TNdYyj
         HBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681546; x=1728286346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4L8BDWjvT1FoY+aWVwXIIXuy6O1ffNNtpnMyJVSb/Ds=;
        b=N1xg5JqOG5dNdp/mKEkM8bTym0lbieDMkYbqhwVEKhOARvl/awTSnMSzgIw81VvSBW
         Sc1conUNEg+CE5Ge6Z+yM9pWodtoZEshdn6lIlXXKMXjP2ldLM3Lx3Vy5SebyPxplfuW
         wI7GpOBo8p+Us3Y2ytuHLXMEQUvkvslElIsdynsz/Z4Fat3KFAriDjUe1e9KOMiIGhfX
         /250WJC6QifelIpzJr/YQH9oAUbyOTmN53dBzKhNMXBSeCA58lhffKDgjzTW7Qx7TLiU
         8WmsJg5HTU1vifNPcLwKbu1s7x0qbxgm449N+PGqRs5blPraMsGZULKn2fq2E9Q5q+Jn
         64+w==
X-Forwarded-Encrypted: i=1; AJvYcCXwQlFxIrTwsNhpPTZQA55n/xhRwZynk2Ow/D2xngjhWYDY4QT0Xk2l5vs65S+2dEYD+Qv7RpJMUH44/jv3@vger.kernel.org
X-Gm-Message-State: AOJu0YxnnNNCRJGqzgnxTLZICO6Kj6rlA94ripSV9aucm0ArMVOsvg5J
	ajoLmzeAYhhmDEU4P7n2aDsFWHPdqQYV9I4YQOWS3wLtfEWA8FfggVtK7jxCLA==
X-Google-Smtp-Source: AGHT+IEq3zoeTCqyFXtaJdMPaUJR4eEGYvl46M67ZjoepKvo2w8xVxGnJwKP2rNQKKJJSwuO8QKYdQ==
X-Received: by 2002:a05:6a21:3416:b0:1d5:118a:b53a with SMTP id adf61e73a8af0-1d5118ab69fmr7685813637.21.1727681545936;
        Mon, 30 Sep 2024 00:32:25 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm5630117b3a.52.2024.09.30.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:32:25 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:32:17 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <20240930073217.5vcg5codqa25xfco@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-7-quic_qianyu@quicinc.com>
 <9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org>
 <20240925080522.qwjeyrpjtz64pccx@thinkpad>
 <4ee4d016-9d68-4925-9f49-e73a4e7fa794@kernel.org>
 <2731e17d-c1ad-4fb4-ab60-82ceafeffbaf@kernel.org>
 <20240925125224.53g6rw46qufxsw6m@thinkpad>
 <1c6bf1a9-a781-4152-a7a1-7992c6f15829@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c6bf1a9-a781-4152-a7a1-7992c6f15829@quicinc.com>

On Thu, Sep 26, 2024 at 11:15:34AM +0800, Qiang Yu wrote:
> 
> On 9/25/2024 8:52 PM, Manivannan Sadhasivam wrote:
> > On Wed, Sep 25, 2024 at 11:46:35AM +0200, Konrad Dybcio wrote:
> > > On 25.09.2024 11:30 AM, Konrad Dybcio wrote:
> > > > On 25.09.2024 10:05 AM, Manivannan Sadhasivam wrote:
> > > > > On Tue, Sep 24, 2024 at 04:26:34PM +0200, Konrad Dybcio wrote:
> > > > > > On 24.09.2024 12:14 PM, Qiang Yu wrote:
> > > > > > > Describe PCIe3 controller and PHY. Also add required system resources like
> > > > > > > regulators, clocks, interrupts and registers configuration for PCIe3.
> > > > > > > 
> > > > > > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > ---
> > > > > > Qiang, Mani
> > > > > > 
> > > > > > I have a RTS5261 mmc chip on PCIe3 on the Surface Laptop.
> > > > > Is it based on x1e80100?
> > > > You would think so :P
> > > > 
> > > > > > Adding the global irq breaks sdcard detection (the chip still comes
> > > > > > up fine) somehow. Removing the irq makes it work again :|
> > > > > > 
> > > > > > I've confirmed that the irq number is correct
> > > > > > 
> > > > > Yeah, I did see some issues with MSI on SM8250 (RB5) when global interrupts are
> > > > > enabled and I'm working with the hw folks to understand what is going on. But
> > > > > I didn't see the same issues on newer platforms (sa8775p etc...).
> > > > > 
> > > > > Can you please confirm if the issue is due to MSI not being received from the
> > > > > device? Checking the /proc/interrutps is enough.
> > > > There's no msi-map for PCIe3. I recall +Johan talking about some sort of
> > > > a bug that prevents us from adding it?
> > Yeah, that's for using GIC-ITS to receive MSIs. But the default one is the
> > internal MSI controller in DWC.
> > 
> > > Unless you just meant the msi0..=7 interrupts, then yeah, I only get one irq
> > > event with "global" in place and it seems to never get more
> > > 
> > Ok. Then most likely the same issue I saw on SM8250 as well. But I'm confused
> > why Qiang didn't see the issue. I specifically asked him to add the global
> > interrupt and test it with the endpoint to check if the issue arises or not.
> > 
> > Qiang, can you please confirm?
> Sorry, I misunderstood what you mean. I only verified if link was up but
> ignored the status of ep device
> driver.
> 
> But look like this issue is because snpsys MSI irq is msked during probe.
> Can you please also unmask BIT(23) - BIT(30) when unmask
> PARF_INT_ALL_LINK_UP,
> like this
> 
> @@ -1772,7 +1772,8 @@ static int qcom_pcie_probe(struct platform_device
> *pdev)
>                         goto err_host_deinit;
>                 }
> 
> -               writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf +
> PARF_INT_ALL_MASK);
> +               writel_relaxed(PARF_INT_ALL_LINK_UP | GENMASK(30, 23),
> pcie->parf + PARF_INT_ALL_MASK);
> +               dev_err(dev, "INT_ALL_MASK: 0x%x\n",
> readl_relaxed(pcie->parf + PARF_INT_ALL_MASK));
>         }
> 
> After that, this issue is fixed on my setup.
> 

I did see those bits, but they were mentioned as diagnostic interrupts. So I was
not sure why disabling them masks MSI. Furthermore, MSI seems to work on SM8450
without enabling these bits.

Anyway, since you mentioned that it helps in bringing back MSI on this platform,
it doesn't hurt to enable these interrupts. I will post a patch for that,
thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

