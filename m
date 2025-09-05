Return-Path: <linux-arm-msm+bounces-72221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB61B450BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5FA05601DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2BF3043CE;
	Fri,  5 Sep 2025 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAqWoevZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D63302CC2;
	Fri,  5 Sep 2025 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059234; cv=none; b=h+9V5DnbBf0xgyVuGjoh3VJ2sGA5PAWxjvawiW5Y+rgZvtXrO9i7s2RGeKYjGgdA+Jt3UxDCd2mq3VCFd1f8yxuzJgT4wYDIFX0j/0J2LNfWTIFByoy6IcpC1evAu6N0x7zaEnTwl880KCIdhbmzy+TKomtk24IQwNkKZONx+tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059234; c=relaxed/simple;
	bh=09tuQWvE36b7jo9VZQxE1OAtLMsUMH7OUiE6RAUdFs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVNVjOqVsHtFxXUwcVeUM6wNZZcQwwYpUEoWj9jT0VMmpHeSzykcV8fdRg6oIM7SqYZkZaZBgF2fnumgXa+vW6qTMGIL8g0FjW+dpcrFS50zXQ/OX0ZuUpwskYXk1XBgp9VK2jfWddTqZt7d5u0csLR0ab2Qq/RiQuvBnlObv6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAqWoevZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B72BC4CEF4;
	Fri,  5 Sep 2025 08:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059233;
	bh=09tuQWvE36b7jo9VZQxE1OAtLMsUMH7OUiE6RAUdFs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAqWoevZjiCaqhD3q1S0Wi9LCc/ErPSFLei5ufIkKauUNhuiAG1ln9sfMBiCdJCyp
	 mA2LT8JrxXXJ0G6qzNqeSS6aCn/mKSW2Q3NfzfvTaK3FKmXMtwr3HAkZkoJz3894jn
	 W22wkg84edI1nhAj2B12DWR0HLCsKEgU1TIxgu6bShrRXoZeSOAMNK/3IHeP3RcdpG
	 zWaLGSKE/Oud5IOV2eZ64qfOFAAp8MX2mB+6NgAxw6q2hTsCXmbZPoVqMQ3PlwYq13
	 CAlagtJMLvrbUTalIChK6KbLqbxoCWjVGIRVszGLxzcTdNA0dsavP/lbDsMyL4sMlP
	 KzlYHRmAHhIPQ==
Date: Fri, 5 Sep 2025 10:00:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 05/14] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24C256C
Message-ID: <20250905-fervent-mackerel-from-camelot-a5d73d@kuoka>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>

On Thu, Sep 04, 2025 at 10:09:01PM +0530, Wasim Nazir wrote:
> Add the compatible for 256Kb EEPROM from Giantec.
> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


