Return-Path: <linux-arm-msm+bounces-49232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 445D0A438E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2223BD50D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E837F266B76;
	Tue, 25 Feb 2025 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JBZICcGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847F2661BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474335; cv=none; b=RK9osUxr41gTGiEpxwtIhUubo6YFrRqxCuMymqRudwcaRfXZjRkbGdBPNm1c6e98TCM9Vci2ajwxYl2Egs1nD2TeNTu4n77t57lJ4AOwbRx77eDx4FKnQvPuQLmOCUQu/tyGFTOViolEJ7m2cKSrSDulPoo3YZH7BfVfIh2m+bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474335; c=relaxed/simple;
	bh=S591plOfEwfaOHN3Xnpi7xyHchggR3YCpZ+xHYAC31Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lW1tfhBVs9iDh2gKFBTVMFFphYZj7mqpYkBnses+HcuJGzqSKIaRwBJRNm8mHPNpVTaQoMlKKAL0jfkCW4qDHIGioTn+GrAzQS4LL0AA6KkvW2vmjCPkluLz9EWP8XCLPXoWRcDwvBlu7uxnwv570gc+2sfPKCtjRQEOrNcOyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JBZICcGt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740474333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S591plOfEwfaOHN3Xnpi7xyHchggR3YCpZ+xHYAC31Y=;
	b=JBZICcGtgIaGT2NEayXsTfcbb9ZtlutP8JW/GpdJNce9O/ThZc4x+XuW9jxYBz3gryB8J1
	MoOt1MMVM1C1cwzpzFiXP8Il2QqJK7/WUCus26nkT28sdXEE8V7oHDsB1Hq0vH5wMvHO2E
	q9snZt+Ayh5ExzIv+AlghkzjVSzca8U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-9yN2r-4UN1ySbpihffuLDQ-1; Tue, 25 Feb 2025 04:05:31 -0500
X-MC-Unique: 9yN2r-4UN1ySbpihffuLDQ-1
X-Mimecast-MFC-AGG-ID: 9yN2r-4UN1ySbpihffuLDQ_1740474330
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f4156f3daso4264023f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474330; x=1741079130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S591plOfEwfaOHN3Xnpi7xyHchggR3YCpZ+xHYAC31Y=;
        b=Ir1XVas49y5aXpOxK72qullZ+06VL9pfk3EgQhc/wZ9sx0qNKcz2jekrfPZZzQNY++
         A6329d03qSwwebDZvfzdIHhRgYnntPqfsjbYMyA13gC4n5WeDIYi7htBaOYCXEgxoiUA
         9z4oxZgvc+M0VYuP66IWbAc3BfY5Vxd5Pa3U51+XJFsLWeP8f2boJRFXRlAk01WsaYxh
         taEwGFO0yt1f9MEp3x4T+wdKxZ19YcylPmqkAdgDb4XzPGfYl3wli7yt4W5dcO7HEH6m
         O29s8AotB0SZZL4rmJ0mY+wdS0GeGLKQJI2EojgJ824Noiz2w3vWUhQ9i+KehA7aXoSF
         qEeA==
X-Forwarded-Encrypted: i=1; AJvYcCXYlR02EtOSqvyN3rDbXwf3hdvU3ttx57un3TYgwxA1ktaO55I9MYvnmCSFhP9DzJEENCwZpgEYjxKiaxN8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/nET2iiUz7cw9wgvomlbokjyLOgzoi/RqMOtY0JktXL/sy/Gx
	u+fAZ9GnEg3ceaAuXo6gEs0dRqnlTeBWe0gDvcMreMoJZJbIH6fh1rQb7D1FDy/K2ZOxA9de/9X
	aXb1nTStPebnIYuHIumfC2B7H5HBsixYQpYLefx+GDXb55vx/apBMcLphReuULmw=
X-Gm-Gg: ASbGncswz77kr7qecloyI/C3w0hQR4G7CZLBcr4zvHiPfeDNgH3O3I9LWD1eY6XGPvr
	U8NryDLVy7Y9zfBFQz9Drmf+C67QB5PCH1PXj1RZHuBC6Z31lMrtWYBZXKbiHXS1wVJ4rNN/LkO
	+fbhm6NG2+RcMsiJK+oF0TL1/hesgA80CIl+L1H3F31DjDN9L6HM9ggp+LcZtv/i0SG0RMBISRV
	x/sJ0REI4wX9yItHp2G4/8UQlssk7ZHCJbZo8jeuf8GqJ4qvvWlQ9EAV1Reey4RDxTM+dOXKW1Q
	2hUEkpXEJkiw6CVhomNhq1i4ruGpcVBkUL7ueNzqi8w=
X-Received: by 2002:a05:6000:1373:b0:38f:43c8:f766 with SMTP id ffacd0b85a97d-390cc60bb96mr1820187f8f.31.1740474329761;
        Tue, 25 Feb 2025 01:05:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2nbkYE5xIsvX6L4EeMqJ6/+oXvSP9U6WXPFvJdl0X9vmutLnfED9guiz2H/dEmk1Doe3+9w==
X-Received: by 2002:a05:6000:1373:b0:38f:43c8:f766 with SMTP id ffacd0b85a97d-390cc60bb96mr1820153f8f.31.1740474329454;
        Tue, 25 Feb 2025 01:05:29 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cc26sm1620849f8f.30.2025.02.25.01.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:05:29 -0800 (PST)
Message-ID: <0c50738e-2469-4404-8a9c-a5221c4412b7@redhat.com>
Date: Tue, 25 Feb 2025 10:05:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
 <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
 <944941ec-d897-4306-9cd8-e39de833749c@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <944941ec-d897-4306-9cd8-e39de833749c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/25 8:21 AM, Heiner Kallweit wrote:
> On 21.02.2025 02:56, Andrew Lunn wrote:
>> On Wed, Feb 19, 2025 at 10:03:50PM +0100, Heiner Kallweit wrote:
>>> Move PHY package related inline functions from phy.h to phy_package.c.
>>> While doing so remove locked versions phy_package_read() and
>>> phy_package_write() which have no user.
>>
>> What combination of builtin and modules have you tried? Code like this
>> is often in the header because we get linker errors in some
>> configurations. It might be worth checking the versions of the
>> original patches from Christian to see if there was such issues.
>>
> The PHY package functions are used by PHY drivers only, all of them
> have a Kconfig dependency on PHYLIB. I don't see a scenario where we
> could have the problem you're mentioning. But right, the PHY package
> function declarations are a candidate for a new header file not to
> be used outside drivers/net/phy.

IMHO it's easy that some corner case will pass unnoticed until some
build breakage is reported. I suggest to keep such functions in a
(private) header from the start.

Thanks,

Paolo


