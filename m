Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9AB97C5237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 13:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbjJKLgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 07:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbjJKLgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 07:36:02 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD7898
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:35:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c007d6159aso80148721fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024158; x=1697628958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfU6ATFelrGu966VZVs/blAhCg+Ba8qkIlUWqDpamxM=;
        b=nJYYvnrItx07ylnqmU6Yqw21DH6o0xsnEzFr7EHRZJXDxww8PnP9jAJPnGltO6/Z4T
         lzierFc0lE+8puAu/shdeuSP1BCDcbGqDL42ZO+gVR5EmAt3i3C32FAO7w6EbSnZfkYp
         3wTNZq8QOOBuBByhMFwwOc7r/DJHRN6QcTZZfOaquJgEssObpkU2P7hTMwJGsej0lPUE
         Zwaik8hQyZqR1MLYu+J/st1wzgls8NJOi2irDfQg+op33neopZGhQ/3UOezqeP1QtcUz
         EVHPfcdQkm1ZHq1yIgIvR/0Rld/6ItmdzADVV4c2Edsw0nJTHtwQjYzJr2rLVdzLIQXY
         OCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024158; x=1697628958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfU6ATFelrGu966VZVs/blAhCg+Ba8qkIlUWqDpamxM=;
        b=YNRsIcyCsxT0VUn0sEIQXoRkGkeZoeqSTHGrfHL4f3PPnNiWJzNctD1Mh070yyp7J/
         4Us/EyTA46lzqAfgv8kU4N05xyEpzF4PvMd5m52Cw7CKgjWDbeyAzVH9skyRKu3PPQ4C
         2v5KqJffG9mAjisF/LCxcM/O6Dqwm7lP0YhR3pRkMtnvpgQxx1mWDg/vQN+htvoOfccd
         LzsvdLlJrD9NKPPuziunV5yDqYSddOkYUKFSxj511R8ub0nvYBU0uVYd0/6HWxNMuUKK
         mFa1mq3UuGSSk3x9jMgcLf6eI2Z/e40HStWPZeM05u7Jdox/yB4pNwop4bjw0O1Rhz3z
         EP8g==
X-Gm-Message-State: AOJu0Yz4ckU5r4+nMFYeLZWOi2wf+hOES7RCHrGPmpnNTIyI+ojnD43a
        RABivFoCuClhXiJzSHFmPu6gWw==
X-Google-Smtp-Source: AGHT+IEBaybj1t+dM2dbVVaw650KkAnqX2ygF1+tkCcOl8TohGtw/R9IYJXv5TipuD9uPEwiyFb/iw==
X-Received: by 2002:a2e:9e19:0:b0:2bf:f989:b8e5 with SMTP id e25-20020a2e9e19000000b002bff989b8e5mr16412060ljk.33.1697024158103;
        Wed, 11 Oct 2023 04:35:58 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c5-20020a2ea1c5000000b002bcbb464a28sm2882350ljm.59.2023.10.11.04.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 04:35:57 -0700 (PDT)
Message-ID: <21adc424-22e7-4469-b363-41e99f29c3bf@linaro.org>
Date:   Wed, 11 Oct 2023 13:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable DisplayPort altmode support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
 <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/23 12:32, Dmitry Baryshkov wrote:
> Enable the DisplayPort altmode, it is required to get DisplayPort output
> to work on devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Weird nobody enabled it to date

Reviewd-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
