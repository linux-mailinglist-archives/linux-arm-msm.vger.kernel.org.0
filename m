Return-Path: <linux-arm-msm+bounces-30424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53442968DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 20:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7633C1C21F53
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D259A1C62A8;
	Mon,  2 Sep 2024 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jip7UI1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A113D628
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725302347; cv=none; b=saIU2jTHsP1Q+cyFhCK9QH6FqiYXG8LbUIKmvtIulRhMUVJ5nZt2ddpsnKZt3gsOZh8IEdFKTBY8Zc4z/9suHJefiAv+U2zyZWm9BNSSpc5kq5c+O6YXVmWn6f11y+rM8bjhgpsaFVZeFDHPA2ffWjczboT3Ipk4lJTiZBGyXjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725302347; c=relaxed/simple;
	bh=f7ioOsOW2UtBJTh4Jn8E/jdh27RM+0q2IQHJKOuj6co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0/UDK3ZDuo4N5UGPtGsEid16QaNLs1RyOhEtapa9D6VI4qPjll7Hw8bgMcqX4HjK7qpp1oY+hQqNb+pUu1aoOVvx7PO6Jdz9HTNZCAqsPcBnIMlU+DrOyIXQQwT4gIjntUv2WK4nKyDzKsNw0TzEIU8U4prMszoiLPmstR1JOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jip7UI1w; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533461323cdso5621360e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725302344; x=1725907144; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L7ewTdA6TBog3FUoYxRWQ9HefvGnnlDeA05UsrKzpao=;
        b=Jip7UI1wzQeaGIR3kPV9KD0X/dgi5PTFGmb41CNlnJXsvqkCLlGWATPns7J1xW54nw
         OCo8RY0KLyfD7+zv5vbivdwBYJth282KQXCCn3S8aMsmJFKAEZgwqrwOEQfPjcIEu+qi
         2QFWxojOlYlCASs03IC7dv/LCxhyfVwWLyaFBsM3l8l4tchu05FjiHijDdTe1Igg6ufj
         dZCTzN0HATGtNcSEtYLX6BKcbzDy9vqOQF+p2SqU4x35qdRv4vGH/bQ9GacjA/pZYXRl
         QopTdXAGXt9fnePdyWXv86wr5PgVPwmSn53XthX/FJVNVw6bH/+sZVeLyEbSG8FJ31YC
         5rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725302344; x=1725907144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7ewTdA6TBog3FUoYxRWQ9HefvGnnlDeA05UsrKzpao=;
        b=D5u1AJ3XHw807FNMAk++FYniG9KVOCOsmnet+elmFMTsJaF9Mqc9luo1eFybIEsf6D
         KbTeZkHLWCirpNZFQi19XTIHuuTcFOSwh6U46IqhLO6wa3HFcf3sZSC/oBz6PPNUZbJJ
         IaKfqFq8YXvgNhMhq5XuHF4BXGEg116kssMUVeyF6bwQTEs+PRePdKK/A09Ex8UmHCg2
         XeHZVTn7Cya1pfPB3O84SpBsbJCIevlHgvwb+9siXxA/L08Cs1ZEp/LRwspQito6K/7+
         uuje+xKcmA5CgZ/Rt8d/bq+zVXeFoxpu5qW/0MCRtZw8pxz4vexhNdbIN5Wz4RUNPVU/
         eC3w==
X-Forwarded-Encrypted: i=1; AJvYcCWyh8a4BaxU5jgyPOz7irvp4OlmnmE+8f5G+jMZYSNzY6oPsnzjfzWuBLQafTci8VHXSHv9TxMh4mvAwyOD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8eMxukEX8xoMmybMtOO0JgmIaj0UvMW+DxBa2CiXimODxWiL9
	12qJ/MZiqoU9b3s37nIhcR/aVoQkhcTP1NyJFdKfa1ELpMUlL6oWAnek1hJ9yGc=
X-Google-Smtp-Source: AGHT+IHYdWkXe+rncah+Q/xuDmfgfYg5nYo/bbQbYrDw8rot5x8UI6W5jir4npXXEJXjP7ha7D6T/Q==
X-Received: by 2002:a05:6512:31d2:b0:533:3268:b971 with SMTP id 2adb3069b0e04-53546b0454fmr7257721e87.18.1725302343576;
        Mon, 02 Sep 2024 11:39:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407b8727sm1704749e87.119.2024.09.02.11.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 11:39:03 -0700 (PDT)
Date: Mon, 2 Sep 2024 21:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v3 2/4] clk: qcom: Add CMN PLL clock controller driver
 for IPQ SoC
Message-ID: <6sk7sx4pz2gnne2tg3d5lsphmnp6vqjj2tjogqcop7fwn3yk3r@ftevsz77w6pt>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
 <20240827-qcom_ipq_cmnpll-v3-2-8e009cece8b2@quicinc.com>
 <d7b374670eb2f6d442f351106ab1221a.sboyd@kernel.org>
 <7f4d41a0-b1b9-4b63-8590-63f4fcf1a359@quicinc.com>
 <7736d0d0-634d-403d-b70f-f33b7402456c@quicinc.com>
 <04944b77ce6327ba5f4ec96348a9cda2.sboyd@kernel.org>
 <ecc34401-68c2-463f-b630-6a81ad95625e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecc34401-68c2-463f-b630-6a81ad95625e@quicinc.com>

On Mon, Sep 02, 2024 at 11:33:57PM GMT, Jie Luo wrote:
> 
> 
> On 8/31/2024 6:24 AM, Stephen Boyd wrote:
> > Quoting Jie Luo (2024-08-30 09:14:28)
> > > Hi Stephen,
> > > Please find below a minor update to my earlier message on clk_ops usage.
> > 
> > Ok. Next time you can trim the reply to save me time.
> 
> OK.
> 
> > 
> > > On 8/28/2024 1:44 PM, Jie Luo wrote:
> > > > On 8/28/2024 7:50 AM, Stephen Boyd wrote:
> > > > > Quoting Luo Jie (2024-08-27 05:46:00)
> > > > > > +       case 48000000:
> > > > > > +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> > > > > > +               break;
> > > > > > +       case 50000000:
> > > > > > +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 8);
> > > > > > +               break;
> > > > > > +       case 96000000:
> > > > > > +               val |= FIELD_PREP(CMN_PLL_REFCLK_INDEX, 7);
> > > > > > +               val &= ~CMN_PLL_REFCLK_DIV;
> > > > > > +               val |= FIELD_PREP(CMN_PLL_REFCLK_DIV, 2);
> > > > > > +               break;
> > > > > > +       default:
> > > > > > +               return -EINVAL;
> > > > > > +       }
> > > > > 
> > > > > Why isn't this done with struct clk_ops::set_rate() or clk_ops::init()?
> > > > 
> > > > OK, I will move this code into the clk_ops::init().
> > > 
> > > This code is expected to be executed once for initializing the CMN PLL
> > > to enable output clocks, and requires the parent clock rate to be
> > > available. However the parent clock rate is not available in the
> > > clk_ops::init(). Hence clk_ops::set_rate() seems to be the right option
> > > for this. Please let us know if this approach is fine. Thanks.
> > 
> > Sure. It actually sounds like the PLL has a mux to select different
> > reference clks. Is that right? If so, it seems like there should be
> > multiple 'clocks' for the DT property and many parents possible. If
> > that's the case then it should be possible to have something like
> > 
> > 	clocks = <0>, <&refclk>, <0>;
> > 
> > in the DT node and then have clk_set_rate() from the consumer actually
> > set the parent index in hardware. If that's all static then it can be
> > done with assigned-clock-parents or assigned-clock-rates.
> 
> Thanks Stephen. The CMN PLL block always uses a single input reference
> clock pin on any given IPQ SoC, however its rate may be different on
> different IPQ SoC. For example, its rate is 48MHZ on IPQ9574 and 96MHZ
> on IPQ5018.
> 
> Your second suggestion seems more apt for this device. I can define the
> DT property 'assigned-clock-parents' to configure the clock parent of
> CMN PLL. The code for reference clock selection will be added in
> clk_ops::set_parent(). Please let us know if this approach is fine.

What is the source of this clock? Can you call clk_get_rate() on this
input?

-- 
With best wishes
Dmitry

