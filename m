Return-Path: <linux-arm-msm+bounces-38728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 091169D5627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 00:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFB2A2837C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE42F1DE3B1;
	Thu, 21 Nov 2024 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dy6Vxf3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB661AA1DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732231559; cv=none; b=s+KhUPyNirGZz9RWBblrUFJmvzSBmUEIbKYWuPwpZHmD1oEWJKwkUp+j/XAX7mjC59SRb01oTXkMMORTP0oKOY3vCmEsCGrpXQyjCkRFlq2OPO+vxlQYXQZ4K/BaMLaxwTXyIIVUqp/PQ74tm2YIVxEI2Ty2WPZ4EJCHK47kUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732231559; c=relaxed/simple;
	bh=xYgsEyqX/nrv64zgWbndRQLzhHiaVrJMeBBnEJnAUf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmtGqdyZQVompZhNYi57ZLaH6qPE4daQmcgvcMRrtpQQ4t03O8u1V/wyLjMOeI2uts2y0FQv3AjZ/iKK4mLmG0xLu5isKmUPpNY+39kzbvwZZZl6AUsYNOrgevWILVFcHI/xZ0lYwCR1QKSnyrkOJL+6KJ3GGYEDvslBantz8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dy6Vxf3d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so13438155e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 15:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732231556; x=1732836356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iky7t6Q+RBwcmkvNugtP0jm94OiaVAYR36AYKJtXDso=;
        b=Dy6Vxf3d/FGxyojuh9/Q5Caf94q7crHU2fShvk97+F56Qoy5VTY3pm7992PKpPiEU4
         ZYna5PIy3r/+DedxcMWxXjs74m/zeYcSYqcziAsVP/V0zcxefx51NFnQcnEbZuoFoNP2
         1IGKW42wI9NVZuUYqwSWWRQGtNcxMR7tg7J8RZZXN966X6gwFz1vroK+Pm9WlXLQ1PfR
         VxioUyqRWE/G//oXpn9iFPShk7BUqRPZhM8w1Np4S6KQWqxaCqKkCD9yUooeMZYwBWhm
         TzL0OdIF1U+3+1NMsM6CWYTSnhMjg7IJz8OiwklnnO48iFW46h7RrNmezmKWOfKdKdR5
         EG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732231556; x=1732836356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iky7t6Q+RBwcmkvNugtP0jm94OiaVAYR36AYKJtXDso=;
        b=B/wwWpwijUm78RssTpjZHf6dYHDOK7tJQqiG89Mh4trAg6fmuxytLYMFihJkVLrx1k
         vJa6Cx15Lr5uh3yPFQCHcFXkIdEbvgOYbYl1ACWMw4PAktIkDfgQ1iovwhC2bVSNZcj2
         assLRWMMS1k34z3eLVb7r9HleAXqkvOqXrNFaSO8Gl+DMknjkIGOjFqU3tAdxB8eB2J2
         Ilo+tE+xT5PKU2NVyk4ChkazZA/2HvBYtI0j/vQ4HMAWdsxLYc56TjGqDc/cEk8ugFeb
         9WB/xq12y+XSBYc8XHq8sAMiDGkEOFJdT47U7HR2yD5ApqcZoVuslwMIs9Wtp5bFdoYW
         UZlg==
X-Forwarded-Encrypted: i=1; AJvYcCXRPvSBfO/3ruakf3eU2kw2CVEYk+UPlwKUBApX+aCDOUFGTNMz6qxj6c5bSrM5VEZ1MRMUEtiW6kGWQMAU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4dnT7C3l269HDBJ950pNyPdDZOvmB8kf8OZvtCiHLCbPOQCe
	fDIaQzJN6266Bvz9Mdh0Ng5IPx7oCEFqbsj57BVc/QSUnFkTXffGgUbgXiSBlN8=
X-Gm-Gg: ASbGncsnO14P40RzfF5zgJ+xDdneZQSCBngzdp1x9inIrOgWB87reCJsQEwFWGRjQe9
	t2cd7TsznwcprIMeGGQ6BY1ZJbn+kcg46uHsp9hZ4PMyOgieiFddYb+AoqtKPeeBtiCafiI65wB
	haRt9xUCAY9br7jNDaWMTG77sOopbWDHg7pOHl3TrMPYWDzJqOeg8FiNUUjOFAQvNyLY+jnzKBF
	sl9ERnyGXuJO2Gautr8Mx1tZOlMvm6yG+/EQNqv8plERkxPT2WsP6gpqcc2xfWy
X-Google-Smtp-Source: AGHT+IHZlEqAmC4u1AVb59drMSS6PU4rPjTcSOo8R5q0avIDJN1hm3vFKz+q9yZBVRK9BRRyVbVDzw==
X-Received: by 2002:a05:6000:2712:b0:382:495b:7edb with SMTP id ffacd0b85a97d-38260be6712mr444022f8f.58.1732231556248;
        Thu, 21 Nov 2024 15:25:56 -0800 (PST)
Received: from [192.168.0.200] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbe9013sm820052f8f.88.2024.11.21.15.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 15:25:55 -0800 (PST)
Message-ID: <92d71031-c148-43e3-9a8a-2cf92e9808bc@linaro.org>
Date: Thu, 21 Nov 2024 23:25:54 +0000
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
 <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
 <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>
 <hfkvbshgbhz3dst44kbdxxy34phrqtysxbfchuvefars7ibrwt@jqjl4oca6g2k>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <hfkvbshgbhz3dst44kbdxxy34phrqtysxbfchuvefars7ibrwt@jqjl4oca6g2k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2024 21:59, Dmitry Baryshkov wrote:
> Is it for the MMCX or for MXC domain? If my memory doesn't play tricks
> on me (it can) I think that on sm8250 I had to keep MMCX up to access
> registers. But it also well might be that I didn't run the fine-grained
> test and the MMCX was really required to power up the PLLs rather than
> registers.

I see MXC is also used by the cdsp.

I'll have a poke to see if I can ensure both PDs are off and see what 
happens to reg access.

Perhaps my first pass test didn't cover it.

---
bod

