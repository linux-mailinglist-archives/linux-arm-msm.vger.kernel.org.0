Return-Path: <linux-arm-msm+bounces-13470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D518735A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 12:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0C7028581E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C857F7E6;
	Wed,  6 Mar 2024 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="IGVZHo3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976B763FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725191; cv=none; b=W3vjkmXUe2cUIfo2raI2kVudkFXOy5cleiAZ7eHhokKiAQfxCfM41di3VQHy5xU/RLA8ashXhT/UPKagHDLzgVNVsiasZ8noOrCgd2HJ7JxUId0VUTti7zLOMrHWC3XZ9yqiUxZRKC2H8KE4nmeiDbUkmQVBlHtC7ukUT1ALIPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725191; c=relaxed/simple;
	bh=jmXJMGcRnQBUkk1Q0aNQZjxooTTiMnOAaGrBdZhF9R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJJx2zEoZr9JKvfKJGvXuzGlQz6qtCnUl+ybMYSN2OQgFgK2SfKxmtHhqRJXs/TQ6v7GQhJoiWqBI3qovmY+h/+51Ip2bHuip/O9heoSoxCC3lroCdAFHe1LyyxJ/2KTApyfKxVTwPEHYwjBx9oMpejTrgihi+dx1a8pAiVugT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=IGVZHo3V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412e92deb18so18808465e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 03:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1709725187; x=1710329987; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EQiUTBtPaCxK46oIKmaHtXvFz0YBoimK1cXyVz0Jy0=;
        b=IGVZHo3Vecpaycq97xGHIDeVLngWHvWVZ2lCs1axAoMBcHSQyKNUgu1eLEo2AJccXx
         Lxeg78fixDIouS2pRxJ7NDN9K2LJ0zmDRf8I8jeavkN6PtWjzhJAtN8MlPo0dZHiguVV
         JMyRaH/bqugjA4cGAMXyO+1TGrIRs38hI+z8euZfnCcaqkw8h2sShY4Sub9rL3GYysnm
         tOts0HXsstnBrqYjX9fhNzU9dAAxhTGncvYp80xZd41QT4sbtActNCNgAVmUaYYaIPFu
         Qq71EuDY2YWof3h7OS5vyGaBVQfdnp60cP7KXIp0AIUmvdRXHMb0Rw+XV9XXwtPQJzXY
         O12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709725187; x=1710329987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EQiUTBtPaCxK46oIKmaHtXvFz0YBoimK1cXyVz0Jy0=;
        b=hLNmHmAVmtOjPy2jbI1FgOR8RrnJQiL9y70IQqVeOS3C8Fk7AU7ryUSMs3mRIieCGy
         T/PapfBu+je4B8UhZzKBFLxGqQ8AoN48MMYR5JwqJ4GqO9zmVmMR9WOfZNCqKxd4uN0L
         8Xwf5ht/hF1drzi/M/1CJeANGj4RI0Acnb2i1vs27THxk/sDPZxWtoR5mZ5+nngOQMFw
         iDgtJV922GVivVlhcYJeETtrZZUSwxxNJ0I57yk7imZfsN6MTWxrDsS5nsfKjM6C1ALN
         DcxspPHtrEcjZ8zFOC2WcVHqa4s20AXOfJsW9oQM5aKQ4Egw90Nxeoi5bH0AYi9oX165
         Sq2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRhI+gnM+gcklD7QZNDGZJoJ12U3CySjNFzEF57Jjvflt5PACeXClsTvYLpPlZXRqGaXwVa9l0Bi+TmRWlBjAqCZGnwrzDvkBRdHWdfg==
X-Gm-Message-State: AOJu0YwFabHDpYWniKKQXwTmJS4kTkBF8ffYiZ/Vj8cFgcDNCu+z+A71
	IwBzohxCzfCPp9VpK08nG6tooMldOzNZIslslATd+11eYhLzToJWBaZHMCT2tVM=
X-Google-Smtp-Source: AGHT+IE0yeWy2wQap7b81/nBlb9F/2UDgBWy2qDnR9pAcy2ADsqmaYAoNU2UIpfNdXJJMmuJgSuHmg==
X-Received: by 2002:a05:600c:4ed2:b0:412:7218:bda4 with SMTP id g18-20020a05600c4ed200b004127218bda4mr10157714wmq.19.1709725187383;
        Wed, 06 Mar 2024 03:39:47 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600c198b00b00412c8117a34sm17072539wmq.47.2024.03.06.03.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 03:39:46 -0800 (PST)
Message-ID: <70e2b458-6cf1-4953-b9a6-2c03a0d7965a@nexus-software.ie>
Date: Wed, 6 Mar 2024 11:39:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: avoid multiple core dumps
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1709704406-22501-1-git-send-email-quic_dikshita@quicinc.com>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <1709704406-22501-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2024 05:53, Dikshita Agarwal wrote:
> Core dump is generated whenever there is system error reported
> by firmware. Right now, multiple such dumps are generated if
> recovery fails in first attempt, since the sys error handler is
> invoked again for every failed recovery.
> To avoid it, add conditional check to generate core dump only
> once during every system error notification from firmware.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

