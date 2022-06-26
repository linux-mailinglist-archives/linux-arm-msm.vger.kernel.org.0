Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281AF55AE93
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 06:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiFZDm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 23:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiFZDmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 23:42:25 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DD013D29
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 20:42:24 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id o18so5407600plg.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 20:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Fm4CiRWTrY1xm9RLX1deAr3n8PdyWY9E+pPn+FMbLvw=;
        b=kqgu1HSkTJovDW5DnaFLtQo2hjWo5bfFdX8NfAwmudDxCPe0IcT7qw4EmhT4C+R1aS
         4CCh8u5T2lAdNBqPRkZkY4regcy/lYSx7kRsUzlQIxAzB6u0hCZ6eIAc6MLLzUxrWX1J
         bBcX8EMJFQo0i+f+u/J/kCqpWlOy6dXkr96xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fm4CiRWTrY1xm9RLX1deAr3n8PdyWY9E+pPn+FMbLvw=;
        b=W5u/wEt18EPLwDJFhuBTNyDPeeq8POotbusOZCdZ/zW645Z7XRoIoMEYW3O0riKBQh
         upY9IZxLXWaSQHtS7i4Is2bNWqQRdKZ4f65+GFqNtDDpIwp1B1BMivTvpG7wla1+L8r3
         qXOethVR7UslVMytGtqGdqDSM+JDgnlt/uqVSXQvqwAZ4lnpG+oteHR7oznisaMI5OdW
         aSYijBN2xVxWYDLxdciQ/ahK10H3Ah/BRc9dAhPpqebwlNXpHciF8JjaE4P0BLXgl+ze
         r1vaPGUTXl5ZXXhp8kRrYOpg6TFeZagsvE5FgPouWQlaCRxiJF3CfrL6uAmTGk45qNTt
         QJAg==
X-Gm-Message-State: AJIora+aVEX/3XpEjO+kwB6zJ74YizLLgmipl/wLuBur1XSqWTcbOIgS
        5jHQo8xLQjlu6Vjdfp/PdmAwpg==
X-Google-Smtp-Source: AGRyM1uQpFBrV3V/C++kV15CCtP/ORtqOCAtfGTrHJrM2kWRw19CERn8AJrxQs/NlhcpTmNLpPLNiw==
X-Received: by 2002:a17:90b:3b4a:b0:1ed:38a0:d45f with SMTP id ot10-20020a17090b3b4a00b001ed38a0d45fmr8112619pjb.87.1656214944111;
        Sat, 25 Jun 2022 20:42:24 -0700 (PDT)
Received: from [192.168.1.67] ([107.126.90.40])
        by smtp.gmail.com with ESMTPSA id x9-20020aa79a89000000b0052514384f02sm4297737pfi.54.2022.06.25.20.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 20:42:23 -0700 (PDT)
Message-ID: <cc136daa-b820-96c3-b5f6-c2c13690f2e0@chromium.org>
Date:   Sat, 25 Jun 2022 20:41:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 4/5] arm64: dts: qcom: sc7180: Add pazquel dts files
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220625022716.683664-1-joebar@chromium.org>
 <20220624192643.v13.4.I41e2c2dc12961fe000ebc4d4ef6f0bc5da1259ea@changeid>
 <CAD=FV=X+92d+PvrHENT3g5=hkJ_UaVWHgMHyuvn3erg10DpVAw@mail.gmail.com>
From:   "Joseph S. Barrera III" <joebar@chromium.org>
In-Reply-To: <CAD=FV=X+92d+PvrHENT3g5=hkJ_UaVWHgMHyuvn3erg10DpVAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/25/22 7:45 AM, Doug Anderson wrote:
> * If you want to try to do something like this, it should be in a
> separate patch, probably at the end of the series. Then if people all
> love it then it can be applied and if people don't like it then the
> series can simply be applied without it.

Right now I don't see *any* device tree files for *any* architecture
using #ifdef guards. So introducing them and selling them seems like
more than I want to take on right now, especially because I assume
they've already been proposed before (given that they are such a common
idiom in C/C++).

So in v14 I have just removed the #ifdef guards.


