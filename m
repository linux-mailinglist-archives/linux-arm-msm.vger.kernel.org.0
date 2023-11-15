Return-Path: <linux-arm-msm+bounces-730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F67EC8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3937B1C20847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEC9381BC;
	Wed, 15 Nov 2023 16:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrIUm4g7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E35381A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:53:18 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3759FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:53:16 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50930f126b1so9343553e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700067195; x=1700671995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGO9Oq0SdGkpzzE3uJylZH6OCZ5SuMtsEESQkZwIHuM=;
        b=TrIUm4g7TNZg55PzIoN1oFIaRDAr2HToIM2TxwDH29q0uj1KWOfFvauCtab5t4sW7n
         cgItpGGESzApfoUdIuqiqREdXvQDYbwh3acs+fMgpDnTLeWbA2JD5xAD8kvw6+dk/Mdd
         ScS4J2r7Eq1QL5KpIPcy26OxAndey3QSK+hQD4JIloRa4CMFzC4d7vEeDiSE2lm5asYp
         bccg1G65pQ6FCiHClDknoU4t3blHxkvYu6+So9vg6/44UdEykaBnhDydsgJHnqMkxWar
         HsNVue7DUzeaZc4Mg8VpFo0ZmU5QKNHnjz9dkZeHCyEEXa9Q9fSMQIjjLB2hr7lVdSTm
         zlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067195; x=1700671995;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pGO9Oq0SdGkpzzE3uJylZH6OCZ5SuMtsEESQkZwIHuM=;
        b=Dcio3uM2TOuPGRJruVg6SICaG6KEzriN8FfLz/1w3t+6l1hmjk4kbK4tFgEEi6GJQV
         hdbzyT52jzL3tLMdTUfLTcAnqdaV+y+bYS/F6hUnOTuCeuY7lrTMhTsj3evuwQhWP1Tn
         cRKPXQooGkcCcTa2IULVkxRk0SaGXRVp6RUA0DjQA8rVMxhzc/wXuCTvJCCi/O5gWsFp
         tz1OVVOyX50LahFHG5C5V7KvrWr+MWDb3b+BjzkMXYI+vtONC9+qlf2Xl6N9Ss+WOG+N
         CJNmTmokWX1nFpASrkWbqoq/u2LPyjOve/hJ+GtYcq83xnt5JUK8UJ3D3p9ONJ1/jYVq
         KWIQ==
X-Gm-Message-State: AOJu0YyyETQxjYDaoaR559GoIwBUvoAzLXyZSpyxfP7LoUF/geWXsDYQ
	OxTVQtDB6+yhZkXXA3UrsumBYg==
X-Google-Smtp-Source: AGHT+IFCM+c6ikxUOMfm7OdMmGp21KvVxvkGqhc0L81YSlh7wIW29WUSnANYhPJ9hJXmUWlxyT5I7g==
X-Received: by 2002:a05:6512:12cf:b0:509:d962:3c67 with SMTP id p15-20020a05651212cf00b00509d9623c67mr11619942lfg.20.1700067194926;
        Wed, 15 Nov 2023 08:53:14 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b005007fc9ccd0sm1688540lfs.113.2023.11.15.08.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:53:14 -0800 (PST)
Message-ID: <3332e356-89d9-4e64-94d6-ed75a5ec0144@linaro.org>
Date: Wed, 15 Nov 2023 17:53:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: ipq4019: correct clock order in DWC3
 node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231112080136.12518-1-krzysztof.kozlowski@linaro.org>
 <20231112080136.12518-3-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231112080136.12518-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/12/23 09:01, Krzysztof Kozlowski wrote:
> Align the order of clocks in Qualcomm DWC3 USB controller to match
> bindings.  Linux driver does not care about the order.  This fixes
> dtbs_check warning:
> 
>    qcom-ipq4018-ap120c-ac.dtb: usb@60f8800: clock-names:0: 'core' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

