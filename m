Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC1C7B77C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 08:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241298AbjJDGZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Oct 2023 02:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbjJDGZg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Oct 2023 02:25:36 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07EB5B7
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 23:25:32 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6907e44665bso1353002b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 23:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696400731; x=1697005531; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f0giunb9BhnZYuBT/MmDlnRVSxHXgyke+1Gd+H5zheI=;
        b=qwOPWgC7ZX8ZZ6Za/SHn7TEjABBj52petaMyVmRZ5nOkr+Kn0U+CZNNMJf/eJq/TnG
         uhKLX7F1xVhoC4IYzfRPj0/BZnelmiK2M6cJeHumqG+2Y06DdEPlmfd65Q17CKuDVZks
         58nOOFx82aYKFpo9FXa/qHEh3/xUON6bgEByLh7+kD2fPCFLqOrCZa17c69r6R+6F8Ml
         foXwRVtkn6Lx/KeI3VMftvX7eszgIcTeynyXmwXMb/A7uhAQcu0eUH9quzGGw6Wjv6+m
         T20TQAlhWYJ0DHEKxkFSIIWv8VUT0Z9n74fwii6BrgUCV3iwt5up51rQiqn3RFyUGXSh
         R/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696400731; x=1697005531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0giunb9BhnZYuBT/MmDlnRVSxHXgyke+1Gd+H5zheI=;
        b=lr+K3cYwz0X/pLk0Ba66DmthtVGoo8EC4NtUrW8KahZJysvJ+eJvFEmVGc1Av9eU6H
         fzUoxwJ6ZGaNlwrhBzWMrrsVBZqUj8eOozVjFlhsCKy/eGl3aIcLl1TLOKBtkwn/fscb
         g2OVqPGbpf3a+x4STNuZylMZ3GnNMcIEfkfUslQ4XVxIogbGqGx3VKrCWrb9LD3l9Xv9
         FKAg4NsLIQK66d0Ia9GxXG7WY68Xb5p223x0fRnIFFZw36GibNOZk/KpbAlvJ1U+FeFL
         QkO7qBa6FEoTtoy2vCQ8v6G60h535/a3bEtVe3KljjMmgfxAjuv43Bfa7m4LU+0eWAgv
         wBcQ==
X-Gm-Message-State: AOJu0YyN+MFeP8y7p1JU4pTb4AH3tZO8jqxpOpIphRRDUos6Mx25TMyT
        lFIv5/1UM7RnKYYy8kcf6xR3
X-Google-Smtp-Source: AGHT+IHI7kawFl5SaCr7XhbcdTB8XLLp7rEonsye5ookJXsWWivhaTNtQoYoPX3mKjNafQz3TbUA8g==
X-Received: by 2002:a05:6a20:6a25:b0:163:f945:42da with SMTP id p37-20020a056a206a2500b00163f94542damr1749678pzk.48.1696400731277;
        Tue, 03 Oct 2023 23:25:31 -0700 (PDT)
Received: from thinkpad ([117.217.185.220])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001c728609574sm2756459plh.6.2023.10.03.23.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 23:25:30 -0700 (PDT)
Date:   Wed, 4 Oct 2023 11:55:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: sm8250: Add OPP table support
 to UFSHC
Message-ID: <20231004062518.GB7298@thinkpad>
References: <20231003111232.42663-1-manivannan.sadhasivam@linaro.org>
 <20231003111232.42663-7-manivannan.sadhasivam@linaro.org>
 <CAA8EJppOuAnVsnV0tYLyGqyJy3xVt2ToTZ+r9hyNd=VgK1Ez8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppOuAnVsnV0tYLyGqyJy3xVt2ToTZ+r9hyNd=VgK1Ez8Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 03, 2023 at 06:25:22PM +0300, Dmitry Baryshkov wrote:
> On Tue, 3 Oct 2023 at 14:16, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > UFS host controller, when scaling gears, should choose appropriate
> > performance state of RPMh power domain controller along with clock
> > frequency. So let's add the OPP table support to specify both clock
> > frequency and RPMh performance states replacing the old "freq-table-hz"
> > property.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 39 +++++++++++++++++++++-------
> >  1 file changed, 30 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index a4e58ad731c3..33abd84aae53 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2198,21 +2198,42 @@ ufs_mem_hc: ufshc@1d84000 {
> >                                 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> >                                 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> >                                 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> > -                       freq-table-hz =
> > -                               <37500000 300000000>,
> > -                               <0 0>,
> > -                               <0 0>,
> > -                               <37500000 300000000>,
> > -                               <0 0>,
> > -                               <0 0>,
> > -                               <0 0>,
> > -                               <0 0>;
> > +
> > +                       operating-points-v2 = <&ufs_opp_table>;
> >
> >                         interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI_CH0 0>,
> >                                         <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
> >                         interconnect-names = "ufs-ddr", "cpu-ufs";
> >
> >                         status = "disabled";
> > +
> > +                       ufs_opp_table: opp-table {
> > +                               compatible = "operating-points-v2";
> > +
> > +                               opp-37500000 {
> > +                                       opp-hz = /bits/ 64 <37500000>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <37500000>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>;
> 
> I must say I still consider this to be uglier than hard coding clock
> names in the driver.
> 

It is all about choosing the less uglier one... First of all, it is not a good
practice to hardcode clk names in the driver as the driver has to trust what is
being supplied from DT. Also, the OPP support is added in the generic
"ufshcd-platfrm" driver. Now for getting the clk names, I need to introduce a
method to pass the names from the vendor drivers. There are already many such
methods going between these two drivers making it messy and adding one more
would only add up the worse.

So I'd like to stick to this approach.

- Mani

> > +                                       required-opps = <&rpmhpd_opp_low_svs>;
> > +                               };
> > +
> > +                               opp-300000000 {
> > +                                       opp-hz = /bits/ 64 <300000000>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <300000000>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>,
> > +                                                /bits/ 64 <0>;
> > +                                       required-opps = <&rpmhpd_opp_nom>;
> > +                               };
> > +                       };
> >                 };
> >
> >                 ufs_mem_phy: phy@1d87000 {
> > --
> > 2.25.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்
