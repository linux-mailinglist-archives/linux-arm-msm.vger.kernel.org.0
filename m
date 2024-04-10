Return-Path: <linux-arm-msm+bounces-17108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50089FF80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EE02B28525
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 18:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584071802A2;
	Wed, 10 Apr 2024 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhXYTfDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805B717F36E
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772862; cv=none; b=FyCTPnT7uMSqVghgLyA/uhXJgVFqXCMkNIMzDwHxugm5OZHhP+jxkpo/Chr5QsCFWMiYlIiEzg1inNBPHz3RQoAvqqp2jHsBK0ARyZpUavv38nQBFwOOtqLFISAQMG2BsqiFhkYnRa90aoiK+GgDD9jhj/1vCzPXS3QipkNsXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772862; c=relaxed/simple;
	bh=Gy/xIIAV1IMY4gqYPnEYGC4AI4zv1opJbJknGzalJ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufvgP6OUNeQ8XwOnU3++K7K95jCqEmWuqo8ZjrSbkrGilxSxKYmYJ168qZbufedYJ8xCCVMK515YFsfwK3lxDXysxfmRUBfXljIhMkWo98SxjeTYw5/HaOKlZFkJ5DyC1W/CRWi8uUSpLNcK6kDODjpSnG5KFo1/uyT3JjaFaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhXYTfDj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d756eb74so6423004e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772858; x=1713377658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0xVS150YzL1/Xjxdbgyf+gnR1gySWkGWU4rQOhTUgs=;
        b=yhXYTfDjBJJGIYqYuMew6SxU49DvSPIgyAiz4S24PbRkKJavtNZVd5Vy8VM0UdCtuw
         MnZ/m3J1fOy9hLD1BsTjeyQOiQJafAnZYmrKWcn4xyedxwtUKspy0v2x+Px//VOBkyUu
         0PmidtRI/TORJQM4zK6GYmCdYz+nd3g24Sj95H/GxYeaMdJe8GHHf4gOTQj43FIiSjgp
         GOBEWEOFTl+uxqfl2W7YbqbJmTe37YTW02cWaTw3vQgdw4NiPNMXrzRFe2Ci+CRb3sOn
         9s05dvk0BwrfoCl0Rk4/t2i0LS5RElPbmqQhJjHBrRXdqy4++fL9g67SA5qKFnCmOGkC
         o4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772858; x=1713377658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0xVS150YzL1/Xjxdbgyf+gnR1gySWkGWU4rQOhTUgs=;
        b=G77WODbwyStj13kkXZMveQi2WVjUXkNGzTRSrxFiw+ikgth6UgtuGxxTQbpci6t27P
         v5QXj8KTh+mMQk0lDiw+An/XRZ0BikBNwcrgT394TlXIFj4wv80VQBkGIoc4UPlNQ8bB
         R6cqhe6HYLj4/TjfmM7CSt1hfZLUVFsOm52BBJ8Vg1p5mN1nVeALNw742KfpKsNYec9L
         82lZaCn6q6yF//GgfKbMogIJC2hOa0vg+uLQdzMFE1D/keQwxhHuxVQ9cATgvi2/qbbO
         Tmx0ckOHWZFRXkxfycIB2+uJjgwH7mVvdKFxd6/lF48/FXWXN3r03LCZ6GRy7c3V2fWV
         vmSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP/oKf5WgmB9ejtk+WUIo6XPVWcer9O8RvlFw0dr2/zG8+pn+Srg3kzZZ6DbeKQU6gRKLI2fFotLPBgkUddwFYyQblBDM7I9RQuKVULA==
X-Gm-Message-State: AOJu0YwY9o2bcayD+WxlNrEDUqP8wqnE9AeooyBY90mwyq1hPLjnqP6I
	vY1nEvc/EmG9CYIa8sN9wy51oW2wAXh3grQVJayAJp2B9p8EyDCA98qww1pfybc=
X-Google-Smtp-Source: AGHT+IHJvdEctTXsMhmqjLzywAkmj1+HPln2kt1QjwJmq8JoSF9B969r0JTZpPS+58OEikc1Y2wPLQ==
X-Received: by 2002:ac2:59ce:0:b0:517:5fba:fb54 with SMTP id x14-20020ac259ce000000b005175fbafb54mr1995958lfn.3.1712772858487;
        Wed, 10 Apr 2024 11:14:18 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d5-20020ac25ec5000000b00516d4c31ef4sm1874863lfq.248.2024.04.10.11.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:14:18 -0700 (PDT)
Message-ID: <92333536-7f43-4fa9-8d52-ae2ac50b76f6@linaro.org>
Date: Wed, 10 Apr 2024 20:14:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] leds: qcom-lpg: Add support for PMI8950 PWM
To: Gianluca Boiano <morf3089@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240402-pmi8950-pwm-support-v1-0-1a66899eeeb3@gmail.com>
 <20240402-pmi8950-pwm-support-v1-1-1a66899eeeb3@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240402-pmi8950-pwm-support-v1-1-1a66899eeeb3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/2/24 14:35, Gianluca Boiano wrote:
> The PMI8950 PMIC contains 1 PWM channel
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Oddly enough, there's also 1 LPG channel on the PM(not I)8950 @ 0xbc00

Konrad

