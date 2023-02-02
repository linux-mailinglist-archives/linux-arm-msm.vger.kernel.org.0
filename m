Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2FE687C0D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 12:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjBBLRk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 06:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjBBLRi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 06:17:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859348AC18
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 03:17:34 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id bg26so1134325wmb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 03:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wofwQ+O48BFnhw82cu3ez4Q+Jbd6Fia6+jXbEPT3puI=;
        b=MuwydOyGgiMaGjFlfnBR83BxQ1X6Lpy5MFVO5ZZfPwKETCKTnznrkm9TUp85ZSbVR5
         j5iLj73jYsHmSdc70M3sim2sIOzpGxQ1hoPllvxSfBIBondjXSYigUmEmm7tAXQWQV+r
         wm7Yy15XqknanGs+TKnPUM6MJgfEEYroUKY40k22fImiQ+YZ7aSR/p7DADSo7c0v0J7Y
         jiRRA9GuElfwOX53BDuFwOoc7SppoBW7srv+6vfpsTVoTbkSBveeaapzIRg5HIK9A55L
         N6fe/f5tVjAndGoBr6t10On2eC2XVT57K0/9iRZHyA/nQ0Lw0Tllxr7Pbri0vKH0NM1F
         6Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wofwQ+O48BFnhw82cu3ez4Q+Jbd6Fia6+jXbEPT3puI=;
        b=Xh7tITK0goyBI+oLx3YQw8ZrGmpD26CzDCvCm4evrjv/Dl21p4GS6XzF92V/ksc6YN
         Fxk3/h3mjjBjjl4ok+sJtLCp4NFBV1UOdbRjXPla2n7r01Fzrm1QjZbKWN2JB7dQqZU2
         kldOGN/sqRY0q/G6fUQsm8R1WCGwJ262KMvzXEPW56DWVpErDrgSKW6DuK5uoF7+A1oT
         VuMXmLISyC26BVm+t8GMVBJ+NC5Tmm5F4T2EOCBoIXjmmYBIjOjcrCuz5/qv9V+FXGco
         nH8j2wNNYUT8Rzj1IPUBFdw8HVRx/2aP2tWAtdHk7W9uYLBJWRIAX5Mw04SlHifiooDW
         7l9Q==
X-Gm-Message-State: AO0yUKXXyQXjzUw+LkQ7wNmJp/eDfQqstkEJiiBiXaf1W6vR1p6ktvuh
        GP0BGz8qUz2gDqu8eyZWcUln44BpnWRbwRNA
X-Google-Smtp-Source: AK7set/91WZRLtCPBifuMsUrFxGX2wIh5W+rBcLvwOCfX1upKB4l4gUsRoJDOUxk4mJg6DP367KnfA==
X-Received: by 2002:a05:600c:3789:b0:3dc:54e9:dfd7 with SMTP id o9-20020a05600c378900b003dc54e9dfd7mr5652827wmr.25.1675336653033;
        Thu, 02 Feb 2023 03:17:33 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id y21-20020a05600c17d500b003dc5b59ed7asm4082366wmo.11.2023.02.02.03.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:17:32 -0800 (PST)
Message-ID: <0e3b9803-2492-87ec-3ae9-00ac820c87ce@linaro.org>
Date:   Thu, 2 Feb 2023 11:17:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] firmware: qcom_scm: modify qcom_scm_set_download_mode()
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1674562755-5378-1-git-send-email-quic_mojha@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1674562755-5378-1-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24/01/2023 12:19, Mukesh Ojha wrote:
> -static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
> +static int __qcom_scm_set_dload_mode(struct device *dev, enum qcom_download_mode mode)
>   {
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_BOOT,
>   		.cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
>   		.arginfo = QCOM_SCM_ARGS(2),
> -		.args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE,
> +		.args[0] = mode,

Is this a bug fix? why are we changing arg[0]?

--srini
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   
> -	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
> +	desc.args[1] = mode;
>   
>   	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
>   }
