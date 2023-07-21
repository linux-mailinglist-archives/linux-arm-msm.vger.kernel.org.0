Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397F975C34C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 11:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbjGUJnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 05:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbjGUJmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 05:42:52 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C9D35B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 02:42:29 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6686a05bc66so1234613b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 02:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689932529; x=1690537329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFcU7/ffJj4GpqTDJrXsJdgjnuOhtBeWbIDJjevNDPU=;
        b=hiqCACW2e6ToVhtF/uGbndLMELQTUVszaKBSFRTyxHpLpZWPVTlffOehyOxsrk91e/
         zp2RgL/2DLad18tMqmIMWvSSwonUi5XvydaEaGjZA7GuFnusqAphYfg9qVnjYuR+AR9w
         Y2bTY/rACSniqAgu2PwGuAtmYeeusYUwnyxcaimdcRhux+6Y2ce8u4ai83/TEod5z0v5
         m/esqcISu4CTa64qDKf90ooAXLrz+22Njc3B3AZlINViptNVeGBwJQgRoxfdV1lX4EmL
         W5/MYUQP+m5KHhCHguV5BEPdG/N/1oL+HG/l2fzkwVcbiBFZLa9b31YA46HmosANomkQ
         GwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689932529; x=1690537329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFcU7/ffJj4GpqTDJrXsJdgjnuOhtBeWbIDJjevNDPU=;
        b=YYKWYkUVuHn5IBrLc49tLC4+GVybAuecOlEIPu2hL3mimXwIx10kX+tP1Fg3u+jCgK
         ETy7P8RoTf0h/GkXhFAV6i9Ypqz1rD3f9ORgQXSSxPZ5sFwm4AGEPfYDhEAlK/PvQAWJ
         i9W0f5lTEoCUNRK4z896DVypigiBdrVssZ6w14FdMDS+fF3t2cCF0Rhodr05jyaRLD3a
         oqZdt/iw9fMMGdxS0poafU1XnSwaJRF5RDg9SC7pdqS785fu9rR3vSsvjc4lQW1likcP
         BbJaGapPx1eW8jPfIBxop2atUO5FtTMoKSjvIgI3ldjD3F8usdYfWnvapqAQdW4LON38
         JVdw==
X-Gm-Message-State: ABy/qLYDG2bf0ttN5a4g8yCHE3WuvI+G0uP+AotxKJ9XRwHqq6jAn8h7
        rTiVeyXaVta5OUnIpF/EM5Ve5A==
X-Google-Smtp-Source: APBJJlHkH7Uv7pWn/MP4FMrAIT/Cc7VTogZMZvc6nxyeSZL/vi3Feh7E3jJubjRUzodKuGKTOER0ag==
X-Received: by 2002:a05:6a20:841e:b0:11f:6dc:4f38 with SMTP id c30-20020a056a20841e00b0011f06dc4f38mr1573730pzd.55.1689932529270;
        Fri, 21 Jul 2023 02:42:09 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001b88af04175sm2997093pls.41.2023.07.21.02.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 02:42:08 -0700 (PDT)
Date:   Fri, 21 Jul 2023 15:12:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
Subject: Re: [PATCH v2 00/15] UFS: Add OPP and interconnect support
Message-ID: <20230721094206.dfgnn73kmzzj6rtw@vireshk-i7>
References: <20230720054100.9940-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720054100.9940-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-07-23, 11:10, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series adds OPP (Operating Points) support to UFSHCD driver and
> interconnect support to Qcom UFS driver.
> 
> Motivation behind adding OPP support is to scale both clocks as well as
> regulators/performance state dynamically. Currently, UFSHCD just scales
> clock frequency during runtime with the help of "freq-table-hz" property
> defined in devicetree. With the addition of OPP tables in devicetree (as
> done for Qcom SDM845 and SM8250 SoCs in this series) UFSHCD can now scale
> both clocks and performance state of power domain which helps in power
> saving.
> 
> For the addition of OPP support to UFSHCD, there are changes required to
> the OPP framework and devfreq drivers which are also added in this series.
> 
> Finally, interconnect support is added to Qcom UFS driver for scaling the
> interconnect path dynamically. This is required to avoid boot crash in
> recent SoCs and also to save power during runtime. More information is
> available in patch 13/13.

Hi Mani,

I have picked the OPP related patches from here (apart from DT one)
and sent them separately in a series, along with few changes from me.
Also pushed them in my linux-next branch.

Thanks.

-- 
viresh
