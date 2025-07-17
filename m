Return-Path: <linux-arm-msm+bounces-65484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D940FB08E0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B92B173442
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 13:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EBD2E5401;
	Thu, 17 Jul 2025 13:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OEE7yf1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CB92E49BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752758603; cv=none; b=MnglDH29p7HnMmHQEi3phB24jYYX8L/ZoAfA6ViLF0jkLzqVMEYX68qAgQ0EDMVukuBimcfU1xPymnReDFLek15QWAgoui8I6W73YAzhUWtpOxe0RSri3HnLYmNWw7bxqJNc/HVWNDwL+NROoLkz6IFLh3/e3g+JZeS0eP2XMXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752758603; c=relaxed/simple;
	bh=BPpYfnAnCBtMNCr7igg9bf2UIP7DI/13dxgs/9mKxm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNlhbEFcTGMjEWpUdgfu0tu4Fbe2sQ2UnMh2bazLDJyDZl9OCmRnTydBXjkpCy+N18Vqw4n+SksP0ZLu+qMGl0wKBQI3k2woe87esGiY4LifhaIqJId1KTkwDgdKIsQc4NuWFXB7aXzqggxyDoM2ogPXqt3a4WpF3V2ufJtB+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OEE7yf1d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752758601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2qbOEl2PGxjAtCWeSF7R2ApFJ7Tug20O9G4azMGM+2M=;
	b=OEE7yf1dAkYVdjiK+wjgKnqLWBDtS2NQGhBpMgiLDPFabLNCowaFrNi7RKCv62UbmhrhtT
	HZGwoYtm5Nv5WS/lvb7ZhM9dUnGKsQUpDQ19UI3mrA463F9OE4vcJQ+Xo5c8PXsuyFiqH4
	pAghR5ZqYTzYDxoV5rdVWs5gXcn9Yp0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-ohTBj7S6PoqvnLsD-cDUNw-1; Thu, 17 Jul 2025 09:23:19 -0400
X-MC-Unique: ohTBj7S6PoqvnLsD-cDUNw-1
X-Mimecast-MFC-AGG-ID: ohTBj7S6PoqvnLsD-cDUNw_1752758599
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso5776865e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 06:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752758598; x=1753363398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qbOEl2PGxjAtCWeSF7R2ApFJ7Tug20O9G4azMGM+2M=;
        b=BvfV+h3DXm7UtOZIhj1tpVif8Awy9uvb86I6p3uDLWOAgD/0KnzIcQgU0H3x/9jcOq
         +9cfZf+kOIsTZBeg0l5Bh4W4Iz4xSMGBb9neU52/xCFy/FFRQSJuEWcUupkk3whA23a5
         09eCsEksjUcr6QL6O9kX2PFocDp3gXf/iLklQ2EKdCZy26OumsgvEi3eQ3eoNgHFfh4R
         Hqe0AFvLQ4ez8WCAQkWcMvWKaiNid9sjKwhLFLg+nNtV676LdoE5jrtfaH+FCLlw1lwJ
         xW8AEnpDPwFMuSKzOn1MUjgetUTdeA5TXF29gxpMZ5s0pWsbO1tRpYalPCcyQoXjQYdu
         GhNw==
X-Forwarded-Encrypted: i=1; AJvYcCWs89+RwrO1pDbx4sCTKE9vZt+PiWFRXFv+gMIwpvJ2rWTrCddATC6OQk8sa6fwdNN4NUnN+ijIfny6TatX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7i9U9ecic3t7QcVB2TmFY2twNeXd1oBQmYpfCmVBbgIwBDeJ
	SmgbGX/q+9aTt6Q5b5RGncz1SvUUcet9HK7niPy1dGwUI81Fl5XD3bn2yd4sl5pthhuwBXLA6s4
	uXRG0vuMwPqwdBFivIvhPAIYR7w+2tEmfkzxpgzHNdbO9K5vwNhSTOxtXXlZo6Dzf9Dw=
X-Gm-Gg: ASbGncvzI9PYvoigUk3m9WnjPzlkaKuRpBKRV+hCfGcnt0cH7JbSjwHYqABtzmRCna2
	S0oRxviapGi+b2vrf3Hpw4xwC/heCTPDZyz7LnOb0QMrTYp4JPDCKcGAP3gq7Enjo6b3i4c++M5
	jfXjppGOH/VXIyaJQ7p/X7EvkF4YFoC9EL+Z0cDruf4sJHoHmgsjPdvr8QWTr+BVSgHLWsWd3+O
	BiIwi9FX29M0QHjqNlfjOIL8hOIuXOjsosOtStyWYTr2/kQhazHrTz+jaLXgYCwFOmnrivra9r9
	KseCA6oqeEYDeG76kscwK9Dj8Ns6Rljc6nEo0c7mnNHYxCgtEdqyOENd4eTYUM5vVtpF1Giz0Jb
	RuJGFMcDGKbY=
X-Received: by 2002:a05:600c:3b88:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-4562e355c9bmr68526025e9.14.1752758598481;
        Thu, 17 Jul 2025 06:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXUaojOCvzBHn+KqDc2+2N5HsM1E5SZahUBXJwd1vHENhmXkX/VYLgSv3x8wTcAP/8nL4eJQ==
X-Received: by 2002:a05:600c:3b88:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-4562e355c9bmr68525635e9.14.1752758598001;
        Thu, 17 Jul 2025 06:23:18 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e89c87esm50578175e9.33.2025.07.17.06.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 06:23:17 -0700 (PDT)
Message-ID: <87cace03-dd5e-4624-9615-15f3babd1848@redhat.com>
Date: Thu, 17 Jul 2025 15:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
 <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
 <e4b01f45-c282-4cc9-8b31-0869bdd1aae1@lunn.ch>
 <23ab18e6-517a-48da-926a-acfcaa76a4e7@quicinc.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <23ab18e6-517a-48da-926a-acfcaa76a4e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/16/25 12:15 PM, Luo Jie wrote:
> On 7/16/2025 12:11 AM, Andrew Lunn wrote:
>>> +int qcom_phy_update_stats(struct phy_device *phydev,
>>> +			  struct qcom_phy_hw_stats *hw_stats)
>>> +{
>>> +	int ret;
>>> +	u32 cnt;
>>> +
>>> +	/* PHY 32-bit counter for RX packets. */
>>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_15_0);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	cnt = ret;
>>> +
>>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_31_16);
>>> +	if (ret < 0)
>>> +		return ret;
>>
>> Does reading QCA808X_MMD7_CNT_RX_PKT_15_0 cause
>> QCA808X_MMD7_CNT_RX_PKT_31_16 to latch?
> 
> Checked with the hardware design team: The high 16-bit counter register
> does not latch when reading the low 16 bits.
> 
>>
>> Sometimes you need to read the high part, the low part, and then
>> reread the high part to ensure it has not incremented. But this is
>> only needed if the hardware does not latch.
>>
>> 	Andrew
> 
> Since the counter is configured to clear after reading, the clear action
> takes priority over latching the count. This means that when reading the
> low 16 bits, the high 16-bit counter value cannot increment, any new
> packet events occurring during the read will be recorded after the
> 16-bit counter is cleared.

Out of sheer ignorance and language bias on my side, based on the above
I would have assumed that the registers do latch ;)

> Therefore, the current sequence for reading the counter is correct and
> will not result in missed increments.

Andrew, looks good?

/P


