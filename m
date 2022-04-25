Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D117650E0FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 15:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238933AbiDYNEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 09:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241155AbiDYNEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 09:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1EE68140B7
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650891674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Dg4uWbHMC2p+lHpBaAPXkFLszBBt4tnvhfrbLJtxikU=;
        b=LAL4zz//70aH3rmj+pb6LhPIKPzBPPBJVuaECwxeSR4MShonIY3mRBPvA/PrWaMYbGaNJ2
        urhh8+S54Xyu3HK7kXf/yHSXjQogM7N5njgl8SrUW9U97TziiS5bC3b5kkOaiTrS8nRWfa
        XjjSfMWocaslxf6pvsR6oFaJWNLYIYY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-6XHT0WaAOjKziuo7PPGLhw-1; Mon, 25 Apr 2022 09:01:13 -0400
X-MC-Unique: 6XHT0WaAOjKziuo7PPGLhw-1
Received: by mail-qv1-f71.google.com with SMTP id b8-20020a056214002800b0044666054d36so12422384qvr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 06:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dg4uWbHMC2p+lHpBaAPXkFLszBBt4tnvhfrbLJtxikU=;
        b=7378oizrwXGVfIs7iOQ5jLq+nN6nKzXHHhOa/i2k3YLur5lb7YfzUej27WtzM+8gbL
         ghm7VJ5t7D/kDv7JERA+p7YPpGZ9+jI7ahj468JbSmsFU25eTAm9LJroAmkJwbFaIiEJ
         XlKpG2+L6QesZmZRWuCumkKeM8s3gHhoqjKgOQWTk9J5mm5501TibTqup1IYTjfhdODU
         TpHk+YQffy0q1dUwD/IgKd5TO6zsAEQx1CqfYtlg72lZcznIKpORtvajd4vSukvGvPRu
         +5JkZ4LsLhZuZCtM3usCTwqzYeTegEbcZq8zE6YqXPp4iEoWchJHeehE4iLuxPcBnof9
         V1VQ==
X-Gm-Message-State: AOAM533IDICSOuVJDWzDuW+KtdUDL3YZSmqieP11/ne+UVryz/G4yOeH
        dDlZ5EJuyTi0ofB8zPfE8Nzyzoe6UgBwdoHT+AJw5qSow3bJZ/nqqPIYWRtU0/HAdBEpqGd7fxh
        FNxk9422acYFX37JEXW+8X3uiSg==
X-Received: by 2002:a37:5c9:0:b0:69f:7096:32df with SMTP id 192-20020a3705c9000000b0069f709632dfmr346373qkf.257.1650891672348;
        Mon, 25 Apr 2022 06:01:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhhv1dQrHygC+XLF+bCT3LS4/h1WyYfCFjZw5aPBiYsYZ4XKDz/S5yo4PgcO9Bem9oTXMezA==
X-Received: by 2002:a37:5c9:0:b0:69f:7096:32df with SMTP id 192-20020a3705c9000000b0069f709632dfmr346287qkf.257.1650891671643;
        Mon, 25 Apr 2022 06:01:11 -0700 (PDT)
Received: from halaneylaptop (068-184-200-203.res.spectrum.com. [68.184.200.203])
        by smtp.gmail.com with ESMTPSA id g4-20020ac87d04000000b002e06b4674a1sm6588357qtb.61.2022.04.25.06.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 06:01:11 -0700 (PDT)
Date:   Mon, 25 Apr 2022 08:01:08 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        martin.petersen@oracle.com, jejb@linux.ibm.com,
        avri.altman@wdc.com, alim.akhtar@samsung.com,
        linux-arm-msm@vger.kernel.org, quic_asutoshd@quicinc.com,
        quic_cang@quicinc.com, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org
Subject: Re: [PATCH v2 2/5] scsi: ufs: qcom: Simplify handling of
 devm_phy_get()
Message-ID: <20220425130108.2noffk7p6lyakcec@halaneylaptop>
References: <20220423140245.394092-1-manivannan.sadhasivam@linaro.org>
 <20220423140245.394092-3-manivannan.sadhasivam@linaro.org>
 <YmQYZ8l+QOsz11ld@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmQYZ8l+QOsz11ld@ripper>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 23, 2022 at 08:16:55AM -0700, Bjorn Andersson wrote:
> On Sat 23 Apr 07:02 PDT 2022, Manivannan Sadhasivam wrote:
> 
> > There is no need to call devm_phy_get() if ACPI is used, so skip it.
> > The "host->generic_phy" pointer should already be NULL due to the kzalloc,
> > so no need to set it NULL again.
> > 
> > Also, don't print the error message in case of -EPROBE_DEFER and return
> > the error code directly.
> > 
> > While at it, also remove the comment that has no relationship with
> > devm_phy_get().
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/scsi/ufs/ufs-qcom.c | 26 +++++---------------------
> >  1 file changed, 5 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> > index bee81b45299e..6ee33cc0ad09 100644
> > --- a/drivers/scsi/ufs/ufs-qcom.c
> > +++ b/drivers/scsi/ufs/ufs-qcom.c
> > @@ -1022,28 +1022,12 @@ static int ufs_qcom_init(struct ufs_hba *hba)
> >  		err = 0;
> >  	}
> >  
> > -	/*
> > -	 * voting/devoting device ref_clk source is time consuming hence
> > -	 * skip devoting it during aggressive clock gating. This clock
> > -	 * will still be gated off during runtime suspend.
> > -	 */
> > -	host->generic_phy = devm_phy_get(dev, "ufsphy");
> > -
> > -	if (host->generic_phy == ERR_PTR(-EPROBE_DEFER)) {
> > -		/*
> > -		 * UFS driver might be probed before the phy driver does.
> > -		 * In that case we would like to return EPROBE_DEFER code.
> > -		 */
> > -		err = -EPROBE_DEFER;
> > -		dev_warn(dev, "%s: required phy device. hasn't probed yet. err = %d\n",
> > -			__func__, err);
> > -		goto out_variant_clear;
> > -	} else if (IS_ERR(host->generic_phy)) {
> > -		if (has_acpi_companion(dev)) {
> > -			host->generic_phy = NULL;
> > -		} else {
> > +	if (!has_acpi_companion(dev)) {
> > +		host->generic_phy = devm_phy_get(dev, "ufsphy");
> > +		if (IS_ERR(host->generic_phy)) {
> >  			err = PTR_ERR(host->generic_phy);
> > -			dev_err(dev, "%s: PHY get failed %d\n", __func__, err);
> > +			if (err != -EPROBE_DEFER)
> > +				dev_err_probe(dev, err, "Failed to get PHY\n");
> 
> I believe the idiomatic form is:
> 			err = dev_err_probe(dev, PTR_ERR(host->generic_phy), "Failed to get PHY\n");
> 
> 
> But as with the previous patch, please remove the condition and you have
> my:
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn

With the Bjorn's suggested change applied:
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks,
Andrew

> 
> >  			goto out_variant_clear;
> >  		}
> >  	}
> > -- 
> > 2.25.1
> > 
> 

