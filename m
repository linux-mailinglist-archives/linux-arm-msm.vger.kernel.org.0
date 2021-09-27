Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE69419415
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 14:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhI0MX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 08:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbhI0MXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 08:23:16 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E594C061773
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 05:21:35 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id g16so51622209wrb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 05:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y1oO8Q1pVhL1wgXlZ6jgRJOBx8hE/D0mjiLspGYY22I=;
        b=zU/6pGYEYUokOUxUeb8/GAuawoBAl6EG+Hh3TOj/B2OKTm5JQOwVWHX36sIfwNBUma
         GnuIinoxHtg54xUxnSMbAMFAAaE+6gREGDw8cp46lFzz3ugCx5kXy8I03OF2IRY6kEHZ
         mU0owTjSYVivmOesqAVCfTVODIVE+LrLgDFBeDC46uiOQuCc2lZIrDq63TExFfYA7mjz
         Be2TFQCwlnMDC5ylPfDwxChkg5yB4RaJ/A8RoYuAI+ruRh6+Zc8iexhrr6yAPk3QGijl
         tiTnIqyagfIQhWlg03uB5nSI0Nk2ejqoK+pXfi2wjz6tmubUohNgM12z4vhaPDsI4GuU
         Nz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y1oO8Q1pVhL1wgXlZ6jgRJOBx8hE/D0mjiLspGYY22I=;
        b=qKcfeByNoutm8M6W8jL3sGMVz3XK7zKNDBjBYI7N3qR1rBNLzWACnIgtGKdyjBavNb
         WBIejHtANO1R2c12eUiytsM+1eUqIM/PLqZSB85aQyJjI0amX1aPc7vk7ccUw28EjOgG
         tAVGD4BJ2VN5UgS7O+K0Z5SEK7PJ0WlGjX/qZof81A5X+yGeRuYi88LNUMbxmphNfRqT
         40Bn4tzR7VzhBxdlYNjvnjWPED9YJvy0KV/GXOWT+0pzXn5N9VYR6D68fkwDrLPaUS+Q
         bcUTSf5dWyBjoBU+cD/kgdRvutTY3MlLD9ZlyIfVk6GMIQ4U7wBQo/OyHxvOqwf+8eWD
         JrIw==
X-Gm-Message-State: AOAM530UqqiM8Qy75mcadoKTwkW3DpWjTKSdESlBjZidL4EAgFvDRqzS
        QSVoEPv+xJmaGDpabWQlLiPxMg==
X-Google-Smtp-Source: ABdhPJwbyY2P8aShYVbbdpFJ3b9wq5kVBsdgTZ2cuTJ/S34IoxiWAZ9GN3oNxdVlTEcaoTXc+GD5Ng==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr27268884wrq.378.1632745293671;
        Mon, 27 Sep 2021 05:21:33 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id i18sm16795175wrn.64.2021.09.27.05.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 05:21:33 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] ASoC: codecs: tx-macro: Enable tx top soundwire
 mic clock
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-4-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1e176dd1-fc8b-09dc-eb73-35b7d268e89a@linaro.org>
Date:   Mon, 27 Sep 2021 13:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632313878-12089-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
> Enable tx path soundwire mic0 and mic1 clock.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>   sound/soc/codecs/lpass-tx-macro.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 5dcae73..e980b2e 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1674,6 +1674,8 @@ static int tx_macro_component_probe(struct snd_soc_component *comp)
>   
>   	snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
>   				      0x0A);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
> +	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);

This needs a comment for more clarity to readers.

--srini
>   
>   	return 0;
>   }
> 
