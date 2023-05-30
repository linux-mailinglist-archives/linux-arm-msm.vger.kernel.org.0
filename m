Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D891716171
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 15:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjE3NTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 09:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbjE3NTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 09:19:38 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BD2A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:19:36 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso5891312a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452774; x=1688044774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dakJQqvXwovc4cRZ0OniHS45vADzGKSPIPf7PzecMTs=;
        b=W0nJotOSH+1jhS48FYxALZLysmmBF/e1g87sOFeqyOfryBaZSphmfWUsUN+qB3h6kr
         UiZMZ+ABwb85wqSkRY4Hz3eVaTIOza/V4KEexguKc7ppUoWZ1zYlz0v6vfnMPjOT1PKB
         dnDb5d5dZ8OHo1iGG6nWf/tTlIUxii3aqfuiAWyxoEhStIq3q6IzTZoO5g/aCLGDi18O
         pDsGeARco374dB5JEjY1rdNUFCMp1AAa8dyAmS9hX5ckNHskR0CiG9ABAdtaXp71bLK3
         qOitNukaBNNDOsBiJB6NR1yIm7rHf4bWUF2+8DntT3bHKgq/eSSQ9pW0KQnu+8o0qHSh
         tN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452774; x=1688044774;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dakJQqvXwovc4cRZ0OniHS45vADzGKSPIPf7PzecMTs=;
        b=fNQ1S1NitSeBBZXObgWaVWd+Iaex0n+TQwdG81isYSNd7mD6ALKhGU4dXOgsXFwhXe
         zrZmUKGmNvCN6nL/eaIzrOomO8piWouvIBKjom/HP2OPYhTDarhC9ANbQg8uvQJKzLCt
         86DzdskLs1gcetk51xgFaGUcqJCH3KLG6mCTEEFnqauI5MjzNq5zjdPi5HCM+ZG1Ac5+
         /8DEtZKamiJ0TdZPlw6SIj0ojiXSRy7YfUmxBC1qxdIRi3tGDeWEL6u/fOOJbW6izPpE
         dbwlqiIgZjP5RkpeWuw4g8tfI8kOKS234JgjvS3Dqb/Ql9NfAjdBFIN2cKDmBMvuMDRw
         k2iA==
X-Gm-Message-State: AC+VfDwI/dfDSJmhfO8Ou/+0TkY8ZS0o9NQoY8CzcX08+pJNB51SDCQh
        N8gLCLiXRJJv/dts2MfMKQ5NvKOfx4LsYmMUM+sL7w==
X-Google-Smtp-Source: ACHHUZ6PwL740lBYyywAT37VtwWDCbyXudvCjQYX+7D2ia9Vvrgwv222iORYh7NyLYiL3Dz94ZK/wA==
X-Received: by 2002:aa7:c144:0:b0:514:9e81:9070 with SMTP id r4-20020aa7c144000000b005149e819070mr1795435edp.15.1685452774654;
        Tue, 30 May 2023 06:19:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id n18-20020aa7c692000000b0050470aa444fsm4371324edq.51.2023.05.30.06.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:19:34 -0700 (PDT)
Message-ID: <ea82c596-5284-2361-245d-228748ecb722@linaro.org>
Date:   Tue, 30 May 2023 15:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/5] ARM: Add samsung,expressatt to qcom.yaml
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     david@ixit.cz, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230524230459.120681-1-guptarud@gmail.com>
 <20230524230459.120681-2-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230524230459.120681-2-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/05/2023 01:04, Rudraksha Gupta wrote:
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Missing commit msg explaining what's this.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.


Best regards,
Krzysztof

