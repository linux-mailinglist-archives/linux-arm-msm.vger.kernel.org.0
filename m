Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FADC766B46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 13:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjG1LCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 07:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbjG1LCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 07:02:07 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1692035B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 04:02:06 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3177f520802so1286136f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690542124; x=1691146924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vQ+N5lytyqHyKSN1hR/jEGr2fEX4jRxQzFS8KsCDQY=;
        b=WEHFSd0MUzUXkVJ1R5LDxSvd3PFzvV0qP8ImKEDN8Njd/dTGXDDcmY0bZDv0VCX0yf
         fjs3r/7kBm516yo8rHwCyZOmgziKW1/pYWoS+1VYIdSjATih3ZaBKZXQIqKWp28YggRp
         hCDE0cKOquBUkWNUQScJeet0YkNAP5e5ueP/v2khlsTZtgn7ejiOCHzjaacRG5uMoxku
         cWsXlZnIspl7lZnUSGjcHz/tyA1Uymoezqc/JWZ5/JjQhMOPKgKLnUI4GDXl2giYS7fO
         9HhsheeMeUUSlytERV2QGFOBLb/lRerZ6eoKBWB+ROHMmvN89quPGEhO3qElFICMGrfU
         GAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542124; x=1691146924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQ+N5lytyqHyKSN1hR/jEGr2fEX4jRxQzFS8KsCDQY=;
        b=amV/edXvDDSJLcyXGGCP8QmPOBdY7GsSrW/LuPNZpY17mOt3/wiTAXDs4tDaAqFv32
         VDHhxUaLjMXRxbQCkLuPj5Q4GygWX8huwQCszAYEISixLmrt+LtZO7mXQW7rsOXyaH3A
         BV5qKzQr29c8xELbr/HV+wu+mhB1ngUgsx55iRNgGd6QfHc6B8kBA1ypeSLe2j8PdanD
         rhiDQJ4jfTWmFg73SkXk1bndrT7tO4QjfBmlz3e8Zf/96tXrjflvOzn6WpouEpYT1/C/
         0bs4bggF1jr1Yb2ZNbG+Xe6fameV4wqMS5r02K2x93g00OYQMRI4uPP13FXGuhIi9Bgn
         +rqQ==
X-Gm-Message-State: ABy/qLYX+SahCfImN3RWR7eiIpMOgjO2JobRJF5lkw0YoosmOos+Dako
        gJLV7Icd2eQOgSTQPlS8VDBnLzeXNz3QLlvaUms=
X-Google-Smtp-Source: APBJJlFkWfexu3YJQR+HcoQBw0fZHJ30PYfrMAN72GKhZPv+IaJtHM094TB1vE8vCumRy4ROoG9FOw==
X-Received: by 2002:a5d:4534:0:b0:317:5cfb:44c7 with SMTP id j20-20020a5d4534000000b003175cfb44c7mr3727164wra.30.1690542124548;
        Fri, 28 Jul 2023 04:02:04 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id m22-20020a7bcb96000000b003f91e32b1ebsm6820675wmi.17.2023.07.28.04.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:02:03 -0700 (PDT)
Message-ID: <a0ffc859-8c38-b149-7434-dd199fd22109@linaro.org>
Date:   Fri, 28 Jul 2023 12:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] misc: fastrpc: Pass proper scm arguments for static
 process init
Content-Language: en-US
To:     Ekansh Gupta <quic_ekangupt@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ekangupt@qti.qualcomm.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com,
        stable <stable@kernel.org>
References: <1687528664-25235-1-git-send-email-quic_ekangupt@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1687528664-25235-1-git-send-email-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23/06/2023 14:57, Ekansh Gupta wrote:
> Memory is allocated for dynamic loading when audio daemon is trying
> to attach to audioPD on DSP side. This memory is allocated from
> reserved CMA memory region and needs ownership assignment to
> new VMID in order to use it from audioPD.
> 
> In the current implementation, arguments are not correctly passed
> to the scm call which might result in failure of dynamic loading
> on audioPD. Added changes to pass correct arguments during daemon
> attach request.
> 
> Fixes: 	0871561055e6 ("misc: fastrpc: Add support for audiopd")
> Cc: stable <stable@kernel.org>
> Tested-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>    - Removed redundant code
> 
>   drivers/misc/fastrpc.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 30d4d04..9a7074a 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1278,10 +1278,11 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   
>   		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>   		if (fl->cctx->vmcount) {
<--snip
> +			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> +
>   			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
>   							(u64)fl->cctx->remote_heap->size,
> -							&fl->cctx->perms,
> -							fl->cctx->vmperms, fl->cctx->vmcount);
> +							&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
-->

this change looks unnecessary channel context already sets its value to 
BIT(QCOM_SCM_VMID_HLOS);


>   			if (err) {
>   				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d",
>   					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> @@ -1322,13 +1323,18 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   	return 0;
>   err_invoke:
>   	if (fl->cctx->vmcount) {
> -		struct qcom_scm_vmperm perm;
> +		u64 src_perms = 0;
> +		struct qcom_scm_vmperm dst_perms;
> +		u32 i;
>   
> -		perm.vmid = QCOM_SCM_VMID_HLOS;
> -		perm.perm = QCOM_SCM_PERM_RWX;
> +		for (i = 0; i < fl->cctx->vmcount; i++)
> +			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
> +
> +		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +		dst_perms.perm = QCOM_SCM_PERM_RWX;
>   		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
>   						(u64)fl->cctx->remote_heap->size,
> -						&fl->cctx->perms, &perm, 1);
> +						&src_perms, &dst_perms, 1);

this looks good.

--srini
>   		if (err)
>   			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
>   				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
