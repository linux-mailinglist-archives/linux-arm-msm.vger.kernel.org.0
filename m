Return-Path: <linux-arm-msm+bounces-29106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 553DE95855B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62A0D1C243D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A631D18D62F;
	Tue, 20 Aug 2024 11:03:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7418C020;
	Tue, 20 Aug 2024 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724151786; cv=none; b=a0KMjAuHR9/XST21PV4sVY1VV3rYS5jermQx/7uacsZFksu99t6lFFjivar2VwmH3qEG9lFA/JcAilNl2NF6UbdJjMIR9PYr+eCMMFs5a14Ht/W1czOehRxRUqNCnzq3K93GpQieXIPu4P+2MRSvXyA7LDgkOPU7TihRa7DTxD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724151786; c=relaxed/simple;
	bh=HoaPV/fSjPPgZQ5KsJkTOE8xyAsJCORttngoT1ZLyEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okbj86uLaQ/efAYG3Ke5fJQPSzHyz7lN2Xlv+bpFYno8TyfC/FPdthDZJbfDPNZhriBK1Q1UwTbAEjp8W0er+YVHl0/JU22IUcJ1gtOIQRc7+7F0TzHJIVV38VMo8x/kDSPWGFIGyJicbSpB+A5eUbQO54nwm0XRBRULp4XraXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-371b015572cso2329737f8f.1;
        Tue, 20 Aug 2024 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724151783; x=1724756583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uSbusyjca75DM3uPFt41Mi7fTzEOWCLLIWEIvrKa5o=;
        b=tknuC/cXYbepJQh5g5OTlS/m9Gcj5jtU8jvw93o39+a7Askq10gsJgE5KLZtjaOTC2
         rq/JQLp+ToLmTC/jKUSwwjVGEIPDCSeytEha1nzDA4aRVA5XS0aV24YmQl8HYKelumq+
         f8019X9mO8YWNzv3CQP5WHfolEz3sMYOC0nVcFsJ4uG6HLrlYPNF8Z+T1mEwlHPWNCjj
         IvGSlVg6aSiwfW5uD55Wi8IUwyyTon2J58/2kn6bLI/IpKxwhyR9tx0UZ8Fe3BmOgSs7
         1Y79mDaUfSpr8zfu6s6sFtk87FrztCAl6YH5c7x7Di7wYn9ev7+0MrNCZLKkq/xi3qD1
         QE3A==
X-Forwarded-Encrypted: i=1; AJvYcCUSAHKaZcT5A6YiNHQ2WK+TeSMRyTMw/Lv4bxCvFu0Eq70whihLWjxiuEP89XLPC05w66JHQDB8qqixMBJAkw==@vger.kernel.org, AJvYcCVa4ezmooHBfY31lvLoYCjWHW1edBGUFrHUZ7yR36mxWMa5A5ekLQGhGVROhBOSNRAQJyYgV43JnRb2@vger.kernel.org, AJvYcCVwdDk02PZIXdT5Ado/PD1XeZB7puG9JN2B1A2Akv4tH4juu19EZpD3gmueM02xm3xGul6OzCBEt9bp7x6a@vger.kernel.org, AJvYcCWtIzOkhBZ1NBwk6jeiS0SD+heqjFI5jWjB+GKIveiIFOI3Hf9Ho/ytb3KQiJAglDUaAZP3WN0eJArc@vger.kernel.org, AJvYcCX0keSfx910Iq/EGD8efCGKsWSEMYzN4DML9pNzP4JS2uaxk112Q4lcSfL4TUdhiOJ+PDChgNxC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiy/IQTiAZNpFlbZ7c/uklrrMgWeau9jW149Mser4aUDL4AQE4
	51b1Cq1vVebzhtwv8RFyauKxFGLX8oLcM1TYbo7sUejDt1xRpYmEgAZS15mc
X-Google-Smtp-Source: AGHT+IFT9bFKeLhKs/xtBpkkK/ON8CFh0OUF6n4KfBdOT9wAl8DndMiltOVoJhuy3Zu4jx6yXnKCmg==
X-Received: by 2002:a5d:4644:0:b0:371:7d3c:51bd with SMTP id ffacd0b85a97d-371943285b7mr10354707f8f.14.1724151782649;
        Tue, 20 Aug 2024 04:03:02 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718985a6ddsm12843904f8f.58.2024.08.20.04.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:03:02 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:02:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add support for GCC on QCS8300
Message-ID: <c6t35o5pnqw25x6gho725qvpgyr6bl2xkpsurq4jtjgii2v5mq@mvdl64azwpz4>
References: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
 <c1dd239f-7b07-4a98-a346-2b6b525dafc4@kernel.org>
 <5011eeb2-61e3-495a-85b3-e7c608340a82@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5011eeb2-61e3-495a-85b3-e7c608340a82@quicinc.com>

On Tue, Aug 20, 2024 at 03:38:39PM +0530, Imran Shaik wrote:
> 
> 
> On 8/20/2024 3:27 PM, Krzysztof Kozlowski wrote:
> > On 20/08/2024 11:36, Imran Shaik wrote:
> > > This series adds the dt-bindings and driver support for GCC on QCS8300 platform.
> > > 
> > > Please note that this series is dependent on [1] which adds support
> > > for QCS8275/QCS8300 SoC ID.
> > > 
> > > [1] https://lore.kernel.org/all/20240814072806.4107079-1-quic_jingyw@quicinc.com/
> > 
> > How do the depend? What is exactly the dependency?
> > 
> > If so this cannot be merged...
> > 
> 
> They are not functionally dependent, but we want to ensure the base QCS8300
> changes to merge first and then our GCC changes. Hence added the dependency.

This does not work like that, these are different trees, even if they go
via Bjorn.

Why do you insist on some specific workflow, different than every
upstreaming process? What is so special here?

If you keep insisting, I will keep disagreeing, because it is not
justified and just complicates things unnecessarily.

