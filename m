Return-Path: <linux-arm-msm+bounces-49909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F98AA4AA9D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 12:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 864867A165D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 11:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0364A1D88BE;
	Sat,  1 Mar 2025 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0ELbJkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8B1AF4E9;
	Sat,  1 Mar 2025 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740827723; cv=none; b=Oxd05VwJYgdbdv77U8B2J+tgqtVGgMcu95BmdY4AYm8Hf6oONdGtwBFj+VSyYk071McWLnrKERwTHOpgabwsE0Utgyg2kMFQLU3uAEcisosuT7UMGefp+0Cigv5UvbsW1ou12BX+T4OpZx9NkD6SrGUWucNT5Z0qobp1TaRQrzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740827723; c=relaxed/simple;
	bh=24RoCBjDilAT9gQzoswus6kU0eHglZ+gkUNrN65FMu0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XzIXh9ZAUvH52n8egckUn+oD2wMMTOvbCI1sQqHQzxkR3S2TFWDTy2aWxWsnYCqjA61CRy1uxNe/eidE0w1QPgG4pupVfOwNNC+phZDUnLTNmb2gItQjCsCg5Eu0yjxyadj2YUuPgyKP8KH3yejoDrwtQ7L5RTeIQjIT0Ls4e84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0ELbJkY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390e702d481so1266318f8f.1;
        Sat, 01 Mar 2025 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740827720; x=1741432520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BW4uLn5drWL4uMiqxENZomGBK16riTSXmRDtWBO7MFg=;
        b=P0ELbJkYwyFiAEieaM5+LhJcHEiTHPX4NO8R3CxEnYII0ZIskbev+eyQm9yHO3pjke
         o2TZyEyij9b2livUfI8o8M7gOMfZgdqz6JndwP1nySuml9MCoLryHigb/wEM1hIshgaE
         nHldw8fQXrb5LsSHZsRfBaFB9SOhtBAt1vSK8HLHgyezwUZeZ+UaaIOBsgQxACfc1i+F
         03tM4pKDtr4xGWhk4INoSam6pjT3df1KEUDq9KWAKZ+zclxtbc0m7H9Mm28cLyno/1YI
         XFiXIlu2GeZyfUPVQ8mQUGuz5L5bTaDyY/hdOfzRIzRA1AEECEWyLvL+CnZCR6qW6ANy
         l1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740827720; x=1741432520;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW4uLn5drWL4uMiqxENZomGBK16riTSXmRDtWBO7MFg=;
        b=k3Bbkg/NWiGQRkh1nAyhszEt8IanmYa0fZbSRTsyxybTm8JcGwsA33T7NA+Q1TwlTr
         h04fP6DNjt/AOCbMYiWXRApLYrOVxhWZcnVd36tGy6TaJ4Gxgx65iHe+hf5+1PC+oXXt
         /e/jL0esQfv6BzFcPQwKaNP1bW8veD/JitKQSIAAjNDWsJl0jRJ0Q7j9R++YRdtZjcZV
         IdnLrBzbDP3tRmFgKyfB/yPd4S+iyGjZNM+UEB4Xv8yjKsXQEXrztkap+Mwn5PVVJWlb
         tESpMVzP65kU1kFjL1oN5+w8puhIWaAka8YD/9KzJC4eZmojD05olLMLTZsChlnfwsJ3
         7NEg==
X-Forwarded-Encrypted: i=1; AJvYcCUOLPzSGSRO1hGt67MpiBTeyclYOGQ9voc9K60wBB6r/2skZ9ukY65QZ1OM6SDsH8LyqF03AYnboLenN/Gw@vger.kernel.org
X-Gm-Message-State: AOJu0YwCpX7QwFFmfXJ8wbsV7NjzRzMJL5WL3Ju9/wamDQK5jT/Zy5Ii
	dtgI2u1YOl2iFM68BWOqG68tzkUzXAKg7S4bQJPUsQhjB9jUh5vO
X-Gm-Gg: ASbGncv719HoJyN1fCB5W+5vcfi3jr+oDCcOQO8/aKKk7GYA6BFQuxoS0dNJ+evgCwJ
	zguP6+ToW04+CGnszZXzWilA3aSeihWDXTMcubxt16t8ywxdDCBZp7iqykowDehr6Oz2HUCxYsS
	YXRhu5VU0TrsJ5GJZzKPI2LWd7FUITEsbtsDoK5ja0piVpUIoaXvFkkhQLuEZycti1akz70GqCG
	29MLA2Dk04cKTHGMPDq6bllH3tAGim2iIURGy8qQzGX96G44UgOU2Gf1FGnEOQPjsfAlLQuZBXd
	K0naN3D48Rg5+6VXKg9sQV9QCIWxp/h6ftzlDiOIye9Q1U7lcbxOKB/lDADY10MHn83T32W5f3j
	xCEQfe8nAUaii9635i3yZDQNmJxJXysl6chQPul+wINkrtyQau5V2JVuxOZfSfqZeDkCW0MEW0s
	U4W0JMsyu/pOmfbuwe4SuGf8XZqyL47+M=
X-Google-Smtp-Source: AGHT+IGpmQtc55e2rC0oDiMpjZuvVLvExfxez2ECnJVlr1ZHQqc8FlYuHJBAHPH2pgPyr2wvBEnbSQ==
X-Received: by 2002:a5d:6d0f:0:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-390eca34b3bmr7538068f8f.43.1740827720123;
        Sat, 01 Mar 2025 03:15:20 -0800 (PST)
Received: from ?IPV6:2a02:3100:a9db:600:159b:603:111e:5ffd? (dynamic-2a02-3100-a9db-0600-159b-0603-111e-5ffd.310.pool.telefonica.de. [2a02:3100:a9db:600:159b:603:111e:5ffd])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e4795962sm8309523f8f.13.2025.03.01.03.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 03:15:19 -0800 (PST)
Message-ID: <6cb88f4b-15c9-4b6c-8226-63442b79492c@gmail.com>
Date: Sat, 1 Mar 2025 12:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/8] net: phy: move PHY package code to its
 own source file
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2025 22:44, Heiner Kallweit wrote:
> This series contributes to cleaning up phylib by moving PHY package
> related code to its own source file.
> 
> v2:
> - rename the getters
> - add a new header file phylib.h, which is used by PHY drivers only
> 
> Heiner Kallweit (8):
>   net: phy: move PHY package code from phy_device.c to own source file
>   net: phy: add getters for public members in struct phy_package_shared
>   net: phy: qca807x: use new phy_package_shared getters
>   net: phy: micrel: use new phy_package_shared getters
>   net: phy: mediatek: use new phy_package_shared getters
>   net: phy: mscc: use new phy_package_shared getters
>   net: phy: move PHY package related code from phy.h to phy_package.c
>   net: phy: remove remaining PHY package related definitions from phy.h
> 
>  drivers/net/phy/Makefile              |   3 +-
>  drivers/net/phy/mediatek/mtk-ge-soc.c |   7 +-
>  drivers/net/phy/micrel.c              |   9 +-
>  drivers/net/phy/mscc/mscc_main.c      |   2 +
>  drivers/net/phy/mscc/mscc_ptp.c       |  14 +-
>  drivers/net/phy/phy-core.c            |   1 +
>  drivers/net/phy/phy_device.c          | 237 -----------------
>  drivers/net/phy/phy_package.c         | 350 ++++++++++++++++++++++++++
>  drivers/net/phy/phylib-internal.h     |   2 +
>  drivers/net/phy/phylib.h              |  28 +++
>  drivers/net/phy/qcom/qca807x.c        |  16 +-
>  include/linux/phy.h                   | 124 ---------
>  12 files changed, 409 insertions(+), 384 deletions(-)
>  create mode 100644 drivers/net/phy/phy_package.c
>  create mode 100644 drivers/net/phy/phylib.h
> 

CI is complaining about one issue in patch 7 which I have to correct.
Will wait for other feedback before resubmitting.
--
pw-bot: cr


