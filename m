Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81B56CB764
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 08:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjC1Gny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 02:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbjC1Gni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 02:43:38 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4C13AAE
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 23:43:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id er13so4389887edb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 23:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MbHK9gxquzTu4OuudBalIqxg+HKqPSQ44lp6Dx4TnjQ=;
        b=Foq1aZAHjoORNNMO4AEP6iM8Kfj1xj1TL4YoMPzZRa4lpdIUjbBTKP0y65K3Bmx9VZ
         RK2laGsY4vm6D4cZhjoSzwCI2Qr6D/27EYSYDw2rlGClHXCVwk4l8xKX8YcBdu/7TBGo
         YCQVw8YM+xU3dX3Xk3ZnrGU/L5vBWKmOnyeqoOQ5YTZj48dvZvAZZuMdapZp5DTy/xwD
         RKe8MJDGP7dhcab1RykWhwTO4FOcBrSsMmIDRDYwYZyyjgH8XHTYbnm9ZgkwILN1GfFG
         WZOuqm3l45knzAE19JVmtRKo+dWhRBKpLYVEkjAa8fk+kte6PETpVNgXjLkdnAdJrz7+
         y6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985814;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbHK9gxquzTu4OuudBalIqxg+HKqPSQ44lp6Dx4TnjQ=;
        b=34T3aAa3WK40MTWMdgx54WcM2/Z9Bv8X9O2zD5DHlVDYNjoKCwhp296DKv3DN8ZHe4
         NwKd8WbFmclQQgz1uAoL5mhp5ZkfyhieN7feAtjoNRCt4XXmNW1x4juPNP5v61HOmF+z
         YBklouIRm1glyCp0arywSfxpRMVxeZWBADq+hBoaAzAfyz714/EhvbY61xW/inFzAig4
         3Yoqkx7wEL3g/z9lZVDnNzOcEIO9WEy1jzi+U+crKyXgam2fY9U3kw17A+vv5zT+fnMv
         qrlWjK6Myb45/OKG+IGuOx4FjJCoweH++X9k4PKIv+C6bZ+aStj1+7qh0JwRQPlOZL5z
         yMIQ==
X-Gm-Message-State: AAQBX9dWvnP0emZPoiRlkk4WGo1XC5gyJim8tfcEptXM8KFMwqwWKiiN
        l6rKgADkL8m9wmhbnrWZcHBzyw==
X-Google-Smtp-Source: AKy350aozLV/kfMw0o+gXcWxC3Pkq1/8ASNpFZqkIcdiw/e7W0+mPismptepSP9CgSIhNrY4WS98Pw==
X-Received: by 2002:a05:6402:125a:b0:4fe:9689:96bb with SMTP id l26-20020a056402125a00b004fe968996bbmr15336132edw.35.1679985813782;
        Mon, 27 Mar 2023 23:43:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id x92-20020a50bae5000000b004fa19f5ba99sm15577741ede.79.2023.03.27.23.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:43:33 -0700 (PDT)
Message-ID: <28789ca3-923b-2aed-b921-ed68b776dc92@linaro.org>
Date:   Tue, 28 Mar 2023 08:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: serial: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Hammer Hsieh <hammerh0314@gmail.com>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230327170137.4104272-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170137.4104272-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

