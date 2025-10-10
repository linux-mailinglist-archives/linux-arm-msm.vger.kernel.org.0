Return-Path: <linux-arm-msm+bounces-76793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77613BCD632
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 16:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122F7421E04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5622F1FC7;
	Fri, 10 Oct 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZLZwCgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EC34BA3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 14:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105238; cv=none; b=c+77IN13gf4qCMfAWO/UqIk1pCW0r+9UPFfycFqGZhcRjyBcwVOs3BNluo7ZTUC4Wo59w4tGJnnk6XrkHnQrRbRZP3+PXNgj0MK6+9BVXec8iESf7jmyyzc3hvfrBxsiUvSKmvcyUNO8KOGh4w6vMp64q11AxLN5wwSxcKAEcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105238; c=relaxed/simple;
	bh=EpvvbYbzvU6zmy28zGsL/hrDErMFtA16oSibI9TggNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0ls0AhATYZkAyPchs9lkrVM24ITK0HEOTDfLP2RBbDi4V+HKVZX0rYpfxK/y8WBCoAaxmF9e6lqJeQqCaXedHdojVcQ27K0Mb0lOpRXGIUCOFQYxhjzStEVcYpXR5QNiyc6EcdtpMQQcs/g6ucKncUezVXAEiiNnS4E6hFxWuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZLZwCgd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so14625945e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760105234; x=1760710034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Enu1DPq85k1M2WpWSEeI3rs72YHXo8vk1sE+FawP+Qo=;
        b=lZLZwCgdincZK8sEABhFZMr0j9WNDZ4uPN4WK/DvAn026vQAcW5o5YK5QHcF+wiBrI
         Uwgzn4TlduPRKm8j+0sjSq6AekZY32zPs3MgWugCxV+hkGBcbmGMXX44ghV0MC94LGKg
         NEJGxN3jnKHXtYaMhTa7VXCcasAtY21Wtm1pxv3wTmsXBI07CIRi4vkhW91WWuY9wlKw
         VLixueMZgw/NoUkB9d0Ey21l1zSp0G3D5/dXM68c1d2Seq7no5ONZ/MU7kLzl8AB2YRl
         bm4eKyarbpUi4HpQV/rEoP8QJpT9jz9A8FMynLzG6YTkPjUzUAdQnUh3opbL6Bm2wWJ1
         3AiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105234; x=1760710034;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Enu1DPq85k1M2WpWSEeI3rs72YHXo8vk1sE+FawP+Qo=;
        b=vUh28J0DyxgOvtXTbEBcW0XsTFYfIMmxIRuW0VyNgdtJ5Pqw4tfLpqtcWRLQ/65X8R
         9SJx+4p3V/ou7w7ALWdMT1Gha0TvW3uKEyT6Hn7Jrsr+EfZYZ2IYdgTWJmEENgv1nZW/
         wNvMFXfB2pOpF1Dwn+ZbF21huxau2OvKD18vwYXxVDxFFa8MKW9XEwF43PKkEwpyTLoZ
         3JNFeFCxvgiuSo70UM1QnaNqLvkd4wnJFyWx7pa7dtCP+fPLheiIXQt8SPBNBHQEG+gM
         7vQrYV7mClHvSg1BYEzOXYniAqsGSRr7llol+P4XVmlaPlNENG6l7xgOgUwTgah7sMtT
         jQaQ==
X-Gm-Message-State: AOJu0YwpOBCOIDbJId1MVsekiB1gTayr8WSDJxvYMU7pNBW5211KE840
	wlwbgFFFoCzT/XP76/VfJGxcGlYfW7j66/79e1Kun4ls1Bl0Mr6Wx1/2OCYG5g1Z2mM=
X-Gm-Gg: ASbGnctySECxFSSpKYcKt4p8DbKbJbl3DFpJPDIWZn9r1qYVxLsrWvqyvtYniYRIDnN
	jk2P+6Dx3McNUIerTpPzPSLhvgYK3ikq6ndT4brB23Xt+EoS/WvRs1Zl3j1NnMHG9k4Y//yAgsh
	jiFo5ZdUI6KFQLKx2k/FIKTIxupmV+WwJu+G2kUkxJzudiEOfVdWXcncwkXDQdWwLeJTfJ8ldmn
	GPgmeOR1agh7WiI7N9ldCm0Scjvja4zBRAKs5CWJzzAn/UuZdSJfNAmpXlC/YC7N62G7aRvkiDj
	0Wo41D5OZD8PILwj6YpwTUOXx98SZGUp9GJiLMUmwLvfGb/h3kQYCHwEuzzRHBL1GhJl6yThTXn
	kfT+flNT6nG6eeISl0x+S0sagRrvereWuweiOPjUhCzVBnCPmZiPh+n0isu9UVvg=
X-Google-Smtp-Source: AGHT+IFolS4C8hT0Zmg7bmr6SzhI/cPbFJ3OA3Pjp2+/sYyehoF+n9CTxeFrReeZKbRbn30lJJ9YTw==
X-Received: by 2002:a05:600c:138a:b0:45f:2ed1:d1c5 with SMTP id 5b1f17b1804b1-46fa9b171f2mr80864615e9.36.1760105234051;
        Fri, 10 Oct 2025 07:07:14 -0700 (PDT)
Received: from [192.168.0.36] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm4343474f8f.18.2025.10.10.07.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 07:07:13 -0700 (PDT)
Message-ID: <f033a8eb-df80-4f71-a941-09ba209f5901@linaro.org>
Date: Fri, 10 Oct 2025 17:07:12 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 the kaanapali ICE
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
References: <20250924-knp-ice-v1-1-1adfc2d9e83c@oss.qualcomm.com>
 <36759154-4e7b-4cc9-b50f-ffb51a0b8aaf@kernel.org>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <36759154-4e7b-4cc9-b50f-ffb51a0b8aaf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/25 13:51, Krzysztof Kozlowski wrote:
> On 25/09/2025 08:29, Jingyi Wang wrote:
>> From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
>>
>> Document the Inline Crypto Engine (ICE) on the kaanapali platform.
>>
>> Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>

