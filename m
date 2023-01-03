Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E001865BB80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 09:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236828AbjACIAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 03:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjACIAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 03:00:01 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C16DF2F
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 00:00:00 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id cf42so44591499lfb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xybIa6a5Ht7rHreWUL9qCncLTyU54FM7pG/3ayjmdKc=;
        b=KsOzXa8qhmGd+LTvaEWSnm7pvd3DIMpQZekQfzVSUllNXlETm5HoQNIk0jxJkpKIU4
         8/EM5OPa4innnmDZe7GMeCqvTO8SqGp1Pnb8P2+z4YGcNy9W/pRjkZt2wUR+JOI0rGuy
         0p/w79UISsu7fFdLjsj5AEtDRnRpBmzsoByX9EAQ6hvqLMrVvkt41BsGzchYjRlW5Bc8
         UdjxsEp/p84spDUHNq+QFyUywIrOskmzwD7IQPu2JEBVTF9NpPPwqENvvArFwCPdvFOt
         ghqi/YQ2WEtuSyd7pjFxH8j7av39HS1QOWL12TNSCmXA/p49fDx+BgJMIKvZWoOHDOli
         PnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xybIa6a5Ht7rHreWUL9qCncLTyU54FM7pG/3ayjmdKc=;
        b=YiGJY8ro8i6BUzV1q0do0rrM6Mpnoq8CAo+Gwl3D/JfYSNqjX8KZlVV+/YS8eQhfIh
         dVbpxGYgPozVTGBvqPLrgIL8k0gzMD/aHPqZe6nR4hPv0Lkk6LTVIFs2lxWjV/5DJ2lC
         nsVA8YE1H7y4Fz8R51+NU7OMuukvrwcopAqZ0PCeX8zzf4SRIFo/MtdDIf7Irxr2I8wR
         66C93NM6uf4RjiQFi5iJBnOR7eSK409RCE09Y75tRTRku9a+9cyF/RLfLGr38fx/7aXZ
         gfy/BvBJxDyGF4jAOQIlv/mqO3phtEFVz1Th/FjvN/qVgY7X5P+Mim8sbNEgF7PnIA3j
         n/YQ==
X-Gm-Message-State: AFqh2krFfnMGeLxsYNYtB+V39gwv/ZtVJvHTUL28mYY0q/rAeh3VRG4L
        c1FfhkDa/g9vnwsS6wcvWYm21g==
X-Google-Smtp-Source: AMrXdXt+pxCyHcH1HElUDP5VL0fKIW6t92rTlMaruNQVYXAQKv5aZNCcWQWFvaNif4nT4k1xwwr50w==
X-Received: by 2002:a05:6512:398c:b0:4b5:7a91:70f5 with SMTP id j12-20020a056512398c00b004b57a9170f5mr13893569lfu.63.1672732798857;
        Mon, 02 Jan 2023 23:59:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b3-20020a056512070300b00496d3e6b131sm4711279lfs.234.2023.01.02.23.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 23:59:58 -0800 (PST)
Message-ID: <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
Date:   Tue, 3 Jan 2023 08:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect
 cells
Content-Language: en-US
To:     Robert Foss <robert.foss@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        quic_jesszhan@quicinc.com,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
 <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
 <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/01/2023 18:10, Robert Foss wrote:
> On Fri, 30 Dec 2022 at 17:12, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 30/12/2022 16:35, Robert Foss wrote:
>>> Use two interconnect cells in order to optionally
>>> support a path tag.
>>>
>>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
>>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>>
>>
>> I think you need to rebase to include:
>> https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/
> 
> Ah, I see. Functionally I seemed to do fine without those commits.
> 
>>
>> On which tree/revision did you base this?
> 
> msm/drm-msm-display-for-6.2

Then it is not a proper base for DTS changes - you will miss quite some
commits. The DTS patches should be based on Bjorn's SoC tree or
linux-next (although the latter sometimes can lead to conflicts).


Best regards,
Krzysztof

