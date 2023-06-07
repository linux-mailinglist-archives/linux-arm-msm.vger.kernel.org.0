Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465BF726921
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 20:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjFGSrQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 14:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjFGSrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 14:47:16 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA2C1712
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 11:47:14 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9788faaca2dso55409566b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163633; x=1688755633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Saw/wcMjaTOKj6+ur5l5dkvFtuu3joPFGhVbSYzUS6E=;
        b=F7gUsU3UCaoBKO4nx1qLKGM7+Ocjx9dx3nGX0xJMlc4Crg44LrkCvBkYaXGY1yBU3R
         WpBTKSxYqsXrqYXeMAB4wl73gQiwW7ZF8fZlwDg9eZqe9SWVTmrnNajgXS+R1qPw3dRM
         1pcgCXwwnmpQm/N/v34Ek5g9yfWJqLJtKbxhx9iAeGgck34XX93M5vx9H50KlcQzA3RQ
         10AX2aPETkoIRlobjgMVIuDQ/Ee9mh8RM51LaXM9KH8/mShDTQYWHgMsk3rRUg/jQijE
         QQEKPF2soAW0u2bhDwf+uR6EQd+vm80hgFYJ7OqI2DH5kDfbyZFXGpjuT2GSZfz/6k+D
         OsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163633; x=1688755633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Saw/wcMjaTOKj6+ur5l5dkvFtuu3joPFGhVbSYzUS6E=;
        b=iNIFrXtHdnCeWME/apkRVVZI8rg8G2jbb6tR+q3y+1bTDZ2J7X63dpcIXLWMUfavy+
         TOKtA0vH3ljStEeAWSL4jbNidlJrWoXvZY0nZnnYKASHxHD+QA1Rx9thzhrCgDtWCSZn
         sTqpfC8+iK984CQMQ7EslflLB7VStPPqCivNA0Vvx8w75wVbEj4lkTVjDJ8RT+pKLSc9
         Ix0gGhatUmr1EQJpFTp4If+g4Vw1dckq7jqkJU3xFdpdXWHYMOiUwAuTPGmvH5xVw2Sn
         137ov9RNpZBEwce7GYbWJx+u7GimtZr/tn0/Rb0ybwROVv7gqIdBQm8hs4qGhmMMTX+H
         9MgA==
X-Gm-Message-State: AC+VfDzdSR8O5Pi1ea1nrGgGs9TmThfLaVe+as4L+tFKvTlXdAQ7Ko70
        r4XoMXv3e6R1RSsvHopFozFDhg==
X-Google-Smtp-Source: ACHHUZ68Bq5KQbazm15stdQM7ZkuSGXrYI4b4MEPFpdT7BOx0AbduzT0oBcsh38Y1oz5wjhGG0tKgw==
X-Received: by 2002:a17:906:9753:b0:974:86a7:d3a3 with SMTP id o19-20020a170906975300b0097486a7d3a3mr6597724ejy.13.1686163633165;
        Wed, 07 Jun 2023 11:47:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id hb19-20020a170906b89300b009737b8d47b6sm7052264ejb.203.2023.06.07.11.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:47:12 -0700 (PDT)
Message-ID: <bdf49a17-bb4c-a00d-0239-ed5d0eef470d@linaro.org>
Date:   Wed, 7 Jun 2023 20:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RESEND PATCH v1 2/2] misc: fastrpc: detect privileged processes
 based on group ID
Content-Language: en-US
To:     Ekansh Gupta <quic_ekangupt@quicinc.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
References: <1686155407-20054-1-git-send-email-quic_ekangupt@quicinc.com>
 <1686155407-20054-3-git-send-email-quic_ekangupt@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1686155407-20054-3-git-send-email-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2023 18:30, Ekansh Gupta wrote:
> Get the information on privileged group IDs during rpmsg probing based
> on DT property. Check if the process requesting an offload to remote
> subsystem is privileged by comparing it's group ID with privileged
> group ID. Initialization process attributes are updated for a
> privileged process which is sent to remote process for resource
> management.
> 



> +
>  static const struct file_operations fastrpc_fops = {
>  	.open = fastrpc_device_open,
>  	.release = fastrpc_device_release,
> @@ -2277,6 +2396,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	err = fastrpc_init_privileged_gids(rdev, "qcom,fastrpc-gids", &data->gidlist);
> +	if (err)
> +		dev_err(rdev, "Privileged gids init failed.\n");
> +

What about error paths? No need for cleanup?

Best regards,
Krzysztof

