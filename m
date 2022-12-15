Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28A664DEE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 17:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbiLOQpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 11:45:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiLOQpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 11:45:02 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795D337FBA;
        Thu, 15 Dec 2022 08:45:01 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id a16so27860588edb.9;
        Thu, 15 Dec 2022 08:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fdysh/ijYewRV7bbddoJgpW8W2b/pWo97s985wV5pOE=;
        b=l43YPQBwPDpWHKLNjBQoFqrC0/4N+jGpwN+XEb8FFKxxf2FifYF+vz7mpBMZ2a1XXN
         94NBYk4aDFLF1mx/wNkTSR0YEBRNwmye72EF91SRz1Iptzfm4yLAA/x7CBDhLi+Yq5AO
         6dMowHOgi7GDSZrNEgJGgbwrmWSOYuGIdLpw9RuJRx/JbZe03Ee3+caPsH9VTlQ8xeRt
         mSMRJfzHSL97rEl0VCjEZhO2duM3+NY1YuxHZ2O+NDoBq+12rxIcez7O8GV/jXlgTKcI
         vdb5HG4Vpyt8FyGEcxZYAF+NPN3xr4jq0p5hv8iloBUjEbMneJhcJAD9zwUQ24ZzDWCc
         Pc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fdysh/ijYewRV7bbddoJgpW8W2b/pWo97s985wV5pOE=;
        b=vae5tiRkMX19FUU+dxLt1VP+XS2Z0fr6KV+4UIf7n/Ad8gjwsZtZKsqu4R1wZpUeyO
         FKSsjiH5V6OkHVRyGaugv+iyTtaI7li/l5BJzjP1dcqwL5WndcTm42anBZBtRlAJ7/y9
         hqO5Z7Q0rS6JlhHkOuRPGuKE/JSh3KTVFavWD+/iyD6F81eNuavYABgCx63/XOOkEw7F
         p77SgBxgs3mQqEHrENquUw9o7saeiZNm7ueu3+3EIEkKEBocp/h5WdNICntDgmND+F8W
         KKG13krj99nDBSr8Cpo9lVQPyA+ox85szjyFQKH1tqE8A7b8dRlk1MItVhvh8yEUwATa
         OPxg==
X-Gm-Message-State: AFqh2kqMZ8DbHTAnJsHD6Ux7m6XDG67Rnq6UvxSv71f+rdSFzGYPbgwR
        pVhN7yX9s6g5YehHJZkBgw0=
X-Google-Smtp-Source: AMrXdXvQrHfotHCvkzUGBDmw98seVFtR2I7MIBfvPATXve2iauxvcnzNJePNvumxSQb3pCgDN4t1hA==
X-Received: by 2002:aa7:d384:0:b0:472:7c75:832 with SMTP id x4-20020aa7d384000000b004727c750832mr6025450edq.16.1671122699985;
        Thu, 15 Dec 2022 08:44:59 -0800 (PST)
Received: from ?IPV6:2003:c5:871f:9993:b1c0:fc77:1081:c93c? (p200300c5871f9993b1c0fc771081c93c.dip0.t-ipconnect.de. [2003:c5:871f:9993:b1c0:fc77:1081:c93c])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090778c400b007c0b530f3cfsm7216202ejc.72.2022.12.15.08.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 08:44:59 -0800 (PST)
Message-ID: <4d8e2b27-2804-e8ad-1e35-0942538b5617@gmail.com>
Date:   Thu, 15 Dec 2022 17:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 00/16] Add Multi Circular Queue Support
Content-Language: en-US
To:     Asutosh Das <quic_asutoshd@quicinc.com>, quic_cang@quicinc.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
        stanley.chu@mediatek.com, eddie.huang@mediatek.com,
        daejun7.park@samsung.com, bvanassche@acm.org, avri.altman@wdc.com,
        mani@kernel.org, beanhuo@micron.com, linux-arm-msm@vger.kernel.org
References: <cover.1670541363.git.quic_asutoshd@quicinc.com>
From:   Bean Huo <huobean@gmail.com>
In-Reply-To: <cover.1670541363.git.quic_asutoshd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Asutosh,

I reviewed the entire patch series and applied them to Martin's 
6.2/staging branch,


No logic issues were found, other than these minor compilation warnings:


drivers/ufs/core/ufs-mcq.c:87: warning: Function parameter or member 
'hba' not described in 'ufshcd_mcq_config_mac'
drivers/ufs/core/ufs-mcq.c:87: warning: Function parameter or member 
'max_active_cmds' not described in 'ufshcd_mcq_config_mac'
drivers/ufs/core/ufs-mcq.c:107: warning: Function parameter or member 
'hba' not described in 'ufshcd_mcq_req_to_hwq'
drivers/ufs/core/ufs-mcq.c:107: warning: Function parameter or member 
'req' not described in 'ufshcd_mcq_req_to_hwq'
drivers/ufs/core/ufs-mcq.c:128: warning: Function parameter or member 
'hba' not described in 'ufshcd_mcq_decide_queue_depth'

so:


Reviewed-by: Bean Huo <beanhuo@micron.com>



Kind regards,

Bean

