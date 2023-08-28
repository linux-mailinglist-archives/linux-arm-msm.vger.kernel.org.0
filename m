Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1D478B89D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 21:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjH1TnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 15:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbjH1TnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 15:43:22 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFA0BE
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:43:19 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31c615eb6feso2950427f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693251798; x=1693856598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xt41DQFO0E5wBX3ReoViKyO+8YvvVKX5ZH0MmV7uKEE=;
        b=nw8QQMqnU0I3O3PLLtsAB+TBiEZCgHLiszRLLXQu3wvNMAGrxy2PB5nIZsvw6JlduJ
         KUrb9geySRuQ7IPeYmm4aac2kRDOo+vL86J882/682Sk534zn/MzBHoDFIiMTJbQSwSu
         kC18H+wOZvYNqsmVfvoC8qtgCpZXpnyyJ61pUF+7N9mciomOj0sk5sQl2PNja1NmgkB9
         5hd2DZRRmw28bw5ayPElAeoK90V5Yg6kcwpJJPBvYIpH2lVd84JVBPAH6J+rf5lW14WM
         yGNMKcK05gVc2cN8oQuIZf+Sbar6uM9RqTRmOagLcVzMmiy5bNblA3+Qbk+sLhnQV0sT
         wJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693251798; x=1693856598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt41DQFO0E5wBX3ReoViKyO+8YvvVKX5ZH0MmV7uKEE=;
        b=godil8Zgp0v1aoqQFRDDVK752ZXG7HewXUt4hbsAlDyFkyJC+lf8kgU8aXjQi+T+zF
         GESEDjimJy+2cTWUggYU1XwBQOhAXRPkzD48i7orIvl8SSDzYjDCcoFBxcMsa+t5tVGI
         p6Wnv0GokN2PvgUsUJ3mEIJVl2YTBw6K23FYZjtZUxmCY/N8LuKI3/Mz6p6xJJK3g6J9
         y+rf2aULeA8gRuf/BQ+VCG1sppcoTxFLKavJe7H4gpYlXdbfapqWQfVoY3Ci1u5PISg3
         f4RzOi2KDSB6fgHQKa+mZQ6KSPtFmPRgl+6kJobjrTpoGMBEw8LJ7cKlv3xpnZ4tVd0c
         STMQ==
X-Gm-Message-State: AOJu0YwmhK/liI2tR8Rf85XqfFdrYTeQ3bZcpk5R1JQoGQkjzykyOT0X
        N1/HQ59W2SXhxQdX4DxWH6M+gA==
X-Google-Smtp-Source: AGHT+IFKWGeVbvZgbRjNYEzVCsVwYnw4fy+HcidNACsqMMB0KQzrVRMPWx7VfQiKE4MbxfDzYncpAg==
X-Received: by 2002:a5d:5308:0:b0:316:f24b:597a with SMTP id e8-20020a5d5308000000b00316f24b597amr18442733wrv.46.1693251798278;
        Mon, 28 Aug 2023 12:43:18 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w14-20020a5d544e000000b0031c6581d55esm11407201wrv.91.2023.08.28.12.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 12:43:17 -0700 (PDT)
Message-ID: <7a6222f2-a9e7-1c96-b92b-b21e6c76c205@linaro.org>
Date:   Mon, 28 Aug 2023 20:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/15] media: qcom: camss: Untangle if/else spaghetti
 in camss
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
 <20230823104444.1954663-9-bryan.odonoghue@linaro.org>
 <20230828185110.GN14596@pendragon.ideasonboard.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230828185110.GN14596@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2023 19:51, Laurent Pinchart wrote:
>> +		break;
>> +	default:
>>   		return -EINVAL;
> This should never happen, as adding support for a new SoC should come
> with an update for all the applicable switch/case statements. It's
> useful to let the compiler complain if someone forgets to do so, but
> with a default case, you will only see the issue at runtime. Could it be
> caught at compile time ?
> 

Off the top of my head, I don't think it could be easily caught.

An assert() would catch it early in runtime..

---
bod
