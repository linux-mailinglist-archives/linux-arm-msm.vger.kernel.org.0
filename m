Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4834B74C1A1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 11:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjGIJEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 05:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjGIJEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 05:04:49 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 961101A7;
        Sun,  9 Jul 2023 02:04:48 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6f9edac8dso50550001fa.3;
        Sun, 09 Jul 2023 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688893486; x=1691485486;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDAVQVE7i5HJrgwg4ypcuSA1w6Eq0KSm6HR176SUj7Q=;
        b=Gca6VCzVzid51H9CoqvvqUxw9ty4qTwoQ55liG4Ki7LCwIE4QoVivs2BuYtNqNsSxw
         XOmtX4qrDzf3GuZfZyR+eYHnrUTnH0uWpky6goHTFDHjQ05ElAKhkmg65fkiCI51J5oV
         ortNpZ5d2rgGU4x3v6Euxly4SID+yBUCZRKQKqqn3FaJSzjUpSnTCQERSDaYVISuEe0G
         EGM6wbXCCKy/kuPNBxK7GKCGL4pExohOT0UqJNc+qqKawjdWapHlsgi3bZcq5suHviCk
         EhEr/znBn0eD9vrLSSkvfKDZPQbQYTBuYqIVOf+fMTqYJwjNM5LgtTwQOAFjiPy1G2c/
         4xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688893486; x=1691485486;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDAVQVE7i5HJrgwg4ypcuSA1w6Eq0KSm6HR176SUj7Q=;
        b=fpp2aLQSCmZg5tuJ8ZIBA91CL9dmKz8PPfqKe7h4cUG2eOfUpeKKdSGN2CgICP5drj
         mBwGJe7rnzubdb2I9gW6XUXUPJD0j03AEk7ExBnvF/tCTB3vYjgP0vTOC58H2fUxxVAU
         90UDdcQTsmhifh7XVr7pqk/08jo+5SEBDJKDkB4zzpZf/b5NwI2c8q2RUvOnjC6v+JgF
         1OUTgQkDNyITemKupcOwDBHMMzUVno2p+/nKoooHivr+NjoZli4e7Ufgx/iJsOBD8FLq
         ZvIE7VPkTKcZcfRCbjYGu1R8UjMVpZuMbsEAcMkvpq1R5+7Rfcr3FtKqr6MkoHwoPf7A
         9iqA==
X-Gm-Message-State: ABy/qLb6D1MZWVs5jmexH1qQHvmICaf9L0Vc1xSP/H6K4o19RMPOTPBs
        GHY5yNearc7lOEzBlJ71mx+BYGCvSDg=
X-Google-Smtp-Source: APBJJlGZH+lUxWiZHXepUqaUDyONs6bxMqbRU+GVKlYDbap5c3V+tMwwFMFdR3C22RIo+VwiWDdnXA==
X-Received: by 2002:a05:651c:120c:b0:2b6:a08d:e142 with SMTP id i12-20020a05651c120c00b002b6a08de142mr6715474lja.7.1688893486363;
        Sun, 09 Jul 2023 02:04:46 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.87.96])
        by smtp.gmail.com with ESMTPSA id l21-20020a2e8695000000b002b6caeb4b41sm1475080lji.27.2023.07.09.02.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 02:04:45 -0700 (PDT)
Subject: Re: [PATCH] usb: typc: qcom: properly report Audio Accessory mode
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <af93adaf-eb17-4aea-3811-30b1fe80e151@gmail.com>
Date:   Sun, 9 Jul 2023 12:04:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230708213617.3759954-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/9/23 12:36 AM, Dmitry Baryshkov wrote:

> Detect and report the if the Audio Accessory device has been attached to
                    ^^^ is it really needed here?

> the corresponding USB-C port.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[...]

MBR, Sergey
