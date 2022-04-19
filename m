Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5223C50717B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 17:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353705AbiDSPQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 11:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353701AbiDSPQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 11:16:11 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2143B296
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:13:29 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n11-20020a17090a73cb00b001d1d3a7116bso1885276pjk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zSqKROW2j70JA8DM8gYUgW1/ARztLUcBd65hG17JcmE=;
        b=qMnuP/7mxtfefsJv/k+IiMqzL2yLLWl0o5R385+BKCgwAxcQ5zQUtWulJ2exAk6Dok
         kLd/2VRdMYRXddl6Ar3ExGShbBV9dCeIv5QMba+EDzTC16AT1LEm/YTU5DqIQNvVHmeN
         +vUs5NWDijJ8YgrZCFECUZi/WMNTYjqgfAgkl0YkaUhDxR/WFxmoybm7kD7uqI+EbSzw
         Kz5N/t600Mw2W+mlfjCMMsFXxg6NcrdAoe57mzhUVyssdyBjWBzktGRS8cX3pKyaPrZx
         nwp6Y2b7ZvwaxLIPnR9UgJX2CXvH1xxnEBNuAeU31HPft3NpEeGNW2x0Me7sJ6UOSEg+
         GIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zSqKROW2j70JA8DM8gYUgW1/ARztLUcBd65hG17JcmE=;
        b=qg8F02Vbk8Ki2BOv7rQ00oMrYR4g0J5InWXEaD4ELRo2tdhNIabUGji6gXmsbzKVfH
         8QMrmuJs/Vlrgaczzred9s0pW4KwbK4dIo042idra4DxBfwFZ+tvANkR1MtoRqOlEzMd
         C07N/6x8Y4K3AS/cwjvqp+KS6dhyzn6OT5bYUEvsx+apHYHeb6TTyLTCA2WWePF78tLI
         2bvfoeFga3cPpyBuIigJ4eyXSWPtwq3P9a0Lni9BnKYhKt2Qx4xYGMMg9EaSqS7ZD8cC
         le89Mn+Le2O2GHr1QJqhFO/naDOlQuOObV90y9HuumByKucDB7K56A2ZjObzZh/yHRnr
         tOxg==
X-Gm-Message-State: AOAM530Ab1gwJVXC0jgUHrC0DVlxhua4e7VTXEAC9V1sc66AsvD/i1uP
        Ske1f/nsBSTIEjEK1zIWnWKn
X-Google-Smtp-Source: ABdhPJzGeAR7dhe85Bq8vjqZDwu3MBWPQQQd09aHXn3V8TzzsQ/+nSmTzQ3e7og0FAfsdSe7VswsEw==
X-Received: by 2002:a17:902:eb46:b0:158:341d:93a3 with SMTP id i6-20020a170902eb4600b00158341d93a3mr16011554pli.1.1650381208560;
        Tue, 19 Apr 2022 08:13:28 -0700 (PDT)
Received: from thinkpad ([117.202.186.149])
        by smtp.gmail.com with ESMTPSA id g15-20020a056a0023cf00b004e17e11cb17sm18046389pfc.111.2022.04.19.08.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:13:28 -0700 (PDT)
Date:   Tue, 19 Apr 2022 20:43:20 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bean Huo <beanhuo@micron.com>,
        Daejun Park <daejun7.park@samsung.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Can Guo <cang@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] scsi: ufs: Increase the UIC command timeout to 5
 seconds
Message-ID: <20220419151320.GA8699@thinkpad>
References: <55bd9cf4216e80e73e63cf25c042d60e67592b44.1650331167.git.quic_nguyenb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55bd9cf4216e80e73e63cf25c042d60e67592b44.1650331167.git.quic_nguyenb@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 18, 2022 at 06:36:05PM -0700, Bao D. Nguyen wrote:
> Increase the UIC command timeout to avoid false and unnecessary
> UFS errors printout. There are increasing number of false UIC command
> timeout error events where the actual cause of the issues is interrupt
> starvation. When looking into these issues closely, it was clear that
> the UIC command completed successfully, but the CPUs were hogged by other
> subsystems for more than 500ms, causing a false UIC command timeout.
> 

UFS irq handler is a hardirq. Not sure how CPU starving can happen here.
Unless all CPUs are occupied by hardirq handlers from other subsystems.

Thanks,
Mani

> Increase the UIC command timeout to 5 seconds to avoid false and
> time consuming support calls so that we can shift the focus to where
> the real issue would be.
> 
> Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 3f9caaf..806acf4 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -35,7 +35,7 @@
>  				 UTP_TASK_REQ_COMPL |\
>  				 UFSHCD_ERROR_MASK)
>  /* UIC command timeout, unit: ms */
> -#define UIC_CMD_TIMEOUT	500
> +#define UIC_CMD_TIMEOUT	5000
>  
>  /* NOP OUT retries waiting for NOP IN response */
>  #define NOP_OUT_RETRIES    10
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
