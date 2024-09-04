Return-Path: <linux-arm-msm+bounces-30703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46D96BA78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389381C211C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BC71D222B;
	Wed,  4 Sep 2024 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yGoy+T+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449611D2221
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448923; cv=none; b=PJsf9/x0AiaUqHa1KsNK/6eFLzG9b7oAjrhX3GNSqt4/JuZF4iYIMnre1sElvZkJO5g3XuaMOSxuaAmbUoTXcNwAHZwqavQEM3bAwY/EfZZ5UWFMiTJwYMM9l99bmvLVeFR2N1a+Nw0F7ou5dr/exHcTpXHdCJ3kLqGCrvfrJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448923; c=relaxed/simple;
	bh=tUGnitL1oJl0KMESzrvT175K61tGZWpysgJ6DXWcXJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNFm/2s/9qTvjJNVDyvVFgirnJKgahJi40UfiTF8Psrq9UDtRflNhIkdTmZPoteJKOkVCCXlQ4WqgtDnapw1pyeUKb58IRmg4fkqGYOnBJwBgCAgOUErzHof0gjB3nPyfwMhm1rxwu8TXEMsy1mWyDdjNzxWL6SITvn27TAhbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yGoy+T+U; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8695cc91c8so659107666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725448921; x=1726053721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MltCR2kUJ+u6ewwt3PqnT/txTdUpl2+plAUyJiRYims=;
        b=yGoy+T+UqVCQvPDFjmslyxscPHNx+uVcJspvVIXfmAwBNNPAnR2q0cr9pgu6NRIsve
         gEKQGOE1EoPWLzTyI039FNnP85yTxLz9rPSCkNpD0l5JxTTLS6Hw64XCfnakNoHJTdEP
         849LJnStPLHbAiqPuUL37J8ACQQQSY+ijLiCKqqR6uVnZc2CTLcjkzauvAUTCXR55a+6
         u8toLaYDCUh+AAsEa02dqkUnAdmgSimN6LxjosmqTOjZNuHb8K2m5BBOzR+/Qz4X5dEN
         hEkO45bOFm1zAxz+MGB97rfJSIVm1gYAsLQhHmqG7gM6IQ1ZvukL/m+YOcDkAc6FT37b
         2Nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448921; x=1726053721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MltCR2kUJ+u6ewwt3PqnT/txTdUpl2+plAUyJiRYims=;
        b=dFgQJv5yij+Pt/EJDcoPgTBk3zpgMkbfcGbKrD0JZlGe2PRyItTBcuYLEiPRf9BLA7
         Gr5ieMZaUedz+JkLdY1GOEOv+Of+1s3TlNVWD1zUYmy460Jz0AkywC4qgBq19O2bHHRu
         sexWB8CgeQNnyS4fC9EnrfdFX90wJcYzrnOEkPf2ZY9PAICg+SDigqXUS7WBCn2W8Kq+
         clMOceMMZzR2PorLMMg1vWSvU2MAMpRdHx40+pzQuveuLvkEfbdiqxHryKCnfHx7cQl6
         kH8uyvbPqtGof8+or75WzsAwYitybPNxjwGhTJNs7DRCt7FkEOP3MTmU4xewEaBJpXgI
         91zg==
X-Gm-Message-State: AOJu0Ywui4lCSJEwCvsQXywbrRGqnmTNURwJjlJHYngPJBmsD+lZMQBg
	kcBzCQ8xvsUfDSyCJoKIXvOklKNUEUUkFyrTlhaCuZ+3eIlIMjeWp5rdN7u2Wcc=
X-Google-Smtp-Source: AGHT+IEQMSaBJ2FULqhSKBJMnPPhxjYwbXKozHJSAugRmi+lZj/dOm7MB00O2RV/p9wBRd67mSyVFw==
X-Received: by 2002:a17:907:7f88:b0:a86:92fa:cd22 with SMTP id a640c23a62f3a-a897fad710emr1171240266b.68.1725448920563;
        Wed, 04 Sep 2024 04:22:00 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f26asm801371066b.58.2024.09.04.04.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 04:22:00 -0700 (PDT)
Message-ID: <4e0529d2-0277-4a41-8d4d-915e4ec0baa1@linaro.org>
Date: Wed, 4 Sep 2024 12:21:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] (no cover subject)
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>, stable@vger.kernel.org,
 Hariram Purushothaman <quic_hariramp@quicinc.com>
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2024 12:10, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to
> bring up the CSIPHY, CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides

Please RESEND with a subject !


