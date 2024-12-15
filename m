Return-Path: <linux-arm-msm+bounces-42258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4869F2389
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 12:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40EE91885E88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 11:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9296161302;
	Sun, 15 Dec 2024 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+loVucR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E81487F6
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734263917; cv=none; b=GxzCYgEVlgdVL+sJezXdHhPtv60jiakqRB/ykmZdTEX5Ckp0dDukVGZOyzonMEjpcBRLmA4EcrV2tFndwrv6iJVQ/unUw8t+yVruIAE+c1JV7COCFSEQhb0GwLvn2J50g4Olr7cN+Z5DEyCDk0VJAWhCK4240lxl1Zkp6xhr1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734263917; c=relaxed/simple;
	bh=d+pfu1XROrpeafS1eYKpAbT78e7jb/FH6/Nsca/bRPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K43lQVSJS0w2uWz/qfFB+Ur19odUh3iK2Ea9k/0q5q8TjYMhBKIC3vSlHoNCG85qJ5X+01hrMSyyW6YltS2CvP5XGvVn+Sb7Hyp3Q2NGfnOVPH9fl4XjueK5LMCHFH7A3Z/dJwryrwjwFrEzsaernQq6e6cy8AH0vTMHN7Ic/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+loVucR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e38838026so468162e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 03:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734263914; x=1734868714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/kPa7EZggbMZnJnKi8Z8wUeoKFvdbp7AEN/NzD7/uM=;
        b=w+loVucRhsmWiDbf82U+klvnYYUpP0/qVvu+HehD3bfOy0Q+273ILHDXzUePgZCOw0
         Jx0FB0E0ZISQesSqMQxhGM+a53/0VAIyZfIt98Tz9p+hTjigbBNnj7X9dH+AC/LTYXwj
         OQiyFgsp2mSoE8SN+Jkdf7aJRT1V/GEwG+1oiTQxNNRQwxZxzE9DVnNXoWOlM4R3DwLq
         t1C4SyPLBQDL5ZPRFgdu1WvaulBCDtzWqFIzLV329gMIu8exyasAI/N9Zva2ko/bxTvf
         twKRHr3MBml0vlOsQlyslRz7QOasBRr+/ihV1/AzBggkNs7WcVjeMBUZBlA3JqXVKmdl
         cKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734263914; x=1734868714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/kPa7EZggbMZnJnKi8Z8wUeoKFvdbp7AEN/NzD7/uM=;
        b=fw+fLj7VV17FFmvB/XVldOVcyvKoLwKXm+BrsETZkX1HevCE6KphqHXZwIFtlhKWLm
         psTwQRZpzX/wxwz2/JKxHVeSDrL5C1QqBSG1JHpNbDOrTDltoI+vxJvBDVV33ZdDN8cV
         /kZZOEFW5y0apNqCsOBVnfmJf2asYp7d87tH2H6WpEitJIwx7ZSdHI5w7VoPYln4eLHw
         3yCmub+z7b6/cb9rgOW2GSXbFxGjqxgHCffjfTwXSq095jA+9x/xuF9eqDZWAl8MK/Ic
         3xocxUDcEnBLOzbrJUTtwj1OttGOEhMjl3ZpU1JIGameI8C8R8/NXAe6npC9OMDArIfd
         9Jhg==
X-Forwarded-Encrypted: i=1; AJvYcCVs+x32RTKmSmkyP6ZLgdhh9hlO3hApcyEo6I6WI9MfgMupMJz2RmPwi9wX+VxUXD0h+wkSmnPzuMZrINBe@vger.kernel.org
X-Gm-Message-State: AOJu0YzkFKLCcpJUBRYKb0wfGs55R9nmaqSV4epTTVZbDkqXVhNV1fLK
	HUMv7GFK0uSVVhoEsVWYh7awmYYURJ965If7WOBbx9g0FgRE0mWGq/acqVOPz1E=
X-Gm-Gg: ASbGncsjL4jGbgoJ3XDl6ZhZfIkGU1+ti4HvSZZ5z48U+v3V2/Tu94ys5oTdxTOwN0B
	wjGhJ92k9QsnAbIOGVHsO6Akh82bz2AuLt3M6hupDnmukF5puwbTjp3hySuunhnBrey9bK3mDeS
	g1DUPbQjRvSLo8HOjfmsFq62DZBVZ7ZSxc+FN1lFJQzP1E1T3dJhNCK2hohZXFh1FXaW38Z1xXB
	G2K6DteaK+ok/bDw6P1Qk1IH/Jz6pa5645l/V4jAbO3hz3Ekt+YrCiopmnVBnJw4Bwdy8vsYgtd
	cyMFtCWhGpElavS0eRdip6RR34ztPGDbWQ0=
X-Google-Smtp-Source: AGHT+IFTUZ3GMs7Nz8u9GUpy5ovc0Jqqr01QOzyL8po2NQJCJYBql7UOXcPOqTrAeb9lNKlyvbQa2g==
X-Received: by 2002:a2e:be9e:0:b0:302:3d74:a18b with SMTP id 38308e7fff4ca-3025450026fmr10348671fa.9.1734263914271;
        Sun, 15 Dec 2024 03:58:34 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045358sm5491911fa.35.2024.12.15.03.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 03:58:32 -0800 (PST)
Message-ID: <60bfe389-cea9-4aea-9175-fc80f1e9f594@linaro.org>
Date: Sun, 15 Dec 2024 13:58:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "media: qcom: camss: Restructure
 camss_link_entities"
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241215-b4-linux-next-revert-link-freq-v2-1-62d5660004ea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/24 02:33, Bryan O'Donoghue wrote:
> This reverts commit cc1ecabe67d92a2da0b0402f715598e8dbdc3b9e.
> 
> This commit has a basic flaw in that it relies on camss->res->csid_num as a
> control to index the array camss->vfe[i].
> 
> Testing on a platform where csid_num > vfe_num showed this bug up.
> 
> camss->vfe should only be indexed by camss->res->vfe_num. Since this commit
> is meant to make the code be more readable reverting will simply restore
> the previous correct bounds checking.
> 
> We can make another pass at making camss_link_entities look prettier but,
> for now we should zap the bug introduced.
> 
> Fixes: cc1ecabe67d9 ("media: qcom: camss: Restructure camss_link_entities")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This change is very welcome.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

