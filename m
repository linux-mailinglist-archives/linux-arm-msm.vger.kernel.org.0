Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B80668BFC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 15:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjBFOPB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 09:15:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbjBFOOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 09:14:41 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE210227A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 06:14:14 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id h24so12821584qta.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 06:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSDx7lR4lbIKush7SukTE/OhPs2fEUoC37d6gBX19uU=;
        b=ERC064jLHsU/zmzw8RoyeU8P0SzprwSyrytyxl8CwLx+EClBHm9jC4OIs6DvpVHiKT
         bCVzy3h1qM4tXtLnhXZep+n3YNCG1lFKmdcMhA2cD/gh/QUjtXepRZpyCVeQgGre1X2X
         KnrtRxVQcz4oQRyjwKS6GLKe56g3hydKvlM6r5Ri8d3XJGWpNUnajCefgwTI4WqNL4cU
         sru/1dQ7034KdBpTgZtly4j1p8UzyMfQFsQwIt9qdgyJXub8KYNnDl4XCuVQMqnl8C7N
         nPj0QdiOoP5w7Mhs1gNph2awEUtYHg+xob1ow+eIUvy+fwqgdX0BK68LA16ae23n1gqu
         GhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSDx7lR4lbIKush7SukTE/OhPs2fEUoC37d6gBX19uU=;
        b=3dcKZmjGTt1lIR+7v/xwgO6Ol9yZH+FOFEZDgd/Dj38idnmW2MLxmgREScR6uIjfz6
         gfrao7xoiDjdoW0EWCv1EneEvkXvCLtaxqsuoB4CZmFVp0iOvDPKJWQNfTo0VblcEQ3F
         Cde9tI8UmilMR/AxgpmTSq2rsvhfYgPKKy2HiaU42dwFEtV/TeZzwUAhjtewEoTvw0zN
         jZheGHxVOJCj66zaSFeZhYKK6CfFNeNydEUmeSUoKQuMp9VQSDf7GmsGvZ/3GNDQZdWM
         aDYa5/szCybSaZPGioPZ5Qub08M/8VqzfJBTHZLO/seAqlNajlPnHYB9IS/hrFhoL1O9
         7b4w==
X-Gm-Message-State: AO0yUKX5BuXnPT/DB7eWiuApwhlsCjHCuKwFbV53tzjcRxYQ9Yvao0Zs
        csrh+Z9SAn7xrMcyZb6X/kLmuA==
X-Google-Smtp-Source: AK7set/JWkzW8hDZXUKQoVbyq7UY837wooVRU+m9/HcISd93PIQ91tjIFTNU42WVbQ6ZqGK+UUiStg==
X-Received: by 2002:ac8:574f:0:b0:3b9:bd28:bb6c with SMTP id 15-20020ac8574f000000b003b9bd28bb6cmr31965755qtx.36.1675692849691;
        Mon, 06 Feb 2023 06:14:09 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id d136-20020a37688e000000b006fa4ac86bfbsm7475775qkc.55.2023.02.06.06.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 06:14:09 -0800 (PST)
Message-ID: <78e7d084-4e76-c9f1-c627-b1256772ef9d@linaro.org>
Date:   Mon, 6 Feb 2023 08:14:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 09/27] gunyah: rsc_mgr: Add resource manager RPC core
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
 <20230120224627.4053418-10-quic_eberman@quicinc.com>
 <94d6f57b-de3b-1135-5a30-d1cb156581cb@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <94d6f57b-de3b-1135-5a30-d1cb156581cb@linaro.org>
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

On 2/2/23 5:53 AM, Srinivas Kandagatla wrote:
>>
>> +struct gh_rm_rpc_hdr {
>> +    u8 api;
>> +    u8 type;
>> +    __le16 seq;
>> +    __le32 msg_id;
>> +} __packed;
>> +
> #define GH_RM_RPC_HDR_SZ    sizeof(struct gh_rm_rpc_hdr)
> 
> You could use this in most of the places where sizeof is being called.

I'll repeat my point here.  I see no value in hiding
the size of the structure behind a defined symbol.

Use sizeof(*pointer) (if possible) or sizeof(struct foo) in
the code; it makes it very clear that it's not something
other than a simple object/structure size.

					-Alex
