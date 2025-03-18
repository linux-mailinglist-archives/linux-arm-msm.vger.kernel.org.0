Return-Path: <linux-arm-msm+bounces-51680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F70A66BBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7B9516D1B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0061E1E19;
	Tue, 18 Mar 2025 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVKN73q4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3C31DF727
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283219; cv=none; b=otfTPhRbTTu7GRfqiK7KIMYDdNWIUccyfr1EZzT39a1BBINKpaoVO8RV553j+mhIxsuGvfz/GHpwKPnHuHj5aa9fRcKr3tgpq/gE2BYKUwwOWFs8Ju63uBDRLNLMsJOHjbAO4CavP+7viKk/IRwYkZu/EZRmbEAhDsQV62lXRNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283219; c=relaxed/simple;
	bh=8wzE6JQOqeICaxML7C018pHl5X7ishDt9mrfTLXYJyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soGN+YZkevlHfE4nZF5F7gaIqe1+QTKg8DoTtTxjS6FE+GGANeer90gdRkXwo0pgOHyfMvfPySjx/H7A1dRNT3YD3RFPWEkE1zMoGxnDAzpK8jv3+qlYmRSPcJku37YXaHpOAJZ1fC/MzQgWw3umM5vDyU/2wC+MfRPoZyrRLj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVKN73q4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2232aead377so117441425ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 00:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283217; x=1742888017; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOISki8dnLdBinmyN5Fhhwr/b+hOKzHW4IWqOj6LscA=;
        b=nVKN73q4CCjo2AgKYwkfE9EqfswVwo92wiI39Dr2osL8XntAGgJLYllldQ90JiiAmc
         bEjbmZWi1K5mfXoGOep3PVz1sa2fYlVJKbZqEfAiUw5I2az2jdV4iXyUNbD273f2a1D8
         uJPJabu3MP/sS9dazEYVf/HJs9q8HF8/nB/AA7MABg55eOBefLdfI7abuMQHs6aw1bHo
         WUgaQVt4I4UCeY0jbk1qK7MzQyGPeeJwr8NISWBcPF6cmR2MEtBUTuT9fnT8dJl6N9FW
         dec6YwQPsfEeJZuFhDMSB0t0ailAYEs7ANHXYXBcy7s8ZLr0gViI/met6cHkp1ryZWqD
         t41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283217; x=1742888017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOISki8dnLdBinmyN5Fhhwr/b+hOKzHW4IWqOj6LscA=;
        b=VavL5QNR8kfjfhNvCIZD9tDzaglLpuc816foMXyg1XGJHfPgp0DgDk40pZufkRnWWp
         estVjSUh/ue1AcJ1HU0DVOOjuaZ3q9dDV7+WMvRLv8L+oBiZzozqlJJKG7gxY6JbqG8I
         1+HVuD0IeIiN9XlXq3184iHFKQO/vXUfKL6QYqQjM/SOlHWzWuzJ5jxXNTgikDOZnf4E
         qwMAQ8DVQt26g6pUUc+IlvD9Tao3s11E2fRDHGUXktjcA05LAKWzfQBT2ksTdRnuQQum
         mrxBi7QddLSSO4ndnwVZyu6Hw8iyUwKELoXLfOwwxPseGw0aT21wC0Ipkt0zEHmMHXPG
         tzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoUV+LqzO5HGSCmMHxkEvF5PuXBNARhbPa/j61I9/1ECKpF3YDkxwaa2EujhP+jyUS3WQrPFr/iAGsMJ06@vger.kernel.org
X-Gm-Message-State: AOJu0YyX5Vh6TbYPXit5hjMyNu37rZH8dChuMQSspuMuj2USkyAfXg7d
	vf4P84UBGhCBXe9Sh0fDn09fjGOoecRf2qbbc6SGrzHTqylN54yfX2nXkoQ72Q==
X-Gm-Gg: ASbGnctikXjq8yApy7O16kcxUeOZhK9PkNKuSz4JAmyspUQzdAn3uw0Iu3KVXZf01Mg
	A1JyK1slLyWU0DE46wg1JuQvceYjWfhBSQSZqYD4t1+6GWKIUtLQoHN8P1jEgSF7I+N4+N5Slu0
	Shrz5E4VHpB0NPkYYR/WygDHCY9n6q8jch7tiELPdRTqKaHTLUOJhiyJUr4uICpn6ZuYx+Brbc6
	oZ0PpEHh+Hp5K7ErM9k/2Fhgk5KdH6j93/a7YCaJRoBixW+V0JQz8IfOPCM201eNvVzIjB5tToT
	VGTkqiyK+jHia8I0AiPusrCygNWT9ArhlqJioAffOh+0yy35mrBMZWJ0CLkUo+0Djtw=
X-Google-Smtp-Source: AGHT+IHFVJZtu55P6A5DXRQBgEp/mTXhH/XT9ESOfze6ksB+o7qEeCG3zUQ7NMUJih+FIIspGKyTcQ==
X-Received: by 2002:a05:6a00:3cc8:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-7372239a441mr22267474b3a.8.1742283216714;
        Tue, 18 Mar 2025 00:33:36 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73760713875sm260507b3a.33.2025.03.18.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:33:36 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:03:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20250318073332.guylcyqjmfq5nyyr@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310120906.1577292-2-quic_mdalam@quicinc.com>

On Mon, Mar 10, 2025 at 05:39:03PM +0530, Md Sadre Alam wrote:
> Currently we are configuring lower 24 bits of address in descriptor
> whereas QPIC design expects 18 bit register offset from QPIC base
> address to be configured in cmd descriptors. This is leading to a
> different address actually being used in HW, leading to wrong value
> read.
> 
> the actual issue is that the NANDc base address is different from the
> QPIC base address. But the driver doesn't take it into account and just
> used the QPIC base as the NANDc base. This used to work as the NANDc IP
> only considers the lower 18 bits of the address passed by the driver to
> derive the register offset. Since the base address of QPIC used to contain
> all 0 for lower 18 bits (like 0x07980000), the driver ended up passing the

What is this address? Is it coming from DT?

> actual register offset in it and NANDc worked properly. But on newer SoCs
> like SDX75, the QPIC base address doesn't contain all 0 for lower 18 bits
> (like 0x01C98000). So NANDc sees wrong offset as per the current logic
> 
> The address should be passed to BAM 0x30000 + offset. In older targets

You gave no explanation on how this 0x30000 offset came into picture. I gave the
reasoning in v2:

"SDX55's NANDc base is 0x01b30000 and it has bits 17 and 18 set corresponding to
0x30000. So it is correct that the IP only considers lower 18 bits and it used
to work as the driver ended up passing 0x3000 + register offset."

Then you replied:

"This address 0x30000 is the address from QPIC_BASE to QPIC_EBI2NAND
e.g for SDX55 and SDX65 the QPIC_BASE is 0x01B00000. So here lower 18-bits
are zero only."

No one outside Qcom knows what QPIC_BASE and QPIC_EBI2NAND are. We just know the
NANDc address mentioned in DT, which corresponds to 0x01b30000 for SDX55.

Please reword the commit message to present the full picture and not half baked
info. This is v3, I see no improvement in the commit message, sorry.

> the lower 18-bits are zero so that correct address being paased. But
> in newer targets the lower 18-bits are non-zero in QPIC base so that
> 0x300000 + offset giving the wrong value.
> 
> SDX75 : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
> SDX55 : QPIC_QPIC | 0x1B00000 (Lower 18 bits are zero) Same for

There is no address as '0x1B00000' in DT.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

