Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE3D6A5080
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 02:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjB1BGf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 20:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjB1BGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 20:06:34 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2092820A
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 17:06:31 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso4070183pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 17:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8ajA9RG68k8olqdv6T69Sappa+FZyVAapRtuC0ZTtk=;
        b=ld5E0k411ZDbt37oNeRZNeJ++ktOoJ34+wETrrbHJSDv1UuwN9FnFy8HdjJTVQynj/
         h/H/uvj5FrZOy9v8ve2RhqMwp8MiIr2xXzktzCEoGwIpNWmRoc8zIMmeKQuISMnrJvCh
         3iK8r6pGwvyjiiHrR03d5ULiaAe0LEYng+nijxkv71XovUbCTz1xwiFtxQKSkTOPz3DX
         wp5PiWHwCRM8K9Zt7ZokAvEzHCYV1q4hH/CFRUwOJdf6ppkBMZqFbDcIklcDc9m7YfgO
         zcbz8XKG4AsRbrM78sTLQz6JeF9XtYmvyS+5hyAdPYTjNfcZ15ZoMwyN52Y9sAWZaIGP
         5WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8ajA9RG68k8olqdv6T69Sappa+FZyVAapRtuC0ZTtk=;
        b=HPxiR2IDOXu58y2kwhJGZ061TbMT7kNBKQ5O3BH69pb4M70h2c+E79SVEQhK/dJPsn
         NY0GcGuLTItdbp8ksI5NYIWvtS3cynMJQ/x/cSnZAGE5lZdeLIo4+5prLWuSFhZlKrjh
         G9Tj0FcKhg3gEmDuK0+Wj7dz93uFKEwA+y2q8TYTDeZZMMHOipIJndiMrXIO2Fug5sB1
         bK/MXCxN/mw63Jtb0zUA/bCZODSwquKVVn6j0F4+G0ckGeYuDijD4ijKT6yW3POilSG8
         UXWJilIm2PAQo8+IgqKC1EBg5Z/v2JK+syknsdsmPtdIGZX4Ch5n7bhBWNT/d9OXza5r
         /niw==
X-Gm-Message-State: AO0yUKUYRgnxqZKCjMaQurbY0LqHt/5IsMFgB+wBSfeCKCK2hl+x9TrK
        L9hOjqpsAx9Z4nV1OxcqXe9DWQ==
X-Google-Smtp-Source: AK7set9Knbykae3swM5IubIOSpx+i2s6n2UWMH/l49hBBpl6zqXIuK4OlpAXqzJ5dH2EEXssAs3Arw==
X-Received: by 2002:a17:90b:1bc9:b0:237:30ef:e593 with SMTP id oa9-20020a17090b1bc900b0023730efe593mr1213179pjb.24.1677546391104;
        Mon, 27 Feb 2023 17:06:31 -0800 (PST)
Received: from [10.211.55.3] (h112.92.137.40.static.ip.windstream.net. [40.137.92.112])
        by smtp.gmail.com with ESMTPSA id z1-20020a17090a014100b002353082958csm6650911pje.10.2023.02.27.17.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 17:06:30 -0800 (PST)
Message-ID: <fcd61f55-f445-9721-3490-ed70b7b30293@linaro.org>
Date:   Mon, 27 Feb 2023 19:06:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 10/26] gunyah: vm_mgr: Introduce basic VM Manager
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alex Elder <elder@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230214211229.3239350-1-quic_eberman@quicinc.com>
 <20230214212356.3313181-1-quic_eberman@quicinc.com>
 <dbcfa4e9-a1ad-0f24-77bf-05934ca26bb2@linaro.org>
 <05c4aab8-2d26-b944-adb6-624d67e4a11d@quicinc.com>
 <52d944b1-3ea6-26b7-766a-2fed05dccf3a@linaro.org>
 <c5ff1523-7a62-3d3f-6fa9-792ce4d222e8@quicinc.com>
 <a50fa44d-fbc3-9ce2-175b-85c8cd7a9f7f@linaro.org>
 <15aa881f-5cf1-446e-a71e-f62d24e87500@app.fastmail.com>
 <6efceacf-93d3-787a-a121-bee16f1531f2@quicinc.com>
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <6efceacf-93d3-787a-a121-bee16f1531f2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/24/23 4:48 PM, Elliot Berman wrote:
> I'd be open to making GH_CREATE_VM take a struct argument today, but I 
> really don't know what size or what needs to be in that struct. My hope 
> is that we can get away with just an integer for future needs. If 
> integer doesn't suit, then new ioctl would need to be created. I think 
> there's same problem if I pick some struct today (the struct may not 
> suit tomorrow and we need to create new ioctl for the new struct).

I'd like someone to back me up (or tell me I'm wrong), but...

I think you can still pass a void in/out pointer, which can
be interpreted in an IOCTL-specific way, as long as it can
be unambiguously processed.

So if you passed a non-null pointer, what it referred to
could contain a key that defines the way to interpret it.

You can't take away a behavior you've once supported, but I
*think* you can add a new behavior (with a new structure
that identifies itself).

So if that is correct, you can extend a single IOCTL.  But
sadly I can't tell you I'm sure this is correct.

					-Alex
