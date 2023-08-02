Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EB1776C4ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 07:36:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231818AbjHBFg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 01:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbjHBFg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 01:36:27 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3710FE
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 22:36:25 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686f8614ce5so6049173b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690954585; x=1691559385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v4Fc7P6F/s9IcK1ZkkE4eKQ9aXOxzO0/vcsB9Z0O/Gk=;
        b=BBVnGf/vOrDe8m9btKDPytfzv/3xhPsvVTOq6PPU5677am04z3rpQfbGwl5UonDa4R
         7oHUnEstdprokoKtwBIsc3ttdEXtNM2ePOFFnLtrBs0m8iIHcpvqPONw5X/PFAqWGnvu
         TX5E8BaZhskQrJ/d3WjL6LFKnto8/IyQ3CMP4lLWIET68PrmxFh9u8o6A9wCG7At/lch
         5ArMhTg+8YvDFC89vUeYJmouV1H6S0yazsrRKloi4HpCVtvYMQKjWhZFFPvXTn8Hh5p0
         pN6DCPUYkQgn22EWG4vq1CYg3gLhWsCkdsuhrDeHGW1/a7P0o4mUfnurYjqEpLXNReRg
         ejSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690954585; x=1691559385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4Fc7P6F/s9IcK1ZkkE4eKQ9aXOxzO0/vcsB9Z0O/Gk=;
        b=QdiB2fc16ZjQpkB3E4jCOpWFcE9nTyb+spNPH0RVDkhg9t7XcHFL6b8ZwkN/JhsyXO
         +fdt4BaDynYzUYyxjiATm6rPhYH/FFv7g8YHUPW8HPrxe6jr/kZvq8nJhmLy0SOJ6Ev8
         CPB6uf2ZtMduHGUjKGDtuRJdX4S6tBE6eu4ujli8RY2H1a/MOe59s0IWL6WX9P5CcIJD
         pUpbjzpOFc00HcIqEjc/Vgj3HgK9fFbJo52YoYY9lRAagKwvSjZ2Z+Vrgo4EAFd0ZBY2
         1zFqduQPcicdcOxx0D5EhQ7FjHvIUBfzfNzXNtl4nSxPBAWfed8f0hVZpRxafeUPgn6n
         yH4w==
X-Gm-Message-State: ABy/qLZ9bl2UuHWSi/Ccc4zQ8Q7ngzyVWHoVQEB7xUETk+9t8Jzn2QlD
        CTI1IFtOTGUXX8V461TGcP/D
X-Google-Smtp-Source: APBJJlHOPFFjWAsy/EsguxUGZlcRDKZJJ6x7vD35Quk1YIaSvrN0TR8JHhwQG+8BdPDm5/VTrfRfuQ==
X-Received: by 2002:a05:6a00:1249:b0:674:6dd4:8337 with SMTP id u9-20020a056a00124900b006746dd48337mr17486395pfi.12.1690954585157;
        Tue, 01 Aug 2023 22:36:25 -0700 (PDT)
Received: from thinkpad ([117.193.209.129])
        by smtp.gmail.com with ESMTPSA id y15-20020a637d0f000000b00563b36264besm10780727pgc.85.2023.08.01.22.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 22:36:24 -0700 (PDT)
Date:   Wed, 2 Aug 2023 11:06:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jejb@linux.ibm.com, martin.petersen@oracle.com,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] scsi: ufs: host: Add support for parsing OPP
Message-ID: <20230802053613.GF2370@thinkpad>
References: <20230731163357.49045-1-manivannan.sadhasivam@linaro.org>
 <20230731163357.49045-5-manivannan.sadhasivam@linaro.org>
 <20230801090333.pqqugj4tcarwdl2o@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230801090333.pqqugj4tcarwdl2o@vireshk-i7>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 01, 2023 at 02:33:33PM +0530, Viresh Kumar wrote:
> On 31-07-23, 22:03, Manivannan Sadhasivam wrote:
> > +int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,
> > +			   struct dev_pm_opp *opp, void *data,
> > +			   bool scaling_down)
> > +{
> > +	struct ufs_hba *hba = dev_get_drvdata(dev);
> > +	struct list_head *head = &hba->clk_list_head;
> > +	struct ufs_clk_info *clki;
> > +	unsigned long freq;
> > +	u8 idx = 0;
> > +	int ret;
> > +
> > +	list_for_each_entry(clki, head, list) {
> > +		if (!IS_ERR_OR_NULL(clki->clk)) {
> 
> NULL is considered as a valid clock AFAIR, so you must only be doing
> IS_ERR() here I guess.

Agree that clk_ APIs accept NULL clk, but we already have IS_ERR_OR_NULL() check
everywhere in the driver for clk handling. So I used the same for consistency.

- Mani

> 
> -- 
> viresh

-- 
மணிவண்ணன் சதாசிவம்
