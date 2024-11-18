Return-Path: <linux-arm-msm+bounces-38231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDE9D11A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81005B2986E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B091991AE;
	Mon, 18 Nov 2024 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xk9+QHGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8233D68
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935846; cv=none; b=i1ItKkb3TGnFhOTd35aMOoxTCz/22qL0Cf09ixyCpxkMUoHA+FTZTCDHxpL4eMBmohbZxkd1Muj9i+AZjd05HnAxUAbJoxIWpwR1U/Y0EiW4OHuu7k3YPCixjM07xLONzCZiHASeLqCWEmWkr634oSq/+HzwP76qmdMCrJDDtvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935846; c=relaxed/simple;
	bh=27ZgO7Mbp2W4uaOtt5tOkEL6GC37lx/ugMndSM3f1oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=th110y+ChLtjmKYCD9hp03m9+RjFB3M030XYiQXWACxQYTXtinkhBB/YmPkmejrLdZBt4NzQXI8mqAIcUyMd/d+NxAJ7zyhIwReKzCXfwIJ7jjK13WYOIWVfc+eyhH9ZSfyMjt1CCwBhmHKNDnmoxY7kJnueUFi/wxT8RcKyFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xk9+QHGS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53d8c08cfc4so1804703e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 05:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935843; x=1732540643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27ZgO7Mbp2W4uaOtt5tOkEL6GC37lx/ugMndSM3f1oU=;
        b=Xk9+QHGSxqkTil9vgSIG9ULHe+s9kMo+Xj2y5RFIw+xQjQQGITrhkg3P1DUQ4JmHLK
         Vwq1GPLWT1oGsAO07cOE9HNWIgNCD9eU6YYI+b4rkN6xzzfEoqea1LRMMPHQBdNAzHfO
         iK/qUWZ5bWXd7uSBZ610B7wqqpIQqI5MvMc6PpDio1Jk1dfI4te9PT+zrfJgkGYIW5T8
         G4N5vIYwyMEXPwbWDIc7F/lJEGefwVsbCl8daVqVvec71x8oI+C0UPw+a0VMJeg5NPN7
         pJXrYabOen2nmgpb5W5sBNa8NTubrDsvXB3CPqonJtVIeyNbXrSl9SuOV/y0XMGPmQy6
         5lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935843; x=1732540643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27ZgO7Mbp2W4uaOtt5tOkEL6GC37lx/ugMndSM3f1oU=;
        b=QVlj4ZxSkABFQIjeIC8Ptx0rykINbmdMAkT215e+VuK+WhZab7c0WEDo1L08fUtlnu
         ATygb/UW9cum25c/3a/QhBZK4gXM24VVOmcDr4P/tTCxOdPlV84g2Lae4XawTPg57hOB
         kIEfzjgX8wVet7nv5+XHfCsQpcSHO8vTNSpBdGJ53T1+8beioqAhp8c0/8YcwUGj62zP
         zULmMaClKs84kDfXffKH5qLbyAyR/IT4gAqm0g/bS2VxmleNIMQwH0HLCwrTLvPj5D6P
         PnvVxE9MW6LFWYThbF1Yo0tsmyZTALpIqyoYr5dHu2J26qxrzL/H2kBvE1lh9iSBOT4t
         BETQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNVHIHPFcofH2ubDAMUijA5L+pzzJLU0O1uKvGTENIngGlXexUEUeK2hTe758oMRKuj4YZz7wqaTW3WPHC@vger.kernel.org
X-Gm-Message-State: AOJu0YwF7xHfVQKTbB2UAhFe6pzvyAdhNbMKE/3ZxT7hvtHGdChICupy
	jXnyjjH/nwww9J/56xRmH/cvzLfqFyvNV5NEtkwqa1rEAUsFeJuRsmmZNtlwmnY=
X-Google-Smtp-Source: AGHT+IG6GpzsRTEBNeqCJoy9I8+3/zQt0RTW9/JK2f1rZxRf+iev/AVJpOguUi3f0ciWsetoy79pgg==
X-Received: by 2002:a05:6512:3b24:b0:53d:a882:c2b1 with SMTP id 2adb3069b0e04-53dab2a2c02mr4490698e87.26.1731935843066;
        Mon, 18 Nov 2024 05:17:23 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d4788c2asm134895805e9.0.2024.11.18.05.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:17:22 -0800 (PST)
Message-ID: <ff50be87-bd4d-4c5d-8f9c-f2713de3c714@linaro.org>
Date: Mon, 18 Nov 2024 13:17:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
 <xtah7t5fvixbvuukkzthvq7p7crmwujqxnuuvddihzibxkqlyt@bxzvdwkigf6k>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <xtah7t5fvixbvuukkzthvq7p7crmwujqxnuuvddihzibxkqlyt@bxzvdwkigf6k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:03, Dmitry Baryshkov wrote:
> I don't think it is enough to just attach to power domains. We also need
> to power on some of them (MMCX) in order to be able to access clock
> controller registers.

That the next patch.

