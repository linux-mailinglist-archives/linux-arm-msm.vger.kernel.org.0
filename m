Return-Path: <linux-arm-msm+bounces-23965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF32914F7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 242821F23371
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A956B1422C3;
	Mon, 24 Jun 2024 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAdCCaQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37D1142621
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237797; cv=none; b=iYhCH/BvPMnxDj55Q+UQYixvWwBKGez4yPJDV+D53AEYkn2i+Hz2Qs9lMBkYZSBdNRAxgbqDYApM0LDUQoZ+1Ar4tGBzBfkqj0AxsC/sj7xxUUCs2Zcv3QMfpOa/ekq4AVXArn753zTN3j4M4+NJEExjsN1jiAoBtWznr8sdMRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237797; c=relaxed/simple;
	bh=wn2l+DjOXmQi7rb+3KjuC8g7QL+DoJBrBDUsrbJLZ5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHeAePzWi9Zks/pX2S4+MiBkibdyT9WC3DRTFWqp/1FFKfOtZQTwSjvtr2+RTjni3pzHTXEFX2CrVnBKQ23xllpE4GYXg9icxVrPgXKyPizNRDNP+wGVRUh74FlJ/ngXhlHFosbFBhvVg0q9ymLNxARr4khVaChGnBAfFb0Y1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAdCCaQT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a724b4f1218so170558766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719237794; x=1719842594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uCSC/UQnH9u4UTQ8oJ18Co2K8wSpds1SgQKtCo0pUIY=;
        b=yAdCCaQT2WxsXAB4tlB6uup/GtxpyRVA0WhmMW36FI/raQ/I+zaW6auQkr8ry/SRZi
         JXpM9LjQ8Gs10+R+EjIAUfpRhfG1AB/kJZYboJjy/12XdGEEiRG3btfVZxCx4dYJ1BmN
         Eu5eNUIMZ0eZzEMR3Dtrvc6GyhY8StzKUDR4lhmNdTFaRvfUG9yuMOhpAbyxfk5B86lB
         +tW83YUabWdgKcgM2inKMl9vo3hYHI898tHU3W8OJm7JBSqsZxwOLUwNYOk6V1OBPwQj
         7d9bX+6mMa0mfVDEX6b0fFwW9hnF45B4ssFOFLxrTl/FMbaqgQRxhZmTEnVLLs+f0qTR
         Sn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237794; x=1719842594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCSC/UQnH9u4UTQ8oJ18Co2K8wSpds1SgQKtCo0pUIY=;
        b=W/mSeAuEEw9+dyCKs70BTyvFiyEENdQIUlxXIYzACJ6OFuNSBtx7O2pzwfomjnQIVT
         kih1jw+Up4rUkiE6Jb4ffVpBk1Aze9O8QZGEWLXRCseeWo3waoTkEr/tcwIscp4qE9AA
         DebxPQfama+9Q2N+1vdkgeOBG/tUdwf4liGA4DaN7cFGzi6/QlO5wDyTYxlZO9PmKhXG
         ufSo+yJH1oANb0Hmn463YZGKBoN+TdyVuzvpRwGXsAyodVUPCjwAMPmAvFmpe9iz3eoG
         2j3doMgnp4E2/IVzcBpD7qm+6Vl0IZQf408ys6ixj5mJ5uc0RADL7yolnbjem4SY4Ptv
         pa0g==
X-Forwarded-Encrypted: i=1; AJvYcCWPKt1dFL4fh0jTKSpwQ93jmDZfDJLvXKFPcDMhUPGVyG/DaC0MzgLOFQFJ6dAK82mfw/ZEMre2qVh2hKaY0hO/malTFXx0l2MDtFmeIQ==
X-Gm-Message-State: AOJu0Yz2WWg6VhmGhI+yx9KxDec8bXWHlziZuXIe4iVEI+9y1QGvoIkx
	n6+aNlddvRPuVbFXClk6v2FZ8Ze76tSfnf5+V2qgaaTmV+xwJt7Pv+oCJDczc38=
X-Google-Smtp-Source: AGHT+IGQhrCA7oaEer0EnKssqBNHP8nPjTY8DClZOkj17H08dlvsFVZWJmD7Knqiv1j8a/roLq4Clw==
X-Received: by 2002:a17:907:c087:b0:a72:5470:1d6a with SMTP id a640c23a62f3a-a7254701defmr182907266b.35.1719237794127;
        Mon, 24 Jun 2024 07:03:14 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c03:9198:7df:6a16:3e8e:ed7b? ([2a00:f41:c03:9198:7df:6a16:3e8e:ed7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7247b6ff48sm198263466b.1.2024.06.24.07.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:03:13 -0700 (PDT)
Message-ID: <89930ca0-e59b-4e95-ae44-bd83bcb08b73@linaro.org>
Date: Mon, 24 Jun 2024 16:03:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: add resets for sdhc_1
To: Caleb Connolly <caleb.connolly@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240624120849.2550621-2-caleb.connolly@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240624120849.2550621-2-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/24 14:08, Caleb Connolly wrote:
> These are documented and supported everywhere, but not described in DT.
> Add them.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

