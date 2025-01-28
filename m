Return-Path: <linux-arm-msm+bounces-46385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E5A20A33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 13:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3EA188465F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3811A23B1;
	Tue, 28 Jan 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hCb09hNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD4290F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065966; cv=none; b=T2wHehagHWMxK5FFO6ROQ8qpsyMI2lswefPcECsuISSm3ejxzYA5j8cSAa0hlq2y/PMr0g1j75so2vZm/dnbCGT631LGqILJWq0fNdtxTuotn4VAH61seAvJze4M6Wjxby5ywdkbwGcmIJEvkJ4OjeTuI5mihSZoo3gzWFt6RFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065966; c=relaxed/simple;
	bh=oufBkASVLAZPPxyZ4LNnHSodYk2v5NWX91Nm7PjoLCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVSBatgYZY7Lgo32DdSwgDgSqvy54FNYMgSMl0kiuY6xkyXUIQ9BCsqWq5aIAxfMfgs2e0Q2saNsdRnQ30J1XBLN61ge6JFoB3eOoNgh9j1buHdQASr2SIBQXO5YSPCKsJEZykhMW2RG3jefO5ZZzgSD7qTeg+8SyKfaQ8oqe1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hCb09hNU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540218726d5so5963569e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 04:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065961; x=1738670761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qUyQVfWY0TcVLA75T8KrSwQy4er3JVk1Q3BfjVHWE9I=;
        b=hCb09hNUOo65hpgm2+MK0JRqf53L1j2rXXJ5+8GirKwzxEMu9zXgygGeOOCehGbd11
         /LvDD9oSuTwsawu7WNp4yzTX+C8Ehqmy6rOQatQsdG3Gq7JDAwJQNsadMwlcdxoKmMzQ
         fi5IekNoDpvkfs/272qoZs1IWY8Je3nEcKYF9VLLVi5eCzvNKeBMboBku3J/U/iVUlRR
         RuukmzD/Fvf11zncUU4coM6RzvTFo5zNr4xa8PmQm478VHl077MR9IGtnQaAZx711xdM
         ndO+a3LgJW4SJfUP3OeKgr7oh9N9Pi+JvE/0n52Uc9FnIPnyANvaFbN3Uk0/0bs8WnRO
         9i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065961; x=1738670761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUyQVfWY0TcVLA75T8KrSwQy4er3JVk1Q3BfjVHWE9I=;
        b=KAT70EQc6qi43rbYOrkDR+sqqap4efRbdsShCcq8wnJVlVWQOcsqGHTCJ0YwecsvVo
         hOpoDwU6qzPIkgzn7vMUw9oA5iMDuVP1IeoVZQkjAoDtMx14iWMLEKG1y/MD5Wixt3XP
         FhWAugSoT04d50OV5hZTCnbLRlG5yfVs4XqVx7QjH2rU4GyItS9ZsXQG2xrJPUaSL8ZM
         iGTb6DOadYHscoNo9uqcVIs3InmLNDJ6YZcUGCkXjDoedIvYi7ZYkP0vTunDwrYwyLk4
         fcop9QZrWUdRf3tkj9m8Q4C4szrZrEsGVDpyHpDbL4cu7HGqiGme2YbUzSPY1TO7vdob
         Xf6A==
X-Forwarded-Encrypted: i=1; AJvYcCXj8hIVTffkHjdsYlGOzHtVAvE76CdRrDo/RxAcJmwrsXBQz0n5OfBi/o1VNTbKbt5i4938CtMzF/BAqugG@vger.kernel.org
X-Gm-Message-State: AOJu0YwHS/wfJiT/+mW8xI1ObY2CNxwNndfLTOqZWq3pBMBTrR/r9UNl
	67Ryvc3rxlLykd3+Fkrfd8u3j7P2hRhVS6CZ1lNwbDi8OULot9xGcVq04Dvln7A=
X-Gm-Gg: ASbGncv4n/kAMcCg2elt4g/pLwgLQ54ZJmqUFqGm14XHv4K7KO/ZdZmWsS2i5X7SNFt
	ENRsbZ3NwgKVI8LR/hwh6H8Ggyjxb88EM6Zsp+l3sQG+wgnbwpEEATc9wAR0d24DfoXN6caZe0U
	5ttxYuODAHnPy8fk1ez8pj0AaAoQuns/ZuA8A05ytsm6pULy3z622qzxOtE7Pti2kvYfAoWKZP1
	WTroHA/UxYEYF+UU3b89OKmTwmrJ83CaNuII3D64fJPA8xBA5JJk8DXtbeh1POb8LC6I6X6chxc
	ey1MroxvlnzXE5uCyvnEmr727nBbAShfF93E0MteLpDH5ccUlhVyO/fbz+yJiUzlGL03vkY=
X-Google-Smtp-Source: AGHT+IHAsiYhaOuqsjBfo6+IiSS13eiK4EvcYmQzAODrNEPBRfk1wrbF7CuWTZhv/BBI0wyJGPOXUw==
X-Received: by 2002:a05:6512:b94:b0:542:7217:361a with SMTP id 2adb3069b0e04-5439c22c3bemr14203681e87.10.1738065961178;
        Tue, 28 Jan 2025 04:06:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc194cesm18324081fa.72.2025.01.28.04.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 04:06:00 -0800 (PST)
Date: Tue, 28 Jan 2025 14:05:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <q7qrfmmzvs7uyleiuxzaahhawcgexbsyvi7edubpfmr6ompcw2@vj2j434qcwbf>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
 <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>

On Mon, Jan 27, 2025 at 03:37:05PM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2025 14:56, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> >> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> >> two clocks.  The respective clock ID is used by drivers and DTS, so it
> >> should be documented as explicit ABI.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Patch for Display tree, although with Ack from clock.
> >> ---
> >>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
> >>  MAINTAINERS                                              | 1 +
> >>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
> >>  3 files changed, 12 insertions(+)
> >>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> >>
> > 
> >> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> >> new file mode 100644
> >> index 000000000000..ab94d58377a1
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> > 
> > I think this should be dt-bindings/phy/qcom,foo.h
> 
> 
> Both options - clock or phy - work for me, although with slight
> preference of keeping foo constants only in foo (so clock -> clock)
> because then clock maintainer sees it as well. Also because I would
> judge by type of constants (so again clock constants -> clock
> directory), not type of device. We have several MFD devices, like PMICs,
> which have a clock, so bindings should go to mfd? But mfd is not a real
> device, but Linux subsystem.
> 
> For many other archs, e.g Mediatek, pretty often even for the same
> device, the binding headers are split between clock and reset. I know
> that Qualcomm GCC has it in one file, with exceptions (ipq, qca8k). Also
> these other archs have bindings file in e.g. soc or arm, but the header
> in respective subsystem
> 
> With exceptions of am654 and pisatchio-usb headers, we don't store clock
> constants in phy.
> 
> Unless someone insists or there is existing qcom convention, then I
> rather prefer to keep it in clock.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

