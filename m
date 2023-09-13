Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E9779E47B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 12:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbjIMKDg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 06:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbjIMKDf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 06:03:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B696619A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 03:03:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-502984f5018so9495442e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694599409; x=1695204209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pbo/8rhEXq7ViJoTgiqXoBttcFVT0iEd3fLlTUG3r/8=;
        b=gRBh9sb4SBsU5WJbSSOlGEBk3OshLlYohY6Cwv4lRkhnaUjE9pAQgkTs3VLdbmh1rh
         hlQ9pP3B+CpsD0W/JN50MApHi52QAhhvb6aMjRr12wxn5UgDQpHw8OP6SKmA5hMNz6iT
         GykRDV40n+0T3XkGxlt1wHasaynDdfHQzZ7wgOGokcEbvYM50GKdawzYiXUtWiFRtHlk
         I597L4FIB+gprw0HWOGE7abmd+rerJCwv0poF4Zwuq28h9uXcdLKJC6ZlJY2d/PbkcP/
         zNebZExsdrXuye3AT0tQUAzfgDe86F8mhFr78H7C9zonAZ7w3+kLcRJh7swUio+uBZBS
         tgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694599409; x=1695204209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbo/8rhEXq7ViJoTgiqXoBttcFVT0iEd3fLlTUG3r/8=;
        b=qJmzVYIJqi/fimeHV2x1dC9OR4gc5GOuLRWaMxYkmWhbmQR9Dvm+/LCrRPqYQ98+E7
         m3sNzRcRDUd0OuZWAnyeR04JFZfMOYF/WBcFtY+5VCg94pik6DSDtQqmrLe7TN9ykWKK
         +wY790iDn5YXykfLOpPMwy4Brcdgph122uhGiEXtHAV2aryctaglgkU40q4WtsXu2LsS
         lLE7P8ODCbBKraSzHeAHNPQsQIo66HPzBEI7mvIQzcUsIcZNGpebNW/w6egX8S/p6+Iz
         cOhgXraZswFp165ir6yKclO5XshTTTYfk8po9EdzJCoTTvTTvlNKQWGcnpdGjnA/xpmo
         obnw==
X-Gm-Message-State: AOJu0YxhdGuSEDH3moGT7KU9Gh05l9vDmhCF3cVru4o3zpTjPxY9/pvr
        Zu9YQHGwalUBLOxWnuEi86Vg7Q==
X-Google-Smtp-Source: AGHT+IE0DlzvJjkZuZVZhaWngXJ/na0N0f+7S/EVx5XMp2zbxxlvHWfvjsPDe3mZctZrsNepFbkuHQ==
X-Received: by 2002:a05:6512:2354:b0:500:86cf:1249 with SMTP id p20-20020a056512235400b0050086cf1249mr1749133lfu.61.1694599408927;
        Wed, 13 Sep 2023 03:03:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d0ce000000b0052c11951f4asm7034992edo.82.2023.09.13.03.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 03:03:28 -0700 (PDT)
Message-ID: <f4073f37-0292-9092-6872-0eb662658aa8@linaro.org>
Date:   Wed, 13 Sep 2023 12:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] dt-bindings: mailbox: Add protocol and client ID for
 SAIL and GPDSP's
Content-Language: en-US
To:     Shazad Hussain <quic_shazhuss@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        jassisinghbrar@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     kernel@quicinc.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230913095733.27382-1-quic_shazhuss@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913095733.27382-1-quic_shazhuss@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2023 11:57, Shazad Hussain wrote:
> Add more protocol and client ID for SAIL and GPDSP's which can be used
> in device tree properties.
> 
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> ---
>  include/dt-bindings/mailbox/qcom-ipcc.h | 6 ++++++

There are no users for them. No need for this patch.

Best regards,
Krzysztof

