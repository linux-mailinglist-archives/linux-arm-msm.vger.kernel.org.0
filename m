Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7608D62C4CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiKPQjm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234208AbiKPQjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:39:15 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3797D5654C
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:34:10 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id f7so27381321edc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPFrCMXv81mTTBcEeoWVKjKNP4QouYmge2x3DesP/20=;
        b=Hg3buutBjQqRZdaCsrNVeVgH0sh3OQyiFlLtSR75O2nMgmOqXit9nrGKkrCT6Vj1ZT
         fr9eKFku+2K8VDjLypWWezSUyJbj21ADDg7LRa9x/EgdMl+ANvT1Pia+KrCb9DpWyOoa
         pVw4BbfHQSbrpTOC+w3OKpjgxUxP3ICi3ccpg4FNUXHJTkzypjSGa+WOu9vodqpHpAFg
         N0hE0QCccSmnwJsN+rhlm7CswoOKtxZiulyET2g4x5Juh50rdFyaHlzImSIw66rtigWv
         55F9bkQPkiOJvYoeSsCWa09qb6oVYrlUKW5MU20eQE7I83EY277xRGqUs7PuIqVBqpkw
         GXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPFrCMXv81mTTBcEeoWVKjKNP4QouYmge2x3DesP/20=;
        b=60Rvo9veoJrB8kxKdg/U7fJppJxkjFTvzejENG7woGVjZ7+yfmCebdlLonVg4uQCbn
         HS4iCeTbPcATfLC/QNxLnIACFXs8U5RMbsP1I/d6RB9jL9E5YG8KMVHmayFs/g94CDcL
         OzJi4r4neSRIkQpVVAgFGOugCMDGW6GMsYkGusFo1WKQqhCjVzTysk+zVg9Ytfezhc6g
         jEXnYhLGMobH2Wc1XsdXOnUQAmwe6aOXKBEywqnSoqFBu2UhvcErFqu2mipGVjmGFprG
         j4JnzWWnVa3couv7gleBSyvqXnuLKHn/Fg8rtUeQy6oVQ5G+klYu0/VtfSXvpqqqLUBI
         6hag==
X-Gm-Message-State: ANoB5plX4Z+nHqMgEDRjvzkSwEyfxi+D4NHmurWdgMP3uJ6xx8xb9edN
        A0Dfs04DO2lSLuTHs2m+UOOKYA==
X-Google-Smtp-Source: AA0mqf4xwUOrbHG5btJi83vesthDiDX1WKSxfps8LHn3WT/qtvfjSF3uGB6yWmZ5Oz/WCr2pzwT7nw==
X-Received: by 2002:a05:6402:64c:b0:461:96ba:b9c with SMTP id u12-20020a056402064c00b0046196ba0b9cmr19597775edx.353.1668616448803;
        Wed, 16 Nov 2022 08:34:08 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id f12-20020a17090631cc00b0078d46aa3b82sm6959967ejf.21.2022.11.16.08.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:34:08 -0800 (PST)
Message-ID: <8d9c6187-64d0-a320-8ec6-e9ae51ce93db@linaro.org>
Date:   Wed, 16 Nov 2022 17:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: use defines for RPMh power
 domains
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221116154935.163810-1-krzysztof.kozlowski@linaro.org>
 <92993d1d-e7b0-199c-5652-5158988a65b9@linaro.org>
 <CAGE=qrpAUcGwS5EQgMA9oA0c56=1C+2X5TjyyEFrf4xd5r7k+Q@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAGE=qrpAUcGwS5EQgMA9oA0c56=1C+2X5TjyyEFrf4xd5r7k+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 17:30, Krzysztof Kozlowski wrote:
> On Wed, 16 Nov 2022 at 16:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>> On 16/11/2022 16:49, Krzysztof Kozlowski wrote:
>>> Use defines for RPMh power domains instead of hard-coding numbers.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>> I sent exactly the same patch yesterday.
> 
> Then the same as me I think you miss remoteproc@4080000. :)
Uh.. unless I don't get what you mean, I think we both covered it.

Konrad
