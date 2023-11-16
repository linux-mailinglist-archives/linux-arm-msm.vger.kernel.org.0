Return-Path: <linux-arm-msm+bounces-800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E07EE03C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1643CB20CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C56AC147;
	Thu, 16 Nov 2023 11:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzBAC1OX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AE0C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 03:57:20 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-66d0760cd20so5811626d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 03:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700135839; x=1700740639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=krk4VBYuGi0GRPy3jr9qgf+JsOMGZYRly2u1txqNaOs=;
        b=NzBAC1OXNlUjSNbO+kZVwJXIVxTsaQjBhBadCIP10wQpb15JY6KRRfrqpZ9dFGi+Qj
         RmIKrIYTvl0XycilgJY7u7GKayxbDxuJ3sKGQJj4gClFDOBzhRQMCUQNPFhQFxGEYwCg
         Zluqf7wk7S4Ti9hxSJ/GSLGVX2uSMFkNJrC3ooaU8QdEnO9uic3b4tgshDzPzWnRr+mG
         BYiwPBOdVZXHcH8ntmS/OqlgO8kfrRbkT104M62+mcyOJpyJj/32hGnFC9qrRLL5uvCg
         bMkI93JFLyu3WYLbGFWsklOqJtqQ7Fja2T68bNHEgfL5kDzhdNtNl1ioN+tN3WwKSf5b
         oBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135839; x=1700740639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krk4VBYuGi0GRPy3jr9qgf+JsOMGZYRly2u1txqNaOs=;
        b=XJuj5vxvS9ommlGFd7ARTl6ixIk0eYms9B50PVAUQtDgz7gYBRUlgTIDJMNMrU2H3p
         f3MnKdlVVrMGJOXHN1lzrZi7uAPK25VFHSBiw3pnsD/kJYSd+Pze8yNvsvTzY3R7Ca32
         u4kORZNf4gO/TxXQZgESysU/MtrKP9KatpFHOP/lppsOpQCuZs2WD/S3P/m4p6rwjb7K
         xLix6XXjWHTpszYeTc/iAnHU7BXe5qkdzx6Hv/y1EUcwQEsF0Zcj8BBoR/7INexJZ0Cl
         xLN/Bvl5NEQygknE0hRTwDDxAYZvKuxMPUFC5J1/1PntLhRDOpXtk4/AZ0WOXUabSNFh
         BXXg==
X-Gm-Message-State: AOJu0Yy96FU2LNIzmOYAy3Rv69QuCbxKDTf7It7LMqZq2FtZ2yYlSfXE
	t1OHtFqm3WktqcLBT1QOYWfXrw==
X-Google-Smtp-Source: AGHT+IFU9LBKvJxlcV3mqN0WuU20u/5D5JH6PPclyR4BBA180Ey+p7XrU5hEyiqU+4an3rs0N3nRaw==
X-Received: by 2002:a05:6214:ca4:b0:66d:5cfe:82a6 with SMTP id s4-20020a0562140ca400b0066d5cfe82a6mr2074829qvs.27.1700135839405;
        Thu, 16 Nov 2023 03:57:19 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4408f000000b00670867d7bdfsm1315936qvp.122.2023.11.16.03.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:57:19 -0800 (PST)
Message-ID: <7786f8e0-2395-4bb6-bc29-071ed637611f@linaro.org>
Date: Thu, 16 Nov 2023 12:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] net: mdio: ipq4019: increase eth_ldo_rdy for ipq5332
 platform
Content-Language: en-US
To: Luo Jie <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, robert.marko@sartura.hr
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-2-quic_luoj@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231115032515.4249-2-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2023 04:25, Luo Jie wrote:
> There are two PCS(UNIPHY) supported in SOC side on ipq5332,
> and three PCS(UNIPHY) supported on ipq9574.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/net/mdio/mdio-ipq4019.c | 55 +++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
> index abd8b508ec16..9d444f5f7efb 100644
> --- a/drivers/net/mdio/mdio-ipq4019.c
> +++ b/drivers/net/mdio/mdio-ipq4019.c
> @@ -18,28 +18,31 @@
>  #define MDIO_DATA_WRITE_REG			0x48
>  #define MDIO_DATA_READ_REG			0x4c
>  #define MDIO_CMD_REG				0x50
> -#define MDIO_CMD_ACCESS_BUSY		BIT(16)
> -#define MDIO_CMD_ACCESS_START		BIT(8)
> -#define MDIO_CMD_ACCESS_CODE_READ	0
> -#define MDIO_CMD_ACCESS_CODE_WRITE	1
> -#define MDIO_CMD_ACCESS_CODE_C45_ADDR	0
> -#define MDIO_CMD_ACCESS_CODE_C45_WRITE	1
> -#define MDIO_CMD_ACCESS_CODE_C45_READ	2
> +#define MDIO_CMD_ACCESS_BUSY			BIT(16)
> +#define MDIO_CMD_ACCESS_START			BIT(8)
> +#define MDIO_CMD_ACCESS_CODE_READ		0
> +#define MDIO_CMD_ACCESS_CODE_WRITE		1
> +#define MDIO_CMD_ACCESS_CODE_C45_ADDR		0
> +#define MDIO_CMD_ACCESS_CODE_C45_WRITE		1
> +#define MDIO_CMD_ACCESS_CODE_C45_READ		2

Where is anything related to ipq5332 here?


..

>  	bus->name = "ipq4019_mdio";
>  	bus->read = ipq4019_mdio_read_c22;
> @@ -288,6 +296,7 @@ static void ipq4019_mdio_remove(struct platform_device *pdev)
>  static const struct of_device_id ipq4019_mdio_dt_ids[] = {
>  	{ .compatible = "qcom,ipq4019-mdio" },
>  	{ .compatible = "qcom,ipq5018-mdio" },
> +	{ .compatible = "qcom,ipq5332-mdio" },

How user comes before binding?

Best regards,
Krzysztof


