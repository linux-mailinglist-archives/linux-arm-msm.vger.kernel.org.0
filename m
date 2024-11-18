Return-Path: <linux-arm-msm+bounces-38239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459D9D126B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8791F23811
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6133199EB0;
	Mon, 18 Nov 2024 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JCJxRf3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2119340D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731937570; cv=none; b=cW4Wxt9kgjQhY1kIpICnHu8huW9UK7W9pAycRjmXU/eVSFald8LBJqJPjji+L9qYH2v24XEz38huSDXpaRMPx7yO8UlTkxCFE9vE4AYUgoWX9htu+Zyiglr2d4y7xyUVBG760jrzNRGfq0OuPCf/rDU00unktPUXsy3DxUZzHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731937570; c=relaxed/simple;
	bh=b9tRVma+TdXdJ7jfsjJM/qj83OGqnBtnRY9AG1aE0zg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BctyssiWrvdC+Ty0ntY6YBRL6VwPERt4BJRPIMIfJd4fc35aMgjVFWaQ8lmnNThQa+cjxogzQbRkYmABuDO6hnd9+d0zVzDFxRY2ZMFbj9QXGjsP/ExhXksUGlUhBqyd5IGtUSquCh/m6/6e8cf9gTyHeNTBYrFTLv5cK3qBGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JCJxRf3p; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38245e072e8so822698f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731937567; x=1732542367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lacQL5MLBt9Z1ViGz34neptdPtz7ar9QEPWg44wYwTc=;
        b=JCJxRf3pFVrQoRv0Ez90a8a0JQmDJoSwbdUb+qZhFtu+1OoICmCezevkP18p06WHw2
         vbhvTrZvbcGWPAPRVXD4AM9kdEUjClmi2HH8g751JuMqASUVCOiEXgXViIqF5lMLSeOk
         DpNMaT6fktmAMDerpGmlvCKDNwFAZm6K9Egh1cmDOQC1Ivv2xtFMXtkq569qrNYtvAym
         Rf/fhJYv4TYX77/ywleprMBxcvqtzJoLINkcXToXi3L8Co7hoT2d6+NItDD1S05+gE50
         9+8sIOZEI5qz5ISDhrc5BsAc5aSUiH8KOJGoOaVxM7AgDeyrWHZ3aht59tSYiZTV51pr
         Iy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731937567; x=1732542367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lacQL5MLBt9Z1ViGz34neptdPtz7ar9QEPWg44wYwTc=;
        b=D6oak7R/6FmGIOcpi67E4RzzUCI4uCnYkE06rXqMNbBAW1yO7Yro3gwzmJKMLTOrtq
         jk1GHTNzQddnnJwAUT9+oVhC12k7SWiBuVD+JXImHgiGdL7N1hBlUBdL2wr0eQwv7kvF
         sRCcUQTrwwPDnNmG/xj+UKcxMn96mUaNykME6ZxTDeqE0Y9C7Jsmw9d/sxCmWTegffZn
         VTvTsjgEaL4sH0jL3yZ/LBUy48NK3SxgBLzuPFuwCAPYo8U7VUuawC3nLv275Hv83cWw
         SJ/h2smbqh/fjfXQajjEqcIrgf2HHW961Q8GNjEG4TWXLvontY7WBx+eyxeYfXzC2Zch
         L/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0aJD/lWlS892MMdpAOsZsP6JFR81/wezp6CTtxA6jQCwCdFyfnzPBvWiOnPM8Ovept3fsZiedtXslzaEe@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvMC/PlHhoHrOVw8o+w9Ck18x2xFhbqRgIjf2gO3Rw6xSbgi4
	HQSKqA4eU5moYaKYkGkEb9z3+jvvhqElE9mjP23CY1hEQcrmXsfh2NoCymEJxyU=
X-Google-Smtp-Source: AGHT+IHkVwqUrsTO57CDIVnVyeB9jtrAOxMYr912xJox9XhpNLtz3G90FO7UCuAgsWAbyuFHiTCB0A==
X-Received: by 2002:a05:6000:795:b0:37c:cdbf:2cc0 with SMTP id ffacd0b85a97d-38225ac491amr12126768f8f.53.1731937567318;
        Mon, 18 Nov 2024 05:46:07 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae161d8sm13142570f8f.78.2024.11.18.05.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:46:06 -0800 (PST)
Message-ID: <52eacf06-baa5-42c7-a451-363679728135@linaro.org>
Date: Mon, 18 Nov 2024 13:46:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <cl4u42hzdwaj4dt5bponhnadou3uecaodtr7iopfu4vhmvttif@bxxvmwmzu5u2>
 <3ce358b9-6a65-4141-ad3a-bbb826082470@linaro.org>
Content-Language: en-US
In-Reply-To: <3ce358b9-6a65-4141-ad3a-bbb826082470@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:22, Bryan O'Donoghue wrote:
> On 18/11/2024 13:15, Dmitry Baryshkov wrote:
>>> On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
>>> multiple power-domains which power it. Usually with a single power- 
>>> domain
>>> the core platform code will automatically switch on the singleton
>>> power-domain for you. If you have multiple power-domains for a 
>>> device, in
>>> this case the clock controller, you need to switch those power-domains
>>> on/off yourself.
> 
>> I think the series misses the platform-specific part. 
> 
> I don't think I understand what you mean by that.
> 
> It is hard to
>> understand what kind of power relationship do you need to express. Is it
>> actually the whole CC being powered by several domains? Or are some of
>> those domains used to power up PLLs? Or as parents to some of GDSCs?
> 
> Well for example the TITAN_TOP_GDSC needs both PDs to be switched on.
> 
> We _could_ do this just for the CAMCC on x1e80100 - i.e. make it just 
> for the camcc device but then, the next clock controller that needs more 
> than one PD will have to implement the same fix.

Can some of the PLLs run with one PD or the other ?

Perhaps, but without _both_ PDs on the GDSC will stay stuck @ off for my 
test case on x1e80100 and looking at other places we manage PDs directly 
- drivers/media/platform/venus.c for example its generally just all or 
nothing.

There may be more granularity to extract but, I don't think there's more 
granularity for the first case here. Both PDs are needed or the GDSC 
will remain stuck @ off.

As I see it we can either address

1. At the drivers/clk/qcom/camcc-somesoc.c level
2. At drivers/clk/qcom/[gdsc.c|common.c] level

I think option 2 is more how you'd expect this to work though. Its not 
particularly obvious but ATM with singleton power-domains for the clock 
controllers the singletons just get turned on and left that way.

So managing the PD on/off inside of common.c/gdsc.c means the calling 
clock controller can stay as a simple probe() type driver and also means 
we can reuse the generic common.c/gdsc.c approach.

---
bod

