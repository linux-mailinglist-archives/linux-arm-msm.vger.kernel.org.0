Return-Path: <linux-arm-msm+bounces-734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8947EC95C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 18:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34FCA28155F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 830DE3308D;
	Wed, 15 Nov 2023 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAgleNmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA983BB4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 17:07:25 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17A3196
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:07:23 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso667292f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700068042; x=1700672842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB7xh8nk+eJb46EfbGktKWpgeMyfJEH/xs3+rQACfvE=;
        b=OAgleNmMysI+4IjxXxJVUMH7eSNNsmyVkMwS3VPHg3pS3EIUBuZH2NmtJLC+S1+29F
         cUn0KUXKNSgxx9MQoUQqWn/5Iq1G8df6UQ1tlNEdB7huWHDzzZFG7iD5apcRj2llu3rZ
         u6JPY3bQl7z1SYUQnVf45nS2eljK+SiXJn4YLKnp1xdGHCRdYI84ivW2JCoFghvSDYZ9
         1ahHIg94ZEmTgxnOpln0wxPK2bQejmIf9vekZvwN9MQmMlkqW2sKsuFA/NEVjhDKR96i
         aMUl/D7y/Pi+GTkZkBmca32OZUOU0DwyzakIfbBrly8h3FDt2G8DmirewIlOOkas1U4f
         mC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700068042; x=1700672842;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dB7xh8nk+eJb46EfbGktKWpgeMyfJEH/xs3+rQACfvE=;
        b=nRd5maiYJ6RgDZlllrtApWw5cmTAHY8vh3njS8huwGZc/L6FjPu4DAa744h83nX1d9
         ohdrHNOjZi8azj984SSHKpONTd8Q5V/wakaSzZJcrECd/mwRue/UShQBfcdRLKJtt/4+
         vkNqir2g/fpxREFx/xFv5Zyzp8xwZ8PESoBCGP4w17z9VfxxBkuq5hzTQYCSvjLMfH3D
         ydoMNVW4fWB860/2QzlsCeSEjMhkWYsz8QdXtJ3B1B1Ra0LkCZumTCHueBxTWPRVv4aO
         6inWYmISdHrAdgly7DJVb/fg/eVQL0gsFbDCpcx06TXUdSSDUMtWyM0nB07iZDLPRPR7
         rkFw==
X-Gm-Message-State: AOJu0Yzj3ilMfChFZkmvWyMQeZjnUlEwMvowdn/ihDBZ4O9PcRYyT5oJ
	K6ui3ucWfwkDf5xVx51N4+2P8g==
X-Google-Smtp-Source: AGHT+IGbUGtVGH7+Z3tfhZqIZqoIY32UXp082s8ffs6m2y9YdKNUEMx2b6pMMRQr9j+dTdTEFGsGpA==
X-Received: by 2002:a5d:5983:0:b0:32f:7eb0:2ed3 with SMTP id n3-20020a5d5983000000b0032f7eb02ed3mr5362719wri.5.1700068042339;
        Wed, 15 Nov 2023 09:07:22 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id b11-20020a05600010cb00b0032f9688ea48sm11078327wrx.10.2023.11.15.09.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 09:07:21 -0800 (PST)
Message-ID: <ab2c54fc-6557-4c21-9f51-761e8491f4fe@linaro.org>
Date: Wed, 15 Nov 2023 17:07:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq6018: add QUP5 I2C node
Content-Language: en-US
To: Isaev Ruslan <legale.legale@gmail.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CACDmYyfOe-jcgj4BAD8=pr08sHpOF=+FRcwrouuLAVsa4+zwtw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CACDmYyfOe-jcgj4BAD8=pr08sHpOF=+FRcwrouuLAVsa4+zwtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2023 15:38, Isaev Ruslan wrote:
> v1 -> v2: fix clocks typo; fix reg size warning. 
> arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 +++++++++++++++ 1 file 
> changed, 15 insertions(+) diff --git 
> a/arch/arm64/boot/dts/qcom/ipq6018.dtsi 
> b/arch/arm64/boot/dts/qcom/ipq6018.dtsi

When you added the v1 -> v2 to the patch you also caused a newline which 
prevents patch application.

Try

"git format-patch HEAD~"

then

git reset --hard HEAD~

then

git am < your-patch.patch

Resend when that works

---
bod


