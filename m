Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC7C64354A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 21:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbiLEUJ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 15:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbiLEUJ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 15:09:57 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE2222BE7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 12:09:56 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id vp12so1166781ejc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byt+6Yq2EaLbyXoYZ+ACDho3kUdzFwRWJcBHXY7JBeE=;
        b=eB0yoAA5tqcdHwitjX0cIu6RMwRyTFZx5x6UckB5WhVZ4iTdXt2f9sOIJjZtoE3EKu
         M2FMHf/xdjFhjkA6tVFEy4ZhxmIoXi4L3o8ZBDBn3LSUa6e4AYRaskOw/WybIOGk9jCh
         osEdGzctluiUuXmjzNsQOtulCz4z4maNU0Sq9GUtow/DT1J05SrJM8pWGFkVY5ontQSi
         w/1KAVOcQEC2hxSUAkrGjwcqgjM5ivaETkOqttqSP0RCkyvUJygdsrhj357cQ3sY8ZsT
         Vb766I4pW0ur/bWZbyNMPxxbO2sLhLY2XDPlapnmvMSgXf8TVN0Qfu8V/K5wPSK1uTYs
         n+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byt+6Yq2EaLbyXoYZ+ACDho3kUdzFwRWJcBHXY7JBeE=;
        b=m7zMHMDRv0RsnSnkIZzXYVPgzY/NcDyn5HRJtzOuLMRnE0VfqI7GPFM1cE3zJyACjn
         MrtZrX5bDg3vKyFQcVVlwXIv9E2SRKHkjdAq43/M+6GdkO07/RfqjzY2aSmpIAmWJvo7
         p05v4TXiz5KU64Ikz4svLJH1QDWjSDLGLz/Gcod1XFzPu7jdKPDkKEFTSMSfJkXh8s7/
         aMlHdJi4YCP/1+QD/3BiDXGXnpxa9v/Z8Rqgl0ceVhgPiXNmKMrBUwLeNish9ev51ENS
         Xf9plrERvOT+p0zdyCQ/NoHFj77V6+VUpdoR76i31LLAMV6p2J0dFvbA31C2C/R9iCzK
         bnEw==
X-Gm-Message-State: ANoB5plZZ5ZXGbM41JhpRiznljD8kZQBAZbd7lRog+wTj6cyQjbD7tvk
        kIKg6Av2pjHPWVcydbEeuD/k4Q==
X-Google-Smtp-Source: AA0mqf6hpf3x2YGZHsciPiFFZ9WTPQHOt/1Nl85YsaI6yp4AKdaqVL7TssXcL7VvJ/eu2CHIe6BxlQ==
X-Received: by 2002:a17:906:3993:b0:7ad:f5a9:ece3 with SMTP id h19-20020a170906399300b007adf5a9ece3mr71186272eje.635.1670270994685;
        Mon, 05 Dec 2022 12:09:54 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id n20-20020aa7c694000000b0045726e8a22bsm176115edq.46.2022.12.05.12.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 12:09:53 -0800 (PST)
Message-ID: <9aaabc1f-6d7f-2e75-8831-30e88180f3bf@linaro.org>
Date:   Mon, 5 Dec 2022 21:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 13/13] arm64: dts: qcom: sa8295-adp: Enable DP
 instances
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-14-quic_bjorande@quicinc.com>
 <b58f6935-b6ac-128b-2fec-a06dccc3210f@linaro.org>
 <20221205200236.2t25pv5abrgkrt5k@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221205200236.2t25pv5abrgkrt5k@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/12/2022 21:02, Bjorn Andersson wrote:
> On Mon, Dec 05, 2022 at 07:09:45PM +0100, Konrad Dybcio wrote:
>> On 05/12/2022 18:44, Bjorn Andersson wrote:
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> [..]
>>> +&mdss0_dp2 {
>>> +	status = "okay";
>> status should go last.
>>
> 
> Thanks for pointing that out. Would be nice if the computer told me
> that...somehow...
> 
>>> +
>>> +	data-lanes = <0 1 2 3>;
>>> +
>>> +	ports {
>>> +		port@1 {
>>> +			reg = <1>;
>>> +			mdss0_dp2_phy_out: endpoint {
>> That's quite a lot of indentation.. couldn't these endpoints be defined in
>> the SoC DT?
>>
> 
> The alternative would be to have the description of each DP controller
> split over multiple nodes and rely on the reader to stitch together the
> view of the node based on the label.
> Based on the naming of these labels they would at least be adjacent, so
> it wouldn't be that bad.
> 
> But I feel that there is enough DP-controller nodes in this board
> already; I've yet to describe the two USB Type-C controllers or the two
> DSI-DP bridges.
> So I don't know if it's worth optimizing indentation-level within each
> node like this.
> 
> 
> And we will end up mixing this optimization between DP controllers, USB
> Type-C nodes, QMP nodes, DSI-DP bridges.
Oh okay, I see, let's keep it as-is then.

Konrad
> 
> Regards,
> Bjorn
