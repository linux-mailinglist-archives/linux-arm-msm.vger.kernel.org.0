Return-Path: <linux-arm-msm+bounces-74045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E08EB83B3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10FFB7B15D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C23D2FFDE9;
	Thu, 18 Sep 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aLZwD3nk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8EB2FFDDD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758186719; cv=none; b=mTVvVvCimvp3ltWfdXIWlE9FC+BaN6csCdJezoab0ANu8xhGICLAjzz3AgmzRut9VBrV7nyR7NHhXYuJCkaeec/WTE64SRiFFj5Qcg2Lotv8hIetR1tNq0srzqIT9hTC7IFIG2sHZEkCE+r+G/DHYjbV6PEnmIHQ0gTJAJ2CbLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758186719; c=relaxed/simple;
	bh=YehKDSxyn3BbBA6CQ4vbBJf8xzzXSHHNCC7si+BTARg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juF8VNdJzwdAdjYa3FJ8d9ROMb5zRbvrpV35tXoqjghAYOKtuUF96ZVn/LdRcqx/VerV64OAnUhn2wp4kL5QB0XKyMUCb87C1nPAYcnCVEIdWGzLOeofWoV3AXVn9dV+uEbQszLiEGU5a20iaYqX8b7J1LY7uvtr4qaM6l0jplM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aLZwD3nk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758186716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fIIhFJxvx8zBwtE+pqWyod+Uw5u+tNDgcJScnd+oTIw=;
	b=aLZwD3nkAX92Qao2m8Sv485XZwAcVaH0c6sgF8eZRSmJ4VndPW0y6zmWsWtOAUU0tBRuc8
	Ncn/aOK0/KI2ew7WUcLMajT8xYT9mWKMtmNdI7vRAiX93qoCqZtrleAbX4g3pzDPxNaE25
	8nDoODBypbuQVQ97G+u/2g4ttW4ZCQI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-YPLtNzdpMlqXE6jy5RDw1A-1; Thu, 18 Sep 2025 05:11:55 -0400
X-MC-Unique: YPLtNzdpMlqXE6jy5RDw1A-1
X-Mimecast-MFC-AGG-ID: YPLtNzdpMlqXE6jy5RDw1A_1758186714
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b986a7b8aso3791985e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758186714; x=1758791514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIIhFJxvx8zBwtE+pqWyod+Uw5u+tNDgcJScnd+oTIw=;
        b=nRNp7kXhuR/q1hl8/vM4SbtZnkRbWwoWAFgMCV308PXC6oV6OEESdRcvJdVkypfoWM
         5fY4nWHwEWylp6b0M0rLP3AQvxGuUelvZcrV+yb2k5totb5E7FnEc5UCtm3Tx74rR1HJ
         Yb1jP8GcjWgIASb27D7poWEgzNE5a40OsbHHma6Czgx2TaWbUzeKxmcCnLPnvQ5kr3g0
         pzdkyLoJajyVqGavp1YV5+qhD+LEgYJZMBZG3VkLhmIYW7ak2nBRkld5yBZVUKIeHy3C
         8juP/jEjiFkkyY5TTLFPT9VBbQm30VqsNHe6kRflHAmpGwcufpCUg7MBjjVSc8B0g3zB
         PJCw==
X-Forwarded-Encrypted: i=1; AJvYcCWccmIilroS9zf205UwFzLBx+jd1zVpAFyNgib+RPi7+J+QgYeVTi8ORVOU/B+ZeOPzVS73AEUfHkiXEqAV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zHQ4UATTCb9Eq/w2GBY8whide9OKjZyu9jofe+gA5dctEbZ5
	th8msc2wpO2/mGUZBWiDsez8Zw7eeN7dKTRmD66F4IcRO0xtncRY9QPgMNOvZdQ4/Fo3hFIb2Dg
	gXtfAKOCGRz7u3ccXpAkDdgScMC2ZcG9djKhcWzpM3NVKviCFSR7w/99qqAGFFf5eCPQ=
X-Gm-Gg: ASbGncue8Wn3uT2zEm4ZGlC32491rX74Bdf1RWjP3BQEcLT3WPxjvlHxOZKREPr5aRy
	IaH4DNDKmtNoGXC8+77M2fCzlWPJiMv9CwdiIlT7LvchP8j6RCojXcIV1++MbSyIRJyETwd0M9X
	vfaumBIbJuANdwLkzFTTOr8XryrgXg5wDBS7tS2+uUJFCnXy7FwjsqL6pvKTbYM+uiTGZDB9Rt6
	W5oQJNa9s2ZaIrdFDix+lshj2U3z5magpUphXZMFYvm5MF0USPdCUeAmb/ZVWX+HyTzx0UYT+5P
	XjBV3b5rbW+qvX0pQVrBViuRF/pq8Hfp9aoMbJBmA6Jk72iUNbJr5tCOAJi3mFH6RV2GCJO4YmG
	0vuUh7mI7/McA
X-Received: by 2002:a5d:5f95:0:b0:3ea:3b7b:80a8 with SMTP id ffacd0b85a97d-3ecdfa7499amr4439731f8f.52.1758186713959;
        Thu, 18 Sep 2025 02:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxFTvwkHZMTFVNF3/CKJIFGtDCQS73vdlDAWGqmaZ0EEiGh4Dz51JVsx1rqLeCvLq5fLFaw==
X-Received: by 2002:a5d:5f95:0:b0:3ea:3b7b:80a8 with SMTP id ffacd0b85a97d-3ecdfa7499amr4439705f8f.52.1758186713547;
        Thu, 18 Sep 2025 02:11:53 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf3bfcsm2785767f8f.58.2025.09.18.02.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:11:52 -0700 (PDT)
Message-ID: <68baf2d7-fe76-40e9-a255-a9dd41de129b@redhat.com>
Date: Thu, 18 Sep 2025 11:11:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 7/7] net: sfp: remove old sfp_parse_* functions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-msm@vger.kernel.org, Marek Beh__n <kabel@kernel.org>,
 netdev@vger.kernel.org
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
 <E1uydVz-000000061Wj-13Yd@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <E1uydVz-000000061Wj-13Yd@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/16/25 11:47 PM, Russell King (Oracle) wrote:
> Remove the old sfp_parse_*() functions that are now no longer used.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Very nice cleanup series! LGTM! Waiting a little more for any comments
from Andrew.

Just in case a repost would be needed, please consider:

sed -e 's/sfp_parse_*() functions/sfp_parse_*() and sfp_may_have_phy()
functions/'

in the commit message.

thanks,

Paolo


