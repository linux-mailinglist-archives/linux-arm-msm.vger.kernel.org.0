Return-Path: <linux-arm-msm+bounces-19722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A888C29F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE441C218A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AD244375;
	Fri, 10 May 2024 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4M+5nsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EC711713
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715366005; cv=none; b=ng3nk9yLF1ob/iVKOx4tE1Vsad2ZxB4hTjRazV/6LtqKEigcYx3IQJMr1rr3Gex9BticqkcnyDZ4yKj8+fF2afPi7Cur01GYcCSbmCOVl1GagQUr3sghA2yDMNRdv4gxE8nMRGcTMJ1pEV/mh0sKENt6SLQ4Zdp1r/W81bESw0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715366005; c=relaxed/simple;
	bh=5V6NaaZJsb3ycOSB/8E9nepCSSYaU/wkp8KeojjJGqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhwmhI8a0S00XSXgjAbERFGJ+KHqf6z6bgAtSRF/jkVneofupGzSQSYmMQxA1j6EkLco/PsdcchG2IEInRv+r9LY+nEyrs/GUBlnY5E0tXa+2rLpXRQxgODChHBijAmhsvIoBsmoOM0GpKW5Kiu4YZeScDvlzFwVu2o75v+IPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4M+5nsV; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-34da84cb755so1714774f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715366001; x=1715970801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6cf5OkTy8/ggWCcTx4t2j3ZHoM3l7oNZ1OwIDi3O6A=;
        b=z4M+5nsV5hwX2MV34LO35CfbkZsVBzsz3rtzaoBk8rOXJsQuOwVU5f5i+3HN8B66kb
         zY/ZK8iMd73HTFoLH33h9T3VqZjmYRyKt9tF1qetyA2DObj4ZjXBLkmK6Si6rT/iRcuq
         jKDVIWoL9b1XSgcO2kRkS0aR0/95epIJ+lPNvWMH8o2Euk4P03F93qIm3cKfzLfAMKPR
         GmUAHNPvNRh5fusf+aKUYcOamr9X76cHm+geaAsS5YvI3gZU5sfH95UzEWfR/0zpHNwv
         qgB6/qOlqwnpCi0Fn+4pzWX2zi0xT3tJD2Ib0Uf55GzIz3SUlpjNU2ZHCCoMJHBEEQUG
         bLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366001; x=1715970801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6cf5OkTy8/ggWCcTx4t2j3ZHoM3l7oNZ1OwIDi3O6A=;
        b=OXZCL90sMBETXTYphuay1spYL9tMaUnjfC5APYKaS8trXs3UAM+wdRViQnt6j3eA0t
         lXVUiSUKa4fux4XG1U5xawd5359P2tNxN0ZpWs8VlF4UuGdjOJA0YICxT6IySjHSFwSo
         fp9GYuIdWbYUXs5AMd0XCDS2GyiTM6PpHhCg33Im3AsVgkL9Fkmx7EeKttsXwXucJUXe
         eAs81FtuHyEFlN/ZWWxmKtrtg1ru8TEOx7om//oC2qq0hOCAlG/wuoLNrubtJSck14ta
         iDqk/MjEPv4Eo/1XpC8vJ9mE/iStD88v/Yv7Gl7LiZd2ngdWQOkD2oMuAK0eVRKvByF2
         v1xA==
X-Forwarded-Encrypted: i=1; AJvYcCU48xJ/KMagsIZ1+82rLmvnZOU+YigQ4WUalx2mLTziTOnPcXIV7vPSCiGn/cs3qnI0BCvfiYPgkRu2Lp/jeKCaXVMtrqpeIDRWGHS1FQ==
X-Gm-Message-State: AOJu0YwGsG22Oo3ZfovFFtPkQwRGz2YYkxWRAUqUk76UHE5GEg67ycr9
	MFDBOofY6YrtFRz2Wm9nJyntSJlPfZYlBbmjn04oMenLMMu4qR/dcWHp4FhPwDxlIZwkCL50G3+
	iPOLvZWCR
X-Google-Smtp-Source: AGHT+IElm2yB4cFYhA7Skzvf7EK7GSKMnjRoxe9T7mRmzwxlYpR9kULlphxmoxxXVATBTGiQuX7M1Q==
X-Received: by 2002:a5d:554f:0:b0:34d:7a12:454b with SMTP id ffacd0b85a97d-3504a737a2amr2218343f8f.39.1715366001247;
        Fri, 10 May 2024 11:33:21 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacef2sm5237210f8f.85.2024.05.10.11.33.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 11:33:20 -0700 (PDT)
Message-ID: <badf2bae-450a-4902-bdd7-651cf3f27725@linaro.org>
Date: Fri, 10 May 2024 19:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Move camss version related defs in to resources
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240411124543.199-1-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 13:45, Gjorgji Rosikopulos wrote:

> Changes in V3:
> - Incorporate missing changes in resources reported and fixed by
>    Bryan O'Donoghue <bryan.odonoghue@linaro.org> taken from the branch:
>    https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/sc8280xp-6.9-rc1-camss-resource-change-verification?ref_type=heads
> - Added missing signed-off to the changes submitted by me.
Took a little while to verify this series on the four reference 
platforms on a reasonable base of -next or -stable.

Here's the reference branch:

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-stable-24-05-10--x13s-mmsol-integration-in-test-imx577-fix-rb3-gen1-debug?ref_type=heads

@Hans I'd be grateful if you can pull Gjorgji's series in at your 
earliest convenience.

---
bod

