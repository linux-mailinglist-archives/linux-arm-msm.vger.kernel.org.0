Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8591568C1F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 16:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjBFPnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 10:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjBFPmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 10:42:45 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B888298E5
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 07:41:49 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id z17so1593855ilm.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya1iSK0PwE6HxUwFfuaJF4yxZVg4nHtKlcACKsLmRGU=;
        b=W/YkJki6ZwlXviPJ614uzFdt2BX/wHzE5Skxgb38EnN1zNcf707VfP+vq4SIYuFXiu
         LiXSzWangkaoiF4lXCarJh274pb36EjTfBBLjteO2eaVrqT3Mm6+UgHx8Wa6DPCrUuge
         RHhjM55RBX3kjlSfltd6h5n7Q0hOQYnkzXEgdMzMXyn2GoUV/AKfXbqdnXWhZKLdnESp
         eOHjve0t0fskr5APXwdt8xUGfyhUOx1rWxU6jCKCle6aFXSHTpD4CryrZJcns3EH0Pbh
         8mCV5jjmwQcYqVjjRfTm3lv79Ijng+S6AoxJdzESt32cONgkf5olvcsWK4xiQCJsIsSe
         n5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ya1iSK0PwE6HxUwFfuaJF4yxZVg4nHtKlcACKsLmRGU=;
        b=8Dx+53Bk99hfYLC8X/NAaMGttz5TyuUhcqZy4tkzY0LmThPoedREyDV/Oyhsb5V7+J
         Gh1y3kDkMl7YsZfpZd+IkTr43rD4ZJhCCjEWvcvOZu/TqfpJ5E2WvpMUIMMFTZhZd1Wa
         5cx/5EZQ9EV2RehwlaR34zVx4Ab3PdSjJHhGgk52AzvwS+kMRESfFIM0Z9Karn6bYwiA
         bCzKvVOtN1ulGGvAjMUCHJFtXLRyoDB/Q6xqfWTooFW8JP0ZnKzUOCUezL/2m3iJSD4G
         Zv1KsFPxDVaJMEPFLKSwWQLZ+5rUG+VMb9OavHnKcEPL+KfVs42hDwo/iJP/Tt1dg7eO
         TN9A==
X-Gm-Message-State: AO0yUKUzSb1cRq723zL93l2U6HUZL/HjZoyV07NXgiQyCZXLTXu7bRoz
        O6gP4LLWJhLmf3AfrAMW2I4Y2w==
X-Google-Smtp-Source: AK7set9xFUDytMkMm3RWCn615aTLybOLKq1Z55Oif0udR87hG69FUrkkSit5QKSJolKqkiDJt7eRKw==
X-Received: by 2002:a05:6e02:1a44:b0:313:d748:8f78 with SMTP id u4-20020a056e021a4400b00313d7488f78mr782710ilv.18.1675698072954;
        Mon, 06 Feb 2023 07:41:12 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id o10-20020a02c6aa000000b0038a3b8aaf11sm3547972jan.37.2023.02.06.07.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 07:41:12 -0800 (PST)
Message-ID: <4a584563-1fb7-22fa-5e16-e0cf5e88b76b@linaro.org>
Date:   Mon, 6 Feb 2023 09:41:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 10/27] gunyah: rsc_mgr: Add VM lifecycle RPC
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>
Cc:     Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230120224627.4053418-1-quic_eberman@quicinc.com>
 <20230120224627.4053418-11-quic_eberman@quicinc.com>
 <4db1c760-10d9-3a22-106a-dda141dd5381@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <4db1c760-10d9-3a22-106a-dda141dd5381@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/2/23 6:46 AM, Srinivas Kandagatla wrote:
>> +    ret = gh_rm_call(rm, message_id, &req_payload, 
>> sizeof(req_payload), &resp, &resp_size);
>> +    if (!ret && resp_size) {
> 
> Am struggling to understand these type of checks in success case, when a 
> command is not expecting any response why are we checking for response 
> here, This sounds like a bug in either RM or hypervisor.
> 
> Or Is this something that happens due to some firmware behaviour?
> Could you elobrate on this.

What I think you're talking about is error checking even when
it's very clear something "can't happen."  It's a pattern I've
seen in Qualcomm downstream code, and I believe sometimes it
is done as "best practice" to avoid warnings from security scans.
(I might be wrong about this though.)

I think your underlying point though is that we can just assume
success means "truly successful," so there's no reason to do any
additional sanity checks.  We *assume* the hardware is doing the
correct thing (if it's not, we might as well assume it does
*nothing* right).

So as a very general statement, I think all checks of this type
should go away (and I think Srini would agree).

					-Alex
