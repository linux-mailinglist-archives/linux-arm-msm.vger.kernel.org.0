Return-Path: <linux-arm-msm+bounces-45392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFFA14D7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 11:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27FE03A6D26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 10:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8E01FCCE6;
	Fri, 17 Jan 2025 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjkQqZwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1F1FC0FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109523; cv=none; b=ZRCvki2BMf3uE8kE8o2r0s+a3JIVLuoYCVqV8oto2cgbMPKrSMSJIHgQ24/UEOlXxkxkCMUVVLeDFNk+0KDlQpmpbjCrTn1QciCzSay80N1VbccLlrtc0oO7+sISyPUrkap/NlBDTjCy8oojHIOv+de45ozsgddioxo15dzLiTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109523; c=relaxed/simple;
	bh=q/nN/WiCZeyxTX8vPRtvY+0LU60DeiKLc5hOr1qUdFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlIvfSUrrRacKNu2MDbW44/VsJHxMHcT7yVjQna/p+fOEi1LKc461Fkh8F1+Zlb0nOfMMwJ4LCFyUUwuSWHaB+UCglDsTNwSsQmD5JnZ/moekQK7a7F6Q/mr2tTiYDB8SX+jEoWbmIIzSodzi4BC6EKqe93O/l+qPp2LRRDEYsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjkQqZwu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso12171175e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737109520; x=1737714320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AuyZog7HTl0jURH59KuN4aP3Mv7PVs0SAeDjI1tKXiA=;
        b=xjkQqZwuW+5djwjo5/P1a/wlQG87HRFtgs6PUAJySqXcLkfXibIw8VDZb9Gh8imZaj
         /PxCf/ddvJ5qaeWuFzvBKUHRS9Rf2gbwvosjK/con73fHpOo9jl/tYvYfJaU3Dj6wN1s
         HHEeTtlt5XxI2WMVroZ2FLJK4lhYEG+q61u8831CLjdak5yMsSzIShOKEQQxWckRIwZz
         gWNAJSjLaS2Qo5PpHpdhbSVPEyLqAgBDfHHX/9zlfQ+wzhSGrvW+H7XiFcuslVMqT/Ip
         TB7c6CZlH181b2bNmB4IMSPGBLt0fvmPL4sd2h7IIg2H2UMna8PFCL9Ncv0imric4xDf
         Z8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737109520; x=1737714320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuyZog7HTl0jURH59KuN4aP3Mv7PVs0SAeDjI1tKXiA=;
        b=O3sr98TGgtFJRmJk+VrVGjRMY1FUtBOhXJ4HAxBK2gk/QofLGCiedEK69F6gupkX7H
         QyUDjj9gs845DDKC+f/fQrgWJNQF4P3iASXbCHgpe0Lk+7D48wks3lAH3ifX1E0u75yb
         sRApuHBrkF9balhvZPgmSyprLd2Na9u+ZxbU1rsnoDCUXe3KRCA5iLZBrMlhdpdfb78z
         Ur2krRq2NAzqwiV5FiGpCX+y64pWynj4MEpOjYD9cxPCIjzSHs/IFbbybHNzxn3fSU8l
         kn5dFnwsxYpqaTgH+pRcRwZxHVwzVkfsHrUZJ9s4YX9qksX4fZidtYKKNH4E1Ymz+CZQ
         286g==
X-Forwarded-Encrypted: i=1; AJvYcCWvwUEM4xFAf5drngUPuNXhRXMXc2NosjHXpcdjrelCZE+8W1Ajej1SpA6z1di9pkEDSMtFVegFykhRB2VC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yhmE1gXHMt2mYnMw/aBCqQ3PwjGmLIV993P7TgYaJ6tZ6zQN
	WCB83AAEL1+NobzEa31f01OCze0MoJWoEB4/5VwciUsKA9mmGw4CJBaDfYg2t8n3r6X5FK7uQXu
	TIa8=
X-Gm-Gg: ASbGnctnbelDiE5chLxKrwPgzBr0W/obeDw6YLfuxMlfhKjiZzHnr0Fhsuw+4PuuXFJ
	0u0IN3gNrbc1wDkrcRYyd6lqhcgoHBghs/Uh1v+kCE86HRN29dH8hwsEzHsNua2sDa5dsQ5m//r
	iSfOROV7+YSXfcfa3nGn5fEShxfGiqx/iLYhggTiuXnC9mAohEdu1Ke91W9WgFEI9Yetoz45wGs
	eDwqkO+OnslG4YrrbHjBfOncaxJrsvRKrqHfesksIqil8IWYSDLq9DXniIN+mBqMz/5mw==
X-Google-Smtp-Source: AGHT+IFMdHIo3hLDXgRf7TiH8FxEI+sqFiJFDa4eqUh4eXr2VBNPBxbAhK8vVgaHtALTy3+mKyBL3A==
X-Received: by 2002:a05:600c:3149:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-4389144e70fmr19855415e9.29.1737109520209;
        Fri, 17 Jan 2025 02:25:20 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890408a66sm29182285e9.5.2025.01.17.02.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 02:25:19 -0800 (PST)
Message-ID: <4cfc1fe1-2fab-4256-9ce2-b4a0aad1069e@linaro.org>
Date: Fri, 17 Jan 2025 10:25:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: fix OOB read issue due to double read
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
 <f18c1277-0d72-4f7c-b325-5f19cfb0ab98@linaro.org>
 <13259345-02b0-47ff-94a8-530a17c50b97@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <13259345-02b0-47ff-94a8-530a17c50b97@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2025 08:39, Vedang Nagar wrote:
> Below is the first read where dwords is being validated properly with the checks.
> dwords = *rd_ptr >> 2;
> 
> Whereas the same address is being read for the second time:
> memcpy(pkt, rd_ptr, dwords << 2);
> 
> For the second read the value is not validated which may get updated from the firmware
> leading to incorrect memcpy into the packet and may lead to OOB read access while accessing
> the packet.

So you are saying that pkt points to memory that the firmware and host 
can simultaneously access.

The question is - if the length value can change between one read and 
another read - how do you trust the _content_ of the packet ?

Surely the right thing to do is to take a _copy_ of the entire frame and 
act on that frame exclusively on the host side ?

If I receive a frame, and read length X.

Then I need to re-read that frame because length may now by X+3.

This implies the _data_ in the frame has changed.

What exactly is the valid lifetime of this data from HFI RX interrupt ?

---
bod

