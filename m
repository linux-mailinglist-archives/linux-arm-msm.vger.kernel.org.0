Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF25525107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 17:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355816AbiELPPg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 11:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238070AbiELPPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 11:15:35 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A438D262714
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 08:15:34 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id m6so5673037iob.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dAccpwSlABENXdFG9sL3n5Vq8ZaFU7f/P797lgrtYLc=;
        b=S6/2IQdesgT7HD9HzOnm2VtvcaZChiNAeweXM9MRnpGSoeJxyqrG2uyzxTE9VF35kn
         CfwoG+pozkRvmrdRIPmld7pzyRISLl08j+Ed53rzAPycM0ZquKI4kg9zbUv+BnU1iXWv
         KerHH4ulMvljguFLUk3jrUUS5Wio2AYd5pZ20oHoLh0HgZscdXc5NaKmMoXOxpV2TJR8
         D1yP9hYsk8xDqU3YtnEntDCWjQ7Yfdex9shx5IE0xqKV3hv4CVftPCUA+Lj7ScUe9aXk
         aVV8kfkOx1e/XocEY9ZL7yCEVvNU1W7YjzXpqFSXJh1j7bt3T1qjMS+HrgWTYtj54mHC
         8Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dAccpwSlABENXdFG9sL3n5Vq8ZaFU7f/P797lgrtYLc=;
        b=QcDfC5iGJwuP9QmSoh+p+r9PssThdfEAmA5Gwun4i9dSxuJoPM+CdjCmBmMugmPOPw
         cc/h8B8wLQuH8GRgd0SeC15ExrycSUOmVdp6M7wkBy88bMwDyjYqyav2jyvhhShwW3CN
         9+CdgLA54dw1UlYPvfJIQvIPdBhfv4THHhGM1zivOYKhrsXYpUldxbMLTSzB0IYnxwh2
         op6zAfETRgwwbKM4XanUBmXjCjo35lfnLsNLa3EjzteJsHbgvr2UUSPUwpYr4mHU022Q
         VVVdmjj244rB+o54yZfCSGkN/DhQoEVt7vz1naVaW39IPqJ06V01Cw1k+nHe4vMdX7RR
         5DnA==
X-Gm-Message-State: AOAM533IkCwNSj/wTJSm2n8kw1IdIoKDy/bwTkqshDnWNN7dxPa883Ez
        OlB+bDvPgTPUiN9XLLp/UZ1kMg==
X-Google-Smtp-Source: ABdhPJxwIeyEF1HtBBqviDCiriuSC5OHYCqL7VMDLuu3vGIGNw93U8fo5359mgxNfCVPk7MMDEIgfw==
X-Received: by 2002:a02:900d:0:b0:32a:ec66:4fa7 with SMTP id w13-20020a02900d000000b0032aec664fa7mr217333jaf.271.1652368532653;
        Thu, 12 May 2022 08:15:32 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id h3-20020a022b03000000b0032b3a781766sm1452036jaa.42.2022.05.12.08.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 08:15:32 -0700 (PDT)
Message-ID: <4e14f1d5-2abc-8c30-d54d-7e542ca4eccf@linaro.org>
Date:   Thu, 12 May 2022 10:15:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] clk: qcom: rpmh: Set wake/sleep state for BCM clks
Content-Language: en-US
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        patches@lists.linux.dev, Taniya Das <quic_tdas@quicinc.com>
References: <20220412194505.614002-1-swboyd@chromium.org>
 <YnKvoh+h07at8b65@builder.lan>
 <CAE-0n517iAS9KSdunMX18LpqDrQ4ac-yRCZq82j-XdExaGjCXA@mail.gmail.com>
 <CAE-0n53eXiz74iCHHQaC-eDFkuui9Y1xXvuqd2g0UnrwbYhZTg@mail.gmail.com>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <CAE-0n53eXiz74iCHHQaC-eDFkuui9Y1xXvuqd2g0UnrwbYhZTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/11/22 5:04 PM, Stephen Boyd wrote:
>>> Will you take this in fixes, or do you want me to pick it for 5.19?
>>>
>> I'm waiting for Taniya to reply. For all I know this has no effect
>> because there's some sort of copy/paste from one state to another. Until
>> then it doesn't seem like we should do anything.
> Taniya told me that if there's no sleep or wake state set then active
> state remains even when the subsystem is in sleep. Not exactly
> copy/paste but at least it is consistent. We need a comment here so this
> doesn't come up again.

If I understand what you're saying here, your original patch is not
necessary, but there should be a comment in the code that explains
why that is the case.  Is that right?  And am I right to assume you
will be sending out a patch with such a comment?

					-Alex
