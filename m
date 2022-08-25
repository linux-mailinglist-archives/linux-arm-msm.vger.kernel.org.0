Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9275A1C65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 00:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244469AbiHYWb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 18:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244439AbiHYWb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 18:31:27 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678ECB8A5F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 15:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1661466685; x=1693002685;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=pXWRUr7yy74YSO6PolHsHDXM3uM60SKPSfU0sqhXVlw=;
  b=Yf9/Pne6aTwx27UTP6hucrCasFvT348ITLvezBKTZXP6ewc3FmK7NBfC
   KfKuZIQkMvPuO9cbK/Aw/ZfZMMIQE7CCpG2PwOSKpxWNT45Fo7/2kSKBi
   WZf6HpeMdWC02MH94z/yuGSzzYYpWZ2fhsukq13pCC0RDd8ue/x5VC1Vu
   KTPJKGFs2nf2HcGrPIUO3Pm5eHdT4Kd5ms/Jye1p41372PwUrmEhJvGhf
   7FN3RtHR9JeNpmIyAcBzkFW8/b3sLDLtnFTXI+7wXp0DmmKCxe9MFqNTe
   Sb/z93HrD9uVJ2ZuiuAMx5nW+QR8wpv3V4ikawhBHf1204FDk5QHWh+38
   w==;
X-IronPort-AV: E=Sophos;i="5.93,264,1654531200"; 
   d="scan'208";a="208130140"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Aug 2022 06:31:23 +0800
IronPort-SDR: ZBHl45IzX35rLN0GlhTcOuiyTduaOlCOEXXqQCw90nFdGrNr32ktapC8/OHnjSpVyzRVnm/A3k
 UcaIH9gZzqmXHNEHXAxvdJqM3f+/d2Tt8tn0dDF7JKQhcTt6PAe3mX7sCG7vqxWpbRBAWiLHJO
 9jCePC3g3o0E0ay1cX1kOdlSUkfuOg2SMC9posozNnWBVCkTMMoqqDPp6PY0uLih8J2iY4l4Nr
 kUYweaT0cFYKO+1ySNNUaLOu4uqvDkIJVp+lXUJif954cuV8Cbgf+Om0VxNMWPNKtaXecpK9YE
 nB793bC6abDMMSXJbCK22Axs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2022 14:46:37 -0700
IronPort-SDR: f+UXQNmgMGr3E9gELXZP+jN1AvckW6NhEVof5uGafE3ccJEKlJ44McDE/MINOj8f/lolstflHz
 8OV1psO0kSkzWy1muLixPK1LIcieZ5OeXCBzKhicfkSb+AskR/0Djf2slchekupUVsG4P0Py1U
 aDHU9+YwfzUgHcV+d9qXdf+drk67tDhqTLdXHD7FDmRF01AhSiF0fOGpHazMHUUXu4EQSdzGv/
 RTLWGzHTQset5kI0kDyN63v9FPn/vEICdafB19v8eE9dKkIGURHvZyeoqnHr2/+SvvAvEtOd9Q
 V1o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2022 15:31:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MDHkM28xZz1Rws0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 15:31:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1661466681; x=1664058682; bh=pXWRUr7yy74YSO6PolHsHDXM3uM60SKPSfU
        0sqhXVlw=; b=bs/C01DpSm3y99zfADta/EthQ0tnE45DG9SWbg/EKXntkf/Onpa
        1tCL/1GLcZs/agWIOytQNn8zqOXW4RIH751La5HhWXzW/q2Ipjf9HS4rNbbjGhnj
        FSRnqRBDxAE6lZF5i0RmDTiOjNl68JiExZM5EW/EQDq4RAo3Ic5pjbtmhtG92nOi
        xLZUBvhR+Er+QvEaUmcYewWO+neNs/UxEsv94PGb+uYb/oxK1d6amo3Rzt59nmei
        9f3DAqYO4IOesDyzoER3xilqsE1Zg0vvw21MdhEjBxU3GjLsJWFmZ+zIOfrb/ZYe
        ViaqAJUVZg/Fne/AdrKPbzYjV5IHvjiquNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id W6hKNjwNRcyR for <linux-arm-msm@vger.kernel.org>;
        Thu, 25 Aug 2022 15:31:21 -0700 (PDT)
Received: from [10.225.163.46] (unknown [10.225.163.46])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MDHk850sGz1RtVk;
        Thu, 25 Aug 2022 15:31:12 -0700 (PDT)
Message-ID: <bb0728d1-20fd-8b6d-5d42-a0c76b6d3e4b@opensource.wdc.com>
Date:   Fri, 26 Aug 2022 07:31:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/5] dt-bindings: ata: drop minItems equal to maxItems
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marex@denx.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220825113334.196908-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/25/22 20:33, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml       | 1 -
>  .../devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml     | 2 --
>  Documentation/devicetree/bindings/ata/sata_highbank.yaml        | 1 -
>  3 files changed, 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> index 235a93ac86b0..3766cc80cb17 100644
> --- a/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> +++ b/Documentation/devicetree/bindings/ata/brcm,sata-brcm.yaml
> @@ -30,7 +30,6 @@ properties:
>            - const: brcm,bcm-nsp-ahci
>  
>    reg:
> -    minItems: 2
>      maxItems: 2
>  
>    reg-names:
> diff --git a/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml b/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
> index 21a90975593b..529093666508 100644
> --- a/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
> +++ b/Documentation/devicetree/bindings/ata/cortina,gemini-sata-bridge.yaml
> @@ -22,7 +22,6 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    minItems: 2
>      maxItems: 2
>      description: phandles to the reset lines for both SATA bridges
>  
> @@ -32,7 +31,6 @@ properties:
>        - const: sata1
>  
>    clocks:
> -    minItems: 2
>      maxItems: 2
>      description: phandles to the compulsory peripheral clocks
>  
> diff --git a/Documentation/devicetree/bindings/ata/sata_highbank.yaml b/Documentation/devicetree/bindings/ata/sata_highbank.yaml
> index 49679b58041c..f23f26a8f21c 100644
> --- a/Documentation/devicetree/bindings/ata/sata_highbank.yaml
> +++ b/Documentation/devicetree/bindings/ata/sata_highbank.yaml
> @@ -52,7 +52,6 @@ properties:
>      minItems: 1
>      maxItems: 8
>      items:
> -      minItems: 2
>        maxItems: 2
>  
>    calxeda,tx-atten:


-- 
Damien Le Moal
Western Digital Research
