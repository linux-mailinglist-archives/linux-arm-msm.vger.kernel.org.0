Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AC5219C1F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgGIJ1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgGIJ1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:27:09 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC3BC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 02:27:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a6so1584113wrm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9zbcH1ET6mTpiWM4s+enxGFR1R1N7AIvSGt4u+PK5Gg=;
        b=deM0ouJ2Ofrd/TtZmY2cqH50N6qrVDBpP6X8oXdeTC8ELze/OVs4b9MRfdyI9amfxJ
         VscnF7iCk7FvDwBtjoaErnn1TNbhfbniBxC+/cLmmZvzJeXDzbrHuDHBAyf6AHa0Q32e
         BR2UIfIOKJg0orXs/KZraI7loPPyUHAxfW4MllMfINw+nKmYZ2VyOl98aTbClfPquVu1
         87sneoL7eBQehOHrmyyYc597f4ZIyUshyuEI6fsiic8cE5tha5h2ZPnzOt/omBbM/KWz
         ChKvBgPzLvKpvuBQTl7GXwsjdKCkQKm09wwRW0phVPEOVLHYuRT+9XRdWyjprT+BeDou
         J0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9zbcH1ET6mTpiWM4s+enxGFR1R1N7AIvSGt4u+PK5Gg=;
        b=ANM3Ep1AHKMBQC5nwUdCNgUL43JkdKyRq958AnInL1A75mzklo/FIDohZ49CwX35Vv
         oRU64VIUg7+y7jcUxnBlJMaJUmpThU0AiT3u3CqlvIMQ+UpznslaycLMECs9tYtdee6N
         oFlfO1LL5tOdPgtJquvwhCEMetUgIchCv2oJc3WC244Sb8cIpiQr2tAQJJMKlIR4Z2PQ
         aOqoiWnsCTwColeXxe2qfjGNaygESHvCtaYxnmIoPsMvCGubvEWHOWlv9J5IaKZMqGhj
         xWTYiCNwYkK1WCHybWC8GsnUDXPAsPOmeTy+iiaZj8kXonZp9qHVo/ZtpqDTVEqRi0Vt
         iBaA==
X-Gm-Message-State: AOAM5315rr296MYn1iVJp8DQoJJC532oYxbz/n4l5/3ZwnShOM4lo933
        3VVN6UgTL9jLYpztogQfyLOmuA==
X-Google-Smtp-Source: ABdhPJzPjHBBz8yv52oXgA3W16ls5Wg2i8Tm7dIMYZJudQJQzVrpjfNq8dEzSUd61McW+eYmpbpeAw==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr64493990wrw.374.1594286827525;
        Thu, 09 Jul 2020 02:27:07 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c25sm3579138wml.46.2020.07.09.02.27.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:27:06 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To:     Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
Date:   Thu, 9 Jul 2020 10:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/07/2020 06:08, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 32c2cdb..04e34cc 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>   
>   Required properties:
>   
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
> +- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> +			  "qcom,lpass-cpu-sc7180"
>   - clocks		: Must contain an entry for each entry in clock-names.
>   - clock-names		: A list which must include the following entries:
>   				* "ahbix-clk"

Can you also list the clocks that are mandatory for this SoC.

--srini


> 
