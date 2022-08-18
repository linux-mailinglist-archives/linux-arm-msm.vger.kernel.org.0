Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586FE599068
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242841AbiHRWTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbiHRWTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:19:41 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF2ED7CFA
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:19:40 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c2so2650167plo.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=4OHgz+NZLaoZjICCYz+Egjh5BDduLjWdCOrDB1pAeYE=;
        b=WLq5/ycGz4fNey4PuVsl/ltrgeNvfVvtsgPqVd0ZwGrPjme+VIjLPT5j6kDg8EXAgk
         81C7OcFUXvWPfozGMtrCf5Ay/8Y7q9WZzngB5BC+1TIVnNlZDST8s24dzKmMxuwCBgK4
         3GmDKZgPbtQkBE/6pnvhnODhln5G1hYf0ZA70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4OHgz+NZLaoZjICCYz+Egjh5BDduLjWdCOrDB1pAeYE=;
        b=uZf9jdYlahrmAAwEygwChVAoUlWgXwEsX1mYeVRCpXenwPLVElt+pzh0rOdybQzrU1
         sD4k0a59iVT9OhVk5uI3GW8SjqNHevIhWMoBzZlHI79hZARq90gvFIRbCEL327StIqLk
         2j6IvDmlGvR8s/GEXIATkMq4RDDmv1gKDO+B/blPJyJXYbRpJQmp70x6ByYA1pPT+Ltq
         7xkGOgvucVaPC15FNRNOZKc20hwlOlxWU4NKgEWkNFtrkJpSxCKUCRODZ3uY6+8uDh6z
         hb0oFjxwtXOAWljlRXYrxYHBY/q1rJqUSQji59uN1dfEnfOazjFzvnPk2aUHvxxbgYbJ
         IGSw==
X-Gm-Message-State: ACgBeo0zHUzfEE02s7B5qQ0WvGqoFGZMoHqbJdVWQWqeEiZmLJSvr9io
        1nhoCxouE/1kWSAzJ7+RFW3ofQ==
X-Google-Smtp-Source: AA6agR5QtCiBxJHIFJ+sMsZwugUeJqCqBwHaAb+LNJD9cN99ptnvRXUeihMOqQmqgJUoQYiOL/QR/A==
X-Received: by 2002:a17:902:7242:b0:171:398d:9e66 with SMTP id c2-20020a170902724200b00171398d9e66mr4674652pll.19.1660861179656;
        Thu, 18 Aug 2022 15:19:39 -0700 (PDT)
Received: from [192.168.0.114] ([107.126.92.34])
        by smtp.gmail.com with ESMTPSA id b20-20020a621b14000000b005327beb318asm2154667pfb.128.2022.08.18.15.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 15:19:39 -0700 (PDT)
Message-ID: <60b5b49b-eb7a-c552-fcf1-3d3a360f8e25@chromium.org>
Date:   Thu, 18 Aug 2022 15:19:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add sleep state for alc5682
 codec
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alexandru Stan <amstan@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20220818084216.1.I5c2b6fea19c4c0dec67fd4931f03df8e5ccaca95@changeid>
 <CAE-0n52GzxXEsToWzfU1TMuASuC6TKK7NXxYbBQWxNmM74FxZA@mail.gmail.com>
 <CAD=FV=WNuqtpnCr2Zn0z_L1OCiwD8dNzhDxvhfHYuYVmciPbuQ@mail.gmail.com>
From:   "Joseph S. Barrera III" <joebar@chromium.org>
In-Reply-To: <CAD=FV=WNuqtpnCr2Zn0z_L1OCiwD8dNzhDxvhfHYuYVmciPbuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/18/22 1:34 PM, Doug Anderson wrote:
> I tend to agree with Stephen's analysis. We actually need to keep the
> pullup enabled unless we are actually turning power off to the codec,
> which we don't seem to be doing.
> 
> I guess I'm a little surprised that we don't even seem to turn any of
> this codec's regulators off in S3. That seems like it would be drawing
> power that we don't want. Maybe the "low power" mode of the codec is
> low enough and we need to avoid powering it off to avoid pops / hisses
> in S3 or something? If that's true, this might be one of those places
> where the "LPM" of the regulators might actually be useful...

OK, fair enough, so suggestions on what I should do instead? Should I
look at why or how to turn the regulators off? Should I look into LPM?
Are there existing bugs for such work?

