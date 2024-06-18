Return-Path: <linux-arm-msm+bounces-23010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C257F90CAE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 544811F234E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 12:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35241527AA;
	Tue, 18 Jun 2024 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KW1i0k9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43A6152527
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711771; cv=none; b=LxkGyeDyTs3sq13vyf7k2D/U1evdsNCuFCCPRo1bN8p6vSnjEzNXYyC2E94eswhtj5LonXpw39aru/+Yj7spJB1MrKbky/KTePRFQTCe9Pxcopv/G6VVYyPrSeao/8qI6Y6R4p2rsdFQe70kBuQXwsZS0GxXSAKo9FKVldVc358=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711771; c=relaxed/simple;
	bh=jpPEB/6YZTPYLy3RYj7LOJsKZCfOADwF3vloVsYeags=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAR0I9L4d8DlMYYeVZV3Fu/27kBxLlIYZ+LBIpGEcqwO+8veFJx5+eS3jF2wKaEkj7DTvplxe9sa+3OMsyvMmVugguvFBITv/GJPEbqAjZ4KRMXMYE/v/krI42fgwiMkaMswtLFS38IpEy4zZy0DsH26aRO0NG88XFlWjs2lbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KW1i0k9q; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5295eb47b48so6338341e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718711768; x=1719316568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mq75lZPvciVQwZ7mi6K5o2q0ASdayZBfX3qCcW8QAuE=;
        b=KW1i0k9qj0DskKaCd1uV1Dlm3Ignkxrap9uKQr1wHBUc6iiPcmYL4bQAjj1qoJJmk0
         c6F4rsmFO2rpCbPJimWUuw3b/2paE4eA1VjbNXnPDQtPl4UwRx8hltyorbVoKUQsJR0F
         F5N3l6JCZdON/lrLnQnFxr0O+AuQGi8nW6B9hLXQ6JGfv+hcEBf2OZMcsrJEc17WwShE
         VhQOy856Ii6Jj0/DukJJ1KLdp3cD2uqKrRQKt6tJwm9VfyxAihYjcScdd3RsBApNUT1Y
         kEjNdXJ7LfXm4prHCAVvJRbmRTzOuEaRYWPLFINadyXml5OMfkCXffUwg0hqUf08wYw+
         5Vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718711768; x=1719316568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mq75lZPvciVQwZ7mi6K5o2q0ASdayZBfX3qCcW8QAuE=;
        b=E2R7L3nLDyXE2AuYe/YtxauGdIkqUAsWMqnlspCnpY3Nu0jyOnQoss8P6UXkTjsB2q
         XTTGDjZNL/TKkUajNL6WT3SHCReirD1jiAuiHGIC4sa5qyaQeW+cDrSPNHo6yKGq2g0s
         hBbaKMBJqATW2Hp+PoBPzlKRqc/XD930R/iTXA++IxOsyRnPJWEdwoe6wjKobOaklc3X
         rP6T43kvWMbsBAWd9tYCt32VAshs+/7fglbA42WrodjV1cuPRbOR4WHq8AEKOP4UC+qA
         Btw7Y17CbpxwmihB7bqaU86BRh0jFXu5OJjxgxAAm7bpf1n8EZ168PhzZAyN/wPIP3+X
         ofuA==
X-Forwarded-Encrypted: i=1; AJvYcCW4hXvZBkmKJCX3uAmZdWdiFnzlCQXPXIShSd5/tvAH0oGH58vxNJ0D3Wjw5VpAaSRIKwgOUU3bn30Sw8qGB2iQPWvvu6bjXzvS6ZKqPg==
X-Gm-Message-State: AOJu0Yxw6+dGE6lMS7JXe6ROvkIsVtybxCH7H0xlXErV+6HS6Ti7m2/8
	rBy/d9LQSB+UnvvyaQmT+IEzVSBLNmIGznVp0OqCY8YovlBwdpngefUyLZ2RV4XbLJ+rzpt9d/5
	n
X-Google-Smtp-Source: AGHT+IEYh8t5Lf/IT2gzYEj9aUFut5HJwk0C+UH8HgqmpV5pG3oPCZTtmSV1TDxS2pKMtIogxvp+lQ==
X-Received: by 2002:a05:6512:3b93:b0:52c:8206:b986 with SMTP id 2adb3069b0e04-52cb621b577mr6055207e87.56.1718711767941;
        Tue, 18 Jun 2024 04:56:07 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28870f5sm1487968e87.249.2024.06.18.04.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:56:07 -0700 (PDT)
Message-ID: <c807a7c6-ac17-454d-9a99-1a221038774e@linaro.org>
Date: Tue, 18 Jun 2024 13:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: c630: Add Embedded Controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Nikita Travkin <nikita@trvn.ru>
References: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
 <20240614-yoga-ec-driver-v7-6-9f0b9b40ae76@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240614-yoga-ec-driver-v7-6-9f0b9b40ae76@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/14/24 01:43, Dmitry Baryshkov wrote:
> From: Bjorn Andersson <andersson@kernel.org>
> 
> The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
> and provides battery and adapter status, as well as altmode
> notifications for the second USB Type-C port.
> 
> Add a definition for the EC.
> 
> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

