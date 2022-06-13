Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3367E549CC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347181AbiFMTEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jun 2022 15:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348789AbiFMTDu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jun 2022 15:03:50 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AC9106354;
        Mon, 13 Jun 2022 09:49:26 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id f9so5605352plg.0;
        Mon, 13 Jun 2022 09:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c0HeuJ98I3Y5QZXsYDJume8HkCACCCfAbeGSkszGHn8=;
        b=NUH+Vt/6Cn5kViDjiu3uNhVu3Z9a4hDpEjVwnCuRGiiIDE0H6LIT0uPzEE2Pv7OqOV
         vYwk/zjRFYUlaheRj1Wr6Ux4IRmrgjvOLX6j042QB9k5My0pZmLLFldevEliU6ApVEfT
         9I7mzQGZc+BGj2xJp9PkFD6iJtN1wFJ9p7hBhNV3GoZKUuiC6+bKFnQgxaFrPcVraPya
         5tnlFPsSqU/s1yVzNoo9ROwN0o7s61r79zrq3ojpapxtuLMQB9noVds5iCDIc0SLzOQx
         B8px/I6/8jCCoCrfJDxqxNi81IYbuqv+NJhq5Xla1mTEff30ylJMhQbLZLfh/qWxEllc
         kgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c0HeuJ98I3Y5QZXsYDJume8HkCACCCfAbeGSkszGHn8=;
        b=4Wpr8D+jR0/YsJ7dje304xX/TKCiLZvlj6XfKmRd4yIaww+HoGXL4PoubI5BaXAsv9
         AwWTg3D5nKMcYhNfEdWfDfhEgf5ypgyGWJ7i8nEv5+Bh1poj60tk6IedvjyazShhNifk
         MOBtU1BeMorRqLdVSJ4y2gQ3yUR7AFdgMh2mV/5cd5toTtKa6qt/F54VpvJKHYIjfNxv
         RcCg1txakO/fZToWgWNv+0+Lk4eeFOKVwSQT+9zmp4kJJ73+gebBIu8yPJzXFlDg5PmY
         byiKhDhKS5zmGenNvz0Kpj/d3e54yfvyZZKptELINEmBfEiYu8ouSXL43uSMI4+rPikN
         yy1w==
X-Gm-Message-State: AOAM532NsqarsJL4iy8XzqNNRUDsszeNEAGuG38ccuPCDI0CrvOtQ+VO
        Nf4sM9UdwTpK6azhsM6/G7s=
X-Google-Smtp-Source: ABdhPJwH4a0siFP6S/uPa9BISixIKS7A/QejNs/Kv5WE7if7/eH6MSMvtrDL0KlklM7LmjhUfmG+LQ==
X-Received: by 2002:a17:90b:1bc1:b0:1e6:9a00:5d63 with SMTP id oa1-20020a17090b1bc100b001e69a005d63mr16469024pjb.154.1655138966172;
        Mon, 13 Jun 2022 09:49:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id ij25-20020a170902ab5900b0015e8d4eb1f7sm5334774plb.65.2022.06.13.09.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 09:49:25 -0700 (PDT)
Message-ID: <def298b1-efcc-8c34-52e2-b33c74e3a129@gmail.com>
Date:   Mon, 13 Jun 2022 09:49:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] arm64: dts: broadcom: Add missing space around status
 property
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
 <20220612223201.2740248-2-niklas.soderlund+renesas@ragnatech.se>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220612223201.2740248-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/12/22 15:31, Niklas Söderlund wrote:
> Add the missing space around the status property before the typo spreads
> to other files.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Already carrying an identical patch that should land in v4.20:

https://github.com/Broadcom/stblinux/commit/b65b9477d9118e3cd359245f59af556597bc5b71
-- 
Florian
