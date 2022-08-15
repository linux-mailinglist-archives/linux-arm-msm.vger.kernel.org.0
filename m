Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B537593134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Aug 2022 17:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242201AbiHOPA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Aug 2022 11:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242721AbiHOPAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Aug 2022 11:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9617EDD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Aug 2022 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660575619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gkp6W0UnvJNbc+E/frEsC8/SAoG8aGkv8tG/23+JfF4=;
        b=fGgRzCLgMlHBTFPP/ECfWhT91fL+hkyHsqcyvgRYPqs2IGb3XpJvGdU6zBByFIGmLM1TVF
        fDU9S1/9ufMPzzkVrsla+1coWvrtBZmc/+70eD9sQWsLzfyOAkClAMFsrbDHPS/MPVnMDx
        3J3dK0L1fx3JoDM+XPLpWBGkenPfVic=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-5ejCkoG6OjCS3q_Asavu1A-1; Mon, 15 Aug 2022 11:00:18 -0400
X-MC-Unique: 5ejCkoG6OjCS3q_Asavu1A-1
Received: by mail-qt1-f198.google.com with SMTP id bq11-20020a05622a1c0b00b003434f125b77so6459724qtb.20
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Aug 2022 08:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=gkp6W0UnvJNbc+E/frEsC8/SAoG8aGkv8tG/23+JfF4=;
        b=5dxZuGjhP/+FOt4lV0HDecEgtl4S5h8Qd8ge/qwF2x1nQMzN9uPukQZJJ02DDpfHhI
         eMQ1DatSW+YurDulE9qYdCO2JlavhouoJHawBKQ0pMOYv6iRxpl8czf5I8zWicuoBwo+
         oleajQea+M5J42O16z+JLtfKEPIbfpKOCAUoV3rO7/MEoXEuR9rcKLAn9lj7o4bvlLL/
         PuodxNhJtniVH8OKv9lpHLrXDpUoOKGR/8e89DPF0i7VmKOmEik4Hl3r9HfIHqUCFqx9
         Fp4FvNyBgAtnsh86m8ODDfpKke+dfH89pn3nW7Vv2cfWg6oU6PwNCcBjEAXBymVcZvmv
         clFA==
X-Gm-Message-State: ACgBeo3onoVAkUpwLEBg0COTNteX3KAbTg4OgTL2m/A7LedDPtXWpaDp
        7FrBo78AkMBs1/2YOh+Dp/5gYtYm2bq2zLHVF0mi2GXakpAVOBQkBov9hkpT3YbV73sRoLG3PiR
        0+PcGgmlvhRt4s8rtq9dt75GMNg==
X-Received: by 2002:a05:620a:459e:b0:6ba:c5a7:485c with SMTP id bp30-20020a05620a459e00b006bac5a7485cmr11298139qkb.267.1660575617712;
        Mon, 15 Aug 2022 08:00:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5vLK2IsSc5T3esQZcOlGhUNLYtZ2weQin9eem0kTWU742yhnPNdz0yjaOkJuyqisTE/LZdfA==
X-Received: by 2002:a05:620a:459e:b0:6ba:c5a7:485c with SMTP id bp30-20020a05620a459e00b006bac5a7485cmr11298120qkb.267.1660575617465;
        Mon, 15 Aug 2022 08:00:17 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id fb6-20020a05622a480600b00342fcdc2d46sm8312778qtb.56.2022.08.15.08.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 08:00:17 -0700 (PDT)
Date:   Mon, 15 Aug 2022 11:00:16 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sa8295p: move common nodes to
 dtsi
Message-ID: <YvpfgGh7T7jZTn2R@xps13>
References: <20220812165453.11608-1-quic_ppareek@quicinc.com>
 <20220812165453.11608-3-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812165453.11608-3-quic_ppareek@quicinc.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 12, 2022 at 10:24:52PM +0530, Parikshit Pareek wrote:
> There are many ADP boards with lot of common features. Move common
> nodes to sa8540p-adp.dtsi file. This will be base for many ADP boards
> to be introduced in near future.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts  | 377 +--------------------
>  arch/arm64/boot/dts/qcom/sa8540p-adp.dtsi | 384 ++++++++++++++++++++++
>  2 files changed, 385 insertions(+), 376 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sa8540p-adp.dtsi

My understanding of the sa8295p auto board is that it has a single SoC.
The sa8540p auto board has dual SoCs (same SoC variant as the sa8295p)
with a PCIe interconnect between the two SoCs. I hate to bike shed on
the name but perhaps the name sa8295p would be more fitting like you
had it in v2, but ultimately leave it up to the maintainers on which
name to use here.

How will the dual SoCs in the sa8540p be represented in device tree?
I assume just document the PCI endpoint to the other SoC? Then run
the two SoCs independently and let them see the other SoC through
PCIe?

Brian

