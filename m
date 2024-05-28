Return-Path: <linux-arm-msm+bounces-20740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7AB8D1AF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376A11F21BB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0D916D9B2;
	Tue, 28 May 2024 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCzZOBUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1749B16D4FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898780; cv=none; b=f0/kMf0DO5UznoK3CfoB7T/6XRR5RBoRCuv1/AEOxvLH4LkDw2SzrTgrcpcu/OOgBdl1PnqVB0Gr9aemVksAhZvypxFGU1ZwlFV/aModUylQdt4Y4briQyxpwLxMqZmEGB0jvq/ZiU4XsaiElvGoxdc04F/20ELwiQTa1kemm7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898780; c=relaxed/simple;
	bh=2I4Qx4+DWic0UT3mZtzbY5yRspiHN1TfRVJkozbFlvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOOt32IwkMIugI+AijBT+NzFVDHIk4B1QfNz9wMixkqF2TOo3isIYy/TDYz3FHgBfnUAxIHoQFsDEBF66OUJzDlQDSX+noqVsJhG5nikyqqNh9UVLJepIFJfkFEYNRaes36BOBg7c0vX78sMVJ64+0056aIS2FozpaUY4QLMXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCzZOBUA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-529b79609cbso1315423e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716898777; x=1717503577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hju/dzcDGwp1N89SfT9zfOLpGA1kJ/+7Gbdzfhg30W0=;
        b=zCzZOBUA+UYnclBJGlPDFgbJXInaVrmrOFTZ/olwt53Ns83LzAMsTot59awD06IsJO
         C6eTx3BxQ4Mymxg7ZB/GtTXWZjdofeFsc3COipuIlhA4tUm7qSKMksfgid20Oykj6m9F
         XDoOnQb7URc1H5oJ66q4bZTdgEzMThq8IHUsFCDa/sdl0pYvprquYBLIIjrVWpae3zud
         D7WrFGRk0B/gXQzlWU0N21y/eQ9K5RMBBPDv4JyioCiT3bst8ks/AaTXpdRADaKXVuyz
         agSwnlDRk1iiaQbA3MsLZt9d2JtZxG43avxeQhDczk+i1/ZLBTrinnOkiF8mdJkOPFvg
         lvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716898777; x=1717503577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hju/dzcDGwp1N89SfT9zfOLpGA1kJ/+7Gbdzfhg30W0=;
        b=t6rZIhpve3CD7si1yn81ZGKuvaPYYfbWfVZG8DE+8qAWOFbPyUCs9ib0ALNZTT4P8P
         lNH4+HBL05G/VaZ5ggC54IeCKdFY3eeUBmDxBUHQbjIB7R11UH9BtF2I2Z4dwiN+uwcK
         Rj/84RxwYc702plYCf6Ps55xaqOvGCVqofIHaeorkJwQtPq/VEXAyBGoarJF6+lIGT/w
         6IaEn9eU2I09Ozhrn24MKd9CTZifnxO/Ow7FAtLMJ1NhFho2WeMztW2P5RNlFxAYwDbL
         L9jQER5Gq1tQUm2rZ+AllC7uCI5bKN+FlUWydOmxVa/PYENjCJvyfeyW7oe6H2HXF6ec
         FQyA==
X-Forwarded-Encrypted: i=1; AJvYcCXUcJi/gwBM2fcxhCiFCLqFf01GfuDGgMAeIYbFlYVcnPSymKyaIqgIw9njMD122iP0MZgdDkNkQ2xT6AS2s1kFtRGYQLjry61FTZpi1g==
X-Gm-Message-State: AOJu0YyhI+R6TLuYJCC0V3AQJAfBEoZQkYZuCR5CRaNxGFPb3JTnmZs/
	Um2jrstkZrpKnoM+YA7i7KBBYB5t12jnP0+4KAQH1OSiX3gcEoPFW6cDV7TGwJU=
X-Google-Smtp-Source: AGHT+IHb1zZQ0sL2m4mtu8iyp037bOz4p0I+XuGUCtiG8LAL7GAHOoS34U8irKyS9Nn44UCM5bAh2Q==
X-Received: by 2002:a05:6512:6c9:b0:520:9775:5d4b with SMTP id 2adb3069b0e04-529641099a8mr10692697e87.13.1716898777293;
        Tue, 28 May 2024 05:19:37 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c32e26sm941501e87.184.2024.05.28.05.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:19:36 -0700 (PDT)
Message-ID: <9d26e798-739c-4128-8d34-79725f1b058d@linaro.org>
Date: Tue, 28 May 2024 14:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm450: add Lenovo Smart Tab M10
 DTS
To: Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20240523-topic-sdm450-upstream-tbx605f-v1-0-e52b89133226@linaro.org>
 <20240523-topic-sdm450-upstream-tbx605f-v1-3-e52b89133226@linaro.org>
 <r243r56bz7nrp2guaqj2n26exdv6y5jyjtoytmceutd3cqbaao@r5xk3qlspwsi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <r243r56bz7nrp2guaqj2n26exdv6y5jyjtoytmceutd3cqbaao@r5xk3qlspwsi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/27/24 18:33, Bjorn Andersson wrote:
> On Thu, May 23, 2024 at 09:59:35AM GMT, Neil Armstrong wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts b/arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts
> [..]
>> +&rpm_requests {
>> +	regulators {
>> +		compatible = "qcom,rpm-pm8953-regulators";
> [..]
>> +		pm8953_l8: l8 {
>> +			regulator-min-microvolt = <2900000>;
>> +			regulator-max-microvolt = <2900000>;
>> +		};
> [..]
>> +		pm8953_l11: l11 {
>> +			regulator-min-microvolt = <3300000>;
>> +			regulator-max-microvolt = <3300000>;
>> +		};
> [..]
>> +	};
>> +};
>> +
>> +&sdhc_1 {
>> +	vmmc-supply = <&pm8953_l8>;
> 
> JFYI. Not ensuring that the vmmc-supply is in HPM mode bitten us
> multiple times in the past.

it's not rpmh ;)

Konrad

