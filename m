Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2906919DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 09:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbjBJIQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 03:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjBJIQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 03:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95F587689
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676016936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=07/UuXVhjtmRlzDzNTQKRQ64YwDg0Nyzk7VgYVAu5TU=;
        b=XfQbb4ShlGJ6nIZ84qrIzqihuVUNAgXstMCl3PWMXEbNo0Jw+3YRHNLtdI/ptjNf3QtBmJ
        EtVEkeEGxrvXVzMltR9wl4v1ETYs5fArv0Vkf215NsZlxw9+DH7tpB4rUrWGuf2TZ+PTEt
        2Dr+a+kVXcKOwRcPBejqVxkbsfgyoI0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-rbqkX-b4MzSkKQcpWNaYqA-1; Fri, 10 Feb 2023 03:15:34 -0500
X-MC-Unique: rbqkX-b4MzSkKQcpWNaYqA-1
Received: by mail-wm1-f69.google.com with SMTP id l31-20020a05600c1d1f00b003deab30bb8bso2270772wms.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 00:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07/UuXVhjtmRlzDzNTQKRQ64YwDg0Nyzk7VgYVAu5TU=;
        b=fl4dGSsLJirbEJo5ytklew+yUSCARNl40ICBMs+j/9jOo3L3HraEQtT76i/oPBKtuI
         EZtW3u3l3QPHZ/9tJJ4PUKACXmMtp2MDrSJFXYfYQijLCU1gNYnWjEp8ZX9Jlj9yVP8x
         iiWWTtuVluPmzb+F74wWS9jSbO0kUcz9EHXvS43CXnS/RZ7Qv++Q0974J4jI10yZ5bk9
         XXgsE4YinbL+46IFmLHgTi4ijHS3gzqOoRgF8SlXWHnJS0kAWE+L0DJrQq0YBPwNhOOw
         vyn59UJpqWr8c1hWuIDMWs+NBaceBr6L/YaNR4MknRwpyeKNZ76GEqwIFQf8ZupX4oyv
         Oauw==
X-Gm-Message-State: AO0yUKWX5lC9kDcoWV42OxEEiN401E1lGsBxhCAc5XN5tDR/ucWw5cFH
        cGK1HJAb00BTnbxBPatv/OL/8il8WIuG2xvPX95fyMm41ysYc3upAdakrEbVtkUvgctxXfMj3rt
        yPolIy/D38vjxXxmel6lZ5zCxVw==
X-Received: by 2002:a05:600c:340a:b0:3dc:45a7:2b8a with SMTP id y10-20020a05600c340a00b003dc45a72b8amr12254720wmp.10.1676016932013;
        Fri, 10 Feb 2023 00:15:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+rpGU7GsN9Xt3N9dd/K8uaoujZVZo9bVkwSwtBS5q7w0RxF4d8lQv1lpQmqMvSeDKOcqVxRg==
X-Received: by 2002:a05:600c:340a:b0:3dc:45a7:2b8a with SMTP id y10-20020a05600c340a00b003dc45a72b8amr12254706wmp.10.1676016931842;
        Fri, 10 Feb 2023 00:15:31 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b003db12112fcfsm4673655wmo.4.2023.02.10.00.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:15:31 -0800 (PST)
Message-ID: <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
Date:   Fri, 10 Feb 2023 09:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>
Cc:     Albert Esteve <aesteve@redhat.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
Content-Language: en-US
In-Reply-To: <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/8/23 10:06, Javier Martinez Canillas wrote:
> Hello Vikash,
> 
> On 2/7/23 17:40, Vikash Garodia wrote:
>> Hi Javier and Matthias,
>> Can we try the attached patch if that fixes the suspend issue for sc7180 and sc7280 ?
>>
> 
> I tested your attached patch on an SC7180 machine (HP X2 Chromebook) and as Matthias
> mentioned, it still causes the driver's probe to fail:
> 
> [ 2119.063779] qcom-venus aa00000.video-codec: non legacy binding
> [ 2119.085695] platform video-firmware.0: Adding to iommu group 11
> [ 2119.156302] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x000000b0, fsynr=0x61, cbfrsynra=0xc40, cb=7
> [ 2119.259382] qcom-venus aa00000.video-codec: failed to reset venus core
> [ 2119.267782] platform video-firmware.0: Removing from iommu group 11
> [ 2119.275052] qcom-venus: probe of aa00000.video-codec failed with error -110
> 

So what should we do about this folks? Since not allowing the driver to probe
on at least SC7180 is a quite serious regression, can we revert for now until
a proper fix is figured out?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

