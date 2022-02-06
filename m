Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59CA64AAFFD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Feb 2022 15:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242834AbiBFOkM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Feb 2022 09:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238787AbiBFOkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Feb 2022 09:40:12 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25BF9C06173B
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Feb 2022 06:40:10 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 136284003D
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Feb 2022 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644157979;
        bh=iBTf6y0xLELB31dfEXbCW+Z8deAydpyZ+j6t81TAta8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=a+jMy2vFsni4MvrMx6ZKg3bcR+N6Jc7dbc+woz+0GHbUXwzHmXZIuURNBOUV6KWv6
         yloFW5amrffMDjqC5TO9jQS4ABCDQqcKtKgKyUonPlbK3EQ6TQrAaiAo0BC8nYEUcZ
         KHoZeTBtkRYszy/5i1KwXaqJ3/eGgYDaMhj48rglekTgm6doI4phjL9Z7q9l1ay9YE
         MNgLRYOZOwgzp4BJTqyz4gTQz+jTNAY4lkyF+h+8ZZsOme9FT2T3rJyz4VwqyS2E2O
         fnrbTmXa9OrmOmrFsNXBfK4iKW/1551PGnUdHkNaciVMlEFB9xKaYHD+tdGv+l1v33
         A2EyGV260iD2w==
Received: by mail-wm1-f70.google.com with SMTP id t2-20020a7bc3c2000000b003528fe59cb9so4278743wmj.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Feb 2022 06:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iBTf6y0xLELB31dfEXbCW+Z8deAydpyZ+j6t81TAta8=;
        b=3WGS+p2ydDSJKU7PKJRcP5ZTs9IYhmC3UtrcvRwNJ1GEma4VQd9I96FL9B2ub55Bi5
         FYEYzrD2R5Ok9sSl/6clO4IRMghv5eQ+vtU4hr0Ji0QZW5Bh6NFQOgTpsvf5KD2e78ZX
         MlsMn6oRSSynJUAH1IId+P2qr24LZgbBm8cvehB/Y7sQa39+5epWzT4xAJO1BLlCuA6e
         EOujQ/lqv9xVS8Sn6EWG9IkR+wKQ8kJKDjEvFWcfL8XmiwoePD85r5vj6xyIPS0CPN5X
         Z19jE0MSH6KirOOM7vjb8sWxjhZOP2dPgRmz7kT/2avnCTI5TEvMN81UswgZBcHuKKU0
         SHdA==
X-Gm-Message-State: AOAM532dNJ4aKP9htgS18vWZV7GzJ9CbQlZyTpTMc+hEYoOmHdPvZqrh
        ZoCHc/LSiVlEHDP7VxTAQH2AU1/ABy32Z06RqlzAYtZNRngBWq58rmkAgHiPjhf1SCPDhHESt8p
        39iFxGa9gXz1d9RK9pYMblMlvYQnkdr1tuQCHrOu+zco=
X-Received: by 2002:a05:600c:2d16:: with SMTP id x22mr1956223wmf.157.1644157978792;
        Sun, 06 Feb 2022 06:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxefNHWP5w7P/D9vOrUBCrUga7/Lb4kx2EXe7e632FYxDVfRb6BS7gw/2/TUX4NJ2rcqQ3dwA==
X-Received: by 2002:a05:600c:2d16:: with SMTP id x22mr1956204wmf.157.1644157978607;
        Sun, 06 Feb 2022 06:32:58 -0800 (PST)
Received: from [192.168.0.85] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e17sm8376629wrt.27.2022.02.06.06.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Feb 2022 06:32:58 -0800 (PST)
Message-ID: <7c961e60-7273-475e-6416-51045d7c7a92@canonical.com>
Date:   Sun, 6 Feb 2022 15:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCHv2 7/9] dt-bindings: arm: msm: Add LLCC compatible for
 SM8350
Content-Language: en-US
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasad <quic_psodagud@quicinc.com>, Rob Herring <robh@kernel.org>
References: <cover.1643355594.git.quic_saipraka@quicinc.com>
 <e3d200eb06949f7e216b7f82f5811b7addb7fdc8.1643355594.git.quic_saipraka@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <e3d200eb06949f7e216b7f82f5811b7addb7fdc8.1643355594.git.quic_saipraka@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2022 08:47, Sai Prakash Ranjan wrote:
> Add LLCC compatible for SM8350 SoC.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
