Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C08767547B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jul 2023 11:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjGOJUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jul 2023 05:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjGOJUX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jul 2023 05:20:23 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEEC3A91
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 02:19:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b7441bfa9eso33761101fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 02:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689412782; x=1692004782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uU8z7MQTAseycVhm4xqzUABfIdWki0oWoHTG+Qvxumg=;
        b=E/QxtJJg7rHSK74wng1uBblyEJAvHyi9rIbOgRvmnrOqdTePkkIc2d2L1EsBjf+7/w
         szSVY+/9ELsj/2AW7y0eBokhMRI6+cyyLOIcrNNRy9G4Y6ysojkjK05kfoWIqYilKlgU
         EEjI4dtteU2DbNPNWQ47hWuu7jAVoaoR1PN5SfXGBKMzpie0KKFwsScCi2kf9Cd/tFRo
         CNGiQ0rWp5O2EBVdN+jfPBwJpzhAtT2MMxcsiGZ39PMQ0SyqUXSJh4/gk/7Gyl8DUtFF
         JucZWGefkiibHvhP6VY+B2C0LxJj7uOvPTlTKa2lhyzLhNIw3fZ1I8/sbGg84wA0SunG
         mokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412782; x=1692004782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uU8z7MQTAseycVhm4xqzUABfIdWki0oWoHTG+Qvxumg=;
        b=lAotFzwBrEE2a9UHkw4YllzXhsr/vnd7my+0zKlnL+eR+O8Ywc2IrooB03zrbjn0n1
         THmVDNeLUi60/12LhFn2+xlDHqOIygQ0MIGCPAe9wiswSfPOJ0xRfgxvdLgzfJKmlbO1
         0zyzk1jDbfazXL5RHO9k2ECx9pIobZAIUsmMMvGypJaTxsitgl8wecW31n6hTBdONswk
         70GAX/GO2EAS2UbyeTZq4kbGAhE422XrtCT4xHyztCgKzbvH56rswQaJrtpXeHGRPl6q
         mHUBX2UZonO3VFtpdhAJD4zQL11T17ntgpCm9ZwFh7d10ef3SMAapM6zS8Y9GPmyvqn4
         g5cA==
X-Gm-Message-State: ABy/qLZq3AaOiXK0eq8RmXLH2gMbu17b+0zGXi26cqM1n34gOJE0QjL1
        2NdSjv4GNfc9tRYEUcwwQCwwMA==
X-Google-Smtp-Source: APBJJlH5qiMARhz72CyMoSOuAfv7V2ZINmpLIFogNEf03pLosGVr8PzBltaLAaiBJUlBF7z/ficHOQ==
X-Received: by 2002:a2e:9f46:0:b0:2b7:18ff:946e with SMTP id v6-20020a2e9f46000000b002b718ff946emr1564213ljk.25.1689412781998;
        Sat, 15 Jul 2023 02:19:41 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e9b8d000000b002b70206cd45sm2391907lji.90.2023.07.15.02.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 02:19:41 -0700 (PDT)
Message-ID: <de6b5727-e15a-5d59-9b79-6ca7b01c8d63@linaro.org>
Date:   Sat, 15 Jul 2023 11:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] serial: qcom-geni: fix opp vote on shutdown
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
References: <20230714130214.14552-1-johan+linaro@kernel.org>
 <20230714130214.14552-2-johan+linaro@kernel.org>
 <e99b5975-b770-5460-1ce4-cd4eb1a50291@linaro.org>
 <ZLFk1Q0pTfYmB5EU@hovoldconsulting.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZLFk1Q0pTfYmB5EU@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14.07.2023 17:08, Johan Hovold wrote:
> On Fri, Jul 14, 2023 at 04:29:08PM +0200, Konrad Dybcio wrote:
>> On 14.07.2023 15:02, Johan Hovold wrote:
>>> The operating-performance-point vote needs to be dropped when shutting
>>> down the port to avoid wasting power by keeping resources like power
>>> domains in an unnecessarily high performance state (e.g. when a UART
>>> connected Bluetooth controller is not in use).
>>>
>>> Fixes: a5819b548af0 ("tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state")
>>> Cc: stable@vger.kernel.org      # 5.9
>>> Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
>>> Cc: Matthias Kaehlcke <mka@chromium.org>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> ---
>> I don't know a whole lot about this subsystem, but the PM call has
>> a pointer to uport which already contains this clock rate.. Is it
>> zeroed out by the core before we reach it, which would prevent us
>> from reusing it?
> 
> No, but this driver has other issues and I couldn't be arsed fixing them
> before addressing this bug.
> 
> Specifically that uartclk variable can currently be set by userspace...
> 
> I'll fix that up next week.
OK sounds good

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Johan
