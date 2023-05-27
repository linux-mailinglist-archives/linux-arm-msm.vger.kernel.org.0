Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0F7271361C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 May 2023 20:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjE0Sgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 May 2023 14:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjE0Sgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 May 2023 14:36:31 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047EDD9
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 May 2023 11:36:23 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3093d10442aso1099024f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 May 2023 11:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685212581; x=1687804581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxJBOiQXZR/v+58dTTK7NPVoqFSIxQSj92bydjr8LvI=;
        b=rjrgviG2Qw3eVzR2ufZmZmcYalh7HGv6WyQCLoIzQtgYzBoE3a52/aURpcJlrHqDuA
         QZQJfKHrhtx2U5YV/UJbGoJA7zOLc6zok78V0K9IRrTwXpEecSMNV19KzwfLMMVyurkm
         ogbFrGW/+ktm/bXbRJGQJ9wRgWWfkLA2KXp8BVUrvXEY7Ep/z/jxB3C91VAbT6JZ0fUo
         a/D+yP+LcDmwl+I80b3vtbX97JOvSMHjAc58PgUJw6fsZ3OfcmWZ1svrp8OCq5KDJWRQ
         Ynbe3Xs+IAQ7nzbeWs/0nluCShBn8BoC8V1VOV8P85FcD9JxrADzBX4xNJP/4b2/p5PR
         WlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685212581; x=1687804581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxJBOiQXZR/v+58dTTK7NPVoqFSIxQSj92bydjr8LvI=;
        b=V9K1ubZ0Duc6z6UgnXaVweScu0BSDrYHJIVgZ7DUhdXrolCQYHdbOt5YOWLkCH6AiW
         +uGbibUF+svTchnJX4P+VbQNps4yL4BGUuyAbQPzYnOsaJMZOkZi2ZIvdSN8tc/W1LaN
         AelDzssGdP49X07dSX664bj2snIxkvyb9S8lg7GkoTNaTckiUfWTHYVRmToISP/nD7W7
         yoF9CI7MFMYwqND8lSKcfFGjWsFmbTjLjw8+0I4C66mJlvcbdL2usvgz7MM1HGcpdPN1
         o7La+ZUDQ725Rk+kuBlt8ELSHUk03oklmNaFvHCpF1IXFVYIB0pRV5QaC+U9nlPgeozt
         PCEw==
X-Gm-Message-State: AC+VfDzZlFbxciTNVrCN01addULKZ7GEI7G3YoCRHmYd6rsA/1I2GJzX
        d3H6qFSKu2b/D6ad3KHZK4BJrQ==
X-Google-Smtp-Source: ACHHUZ7ZNR/c6+zfo6YzQpGmBL3nCowsxxOjPTeECwY80O9V+OD3/ThmGoCGbC4Z2SH2r47kNENkiA==
X-Received: by 2002:adf:e990:0:b0:306:32fa:6737 with SMTP id h16-20020adfe990000000b0030632fa6737mr4970346wrm.8.1685212581080;
        Sat, 27 May 2023 11:36:21 -0700 (PDT)
Received: from [192.168.0.79] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d574b000000b0030ae5a0516csm1259410wrw.17.2023.05.27.11.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 11:36:20 -0700 (PDT)
Message-ID: <cf6ecd76-aaaf-4d4a-f448-b33edc8ac93e@linaro.org>
Date:   Sat, 27 May 2023 19:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] rpmsg: qcom: glink: support waking up on channel rx
To:     Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <quic_clew@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20230117142414.983946-1-caleb.connolly@linaro.org>
 <20230118180133.vdfjkoxjb3hhdkjk@builder.lan>
Content-Language: en-US
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230118180133.vdfjkoxjb3hhdkjk@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/01/2023 18:01, Bjorn Andersson wrote:
> On Tue, Jan 17, 2023 at 02:24:13PM +0000, Caleb Connolly wrote:
>> Configure all channels as wakeup capable and report a wakeup event
>> when data is received.
>>
>> This allows userspace to "subscribe" to a particular channel where
>> it is useful to wake up to process new data. The expected usecase
>> is to allow for handling incoming SMS or phone calls where the only
>> notification mechanism is via QRTR on the IPCRTR glink channel.
>>
>> As this behaviour is likely undesirable for most users, this patch
>> doesn't enable a wakeup_source for any channels by default.
>>
> 
> This looks reasonable to me.
> 
> One suggestion that came up as we discussed this problem (elsewhere) a
> while ago was the idea of using EPOLLWAKEUP to control the wakeup source
> on a per-socket basis.
> 
> Would that suite your userspace?

I haven't been able to get any feedback from ModemManager, however
personally I'm more inclined to go with a global switch for the sake of
simplicity. At least until we have some idea of how to tie this together
in userpsace. This is the approach taken by IPA right now too.

If I understand correctly, this wakeup is always enabled on downstream,
and the RIL stack is expected to configure the modem to not send
spurious messages while the AP is in suspend.

Given that on phones the only time we don't want to wake up for
calls/sms is when on aeroplane mode (or some other explicit user
decision) I'm not sure that tying it to the socket is the best option,
at least initially.

I expect there to be some teething problems on the userspace side, and
some folks are going to want to disable this feature until those are
resolved. Making it a sysfs control means that we aren't reliant on
ModemManager to implement support for it.

Lastly (apologies this is getting a little long...), the sensor DSP also
utilises this mechanism to be able to wake the device on significant
motion. Similarly decoupling the wakeup control from whatever daemon is
responsible for handling this feels simpler to me, just poke sysfs and
the device will stop waking up when you move it.

=== Related bug ===

We've been shipping this patch in postmarketOS for a few months now, and
I've come across a very rare null pointer splat where channel->ept.rpdev
is null inside qcom_glink_rx_data(). I'm unsure if this is a bug in my
patch or in glink and I wondered if you have any idea.
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>  drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
>> index 115c0a1eddb1..1a96a7ae23bb 100644
>> --- a/drivers/rpmsg/qcom_glink_native.c
>> +++ b/drivers/rpmsg/qcom_glink_native.c
>> @@ -914,6 +914,9 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
>>  		channel->buf = NULL;
>>  
>>  		qcom_glink_rx_done(glink, channel, intent);
>> +
>> +		pm_wakeup_ws_event(channel->ept.rpdev->dev.power.wakeup, 0,
>> +				   true);
>>  	}
>>  
>>  advance_rx:
>> @@ -1510,6 +1513,17 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>>  		if (ret)
>>  			goto rcid_remove;
>>  
>> +		/*
>> +		 * Declare all channels as wakeup capable, but don't enable
>> +		 * waking up by default.
>> +		 *
>> +		 * Userspace may wish to be woken up for incoming messages on a
>> +		 * specific channel, for example to handle incoming calls or SMS
>> +		 * messages on the IPCRTR channel. This can be done be enabling
>> +		 * the wakeup source via sysfs.
>> +		 */
>> +		device_set_wakeup_capable(&rpdev->dev, true);
>> +
>>  		channel->rpdev = rpdev;
>>  	}
>>  
>> -- 
>> 2.39.0
>>

-- 
// Caleb (they/them)
