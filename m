Return-Path: <linux-arm-msm+bounces-18118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8028AC470
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 08:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B416282085
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 06:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22FD481A4;
	Mon, 22 Apr 2024 06:45:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD41F61C;
	Mon, 22 Apr 2024 06:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768353; cv=none; b=NDOxH124baUycsFYDZfMn5LMH/XKCei0madf73VqFQhMdKSiJXpuG31FijecF0/T45Sd8T9nuGilGN3DJ1BaGHkYvG+w18T0spXeiPPQ+XK5+sChPXQKjKe5ZRjk+NiJDqEIwD3RGM9QlpYFN4rQJpv3HiiYiXFJFjsfJJ4rmAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768353; c=relaxed/simple;
	bh=55gYPbLVDIntV96sOLdLdGIt6h1AKDgfjZMY+knQ09Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBTH0krRx5KaMeIJJaGmjDayvwHp7+yRfxaR0a7+iCQ31u/OMZlrvCzQ9GhNNq0vW3+MqCPq99titdMHtSd+N4ho5Kc5RcGodMaaZg6hKMynoSsqi6KABo8M/ptH/7Y15asL/46vXtCwBhjMC8QGcor7t8JRrjfnL2P7T+2sNyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-571bddd74c1so3684125a12.0;
        Sun, 21 Apr 2024 23:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768350; x=1714373150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhIyK0k38NfXA3SQgYdyxr+nopAq4gC1c596LtQxjg8=;
        b=ctGozYDCH0TaCJGcuh/aMGEFDabSRe4eTqFQU48J5DwUXO8f4XB7t8mu7f1ij3jAMi
         Y3BRbCuba0xV7I3nmYSxN9y3jBalIEKVAmP9PyuWhJ4xb6zF35s1MGjat9l/pNAUOfeA
         R+5yWHnkw5CvRvpP0uKaMCiW1bp6fNrl5OTfu8p+WZwYNnhWOPdikD/MCsxAt6OqvW4u
         4NzbZZHzTkTnnHsFDqsCutwlFwpso4U6PkYs6N77TyltzXUF2wX5xeXG/ljduA3VatLY
         HwCTTo3ebGrdKurej6tLJLTUZYT32Sir7na7ySyL6wkHfpZFJtUqwQoMSK5vD1MuEo75
         Vdsg==
X-Forwarded-Encrypted: i=1; AJvYcCXMLJQSoL/+6wOhWO4V92cRX5qC2vtUoPmkkAA20fF9BF654U1mCBl6e9CzIw1x3V6tiINOmTzlO0oVuV5iqCYh8QBBaE6kSFHSu6qbWdTrpgBYyeT0zXxmnmOb0MStN6qdW4+ea0XYwpiZKYbfg/fL+lChwGba4pwVl2Ou7Mlm9UW1MIcl7dULJw==
X-Gm-Message-State: AOJu0YzwWdjXhFyINGUJey7pfPojA9Bo/ZWdt2WnR8nndoEoi368lfNp
	laHGIpTWsfBtxyXRORDxkRLPeS4QYlT2EhRqLpV59aP32VL75Pqh
X-Google-Smtp-Source: AGHT+IF6pFeOYyFJcUR2YYwktzKqqEsVL+7YNw2LCDfI4a+snMHD6EFtqrqfydxM5T1KrxphxXBijw==
X-Received: by 2002:a17:907:1b1e:b0:a55:ac3d:5871 with SMTP id mp30-20020a1709071b1e00b00a55ac3d5871mr2083265ejc.77.1713768350171;
        Sun, 21 Apr 2024 23:45:50 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id sa40-20020a1709076d2800b00a5255afc856sm5357362ejc.84.2024.04.21.23.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:45:49 -0700 (PDT)
Message-ID: <6ef3422c-d931-4993-856d-c080b11d72d5@kernel.org>
Date: Mon, 22 Apr 2024 08:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] tty: serial: switch from circ_buf to kfifo
To: Anders Roxell <anders.roxell@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: gregkh@linuxfoundation.org, linux-amlogic@lists.infradead.org,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20240405060826.2521-1-jirislaby@kernel.org>
 <20240405060826.2521-13-jirislaby@kernel.org>
 <CGME20240415125847eucas1p2bc180c35f40f9c490c713679871af9ae@eucas1p2.samsung.com>
 <91ac609b-0fae-4856-a2a6-636908d7ad3c@samsung.com>
 <d70049d5-d0fe-465f-a558-45b6785f6014@kernel.org> <Zh-fgtujwjiSXz7D@monster>
 <c091da0b-a150-428a-bf96-75f9f3eab2e2@samsung.com>
 <CADYN=9LCJS0SW4PuF+e356HUxhzJYi093K6U+BdErPohq4RDWQ@mail.gmail.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <CADYN=9LCJS0SW4PuF+e356HUxhzJYi093K6U+BdErPohq4RDWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17. 04. 24, 13:19, Anders Roxell wrote:
>> I'm trying to run on two dragonboard devices db410c and db845c and both
>>> fails to boot see the boot failure from db845c [1], linux-next tag: next-20240415.
>>> I tried to apply the patch [2] (that you proposed in this thread) ontop of next-20240415. However, that didn't
>>> help bootlog on db845c [3].
>>
>> This is a different issue, which I've reported 2 days ago. See the
>> following thread:
>>
>> https://lore.kernel.org/all/d3eb9f21-f3e1-43ec-bf41-984c6aa5cfc8@samsung.com/
> 
> Oh ok, I did the bisection on db845v, and that led me to this
> patch 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")

Could you re-test with the today's -next?

In particular, with this commit:
commit f70f95b485d78838ad28dbec804b986d11ad7bb0
Author: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Date:   Fri Apr 19 10:09:31 2024 +0200

     serial: msm: check dma_map_sg() return value properly


thanks,
-- 
js
suse labs


