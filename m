Return-Path: <linux-arm-msm+bounces-23005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFC90CABF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56DF1F225F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0932139D2;
	Tue, 18 Jun 2024 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jb1bX24K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFEDFC0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711388; cv=none; b=M3MvL3gXaMil+nZpkry87hPNyyPeoLuANWkpA8nmZlDamMLCbXZA4C3MeRNUgtTxHf0pvdTPjKhh5d7/m1oStTjgTPNh7TDfNcU3ENO7txmDGcEZ+HGVPcrT74VPEfHGJlmoUc0Upeosq3Kh1ecvIsAnz7dtPe9XbT7Z1Xzg9fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711388; c=relaxed/simple;
	bh=2hIo05tCUTPAFIRPPe6FAtdYmihwk6dkPz/hXvGOkPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHSIRZmHZUOgc/6ceVkhr+SOvNEC7fz3tReaFWcX2PgQe0XCAMWCsn0xIidk0/cuEqAHxIORzCnhUOZXMId4G+OjP6ZYLm3Ef+3BdAgaI1mnJmp+7dLCNhy4q4UY3Via2W/yQrEPeS1prEDXUPT5sDF/rdbqjUQbjcN3TnMQUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jb1bX24K; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57c68c3f8adso6493444a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718711385; x=1719316185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKiWUiO1H/ACz4Ax5OKPh9Z7evBNHdBNqnuTlAaiBA8=;
        b=jb1bX24KacQ+ZcgP19Ly1YAY2FNYEJSA6mpa+5Nt+9p0laeVI7GOnIbmXK0HhYHx/1
         0wQGffp8lQW1y76bikgofHuw4onAABzt3bTdQ/lAHlqxNA6qUFHZDy5H1pNmL/52cngA
         2xdJcJDEfdyBv/GswBYQJw8SQxyb6OTwuJpkp7xXiJxkPj0UD4JrPAIHUIwf9LeKw+PN
         np+fNTBuUd49/OUSK84T0g7S3BuiR6MFGK+iC89V0TLR7/Ji5EE+Gjx39ZuH/OBsPbTX
         IpV4GGralxJ3H6QaKiLugAlVrgNBJ6h2EwawUAskoElIM1m8Nz+8CHEFlZYjfo53XDb9
         0e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718711385; x=1719316185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKiWUiO1H/ACz4Ax5OKPh9Z7evBNHdBNqnuTlAaiBA8=;
        b=XAFxw9W/7KSZPy+K/XssYwhfJL03NG21fSdG1J8KHzc3sbgs2I9Meyjojc0KaNeu1s
         ff5oH82+SU671S1YO+8KmZG4JLJEl/IA8mI7SEqGAIKOXofMR4hmZRpZ00etSFzLmX3m
         RTV3yjg2EK2WDCv86JajuuXbgJx1dUM8nnu0jdGDXVbVUFQ+/v5x3UIrqtmcMhieQ3WU
         mTkfTeQMDhaaMWbiBc+xMuyQuMh0bxd35IwYwfkqsxs5czJrSCKFull+QIb5FPu9G/CP
         XOC4GOU3+HFnnPtLh/VOjPFm8gk7FjRf5oWEngFb9k8lCFS6xXq7NgDyHC0YjVoh1lF/
         Echg==
X-Gm-Message-State: AOJu0YwLVjGA4u0K7A4IARIBwld9CU+XeCKX4oI67rThE/INJsfIEz1E
	5qudZaDf2EwkinsJwK97hQcK+oEXQWvbX/92fqD1Ps0Mesh/+ojcdMhE0241ydg=
X-Google-Smtp-Source: AGHT+IFcJAnLDP0RCcx8fANvtIZTqrzyrZMXPlLyqSV5EPVm4qM43BQNRnz6ZYrtuyp8gP218NPPig==
X-Received: by 2002:a05:6402:2293:b0:57c:c125:d638 with SMTP id 4fb4d7f45d1cf-57cc125dc2fmr8952918a12.39.1718711385488;
        Tue, 18 Jun 2024 04:49:45 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57cb743890dsm7659259a12.83.2024.06.18.04.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:49:44 -0700 (PDT)
Message-ID: <ad6f4838-78f9-4b1c-b0e9-850458194ce8@linaro.org>
Date: Tue, 18 Jun 2024 12:49:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
 <20240612-sm4250-lpi-v1-1-f19c33e1cc6e@linaro.org>
 <e10eda85-68cf-4f66-ba34-3e746d286fa2@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <e10eda85-68cf-4f66-ba34-3e746d286fa2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 08:15, Krzysztof Kozlowski wrote:
> On 12/06/2024 13:55, Srinivas Kandagatla wrote:
>> +
>> +description:
>> +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
>> +  (LPASS) Low Power Island (LPI) of Qualcomm SM4250 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm4250-lpass-lpi-pinctrl
>> +
>> +  reg:
>> +    maxItems: 2
> 
> Nothing changed.

Looks like I messed up something here, Will send out v3 with this fixed.

--srini
> 
> Best regards,
> Krzysztof
> 

