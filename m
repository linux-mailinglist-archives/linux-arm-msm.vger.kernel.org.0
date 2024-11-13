Return-Path: <linux-arm-msm+bounces-37846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1389C7933
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 17:46:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96B5A1F2362C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ADF1EF955;
	Wed, 13 Nov 2024 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TAYt8T/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156916EB5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731516369; cv=none; b=glpE+iHAwP6DohgxI2b1agqNLK8EpZEmM4vYtvHuccrsU9h7gd/AwVhBtL5b9KTAcl+9IgAXv7ljXqBWp9CHjN0iziCjyzMcKxVqUC6MHh9twXtPd6yZzwMfbVW8KfjLYbmWMTa314APF300nzx2oFQ6NDGiXKbeRC+iSvPY9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731516369; c=relaxed/simple;
	bh=Vwy1oSriyT+MIYawWcOFKmv9oUnxvII3WvkoO2ynRdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cd5IvrBH8dQ+6VK6czr17jhtHAza306cJ0DR598RIlzmurhstpg/WoDHbZ4QYlt1XUMnC+c26HmuwRJNAFx/vKw0FS6+z+xZycUAcY2WGAP4XW+ewbCLDutVPbPLGtD/DhwWzeT2YQYbnN/zFvEiv1WTKl9L23N11xaTjHJemYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TAYt8T/V; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d5689eea8so4220526f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 08:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731516366; x=1732121166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmkd5V8HB7Q4sGbZtrxWGBf5+TlXsok1y0ywIIUCx9M=;
        b=TAYt8T/VBfmVwMCjba5GcN4v2jybXER9dVX/mahXo99h1DFmIfuXjyx6P9cyIY0F2J
         RLz+SVI16yoTq/JY+y3VN1TEp2jjnH/fsfA3BeJ85oSIRq0NhNWEEFeFj/7lGamjTabm
         mXmWCHsNg4FFrcvtHkPi69VS3cSGVOZ6AmoD4RnMVc+xmSqxZ1VwkVieZLRSahbYkmJ8
         KPEUArxU/wUl6R9xi9whVIvuzS/lCa/e2MpQq0fPHcb13M7wSnpkQodWxvlChQqYRW6j
         BsU2g6zfiocV3Sl8gyAGorRTtyWF8zjhe2a0xvwA349SUTof2+R5tB/tBWH25hBqNbKo
         cSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731516366; x=1732121166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmkd5V8HB7Q4sGbZtrxWGBf5+TlXsok1y0ywIIUCx9M=;
        b=MT9rfsL3Ac101y6ZQz/Nzw3n9LskN4Rj/99BjZhYvGxQWlSHMvHm1v6a6LnNGYZboH
         qJnM/SNoOyX+xy+2ItLkjRPRnXptt01Kwrwfab9unuzKNU2CdThDGOagdEDQnYJoS9ZJ
         vP8aLOl5tVjB1ppIxqFTDYEVAyyFsg3A4mjjeyqj9C+s1CNbjsn7bUL0f5FYyAr6+Q1Q
         KaYTPmT2diiaElWKtF1EMclx+JTr+HuXdTqwMCZU7ZCbwEvfop0rST53wuHMFeKBiACW
         ifpb0eQxT+nDX32IqLmf3MQMsjnPZokKvIKWcB3k3zm7J/yhHs2f15ds+CwLrktpN5Y3
         4oEw==
X-Forwarded-Encrypted: i=1; AJvYcCUGA4PZdURWN0TOuS27nPY9kdybnh2U7EJaLf/9Kwceq05W4rm6R0pFOJ4mAwRhcMNcciW8aFy0KpzWqkww@vger.kernel.org
X-Gm-Message-State: AOJu0Yyul5MXcTLu7K6HUrcc5J6pACqf5CaNGsss9YyZgoo1UbAbEkX1
	oWkplZcYmnqdhgohzvmX5VYIqO5+Ccd1yYdl7G7b3uRWbOGhJIAZImNsA9FdyfE=
X-Google-Smtp-Source: AGHT+IEPY0tVNdb8C+tYsDxL66F1F1lB+tkHPAObFKOXietn9feaRfTNcNYc2AdjkSxoREK/g4zzqw==
X-Received: by 2002:a5d:5f81:0:b0:37d:4e74:684 with SMTP id ffacd0b85a97d-381f1888c09mr17565241f8f.52.1731516365863;
        Wed, 13 Nov 2024 08:46:05 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda0517csm18751675f8f.96.2024.11.13.08.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 08:46:05 -0800 (PST)
Message-ID: <16d1f749-03e2-47fc-a7ff-d77ae0f30af9@linaro.org>
Date: Wed, 13 Nov 2024 16:46:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: qcs615-ride: enable venus node
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-4-e67947f957af@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112-add-venus-for-qcs615-v2-4-e67947f957af@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 11:48, Renjiang Han wrote:
> Enable the venus node so that the video codec will start working.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

