Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B251373B867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjFWNHg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjFWNHf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AA52130
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687525617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+nlw8o0x9EmBbnewRBB9FOcSf2qgr1xezY4CpDaC89M=;
        b=dqGqlyik+K7vpvkYhcae8Oa26XEXAhC97ZeW0zP97e409/aneI/ePk2O+0Kxy/GavajD1e
        cPuWemHIah0KsgrlNjiX0Ycrn4i1Uaz0cQOSdeSuqzygSwsb9Is9CFCglNsslJiH+oMgM/
        SMqP33xJYP0xjv3WQztdrtzjdfQ6cc0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-JC1J3ulPP7WtECs10PJ3CA-1; Fri, 23 Jun 2023 09:06:55 -0400
X-MC-Unique: JC1J3ulPP7WtECs10PJ3CA-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3a044f9104dso553380b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687525615; x=1690117615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nlw8o0x9EmBbnewRBB9FOcSf2qgr1xezY4CpDaC89M=;
        b=Vg0yQleSBMHf6u16Jl6Geoqfcx1GAqyG+TLatmDJOUgsjKD0+jtbigefxvh+OQfQXJ
         16oBl7YfamsQiq2x9AooBvNb4JhZUuqGjL5lQQhuZxl2Va2ALceV2LFpIvfJmdsZFWFc
         M73HqVPITPIpDzock2IHbZcFQQDJrQ90K1S1nTG8w+R/gcfDWTAUWViEeApjUeqfzKYk
         630ZSUh7psM4dN0oBfkVTa+4A8xYm+nvcw0pAwHZjyfvuFEYt93+7pLhbftGzJ3WQSBF
         M+l1A7cLhWn9RXEdP9xfx4GrvS6o/HYC/W8rPBV1Ux5bI6HEFvo46l24q874zT112Vxs
         oYtQ==
X-Gm-Message-State: AC+VfDxRz0w6egIHH6osksLYGIMjvAtDApGaP8nz2yFlxpBsniMfPG0B
        bZM4BEvK82qIHk9wvXQEIdtYYVNCp/X3ZY1NrAsRMYrmRgv5I9DfQ9L5SWVCRo22nKqrL5LThse
        mCP67FDSh43xlmEvaiPig5O7qeA==
X-Received: by 2002:a05:6808:1386:b0:39e:b84b:4786 with SMTP id c6-20020a056808138600b0039eb84b4786mr20204380oiw.27.1687525615071;
        Fri, 23 Jun 2023 06:06:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73eFqk8vQn5O2qswhndAQq+yzi1FAVd85HKmLTe2wlqJ6VQg6y5tF3WlSHMlgK/pA6NSAzsQ==
X-Received: by 2002:a05:6808:1386:b0:39e:b84b:4786 with SMTP id c6-20020a056808138600b0039eb84b4786mr20204357oiw.27.1687525614823;
        Fri, 23 Jun 2023 06:06:54 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id be18-20020a056808219200b003a05636f4a8sm2061949oib.29.2023.06.23.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:06:54 -0700 (PDT)
Date:   Fri, 23 Jun 2023 08:06:51 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v2 00/12] net: stmmac: replace boolean fields in
 plat_stmmacenet_data with flags
Message-ID: <20230623130651.a36qensnjwx6j4ea@halaney-x13s>
References: <20230623100845.114085-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623100845.114085-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 23, 2023 at 12:08:33PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As suggested by Jose Abreu: let's drop all 12 boolean fields in
> plat_stmmacenet_data and replace them with a common bitfield.
> 
> v1 -> v2:
> - fix build on intel platforms
> 
> Bartosz Golaszewski (12):
>   net: stmmac: replace the has_integrated_pcs field with a flag
>   net: stmmac: replace the sph_disable field with a flag
>   net: stmmac: replace the use_phy_wol field with a flag
>   net: stmmac: replace the has_sun8i field with a flag
>   net: stmmac: replace the tso_en field with a flag
>   net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
>   net: stmmac: replace the vlan_fail_q_en field with a flag
>   net: stmmac: replace the multi_msi_en field with a flag
>   net: stmmac: replace the ext_snapshot_en field with a flag
>   net: stmmac: replace the int_snapshot_en field with a flag
>   net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
>   net: stmmac: replace the en_tx_lpi_clockgating field with a flag
> 
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  4 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 23 +++++------
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  5 ++-
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  8 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  4 +-
>  .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  4 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++--------
>  .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++--
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  5 ++-
>  include/linux/stmmac.h                        | 26 ++++++------
>  12 files changed, 76 insertions(+), 57 deletions(-)
> 
> -- 
> 2.39.2
> 

The series looks proper to me:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

