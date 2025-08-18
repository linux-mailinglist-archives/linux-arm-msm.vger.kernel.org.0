Return-Path: <linux-arm-msm+bounces-69507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78260B29CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D853BA518
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B84307496;
	Mon, 18 Aug 2025 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="df3D12z8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F93304BCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507322; cv=none; b=bBEczk24W1Tk1DJmf6Z1Y0oNfbrlQP3ymfladDzPQgJia5LZtOADuonPBHjW+zdWVwA197JvhnqDJe14YYIVuGCxZvnPOXhiHeWyws76BQdd+SYOFb6WQjQCIGzzXxPL1XrNuIho1weS8cLtxVs5blDFdoEYICF4UC5X97tmvHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507322; c=relaxed/simple;
	bh=doHN6EunE4q7NHlaNCFD732IGI30PIFL/jWt6aNwl7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oh2SH7EhWjycqe+qPeZTenuPLOZ1JCQgQNIW6mUpUXw6aEa/17hhLsuSuvA+ccIHGNedMhKNRdhqe8wo624BGjMpYESEH/NMBQd0i/oQYBCvzCkHg86ujBIzkjCHmnK+yMS9wnSed71DHu5FHu0WOUsz9hTlsajIj20Jr6lzbdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=df3D12z8; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b47174beb13so2784340a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755507320; x=1756112120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZn/2dNIEW/eVFC5JfnC1aipczmqj7uzjriC8bPsWpM=;
        b=df3D12z82MVMhgsPXGUVgJaQC/OJnuqLR57UTGn6BL2o3il38p3Crpd2pcBReCyM0s
         1vshYXWzucKA4YmZxkfswh0ntUBwHAqmUudGvuaTDTfdG6J0FxLTpQWdmuL7WtHZoDCJ
         EZJWeNExogFV5DWN9duma+fTuMzVpIF94rhsDLmbBwW4WwGYZUs6UqRrWs0GtGL9sZhc
         FG6soKSradjdaxELBs7Lhd673NHlqAIcFu+p4wMkoVlIIiS9XiSD3wd5sgfOKltj9CLW
         XfZH7b32d8Y5QGUOCo7V24+me3NFhb7jXeYVrI3BwkBc2Y8UuwnPh14xcJNm+hGOWGTV
         tvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507320; x=1756112120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZn/2dNIEW/eVFC5JfnC1aipczmqj7uzjriC8bPsWpM=;
        b=W0sjeKFE9WELvncY+7VrABBTxACnrTgzC7/52nYFFz7gUcxf4qE1ULR5xryjUwGJ5E
         Tx9QMKpzRIdy8GfYZcEK3m1ValyKVRUuf16MbMidr4SMzH+Pqhuk3eIurU8eAOOR4/8O
         MYihgQPeK0zdp/ymqQGt/mrT2MZFkVruay94dp+uYbaguUWF3fiZHfyZhDGdjjzTvBkb
         tkribpKtd09KRlc/dvzBOmKnbwIH5aNTyCnqs9PUZcREEWwzFmSrP05UjsLe+PSbWHle
         oyOnKI1wPYb6modk8eoIhugSoK6wXOq9wjKxG7EoXRGKNg8TyL2sVr6RIgfQONUvyTn1
         ZXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5nLCUKwZEd7cWOIThLk5fCDqD1H6isAwlYrm6I0wghZkiMH3xzu+eHAFCy6ANqQwvx/ETdPoleMd5icRF@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZpDA1TKhc1dBiuP24SInGY2nDSYrBV8eIN/lv2oj1vcJzP1m
	UQzD7BMreDlMNIFlk3HBwfSTy/BRzFwYwAhwX9ZuyLxMVbEXa/mjJX9EgnSGWKSNQ9E=
X-Gm-Gg: ASbGncvZmIKR1OgVm0z5wrj/mxxx72q2gHFgw/U21bvDLVxWr9mYfdfsRXzl9XCTkBS
	bCDm2x6TawSzN5L7Tu/o5diaV1gK181d6EOebpECq2/KTOlLK3xnDaPrKVcrbzBAE8VZdf8q5wS
	QDvz3qbwf9Mc5z+HLJ3ZxPbUt7Noc/YRBBjZgu/+dOU/6jKvxnE4dShd1aEhxrkKBq18pCHolAF
	y/MCp1G67o8HuIkrIxjNZfqEW9GIUTNCfOxCXimQcq+o3BOAiePi0LbVos9cV02pDtEMXGWrV5A
	OHssOCvXLO/anmqyjAd/gcTWHaAUvKs/7Bzx8mWRXxlXAfL+4vgKY1zm8a8WsZW4nyfMKTHgIcV
	ydnDZj44sdKn1s4J4R+u8NSP8
X-Google-Smtp-Source: AGHT+IEwAoFmY5jt3W71l+SnRGhFYQeBBiVkuaX1UqUzqxvAN/4+HpvtbFxN/YglucS1GoqaljzKwQ==
X-Received: by 2002:a17:903:1c9:b0:240:6766:ac01 with SMTP id d9443c01a7336-2446d6f0386mr165051835ad.2.1755507319891;
        Mon, 18 Aug 2025 01:55:19 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53eec7sm73735595ad.118.2025.08.18.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:55:19 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:25:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PM/OPP: Support to match OPP based on both
 frequency and level.
Message-ID: <20250818085517.dj2nk4jeex263hvj@vireshk-i7>
References: <20250818-opp_pcie-v2-0-071524d98967@oss.qualcomm.com>
 <20250818-opp_pcie-v2-1-071524d98967@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-opp_pcie-v2-1-071524d98967@oss.qualcomm.com>

On 18-08-25, 13:52, Krishna Chaitanya Chundru wrote:
> +static bool _compare_opp_key_exact(struct dev_pm_opp **opp, struct dev_pm_opp *temp_opp,
> +				   struct dev_pm_opp_key opp_key, struct dev_pm_opp_key key)
> +{
> +	bool freq_match = (opp_key.freq == 0 || key.freq == 0 || opp_key.freq == key.freq);

Why !opp_key.freq is okay ? If the user has provided a freq value,
then it must match. Isn't it ?

> +	bool level_match = (opp_key.level == OPP_LEVEL_UNSET ||
> +			    key.level == OPP_LEVEL_UNSET || opp_key.level == key.level);

We should compare bw too I guess in the same routine.

> +	if (freq_match && level_match) {
> +		*opp = temp_opp;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +/**
> + * dev_pm_opp_find_freq_level_exact() - Search for an exact frequency and level

Instead dev_pm_opp_find_key_exact() and let the user pass the key
struct itself.

> +struct dev_pm_opp *dev_pm_opp_find_freq_level_exact(struct device *dev,
> +						    unsigned long freq,
> +						    unsigned int level,
> +						    bool available)
> +{
> +	struct opp_table *opp_table __free(put_opp_table);

The constructor here must be real, i.e. initialize opp_table here
itself. This is well documented in cleanup.h. Yes there are examples
like this in the OPP core which are required to be fixed too.

-- 
viresh

