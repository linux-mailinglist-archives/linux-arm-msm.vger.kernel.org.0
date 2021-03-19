Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA87341364
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 04:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233125AbhCSDMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 23:12:54 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:42830 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbhCSDMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 23:12:25 -0400
Received: by mail-pg1-f173.google.com with SMTP id y27so2749956pga.9;
        Thu, 18 Mar 2021 20:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QPnNt2Q5gwIGxq8YNJSmsWgPXb6d+RK8/YXCxxPJffM=;
        b=qGKX9eMYZhJkmsFhWq2fhycavW3iW86NAA/k8IVvsKOGqcgvSrufOdmHMM7Kj19sgZ
         Tvo3tcxJZ9P5OSb+MebaG18RRqItnSNmR+fUu+Xri9kVt+nvgeBsWLsuHp/o+UXwQxTc
         AYSBnjM0367Ea08DYpq6YkG0jRaQaa7BHuMY2hMFsfFNgeMOYiVKqXMQLjAcoPUCXpwt
         7SB6JoSHISdYM/047cJBzKhObZfcJe3TX43+ckVjFpoCwVyazizC0HQ8ZpDR+EAFUhGU
         nH4j/RGBjAWtZT+E9sTImTbvK4oT2zAx6q68OoqlapKfcATelWSv0qgDMlBONBfB46J7
         6CrA==
X-Gm-Message-State: AOAM533kYdw6PJIJ3SRYTRMB7eyyRQ2YI1S3miT4iBsSU+srOjjZIzN+
        bHKhx0glR60JB4LK8D3C4yOWRwQKMuJFOg==
X-Google-Smtp-Source: ABdhPJwfFHQEQwnjE1zKW9cAw1O9qK8JUiS4pOAOpm6vvbl1t/JC568LJtBSzb7hPf2kaVpgpisIZw==
X-Received: by 2002:aa7:96c9:0:b029:200:503d:19df with SMTP id h9-20020aa796c90000b0290200503d19dfmr7208817pfq.46.1616123544961;
        Thu, 18 Mar 2021 20:12:24 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:14ae:768b:f663:b4db? ([2601:647:4000:d7:14ae:768b:f663:b4db])
        by smtp.gmail.com with ESMTPSA id s194sm3752836pfs.57.2021.03.18.20.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 20:12:24 -0700 (PDT)
Subject: Re: [PATCH v12 1/2] scsi: ufs: Enable power management for wlun
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, adrian.hunter@intel.com,
        linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>
References: <cover.1616113283.git.asutoshd@codeaurora.org>
 <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <e9dc046d-3a88-9802-df58-60209ea8484f@acm.org>
Date:   Thu, 18 Mar 2021 20:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <56662082b6a17b448f40d87df7e52b45a5998c2a.1616113283.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/18/21 5:35 PM, Asutosh Das wrote:
> During runtime-suspend of ufs host, the scsi devices are
> already suspended and so are the queues associated with them.
> But the ufs host sends SSU to wlun during its runtime-suspend.
> During the process blk_queue_enter checks if the queue is not in
> suspended state. If so, it waits for the queue to resume, and never
> comes out of it.
> The commit
> (d55d15a33: scsi: block: Do not accept any requests while suspended)
> adds the check if the queue is in suspended state in blk_queue_enter().

What is the role of the WLUN during runtime suspend and why does a
command need to be sent to the WLUN during runtime suspend? Although it
is possible to derive this from the source code, please explain this in
the patch description.

What does the acronym SSU stand for? This doesn't seem like a commonly
used kernel acronym to me so please expand that acronym.

> Fix this by registering ufs device wlun as a scsi driver and
> registering it for block runtime-pm. Also make this as a
> supplier for all other luns. That way, this device wlun
> suspends after all the consumers and resumes after
> hba resumes.

That's an interesting solution.

> -void __exit ufs_debugfs_exit(void)
> +void ufs_debugfs_exit(void)

Is the above change related to the rest of this patch?

>  static struct platform_driver ufs_qcom_pltform = {
> diff --git a/drivers/scsi/ufs/ufs_bsg.c b/drivers/scsi/ufs/ufs_bsg.c
> index 5b2bc1a..cbb5a90 100644
> --- a/drivers/scsi/ufs/ufs_bsg.c
> +++ b/drivers/scsi/ufs/ufs_bsg.c
> @@ -97,7 +97,7 @@ static int ufs_bsg_request(struct bsg_job *job)
>  
>  	bsg_reply->reply_payload_rcv_len = 0;
>  
> -	pm_runtime_get_sync(hba->dev);
> +	scsi_autopm_get_device(hba->sdev_ufs_device);

Can the pm_runtime_get_sync() to scsi_autopm_get_device() changes be
moved into a separate patch?

> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
> +}

Has this patch been verified with checkpatch? Checkpatch should have
reported the following for the above code:

	return is not a function, parentheses are not required

> +static inline bool is_device_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun ==
> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
> +}

Same comment here.

>  		/*
> -		 * Don't assume anything of pm_runtime_get_sync(), if
> +		 * Don't assume anything of resume, if
>  		 * resume fails, irq and clocks can be OFF, and powers
>  		 * can be OFF or in LPM.
>  		 */

Please make better use of the horizontal space in the above comment by
making comment lines longer.

Thanks,

Bart.
