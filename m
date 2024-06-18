Return-Path: <linux-arm-msm+bounces-23101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F8B90D629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B286D288CFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761CE13C3D7;
	Tue, 18 Jun 2024 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BnRwdUwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC32C13C3CC
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722070; cv=none; b=c00D8SsTtV3zT80jRz8Wan57kk+pfaWCwxJA4uz9QEP7uT6m1dkl2Uo97cGwubCk3B5RnfpTaKnqz+797rmHe52Bpy9D3xQrmeow0tGzCu+5lNC+l/MknQpUJ/3/sdk4Xk4VK/axC68ZL5LlgkIBCK2K3OGafZ/ewYihUmXiQa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722070; c=relaxed/simple;
	bh=IZZnds0VRHrm2Ii8hE6YeOS6qZ0PTeuu48RLJyyIyXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AlFLK+CwomWouaakCpF2t1mvwzza7UYIdMGC2KvWWuLVRiTE7kf31zY2Rpp+Tt7ENQ5vl3yokGNRv5mMWwqFGDbZr5m5K/xU2P5JcnjG+GzeUIjj21tg8nO3WxEW9yPEYEo75V8US2Gs9B4/pGFkXWdD5mP7B900GL4w/FUx2mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BnRwdUwZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42138eadf64so44783745e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718722067; x=1719326867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3dYX4GpJ/TRHjWJ/CxptBXzc0wGdknCikvdomgmWg=;
        b=BnRwdUwZXP15wxEg20PWKAHy7YAHMEC79MGx1WtVO+EaUbqNxDsSISxVmj3b+tuY9t
         Zgx2suuLRXNgi6tGDp6yohZYXYET2of0ZI8qS+rBoCBm92DtNIG0mO7nMQv9SR196lrK
         2oiGVVDMdXvYZ/uFZzRAwcf50xSYZxW0db2qoDcDeJDti46NlaW+4CnNG6zzUKhfIB/A
         2lzlNrq18ztrQwzFtdYQhwL/QCqYY01IPCbkkDev8gmaX5RMWzq3uQ47/A/AyMt86xMe
         82ibvnyD3pYEMaDzXXssJ8rFDVftyUTp/g+9RrhG9nX8cnatIGAPnACUGalaCrd7HJ2f
         cquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718722067; x=1719326867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ3dYX4GpJ/TRHjWJ/CxptBXzc0wGdknCikvdomgmWg=;
        b=ZiovbOZGEK6rIl5B6QpwcP7bkC3ogJJ3fj+uh7IuJz3Mb6COsaBufQvul1JGePUZxN
         nhZeW9E8oFV62c2yo42xmOzqKS8eKm/0ZEH5fyfwLQVoc3qF3r/tq9PkGzyCTyEz6a1M
         Dn34oVWUARj4mE1yYAH5FchWNImnefMLsnTFZ6JI+5haGjV5gYp6CjV4pxzQYkvNb54u
         4uujEESAVrHMmo0m/O1kWMrFq5PLobI5a00+ENSl8PSXBkL4ZB2TXGTrVHLVAiTjsnIi
         bILMM5rRkNQhlKLD6s+OpZI8zoXVgnVRkY3HfLu1yGHsTlahcvM9rmZ/FdgpULl9Nhur
         9n2g==
X-Forwarded-Encrypted: i=1; AJvYcCVxCSMchuauDrWni6xyBlBlqC0Yxs3xMS49sfQIpnxNsMQ+lK+KFTCS7KPCKVkONSgTSKNSDwXY7e25c22cQ1CCjOzrWnR0yVJdBHuLxg==
X-Gm-Message-State: AOJu0YyUvevF8vjOHM6pFlOo15m4IepZvQeoI4lkyyPPA+++aYmsPOTS
	i0fXmUgKiAqeqI81V3v+htLbrrypPteWVCWfHmXun5oqWh/K4h2DIB0Aqoz4OIw=
X-Google-Smtp-Source: AGHT+IH7I/dhyj73BogJTxO5E8ag28pj1oQQCYT3fMmsc47p/80bkTRhwGBL+ram+v9dMFIqbI5/7g==
X-Received: by 2002:a05:600c:1d8e:b0:422:5443:96aa with SMTP id 5b1f17b1804b1-42304827573mr106149055e9.15.1718722067337;
        Tue, 18 Jun 2024 07:47:47 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de63asm229867065e9.30.2024.06.18.07.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 07:47:47 -0700 (PDT)
Message-ID: <36687425-0be6-4616-a3b0-9870bb187e34@linaro.org>
Date: Tue, 18 Jun 2024 16:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] interconnect: qcom: icc-rpmh: Add QoS
 configuration support
To: Odelu Kukatla <quic_okukatla@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, cros-qcom-dts-watchers@chromium.org,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, quic_rlaggysh@quicinc.com,
 quic_mdtipton@quicinc.com
References: <20240607173927.26321-1-quic_okukatla@quicinc.com>
 <20240607173927.26321-2-quic_okukatla@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240607173927.26321-2-quic_okukatla@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/7/24 19:39, Odelu Kukatla wrote:
> Add QoS support for QNOC device for configuring priority,
> priority forward disable and urgency forwarding. QoS is required
> to prioritize the traffic originating from different interconnect
> masters at NoC (Network On Chip).
> 
> Signed-off-by: Odelu Kukatla <quic_okukatla@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

