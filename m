Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093577A213C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 16:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbjIOOnQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 10:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235633AbjIOOnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 10:43:15 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D42D1BC7;
        Fri, 15 Sep 2023 07:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694788988; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VeiQ4c8U3muKvH3uogNgB1EwN9z+dyrdJkVZpRXMNWcYWhFQrQyjwBdmNOasRnTTGp
    RM3WNaPvbszckR+1xVIZKu4equXWCrcurdbYeDyM8cnU0nyLYV/6PiWw2Z1dP8LYQxcX
    o3lTq2b2PTJZVeEsCSKNqqvvoGbhdC+ESsP8e4PZJsYV1+PFExyzAQzx/PATEv65TNvn
    PHbjcXxjOrJUJGZLckEl9bp7AbX4Yb27S0/BPaUE1hLPzjEMDkzhwkGOA3Rm/8zOJA6b
    TxlrDSE3bN2BC+XMT/ygu4jTfGY+3iQIIgyw2RM+a4Wa2OTpCjXz9xuHweOZ56jyR9aR
    IrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1694788988;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JQDerBwPFpdX+huluqMekIVv5H0FEkeTLnS+oe23mNE=;
    b=BTVRorL1HtkG+R9/o9oN1jNXB3lZUvF3f94qrrE7sHLsmTB5fyk5aOjWgUEYBv71na
    O2R16j0YnozRkABga5faDUA/JQ5MaumNbwCRt7FOUmHiKPpqBKFuu3XBUWZPosbM1Xxb
    SCbHrH+tPN2nGQtqZL1AM6khzDKBfxh32j/XFPEMFmMA1x8XjsmiDhqEDNihq6DuLb+p
    K/SXIltg3CD0Rs2XUDgowRZPFfaa+uydPPw4f7S1OlulasLOVBCiN0RKCF4SGZj/RRRn
    ebpVwzcjGPRZqqI8HtKmJsTggnIKj6w8qI/kerVv+38vITZU6HFfYdnKsl0lOUrcaZeg
    hvIw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1694788988;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JQDerBwPFpdX+huluqMekIVv5H0FEkeTLnS+oe23mNE=;
    b=Iqm+/odgJBZYGNNv40zYdPmyViEzvQYrKVwNfevyXBW7kNx8iSNnT8hX81LkdbYV52
    TZYMY6/ehns3E5mVl4tjD4d5cQRDC9n0Yc+81C4iON3vqewnySgUk1p6czuFijQxj1Gr
    sLYIGFMvvHYnaModGyVxHj0ORvw49UByufLU3j8TprxmZqaIA04ds7TIOGYXaCHhb944
    8Z/p+STdaJ3Of5HQeeYurDxfFDUTMkwJcpnZrDkcFVidD0DC6eg57JKMEQz06zLXdRZ/
    lrmCPyzxzoBRTYrj97Lx6TrMDkt1f0G2YjK6mEnbzp9ISX5gIY7syfmmQ8125XQ4SIpG
    l01w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1694788988;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=JQDerBwPFpdX+huluqMekIVv5H0FEkeTLnS+oe23mNE=;
    b=xOklVqVdCXbaubQ8rrkuq15K58DwYJ9wvgXRUxhwgsbN2+ZD7ugHIHBPVY7MmAd9pn
    OWSTCZqZWxd/FRvZ+0DA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4paA8piJ1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id R04c57z8FEh7871
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 15 Sep 2023 16:43:07 +0200 (CEST)
Date:   Fri, 15 Sep 2023 16:42:58 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Gaurav Kohli <quic_gkohli@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916: Fix iommu local address
 range
Message-ID: <ZQRtchQ0HqmgkvIa@gerhold.net>
References: <20230915143304.477-1-quic_gkohli@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915143304.477-1-quic_gkohli@quicinc.com>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 15, 2023 at 08:03:04PM +0530, Gaurav Kohli wrote:
> Fix the apps iommu local address space range as per data sheet.
> 
> Fixes: 6a6729f38436 ("arm64: dts: qcom: msm8916: Add IOMMU support")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

Aside from the minor things Konrad mentioned (v1 -> v2) FWIW:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Although I can kind of understand that starting to count at 0 often
feels more intuitive, especially for Linux kernel things. :-)

> ---
> Changes since v0:
> -Update Fixes tag.
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 33fb65d73104..3c934363368c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1813,7 +1813,7 @@
>  			#size-cells = <1>;
>  			#iommu-cells = <1>;
>  			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
> -			ranges = <0 0x01e20000 0x40000>;
> +			ranges = <0 0x01e20000 0x20000>;
>  			reg = <0x01ef0000 0x3000>;
>  			clocks = <&gcc GCC_SMMU_CFG_CLK>,
>  				 <&gcc GCC_APSS_TCU_CLK>;
> -- 
> 2.17.1
> 
