Return-Path: <linux-arm-msm+bounces-47614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BD9A310A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177C01664B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9324A253F2C;
	Tue, 11 Feb 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLmxfzZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6C253B4C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289880; cv=none; b=a2W2sE3cvy3ZmG+H6ZB5Y4TufzmW9icm5GUwsarsLWh6mG0YVLKEBj2dkSl4CDIOAbjWZQxMgvLNM/Kc4rtNvdLj+BpiNVmlDoQbPJPMGIYM7Xj7SC26fPLuHxPRBG5PbKTSrzhtRnF9mxAUbnEdRAxFHuttWXF+g2PWBZqA1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289880; c=relaxed/simple;
	bh=JH7ijZNDjNdhRFML1H7hwn6Ylh+jwwnUVby5SKkbOZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUKW1EGwUZJ5zb+hmNr2yFQq3LTx39jVlc3bh6JaSv+RicbX2oFa0xfSdbaSKh5SHgnDMejKTeH8JR6RGMlUcI7bz66JB6pBEYJ7P4i1ht528YM93L+taLqwGPSE+quMhw3UcVvGE7mx7uTMFjiUVs0X053TSVVaWTK9T/glu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLmxfzZN; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so2526183f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739289875; x=1739894675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jPRSZh3i6FtRdc7ODsguuXOWwzfovZBUq+Z1/sPEyX0=;
        b=dLmxfzZNmUXQZ9Bx69tBjdTbdvcDNY21PN8K1dLjLEWGu9Jv4YMQMCxDU8q9r7U3RX
         MY9viEfz/+hJAvaDBpQzcYJqP3X4c7CgMm3svXyv+cJPtfwW+zZvtZ8JCISlz+Y73nr3
         REI4kkeTc+iXgq9sREILI5BPq0E+0TgUW7uYBeER+zY2A2OoURsIKBBuD/MKBx/MuVy8
         h2/eqaVJk+xNBFEgqcLtWCJb7QRiThBuCylk4pDGNTIiufOO/HeXPHcpgs+VzsXRRTVV
         dufIOtnxwOMJ3O1tI+X/wG0VuW42L+Y6VjaxvZpwdkEUioBqSSd+r4NBFCOAHDEQYIV3
         96CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289875; x=1739894675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPRSZh3i6FtRdc7ODsguuXOWwzfovZBUq+Z1/sPEyX0=;
        b=A/oWcHM7vZgiu0d/0cwgmVLOplGXbm2GuGsohI38GQTuo6YY921VwbUWkd5jSN37cw
         X9AQU2CaUKiSiQ+PbawG1Wd1WuA684eFHWC78iAkyXb3sccno34WxerIAKNOOOYRHy4c
         QVtAap5VQKUXfUTNAlXgo2fqRBu+XpEGH137FvwKgqO7IsMQlE8Mi3J6NBAMoa5wg6XB
         w5rh1OOryr1f9xAu/BYZ84YrVDklZepngWaR4plEbCAeyETQmt8wWEG2lcikADEm44nX
         +nOUR8ugk2/Es3S/JV3ht3Z5DCpn9WculCPB3z/IoBB8q0mirMMKHcp1UnsqiVxlJ6oZ
         WvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZuOK4qmIlr8aAbyB24mzgGm8fqoiv88ReDmkDagsWGzyw+Dat8CXu33DvNwVh2Zyuejj0MLzoukXTNBDw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm8Fyr/qiMIDN7JwNQPEsqM36uhddU1agCerNYrl3lsiLpvxwj
	diakEssfZ5qt6WYey4FtHD5BF7yQWc+EWl/Ggaktfzc7IENud3qEWw1Jy+SB3QQ=
X-Gm-Gg: ASbGnctpaLpVS0U7u3MxWHHmWX6n1zZCL1HzRdqAXrRfjOttHvOsXHN/DAGliAo/pE5
	mhVJ+y1vVFV7cf80msmbey/ifRVyJs6hhnvHi1PFUmzSu/wu0DoMEPATjCZDyXMQ9HPs2c2Bjwv
	fDBjR4SnvzV8FMqoQCm0nuqmcpkX8R/0QpZxe0VD4m0PNkKk5lTy6BqBop3kYcmQWguhPSlM1SO
	XwCXJDme8wwS3xldSI43lnN7VR2YxQ/Y3HrmhYQX/SVI3kgxeNtKv2U/BJD/RzAyDGDwDMdwg09
	4MGks1tKsTMQ+ptp0iCqDeY2pEoEuq5KZnQ0PZFv6+eM2KfpZA9ZJ7fsgg==
X-Google-Smtp-Source: AGHT+IGZ6rqRtEwePiKwnX4xQSPq4bLPiyPcMlt146MZTNkCKpzb/PK7/r6TdTiPg3VS3vFEj4i9OQ==
X-Received: by 2002:a5d:6daf:0:b0:38d:e149:f863 with SMTP id ffacd0b85a97d-38de419408cmr3758370f8f.24.1739289875146;
        Tue, 11 Feb 2025 08:04:35 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd6080926sm9084581f8f.83.2025.02.11.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:04:34 -0800 (PST)
Message-ID: <a02289bc-fac3-4ea3-b5e1-8557c2b95550@linaro.org>
Date: Tue, 11 Feb 2025 16:04:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] Add SDM670 camera subsystem
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250205035013.206890-5-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250205035013.206890-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 03:50, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> Changes since v9 (20241218231729.270137-7-mailingradian@gmail.com):
> - add Reviewed-by from Bryan (2/3)
> - drop applied camcc patches (previously 1/5, 5/5)
> - rebase on media.git branch next and sdm670 dts patches
There's a minor merge splat which I fixed on this tree.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-media-qcom-camss/master?ref_type=heads

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

