Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6FC5261B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 14:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380173AbiEMMUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 08:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346758AbiEMMUK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 08:20:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66ED32992C4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 05:20:08 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id gh6so16016719ejb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=pFSJMVLvr3/zffWl+GK0lBhxfYPYYpTt+eChKG6Zku0=;
        b=w5GCpMOIG+eMQkvHAEyYXG6zXVO93bTa/IKwxKINmyJT94SY/TCo5xhLQbhllGxpcM
         0vvXlLE3HzHOeagb/z7scfVvhETIxN16zD6am+E9UxOwg8b+rQoRXqbb+RAYDFzIyi/h
         MpmFTLWqWhA0w/EZJ5bXNQptF40QC6P/NzZ7sPg09u9s99xPR4bA3W4gQ7RMkG47Eyfw
         hPLi6XYnV44bBZvwLv1YRtT1Vr5qUxkxcBI6SZUQBbQ3jEDZJ6F6vqQGjBtkep6i+Ozs
         D/FygOrIbGqTsFkJLBzgCcbR6gd7t89zlOiLLZYXt/zqC6/TFwulhS1tFtF+6bwf0mNU
         R2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=pFSJMVLvr3/zffWl+GK0lBhxfYPYYpTt+eChKG6Zku0=;
        b=m7MuaMalPsOvFigOiCtpLncU+whFfrQl/9GWV76k2P7O1zvyT5dKF9rBoTKZ7LFL0b
         AN+EKOA0rSw9BiFkyazEGDt/w58l+FdnSU8rha7Vd6jZYjTcynCHhyhbU2thdRkh3fsm
         XiERLW2MSmlpELJATJk4bdikJlWOfOZChcxrrMOS8PHijw92QPyapITuVpCW7Drg3dRl
         8YEsSDCThNJ+KBTU7TzHd/sKqFJeGeCUreFw9Hc4cxNN7PHjfd3Ap+eQ4er64dTyKV8j
         Tdh5snE/pqshOoxli1Mzqmv6dgUVJSKMOYkYi55hmkuy0GvdXPMRx1iEQ4+843DwgYxE
         Q8gw==
X-Gm-Message-State: AOAM532iMT5iZnzLifK/moxKO7Sm9O9tHzXPTv3C1YkO5LhyLUOicAgQ
        /1ILWWgWLJOa3dHhivsw7Z5ynSjQWVEgpQ41
X-Google-Smtp-Source: ABdhPJz0H7FbroNYXpYWXVRyzNzhzAbYpnfXABT7xGUonv5DG8TcItHiR7y1/5qSbhhFgEsINRHc6Q==
X-Received: by 2002:a17:907:c0d:b0:6f3:ed89:d9c with SMTP id ga13-20020a1709070c0d00b006f3ed890d9cmr4022920ejc.502.1652444406966;
        Fri, 13 May 2022 05:20:06 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906028900b006f3ef214e54sm712712ejf.186.2022.05.13.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 05:20:06 -0700 (PDT)
Message-ID: <75d18fec-44fe-6bc6-5ff2-af5d87b43787@linaro.org>
Date:   Fri, 13 May 2022 14:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v4 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
References: <1652282793-5580-1-git-send-email-quic_kriskura@quicinc.com>
 <1652282793-5580-2-git-send-email-quic_kriskura@quicinc.com>
 <d296720d-ccbe-27f0-8ba1-9653af25dd52@linaro.org>
 <3abbb26f-9396-d024-67f6-f24f7db3408d@quicinc.com>
 <5f7dfcba-7e65-4f54-8699-e44ce11e216e@linaro.org>
In-Reply-To: <5f7dfcba-7e65-4f54-8699-e44ce11e216e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2022 12:32, Krzysztof Kozlowski wrote:
>>
>> Would it be possible to add bps (basis point) to the list of standard 
>> units if it makes sense to use it ?
> 
> There is already 'percent' so 'bp' could be as well, makes sense to me.
> I can send a patch for it and we'll see what Rob says.


Merged:
https://github.com/devicetree-org/dt-schema/pull/73


Best regards,
Krzysztof
