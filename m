Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857A56C3381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjCUN6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjCUN6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:58:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD9E59F1;
        Tue, 21 Mar 2023 06:58:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7D9FDB81670;
        Tue, 21 Mar 2023 13:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F205C433D2;
        Tue, 21 Mar 2023 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679407114;
        bh=YvYs273+TLiAgYyXJ++7SOFc95DJuhpwe0d/fxlc7BA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Ebr1TBD2fw76AqOTKcVzCH8jMzuTKpK2q9vFhCww6kANJYiBBZidJlokr+PElDN7E
         iLhtAhKVvHmWGPmewnrjwQLLmIekRSMZ7PfhYaTJdFiLaeUaSRhXMMo29wxvtn8rb1
         U9vWYsvJMJE52vHv47gJ/wiZuIl56bhqrwBAHMo21by8opWtRvpJmkmqqPw3dsrfS1
         goFBRjWkvBvrqjGw9rKyadGaNnOOBisChVr7kQLGbPALZhsKNKYaJ5QFDWABjJyfv4
         vhYCva+SnDTtL5xFOlYS65flbTSPNBRop/3H9tgGwXsreXR+DpnujVrRTDVPn0LGUY
         prD3nLQ4XuOPA==
Message-ID: <0af8ba67-f33c-4861-bea5-e662d19638bf@kernel.org>
Date:   Tue, 21 Mar 2023 15:58:30 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v7 6/9] interconnect: qcom: rpm: Handle interface clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230228-topic-qos-v7-0-815606092fff@linaro.org>
 <20230228-topic-qos-v7-6-815606092fff@linaro.org>
 <68a5d81a-5de8-798a-c150-d74c8ad38cb7@linaro.org>
 <f848061a-763e-fbf2-860c-758373e953df@linaro.org>
 <CAA8EJpqh+A_YKbhSQB5sWj4EP9eQtNHeohDira9o-jrx3pPRNg@mail.gmail.com>
 <51c41e49-5183-551e-c796-5b3d792b422f@linaro.org>
 <74f154b1-a440-fa83-1a46-a5b9223f5760@linaro.org>
From:   Georgi Djakov <djakov@kernel.org>
In-Reply-To: <74f154b1-a440-fa83-1a46-a5b9223f5760@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 11.03.23 17:26, Dmitry Baryshkov wrote:
> On 11/03/2023 16:38, Bryan O'Donoghue wrote:
>> On 11/03/2023 14:35, Dmitry Baryshkov wrote:
>>>> Its probably worthwhile experimenting to see if the*ufs*_clk can/should
>>>> be added to the UFS device list of clocks.
>>> While we were doing this for some of the clocks (PCIe and USB, if I'm
>>> not mistaken), I think that generally this is not fully correct. In my
>>> opinion it should be in the interconnect driver, who turns
>>> corresponding clocks on and off. These clocks correspond to the SoC
>>> topology, rather than the end-device.
>>>
>>
>> True enough, they are interconnect clocks.
>>
>> The question is how to only turn them on when the device that depends on them wants them.
> 
> I think we can turn them on an off from qcom_icc_set(). Each node can list required clocks.
> 

Yes, this is a bit weird, but looks like these are the interface clocks
required for programming the qos box of the respective peripheral and
nothing else. Maybe we can even configure QoS just once (eg. on the first
bandwidth request) and not every time we call qcom_icc_set().

BR,
Georgi
