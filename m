Return-Path: <linux-arm-msm+bounces-72531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C7CB48756
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7713A388F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C8029AB1A;
	Mon,  8 Sep 2025 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DeoQeGoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5063D1FFC59
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320624; cv=none; b=kuZ6LodrWFqsjGs+UR5qRtqPepCWoEXdchgQhQm5eMICKoIu8eVgJMIS7yfC86iwgbW1EUKMn12zMSmIA+w9NHHLC9ov4PlGY//VyBFRZhKeTwxNGRtZGABLVI2FlQmxrezgBdlsyWe/zbqoD4nNqIG29hQv/osErDTetP8Xqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320624; c=relaxed/simple;
	bh=NXnb+PUluiL2AhSnB1IAsaQbX54JUl7zDPq2/38XIo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxrzz8iR2c5ZZvOW6SvPtpoL47/cst+80wIcPiDisaYI2IMHCA9KsL3kH+HuPK/rxZszJyz2gNrPic1Dvfh5lcJZx0UbNXMRfz4aULBRsWnblZgA9lDFTQZQDP194d0vnF07dZfY6j2WogsXuWOXUWMcD7xwEQ+MUTls2OotwIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DeoQeGoC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b00a9989633so778185966b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757320621; x=1757925421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XH0JCQWRm8WTHxpKfgo5DMbnz5sypzW+t0+NXBLukE=;
        b=DeoQeGoCkIZbJ0qFP6yaMOh4YHZegb30G1mfgxHCThNf6a1zwkgsnKo+QtEAX888Cb
         7+QBxpGT9VhSAE7M2sXITAG4ZGPBy/AgktBhIwk710XdFPRJ6iytOLWsS1p6a0t3bvLQ
         LQKTL3icelHKaP5LaVbc9A55AvbmIa9LbcGZNggtoJdmi2ppPqnOEa9VQT4dIKeu9yOO
         oVMV8BigZvZshWaAXUuYEjzTNLoXGeXCDfhTbChbfVQAFa2xlKXGR00Mkxzox+ncvlBp
         RtzoBdqBNHc+yLrzm+4X7e6qQTo9nxPt6/1ARMRQHGiHsCMXzeqPo0pKjVnBf8SdS26f
         +3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320621; x=1757925421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XH0JCQWRm8WTHxpKfgo5DMbnz5sypzW+t0+NXBLukE=;
        b=ZvaLrawnq6yANexnlbDLLhkREZ1lhoOxOMQYBbjcIh/638dmmadpe5A+XkFWA8/NoJ
         VfJFOK0FvSRYu2yiXnWW7xwx7Z1E8DLQWXt/K0svnYh5uRTiNsZaG7lAlnoLurJ/48Ny
         qWszwTA0Xg7uatvLdMghLWfBbsSCmy02sCw8ODjwMCkci6cPb+JvKmyl2qoHAyXistLS
         mPqz6Cw9R/ttDcPCGR6wt1uSBPG77u9L9uiNvVyoteyI2N7isBstdCxq9+PjaQdIUhG4
         MKdutkuQFOcZuEpb4ChC+xZafK7CzXJ5oh7Bzq5Lp8k6Ebc97fNyDDaMam1AKw0UWgmW
         0FYA==
X-Forwarded-Encrypted: i=1; AJvYcCXOCrRPxdYaPeMJuja21MHqRrYAVzZ9FNND6kOcWe3t9GchAeLpSno5hbagGBC54RIyP163E/fIeCmTG+EA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt+DyKlGQeQSGBTSR+craCIrKATeKO/suiQwRB6szjS0zAjfY1
	/xEEVmn3tRErnqYq0Gmb5vavqVw7Z4EtnaV23RUHO9g6lPbKKuaWODuPpq9TbG1T1VQ=
X-Gm-Gg: ASbGncvQjWg++43mwLAu0zlptpF0gFY/RPLEamW9ZnUzlXGcIKhN38EQ+0jF2gYVMA4
	5bcFgHaHX/q9jV1HcK3CCKYI5OsycK3TWJTQWVBA991U/W6pLtKTPSEWuywUHPq3NlMJwcOHvzz
	VQAZFTC0+IF4mcfGxRY5t9TinuJDD1M/QLVPHyFRZ1W52HycD9PFEf2mP+76DHjvfkSKlwNzel5
	rgJ0ujNtgq3MM3id0dp1V1v2aoP5IMdCjgxuhGcMlz+gQ/vj/lKQMTuKAmWmlZJlNfzVTptQaw6
	4uCgdm6nqIGZDZmcWTVaNzlvLOWVwaH8TiuPiMop6/GoJp5c1ZmI0UWVBDHLlcCEMkRKnVEz14E
	mY3yDVJE73zh54fy/rnPcy51eT3BxGG7U
X-Google-Smtp-Source: AGHT+IECPDhPNh/BGrjoNwZ3MFMyy/CdulLWdnO4Gww80R4odqdHGExKH03tYQgvNoDXudzRKyAP2w==
X-Received: by 2002:a17:907:9691:b0:afe:ed05:2e68 with SMTP id a640c23a62f3a-b04930ac043mr1180321166b.11.1757320620463;
        Mon, 08 Sep 2025 01:37:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm21501622a12.44.2025.09.08.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:37:00 -0700 (PDT)
Date: Mon, 8 Sep 2025 10:36:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Message-ID: <aL6Vp-3er71AJPJd@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>

On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The CCI clock has voltage requirements, which need to be described
> through an OPP table.
> 
> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> (which is a value common across all SoCs), since it's not possible to
> reach the required timings with the default 19.2 MHz rate.
> 
> Address both issues by introducing an OPP table and using it to vote
> for the faster rate.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Using an OPP table for a single static rate that remains the same over
the whole lifetime of the driver feels like overkill to me. Couldn't you
just put the "required-opps" directly into the device node so that it is
automatically applied when the device goes in/out of runtime suspend?

And since you need to make DT additions anyway, couldn't you just use
"assigned-clock-rates" to avoid the need for a driver patch entirely? We
use that for e.g. USB clocks as well.

Thanks,
Stephan

