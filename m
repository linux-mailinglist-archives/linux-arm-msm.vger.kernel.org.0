Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D887D2E29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 11:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbjJWJZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 05:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233042AbjJWJZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 05:25:43 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA18E10CE
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 02:25:40 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40837ebba42so22529915e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Oct 2023 02:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698053139; x=1698657939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nW7i7b8vhIed47V4oIjE0BLCMbc+AJZblIGq7PmcJLw=;
        b=vvznWHg4H/k/yMBpsXXrEDoPXAEF0NIpfM4NlGG/6VCP9Tanq/K6u9S5oq0UvyoPuk
         15INw/7eyUN4H55/2AUDf9If7hX5xNWWuxqebkN8f2gXcyw60NH4IUk8msqmsjWEQYLB
         2gPDeydYkegR/as9vfWYWV9z3qdNU7X3MIwNTMJesOy/0NJw/vdlpfHqQXAXFhuptcAP
         mOYG+NxwLdfMp6Dk1mtXd3UOhLVn5+nf6a/3kmFAQe2jCEtxwQP2qCuw/1L647SV6ym4
         G2/iotsrGOrAXrhG8mnJbK0KZeqn+HqSSbsrGv1YF1iicHwL7hYWH9mUoPcYWTF5+2iJ
         jLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698053139; x=1698657939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nW7i7b8vhIed47V4oIjE0BLCMbc+AJZblIGq7PmcJLw=;
        b=DOz2KyTSKMS57qTIqmy3SRi1w+YViADb2oCPnSARAGiWQVRNaMH5ZaIi3Vdz2pxwNW
         hxJ1+EXTYofzOMkQdwTUkWvE1dz/MN79Y4rkoB0zyDI6udvEkzt9aNl3YOa2vGF9Ar7O
         3dQsA3CJ7RNE6yRZWjjW58VEVnuGm2GiJ6XBDhJDiTTsh1Cb34xeV2mx5CJXXKpHvB9C
         Vah+y/OA4IFomnWCZc8zvu7sNS3jPc641J1mEy0/cxOF8QJiOSgTL7br2DeVYrDlMSBQ
         OQF+EFTYn72iRzCxOzVNTwHs/rwM2U/Eq7azedFS5WkzRudvTZD5F+NXSy2d0zf4jVgS
         53Hw==
X-Gm-Message-State: AOJu0YzuorAgEa4QiRS2ie4CW+QS3sAPPzjrLiIiarYyGfLsNMj0q9mt
        a8FEGN605yQMFxZApXAwcMVxlw==
X-Google-Smtp-Source: AGHT+IFt6bH6eWAWqYdvbo82OTM0VsELjJsDajLCqJ5B8zgFbysym8oqDmMe3V7OGWNFqSaw0jxu1A==
X-Received: by 2002:a05:600c:450d:b0:3ff:233f:2cfb with SMTP id t13-20020a05600c450d00b003ff233f2cfbmr6412466wmo.23.1698053139208;
        Mon, 23 Oct 2023 02:25:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c418c00b0040773c69fc0sm13481557wmh.11.2023.10.23.02.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 02:25:38 -0700 (PDT)
Message-ID: <70072874-6fa8-46ba-bf26-c35aa6ec7bb6@linaro.org>
Date:   Mon, 23 Oct 2023 11:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] soc/arm64: qcom: add initial version of memory
 dump
Content-Language: en-US
To:     Zhenhua Huang <quic_zhenhuah@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        quic_tingweiz@quicinc.com
References: <1698052857-6918-1-git-send-email-quic_zhenhuah@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1698052857-6918-1-git-send-email-quic_zhenhuah@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/10/2023 11:20, Zhenhua Huang wrote:
> Qualcomm memory dump driver is to cooperate with firmware, providing the
> hints(id and size) of storing useful debugging information into pre-allocated
> memory. Firmware then does the real data capture. The debugging information
> includes cache contents, internal memory, registers. 
> 
> The driver dynamically reserves memory and provides the hints(dump id and size)
> following specified protocols with firmware. After crash and warm reboot,
> firmware scans these information and stores contents into reserved memory
> accordingly. Firmware then enters into full dump mode which dumps whole DDR
> to host through USB.

How does it relate to minidump?

> 
> User then get full dump using PCAT and can parse out these informations.
> 
> Dump id and size are provided by bootconfig. The expected format of a
> bootconfig file is as follows:-
> memory_dump_config {
> 	<node name> {
> 		id = <id of HW component>
> 		size = <dump size of HW component>
> 	}
> }
> 
> for example:
> memory_dump_config {
>         c0_context_dump {
> 		id = 0
> 		size = 0x800
>         }
> }
> 
> Test based on 6.6-rc1.

I don't think so (or you miss yamllint).

$ git checkout v6.6-rc1
$ b4 am...
$ dt_binding_chec

qcom,mem-dump.yaml:5:10: [error] string value is redundantly quoted with
any quotes (quoted-strings)


Best regards,
Krzysztof

