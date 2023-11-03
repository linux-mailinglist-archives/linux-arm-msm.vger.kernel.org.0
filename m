Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32247E0794
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Nov 2023 18:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjKCRiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 13:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjKCRiw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 13:38:52 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C8C1BD
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 10:38:44 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso29029321fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 10:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699033122; x=1699637922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZYzTOJPGCrY19MCAqAnksjdslBlhHcm4UfwfPNG7Wc=;
        b=Z9s94ybzc7Ndlez3znnyUJ/ekOoO49eV2B9F76hOwHgMVx5NaABQx4Li0ve8VyvvBo
         ySTWpQW7qapqwiXFqp2yx3xnHiaSifTE/6RuIsmzAP1miTas/y9U/G/xIL7um7TyyU32
         Cw++NlT3OzLbVWmat6nh1SJ+KzZSCO169yVGs5smte0zEKPGxvf86sU6eEYxQcX/rj6/
         ugnrTcEYB1DxQHi9WuPuawYqN7kZQlyJr4yMgk3WG0tIWUHN1XSVRjx+lXlsGuwY/ssr
         lSUK0ePMVZ8OkyoGTPuRkIS+R6TCayT91veFK1dKUXy2Nvu21yQ9NJpAuIHnALp3XUMo
         MmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699033122; x=1699637922;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZYzTOJPGCrY19MCAqAnksjdslBlhHcm4UfwfPNG7Wc=;
        b=P1QkTyXZzcbLdBZ361tdOE1RBa4GbhDL5wvx04LmGAw4Aq0LgtB0c4BIQL5orbRRiX
         shuyp22KpLwXUJ3nVk/N5JzjodO1UyFk2loX1AuL63SsMloSaCIi8nGgaw+RzmcYgg+f
         /7jWDLZ8JZl2KKpmfaFibrzEywkEKZsnBmGE74IO1gcFB7hl39Xnjf46DSBnmG7PAM39
         n3yLiVRunL8T9qbn2I85dQ/Dd7LxaUVwv1AmQuVOtOQrPg0UN0WV0Z6WmgAxxU+Bio79
         +mph3KUpS3XDM4sFA058VhxzOdW8a3j0dW09T97jv4I4zY01r7GwJjncjTDqxY6cod1L
         XVBQ==
X-Gm-Message-State: AOJu0YxWlqloWIpjEQFE4yN1mgCOnha78VrrW6mCdbHmVYqxwdI9HNag
        bWE5ygzm3U3aulCC7GuCLAfPd5/b/dvb8CIbi9IKHw==
X-Google-Smtp-Source: AGHT+IFAWaG0w5Qy1ca0rBheMkQ/q/ZcFmUQFb3s5U6J9vCuTOrHnTYXDOFwSNHjPIsr1OZfG6qgDA==
X-Received: by 2002:a2e:be10:0:b0:2c4:fdc9:c8a3 with SMTP id z16-20020a2ebe10000000b002c4fdc9c8a3mr20595944ljq.50.1699033122300;
        Fri, 03 Nov 2023 10:38:42 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p29-20020a05600c1d9d00b0040772934b12sm3300391wms.7.2023.11.03.10.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 10:38:41 -0700 (PDT)
Message-ID: <6f3757b9-e629-4b67-a88b-3438006fbf80@linaro.org>
Date:   Fri, 3 Nov 2023 17:38:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: External display on the x13s?
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org
References: <ZUUrMm1Q/PI5xv6a@brian-x1>
 <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
In-Reply-To: <181bdfdc-01ef-4e60-ad62-623884cb3d6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/11/2023 17:37, Bryan O'Donoghue wrote:
> On 03/11/2023 17:17, Brian Masney wrote:
>> I have Fedora 39 running on my x13s (with some minor tweaks to the grub
>> BLS boot entry) and it has working GPU, sound, battery status, etc. I
>> see the external display port in the DTS, however it's not working for
>> me. I have pd-mapper and qrtr installed. Does anyone have any
>> suggestions for enabling that? dmesg doesn't give any useful
>> information.
>>
>> Brian
>>
> 
> Run gnome and run the display @ < 2k
> 
> ---
> bod

<= 2k
