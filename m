Return-Path: <linux-arm-msm+bounces-564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 997CE7E9BF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 13:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B23C1F20DD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 12:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B141D555;
	Mon, 13 Nov 2023 12:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V137ymsd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F88B1CAB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 12:14:06 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D23D75
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 04:14:05 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-53ed4688b9fso6524610a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 04:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699877644; x=1700482444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/UJmDVdnoLANWpqFiZdNnpekNTFbSDo/qAGP65DlXo=;
        b=V137ymsdrIZATOOUkhWeRT+V5JSDM5TPoWcwxceP51RkddWG//uV7xBZaoI8hPQhqN
         sqO7mowlY2cFrTsN560rUJkGJCljabo7Z7M8l+UP7MdMOyHv7MdeXrepHgQ32Dqngw62
         4WoRpTfibmdY3oIlIuyiMBAfXcRNoMXhg5G6te+hqkHSW70OC0idf8OVGz6J9zKIB7uL
         8q9SX+O7lLZnPnwnFx2HKTk49FfoWhLwsSOBGPSz2CTUa6Q7E2TlbnPr8aNoZ66zoyjA
         qo3rt1MsrCzSaUTUhwM3KIL5QU4j3Uf8iWQYdlHCfn83mMRgLFq56EkHWFjKxnHfbssl
         1AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699877644; x=1700482444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/UJmDVdnoLANWpqFiZdNnpekNTFbSDo/qAGP65DlXo=;
        b=VUX06uTUAMzC4/c1alBQXUakcE4yIZBOLlgM1Zig7D6Arkwy17nIXOg/capma9KeK5
         WtHM9Vgap1q0XlpbV67wj74On8FN1mdeW69jOm5hG2/Qh04GM+Vo5vVKk5hXlGVqaQoB
         htfGlCEQyxgh7ZVASjtCsGoBPVw5JbLwGgutSlPDjyn4shi+rmiCXeG/yDPeIwtQ8WXu
         t7AYLGPPvcs+3E/xqQHI0AS4Ky48xWDa3HCABX5zFRSOB/qh4d+LoWd4aLp5yJTqzz0z
         b0H8+uOavzX7P1GukM98WFpxXNgV5XALhobfi+V1ASiXY0nqtBCTyjmeCOBXb/2+rAUB
         nbzA==
X-Gm-Message-State: AOJu0YyhgyM2B8ViB6SiYvRqkx/NC99lOQbDMKz9h1urSaIwaTu0OoEs
	linwKx9tlQxzCABYmusjn/tFGQ==
X-Google-Smtp-Source: AGHT+IGefejHHu53Q7FhBC2+hRmh3O++HyIFaVSKSlmgKK/RzPs65SZXxkJssy21/KvXJKq0W10ZTg==
X-Received: by 2002:a17:906:fc07:b0:9c7:5db4:c943 with SMTP id ov7-20020a170906fc0700b009c75db4c943mr4651430ejb.40.1699877643837;
        Mon, 13 Nov 2023 04:14:03 -0800 (PST)
Received: from [192.168.201.100] (178235177064.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.64])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b009cd1fca4d68sm3929357ejb.5.2023.11.13.04.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:14:03 -0800 (PST)
Message-ID: <aaf2e314-e7e2-4338-833f-1d1412776390@linaro.org>
Date: Mon, 13 Nov 2023 13:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add definition for three LEDs.
Content-Language: en-US
To: quic_huliu@quicinc.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com,
 quic_uchheda@quicinc.com, kamalw@qti.qualcomm.com
References: <20231110-qcom_leds-v2-1-3cad1fbbc65a@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231110-qcom_leds-v2-1-3cad1fbbc65a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2023 03:06, Hui Liu via B4 Relay wrote:
> From: Hui Liu <quic_huliu@quicinc.com>
> 
> Add definition for three LEDs to make sure they can
> be enabled base on QCOM LPG LED driver.
> 
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v2:
> - Rephrased commit text and updated the nodes to board file.
The title should still include it, so:

arm64: dts: qcom: sc7280-idp: Add ...

Konrad

