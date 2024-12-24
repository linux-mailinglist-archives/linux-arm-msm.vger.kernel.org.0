Return-Path: <linux-arm-msm+bounces-43184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966C9FB963
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BF8F1884813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD222E403;
	Tue, 24 Dec 2024 05:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="napO83ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9D17996
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735016757; cv=none; b=bf2anaQSVjhM+QyKH0ms8z2NRTb6ntkZhWqoBJFVydE+Z3ai8oHSaYiDik7eF/E88ucDeziaIfo1OrYKWopo64RH880FPRfLqOMISxsMD6SWNdf6DemMblcYwERTiMlALSiDfz2UhIbQZRaFxBe9vZj9OQtKZUy0uhbig5i/ihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735016757; c=relaxed/simple;
	bh=AE6c1qrefqGnS/VQSLkhFeTRM4NbWFb/l1IjpBGtYJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8GisGSOKX+RlGNRe2b93OHYcZOs9jdF+4YT/oy1ekVH+0Vw6AFe2rL3eoiDEbJQX9Npqzd67IEKzLgpOP1lV3MrvS6NsYdATVYoQQ4/sas07H83ha8tVzqM46gHg20zUvRViE8UFVFSIl1dQ7Xb3y4krn+LubmTgCMeDKj3k2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=napO83ag; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so5293316e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 21:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735016754; x=1735621554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=;
        b=napO83agt3lRC/k2biSEFORP8kdSZ6nSUiOxWvyYUyk0MDGXXM0IXCXLb2X0II8v7H
         +23dhWfCMXQs3Kr8Tt7/3gotuZKhY9HEE62/qKGBXMOl8zTOQBtVfpU08TtfSnuoU0ey
         i6hMd7s2HNqtCfwDDBS0zA0CDGP2ivsrXowdffEdKkOzCa+/1NFG6g9/zGyRhEeLzcpE
         hE8xKsezzN7CYLOMkQcRd0IwkNyksDE9wbSECFRhj4hZQEZQveFzt5vs9dozqz90E+x6
         qDw0JChHk++FCL4v5pim5HJOXH1lqBAYlhGjCmt8GH/NDpWbUkWtd7aHnMN9uI4iiMs0
         LrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735016754; x=1735621554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bZ29pl5gSJS83jt8Fiaphk1nrkU0+AOu6uXYR7j7EA=;
        b=rFzBpCEJnYKIa9SUXKvBr78VeKCGK+BqxH1BYORKu9erG6ZNAvVUme1BJ4DPokPGwF
         YhWkFTsO7rqB5TGQIfZd45Rky6whDQSdb25WTu2QB/VmAk2iVw0Ab2W2/LEFjdhoQXps
         hVj9/vVR+u9w2guNuSvziKvZ3Ff6bzhcM4q0pvxKwWPIjpxLJjyHzTssRCSiqHgkjBOT
         mCusLwJr/3oJLDodcRDQW6R8JbX5Ge7CrusOr/07g7PRdAgFLngFDw85qJPXiXcGt5Ql
         AkQvlco5ix11lcSovQUmw4MXOHS73wbE+gOdr4kQjTIsUVonEFX983PmEAtD+CT7BPHp
         77aw==
X-Forwarded-Encrypted: i=1; AJvYcCVxIhPROMnV8LMVOMDXno2wUWUxrsYTqyZAvEKzisy3YNnY4d4ExSOxErRdL6qtX/F6LN508Ow4yh9iudEw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/zm2hOrk1QyYDUOnNUCAH1SE5X060uMeFb8C8ORz8qyaSt5q
	Ge1nW1wKgmSyVZGMgOHrLJdymJV/IMjVktyFAnVVMkkX1ZFq5B7se2qFW04MPyU=
X-Gm-Gg: ASbGnctKFv8QePHU4od8puUGW3cvMv1GOOUoxqOPT/YmiKjmefdeSmjySrccwHrU2vg
	5iu1Y332ETh+jZ5s2H7ZGbDMwbWoxJTP6boMF5iyu7REYIxaWzq5gqH58w8NLiu3HTEODF/ZyRK
	REQTnh7Rah9t/6DYcB5b/nTOkynqn+7dmL0iIXQ+kTCCYqP0lAO6/tSUUhW74yczW9Zvn5DrPw3
	Bn1i97y5/fCsivK9If8ZLsw5KxK+l/xxyM4rnoL1sZmowXTRjE+upJGI/SKgz9VSepD0kJlxT0M
	lWwnbK1438JGPuB34b7Xgk57hVWcvQB6D2Oy
X-Google-Smtp-Source: AGHT+IFEQbqTtUHwKKMk91ZNCPcChoIwDJTCy518t9r4AD4nY9+X1Uvz8CG9rXE+5M9RXLCgiSKkQA==
X-Received: by 2002:a05:6512:3b08:b0:542:23b3:d82c with SMTP id 2adb3069b0e04-542295244aamr5324092e87.3.1735016752385;
        Mon, 23 Dec 2024 21:05:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238216cbsm1486707e87.216.2024.12.23.21.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 21:05:51 -0800 (PST)
Date: Tue, 24 Dec 2024 07:05:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-qcom-ethqos: add support for
 EMAC on qcs615 platforms
Message-ID: <htnq5jjxwbsn3fjc3m6tzvyqrwzckipd3z63j2dotkliiwnqgk@lifzh4q35dqg>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-3-000ea9044c49@quicinc.com>
 <62wm4samob5bzsk2br75fmllkrgptxxj2pgo7hztnhkhvwt54v@zz7edyq6ys77>
 <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc143292-24e0-4887-bc56-ecaceebf3d82@quicinc.com>

On Tue, Dec 24, 2024 at 12:36:29PM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-24 12:18, Dmitry Baryshkov wrote:
> > On Tue, Dec 24, 2024 at 11:07:03AM +0800, Yijie Yang wrote:
> > > qcs615 uses EMAC version 2.3.1, add the relevant defines and add the new
> > > compatible.
> > > 
> > > Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> > > ---
> > >   drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++++++++++
> > >   1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > index 901a3c1959fa57efb078da795ad4f92a8b6f71e1..8c76beaee48821eb2853f4e3f8bfd37db8cadf78 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > > @@ -249,6 +249,22 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
> > >   	.has_emac_ge_3 = false,
> > >   };
> > > +static const struct ethqos_emac_por emac_v2_3_1_por[] = {
> > > +	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
> > > +	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
> > 
> > lowercase the hex, please.
> 
> I will take care of it.
> 
> > 
> > > +	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
> > > +	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
> > > +	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
> > > +	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
> > > +};
> > > +
> > > +static const struct ethqos_emac_driver_data emac_v2_3_1_data = {
> > > +	.por = emac_v2_3_1_por,
> > > +	.num_por = ARRAY_SIZE(emac_v2_3_1_por),
> > > +	.rgmii_config_loopback_en = true,
> > > +	.has_emac_ge_3 = false,
> > > +};
> > 
> > Modulo emac_v2_3_1_por vs emac_v2_3_0_por, this is the same as
> > emac_v2_3_0_data. Which means that bindings for qcs615-ethqos should be
> > corrected to use qcom,qcs404-ethqos as as fallback entry, making this
> > patch unused. Please correct the bindings instead.
> 
> Although they currently share the same data, they are actually two different
> versions. Their differences are not apparent now but will become evident
> once new features are uploaded. If I revert to qcom,qcs404-ethqos now, it
> will be challenging to distinguish between them in the future.

Which features? Moreover, note, the use of the fallback doesn't preclude
you from addign a new compat entry later on. By having a fallback you
simply declare that the device A is also compatible with the device B.

> 
> > 
> > > +
> > >   static const struct ethqos_emac_por emac_v3_0_0_por[] = {
> > >   	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
> > >   	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
> > > @@ -898,6 +914,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> > >   static const struct of_device_id qcom_ethqos_match[] = {
> > >   	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
> > > +	{ .compatible = "qcom,qcs615-ethqos", .data = &emac_v2_3_1_data},
> > >   	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
> > >   	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
> > >   	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Best Regards,
> Yijie
> 

-- 
With best wishes
Dmitry

