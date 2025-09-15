Return-Path: <linux-arm-msm+bounces-73526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8783B57545
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7482A3AF109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C0D2F39C4;
	Mon, 15 Sep 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I7rKGc2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9422F0685
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929999; cv=none; b=tn8YYXa6IDGfvDsUrk7UivAmi34LusR7OqNt6zrJJ8+yylRg0QB2bVzkr+g5FISwrpsw7d2H+4ljR9PfDUx9tcwU1QJsTpi7sNyySxU82jiA4KeQNZANy1xvEpKUb1Ixq++L45HzlFSsFGR1Ri1mnRUX1RtHkjlx9+oHIwgB7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929999; c=relaxed/simple;
	bh=fArXrU1ExA8BvNmApjYERc/9Abn1vtW4HuR2zhO6fy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZwdSYRUHl4BaPacBRtUQ3dWspbM5a/Hu8zH6xNi2qPziOdbOGxeeOePuHhF8zcQuISRXtFh3taBvyXkla9xu1Fsp254ZV+6EbXES1MxAv4AHrimACsXNAiXOFwpvBBkk0vQ90CV7xYEMOmdLLgqUdJHZ7LtVsbVCcIEX7RB9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I7rKGc2j; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b0418f6fc27so674271666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757929996; x=1758534796; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZnT8bygRKAPmGumVQ7/aWhdFKPhR563laFLFSTJnPg4=;
        b=I7rKGc2jMJRyZF0EMswedZs1QtgPJMkG61JuWi3Ez/yy/1ZfBF7xRWmJ9Oa3lShmCN
         HGbW273Q2QTIwS/MwGHr2SOaBYBX0xV/tTrJuKVg3AXHliyqt++EzO4+r3zF8CiaFJMs
         hE7xxq2+fIdwOr9upCWJUVcS/Hy1XNhkF+BKkKdZWqLOQt9f+DBwQOfheGBxtapYwrx+
         vkfIyXG3ApVgzhzlH26iaVMiQ53RxSIg/UJQDg0hXfbNu7jm98XxyXZY43qaDf9Jxzs+
         yq1tejBkHRg68VibiVzW2h1mX2R3kkfgyaR40GEHlldoEfU+Hy0Jl6BV23meSJWTyP+9
         YEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757929996; x=1758534796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnT8bygRKAPmGumVQ7/aWhdFKPhR563laFLFSTJnPg4=;
        b=SlPDC749oz0lGAKn97siVg65FXdXEY483gHd8pgUK/mrMeLVIkB/Ogb6HRrjVsCFB3
         oOq3q+lGnX/nX4+7IhWYY8kHQ6G+0l+BDnQfZTNjtlRZIozUOPD3rJuxsqTD19IwTmX6
         RwbAt2eowd32Lp2MVE+2x31NRF8cABmHZqo2SRqiqvp6BZnDoqwttmZL5dBs/vtMT84c
         LBGzN9S/pXzP0ZRhF+cqOgFevIgDjhS3um3ja2kGme9vW7I+4F29R0pt4ct+i2zSKqxJ
         O/jqEElOgdQ/0p0ykhqaRtEoYW0wPx5IM4LAVXGK/E+DuLMSH3A9xWYlvHV502iOfBUH
         HGSw==
X-Forwarded-Encrypted: i=1; AJvYcCWHWUqjmjQJDeXnJ4h8ZGLNba8j6WYIeprbhx1uAmpuBPUEF17FAJTM/cU0jkjLul0WsgnMyQipLZafVMd5@vger.kernel.org
X-Gm-Message-State: AOJu0YygOTSOF04aJRt0OPYsJrGdeBwU+yZi+J/d8O6vH2DkxCDMoWXh
	wci1/t6lX+jKKSQNgJGvvxf5K47zr4IeMCwouNdiJ6Cgh/hNXfqRlzFdZKa9dg/M/Q0=
X-Gm-Gg: ASbGncvZ3iMGRHxg3SwMMxVoF7AY+wLJS0TbZCbRP3cLB+DX+8XbC18+4p1PtNuT5bK
	qfk7shajM00Ivufm17F0cJ/daEIh7WCVgpQlGsG5AGHrh7Vd4MHY+5Wd8wm0qlk7aSjez8pCmg1
	Lym49hUfu3D3cr+KJR0j12PuexB90ISU6CSwqCc6V4udtdiLAH9bw3ZCeA9GcwDdOfKJVdw6AEA
	fVlzOECURXKGtO9mgc179PTGvkNak9Ai94Nf98YuOa0Qw4guAnOVTR5W/Q+h5UnGMhSN415i8Hg
	Y1TP5ScGmE1McD9OMH9pLjWKrWa8xfpHcOYqyx4jjP4JazMY+bMFk/yNEuFzPYEvcVXzs9uSocv
	GsBLyjHeM5MVqAv6AZzjZOYUBtSLlE29hozevbU8h83ETPldGTzVWAg==
X-Google-Smtp-Source: AGHT+IFIHlscBL0igR95cEAP9TJRcptLn3BqehB8VqKM3aaIOHUcYtaoyvHvFWqzo+O2sc6KFxPEsA==
X-Received: by 2002:a17:907:1b08:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b07c35fb999mr1200734266b.40.1757929996192;
        Mon, 15 Sep 2025 02:53:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:ab20:75dc:ab3e:bbb9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b33478besm924187466b.99.2025.09.15.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:53:15 -0700 (PDT)
Date: Mon, 15 Sep 2025 11:53:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <aMfiCry1NDdd9AnX@linaro.org>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-3-38ed7f2015f7@oss.qualcomm.com>
 <aMPee9wEOrrW-KMU@linaro.org>
 <90dcca12-1a68-4049-bcbe-c333aed07a07@oss.qualcomm.com>
 <aMfT1_uyZETUEBYk@linaro.org>
 <3b81ea60-553a-48d8-b6c7-6b55673fe04d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b81ea60-553a-48d8-b6c7-6b55673fe04d@oss.qualcomm.com>

yOn Mon, Sep 15, 2025 at 05:46:09PM +0800, Yijie Yang wrote:
> 
> 
> On 2025-09-15 16:52, Stephan Gerhold wrote:
> > On Mon, Sep 15, 2025 at 10:12:15AM +0800, Yijie Yang wrote:
> > > 
> > > 
> > > On 2025-09-12 16:48, Stephan Gerhold wrote:
> > > > On Wed, Sep 10, 2025 at 05:02:11PM +0800, Yijie Yang wrote:
> > > > > The HAMOA-IOT-SOM is a compact computing module that integrates a System
> > > > > on Chip (SoC) — specifically the x1e80100 — along with essential
> > > > > components optimized for IoT applications. It is designed to be mounted on
> > > > > carrier boards, enabling the development of complete embedded systems.
> > > > > 
> > > > > Make the following peripherals on the SOM enabled:
> > > > > - Regulators on the SOM
> > > > > - Reserved memory regions
> > > > > - PCIe6a and its PHY
> > > > > - PCIe4 and its PHY
> > > > > - USB0 through USB6 and their PHYs
> > > > > - ADSP, CDSP
> > > > > - Graphic
> > > > > - Video
> > > > > 
> > > > > Written in collaboration with Yingying Tang (PCIe4)
> > > > > <quic_yintang@quicinc.com> and Wangao Wang (Video)
> > > > > <quic_wangaow@quicinc.com>.
> > > > 
> > > > This looks like you should have Co-developed-by: tags together with
> > > > their Signed-off-by: tags.
> > > 
> > > We’ve agreed on this as the preferred method for marking collaboration, as
> > > discussed earlier in this thread.
> > > 
> > 
> > I can't say I agree with Bjorn there, but ok, he's the maintainer. :-)
> > 
> > > > 
> > > > > 
> > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 621 ++++++++++++++++++++++++++++
> > > > >    1 file changed, 621 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> > > > > new file mode 100644
> > > > > index 000000000000..c7c3a167eb6a
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> > > > > @@ -0,0 +1,621 @@
> > > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > > +/*
> > > > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > > > > + */
> > > > > +
> > > > > +#include "x1e80100.dtsi"
> > > > > +#include "x1e80100-pmics.dtsi"
> > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > > > +
> > > > > +/ {
> > > > > +	compatible = "hamoa-iot-som", "qcom,x1e80100";
> > > > 
> > > > Undocumented compatible (without "qcom," prefix). I think you can just
> > > > drop this?
> > > 
> > > This compatible string was also discussed previously and is the preferred
> > > choice. I’ll add the missing 'qcom,' prefix.
> > > 
> > 
> > Even compatible = "qcom,hamoa-iot-som", "qcom,x1e80100"; is not
> > documented. And it doesn't make much sense to document it either, each
> > of the boards using the SoM should have a more specific compatible and
> > therefore needs to override this property. I think you can really just
> > drop this line.
> 
> Patch 1/4 documents this compatible. It’s another requirement that SoC/SoM
> should follow, which Krzysztof pointed out in v2:
> https://lore.kernel.org/all/aee74e0f-c957-437d-ab48-3977013c3116@kernel.org/
> 

I'm not saying you should drop the "qcom,hamoa-iot-som" compatible. My
point is that only the compatible list you use in hamoa-iot-evk.dts is
documented in PATCH 1/4:

compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";

The compatible list you are using in hamoa-iot-som.dtsi is *not*
documented:

compatible = "(qcom,)hamoa-iot-som", "qcom,x1e80100";

because the board-specific compatible string (e.g. "qcom,hamoa-iot-evk")
is missing.

The compatible property you have in hamoa-iot-som.dtsi is redundant,
because you override it with the valid one in hamoa-iot-evk.dts. And
every other board using the SoM should do the same.

I would expect that you can just drop this line in hamoa-iot-som.dtsi.

Thanks,
Stephan

