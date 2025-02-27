Return-Path: <linux-arm-msm+bounces-49766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26386A48A41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 22:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 114B83AD3BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 21:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7EE2222D0;
	Thu, 27 Feb 2025 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft5rBt2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494A200111;
	Thu, 27 Feb 2025 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740690355; cv=none; b=KjabJ+O5cIADff9UvR5QGjaiqQEZg1S9j+CwkVolxEbCyjVZl6dN6D4KOIlL/PV1+yiuGCjHTaAjRhvkE0DLPoU9vN+4j2aHprOdpQDkdKFOeLYC3OPRzjnEDW2qRHpSxsX1WjAHQYMQQlbB6vlh8zvVeI8vSlzqjXcwVWhRIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740690355; c=relaxed/simple;
	bh=fGvMYynaFqcF967+51g9RBQpdkXtMJzPZGWcFovQ4jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muGr0lBEK6jf6VSkZ0zfGX+fJtBCdnGWjKeuxGlnaS3ifmVAYJ2/O3yFuaSxpPPSafG4nWH68u1C5EKNt5/mvA+T3TJkOXQEW7fFdXeKyzX4rw2LB6LjVFfd2yGOsRn9jeNLb07KBSPd+7wi0ABHaOE5E2BwiOd4bjmC5yJeLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft5rBt2Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso9463805e9.3;
        Thu, 27 Feb 2025 13:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740690352; x=1741295152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8lp+GUe4s2PjbdSkthjBUeHCtnDtsSbdC5TASiMKXRY=;
        b=Ft5rBt2YxS6ST6BjgYrJRSjl8fjRMzSzL+hx5FxF2yiYus+0riDOiofqPGSxPg9faP
         UPZ/mZfEvGz2HsVbsZDffcO0+511kyIkkZppyzp86dOUVApcJP+qLCbKv2zAuVP6GBOT
         rixUSHYWrPe4ivKAE80MRqPBh5UIx8yfPrFSYKKaIAlLWX8TrzuXvvvsqX1uS/WujUvl
         Znsmqq6WzU8qs7sMTiDlmh+yxyBRrhvP3/vCiPDeA/WJsVZfyI8mDgP5at2WMHxcdbt6
         KWejhQL8YciYxiwOqKE7JwiwPANaDmTJsio47o3krzn/yafuSIbkTgdu+EmGFiY2YAZb
         M1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740690352; x=1741295152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lp+GUe4s2PjbdSkthjBUeHCtnDtsSbdC5TASiMKXRY=;
        b=wNEgdlJ9BXT6P72ngz7MLPi6CAS9ACaxgErg3+lThvPlffKqNmPgyDGa2Bu44wNy0f
         TzqJy98irElCchgR/IIollmjw98Sjv4U0Z1kVw+/Li5xI9BAbEtG1qPVcDLamMFLP4tE
         4UFTJ3pu6n996JHXqwdOYzEQ9vYb2e38PFE9GPxdIrb+FoT1x+qL2EH82HsP8fZVGffy
         9NFsqx72X1FttbN2fF/tXNLm3tWX2X1RP7UMipYtiQS5HD3iqeILSfX99NRFl9gEdMUW
         wlSYAyzn7UvxCLw6T/shjmW5QCy13tA8oTfUVSquntadBQfvAP1olKVnTQvt4s/ixgo1
         W9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW40Mci3LTpsDewFSSXIAbHNVdF66tXIuKpHtbzYcTEyODK+P75ZIwZGXAB7pa+yvGVOR9KfBOJ0aj9spef@vger.kernel.org, AJvYcCX4QSxoL3Ur9kPNy7Aj8l/4p9ECbWjgl///v4/HRKNsbfYtlbMVugjHFM+Ki3dZ0VMNDpaM+odj@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0TZ85PYmf4AU+dL4DLGWD9hbxAZ0PcQPW3ZBS4C9EB1SEeVS
	HNoxLfeC7XbpE2/OBC4h1a7Ivs48C8bk6buH+snJSgcbBtLTgxrA
X-Gm-Gg: ASbGncvAnuF2aXC1xfQSWGjVlh2tlJRAw24rAKqcYbc4WGVMvSdDnOCbtP96Gn4n36p
	JMXxtceonh/g6fCxBHU0TCmk2Jcwq7r/KgiPm0z+vOQaEMoHWtCo7/1Hk7OwnJAPaLnt0h8A2v/
	X9pyB3rx7Onwyr4LBEdKTZiLvDoMfMoDZWMRhtknChVWEhSTGcNLgFun4SkamaW4ppEbK5PUQ9D
	Uig3YiduGx+0W602pS31eg5LExb52H8moP2xgvETzOtKVguFW63H9N7hrHD7sZUMWGFtdp/2U0E
	W4TDKGDXCyRx0f0pZWkBOtUTF8yOA5IVjXS+hNktIovWJqjV7+ICmWiq/veb/ceq/reOod+aDZ9
	CKNkIqBSl3FEkEs2vNyJL/yXO2wb3OSmtxfShPvtuhAxcxP7LtzutK1i4P1lC38z5bcosH6/Ian
	HnuIjbRQa2/kYB7fh2xA==
X-Google-Smtp-Source: AGHT+IFV0DXibGbpZdx+u5vLD7fIQhcjS8I1BGVxPXMjVfPXgl2tTabWU3LhbhG+QYEWdCPgU69fkw==
X-Received: by 2002:a05:600c:384b:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43ba675ae8emr5869295e9.30.1740690352091;
        Thu, 27 Feb 2025 13:05:52 -0800 (PST)
Received: from ?IPV6:2a02:3100:a0c9:fc00:ec45:a37b:6fb6:f20f? (dynamic-2a02-3100-a0c9-fc00-ec45-a37b-6fb6-f20f.310.pool.telefonica.de. [2a02:3100:a0c9:fc00:ec45:a37b:6fb6:f20f])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43b7371b004sm33731645e9.24.2025.02.27.13.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 13:05:51 -0800 (PST)
Message-ID: <8069a3db-4fbc-4d89-a4d8-3d5b4cf4e89d@gmail.com>
Date: Thu, 27 Feb 2025 22:06:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
To: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
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
 <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <910cae0c-3d45-4cd3-b38a-49ab805a231e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.02.2025 10:12, Paolo Abeni wrote:
> On 2/25/25 3:01 AM, Jakub Kicinski wrote:
>> On Wed, 19 Feb 2025 22:04:47 +0100 Heiner Kallweit wrote:
>>> +struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
>>> +void *phy_package_shared_get_priv(struct phy_device *phydev);
>>
>> A bit sad that none of the users can fit in a line with this naming.
>> Isn't "shared" implied by "package" here ?
>> How would you feel about phy_package_get_priv() ?
> 
> FWIW I personally agree the latter would be a better name.
> 
> @Heiner: could you please give that naming schema a shot here?
> 
> /P
> 
Sure. I'll submit a v2 with the suggested changes.

