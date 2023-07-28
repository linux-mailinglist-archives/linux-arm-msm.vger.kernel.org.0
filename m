Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78825766F8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 16:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbjG1Oed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 10:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbjG1Oec (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 10:34:32 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F20E3A9B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 07:34:31 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so22697665e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690554869; x=1691159669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQHJGwayOc+O4cksaa/ROvfn4y8YSDZc3qnYsF4uZqw=;
        b=EcDu3WAIxaRhO63H6hHNuwo0THjAYjbMikEkGUQleSFNeDnX2Xs8wV8hGhlfUFpIzC
         1fB6D0X3Ixg0+E/n0cVN/p4U1JhENLqx88d50pw4If+aZ5LzlzVGoK+cLSYwsAjkLhIt
         yIQIh4qQuSnWqwoI+Cus5tVTn/KZauSQsSh4pruFKtZ1Q6L8Nd2JFVLulSe4xmzExqKQ
         LzUdpE0t9s/RGbV2tA/8bQOlJweepTEDuAaCmhZUpnFeYDhC4KPSlM105luoEPvRgPoW
         QZ/ni93CT1E/ipM5l51bH84R3mIT2Y/HtWfc+04p6ND9z+6k6G00UekHetqjN+wxLnnx
         Cavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690554869; x=1691159669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQHJGwayOc+O4cksaa/ROvfn4y8YSDZc3qnYsF4uZqw=;
        b=IsuBmgB119LGFGsxZ8j3NeE80/8LCagt4tmh9c6PhO4dQcS8Rs4nxbNbls1gO7fedc
         6eHF35d3gxPoImCea4pAkHaL8DDXNRNa7kFVA02ojQsUU/Trlt1o2Xp71WyKvQYZBRe+
         pn0nrhake7KNVgpFM8KkZAGvVPkGyRdJ0OkXmqSWJdg7SdRqyqxR/XAsLpPSWVooB1ZP
         C1s93B5dfepqHFXgPtuVL3USaAWPbdankXIq5BVSTir5KW8dGnxQgYDzN+Mq4oEjAQek
         CAIi1nRsqZEi7UqJuBFmDSm9p1kfvu5ets6l1MXR5NjKoExsMQPr1TmrHZC739Fesw8I
         8SCw==
X-Gm-Message-State: ABy/qLY14WLAnaEZSVzdT7AafWubyrmIMSejnJPeZsSt8ilvmonvPawc
        QyE6LTzASFwQkZDm3wiQWKwrdw==
X-Google-Smtp-Source: APBJJlHqVdMI1zH3ei216nTKTJ3P7/3y7iqzi2E5C3bdueCeKqiWOkVS6ktlrc6U9SJzoyMWV+O1+Q==
X-Received: by 2002:a1c:7216:0:b0:3fc:627:ea31 with SMTP id n22-20020a1c7216000000b003fc0627ea31mr1875553wmc.38.1690554869645;
        Fri, 28 Jul 2023 07:34:29 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id hn40-20020a05600ca3a800b003fbaa2903f4sm4378117wmb.19.2023.07.28.07.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 07:34:29 -0700 (PDT)
Message-ID: <f5ffae25-fcd6-b4a5-5114-3b66db5d7c31@linaro.org>
Date:   Fri, 28 Jul 2023 15:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/33] Qualcomm video decoder/encoder driver
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        stanimir.k.varbanov@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     quic_dikshita@quicinc.com
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/07/2023 14:23, Vikash Garodia wrote:
> This patch series introduces support for Qualcomm new video acceleration
> hardware architecture, used for video stream decoding/encoding. This driver
> is based on new communication protocol between video hardware and application
> processor.

I think my main comment and question for this driver is; what 
specifically about the sm8550 requires an entirely new driver for the 
venus block ?

We have a re-implementation of the HFI as an example.

What are the specifics of the technical barriers, if any, that preclude 
adding or extending the existing venus codebase to enable the new silicon ?

---
bod
