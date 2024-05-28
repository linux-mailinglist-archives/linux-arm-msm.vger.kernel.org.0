Return-Path: <linux-arm-msm+bounces-20708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBE8D168D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 10:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC1B0B23C4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 08:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC13915E96;
	Tue, 28 May 2024 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sa/sbfRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9A13CAA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885783; cv=none; b=dBsg+tEdFYO9+v1EdxF4A5kWQEt4i3IWs6P+27gJFvfWRSn3qBS4InfA0GxILXA8mvH3DL3UU4ESKcGFwc5QHZpJ9BSMrv+oIN0XPAIX4BxEqqmz4GEiw+zDuKJdcV0ut1RBOE25iYs4yEr/IiKgxw8K8666xZhqCEqIy23gAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885783; c=relaxed/simple;
	bh=Y6f9O1rB7bAdaik8Ya5stBAwGWAwYs7mHE+WNyPAEOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLh5mLsTGXJQgfSWIU42nzpGaSzBwilJtVbKkEwYKeI/d7zucb/tAh5GOCBqZuCyIUVZSRjvbvHxHpZnXURqkqCHzUssrAfZdSaapa336oKJuOboV8CKJ+Y9jpmiGHwfEid9UccBNTMxxKgCVEy2PSTox2VDEcfWYr9jZov63I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sa/sbfRd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6269ad9a6fso68049166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716885780; x=1717490580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDOzOVJxnG+3KEM1LGz7y97uf9duOTHpiqETF8V1CyI=;
        b=Sa/sbfRdKnz8/QMS+xeYM3nSHA4bJisg2W0l25IlBxTxty4NiXGvKntownbMHodJzp
         tITa4FnuRTwj/iW57gW2YpY1FtzaZsh2cZBy3u7j9+1DoH0do0vzwd5zeh28ty/BYNd1
         wq7I7CvDy/HpeR5LSdeCPZF1OIwueGV55tCuYXt76fGjPc5a3kVlIr7C48gVI67C3K+W
         oVsUUdRPpTdKUw1u9NXqw5pPv3JoMavC98Sr0y8XLJpcaNUDcB5XhJeDBu0b1aCHl5Pc
         7smTUTEtiJbRY9fdWSEjbWUT2ob75jgy8fKva8xkFqI7/zUnZ+S/SJV3q/jTt3CVKkuX
         F+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716885780; x=1717490580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDOzOVJxnG+3KEM1LGz7y97uf9duOTHpiqETF8V1CyI=;
        b=F0Z+7k043ZP80raEKhPljtlLX/KKha67VJgYK5n8UyJS74PRXBKoZrU0eMBakwCKFB
         BWoQ1xrxdJJM0yjWGAAfwQqvzlfCxOpriT9B+wbefaWhK03Mn7SfdjpJ6GeHVWwfvk44
         oyGk799nHQqxiMNnC/D4xLXF9WOy1ggYzb9hfG4eZIv+2Zcib20tAKfeVAr+Rxp6C2MK
         8b22UBWzqQ7JFgIC+CzMXEzJgmAL/aJeOuz6XwFO+al5ssiRAkqKpHfFZ5KoizJjjvCq
         ONfk94jAFBMnaX7yCsfyl4qa2jZny4zP1HdJaC3PcepydWBMKgSuqTpSWAdmgJ5/zfhC
         iRtA==
X-Forwarded-Encrypted: i=1; AJvYcCUZH9Sr2SrRG1F4QAGIlfSAc7XPUzrMw/FYbYuYaG1zxujLCzgwlNK5PyDQGfwGV1zB4F67joxVjREQW8ahPKI1inusGDLmC18KMQqJVQ==
X-Gm-Message-State: AOJu0Yw4MGZW04273yU8saD8G6MANpFNRxs/z/dmlMYg2DJKF6DDRtVO
	3jo/qiuX4IwhISoveXrjz8TzSSgI5U6vvTpa7YHoQiTib3mbUExxMcmUJcFDFnk=
X-Google-Smtp-Source: AGHT+IFnwFpVgBPbSYYelUXVLbDbkXbUh2jkTNCogIsjRLaryTZNhcVpgseQGExAcVHtIzwZZr7icw==
X-Received: by 2002:a17:906:69d0:b0:a59:9c4d:da3c with SMTP id a640c23a62f3a-a62643ec91cmr716821266b.40.1716885780045;
        Tue, 28 May 2024 01:43:00 -0700 (PDT)
Received: from ?IPV6:2001:a61:139b:bf01:e8eb:4d8f:8770:df82? ([2001:a61:139b:bf01:e8eb:4d8f:8770:df82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c8170cbsm585860666b.20.2024.05.28.01.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 01:42:59 -0700 (PDT)
Message-ID: <9a0073a0-d598-4c1a-bb32-328d0a279152@suse.com>
Date: Tue, 28 May 2024 10:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] power: supply: lenovo_yoga_c630_battery: add
 Lenovo C630 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
 <20240527-yoga-ec-driver-v3-4-327a9851dad5@linaro.org>
 <ceb1f7b3-2787-4166-846f-2427b44b3e62@suse.com>
 <vc5nd5dl4czkuxzikazn7ndy6wghlchqsrcgxf7n5w53w3o3m2@spyfgp5pwy4y>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <vc5nd5dl4czkuxzikazn7ndy6wghlchqsrcgxf7n5w53w3o3m2@spyfgp5pwy4y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.05.24 01:15, Dmitry Baryshkov wrote:
> On Mon, May 27, 2024 at 02:26:36PM +0200, Oliver Neukum wrote:
>> On 27.05.24 12:03, Dmitry Baryshkov wrote:

Hi,

>>> +struct yoga_c630_psy {
>>> +	struct yoga_c630_ec *ec;
>>> +	struct device *dev;
>>> +	struct device_node *of_node;
>>> +	struct notifier_block nb;
>>> +	struct mutex lock;
>>> +
>>> +	struct power_supply *adp_psy;
>>> +	struct power_supply *bat_psy;
>>> +
>>> +	unsigned long last_status_update;
>>> +
>>> +	bool adapter_online;
>>> +
>>> +	bool unit_mA;
>>> +
>>> +	unsigned int scale;
>>
>> why do you store unit_mA and scale? This looks redundant and like a source
>> of confusion to me.
> 
> Here we just followed the AML code in ACPI tables. The unit_mA is a
> returned from the_BIX method, the 'scale' is used internally in the DSDT.
> If you think that it's better, I can change all '* scale * 1000' to
> 'if unit_mA then foo = bar * 10000 else foo = bar * 1000'.

I think that would indeed be better. Implementation details of the DSDT
should not dictate data structures in a kernel driver.

	Regards
		Oliver


