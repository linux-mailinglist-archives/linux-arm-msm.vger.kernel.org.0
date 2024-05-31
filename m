Return-Path: <linux-arm-msm+bounces-21310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A48D659F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21D6C28E7C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960A4770ED;
	Fri, 31 May 2024 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grwMqSeI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11EA29A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717168767; cv=none; b=Y3Xry1jTN2RAwNIMntKgpuIxrONA7Dzfg1O2u+NRNfxycz7gXhGWUoQ5IKHzKzTJbk9Sl4FxPLW5xMrYttFMX+l5kh0yVR+7hIBkbYym3O2e+Hhc73qAkrWMkRzucNElGSE39M7EDK3ZutTrevkY+cFlxu5Szrz9xaPz+N5bwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717168767; c=relaxed/simple;
	bh=bcdlABj5aNogQ8Zc7q5ZypAW94CQX/BF/q/Jg6JN5zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibOte568uhWfhjVwBY9sAVaonyunL/WxSUXuyJnH/mRr6+CwmysP8Xmp/Yie5ULmUHzK4RYaCHLVttVsvD4UCJhnVGu0bnt+8sAijBPMCs1c1eF4mAelJn0RaHw008Abl0U3IqM/Hyo4QOZ//yF8vkm/d5g4wHBhKxJ1IjKMSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grwMqSeI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b88740a93so988012e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717168763; x=1717773563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/L+rWP0wiKul7F9a6T3e5YRmKd9MmxbkPS5jlv3TgW4=;
        b=grwMqSeIRILCrF/KB/Si7YMsvWyNVC4UO7WvkeyUwoxvEJzlEGwrZ7qpJewZtxZHTA
         f2gsi6PG68xdvucQQvaBMeSMa6Pepwvg+2vHABchJNq0mSLjTtP4AX7T1NqxwZomDnYh
         93YwoBQki+jMsyypxRy6oSonKywNbq4bUOxOp3uCyY/U5ZE3yNPBrVBkBlUdpSp7eOAa
         ogYFjkreJwinKuUhfsSZX2TZFNKPAgmykho0E/X+gjJSslTTVuVjyQwZFAL3Mg+EpYP+
         PLbWofiqI8/YUSW0k7YRwbCSp7UenskWFRze+ffPdeibxFCvpHB6gosUrzKX7aFOzQK5
         YBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717168763; x=1717773563;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L+rWP0wiKul7F9a6T3e5YRmKd9MmxbkPS5jlv3TgW4=;
        b=nsjlh7g5bn+NELCqln9l0Du4dpJCAzjl/4/DC0QKs6Y4hUA0bAMZnhGiscEDoZcSk/
         ny7ARQG2qRprYF79vDOPG+RLCVLZq3rh+ubww89fowTeq/PhSuE89P/V7PBdKX2U+J5u
         SPRosgWYoQEUZ24FbEjQPbncsKiP7sUMfZVQMXkjTmsbLUW/Hyny6Zq/6kSn9YEMQkqC
         U9uvmKL0ak0O2pXjNha2upcNWpPKGPIwRwHW2xtypmfUY/RzyGTF5xWmw7UNro3pqKN7
         ZWNqbGv3QdZmKnMhD3KXx8BDrgJuK3Ctiv0MSgfvWXpVCYs3QUkdQM++wFBFJOvmLYED
         zNhA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ3jAeJlnouRwqZgD/tuWVoPKlBWPWFcatpaHd+T14j9+80tIIDDTEj0garcy/7MAfSZditl/Qsuv1yOgWawu3TyB16w/Cg0NRt1Et0Q==
X-Gm-Message-State: AOJu0YzoFfk+ACdxsa8WQKYepcW7VQPtG2G0//uqe2SjAzWxWV/q/X6z
	9D3FsyuG0GnPFzYl84FB75mEKOten7mu/pQyZkEaIOpgKzWXHJqBGoRde71fw/8=
X-Google-Smtp-Source: AGHT+IH8LSJ6D1cX2aVwVrfqRCN/Z9hngSnWRAbocCxnxcid24TN72UwVpnb515XclZixpsrtSQKFA==
X-Received: by 2002:ac2:5bdd:0:b0:52b:78c5:b058 with SMTP id 2adb3069b0e04-52b89573125mr1608142e87.17.1717168762975;
        Fri, 31 May 2024 08:19:22 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d75c41sm361362e87.171.2024.05.31.08.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 08:19:22 -0700 (PDT)
Message-ID: <8ac8cc27-6c39-45fe-bdc2-40a310c815cc@linaro.org>
Date: Fri, 31 May 2024 17:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
 <l73uszlhnhyamfuwm7f6bbmockttwihsylkkgbyedkdseznlka@mtr5c7r4nqt4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <l73uszlhnhyamfuwm7f6bbmockttwihsylkkgbyedkdseznlka@mtr5c7r4nqt4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 17:14, Dmitry Baryshkov wrote:
> On Fri, May 31, 2024 at 03:52:18PM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
>> applicable.  Several existing bindings for these display/GPU/CAM clock
>> controllers already do it.
> 
> The series looks good to me with a single point in mind. You are writing
> that dispcc/videocc/etc are a variant of GCC. However GCC is a Global
> Clock Controller. 

Yeah, that's simplification from my side and assumption that at first
they designed GCC and then they copied the design to other blocks.

> What about renaming qcom,gcc.yaml to
> qcom,cc-common.yaml ? Then the rest makes total sense to me.

Several gpu/disp/cam clock controllers already include qcom,gcc.yaml, so
I would say this should not be a requirement for this patchset.

We can rename, although it always is a bit of churn - git log needs
special option, backporting is a bit trickier.


Best regards,
Krzysztof


