Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F92B723037
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 21:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbjFETtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 15:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236021AbjFETtF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 15:49:05 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6430B10CC
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 12:48:41 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-33b3674acdeso19241055ab.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994505; x=1688586505;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CCJxTC/QdIHN1GnfEAwbC+2stOJ6s3qwapkXQDES9zI=;
        b=Mxq3KNrO9t5P4+wTN0n6VQPCCY/GnWdb2TWR0l27hf+7cUAlO2LuSvPpFA8DRJOJ1T
         yHzUpWgP3e7xt1/ZfRYPqeg6TFAQP1U9mevenT2R3ym8jloXFW3pIoJVWxhUpit+rZxY
         UzoToZzJPfEj+BvoazukTmUVvrjAF9mBWwLEZ+xAnf7zZ6YhbVKY8dN2VZ47V90WWnHC
         dCwS63yfHQmJzaEz/0nnqkH40P3bOvJBOXWD1Z3y80gQmv/Gs4ARsPlMSNoqo3T7RErI
         hdz7FpC8K9bbUQsPuQgpzXSsnQBetssYm7wJwTJ9iUVXb3BhOFlj28/o6Tb2WP5WSc8C
         FcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994505; x=1688586505;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCJxTC/QdIHN1GnfEAwbC+2stOJ6s3qwapkXQDES9zI=;
        b=AvqFUfqjNOMHJ4LrpIvf7/+dwbJpzQBYFnkaDUqQBf2JIoV9jW42HKa8jMrvXYBa3v
         VSbwVDo5NfBEtRoX+lEA5q9UIPAnwmSgRuVGq30YMxqBHz4n5Nbuc1YMlMLwWpJFgh25
         nvbcBzHBAF27Cf15CeI2d152R6lYfATgeTkrIKgjcNxMdJ110MB6Z9RONAtt7Qk1XcEC
         5liM60SH7lRgh1SEl9LsayPANcfwwVHXGLXdUrAy1mM+xearB8ipKUMZF2yFNxGVQndu
         HP/3Rms+azuTb++s5e0agCPmxbykgAYOsLf7S91Byk/t4CuVUcPRZaWLXdhXxhRH7Y8A
         mpJA==
X-Gm-Message-State: AC+VfDywePot9XveSxqudo7PIc8F1WziwfkdaacuMWDHOqrMTJx7Ixxx
        JFXhuuYRk75RMplLbdVMMP4zSg==
X-Google-Smtp-Source: ACHHUZ7ugAPzi9uVbGY8Gzgw9mdLbeSgf/MgIeHnUdMdP/b+cM+PByU07Pbr7UJGLSjdLBaGcfDUfA==
X-Received: by 2002:a05:6e02:588:b0:337:d335:6469 with SMTP id c8-20020a056e02058800b00337d3356469mr380061ils.5.1685994505338;
        Mon, 05 Jun 2023 12:48:25 -0700 (PDT)
Received: from [172.22.22.28] ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id e4-20020a02caa4000000b0041ac54cbc60sm1848087jap.56.2023.06.05.12.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:48:24 -0700 (PDT)
Message-ID: <028b5a7f-7d7d-178d-be74-6c93368e06f5@linaro.org>
Date:   Mon, 5 Jun 2023 14:48:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v13 11/24] gunyah: vm_mgr: Add ioctls to support basic
 non-proxy VM boot
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-12-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230509204801.2824351-12-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 5/9/23 3:47 PM, Elliot Berman wrote:
> Add remaining ioctls to support non-proxy VM boot:
> 
>   - Gunyah Resource Manager uses the VM's devicetree to configure the
>     virtual machine. The location of the devicetree in the guest's
>     virtual memory can be declared via the SET_DTB_CONFIG ioctl.
>   - Trigger start of the virtual machine with VM_START ioctl.
> 
> Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

I point out a spelling error, but otherwise this looks OK to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/virt/gunyah/vm_mgr.c    | 215 ++++++++++++++++++++++++++++++++
>   drivers/virt/gunyah/vm_mgr.h    |  11 ++
>   drivers/virt/gunyah/vm_mgr_mm.c |  20 +++
>   include/uapi/linux/gunyah.h     |  15 +++
>   4 files changed, 261 insertions(+)
> 


. . .

> +static int gh_vm_ensure_started(struct gh_vm *ghvm)
> +{
> +	int ret;
> +
> +	ret = down_read_interruptible(&ghvm->status_lock);
> +	if (ret)
> +		return ret;
> +
> +	/* Unlikely because VM is typically started */
> +	if (unlikely(ghvm->vm_status == GH_RM_VM_STATUS_NO_STATE)) {
> +		up_read(&ghvm->status_lock);
> +		ret = gh_vm_start(ghvm);
> +		if (ret)
> +			return ret;
> +		/** gh_vm_start() is guaranteed to bring status out of
> +		 * GH_RM_VM_STATUS_LOAD, thus inifitely recursive call is not

s/inifitely/infinitely/

> +		 * possible
> +		 */
> +		return gh_vm_ensure_started(ghvm);
> +	}
> +
> +	/* Unlikely because VM is typically running */
> +	if (unlikely(ghvm->vm_status != GH_RM_VM_STATUS_RUNNING))
> +		ret = -ENODEV;
> +
> +	up_read(&ghvm->status_lock);
> +	return ret;
> +}
> +
>   static long gh_vm_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   {
>   	struct gh_vm *ghvm = filp->private_data;
. . .
