Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2DB587927
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 10:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbiHBIi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 04:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbiHBIiz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 04:38:55 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4E440BDE
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 01:38:53 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z25so20976623lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 01:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=OUlNVrJftmJ2XfuB3wDshZNv/WR+XBtPkC09jnanpmY=;
        b=wPsQf9BgZWpy0q27jb7/9V/6AeIs+AAlD45SBnMIRQ16xfnhaYsgSlyFWW2/PISiLs
         qK2irYUDp2EIT7BkMxtsceOKJCFQ29u6JdmeOOtmCocgRrGBr/cBXoWIs3hfMNBEEfxQ
         EMjREyZPkUGamG4vhygIZTayMiXWVFxTshSLANg/lj6pBGdXz5ZvNZlg0pSxXX4/zcJS
         MlxEmpHBbOdhW0z4JUHptfv2oNQz/5WQiPvFul85fEaIEyILXa2yFyUjkkf+5doryFZ9
         11g/sNIBagAyybksgBRc2C24lTGcwMJbT+ld8YatmlMfAcwm94A114UsmnFlfxa5soTZ
         io6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=OUlNVrJftmJ2XfuB3wDshZNv/WR+XBtPkC09jnanpmY=;
        b=pXA0POLuyXiN5RJVIV4wGtQ26UXVzDZ7td39kqg5rjrhB92/ZDuPunhLu2S+eJ024c
         ENoh7B7esv3QkHZa3/nXRGWNgCqAcB7tevXdTVLpz8eZTMwJvMX23beRY6/jSrkC+eqv
         6BKZJrjiqOxUAvBBGzA4NzrYyqCe2iy9p59USa3QKxJqFuPcZRGCP+iJzqk6qXf2zWsa
         zhOveG7ZMHm+ss8U3BAW2oXvS+d0zBMIzp1hG/JMPgaV7q5XIc3Al/U06bwmBelJoq6Q
         svMiRy6qF0pfPyn9sBsVWl2DVnivQwH2maFc/iQICaSK7Poe420PXAwvVii/HnBam1FT
         r0Pw==
X-Gm-Message-State: ACgBeo2Zz6oQIRqYYq586RXXMmVp7a5Y38JkG++zCMkH5dAPYE3Tzbnz
        KZkmRqmeNdt7yqDH/lrh4FiibA==
X-Google-Smtp-Source: AA6agR5ZVmGpYFxuTsEJLxQ7mSYVQFY+1aKXLwklROUAmeEvG7kRXnZXEHSDo/EizY7YdFM0JJv6sQ==
X-Received: by 2002:ac2:465e:0:b0:48a:ebc2:2cbf with SMTP id s30-20020ac2465e000000b0048aebc22cbfmr4866933lfo.374.1659429531862;
        Tue, 02 Aug 2022 01:38:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c25-20020a056512075900b0048afdf1ba33sm585309lfs.208.2022.08.02.01.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:38:51 -0700 (PDT)
Message-ID: <869e9d41-7a21-c01a-ccbd-53bfb236938c@linaro.org>
Date:   Tue, 2 Aug 2022 11:38:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 09/11] gunyah: rsc_mgr: Add auxiliary devices for
 console
Content-Language: en-GB
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-10-quic_eberman@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220801211240.597859-10-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2022 00:12, Elliot Berman wrote:
> Gunyah resource manager exposes a concrete functionalities which
> complicate a single resource manager driver. Use auxiliary bus
> to help split high level functions for the resource manager and keep the
> primary resource manager driver focused on the RPC with RM itself.
> Delegate Resource Manager's console functionality to the auxiliary bus.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>   drivers/virt/gunyah/rsc_mgr.c | 61 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/gunyah/rsc_mgr.c b/drivers/virt/gunyah/rsc_mgr.c
> index b8268ee02fab..44b22cef7d44 100644
> --- a/drivers/virt/gunyah/rsc_mgr.c
> +++ b/drivers/virt/gunyah/rsc_mgr.c
> @@ -91,6 +91,11 @@ struct gh_rm_notif_complete {
>   	struct work_struct work;
>   };
>   
> +struct gh_rsc_mgr_adev {
> +	struct auxiliary_device adev;
> +	struct list_head list;
> +};
> +
>   struct gh_rsc_mgr {
>   	struct task_struct *recv_task;
>   	struct gunyah_device *msgq_tx, *msgq_rx;
> @@ -99,6 +104,13 @@ struct gh_rsc_mgr {
>   	struct mutex call_idr_lock;
>   
>   	struct mutex send_lock;
> +
> +	struct list_head adevs;
> +};
> +
> +/* List of auxiliary devices which resource manager creates */
> +static const char * const adev_names[] = {
> +	"console",
>   };

Which other auxilliary devices do you expect at this moment?

>   
>   static struct gh_rsc_mgr *__rsc_mgr;
> @@ -516,6 +528,14 @@ int gh_rm_unregister_notifier(struct notifier_block *nb)
>   }
>   EXPORT_SYMBOL_GPL(gh_rm_unregister_notifier);
>   
> +static void gh_rm_adev_release(struct device *dev)
> +{
> +	struct gh_rsc_mgr_adev *rm_adev = container_of(dev, struct gh_rsc_mgr_adev, adev.dev);
> +
> +	list_del(&rm_adev->list);

is there a race for the rsc_mgr->list? Can multiple release functions be 
called in parallel?
Rather than having a list, it would be easier to have an array of 
devices. Less race conditions, simpler code.

Or just add gh_rsc_msg->console_adev and use it directly without any 
additional bells and whistles.

> +	kfree(rm_adev);
> +}
> +
>   static struct gunyah_device *gh_msgq_platform_probe_direction(struct platform_device *pdev,
>   				u8 gh_type, int idx)
>   {
-- 
With best wishes
Dmitry
