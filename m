Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D8B42CE33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhJMWfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbhJMWdH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:33:07 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93A7C061746
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:31:02 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id r9so1389642ile.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=otZN8F+fG9zAX7wVdqQ3N8LhCQgLBn+dCk9vdX4N79k=;
        b=EuNhCjX6qv4SHl5vGJ6JJNVDiRLzJDAc11ZlKzibulsYq/szMLC5oz1UUjSAcevNWa
         4wiwPvp2FoWkh/YY66rUNRbZPm2G+bZ2qutdDQfA0jwhdbnMfe/n4pIfsAENt8Wn/meB
         vnNj6gLX3cVN1/CzuJGEe97w6OyXi8cj24khI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=otZN8F+fG9zAX7wVdqQ3N8LhCQgLBn+dCk9vdX4N79k=;
        b=XvoWyLkwyeqdf6wHkipBRR7OEUOo+EQk4rWkTn7tZJcezOukInpQrFj8BbZ0axq7Zf
         Z6VgsJaBHUp4VxplxsU1E8GYfuNuO1RAFnfb0KXkEmzWmXChWchhJ88PuowHjh7wumdl
         RdxzacBN4up5yYNxVy+phPXR5Gr8e8/kvSPp9h/MdUzxZlX565VjUgAxDhdybV/9xP6J
         uEp827OiVRj5T9c+uDlNWkNpTR/6zDLjLzIJ3KUsiS1Ktg2zbExWHUrsyFUkcKakGqgB
         UovbmeuqS+XDtwntcbK87W4ZXu8vYIG9C3Z6pevy1/hLhWie6+cnj4xDbby16IJM1E2i
         8/SQ==
X-Gm-Message-State: AOAM533NM6pl1wwV6rgURmTymlP56SfiKz15us4P66jaEOZ8gCUvMzQo
        LMdH/MSmLEFf3rhe73IWNeJ/yw==
X-Google-Smtp-Source: ABdhPJwo3yLSsRZNFqu7UKIUCDgR8yc4ZXmM9i3Tvb+hzqHpIewQsz5A1oY8eYgYcKDR3SvJqyYjRw==
X-Received: by 2002:a05:6e02:1889:: with SMTP id o9mr1401742ilu.219.1634164262205;
        Wed, 13 Oct 2021 15:31:02 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id b13sm340163ioq.26.2021.10.13.15.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:31:01 -0700 (PDT)
Subject: Re: [RFC PATCH 17/17] dt-bindings: net: qcom,ipa: Add support for
 MSM8953 and MSM8996 IPA
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-18-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <0166e268-5162-95d0-e5c5-8831525b7d84@ieee.org>
Date:   Wed, 13 Oct 2021 17:31:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-18-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:08 PM, Sireesh Kodali wrote:
> MSM8996 uses IPA v2.5 and MSM8953 uses IPA v2.6l
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

This looks good.  And if it's good enough for Rob, it
*must* be good.

					-Alex

> ---
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index b8a0b392b24e..e857827bfa54 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -44,6 +44,8 @@ description:
>   properties:
>     compatible:
>       enum:
> +      - qcom,msm8953-ipa
> +      - qcom,msm8996-ipa
>         - qcom,msm8998-ipa
>         - qcom,sc7180-ipa
>         - qcom,sc7280-ipa
> 

