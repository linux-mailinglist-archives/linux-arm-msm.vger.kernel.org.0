Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8966465214E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 14:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiLTNOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 08:14:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiLTNOa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 08:14:30 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9924192B9
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 05:14:29 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bf43so18525739lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 05:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4soysMYlE5uLOWxvMz3kFERYvX4QfUx7ksFcqn2D0EE=;
        b=tpkCVvat4g0eXvy5QifD0hK67MsA35F9W9/S9VQLVtSLNUwlWMOJSTBPARzZn51jGY
         7Xk0+F/iKbOhCcLAOLL9eusZ64c8Kaj2Lfni/u7UaYy7pMQi/T2b++i9vkNXuSk7RB8i
         uvd2ekWd60fZh8FDsLPBjWa6qEQXu6UJ00w5AuxL4hVh2yVBIfm3cQqTe3Eu5MVKfZkj
         mqW1ku959xhOX3v5Nxk3FkM16RgYQOwgTJh9GoBW7nM+0E+2S2O/L8RjEMZUwZtp4J1f
         2/ur795SRWVDyQFSTrQm4TE1+xVoEkbRcquKAAfKrTUyzwLKmijxrp3SahR+Cm6cco3o
         PiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4soysMYlE5uLOWxvMz3kFERYvX4QfUx7ksFcqn2D0EE=;
        b=Y3BKpIXwi+qZYe4jzmPtfW9gS5wBAGgI0QzXQXmQPa2oVKvcbgwkazMgo/T3k3TGs+
         eeslDCSWUWIZMDjs+IIKNKinsoQKYKidCi4J5sX0xqPBASoHLLbUiJyx865Xbllw2+nL
         f9IzBsBEcKw4q+1/kIy/Ncz/HdsHC+gsIcL3e5tUK4H8UM2cZrzsGK8Ov2yna/22Hc5b
         1ctOcWACA0Za8TTF3l6UBLvYIRYPXLmInpr3Abesq/IMeNPW8Tclk53WIFc2mWoL5d93
         UNCRZot6GiLC9zA8xd4f4X8SogaDkgR+ACjBlz/a0vtlktQ4smJ8vhnDFOufCU/RmK78
         bmXQ==
X-Gm-Message-State: ANoB5pk6Z3a4a160R+N67qSv/bWkr1CjS8LZqYEEESwRcpXfTOiG9ytU
        dqNlNcOrKWYuIKxYHQPGGYYdDA==
X-Google-Smtp-Source: AA0mqf57wBUG6oRn0/KXtAsy+ILK0JNdy5t8fnVa8BTs5T4WROg8iWliy1gnEFS15uJQg18Z7Q40nA==
X-Received: by 2002:ac2:4c56:0:b0:4a4:68b7:d623 with SMTP id o22-20020ac24c56000000b004a468b7d623mr17369941lfk.10.1671542067986;
        Tue, 20 Dec 2022 05:14:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o27-20020ac25e3b000000b004a27d2ea029sm1448741lfg.172.2022.12.20.05.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 05:14:27 -0800 (PST)
Message-ID: <e59ee93b-1144-b79e-6b95-cf4e016272c7@linaro.org>
Date:   Tue, 20 Dec 2022 14:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 12/14] tty: serial: qcom-geni-serial: stop operations
 in progress at shutdown
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221202085554.59637-1-brgl@bgdev.pl>
 <20221202085554.59637-13-brgl@bgdev.pl>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221202085554.59637-13-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/12/2022 09:55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We don't stop transmissions in progress at shutdown. This is fine with
> FIFO SE mode but with DMA it causes trouble so fix it now.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

This looks like a fix (even if without SE DMA impact is not visible), so
how about Fixes tag and moving it to the beginning of patchset?

Best regards,
Krzysztof

