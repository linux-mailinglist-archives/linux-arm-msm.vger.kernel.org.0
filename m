Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC714FEC17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 03:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbiDMBLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 21:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbiDMBLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 21:11:09 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5BE255AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 18:08:49 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u3so460333wrg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 18:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VU5r7TQe+kzCpo6+x3wYOqueqHwLs3nbsTBlPuqzXFI=;
        b=CKWJIotoLnybWW93eWtrAo8OqpApPdJpcRzz6y+IGecTh/hCsYeaM7rzwxb0/tmDef
         81K8YVWx5kztndO7wbLj25byhhBTVxv2pmpSq943F5VHLbBI5ofeZMkLpbtmsvZIVg08
         nCWLSFjESvEHJ8DMpSVL8gDg24aEqCdm5co2adilRsdRqkPPROS6d9lJoi1auHh97Lvs
         Kp57sZEG3BNxB/dU7O3s+ueKocEyifUNUtx4rWXKzRJeLG8n9eKJ7F3IHHAQx5fHXdr6
         cz5n6MrD4XbscQeLE+ymHTfjrOC4r/AXYeTk7SY/cV0PeThuFH0qkZNwZbfXezboAusp
         DfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VU5r7TQe+kzCpo6+x3wYOqueqHwLs3nbsTBlPuqzXFI=;
        b=DgVAYBGVDi0innR2jqt4e80qKHnTLmViwlePYIPr9H1bbPTtNolnBV7RtY8B5yVSk3
         gRveI/4qtVVV7z6GAFQhUpBLXjw2ORW0heJix0M4fdX90B1ZF8g9OfByml97XfIPeQms
         ykH3LE93rTaEgmQIp5RzW7Rf1i5oFR8n4UT+EMBU+PHUmSe3CdxPCYMFZT630UIr5DqH
         bl7GN1P3FTbXL9y3Z1pmVMdZYVZqomZ+SaQNMlFAPJ8YxAc6W6oy3gvwnxJIvTLwjevD
         SZjqLHMXGEOq/poliYASIUN4VGs5Ad1h0jrJsGGKIuaYzI7dbqWkFM79JK08XV5c9LZm
         MjnA==
X-Gm-Message-State: AOAM530WC4AfDo9N0yeZeQRVqxjKMH9ORCSUanvaUyK0KaDpwU9c4F8r
        PONVwwzCYDjCZrTggDfmGeu87Q==
X-Google-Smtp-Source: ABdhPJyjm21c680qbYcFuPavs+X5tinpqI/VfaemT4HDgSz6dCizfF5bj2lCdOjrX6rhgEH/6dx2oQ==
X-Received: by 2002:a5d:6487:0:b0:207:b12f:2da8 with SMTP id o7-20020a5d6487000000b00207b12f2da8mr3356401wri.203.1649812127716;
        Tue, 12 Apr 2022 18:08:47 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id ay41-20020a05600c1e2900b0038e75fda4edsm844654wmb.47.2022.04.12.18.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 18:08:47 -0700 (PDT)
Message-ID: <0617782b-e24b-cd67-ffca-5cf95417ca21@nexus-software.ie>
Date:   Wed, 13 Apr 2022 02:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8250: camss: Add CCI definitions
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
 <20220409164556.2832782-5-bryan.odonoghue@linaro.org>
 <YlTeng8OcnvUnILZ@builder.lan>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <YlTeng8OcnvUnILZ@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 03:06, Bjorn Andersson wrote:
>> +			pinctrl-names = "default", "sleep";
>> +			pinctrl-0 = <&cci0_default &cci1_default>;
>> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> I would prefer that you include these in the same patch.
> 

You mean the CCI definition and the pinmux for it

OK, yes
