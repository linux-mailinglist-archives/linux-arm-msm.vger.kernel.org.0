Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7FB06CA3F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjC0MYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbjC0MYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:24:13 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D538C26AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:24:11 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id y85so3780375iof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679919851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M7fwx4Gq36neB5rjmYZXmJ4EEeUPvlYWM4QNVZJmo4=;
        b=m5fo7fWvMPAmVj0rncN6hKv8Ybq0MTiI9tcyqVo0VXHTurenLDC7DzDbl9Dnod3TM3
         s8XpxafgbK8+5hIm/1cQaGylkJFTXFX2bzvXDg6PX2InNaH0kA2Md2rGRQgFyRallKGz
         CkzScjAc68Xg1KeKQyY/O5sG5G4z7d8Q/UrIO1bfDWGMZAEP9ta8Mw0ydXt0ZN/WbEgt
         wNgWo4FxjzdcEmtwG47KkYSE4ESe2B35Syny0SjYgwLGiRhjeNF8F2Ne3W9XpIS5GSUW
         wJv/VEHLr4uVsywXDn5KZqeFQir3dHd2bTegtCYrSGJrqmmRHlL5DiArUi9cx9mFLNyh
         f8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0M7fwx4Gq36neB5rjmYZXmJ4EEeUPvlYWM4QNVZJmo4=;
        b=nhTL/aWC6d9F9QX2SFH+humsnyrRJjFEFwzZ0Om3jywmoANy3G78+mJ2nRDwSyW5kg
         be32b5c+ONwshy+Mu90+pmm8992i4LE9vUPDLpasUYhYEPkiSkSx0O53PMkY4X2dmtSL
         YgP++oKKA8qXW4PnPZRNew9wmVICjHyXeHrxlfce+VcZuL5rJurK/aOAKdGxPaWBib21
         4LsAVaWrOgB4ewTvVN4VmTn/g/maRabJrdG0J+8gsbf346L7wCkpb7+iUILndwj49noy
         w4AS7NHSyGNYffdxC8nhG35W0hU0rktaH0MdIy1DWqOTezv4XQyplKs2B30HUBCGPJOn
         T1aQ==
X-Gm-Message-State: AO0yUKWK4cLTCGB9B4mAwyZFJVgWqVtinSg4eF7MQ5aQfjZ7044/zb87
        8g820/q4A36poBuoGr122zpzOQ==
X-Google-Smtp-Source: AK7set96M6ONmh9Ck0ywo9OX86cKB7NbQjxnubmi0RhJzXBmiTPPWuHsBRkdXltU3xdJFOgs3Hx7PQ==
X-Received: by 2002:a6b:6813:0:b0:752:dc26:9f31 with SMTP id d19-20020a6b6813000000b00752dc269f31mr7741695ioc.15.1679919851166;
        Mon, 27 Mar 2023 05:24:11 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id s19-20020a056638259300b003acde48bdc3sm8692613jat.111.2023.03.27.05.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 05:24:10 -0700 (PDT)
Message-ID: <91368b01-941d-0655-ccb1-315d91ee3e34@linaro.org>
Date:   Mon, 27 Mar 2023 07:24:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: sdx65: add IPA information
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alex Elder <elder@ieee.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        agross@kernel.org
Cc:     quic_rohiagar@quicinc.com, caleb.connolly@linaro.org,
        mka@chromium.org, evgreen@chromium.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230324201528.2540564-1-elder@linaro.org>
 <20230324201528.2540564-2-elder@linaro.org>
 <98fcbdd4-77b3-5b17-7102-c590f1a5a63e@kernel.org>
 <f600869e-0fd8-ca19-1baf-d23f7a9103d6@linaro.org>
 <5f825218-c583-7ccd-6845-684a4b166abe@ieee.org>
 <d9cd11e1-1d71-e54f-5d3a-f3de54d71f01@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <d9cd11e1-1d71-e54f-5d3a-f3de54d71f01@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 3/27/23 3:57 AM, Konrad Dybcio wrote:
> so I think it's not worth making extra noise in existing files
> until figure it out.

In that case, would you be OK if I leave this consistent
with the rest, and once it's figured out, I'll fix them
all at once?

					-Alex
