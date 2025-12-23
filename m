Return-Path: <linux-arm-msm+bounces-86425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BECDA99B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E68C302831B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B85355050;
	Tue, 23 Dec 2025 20:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFPuBM62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A9735503B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521274; cv=none; b=GxTekaYw3/UnPoRDmDJjvDaN6fjKpvNIPVVAyZS4unxhKuSj4aumNzMiyAo5UW+t5+dhvbRXdHL4fgiNLk3knSFe6xw0e0R1yWw+Qx9AQZDlzKeBzuf+oZrjtr3lHi6q2DXu+zyAVisEfNpXYwWYFSdCzBtgnxBwOt/sqObcDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521274; c=relaxed/simple;
	bh=hcxgeoYCHOUB3oVHLvXiLTRxAVzj5eHVsfREbDyUI4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDXK2+uinbLIlhGjI5eq2hIJhUs9YQmM//ZZ4EXw7uLSmRicZgeaKjsDzk5CABay6LL3+7ZOsSzWAb+iMznJiKwlSSMpB+lqV/J6AdgE8rXpiqez6d8qpYKWavt/sJlARLVvzbyRssGobbnEjdGGU+GW6ZmyBsXXMnfA41lhHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFPuBM62; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3ec4d494383so3815702fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766521270; x=1767126070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWyvGG5WPoj4gg5GV5pLJhhoAzwMqbZle0CgAq5JveA=;
        b=TFPuBM621wJK5SCgOa9c+cbNhepLnzLZPui8O7uG3xZIaMIU13I2nf9qqLhSYCY1xA
         EmIq5zYJ+3If76O52erRFpRelHI3SVGHXPj5GjlaepHFLkxUoCbO+HAV0YfNNbzVx01P
         h/qR34QHm9qAMaiIAwGpAL0f6XGFZonpDhS0dArGRclHXVlRJkwGP5lJY03OzD8HAIDg
         7IQaWkFJyLxyQqfOW8svUfwBRRXtC7LWlpZaIkfzbksatbs4ksK5NBPfEAE6o7L6Z2yQ
         NzwxsiMMghQ9xXD9D9dbSXvZSFvgWJ3KR8cUuqsYWLwGNoVOGRhoelNaatMkRXyRDFnP
         EMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521270; x=1767126070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWyvGG5WPoj4gg5GV5pLJhhoAzwMqbZle0CgAq5JveA=;
        b=sJG70AJBRFoWyuGd7n0sXxPgahGGZfhYIUxKvdsMaHyXbz1Ceyc2cNKe3IMXvuyZ5N
         ZBG8YzFcx19tIaHH/wk/ofqwIuHp38nBX2iF93gmRDt7xKzMcSArG5O/RXVLMa7pNeYE
         xzPGcxZBiqjy3gfnKU6EfkerEbLrKPlm8QMclmiI1PclcSXImvDtindagRCR11pySLMd
         cFucgcjEoZ0w9/i67nsUCj6cCjkz+XNH1pZihvNdrumxtvTRNG88XPowPEKhYe6YYFV2
         BsXVuFBOKHrKUmaldIV/169JcnKOzoiJtdPBsUsEQZGSYqe5/sY0CvAViDYhULkIaZfY
         dfnA==
X-Forwarded-Encrypted: i=1; AJvYcCUdV4Pta1Cu/n8QAHl/2QKxqgDHBstVV59AwR2zUlNq86WVa54NQ1USgeGyW8KxUes+G82zetQtj6wGW65z@vger.kernel.org
X-Gm-Message-State: AOJu0YwglVG7s/DZfS6tz3j49QTa7/Mf+DD95XFV23yff1jBj6z3ndDV
	+U+l5i0F8la9qmQxa6ES3SfzWJrNovarFYor6Q+J6BtsEReC0tJOBKq6vi5WeA==
X-Gm-Gg: AY/fxX482ua9YRkB+n5Uq+JA6tVsPF5BMlH2xYDu76O5hFCB7+YUP7UnduU9or3NDwN
	cG07wUbuDHUYmGjTYPHF05tLzUcywLTdwQhUiQcYfeCv3qkr096tQqRrxdjjiNN9xgXIEaI97Bk
	EgNPWQGFYSuNdWn85JdFcYEbRHRUC34XqxB/X/Ily9XBUTbCUF3dGQ9ojkhbadg7MGwok0oYW28
	d5VzDUsL0WYnVC7P7x+p9MOmOP40BkzC25rGTyMg5oNI+RZQ/3YwOgbNWkLD7B58j2iPH1Z412S
	h1vF6NbKRjaOjS6PtE+uYBS9qVGOjO7Dr44dGNQb512HfPjikC3wlIcbexnTAdkU2luqpeCiUGo
	eyzYDcI0jgfwKMZCQGGoE+ye0IvwrjGtaL0GGUsFXSTTkIKKRyeh01ksJM4Pb9i3uSZgPNxo3kJ
	p8DScL/TzYXe/D+J13/Nn4Qn69UTiRg+MKKW9+KuW9LIy4MG27uJlW4JODQ7X/8kCcnFmUDNtKf
	zRTTzYhjKvVxf4Md2Azi0bXdQG6QCs=
X-Google-Smtp-Source: AGHT+IG1gSLMg+82P8L0cZpqzwwHNTcf0DFBHyH3dYm165UMefXqscXJ4tqhWhmQ0IrCm3ELZklggg==
X-Received: by 2002:a05:6870:e181:b0:332:1b00:6d5 with SMTP id 586e51a60fabf-3fda58cf74bmr7599791fac.39.1766521270249;
        Tue, 23 Dec 2025 12:21:10 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaac129c7sm8335537fac.21.2025.12.23.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:21:09 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 6/9] remoteproc: qcom_q6v5_wcss: support IPQ9574
Date: Tue, 23 Dec 2025 14:21:08 -0600
Message-ID: <12223416.nUPlyArG6x@nukework.gtech>
In-Reply-To: <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-6-mr.nuke.me@gmail.com>
 <a14e40b7-b70b-4658-9dee-7e5e6265ad5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 19, 2025 7:20:04 AM CST Konrad Dybcio wrote:
> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> > Q6 based firmware loading is also present on IPQ9574, when coupled
> > with a wifi-6 device, such as QCN5024. Populate driver data for
> > IPQ9574 with values from the downstream 5.4 kerrnel.
> > 
> > Add the new sequences for the WCSS reset and stop. The downstream
> > 5.4 kernel calls these "Q6V7", so keep the name. This is still worth
> > using with the "q6v5" driver because all other parts of the driver
> > can be seamlessly reused.
> > 
> > The IPQ9574 uses two sets of clocks. the first, dubbed "q6_clocks"
> > must be enabled before the Q6 is started by writing the Q6SS_RST_EVB
> > register. The second set of clocks, "clks" should only be enabled
> > after the Q6 is placed out of reset. Otherwise, the host CPU core that
> > tries to start the remoteproc will hang.
> > 
> > The downstream kernel had a funny comment, "Pray god and wait for
> > reset to complete", which I decided to keep for entertainment value.
> > 
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > ---
> 
> [...]
> 
> > @@ -128,6 +137,12 @@ struct q6v5_wcss {
> > 
> >  	struct clk *qdsp6ss_xo_cbcr;
> >  	struct clk *qdsp6ss_core_gfmux;
> >  	struct clk *lcc_bcr_sleep;
> > 
> > +	struct clk_bulk_data *clks;
> > +	/* clocks that must be started before the Q6 is booted */
> > +	struct clk_bulk_data *q6_clks;
> 
> "pre_boot_clks" or something along those lines?

I like "pre_boot_clocks".

> In general i'm not super stoked to see another platform where manual and
> through-TZ bringup of remoteprocs is supposed to be supported in parallel..
> 
> Are you sure your firmware doesn't allow you to just do a simple
> qcom_scm_pas_auth_and_reset() like in the multipd series?

I am approaching this from the perspective of an aftermarket OS, like OpenWRT. 
I don't know if the firmware will do the right thing. I can mitigate this for 
OS-loaded firmware, like ath11k 16/m3 firmware, because I can test the driver 
and firmware together. I can't do that for bootloader-loaded firmware, so I try 
to depend on it as little as possible. I hope that native remoterproc loading 
for IPQ9574 will be allowed.

> > +	int num_clks;
> > +	int num_q6_clks;
> > +
> > 
> >  	struct regulator *cx_supply;
> >  	struct qcom_sysmon *sysmon;
> > 
> > @@ -236,6 +251,87 @@ static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
> > 
> >  	return 0;
> >  
> >  }
> > 
> > +static int q6v7_wcss_reset(struct q6v5_wcss *wcss, struct rproc *rproc)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	/*1. Set TCSR GLOBAL CFG1*/
> 
> Please add a space between the comment markers and the contents
> 
> > +	ret = regmap_update_bits(wcss->halt_map,
> > +				 wcss->halt_nc + 
TCSR_GLOBAL_CFG1,
> > +				 0xff00, 0x1100);
> 
> GENMASK(15, 8), BIT(8) | BIT(12)
 
I find GENMASK() and or'ed BIT()s harder to read than plain hex constants. 
Maybe we should use macros, but what should be the names of these two 
constants?

> > +	if (ret) {
> > +		dev_err(wcss->dev, "TCSE_GLOBAL_CFG1 failed\n");
> 
> I don't think we should count on regmap to ever fail

I was following q6v5_wcss_start(), which also handles regmap failures. Do you 
want me to ignore regmap return codes in the code that is added, at the cost 
of some  inconsistency??

> > +		return ret;
> > +	}
> > +
> > +	/* Enable Q6 clocks */
> 
> Right, this naming gets even more confusing

I'll name it "pre_boot_clocks" and drop the comment in the interest of self-
documenting code.

> > +	ret = clk_bulk_prepare_enable(wcss->num_q6_clks, wcss->q6_clks);
> > +	if (ret) {
> > +		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", 
ret);
> > +		return ret;
> > +	};
> > +
> > +	/* Write bootaddr to EVB so that Q6WCSS will jump there after 
reset */
> 
> That's what a boot address is generally for, no? ;)

I used the same comment from q6v5_wcss_start(). I will shorten the comment.

> > +	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
> > +
> > +	/*2. Deassert AON Reset */
> > +	ret = reset_control_deassert(wcss->wcss_aon_reset);
> > +	if (ret) {
> > +		dev_err(wcss->dev, "wcss_aon_reset failed\n");
> > +		clk_bulk_disable_unprepare(wcss->num_clks, wcss->clks);
> > +		return ret;
> > +	}
> > +
> > +	/*8. Set mpm configs*/
> 
> "MPM"
> 
> Why are the indices of your comments not in numerical order?
 
I started with the spaghetti sequence from the downstream kernel. I unravelled 
it, and was so happy the code worked, that I forgot to check the numbering. 
I'll remove the numbers, as they don't add much value..

> > +	/*set CFG[18:15]=1*/
> > +	val = readl(wcss->rmb_base + SSCAON_CONFIG);
> > +	val &= ~SSCAON_MASK;
> > +	val |= SSCAON_BUS_EN;
> > +	writel(val, wcss->rmb_base + SSCAON_CONFIG);
> > +
> > +	/*9. Wait for SSCAON_STATUS */
> > +	ret = readl_poll_timeout(wcss->rmb_base + SSCAON_STATUS,
> > +				 val, (val & 0xffff) == 0x10, 1000,
> > +				 Q6SS_TIMEOUT_US * 1000);
> > +	if (ret) {
> > +		dev_err(wcss->dev, " Boot Error, SSCAON=0x%08X\n", 
val);
> > +		return ret;
> 
> You left the clocks on in this path

Good catch! I will use "goto" centralized exiting to turn off resources on 
failure.

> > +	}
> > +
> > +	/*3. BHS require xo cbcr to be enabled */
> > +	val = readl(wcss->reg_base + Q6SS_XO_CBCR);
> > +	val |= 0x1;
> 
> That's BIT(0)
> 
> In qcom_q6v5_mss.c you'll notice this is defined as Q6SS_CBCR_CLKEN
> 
> If you dig a little deeper, you'll also notice a similar name in
> drivers/clk/qcom/clk-branch.[ch].. I suppose they just reused the same
> kind of HW on the remoteproc side

I'll use the macro name as suggested. Thank you!

> > +	writel(val, wcss->reg_base + Q6SS_XO_CBCR);
> > +
> > +	/*4. Enable core cbcr*/
> > +	val = readl(wcss->reg_base + Q6SS_CORE_CBCR);
> > +	val |= 0x1;
> > +	writel(val, wcss->reg_base + Q6SS_CORE_CBCR);
> > +
> > +	/*5. Enable sleep cbcr*/
> > +	val = readl(wcss->reg_base + Q6SS_SLEEP_CBCR);
> > +	val |= 0x1;
> > +	writel(val, wcss->reg_base + Q6SS_SLEEP_CBCR);
> > +
> > +	/*6. Boot core start */
> > +	writel(0x1, wcss->reg_base + Q6SS_BOOT_CORE_START);
> > +	writel(0x1, wcss->reg_base + Q6SS_BOOT_CMD);
> > +
> > +	/*7. Pray god and wait for reset to complete*/
> 
> "ora et labora" - you've done your work, so I'd assume we can
> expect success now
> 
> > +	ret = readl_poll_timeout(wcss->reg_base + Q6SS_BOOT_STATUS, val,
> > +				 (val & 0x01), 20000, 1000);
> 
> The timeout is smaller than the retry delay value, this will only spin
> once
> 
> 0x01 is also BIT(0)
> 
> But since you never check whether that timeout has actually been
> reached, I assume you really stand by the comment!
> 
> (you need this hunk):
> if (ret) {
> 	dev_err(wcss->dev, "WCSS boot timed out\n");
> 	// cleanup
> 	return -ETIMEDOUT;
> }

Good catches! Yes, I definitely meant 20 millisecond timeout (not 1 ms). I will 
also add the error checking.

> > +
> > +	/* Enable non-Q6 clocks */
> > +	ret = clk_bulk_prepare_enable(wcss->num_clks, wcss->clks);
> > +	if (ret) {
> > +		dev_err(wcss->dev, "failed to enable clocks, err=%d\n", 
ret);
> 
> the previous set of clocks will be left enabled in this case too
> 
> > +		return ret;
> > +	};
> > +
> > +	return 0;
> 
> If you return ret here, you can drop the return in the above scope

This part will get changed a bit by the centralized exiting. It will be a 
"goto" (on error) followed by "return 0" (on success).

> > +}
> > +
> > 
> >  static int q6v5_wcss_start(struct rproc *rproc)
> >  {
> >  
> >  	struct q6v5_wcss *wcss = rproc->priv;
> > 
> > @@ -270,10 +366,20 @@ static int q6v5_wcss_start(struct rproc *rproc)
> > 
> >  	if (ret)
> >  	
> >  		goto wcss_q6_reset;
> > 
> > -	/* Write bootaddr to EVB so that Q6WCSS will jump there after 
reset */
> > -	writel(rproc->bootaddr >> 4, wcss->reg_base + Q6SS_RST_EVB);
> > +	switch (wcss->version) {
> > +	case WCSS_QCS404:
> > +	case WCSS_IPQ8074:
> > +		/* Write bootaddr to EVB so that Q6WCSS will jump there 
after
> > +		 * reset.
> > +		 */
> 
> /* foo */?

I was trying to keep it at 80 characters, but since I will shorten this 
comment on the new code paths, I will shorten it here too.

> [...]
> 
> > +static void q6v7_q6_powerdown(struct q6v5_wcss *wcss)
> > +{
> > +	uint32_t val;
> 
> "u32"

Okay.

> > +
> > +	q6v5_wcss_halt_axi_port(wcss, wcss->halt_map, wcss->halt_q6);
> > +
> > +	/* Disable Q6 Core clock -- we don't know what bit 0 means */
> 
> I would assume clearing it muxes the clocksource to XO
> 
> [...]
> 
> > +static int ipq9574_init_clocks(struct q6v5_wcss *wcss)
> > +{
> > +	static const char *const q6_clks[] = {
> > +		"anoc_wcss_axi_m", "q6_ahb", "q6_ahb_s", "q6_axim", 
"q6ss_boot",
> > +		"mem_noc_q6_axi", "sys_noc_wcss_ahb", "wcss_acmt", 
"wcss_ecahb",
> > +		"wcss_q6_tbu" };
> > +	static const char *const clks[] = {
> > +		"q6_axim2", "wcss_ahb_s", "wcss_axi_m" };
> 
> static local variables that we point to? eeeeeeh

I wanted "const char *clks[]" originally. I changed it to this in order to 
appease checkpatch. Should I use my original "const char * []" instead?

[...]

Alex




