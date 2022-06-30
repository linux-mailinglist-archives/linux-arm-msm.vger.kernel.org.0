Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B7B560F51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 04:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiF3Cr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 22:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiF3CrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 22:47:20 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EE026AC8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 19:47:19 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-101b4f9e825so24029006fac.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3ywqPnrjk7+VPwmHhFZLyGQcPPOrrzS3ghZVEbWBRsY=;
        b=Yfiv4yeJnVDfKHzZxIVuXfngaSaGc/rDJgH1CtKIs+fDZol8XTu0pzq4mN6GQjNtrN
         u2DfBT3VuIIxD/5Z7+K8WuPcUDhA4h8rIcK7EXuvrVqC9xb9K+Uk5i9tE6z2vNRo0PaG
         xr1KJxjWun0V9ioMUFS25LfPCpJctZpcwTIE22c+Hd9SlMepazMbzB0WzvoB4ryvXZAc
         wDI77EpN+KZueTi3op/HW0x7VswoEHnv43PN5We8T6uFyhdukN0jRfusAfOowRRV9igT
         d9vlo5H5kDfKvCheJIBjTbtOyRaHJ8horb0mrRTmR3YbQ1dnq2b7Uu+/3XweowC/32iN
         OEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ywqPnrjk7+VPwmHhFZLyGQcPPOrrzS3ghZVEbWBRsY=;
        b=j2/9qFy2SmcLERGC7k2r0k/SBSduoeh4m750ifBbgpCV4BDDC6pzZTKB2fnozbPHVU
         IrWfHvfTTh9jfupJSFQu/ECkHPyNX/of8lUmrq4K25vQRMauCdueQ6r0bwm1D7niUN1B
         NlybKwtleAIDvdLK1/zLQlROXhAkaIA3m/gRCIbJLDDUFJDEMJfKTzkHywlEh/E1wgyK
         FwNnwRoROsc0BO8zLj1gfNxk47A1bjdmY5WyROVmKUJJ4LXWA9U1B3HAsMZi14auB27U
         wnaErrSpxR/MHqkCOm5mJCrL0FATGkX38qt/lsVaIdpKNuReJOX0dHOpFm/uM/YpuoJg
         h1Xg==
X-Gm-Message-State: AJIora8Od7sq491sD8qtLco7ij451MlyCI1BToVBfh0cTK9djrn4leb8
        8YqH+JcxBy2v4xIsfdGh+cyHcg==
X-Google-Smtp-Source: AGRyM1vT5F9b2gbHBQlo0yTk02K5QrCj8X+q2voFbBIbG489Mv1argV4Cf2nf/uYkeUq4NeV1lqbpQ==
X-Received: by 2002:a05:6870:b60e:b0:e9:35aa:3cb8 with SMTP id cm14-20020a056870b60e00b000e935aa3cb8mr3706626oab.249.1656557238394;
        Wed, 29 Jun 2022 19:47:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 7-20020aca2107000000b003264a325ecdsm9555170oiz.5.2022.06.29.19.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 19:47:17 -0700 (PDT)
Date:   Wed, 29 Jun 2022 21:47:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_psodagud@quicinc.com, eberman@codeaurora.org
Subject: Re: [RFC 0/3] Add interconnect support to the SCM interface
Message-ID: <Yr0Os5TOITY7f0Wk@builder.lan>
References: <1653289258-17699-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653289258-17699-1-git-send-email-quic_sibis@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 23 May 02:00 CDT 2022, Sibi Sankar wrote:

> Some of the SMC calls required by remoteproc PAS driver on SM8450 SoCs
> get a performance benefit from having a max vote to the crypto->ddr path.
> Add support for bandwidth (bw) voting for those SMC calls when the
> interconnects property is specified. Marking this as an RFC since the path
> could either be specified in the individual remoteprocs or directly in the
> scm interface.
> 

I find it reasonable to state that the clocking needs for the CE relates
to the SCM and not the remoteproc, and it's in line with the management
of CE clocks from the SCM driver.

Regards,
Bjorn

> Sibi Sankar (3):
>   dt-bindings: firmware: qcom-scm: Add interconnects property
>   firmware: qcom_scm: Add bw voting support to the SCM interface
>   arm64: dts: qcom: sm8450: Add interconnect requirements for SCM
> 
>  .../devicetree/bindings/firmware/qcom,scm.txt      |  1 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               |  1 +
>  drivers/firmware/qcom_scm.c                        | 69 ++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
> 
> -- 
> 2.7.4
> 
