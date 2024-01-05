Return-Path: <linux-arm-msm+bounces-6546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9569E825BDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 21:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E5B284F79
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 20:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA2021A0D;
	Fri,  5 Jan 2024 20:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="v3DSC5bU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5D208D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 20:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33674f60184so1762290f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 12:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1704487379; x=1705092179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWUYD0+rz2aiov/xLWapi9mOqqQZpnKEd3A0jej/9rc=;
        b=v3DSC5bUtSzb1KAI+/SvS7ZVS4xVvWgaTe2ojl3yDBG5mfOLaRvavkcCRXAcGBJ/ic
         ng3eJAtRO+ZGR15rGfHlblJGWp21hvUDTavzsG6aGp/rzfllcNCB85qdIo4wecC9a2Oy
         WGq7EOVszhoQcj/BRer5p0xeJeU5DIRCmYsShbP5EbabhK0AQg4ZtrtoN/QyFRrJYglz
         YXX0coNAVNzmExs/7UWDDPSXEmODqZNHKb3CLCWXUsaaO9tdKKFDTdLkBWOPodiulxpf
         ps9uyu1TohNI5Dh8ZiQIY77ycKX7Fe9Znn3oTza8WijeaYfZqcpDTFBI3SY+0WPnEY7C
         PF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704487379; x=1705092179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWUYD0+rz2aiov/xLWapi9mOqqQZpnKEd3A0jej/9rc=;
        b=adhLjo93bvOA8dJNlTFPgdpKZs4ghFMYDhO1GjCfyHr5S6fXjIvYSSAe3U58QIBv3n
         Hndv/986wXLZVUzZazNrSKsvh4HVqEWsa7SCo8BTlq1409Z/C8G2u95tq2UCrRESxMW1
         LUuaolXPcfo7Jbrn+HP6SNFQQgAG2kBX4toausC6RJYgfWh+Ev5VfB3X8p3wzlCUwbf2
         4xCED1cXhuq3n07cOLkpbsgzH5iOoFiMngh8x9JJLn59DIzwyxrduVlojWADza6fcBdX
         Ge55y5WixS/W/1jQoS2SVxdIR9iD9jeUcAb7tOThJ1+KBkKlHP+TyDhyYMkfD/M3VHO8
         bYuQ==
X-Gm-Message-State: AOJu0Yx95GA928TYTN8RtVIcAe+ve1PIRXwCLrxDiaLQtjWNpEO5UKyl
	7JVU4j9RQt1FIgXFn1SauEJb5OrH1v+Xfg==
X-Google-Smtp-Source: AGHT+IEGG0xE1de+XjBKFaSdmqM0NFDyksN9nTWagctfvhIj/Cdwfh2O91fuSyDJ5Gle4wDav74AKg==
X-Received: by 2002:a05:6000:111:b0:332:eaa7:56b0 with SMTP id o17-20020a056000011100b00332eaa756b0mr3670wrx.14.1704487378743;
        Fri, 05 Jan 2024 12:42:58 -0800 (PST)
Received: from [192.168.100.48] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id o15-20020adfca0f000000b0033666ec47b7sm2020937wrh.99.2024.01.05.12.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 12:42:58 -0800 (PST)
Message-ID: <6a66331f-4edf-4304-abf1-92d93ff28662@nexus-software.ie>
Date: Fri, 5 Jan 2024 20:42:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-0-7a57b8b07398@linaro.org>
 <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-2-7a57b8b07398@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240105-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v2-2-7a57b8b07398@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


media: dt-bindings: media: camss

doh !

I've just noticed my own typo, please ignore.

---
bod

