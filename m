Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76506E44E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 12:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjDQKPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 06:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjDQKPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 06:15:08 -0400
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCAC59C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 03:14:21 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-2f4214b430aso850199f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681726290; x=1684318290;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCbAlk8AyvGATX4Pv1I/lzFLhKIIm/CJ4Jwv7PMT+EA=;
        b=sLKRvmhuvzeT7T4ho9X5Zvib982a7njRfWLXJNZD8C7FxiP5CLoIAec7t1Co1Byiix
         pSxb9UVo0Bb4f7FjQ+jvDuPtYNisLhH83S3bMuXULB+fuvdrb0Rx0GuKBTBCWvbAPFGU
         wWjr77P41A7Oal/nZn/Ha4TwaTRMytdyfdM/s3qTGeFeFVKtmYl87WWC2ulbt4+hrvv6
         UUevkDG/twBR0Bm6coFg0LDyjLX0OxihNf8PwHfmmiqZm79mdp6042p1Uynw/q4CN1t9
         yMfdPSCMNdebynKXh4QW5QkHqSbkn9px3UBIXka7ZffDO5x49fhNffqnojhAPyYBcpUm
         8wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681726290; x=1684318290;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCbAlk8AyvGATX4Pv1I/lzFLhKIIm/CJ4Jwv7PMT+EA=;
        b=YUb188w/8cfOk3yd3uzdD8uOiyM/BlQUWSKpQmtn/q2WcW5/kmLf47cGTROICVhLu1
         UOy1ELKFsLz/+29dMw9wCZ5eLR8lYgQEB7cGlJ5ZtLJQQLk2TS2GzPeXBwxI9hdCzD5h
         OHEMJkQcIwW+cmv6+WC+hIDtZS5vowFJEs8WmsRqKuHeXba5uizvtNufG9b9MKX/W5XQ
         l9sLT2eBgQXa33zphBYlNbJf5ieagjKvKsWr4DYitZmPjmrmGXr0Gd/J2BLNUu+2xbbp
         QcRsCha59NWfK9O3MeU3hjPtbE56+xJ2jgtf1ut+aOrE2fQdcsVkeI6q4HLlPXRJB8Za
         u0Kg==
X-Gm-Message-State: AAQBX9dlmab1ihG78TUoO6TyddAfRxO4DJGAXr/mZWbsua52GKHiz7oJ
        A65gwlnf8fukEjnCJrkfYqdrhw==
X-Google-Smtp-Source: AKy350Y60T3aPU1xswnKZ/DTjAOEEljioiBWIw1pk6n7X7XLI4Bu8U9YPx9NyX2sFE7TsFVh2HPhWg==
X-Received: by 2002:a5d:5049:0:b0:2f0:23bf:da7d with SMTP id h9-20020a5d5049000000b002f023bfda7dmr4482088wrt.29.1681726289884;
        Mon, 17 Apr 2023 03:11:29 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t5-20020adfeb85000000b002e71156b0fcsm10128276wrn.6.2023.04.17.03.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 03:11:29 -0700 (PDT)
Message-ID: <4c5d32d9-211b-b1ff-4d7d-7e951285efce@linaro.org>
Date:   Mon, 17 Apr 2023 11:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 00/14] Add Qualcomm PMIC TPCM support
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <CRVOZOPMKBX4.2T7FOCWF0RKBJ@otso>
 <10551f5e-4516-c0cc-0b04-73aa38f80a2c@linaro.org>
 <CRWA2OP2T6KT.RCWAVWF5Q2T2@otso>
 <ccc9fa4c-ca52-d8f3-a8b3-45031bea673f@linaro.org>
 <CRYUWMIJDSB2.BJWEPJEA3Y1D@otso>
 <75d00efb-ff3c-b1f8-a141-3fa78a39557a@linaro.org>
In-Reply-To: <75d00efb-ff3c-b1f8-a141-3fa78a39557a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 11:04, Bryan O'Donoghue wrote:
>    Unmount USB key
> 
>    cat /sys/class/usb_role/a600000.usb-role-switch/role
>    host

Sorry obviously confirm the data role before detaching the accessory :)
