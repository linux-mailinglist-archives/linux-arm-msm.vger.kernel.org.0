Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7131E44DD1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 22:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbhKKVgf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 16:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231825AbhKKVgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 16:36:33 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1847C061766;
        Thu, 11 Nov 2021 13:33:43 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id k37so17249544lfv.3;
        Thu, 11 Nov 2021 13:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mWTDG5DupIVRHsReUlwUJhBvQCA6yhptc5tCLDAJCrk=;
        b=n8YLAXviZmU2Dn17qSNxkJPiB2rO1+xBmFL4ZcnviIs4QRAaxnK6+SDcGJFpNF/X/N
         NeevVE/g/AugJqIXVvAsBPpLgxSaULSxfYy253HFqns2L+HCYlORONAdzxP0QzETF1Ws
         ANqchxA74iwdkYUdKRoW8ItANkwd4gJOztlAxZ02mJ1sNBjwM7var634r3jCEGZvBEkz
         O5NwPMNv3vPLgY4SAZUWEn2vU0Uk3n+9QmexEKu/FVjOu8m+5OxZX+AsWq7O9Pcxso56
         yiPQRDfL6wwauIgRTAAIzHdsI9AQ5WpjC8Z4vybqXrf8XOThoQPfdGNQrU2U9W1ODXni
         kk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mWTDG5DupIVRHsReUlwUJhBvQCA6yhptc5tCLDAJCrk=;
        b=woSH4fKmREqtGRuDDL2cAYTAPPYv1YPL9eRCd7IPGyL9qDRiXFvd7PisyESMHMciq8
         OE2wuZJHVeDn/gSyJotYgWRKoHKfnzIPPjfmyaxJgce2PxeuWN+bwkF3UJ3NzkxkYnga
         CYXaZpG6buMvviJ3y/lWAZm6lAkIU0mgSyWV4MMdB8C6QMFBRMuTPtZPoqXr0W1qFDxP
         16XROxiDzI0qDmYz4OhlybmKa05/M6yHTyHTeGz+65eItc53/+SXpJRZKqGFmEzHTJIc
         HGfVHRZ5UXOas8yLxHqN4PoXwIwItrMnHrr3Ex9elBlOxRaLL65xCxCxlVs/7Hy9pJwS
         mFrA==
X-Gm-Message-State: AOAM533pFtZjWGcEB4CGPD05sbFFzlB/DQ2hmn7Ge+RBjISKfM7OEjkR
        aUu+8mJZSIzkzU/3XZBXykc=
X-Google-Smtp-Source: ABdhPJyyjDph9B9wZeTcf3Fzz7tw7HS+qq8aHf4Fn4lwG+ZFKrjR3oc5pJAqVt11dMoyaCmw+pn5KQ==
X-Received: by 2002:a05:6512:1107:: with SMTP id l7mr5690949lfg.318.1636666422047;
        Thu, 11 Nov 2021 13:33:42 -0800 (PST)
Received: from [192.168.1.101] (83.6.165.118.neoplus.adsl.tpnet.pl. [83.6.165.118])
        by smtp.gmail.com with ESMTPSA id f3sm380295lfu.133.2021.11.11.13.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 13:33:41 -0800 (PST)
Message-ID: <3aaedcc3-3c13-9d8d-7699-ff053be430b7@gmail.com>
Date:   Thu, 11 Nov 2021 22:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 3/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM
 and fixed regulators
Content-Language: en-US
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>
References: <20211111031635.3839947-1-danct12@riseup.net>
 <20211111031635.3839947-4-danct12@riseup.net>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20211111031635.3839947-4-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.11.2021 04:16, Dang Huynh wrote:
> Subject:
> [PATCH v3 3/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM and fixed regulators
> From:
> Dang Huynh <danct12@riseup.net>
> Date:
> 11.11.2021, 04:16
> 
> To:
> Dang Huynh <danct12@riseup.net>
> CC:
> Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>, Caleb Connolly <caleb@connolly.tech>, Martin Botka <martin.botka@somainline.org>, Konrad Dybcio <konradybcio@gmail.com>
> 
> 
> Add most of the RPM PM660/PM660L regulators and the fixed ones,
> defining the common electrical part of this platform.
> 
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Konrad Dybcio <konradybcio@gmail.com>
As explained by Marijn in an email in this thread, please drop this line, as I did not approve the patch,
and definitely not from that email :P


> +
> +		vreg_s1b_1p125: s1 {
> +			regulator-min-microvolt = <1125000>;
> +			regulator-max-microvolt = <1125000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
I don't think setting a ramp delay of 0 does anything, this goes for every instance of this in the patch.


Konrad
