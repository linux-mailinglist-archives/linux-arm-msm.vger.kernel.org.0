Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA2A63FD73
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 02:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiLBBEE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 20:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbiLBBEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 20:04:02 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1382C4CCB
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 17:04:01 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bg10so2505046wmb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 17:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkMHgcMC23NVa3D2o+z4LWRbMMOwhIymRRz6fV+SEC0=;
        b=xSb0XCTl+9oPa+7SNjxPGux1Cm2JA/M4JvzVL3OAQb67v2s6vgBRONUvl5ObHW0X6A
         35YlZnUBqnyzUDM8TgNebrg0fPlCsUJw/oTmulC+NR5gLtHXbXyB+Kq8Ad3nX+wjf3bc
         z53kt9Hvaafe76f2N3c/Ht4I92+uUDQAlbMF0GBDxePgk1KRXuiSpS7r46EkQ/uaO324
         +8XELzuhJZdj01V8ba1gBnlFpNj/Q009DQvusyaJBSW71T4RHnq1zWUuDR25s/d+lbqj
         m3QnjerAminA96a1hhCj4XaK1OYGUDUi3vQ3NtSJYZSOoO0MxcXHL04P9PwDOiJYt1zW
         aCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkMHgcMC23NVa3D2o+z4LWRbMMOwhIymRRz6fV+SEC0=;
        b=p/dhBOrvGPYjyJRBTZ5OWl8aDH1wR1d2XXumB0Y7UvcksKtn93489bUqWG6qssuC+6
         ZPKl5YUS1tvs4Sj/bGD5fGQizy+sY+MBxd0TL5xVSUE/Vs1QA5m18yFM6C4Y93VlCMU5
         EfvrqqFJiDUliF6O9Wo3lZ6ZXmN94QSC6BHbTESqAVxaNwbOQDR5/O0SGHM8Mihmy9Jf
         BqgQlTEoyCkHnGOXgiz/+Ytqo/8Cat1ogi5BnxxNnH8hA4c7cNWo7mTEUGkJg7gXDQbK
         dvGWdjVBGSYoEPgxYKhQao0q+9jpzNw2RdWJA48RuyBNeclsRhqDH8ci15jVnFiHC1Sp
         +3zw==
X-Gm-Message-State: ANoB5pmICFnqTylaRAqKeGfTRANT7SHsXGTJwuQadI/Y9P1mexzCnwCc
        +0kDhd6Dy2b8qichr8VKYMsmYw==
X-Google-Smtp-Source: AA0mqf53U8lRH4PvxGNMIqTcDVRfwFkVaMUq7tC+6q/2YssQgJw5lBFGdUf4iWIFDxp29KnWGuAfiQ==
X-Received: by 2002:a05:600c:348d:b0:3cf:88d3:5685 with SMTP id a13-20020a05600c348d00b003cf88d35685mr43915981wmq.38.1669943040153;
        Thu, 01 Dec 2022 17:04:00 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c424800b003c5571c27a1sm8026676wmm.32.2022.12.01.17.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 17:03:58 -0800 (PST)
Message-ID: <be362066-520a-b0d1-0313-3dbc867b561b@nexus-software.ie>
Date:   Fri, 2 Dec 2022 01:03:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/1] venus: Enable sufficient sequence change support for
 sc7180 and Fix for Decoder STOP command issue.
Content-Language: en-US
To:     quic_vboma@quicinc.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <20221115121237.28361-1-quic_vboma@quicinc.com>
 <20221115121237.28361-2-quic_vboma@quicinc.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20221115121237.28361-2-quic_vboma@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/11/2022 12:12, quic_vboma@quicinc.com wrote:
> From: Viswanath Boma <quic_vboma@quicinc.com>
> 
> For VP9 bitstreams, there could be a change in resolution at interframe,
> for driver to get notified of such resolution change, enable the property in video firmware.
> Also, EOS handling is now made same in video firmware across all V6 SOCs,
> hence above a certain firmware version, the driver handling is made generic for all V6s

Could you figure out the right Fixes: and Cc: stable to add here ?

---
bod

