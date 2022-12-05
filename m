Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE377642E16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbiLERBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiLERBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:01:32 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81BCDED0
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:01:30 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso12197756wme.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1bH82as0TymTl0ZEDG2TG5IStC1ual8UWGPfqgGdaM=;
        b=njaCyQcBmNVBRlWld/ts4WzWQHWsU9NS3I5kp87petpl9moL2bt1GgZ95lJaVrjUQa
         D+lk2cBo1SSbe5wqRecexsLrLLgBXPFNKf8qR/LpzzLdKMISrGbIjQleitxbDfnk6iFP
         y3gHFu4ppuFePkG38Vea55fNrnOepKWbVjEGkra6G5me5QmYAypEi+X+XZwAEgIBNYpm
         hNPrXoU/VFen5RWDlk/CBFlvYZCChf58etl1iPAMSlXlCMl2ZGxvumvaNTcy56z1J8Zi
         kBdMuz7C0wvHMBzNfXo61nbvFSnXPWcbqJdN0ZVGbJeSeacjs3xmx0YrfY+nqAWFep11
         1rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1bH82as0TymTl0ZEDG2TG5IStC1ual8UWGPfqgGdaM=;
        b=8DEYIevx9Nk35onjbXA+AmQTIsgkXfJ+cJWNrSKlX8kk/gffPY+LagxGwRD/Naq1Jq
         1IQ3cv/IjZp2seUXXFkPkSUaFusF9+Lqem3k78dQ85/sDx+8eeF7O9vVwE8k07lsJwlP
         WwcnObbFGRy0EEVaoIp9+lIqONERSZdq7zY5th+c1MedgrxrAAuG8u4jRzq5LtqpiRjf
         YV5U/Iqf/0yYXp+j/AwzOO7RAfJTdjIzgVfcF66WX6DdUbTM1f0Y1dfa45p31TeBbOMV
         3u0Lx5JqQqH9vl1Jjrf4hR7eTnfuoU+i4HMCYQ4nUewmJjCrikqZdyebIPefKbnzKZCm
         auCg==
X-Gm-Message-State: ANoB5pkslqyHPozCQUdNkxi2voz3rhDCtvgwRbmYlj1RwRoUtW5brqTo
        Fw60JIR2Kihrk/fqzjg2PZ5WQQ==
X-Google-Smtp-Source: AA0mqf53bfzA9AieNtDbIrmBST6ghEnayjduNEMBYAgY36ppKn2iy/uiI3h7IFvVgp3V9ktVUyEw+A==
X-Received: by 2002:a1c:7504:0:b0:3cf:6b10:ca8d with SMTP id o4-20020a1c7504000000b003cf6b10ca8dmr65260767wmc.44.1670259689309;
        Mon, 05 Dec 2022 09:01:29 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e25-20020a05600c4b9900b003cf4ec90938sm17082963wmp.21.2022.12.05.09.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:01:28 -0800 (PST)
Message-ID: <556407bc-8ff5-e929-9eff-aa7b4328f095@linaro.org>
Date:   Mon, 5 Dec 2022 17:01:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 4/4] media: camss: sm8250: Pipeline starting and
 stopping for multiple virtual channels
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <quic_mmitkov@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, akapatra@quicinc.com, jzala@quicinc.com,
        todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221205152450.1099-1-quic_mmitkov@quicinc.com>
 <20221205152450.1099-5-quic_mmitkov@quicinc.com>
 <846f56b0-2591-318d-cb37-99cbf6d7bb32@linaro.org>
 <d1554eec-7f45-c513-f77c-7868943de2d4@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d1554eec-7f45-c513-f77c-7868943de2d4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 16:49, Milen Mitkov (Consultant) wrote:
> 
> On 05/12/2022 18:43, Bryan O'Donoghue wrote:
>> On 05/12/2022 15:24, quic_mmitkov@quicinc.com wrote:
>>> media-ctl -v -d /dev/media0 -V '"imx577 
>>> '22-001a'":0[fmt:SRGGB10/3840x2160 field:none]'
>>
>> I really like the improved commit log, thank you for that.
>>
>> SRGGB10/3840x2160 drivers/media/i2c/imx412.c that's not a supported 
>> resolution.
>>
>> media-ctl -v -d /dev/media0 -V '"imx577 
>> '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
>>
>> ?
>>
>> ---
>> bod
> 
> 
> Hi Bryan,
> 
> it's not a supported resolution with the current imx412/577 driver in 
> upstream. We tested with a different driver (with proprietary Sony 
> registers)
> 
> that uses this resolution that generates 2 multiplexed streams. It would 
> be impossible for pure upstream solution to test this driver with imx412 
> right now.
> 
> I couldn't have used the upstream supported resolution either, because 
> it's of a sensor mode with only 1 stream and that would create the 
> impression that anybody can just take this imx412 sensor and use the 
> upstream driver to test the solution, but this is in fact not possible 
> without register changes to the sensor driver itself.
> 
> Regards,
> 
> Milen
> 

OK fair enough, I think you should make a more explicit statement about 
the mapping of VC to RDI

Here's the real bit of salient information for whomever is trying to get 
VCs working in the future

media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'

The first VC msm_csid0":1 always maps to RDI0 the second VC always maps 
to RDI1

I think we should document that mapping clearly so that you don't have 
to read or understand the code to know

media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi1":0[1]' is an invalid mapping 
and why that is.

---
bod
