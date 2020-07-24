Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BB422C453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 13:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgGXLWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 07:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgGXLWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 07:22:11 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9009C0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 04:22:10 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x5so7072746wmi.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GazPbHUQLsK8S7tpuO7AvOa0IiPz4pR+J44UaDqobHk=;
        b=KrRpNFDpBZHHWPx0ETVhUqNHKnHacZ6r/gaay6WB7CS6mzqX5jorQsoiNCm9OqQcBl
         vn7wpZGL/D2B4UwfH2LgfbjDEIh7Foz8/z7K/TCE6wAMpanMQOmDw+QkdhqmRS4bzNle
         397s4Y+2q+fZhfj4/arSsxnViNt3HFGoVURr7YnynB++Exs/V9T5Tek+q7K/nfV3Uo0F
         Y8m5px4KvbjmZVv3FS+mpGRsSnyoDcg3r4eBpmGyTV5SqGYyNS8Lfg3vaQf+D+6KAS3f
         buZh9+8VeBnzqjOX9hyKTU/xIRqpDcsGFzwik6zJAJ/Vj27bgN2Fy/SOHZMyxzNnmtDq
         82dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GazPbHUQLsK8S7tpuO7AvOa0IiPz4pR+J44UaDqobHk=;
        b=mqz6eWtEs7c2cMjT+q/3mija2qip78HNXeQpk/u5jqrpfbB8B+B7cuAeapHeYQwiu7
         qywY1woYhjT31WwJw2QAFi0/y1EK0mia3yRDUf8WvjSQg7z2xKYi4K4gJtUlA7LI81Bd
         a5mUCM9BRivayrLTQ2rAt/bkmd0ofY5nAFUAPYLO8b6ZJBFdIEU4hAWg/DJmRBjzGqYp
         kCsQ/Ed3bc+ijb4h/rIPgPjqtbok4wt7uiATYdeDMdqaQMpOJP6osUv6ZoR7pJG2DXlZ
         asriDduf+ywwH9NoZIc+gUC0lavOejZ5DV83YpsS8+raXMT3tipw4k054N2AfoGPeqr5
         6CRQ==
X-Gm-Message-State: AOAM531FsNtc6aoh4GKGN9yl05dp/NqT+KmzEfd8YcTynGOfIecjUjb5
        HMfYGipIA1dny4eg2m8qfZ+INA==
X-Google-Smtp-Source: ABdhPJzuISAaEC6wI6jIFPRKdMJneQLwLQbmOnvS88iKf9FErm/LSyy4iq1BlJvn6CgSM6jT0oW0fA==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr7724232wmi.120.1595589728701;
        Fri, 24 Jul 2020 04:22:08 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y20sm6394145wmi.8.2020.07.24.04.22.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jul 2020 04:22:08 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] ASoC: qcom: lpass-cpu: Use platform_get_resource
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-11-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c0789d98-599a-6b67-ac42-9083a6c251f3@linaro.org>
Date:   Fri, 24 Jul 2020 12:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-11-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22/07/2020 11:31, Rohit kumar wrote:
> platform_get_resource_byname() is used when there
> is list of reg entries. As lpass-cpu node has only
> one reg entry, use platform_get_resource() instead.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 5d84f63..1ee6d8b 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>   
>   	of_lpass_cpu_parse_dai_data(dev, drvdata);
>   
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   
>   	drvdata->lpaif = devm_ioremap_resource(dev, res);
>   	if (IS_ERR((void const __force *)drvdata->lpaif)) {
> 
