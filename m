Return-Path: <linux-arm-msm+bounces-19342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B605B8BE5BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559421F23CD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 14:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4F51607AD;
	Tue,  7 May 2024 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJnI0WgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B57F15F408
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715091533; cv=none; b=JTrXXgAs0V6BZyT0STRMSl4blF3N0/wKHg4Yi2UOL1vnZ9KtrWPEOJq783edaWSqZzfVAJUiKW9HAH2rqiYA0vB6/qIZQhdTBTa8TuGdOP//HCMGKTDBN+ZYoCB5Yfm+EeVcV4exfNP60NJuupgtRFrwEktGAsERfc2B3QBY/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715091533; c=relaxed/simple;
	bh=E9jPUsIV1FFv9HwtRXaXD20Lt/JQPRSXI3gSnwpUUkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGhS1mX5ifLXiPUCQj2ViWhgTMT+82iSRtyS8821wl20pRNw4nyZAi9NhdH65rs4LGIuVUmfBksNHEPUn95BpDrslT+L6prgBwThjpgv+2qYJMFChhTIlAGM5iwDfySTuPLECVKbWBLTCoCgVWDJ/M9lH79xHfn29yp25LRF2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MJnI0WgV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5206a5854adso2561571e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715091529; x=1715696329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6B9/opbNGy2dF5CZyiOc2E1LTO1EkA3zCx/KbLDUB4=;
        b=MJnI0WgVZ5azaNfgzoT6XCYsR3mQzU/ZJl/yMEQuRT56bY1NWPxQDAbJh6HFKj/bjY
         G+vnF6FIBIOq1J7Lu/ZUSuoIqkoqahbs/M8qNP9NlBiFmKW6ocsuEcu2ySC2mjdnfbrR
         IxH/rKx76VRzG5bsZ/964SO7Hm8SkKlvBdRTsPL+wXXYrAkrNo+p61k/bAluk/oODi+m
         DEg30/wHFcftOeUstrS1gWNJGw5BwkHQtnbDwE3c+7CiXpCdtqCtq6dnXJWEavS8tVMt
         lo6NqVD55ehzbDPU1SB8utFdDSWJNxeAsqcw8MkB5GXwP78Ozkg7IQRmoCU19JuS1/Jr
         27CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091530; x=1715696330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6B9/opbNGy2dF5CZyiOc2E1LTO1EkA3zCx/KbLDUB4=;
        b=PPNn0H/vOOtfL7XMFbrfp555kqrz5OACa+X5M1NMX2/1csGGmqm7i/X30hUnCIfAm+
         TT6jOOO6LSdcveW1I/9Hn6hZwQgV7SrfRqKro2FbPdYhJ2d7sd0s1hQQWUgqeGAd47Wl
         6BCC9wtn/OgdY4OEy1592xJQhBe6aD69agh61Y3aYDnCuwVlH2EnXTgpqTC1RkVHf1fl
         X7XRgE8ka2neySEn1mM1TB6TZMmJy/LHssccCXdF6+KqBK+vHVfVHsn8atsUpZ2iGes7
         X/H7a6T6S3pfi0ZzVnUAyYejgaCeTnYu6Qm6sgVR6FaBXPOBAV1dEdESZ7ygGUdoCZnt
         0f1A==
X-Gm-Message-State: AOJu0YztdMLlPwoOWtDtJckuxyCU+7iEdlo1VSpbaJIJi5wd8pVQzUH8
	eH4d6nhXsf4k6+XWXpc7+EqyGqQU559GKmD+kmmuo3PUzM/gLBNly1X3klXX1Uw=
X-Google-Smtp-Source: AGHT+IGvfA2LnxMsAtbgMLtJQdOK715lWo1rdpwj0+KQ282HVHdI8dUi4imvbg6NqFVVZUmIGJifiw==
X-Received: by 2002:ac2:5603:0:b0:51f:3fea:cbcf with SMTP id v3-20020ac25603000000b0051f3feacbcfmr7210675lfd.52.1715091529529;
        Tue, 07 May 2024 07:18:49 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c0d:408:fa88:abdb:17c2:cf24? ([2a00:f41:c0d:408:fa88:abdb:17c2:cf24])
        by smtp.gmail.com with ESMTPSA id br39-20020a056512402700b0051da1d9c47esm2124202lfb.64.2024.05.07.07.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 07:18:49 -0700 (PDT)
Message-ID: <6d9879aa-ae84-4ed0-8b5f-5609fd0c37b9@linaro.org>
Date: Tue, 7 May 2024 16:18:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arch: arm64: dts: sm8650-hdk: add support for the
 Display Card overlay
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20240422-topic-sm8650-upstream-hdk-v4-0-b33993eaa2e8@linaro.org>
 <20240422-topic-sm8650-upstream-hdk-v4-3-b33993eaa2e8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240422-topic-sm8650-upstream-hdk-v4-3-b33993eaa2e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/22/24 10:48, Neil Armstrong wrote:
> With the SM8650-HDK, a Display Card kit can be connected to provide
> a VTDR6130 display with Goodix Berlin Touch controller.
> 
> In order to route the DSI lanes to the connector for the Display
> Card kit, a switch must be changed on the board.
> 
> The HDMI nodes are disabled since the DSI lanes are shared with
> the DSI to HDMI transceiver.
> 
> Add support for this card as an overlay and apply it it at
> build-time to the sm8650-hdk dtb.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

After testing this on real hardware and getting some word, it turns out
there's an issue with what seems like the SMMU ACL settings, preventing
the display bridge I2C controller from being accessed and ending up in
the board being unbootable, even without directly addressing the bridge.

Not mergable as-is.

Konrad

