Return-Path: <linux-arm-msm+bounces-49234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9CFA43935
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43C2A44016A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D366D262D03;
	Tue, 25 Feb 2025 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbtKSI2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9D267383
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474734; cv=none; b=NwVo17SJSB7Fo/zaPt9T/AdLeDTBfzdJKgLcz0xBm4XjRjmQ3dZR+gSU1OjrBilfWpuZPDM5ulhpWS3B/kzPmqQT2TnkacPQM9a0ngPaxhJbMuq5Qu6laykHP0NBhAE3eYxFR19E/DZELMtSioPeNhjaj2sUFe2roo9zXNUxZ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474734; c=relaxed/simple;
	bh=I/ncJfEJtEiSeoSCR2blElAGuBHz/yWCQD1ugBNnzD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfIGbtxBVs9XrrajnbIrwAHevcDUvzcrhHYivyf1vHI1xg5JEY/CX23XtMjuI5rjdz0I8ny8hBq5Mz14xoJYTKFfa7lsdqqpqbDE8sZBmxaaJMd1MMv7SSIq/G+RgdzvJpmYUEWOL/e6VSDA5fmyQJ/OWLUdfpY1EoAwwHhaHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbtKSI2x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740474732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=;
	b=MbtKSI2xQNk/V1HxCMrVWJ9W7oqf4wvFgsYbF8OazDcVU6pyNMi/2jqPPNz0/SsREasNM5
	2CQzIeZeU4+JqekhMKe9HZY7fCY0H76HShxF6FEHyao3CktoE7HxmC1GE4twD0Dhmojre6
	x3aQju7X6k6E0V1mI3l93z5gTLdyiL4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-7aMucJC8O2up0N6WPMXpZQ-1; Tue, 25 Feb 2025 04:12:10 -0500
X-MC-Unique: 7aMucJC8O2up0N6WPMXpZQ-1
X-Mimecast-MFC-AGG-ID: 7aMucJC8O2up0N6WPMXpZQ_1740474729
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f4e3e9c5bso2189177f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474729; x=1741079529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlIg0iX5rLeI1/17Pjh/O9LHmXIOARF0OAc7AU9Migc=;
        b=c0deQsad9CCjcwomJfwduQTXKcMbEeGyarzHvZZ8eT5fyb9bLi6dUoLajYV/OXyI7v
         QzZUDLpCFIPdrAP0BG3Qhtznejruv/syxLk17VlRtvA/29qGfkL7URqtDKmAE0wCgqdj
         aHfDgPlyOKjF44BeCXW4vVtfCjKvuPnrWNaHaM5PU6Zt0Vy6yhBwdpUbQIfR55ehEHiY
         FJd3hG6+qMP9jkMqjdnWbUiCnPTcoDl2B/bsy5vgSU7fwvqN/GeYwc4y+9VAdhGh34OE
         TSoGNPv8z2+lF5W0Kbh/zVbCJyJ25T8Vm3KfXH3mRrMsFpxQaOmm5zr+BLa1HvlfwgyW
         jO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhn6mLXzPRIgiYiobb4BKhEodoDCs3xw7RNVfLdQLC+sC4Dn2I3GUG1UorQW41jmWCarppIbSpBN8oa6Wg@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpJuFOtAmy1MydNf9DcQ2GUWuHt7jX8lEkJJXGPH/l3lZyf/w
	oSUos+J2NuWML9cCrWlSskTiD1RB5ntYwvUKub4idMQNY8X4Mcl+CQwJvEyyxnIpky7JAlCFqm+
	0wApdGejlHys0s+B91ohm1qdtGTHezUmM8h2IzJdW4qlLSjwuj31T2Kkc4dRJcc4=
X-Gm-Gg: ASbGncvxmsC+3ru7pUG/pR8rOBuu5JutI9RbdOMyf5Y0Fj07uOiRmMYWT3lC0eszhzN
	A9bKM85f3Pp9Fy+hHcq4XecTNYXdFgX+/nrAOur5HeAluxTZWv3n05F5ezL5MYQVBwProQCAwG4
	BoyyGd6PVkdmnXDynOtXdEZmUFlg7cwNtnvTw9LhB3E/nimYEJs096ZXBRJyJdtjAV13YLf4BL7
	RA0JWYFOlvfHC7aOy6nT+lFT6GrwrqR2YNuarcagPQ5l0NqkJJUo/0SrMdHTKr1hznJ2rKyfgMK
	FMqtbYjkFL6frX2WE6gAoI1BX0mighFywr5lsjNN72E=
X-Received: by 2002:a05:6000:1548:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-390cc63ccf0mr2071737f8f.48.1740474729251;
        Tue, 25 Feb 2025 01:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEolJkbGKjJj6h9uEQW/S7a4oRbKctMUQh95C2XKh9ehqDL16AcT96CB9ug5umxMfHDYCtt4w==
X-Received: by 2002:a05:6000:1548:b0:38d:daf3:be60 with SMTP id ffacd0b85a97d-390cc63ccf0mr2071706f8f.48.1740474728801;
        Tue, 25 Feb 2025 01:12:08 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd866dc4sm1624406f8f.11.2025.02.25.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:12:08 -0800 (PST)
Message-ID: <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Date: Tue, 25 Feb 2025 10:12:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
To: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
 <20250224180152.6e0d3a8b@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250224180152.6e0d3a8b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/25/25 3:01 AM, Jakub Kicinski wrote:
> On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
>> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
>> +void *phy_package_shared_get_priv(struct phy_device *phydev);
> 
> A bit sad that none of the users can fit in a line with this naming.
> Isn't "shared" implied by "package" here ?
> How would you feel about phy_package_get_priv() ?

FWIW I personally agree the latter would be a better name.

@Heiner: could you please give that naming schema a shot here?

/P


