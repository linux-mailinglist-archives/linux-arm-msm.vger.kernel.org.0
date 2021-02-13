Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5AAF31A9C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 04:26:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhBMDZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 22:25:59 -0500
Received: from mail-pj1-f49.google.com ([209.85.216.49]:50381 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhBMDZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 22:25:58 -0500
Received: by mail-pj1-f49.google.com with SMTP id cl8so679441pjb.0;
        Fri, 12 Feb 2021 19:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZDK5F7tnO4b2ft9Zo/5qZ+F8VO7X7IwT4LLVFZ1PYwU=;
        b=OJtpfdQMZ/zIUokpnXYyEj4OCO8Om6Z/Kw9do9pr5gpH0psaRF0dw/nhLMnMcrkOH6
         O+L/oFKuSESlp6m/B1ehK8gObvHogndEsbyGHgpOrq5sanR7bMHv6cI+WyHZCgHQssub
         Iy1ObasEoVpY/yBNieaVLEw74ZnmooFaFyltZ5XXP3FL7XOhS5FQD1Kgg9MivQ87bmYe
         WOYVPLvY/LFVfClMKhwDKgSJapEUIINzTV2skrSvSUaiol3P5toujIX4527rsOtnVSPi
         9Ik/VHXZapFgsvj1tVBQof9+lVotP9W+4J3DKQPGKveDJjWxfSxpEwKD4JD7E6nOZzs1
         kmcg==
X-Gm-Message-State: AOAM531BnhHPMg31hU0tq/nBtZZEuL1kq2+wt89kVSsb2RrlCnLVLfvo
        Rq/lLeRQsv5jbvWaVTXRh3fDgT43Eko=
X-Google-Smtp-Source: ABdhPJxn19h6MYI/Ybf1mOYrG0afmx694nMh8K9UfLwB4lz8P4EvdkML+GScoC91Zq7bPUpH3BkAQQ==
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr5455309pjn.25.1613186717224;
        Fri, 12 Feb 2021 19:25:17 -0800 (PST)
Received: from ?IPv6:2601:647:4000:d7:7f86:b7b7:63df:6d7a? ([2601:647:4000:d7:7f86:b7b7:63df:6d7a])
        by smtp.gmail.com with ESMTPSA id z11sm9598558pjn.5.2021.02.12.19.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 19:25:16 -0800 (PST)
Subject: Re: [RFC PATCH v3 1/1] scsi: ufs: Enable power management for wlun
To:     Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, stern@rowland.harvard.edu,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1613070911.git.asutoshd@codeaurora.org>
 <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <29fcd3c1-72c7-1191-ec03-aea1b0c6b8c9@acm.org>
Date:   Fri, 12 Feb 2021 19:25:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eed327cdace40d1e1d706da5b0fa64ea4ee99422.1613070912.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/11/21 11:18 AM, Asutosh Das wrote:
> +static inline bool is_rpmb_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun == ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN));
> +}
> +
> +static inline bool is_device_wlun(struct scsi_device *sdev)
> +{
> +	return (sdev->lun ==
> +		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_UFS_DEVICE_WLUN));
> +}

A minor comment: checkpatch should have reported that "return is not a
function" for the above code.

>  /**
> + * ufshcd_setup_links - associate link b/w device wlun and other luns
> + * @sdev: pointer to SCSI device
> + * @hba: pointer to ufs hba
> + *
> + * Returns void
> + */

Please leave out "Returns void".

> +static int ufshcd_wl_suspend(struct device *dev)
> +{
> +	struct scsi_device *sdev = to_scsi_device(dev);
> +	struct ufs_hba *hba;
> +	int ret;
> +	ktime_t start = ktime_get();
> +
> +	if (is_rpmb_wlun(sdev))
> +		return 0;
> +	hba = shost_priv(sdev->host);
> +	ret = __ufshcd_wl_suspend(hba, UFS_SYSTEM_PM);
> +	if (ret)
> +		dev_err(&sdev->sdev_gendev, "%s failed: %d\n", __func__,  ret);
> +
> +	trace_ufshcd_wl_suspend(dev_name(dev), ret,
> +		ktime_to_us(ktime_sub(ktime_get(), start)),
> +		hba->curr_dev_pwr_mode, hba->uic_link_state);
> +
> +	return ret;
> +
> +}

Please remove the blank line after the return statement.

Otherwise this patch looks good to me. Hence:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

