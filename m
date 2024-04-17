Return-Path: <linux-arm-msm+bounces-17743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D68A8C16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 21:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727E42869C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 19:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE7528DD5;
	Wed, 17 Apr 2024 19:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWDBrcS4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38725605
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 19:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713382042; cv=none; b=an6qu8kxoynp6w09eCxyH6Tb3dHXX7UZ3uJ9inobbszaj5+Iy8UtWhuAVYTqDh4lhQBtwEymEgRWmQgllpB3NFcEs3qhYgQVWGyf4LH5QIKsoohB+Nxe4dybm05LWjsSrx/Yotd19/PEgmuV73DvRfPMOZohMPdxWuA9gUtb4s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713382042; c=relaxed/simple;
	bh=aqOfVeBPswxhVCc3J6CwUOIh4JXUwQUGg780kjI9G7s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P955VOnsvS3KE0s3m9cygMXOkdyvA5QGqSS5qO/bSpe2vPuI4wMaWLfkoa4jAsEWlB34JdQUU3BYqFfOkCpvsY2FqUFJI92a3fSlbwfpu32AoTM+1CX8K7kpvPXVc2m+TGtv50zA2MbBbBfcJvhHLkqh1EXDfBEFf/F6RCTBB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dWDBrcS4; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2a2dd2221d3so137548a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 12:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713382040; x=1713986840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SnaJGOhddJK2BKaTGnWEWd0CrbXPn1eAGhst2WKABfc=;
        b=dWDBrcS4qOigE2N2KfTGfjhtfEuAY5oYoclREJqRBG5XEaxCZBm07rlzzPJReMiF/U
         bTmiY2cMiNefBT+Qw6Bvh5vdcgiwI5D6HpS4cl0gxw1oQJ1eDzdj3SSS/NZY0vs3m8lW
         7VZ2Q/0Jjgn3sf/ZW+WPJfilDPfnW3pytg1O5NqanWmqOnSwgiZDMWt7yxKDmk/5Ezjt
         XSBLHuUIAaI7bFsCiwrIIsb4kEyvM1IR9Es/sSqBErLga/INOuC4dS4PEaVT0iYNx5Fd
         kJjQxffgiZgXfxhFNIUqQ5VlaMGww1dFDecXMI5y+mj2WOvuDVZsGiH5gIc2QPfPPLZG
         0D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713382040; x=1713986840;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnaJGOhddJK2BKaTGnWEWd0CrbXPn1eAGhst2WKABfc=;
        b=I2iwmxUDa8YC8NmjJs5eiqSlBsALHseQvBq1n8G1bMJfHHOaIH2u7bvkAyjq0Rz5ZR
         lB1iIesV5vo9BcUSXWF+jEOF2YCPAoi0MKPL/is6cC60vz+jB8wHhR7fL1TLcjKPjh0D
         46fjKUBr1VWowFdOoKipJ4a1a+LNcQm4W/BlU+r3RrPiRZjBfdQiiPzOUL1QHPslrhx1
         TjfcEpvA0rP5/BNkDRcWtcYlFSz7QT5uA5uKBujiiX2R53oqiAjU8OjTs8Yv8HS3IOyn
         9P/ufK5QVm9g5w2ic3YDcim3b/unRrO0TrAzvq3wp8fNU9LEiOzrzBjyCHZYLF63w95t
         RnKA==
X-Gm-Message-State: AOJu0Yxg+p1GCQTnWNswxcZqUzEX8NlM0BuSfprL3A6qAfNcHr2/vKtH
	HQh/NHF6fZW1i4WlQpmqCZD49kMNhqsTUu/AtaVFnX4STKnU9NawIXFZUN76n3c=
X-Google-Smtp-Source: AGHT+IF8fF8MgUQZSDQuDJz+9pWnQOWBMT932iqd8T/RMY+MsdGt56ZWnoPGo8LC/LxCTjZAXjHjpA==
X-Received: by 2002:a17:90a:3d4a:b0:2a5:fff9:686e with SMTP id o10-20020a17090a3d4a00b002a5fff9686emr368756pjf.16.1713382039768;
        Wed, 17 Apr 2024 12:27:19 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090ad70a00b002a63e966fd7sm10622pju.47.2024.04.17.12.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 12:27:19 -0700 (PDT)
Message-ID: <884579f5-8dec-43ba-9919-a9914ea85c3f@linaro.org>
Date: Wed, 17 Apr 2024 21:27:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 6/8] dt-bindings: clock: qcom: add bindings for gpucc
 on SM4450
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ajit Pandey <quic_ajipan@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20240416182005.75422-1-quic_ajipan@quicinc.com>
 <20240416182005.75422-7-quic_ajipan@quicinc.com>
 <951b34d6-f465-42f7-b39d-eedd649f3c5b@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <951b34d6-f465-42f7-b39d-eedd649f3c5b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2024 21:26, Krzysztof Kozlowski wrote:
> On 16/04/2024 20:20, Ajit Pandey wrote:
>> Add device tree bindings for the graphics clock controller on
>> Qualcomm SM4450 platform.
>>
>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>> ---
>>  .../bindings/clock/qcom,sm8450-gpucc.yaml     |  2 +
>>  include/dt-bindings/clock/qcom,sm4450-gpucc.h | 62 +++++++++++++++++++
> 
> I wrote you even instruction what to do with the tag and it was still
> ignored. Do you read the replies?
> 
> I give up on this, good luck.

Uh, my bad, apologies. I un-reviewed it, so your action was correct. I
am sorry.

Best regards,
Krzysztof


