Return-Path: <linux-arm-msm+bounces-16778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFE89BB72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57D20B23796
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB084597B;
	Mon,  8 Apr 2024 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+HA3Y1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5C46549
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712567822; cv=none; b=J4PZsDP9MHNWz6UD32RZiTrSNJBUEV00VeaEZ1d6w3MioPtfFg+QYBjLbSJ5UCmzKVfIfqRUwdqu098QnZj+2MENiTOWAu/5cNUSC8Pkj91uAdX/XkzrhzigZO1fybxfrguIgGhi3thm5lPlVymWnhEAdGTXV6xd7V4+npteLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712567822; c=relaxed/simple;
	bh=ydZJw7d35Ff9MPe3LKMKV9TaBpQgVGBrz9NBba+U30U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cwzy/rJzPxbu4vfU9x661SUsHPO76qUeKzeBi8irvFcseE5RZp/jmEB2mtSfn/bHV5o96CuRAMTVKYsN30TmJEeTj8Z9NfSStiddRcWtLbv78gExKLF+ttq6hwTXt0r27rV1z6Bo2lxSUHHPksrzScnnwk64kbqbEFo6wMc1Ccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+HA3Y1u; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-343f62d8124so1897248f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712567818; x=1713172618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kyn/nAbJTaoSC8qDBWXGUmDfOwA1IOLpAo8aFHObHYE=;
        b=p+HA3Y1uGsNot0aTz+OdufmZB4YkQPySa3c4TJFx0rmI4E2PAgDSotgYw5J6nv8Ka5
         pBC5b71Kpdu+DBeBhta0Akk3N4lmR296RQViEfKenMNtNEnCefGlX7Zm2jrL1/eG9X25
         UMQubMkIoTEFnuxrNUMDjw6sBE7DvZyHRM+8zqMM8Mgdkuiktf+7+FFHiXVWgY1LmlBh
         BsHJQKV1P0v5ma4qeKi9cmdcCTRUMMbIo1GNOsR7I8bAN9PbHOE/GdaUHRu1UE7URovu
         CV2TQeyg3iQn14kN9A3T1sSwPHENxKnjxiCFR5aqXpmagGmxzqdNOAqKZG5pvIQTLOFV
         g8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567818; x=1713172618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kyn/nAbJTaoSC8qDBWXGUmDfOwA1IOLpAo8aFHObHYE=;
        b=KwcL/GVMKiEm4fg7XA6lS49LvFbxuyH6OXzsaBurts7zsy0bKwgEKTCZOazJsmGK0h
         xl3iPQ6+U7BPC1ERi42AQ4QxenZiG4ng7zce7xkgvXxhjPDK0CRJNp0LlhxCClCXBBUR
         AJNmt3nObiRKanf0bICqT8Y0bgBmkLWZYzxtI8Hrv0x6fqH+Mz0msYFYHMwFZd8ISsmS
         mWuIg7K1pVLQDcITj3goZ5tYVZxhzUoj999c6c+PkTcaUe/L9JxCze6AkGr2wuCPY/aX
         qZxEVfEc3k6x8ahYc4AkEJRTKgyTUIlRojfZ0cFnbIGgIgoyNx1lpPFdB/gJb8oEOf5h
         LRFQ==
X-Gm-Message-State: AOJu0YzuyGntVXqAh6XgU6pPpxZDjnKVm4aKhJrtdz90Zi+gI1+Tyonl
	6GlsRmcRnNeL/6oJKrZ3updeq2Wif2oyze/e7jlelZIvpEEH/O+trJ/Us0QuYCo=
X-Google-Smtp-Source: AGHT+IFbW+GZvWtDNwC+hUfv0CeQti5p0/4Lt39sOJliVc7683eESlFh87O+IacxG6iRBQDyz+nk9A==
X-Received: by 2002:adf:f28e:0:b0:33e:3bf3:a097 with SMTP id k14-20020adff28e000000b0033e3bf3a097mr5598241wro.26.1712567818504;
        Mon, 08 Apr 2024 02:16:58 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id q8-20020adfea08000000b00341c6440c36sm8586391wrm.74.2024.04.08.02.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:16:58 -0700 (PDT)
Message-ID: <499dc405-a292-44c2-860f-db78ad7becc8@linaro.org>
Date: Mon, 8 Apr 2024 10:16:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 0/2] Add support for QCM6490 and QCS6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240408042331.403103-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/04/2024 05:23, Mohammad Rafi Shaik wrote:
> This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> QCS6490 RB3Gen2 boards.
> 
> Changes since v2:
> 	- Modify qcm6490 compatible name as qcm6490-idp. Suggested by Dmitry
> 
> Changes since v1:
> 	- Use existing sc8280xp machine driver instead of separate driver.
> 	- Modify qcs6490 compatible name as qcs6490-rb3gen2.
> 
> Mohammad Rafi Shaik (2):
>    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
>    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> 

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>   sound/soc/qcom/sc8280xp.c                                | 2 ++
>   2 files changed, 4 insertions(+)
> 

