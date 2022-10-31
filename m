Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1057E613D51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiJaS2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiJaS2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:28:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9AC3F5A0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:28:30 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bs21so17188399wrb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4jx6lz71cjbAqj8i3vewQJ41ySG6HKBqr7j1aeY43g=;
        b=qqYhfaD5lyJROnsh6ugh/wyOiNePZSHwojQdDVlTV64ynJrcUIB+ZRqlSuPiF1+6mW
         Kj+vYK1jyqIua3uSQgT/IpPPzx2KNxyuHbPasy9ydcWVdqZhMGXCIBb8+6CefOZzIPFF
         zwrdtXrZAzwnTAJ0DNn7o9ad9Wx8O1wUg0goZFEVva78pNB+E+JIzkVGIKS8Jf8Mk0Xu
         SsBuwRxZ6ZdXJ83bNZpEqukPR08KzUjKPneks9CitgtavGg1gCCwqV1H06qtuqBMdiJd
         bP8anB271DZ9YAzSXOknf87LJZRqaofjMAJz5RSX8sjBO15P6Due+H9jro3kJ8Wunj3X
         PJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B4jx6lz71cjbAqj8i3vewQJ41ySG6HKBqr7j1aeY43g=;
        b=1cNI+28/GshVn3EwuXo/36ezbDrKJL3mSGeqN/XmfbC8PDP/jbxweS26/J5K6VJLht
         dTE8RhO3VUE15a4lBOCyyIwCUUb+CvDk4LTT0T45VPSqalPVEF9KHirdwnTbRUfiHrpq
         ArF2a5Cxtom4cy4MKOJOdCOG1HF+PcnSXKI+L/NOM/H2zrc8CtJE8BmDova5UTeltTVv
         mK+1IEIH6y7hvxRKCajMg3PkfQi0is5ObxnmZBFPoJ9zUYubPadW+tAEvNJzvWH80MBd
         9o8jvPKueboJvR49CRB7rmBGZMO2sgOM0bZTuV6FLcXtMmLHYcS+5DPddPOdwQM/Vtji
         aDxg==
X-Gm-Message-State: ACrzQf2um3zseh4NjB28cfvlJjfOGlqOmEVLsnM+9XCSU6AIN+VJ0ORA
        XrUktWlBnE4Z7+Xyaz+JaTkCdicAoVAJGQ==
X-Google-Smtp-Source: AMsMyM6dDfJB0ajj3vlZXJ+Dxub4JSTQTNoA2GsNgP4Pc7rMBRSHq4BT7+okVv7rRE3iPrWLFRnZAg==
X-Received: by 2002:a5d:4b45:0:b0:236:501f:7a41 with SMTP id w5-20020a5d4b45000000b00236501f7a41mr9092145wrs.516.1667240909319;
        Mon, 31 Oct 2022 11:28:29 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id iv9-20020a05600c548900b003a84375d0d1sm8459882wmb.44.2022.10.31.11.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 11:28:28 -0700 (PDT)
Message-ID: <7ba5c01f-7b46-e031-0a82-290de08d1175@linaro.org>
Date:   Mon, 31 Oct 2022 18:28:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/5] slimbus: stream: add checks for invalid
 unprepare/disable usage
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23/09/2022 16:57, Krzysztof Kozlowski wrote:
> slim_disable_stream() and slim_stream_unprepare() are exported, so add
> sanity checks preventing unmatched/invalid calls.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied all.
thanks,
--srini
>   drivers/slimbus/stream.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 75f87b3d8b95..7bb073ca6006 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -407,6 +407,9 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
>   	struct slim_controller *ctrl = stream->dev->ctrl;
>   	int ret, i;
>   
> +	if (!stream->ports || !stream->num_ports)
> +		return -EINVAL;
> +
>   	if (ctrl->disable_stream)
>   		ctrl->disable_stream(stream);
>   
> @@ -438,6 +441,9 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
>   {
>   	int i;
>   
> +	if (!stream->ports || !stream->num_ports)
> +		return -EINVAL;
> +
>   	for (i = 0; i < stream->num_ports; i++)
>   		slim_disconnect_port(stream, &stream->ports[i]);
>   
