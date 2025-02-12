Return-Path: <linux-arm-msm+bounces-47777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388DA32B30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983E31884A5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00B6220686;
	Wed, 12 Feb 2025 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uiDQTNEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4A214A8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376546; cv=none; b=nPqnQqGp79GeK2V93Zc3LXQzxBqhdjc7wN1JiLX5CWuErfh3y5AP0RETwsy/1djxLsklYJU5/9qE9BTWmxrTCzWyMCCtcZM7524OR3RwTJlbAa7TUIyCdl3+UZTlEvA5vI9yFmhNELGkurR4uRIllM74d3uzhtjX/q/zOnoFuus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376546; c=relaxed/simple;
	bh=ZKwXTXROh5P6mHKTAIdz8QlhSs8YJUr+oi3VUfVQJLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eV095Xo6K4hXVfYWnIwziz60gnBaNhPS2sLbOHf/YF3oYf3sjNMLccuCbIvsML1gbGWdBLDRi6BjoX+cP92p/Lg5Zk97A5m/URfzY2DmGTSG2s2K9ezqw7l3fEI4iMBE+vbrEOC+RFHfPdF3Z+O8RqXPyU4NXzarFXFAadhmmJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uiDQTNEl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43955067383so13957085e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 08:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739376543; x=1739981343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pp5odaFIrW+nbf7Y7JXnx1TjySVWjHWY+ZwKogul8A0=;
        b=uiDQTNElQR2FMi/AeJIdiJq5RzPZLAbvhcW2IHHckGiuIvw+R6tYloFqcnW9jmKCUd
         PwIIv5lK0v6x90sm8QnkalU4y7wbQ//B5Z4rUT8hWxht4oHnjOjcS5scriGCIpZT+oEs
         EiYn8j3CWiBHRhF5dgs3VT+LsZPzyyIyRFP4jCLWvKGEipuUAvFAtaq700KqDiUVNL1P
         Tr8nHNS7ad2hxq4i/8sS5Jxw4lnyzW57PRzX4ImvV6DkSL8X4HXp3A6fkYsSce8tVQX2
         1WMcG/cevucrHOo7nkbQtudZyGP7KBl2mTJNJ6fHVpqbLsb7jFbhEaP9beuKvmFFFPtj
         o0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376543; x=1739981343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pp5odaFIrW+nbf7Y7JXnx1TjySVWjHWY+ZwKogul8A0=;
        b=XUD6BMRUQdQI8SjdUHp8KuJZvVPJDjNSP+Ms5zsG3oP2meMTJZ6jLG0I4Mgm3Uc/u6
         bfY5kF/3u5ND/tLaqHWg3fL/iX9aeYcTcbkBBSHut4nyM2U1tpmpUR9K9SWw5+5alxEP
         xSARi/jd+axYRBJQN/4R493xPjknmA50H3hFBSkijvGPED0qJD+rB7w143kADuA2udb8
         LvhU0bkNi6eDeICMUiI6xR8c+HSYKK8XCB3Wal0AL6vHTRKvNT9ix+pd5I5+7eOk0Oal
         /S7EefufZZPqxAy7WT3KSEcPoOBm+wMfjxj/U6xYJMw6FgIu9FvBRVAqUZrUqv/pUbnG
         UYEA==
X-Forwarded-Encrypted: i=1; AJvYcCWRi2fbhMPnxdiwUPGzXWldUZTY3q7oY9gQioWepjOadhOhKtcrGxxzr4UuHOo0ZZcLNE7JjNwpwrrQtSZl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7M5VlX10+M9yzAya9uUF/6C7rYVtEf0qqnJZZye1VBl/wi+Q0
	Zqo7H0iPRjm12ILVX+UMqTWxHvbSiFV6jV1C3wHaRvUb7YsL/YMTOeouNrGDGog=
X-Gm-Gg: ASbGnctZfXRMgAftCXSqK3YHxczcT7YLnMhp9Fm/Y/03JaorbwZ6xnW30wF800019/o
	tWCeo/TN9YPSg+E20+gITRCiJMbRLL+5JK9Wvreuq4Mo1KyBxCKXk1TewiKoLTGvlg0pNB9f5H4
	YM4HiJ6vs6Ui6ORnXCGnHc5doPhQb9Lk1Kz/BOz/NqCXj9c8Vqa2osNEbs183eus/k6pm7uvJw5
	BJ73S7hNmNjaYXTGzCS0roD/9jPYNv+XWNPxmH5h4KC6oS40RXb0tryyuUGC4zlEoXQn6WejmPp
	qFZAxF/7BCXLYC7+A3K535+myvkpmbRSq2+qEWap73YOTm+9TO6ULTR/jdWsPDYSTSsSkg==
X-Google-Smtp-Source: AGHT+IHJzNcgMxYRPCB+0fE/E++AfEevWhqdpHHpCa2FP4tYjZxOsQp8n228+Yo/EzeDt2qB6MDYHw==
X-Received: by 2002:a05:600c:1548:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-43959a997a5mr31660955e9.31.1739376543290;
        Wed, 12 Feb 2025 08:09:03 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:416b:3913:893e:bb4? ([2a0a:ef40:1d11:ab01:416b:3913:893e:bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7f3sm24236205e9.29.2025.02.12.08.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:09:02 -0800 (PST)
Message-ID: <3e8d6cb7-43e3-4375-94be-c6b28331da76@linaro.org>
Date: Wed, 12 Feb 2025 16:09:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
To: Mark Brown <broonie@kernel.org>
Cc: "James A. MacInnes" <james.a.macinnes@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 quic_wcheng@quicinc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
 <20250212010744.2554574-3-james.a.macinnes@gmail.com>
 <fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
 <8ec05fd8-1623-457f-a3b5-1095acd62cf7@sirena.org.uk>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <8ec05fd8-1623-457f-a3b5-1095acd62cf7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/12/25 15:37, Mark Brown wrote:
> On Wed, Feb 12, 2025 at 03:29:54PM +0000, Caleb Connolly wrote:
> 
>> I would suggest implementing a proper .is_enabled op to poll the status
>> register for OTG_STATE_ENABLED and configuring
> 
> No, that would be buggy.  Implement a get_status() operation if the
> device can report status.  is_enabled() should report what the driver
> asked for.

Ahh yep, that's right. it should implement .get_status() (as per the 
polling code in _regulator_do_enable()).

-- 
Caleb (they/them)


