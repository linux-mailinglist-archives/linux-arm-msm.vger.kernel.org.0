Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8C07B4F63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 11:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjJBJsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 05:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236129AbjJBJsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:48:00 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37528AB
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:47:56 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bff936e10fso34600081fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696240074; x=1696844874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68CSLoMUk/xsQxJmYczMbK1aUNl1yG9wbG7lfg9/RhI=;
        b=SCYcD/sE2mB21crD+Wt5cGyZCLkx4C+qtO8wxTiXs51VJHY17soV9+pamfHdUlWuhL
         NTgdtp/rhNdIuMF0wHYiuyAg2vrTNBDt/1s/Wzfr44KaloVGG5L++8hbpkd/TitsZhDP
         UnQlqR911izMMhEwi4AvAVknbPOB2ANeG42QtuehJxy0rdnA3aWB0xmfQIvCuk7/60me
         NDimCOrrjX3+s1Gz1KWHMWMy5Ia2/+aNmczc51UJVenvi1qoUh60P/QNoWUwJ/FB+1AJ
         gGiUylI4iKXdYWFF5Zlwxdk9QhUkUBO5AgwX/XMzFoU7BupKmnNCcKxmQb9m8A7fl3aA
         shdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696240074; x=1696844874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68CSLoMUk/xsQxJmYczMbK1aUNl1yG9wbG7lfg9/RhI=;
        b=YeOrliSl53QADEO+ShIvqjvIk/hFOAY9Rh51EoR9ySvAD+XLyMoFL+TVVopExEnX/v
         SQK/wOW0NgYnjaykdlEfVvyK9xm/LdNql3Bq+W1PlOIxmRT94XNAEsTgmyGeoPNDCOuo
         P3UqxKvKB1AyFKdvHTnu4qBGS0wknB+lDM62GhU5oc8f5uebO61tKbnW4Z+E2tl8vIxI
         qRHbEa+jb0Bjfuuo/pfOvDskqpmu8kOHrtr0u/75cb04hnaEh7NFBwwTXNQ1hWtJrXyX
         oxeUXWKBuyZQtv3Yb5n0GYAOulvow7XJoH5IDN7lj2OPfZnH8U2gMBeoWIQy4q8K++Wv
         p/Dg==
X-Gm-Message-State: AOJu0Yx1tGn0BvxDQa1K/x9yndlF7zcGqOs0OOWMq+dqc0KO7o8DrHyX
        zolaw6EJH3kg+/UgM05Zjs+BIg==
X-Google-Smtp-Source: AGHT+IFB6wUw1P1R09s+FBtCrJG65I4cwdpFA9MfqSjU6aDZA99s8Ne+18Wsp42LniSmzSCz4sF4yA==
X-Received: by 2002:a2e:9d50:0:b0:2c0:1eea:d9c0 with SMTP id y16-20020a2e9d50000000b002c01eead9c0mr7066747ljj.25.1696240074339;
        Mon, 02 Oct 2023 02:47:54 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e7c14000000b002b6c61bac2esm5253876ljc.92.2023.10.02.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:47:53 -0700 (PDT)
Message-ID: <77eff01f-082e-d7a7-2d6c-2abcc8665c59@linaro.org>
Date:   Mon, 2 Oct 2023 11:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v11 13/13] arm64: dts: qcom: sa8540-ride: Enable first
 port of tertiary usb controller
Content-Language: en-US
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com
References: <20230828133033.11988-1-quic_kriskura@quicinc.com>
 <20230828133033.11988-14-quic_kriskura@quicinc.com>
 <f19fa545-0ccb-4670-af77-7c034b1016ef@linaro.org>
 <e7bd3aa9-b8ee-4b8a-2354-e786f9a9ff47@quicinc.com>
 <3920bc96-fe58-4e3b-96ab-706f00edb2ee@linaro.org>
 <e7e4fc1e-661a-fd62-e8b1-1e173cbfcd3e@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e7e4fc1e-661a-fd62-e8b1-1e173cbfcd3e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/14/23 17:45, Krishna Kurapati PSSNV wrote:
> 
> 
> On 9/13/2023 5:40 PM, Konrad Dybcio wrote:
>> On 7.09.2023 05:36, Krishna Kurapati PSSNV wrote:
>>>
>>>
>>>> Is there any benefit to removing the other ports?
>>>>
>>>> i.e. are ports 1-3 not parked properly by the dwc3 driver if
>>>> they're never connected to anything?
>>>>
>>> Hi Konrad,
>>>
>>>   Whether or not the phy is connected to a port, the controller would 
>>> modify the GUSB2PHYCFG/GUSB3PIPECTL registers. But if we don't 
>>> specify only one phy and let phys from base DTSI take effect (4 HS / 
>>> 2 SS), we would end up initializing and powering on phy's which are 
>>> never connected to a port. To avoid that we need to specify only one 
>>> phy for this platform.
>> And does that have any major effect on power use?
>>
>> Do these PHYs not have some dormant/low power mode?
>>
> Hi Konrad,
> 
>   I believe there will be some minimal power use. IMO its best to keep 
> only one phy enabled for this variant instead of giving all and 
> initializing/powering-on all 4 of them.
Okay let's not waste power..

Konrad
