Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673C6143CE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 13:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgAUMc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 07:32:28 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45096 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgAUMc2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 07:32:28 -0500
Received: by mail-ed1-f66.google.com with SMTP id v28so2741231edw.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 04:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SL+YF5Uofufimw4rDKfqmNibtNPjVUG+hLupAtvlD2M=;
        b=F4LJ0mcgZTCF24ZNSkWceJ2+LXhM1w8W9vLaRiJYZG+NfN3Q6zP6KECdytxCUQLcdj
         378uw024Loy9mByscDnH7SyccPgbbumow0Fh1LlcNQWGh0boDEUyKTwlJdttgVrW34Rt
         T/gDIx+cRlMycWAgj2wSx4PGodUHLt6IYEwRUF+DvHd/hPCkZ05WgaGvRT5YMa882FZZ
         gZ8j5hqB6Gpkgs2ZhO+WQvpoqPWggEMkQaicgBgSm4+k4UOhgn1qPjnh/XmH5Y9HIQWO
         H3MjwkA9OW0g2YCyA9qyN9PKwdN37236q/nsHWTAmzNS+sZezuvPnHE74gMA/Na+PXn4
         mvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SL+YF5Uofufimw4rDKfqmNibtNPjVUG+hLupAtvlD2M=;
        b=eH3R+nwl2n1WChX5L1YGYxTJmcMxmw1isLXSSNYauOjXAl4fiIkOmezXrx82Um1F1+
         bLVj6WyLk1OOi32ztG1w5lbEbSGHqbilKly7F+PEwBKhqDFhuodWNwseQbd7yxSK1hTy
         m3DgxQgRNzLE0PLeomyXBAwcyq/w9UbYckVhgO9Cr+PpqN4cF5GYY0lNm39pguwRUJlX
         76P9rKOkHBA+kbRdN7PidsZDKlAPi+8630aaLmosQb8sYBZpSvTr2J1h8LNVgbIqo/Td
         APjElk098VchW3oyUb+Od+f0uz86ZZwVkwoMP7FXAIRFbPPwafxpnDXKsulPzdKAd5+x
         z2Ww==
X-Gm-Message-State: APjAAAXm5st+1aIe78iKrS0DsANNbPKB1ghtBXzQXzI2MwlHviPvMbN3
        M8Cgvo+7SbcokX7jtO9ycMFIGQ==
X-Google-Smtp-Source: APXvYqwUyxzwa78ktvSmQlERGkWfMEq+Iav0VLVz+58M305ktq8lVUWTidW0Amk/Zxhdv1fRA7FIHQ==
X-Received: by 2002:a17:906:b841:: with SMTP id ga1mr4129501ejb.184.1579609946792;
        Tue, 21 Jan 2020 04:32:26 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.193])
        by smtp.googlemail.com with ESMTPSA id e21sm1411279eds.36.2020.01.21.04.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 04:32:26 -0800 (PST)
Subject: Re: [PATCH V4 4/4] arm64: dts: sc7180: Add Venus firmware subnode
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org>
 <1579006416-11599-5-git-send-email-dikshita@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9c874b8f-1ac0-d1f5-043f-9a89b8203cd1@linaro.org>
Date:   Tue, 21 Jan 2020 14:32:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579006416-11599-5-git-send-email-dikshita@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 1/14/20 2:53 PM, Dikshita Agarwal wrote:
> This adds Venus firmware subnode for non-TZ platform.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..2f82510 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -287,6 +287,12 @@
>  	vdda-pll-supply = <&vreg_l4a_0p8>;
>  };
>  
> +&venus {
> +	video-firmware {
> +		iommus = <&apps_smmu 0x0c42 0x0>;
> +	};
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>  
>  &qspi_clk {
> 

-- 
regards,
Stan
