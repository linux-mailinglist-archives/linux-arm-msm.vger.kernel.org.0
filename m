Return-Path: <linux-arm-msm+bounces-1175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8C7F1596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFBE2825D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862EF1C6B2;
	Mon, 20 Nov 2023 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="geChQ2qN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FACC10C
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 06:22:13 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so6431609a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 06:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700490132; x=1701094932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZQIuPK229h/rgcRWK4xDP2y2LX7BP7lfAx4sG2QoMQ=;
        b=geChQ2qNL0kQc7J2zvWkk3mcpXnnaMIRr0duooFTzRugGMMzYGemmxTz1rCP4NXfSZ
         /9m/Kc5rRm/pngb3lBzXE1uCpOs9eYDCZ0pJ3Kcp4FgRZ2oDoY3XKbjSeQMqvz5RdIPQ
         evBf2KE3b3WEuqnUVLGNKGH6vGNyvo7r5xmrStVsKixREJsV4a9JPGAE4YENwd614io3
         JkBDA4JztPd0rp5I2W7yhrid1VQZlbh/DV2Wez7clfY1hIQxrGhaiBlgp5XuvZeaFbiW
         VQQtCvNa0YPu5M34bJhHm2Pvjwy5Xz4WKyo+3oySs1SOs1MkJHIM5Ol8W5wkRz3Z9n+L
         O6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700490132; x=1701094932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZQIuPK229h/rgcRWK4xDP2y2LX7BP7lfAx4sG2QoMQ=;
        b=NxwiaqfO/3zB+H7JoHiX3fm5yCRal0vvnFevB9N6DgfbtOdzCvQcU8IVZp1wOW5R/H
         fQ7TYdsCu/TBMQnbVoOF30eFIUyUcEv0b61CG+/qdvCsPhU1/ohZUYVKWhtMSbazIeep
         Wa353x9ge24VqVaJs10bPoFFUmMLQynT6LK9shQV10c9CIJxpkei1MRxrb/9jHeNPZ/v
         nlm+6Y++1qZGO9r++F1o3/JsMCgnkmsdEg4qRD9rMzkPOXMG76Yjjb3KnPQbvOOILAE4
         YPKrwIflilGVwYYsFvTL1kn2Qm6PVRGAtxuHp6DvurrCCsQ9X58bOhRZAZq5RCEWuKqI
         /76g==
X-Gm-Message-State: AOJu0Yw1B+lKenmJHrpml4l3qqc7kvHD+1g+jyehK0l7ANwua9vipjm1
	w79yWcQZrwANsdRUHpBMSeVtbw==
X-Google-Smtp-Source: AGHT+IE/63QjYOZe7XTDmHiKSmQP0pwu5jCqTNBHPW13CP9eV453g3SUyQgky9XTo4Zw3wJWDDkz+Q==
X-Received: by 2002:a17:906:4a50:b0:9c2:a072:78bf with SMTP id a16-20020a1709064a5000b009c2a07278bfmr5527291ejv.26.1700490131960;
        Mon, 20 Nov 2023 06:22:11 -0800 (PST)
Received: from [192.168.201.100] (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
        by smtp.gmail.com with ESMTPSA id lx23-20020a170906af1700b009b65a834dd6sm3897400ejb.215.2023.11.20.06.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 06:22:11 -0800 (PST)
Message-ID: <10dc0fff-fc00-4c1f-97cf-30c5e5e8f983@linaro.org>
Date: Mon, 20 Nov 2023 15:22:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] net: mdio: ipq4019: Enable the clocks for ipq5332
 platform
Content-Language: en-US
To: Luo Jie <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, robert.marko@sartura.hr
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-3-quic_luoj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231115032515.4249-3-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2023 04:25, Luo Jie wrote:
> For the platform ipq5332, the related GCC clocks need to be enabled
> to make the GPIO reset of the MDIO slave devices taking effect.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
[...]

>  static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
> @@ -212,6 +231,38 @@ static int ipq_mdio_reset(struct mii_bus *bus)
>  	u32 val;
>  	int ret;
>  
> +	/* For the platform ipq5332, there are two uniphy available to connect the
> +	 * ethernet devices, the uniphy gcc clock should be enabled for resetting
> +	 * the connected device such as qca8386 switch or qca8081 PHY effectively.
> +	 */
> +	if (of_device_is_compatible(bus->parent->of_node, "qcom,ipq5332-mdio")) {
Would that not also be taken care of in the phy driver?

Konrad

