Return-Path: <linux-arm-msm+bounces-16296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B168589721C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 16:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E22431C267B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78784148FFA;
	Wed,  3 Apr 2024 14:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1PQPBYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E228148844
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153680; cv=none; b=W0fcOWPsXn+rwW9Vt6luvRA0D2OgDGgGnhqNoZEmgX3qaBCyoZB3RfXvsX3/VlS0RAzFQanXG1MudCWSP/7sb8iYFR8txCCxjuvQy6ffmb/N3r29hAMAl5MWPD0Qog9GeGgmic1sAzXfBeb/oIE+dIV3E6BtGbX3pfz1x6zNKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153680; c=relaxed/simple;
	bh=yFQ/73CHtIlKV4Th3NQec3vXNx3muoB89KcS1YFZkxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiPcrCyDeprvqt6tmyhdulFFx8JEaB8GwLIVTkkRjH/8fwU8JgR69B0suan5GqJMfNq4sy+Da+2sxHTZkNlPQgskp7J9O95qLM18/k7SRNFXAY5+/Iy6v5YX9yWo2m1G4mFFv1Nv2epPD8fUjwDEsCuxF+tprV4rACHDLLFdXDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1PQPBYi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a517a492055so36725366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153677; x=1712758477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=itLVcMAjM/xZ1kzXtOM5jegS6dKQweXkZordtxn3pCw=;
        b=l1PQPBYifyl6bDqWTtRGqeTf6Q9UoDhFas9dP7k7kc/OP354CKM9CRrNkFEZHJZ5Kh
         SqtM2MWVKQnp0g8iXCPZEWS+PoFvUwCANJM7TuO2f9LbdNeJ2WMYL6lxHVIecZN/BqW0
         Svatl7uTW6An7dpYGXG7SzBhBNVDJaAjonrjURCX4fVhpMVEclnX29leMjVdWj7xIPeA
         OMzBifx7cl0DjpawOCjX9KdxH9qfGfkRgOJRzOkF94l+VDkJFoG/+lkNwFwXabAmZwcD
         aQrb91GHPGhlBv9+zGqqlBucVov8QclpANsfR+cnZ9nhkVTTxSKV6boY6IicGov7QYmv
         MenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153677; x=1712758477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itLVcMAjM/xZ1kzXtOM5jegS6dKQweXkZordtxn3pCw=;
        b=xBqz+E0U0DWW08Iza5mGEiuDf0FWFZoYoymEAC/aw2vuZROYCPCbAWTWixI77rdAK/
         aL65IRf9DfyMYukNyYSeEgc9NDaMuqUWiYbbb0ChMsGUIvVCnhDxX3wRttFlNVZhmBs0
         Jnlyi5Xoq5SSH2YlvugCIUual38kTUZS6of+TkAA5YfRG4Hfu6rcY0guYn0ird7dFZQI
         TkXfxOlVoaqtGRr8qd32lmS85nDUCSasAH13PGAza9Dr0MIp/rex3Ldg2eZXOiyI92p5
         ObtPlDYjhqXI6oNiyZcxQW8T9tusywVIUMJfg32WuGeDVYSdsIktQ0HytIie5NFa/FaI
         8/sA==
X-Forwarded-Encrypted: i=1; AJvYcCVrZztkzgKaekKqzXaRcRycLKJLnE8ysZcoa12PeoSy4Pjrh7PWfTKLuTETQANWbIvy5445koBcENLxAJ/T/xbQRSgQ05yxNRJlIcjDxg==
X-Gm-Message-State: AOJu0Yz5Zo5udVaeWmQQDoSCVXMxQCuLi33otgeKhqykddhlB2aI9XTk
	m3Vp8TWGwR5IYDZ8xDzYXuWjDOfsiVSmx7tJDgjN1G6e0f93YirG2/O6RtFijzA=
X-Google-Smtp-Source: AGHT+IEPOlSElYIlsgY6zf89tnxZEn7W1Hkcl8No8TILHS406Gz2Hped1gwROT1lK6ex3yXmwRwI1w==
X-Received: by 2002:a17:906:4897:b0:a51:7a18:b6d3 with SMTP id v23-20020a170906489700b00a517a18b6d3mr530077ejq.47.1712153676892;
        Wed, 03 Apr 2024 07:14:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id xf6-20020a17090731c600b00a4e56e4e051sm4908460ejb.94.2024.04.03.07.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 07:14:36 -0700 (PDT)
Message-ID: <e9cee191-0f9b-47a7-a08e-0100124d4935@linaro.org>
Date: Wed, 3 Apr 2024 16:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <91031ed0-104a-4752-8b1e-0dbe15ebf201@freebox.fr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <91031ed0-104a-4752-8b1e-0dbe15ebf201@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2024 15:05, Marc Gonzalez wrote:
> On 02/04/2024 17:55, Dmitry Baryshkov wrote:
> 
>> On Tue, 2 Apr 2024 at 18:31, Marc Gonzalez wrote:
>>
>>> So, if I understand correctly, I take this to mean that I should:
>>>
>>> 1) DELETE the qcom,no-msa-ready-indicator boolean property,
>>> 2) ADD a "qcom,msm8998-wifi" (name OK?) compatible,
>>
>> I'd say, this is not correct. There is no "msm8998-wifi".
> 
> Can you explain what you mean by:
> 'There is no "msm8998-wifi".' ?
> 
> Do you mean that: this compatible string does not exist?
> (I am proposing that it be created.)
> 
> Or do you mean that: "msm8998-wifi" is a bad name?

msm8998 SoC does not have WiFi.


> 
> 
> I meant to mimic these strings for various sub-blocks:
> 
> arch/arm64/boot/dts/qcom/msm8998.dtsi:          compatible = "qcom,msm8998-rpm-proc", "qcom,rpm-proc";
> arch/arm64/boot/dts/qcom/msm8998.dtsi:                                  compatible = "qcom,msm8998-rpmpd";

These are all parts of SoC. What you are adding is not part of original
SoC, I think.


Best regards,
Krzysztof


