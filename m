Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8B26F2EF1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 08:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbjEAGvI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 02:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbjEAGvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 02:51:05 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A3319A1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 23:51:03 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-956ff2399b1so456482466b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 23:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682923861; x=1685515861;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvlA7LnCwNQ1tqJrfgkUkBcliNefeRUSKJpMSbDu3B8=;
        b=aQIiZyVkHYs2d/ltdPea295iWkq3RJ4wpoLAucFek40h6b6GuNN4wOwGvyZhtpTa6U
         pqSoutf+++VIZV0EOwzOx6r9VuMZHgTZDM3pk0oipNLiVkClW04CqiAQ1CP3RtapD6zJ
         8qQTAu9am8vtvyya7JPl0039f4bOqiuGD+Jatf3ilMITOXuOLkGWx+l4iCTzCRc+DM6H
         nqkLA7XH9rAsrPVjmue/BgticjnaaScCey3ZJDEsCaYlIGFm1KH5LrQxTk8pn6BLnw55
         257fPakBWEz9TsRhcetUJOIgatiRtU/hUmmMjLzUMs8nofamZWXF4i2+1bZH1diDyhWX
         XbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682923861; x=1685515861;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvlA7LnCwNQ1tqJrfgkUkBcliNefeRUSKJpMSbDu3B8=;
        b=VWNyhzuALykMt7jagNLsap8vovSLX6FrVCyOd63ywvN3OE2JZmtAwpQ4frwcqakn38
         Yfk7sx8pQjX7Mq3W3sDKVaVa88SBh5ZeQx13vEVa+WN+iYOm9t3J73Yef4OkzCaO2A8X
         sP+fLUM5pKhLjCJMlJ2kcggwuskClxDbs2mLTmoIcMhXiVIuvWWVIKGDzV6R8J5RFTLb
         Rn0VNpcx2exHyeSKBC06sFb6zMiNCZaiTk4Yfr6tkzzJXoGtBafuDG2OUCPKAbweoyAv
         ZfXpMLKK9GXYNa5OS/Cw4uL9wRqHEWiCWa+fpn+xtOyZd6hkKDdnhosbEUoLesXEGtOE
         Yo6A==
X-Gm-Message-State: AC+VfDyZAFekXmdgPZS31rvmzVVepRnwSHwv99SN/vbD/BpjFr6IfOxD
        QziTRLCn5rqgZ5nFVFgpjk+pVw==
X-Google-Smtp-Source: ACHHUZ5EJ4CGy/aQDZbmK35ZjIBQP9RYPQlxfnI/mQYHPn63vEbKZkH3dBGDyzNpDA6359N50o5o5g==
X-Received: by 2002:a17:907:a04:b0:94a:474a:4dd5 with SMTP id bb4-20020a1709070a0400b0094a474a4dd5mr12620508ejc.9.1682923861520;
        Sun, 30 Apr 2023 23:51:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:637a:fd0c:58fd:9f00? ([2a02:810d:15c0:828:637a:fd0c:58fd:9f00])
        by smtp.gmail.com with ESMTPSA id rp22-20020a170906d97600b0094f3e169ca5sm14357557ejb.158.2023.04.30.23.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 23:51:01 -0700 (PDT)
Message-ID: <bee68068-fe21-c330-d085-b04b67b5a82b@linaro.org>
Date:   Mon, 1 May 2023 08:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add IDs for IPQ5018 family
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230429193336.600629-1-robimarko@gmail.com>
 <20230429193336.600629-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230429193336.600629-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/04/2023 21:33, Robert Marko wrote:
> Add SOC IDs for the IPQ5018 family.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/soc/qcom/socinfo.c | 8 ++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

