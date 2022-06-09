Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3054B544B56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235642AbiFIMJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235574AbiFIMJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:09:57 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A1C264DD2
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:09:55 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y15so20501256ljc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rim2Ki2Eu3BjQABgKkl/x6ZfzcgX4FO+4AS4UaRphF8=;
        b=CL9aPDC4zmgstdQlhsmmruoiv+PY/kyMtM3oki+NCEWjfAVUT8tz9cQYJBkg14i46V
         bugl+IasUsJzAcG+g38guZkPwTknRSwoptaGsFHq5tmsagVmQa9ULVO5tsU6Nu6N5boQ
         KJvpg0GIT/13DMWfWfMe/Mcun2xTKE7uo3vkPzDVu54UA3t8f1EZ3zsLx0SjugKTGlXu
         OH1uiYMEYf7y/QyG9WQnG8J+sswMf6rmCZyI6/mFZcSUhQrv8B/OAET54vlu5x6xuFZc
         lJN7+hqbKvXFT7VbJo5OZsZIfI2PEO3fQ/fjEt2hPEsPa69+V/g8YO1FyvJMWZ8vXwlm
         x6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rim2Ki2Eu3BjQABgKkl/x6ZfzcgX4FO+4AS4UaRphF8=;
        b=MXLq/en4hEG/ItOLwwK+IAO+eMZInXFf5oy3+Uc2KKaGuNV1NZJGnuNFW1bJYxUzA+
         TIPqr62fuiIXC5wOpPFaP9XnHdRoRXqV+6FHI9cx4GB/nkODJhJgE22/GU2TNUHfq8ck
         sHpUA9dP7WWNn+yhRRZwrgSU8y5/qP4Q7k8weW7kSli2Bg4l/MgT9B49tqWG87MkN4pC
         HIbJf9KKMD0UwFg6uzvUdC3iGKY5nQhushvgSu5Aa7sJIRPX3JMtdRYPbaFVrCE4EzYy
         80dZjYG4WyE96lr6cTBGzhI1O0zXvZTDL3ccizhKixkImNcbuyDN05nuJ2nuJ+asXBTE
         vxsA==
X-Gm-Message-State: AOAM530YdjvMCylkrsGRSZb34sAN0TPnJ18etBlTJ3HUGC0uOQ5c2rMF
        Rq8BezNlPeRvkS/mmsqxaqYWCg==
X-Google-Smtp-Source: ABdhPJxwGatgo+iZBh1zUEHAJkUUpucUDp/+0VK2xI554y8QFcDYLe4X7kHwkCGa0+lfZasdCHoJSQ==
X-Received: by 2002:a2e:908b:0:b0:255:68b4:4085 with SMTP id l11-20020a2e908b000000b0025568b44085mr23175357ljg.369.1654776594036;
        Thu, 09 Jun 2022 05:09:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n11-20020a05651203eb00b0047255d211e9sm4202581lfq.280.2022.06.09.05.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 05:09:53 -0700 (PDT)
Message-ID: <58811796-1a27-b159-28a4-e9b507fa5869@linaro.org>
Date:   Thu, 9 Jun 2022 15:09:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/12] dt-bindings: display/msm: hdmi: split and
 convert to yaml
Content-Language: en-GB
To:     David Heidelberg <david@ixit.cz>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
 <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
 <f1489ae9-268a-5e35-2223-e8ee95cbd206@ixit.cz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f1489ae9-268a-5e35-2223-e8ee95cbd206@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2022 01:45, David Heidelberg wrote:
> On 08/06/2022 14:37, Krzysztof Kozlowski wrote:
>> On 08/06/2022 14:07, Dmitry Baryshkov wrote:
>>> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
>>>
>>> Changes to schema:
>>> HDMI:
>>>   - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>>>   - dropped qcom,tx-ddc-* from example, they were not documented
>>>
>>> PHY:
>>>   - moved into phy/ directory
>>>   - split into QMP and non-QMP PHY schemas
>>>
>>> Co-developed-by: David Heidelberg <david@ixit.cz>
>> David also needs to SoB here.
> 
> no problem, for this or any later version of patches developed by me:
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Thanks!

-- 
With best wishes
Dmitry
