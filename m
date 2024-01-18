Return-Path: <linux-arm-msm+bounces-7557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D6831AE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 14:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 940B2B25261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 13:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C6325613;
	Thu, 18 Jan 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMO8vjFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B0F25605
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705586098; cv=none; b=Y1nZxyjIwqKQubgWEiiu5VHQFsetcCL9WDhJNGwNFvt2JIYXA4srV2z0FHabKcgRKIeLwcBut8jG92/549rqo6iMoMkKvRt+UGR7r2bjlHGWZHRZ8f2zhPaThAdU/08AO+f/rtPN5JhlWtePn6cfCeGco92kHholRj/p+IAvan0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705586098; c=relaxed/simple;
	bh=ps1E8PJMTt8mzlLH9eECx/CQbcZhGFU/1wZdq7L4X7U=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=XXNCddmkeQmXe0KgMAp2+kbdIE6NUMtF9Mh4OBT9bUCGz2frSfVwZraPpvHs9/L1TWBEvMHKS3//XLp6lk+EzN+YvOpBXhPjYKRMgVeUww1/OiXiXHlBKDslGbEqpffkknO1nXGisc3uFfd2qs48BMtZGbo/kNly/Hh5gZpLRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMO8vjFW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso14228071e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705586095; x=1706190895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ps1E8PJMTt8mzlLH9eECx/CQbcZhGFU/1wZdq7L4X7U=;
        b=eMO8vjFWQ3mLQEcF9OVRKUcV8xq494PRj7nXY1uEX18N2uT+1U++WnIF31AH5f9QYV
         M5+vJvnPlhu3Vt6Y/cc35q6yCz5RWvXlB/MPB5GRu9RflYkXahandtDYfT3ED7cUroRb
         B0bIjyNmqjdE+4Iu9UkuSh1SCwmbyaV7pdzxBUfPB7wef/qmYDHHn+qPPDhH/HcoFxVo
         NbZgi7KzWgwMO0qTknkSaSKV4TnQKqlw+a8BcpsQIxjLQIb2tIAqm1ljFpB0wsM8sjSW
         5qZRjvQWX14VRxqgTR/zNV2x7V8UgOQ20NVKnAMFumItnNwSnd75igwmURnSDFbYT50I
         rbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705586095; x=1706190895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ps1E8PJMTt8mzlLH9eECx/CQbcZhGFU/1wZdq7L4X7U=;
        b=uYYu+0xqEEAnGVmD+rP4bhaa3UKn2R1mWPYFaPbnUvC7SzY6ll8+t8jOFvs6eB5/a8
         m2/dT3Qz4Jb6X6/fTHUpN8GaDduYMqeUZfQ4usV+8GEInLClNBaIsO5cVkwUZvn3KUyW
         5kpnLR8RWu7dAaVgMR/YBreE9heWO+ODFn386qobxhvrfBezEb036jpfatKfg6yGGPhf
         +LdIN3aL1rgz8i8s+3EcOlZ6qTlQb8P022cwMDd/h2WLFqZ5UPm6n2pflE1dSusTZcOK
         CB/626B/39I6mOgmByYw+vVNvs6mQubKNd4ERwB3he34ILrrJNYzaNJMHJsxTEktcBkv
         1sCQ==
X-Gm-Message-State: AOJu0YzhwolqjOXlhd+TY4Ae6Cc0+E+/6S05lZurv7GkL/VIfx5yAAeA
	hV1sBBVYGFY2qO+hb+9ICbilxSjfSRDrbqDpAYpbwfpKGYu4pfeXapHYoAmmt2E=
X-Google-Smtp-Source: AGHT+IG81baX14qnfLZc7lP1lCoEd/MVMqnvyBVS2danUVivMYbgvenMBVknrh3McJP0uFBgXyCTSg==
X-Received: by 2002:a05:6512:3c92:b0:50e:78f3:dbed with SMTP id h18-20020a0565123c9200b0050e78f3dbedmr612042lfv.91.1705586095296;
        Thu, 18 Jan 2024 05:54:55 -0800 (PST)
Received: from [172.30.204.173] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x7-20020ac24887000000b0050eab7d397bsm637771lfc.256.2024.01.18.05.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 05:54:54 -0800 (PST)
Message-ID: <e28dc651-a573-4c73-b030-19dd69c48493@linaro.org>
Date: Thu, 18 Jan 2024 14:54:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related
 blocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org>
 <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
 <20240117220153.GA649327@hu-bjorande-lv.qualcomm.com>
 <9a24a065-b649-4431-b8fb-78c733c07671@linaro.org>
 <CAA8EJppEFSy2=GKgkqC3uS15cO51KfxDrHtxHhAnA10kScYKhQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppEFSy2=GKgkqC3uS15cO51KfxDrHtxHhAnA10kScYKhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/18/24 14:38, Dmitry Baryshkov wrote:
> On Thu, 18 Jan 2024 at 13:17, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 1/17/24 23:01, Bjorn Andersson wrote:
>>> On Mon, Jan 15, 2024 at 11:00:53AM +0100, Konrad Dybcio wrote:
>>>> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
>>>>> Define VBUS regulator and the Type-C handling block as present on the
>>>>> Quacomm PMI632 PMIC.
>>>>>
>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---

[...]

> Is there an ack?

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

