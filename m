Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F61974966C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 09:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233111AbjGFHdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 03:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbjGFHdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 03:33:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4206119B
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 00:33:18 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso302347f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 00:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688628797; x=1691220797;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=309+H+PBAX2oHRfRvkMbpKlusq5HD5Zi6qZ4kOaZfs8=;
        b=IvP2VB4SiXOGQv47glGKQbzd/b6iS3TCWEMnR38LlzdBnrrLx0abTIHa0CvUy0HIRe
         zdNziOaxTIxo8mJXkrp2lOgJ6pBsWzNVl+URxFt6sm3zqbh83f54D+D6Cwen6M7zwSNj
         DbZLvwKbIRkyQweY6cdDe9xXydeONKFRFuV0qhsfdTWkcdCpOiS5gojB9ZyuUUtMJ12g
         kvF6J6M2urHXjUhxcO9+iqL8poCTBvrolJlCoYLkefM7CXn9DzQoSQIrm7bkbYnqH7Dp
         AWzfpkjvryOmIwJi0O7jYs0746NMU0wJQvCWWTczr4UkqCn8vi8lfy7IoNfV3xi6YLsj
         YO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688628797; x=1691220797;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=309+H+PBAX2oHRfRvkMbpKlusq5HD5Zi6qZ4kOaZfs8=;
        b=e6yeYIg5EQMmexnsKT2/Etw3Iqd7FADYfCvm7S6e1Ep2sK1fVY2/RsYvPrHo1qPS5h
         iH7QRNoXUyIvQmhsYA5y1Fk1hbj+qujYEoPgkvdp/6vwJl/N9o3GdxcYkv6IkoJdw3Oi
         Fm7VN+kHOJBeJXctCRdNJnkw1Y+2hg6UDHDoCdpUN7YX5vdzIB4IljOmwK9yHnOKuUks
         29KnhpVSVoEYRxbxm7+hm6wMbbHTVMl7eTQFBwR5fKGby+L53bmQNlTliKWnwLSSN3Cd
         V4ZhnovLQc/qOKxYR71ycxlDOjHC99iTD/IYZ+ckyaYpF0JxtmVK8RJWtMFrYoi1IpIE
         Kjfg==
X-Gm-Message-State: ABy/qLb0FvemEzXJzBe7z64vGfpwKNRfIcbPDHxZQ5p28HMyIELQXBdq
        Qwa57oOOVSfPE2ZgfTxIMLulaw==
X-Google-Smtp-Source: APBJJlHg9pvtgZruIi3nLAIy9FlrcGadcm0O7MfOHnLrmUTIMHEoBs2obzlYf89x4mJOTr4PhccpOw==
X-Received: by 2002:a05:6000:4ee:b0:313:e80b:2273 with SMTP id cr14-20020a05600004ee00b00313e80b2273mr730483wrb.46.1688628796648;
        Thu, 06 Jul 2023 00:33:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d1:2748:ead4:bdff? ([2a01:e0a:982:cbb0:15d1:2748:ead4:bdff])
        by smtp.gmail.com with ESMTPSA id y15-20020a056000108f00b0031433d8af0dsm1093640wrw.18.2023.07.06.00.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:33:16 -0700 (PDT)
Message-ID: <9e071beb-9d9d-c6dc-8196-a3e23ea73713@linaro.org>
Date:   Thu, 6 Jul 2023 09:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: RFC: DSI host capabilities (was: [PATCH RFC 03/10] drm/panel: Add
 LGD panel driver for Sony Xperia XZ3)
Content-Language: en-US
To:     Maxime Ripard <mripard@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <739a8bd9-9ff0-5072-fdae-b64efdf86842@collabora.com>
 <e927cfcd-bf34-5daf-0e24-4dd828106968@linaro.org>
 <epds77sccy4cc5cdpoc4ir7sfz5sz3biwep6rbks2nuyqncidu@77gb4t2wy6vn>
 <47a5678c-1eb3-dfc2-a9ac-f8e497455d11@linaro.org>
 <unsithzszj7awvsmxwr7reshso5ju7u4nssil5tty6pocictf5@gwoltpgeecer>
 <6e070141-8c0e-59ed-8a08-58c3fadb17df@linaro.org>
 <lidknise4copce3vb2wth4z3fl2p4npsc4u6ajqb6zsp6lnpca@rp6wxcmy2aa4>
 <CAA8EJpq_VeY=44FqYm7QAT32AR=rmMOV0RtAfNFkb1hpSp29dw@mail.gmail.com>
 <djrx34qwb7yen47dmlsym4mg2pib4syncvdy52ma3sin7uhs7j@gi3znayuucnj>
 <a718f7c1-4ef1-18c8-33c7-c5da22e92c89@linaro.org>
 <q7wrbmdhdy2d3gqig3j34lqxdcwzbom7djlncfznxsa6ktm7j2@i5x4ngi7p2ia>
Organization: Linaro Developer Services
In-Reply-To: <q7wrbmdhdy2d3gqig3j34lqxdcwzbom7djlncfznxsa6ktm7j2@i5x4ngi7p2ia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2023 09:24, Maxime Ripard wrote:
> On Wed, Jul 05, 2023 at 11:09:40PM +0300, Dmitry Baryshkov wrote:
>> On 05/07/2023 19:53, Maxime Ripard wrote:
>>> On Wed, Jul 05, 2023 at 06:20:13PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, 5 Jul 2023 at 17:24, Maxime Ripard <mripard@kernel.org> wrote:
>>>>>
>>>>> On Wed, Jul 05, 2023 at 04:37:57PM +0300, Dmitry Baryshkov wrote:
>>>>>>>>>
>>>>>>>>> Either way, I'm not really sure it's a good idea to multiply the
>>>>>>>>> capabilities flags of the DSI host, and we should just stick to the
>>>>>>>>> spec. If the spec says that we have to support DSC while video is
>>>>>>>>> output, then that's what the panels should expect.
>>>>>>>>
>>>>>>>> Except some panels supports DSC & non-DSC, Video and Command mode, and
>>>>>>>> all that is runtime configurable. How do you handle that ?
>>>>>>>
>>>>>>> In this case, most of the constraints are going to be on the encoder
>>>>>>> still so it should be the one driving it. The panel will only care about
>>>>>>> which mode has been selected, but it shouldn't be the one driving it,
>>>>>>> and thus we still don't really need to expose the host capabilities.
>>>>>>
>>>>>> This is an interesting perspective. This means that we can and actually have
>>>>>> to extend the drm_display_mode with the DSI data and compression
>>>>>> information.
>>>>>
>>>>> I wouldn't extend drm_display_mode, but extending one of the state
>>>>> structures definitely.
>>>>>
>>>>> We already have some extra variables in drm_connector_state for HDMI,
>>>>> I don't think it would be a big deal to add a few for MIPI-DSI.
>>>>>
>>>>> We also floated the idea for a while to create bus-specific states, with
>>>>> helpers to match. Maybe it would be a good occasion to start doing it?
>>>>>
>>>>>> For example, the panel that supports all four types for the 1080p should
>>>>>> export several modes:
>>>>>>
>>>>>> 1920x1080-command
>>>>>> 1920x1080-command-DSC
>>>>>> 1920x1080-video
>>>>>> 1920x1080-video-DSC
>>>>>>
>>>>>> where video/command and DSC are some kinds of flags and/or information in
>>>>>> the drm_display_mode? Ideally DSC also has several sub-flags, which denote
>>>>>> what kind of configuration is supported by the DSC sink (e.g. bpp, yuv,
>>>>>> etc).
>>>>>
>>>>> So we have two things to do, right? We need to expose what the panel can
>>>>> take (ie, EDID for HDMI), and then we need to tell it what we picked
>>>>> (infoframes).
>>>>>
>>>>> We already express the former in mipi_dsi_device, so we could extend the
>>>>> flags stored there.
>>>>>
>>>>> And then, we need to tie what the DSI host chose to a given atomic state
>>>>> so the panel knows what was picked and how it should set everything up.
>>>>
>>>> This is definitely something we need. Marijn has been stuck with the
>>>> panels that support different models ([1]).
>>>>
>>>> Would you prefer a separate API for this kind of information or
>>>> abusing atomic_enable() is fine from your point of view?
>>>>
>>>> My vote would be for going with existing operations, with the slight
>>>> fear of ending up with another DSI-specific hack (like
>>>> pre_enable_prev_first).
>>>
>>> I don't think we can get away without getting access to the atomic_state
>>> from the panel at least.
>>>
>>> Choosing one setup over another is likely going to depend on the mode,
>>> and that's only available in the state.
>>>
>>> We don't have to go the whole way though and create the sub-classes of
>>> drm_connector_state, but I think we should at least provide it to the
>>> panel.
>>>
>>> What do you think of creating a new set of atomic_* callbacks for
>>> panels, call that new set of functions from msm and start from there?
>>
>> We are (somewhat) bound by the panel_bridge, but yeah, it seems possible.
> 
> Bridges have access to the atomic state already, so it's another place
> to plumb this through but I guess it would still be doable?

It's definitely doable, but I fear we won't be able to test most of the
panel drivers, should we introduce a new atomic set of panel callbacks ?

Or shall be simply move the "new" panel driver supporting atomic to bridge
and only use panel_bridge for basic panels ?

Neil

> 
> Maxime

