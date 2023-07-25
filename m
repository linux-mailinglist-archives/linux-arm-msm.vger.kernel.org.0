Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789F47624E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 23:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjGYVx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 17:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjGYVx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 17:53:26 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D162139
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:53:25 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-668730696a4so3470753b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 14:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690322005; x=1690926805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FKEGWqR+0CcbBPqsp+sUK+ljfwl+CRQxiq3hvwMVKVA=;
        b=Ezfa2u2HhaeTgeNqBXH8xd9D2MI9qrfjH69Xx0NPM6zHyCWs9yXApqOJjRZsQ2UDbz
         W5bfiOhd1Fb85DDr8JX3eRtQglvAbMRqN3GnL/Ub5AiuUZXguuhlCyAAGo+cPMdCU/+e
         xaU/5GEExeo0ujzemcSnB48J8FP8ET8E5sJ1b8ATpaOKJqBUt4egPXvjvxAwEpMcaZku
         tE8gf9AgqNJGWst37Eld3kg6IjbjwTyiXqocqs20vIJ977nLEJO9d84cPSSSS6vcSPyN
         g8dBcW6QgoMaVclfJ4fQ+sO7HEAjj8N9XOl65pRVUTqID4zH0pi4V8vz3CcGj7r4WGRU
         3eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690322005; x=1690926805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKEGWqR+0CcbBPqsp+sUK+ljfwl+CRQxiq3hvwMVKVA=;
        b=eeaxKNYfOdN2/7mPhr5KG7esu9vPQqx9f8HiL+jjnWyhJcHU0f/l1oA16wXF9UCoju
         hnqBHrRU1bUxbn1bqkil1DiWwuMWUjB5zXR7etcxbtm3k5ebdoI88DlIJLCEoewVy+Ws
         s6lzp/0tM3/LAhy3SChapPiPPO8vupvjle5Fs10yKcYyJ02dlUv2o9Dgg+Gvs1L0MguD
         soxladFYVp+QLL1S50xWdubPf3lf4JTrTyy7+U/susGZRPA2AYjRV5o/2+F87xAcANFG
         TURnvSzTgwpMnthnPLi0QmUIX7xqTwRfT4H54OMBCInZbbOC9HNOdGj6YL0W7F3SaupM
         ky5w==
X-Gm-Message-State: ABy/qLbsdjMLrQRld2RWSjpOI2uGdmb3IvXTsQTCigWdx01UOy5ysDZC
        ad+ra+ot08s+EvSVzrz19vZPVg==
X-Google-Smtp-Source: APBJJlHquQuuWxLQmV9ZAeTnV8BBjL+QYV6S+sbeqEwRh0gcunK9cb74PhLG1/SldT8Yr7YBeJOujQ==
X-Received: by 2002:a05:6a20:4406:b0:137:3eba:b7fb with SMTP id ce6-20020a056a20440600b001373ebab7fbmr343053pzb.2.1690322004749;
        Tue, 25 Jul 2023 14:53:24 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:a7a4:bf67:c9d5:c1b7])
        by smtp.gmail.com with ESMTPSA id i21-20020aa787d5000000b006829b28b393sm10097875pfo.199.2023.07.25.14.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 14:53:24 -0700 (PDT)
Date:   Tue, 25 Jul 2023 14:53:19 -0700
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ziqi Chen <quic_ziqichen@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] scsi: ufs: qcom: remove unused variable
Message-ID: <ZMBET5+0ooHfpJbS@google.com>
References: <20230724122029.1430482-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724122029.1430482-1-arnd@kernel.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 24, 2023 at 02:19:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent change removed the only user of a local variable that needs
> to now also be removed:
> 
> drivers/ufs/host/ufs-qcom.c: In function 'ufs_qcom_mcq_esi_handler':
> drivers/ufs/host/ufs-qcom.c:1652:31: error: unused variable 'host' [-Werror=unused-variable]
> 
> Fixes: 8f2b78652d055 ("scsi: ufs: qcom: Get queue ID from MSI index in ESI handler")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch!
Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/llvm/64c00cd4.630a0220.6ad79.0eac@mx.google.com/
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/ufs/host/ufs-qcom.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 3ee5ff905f9a6..5728e94b6527b 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1649,7 +1649,6 @@ static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *data)
>  	struct msi_desc *desc = data;
>  	struct device *dev = msi_desc_to_dev(desc);
>  	struct ufs_hba *hba = dev_get_drvdata(dev);
> -	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	u32 id = desc->msi_index;
>  	struct ufs_hw_queue *hwq = &hba->uhq[id];
>  
> -- 
> 2.39.2
> 
