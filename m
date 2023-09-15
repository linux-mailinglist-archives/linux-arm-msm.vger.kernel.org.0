Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612097A2164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 16:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbjIOOtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 10:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbjIOOtC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 10:49:02 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A20F1BE6;
        Fri, 15 Sep 2023 07:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694789334; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BqrFLvcfCv7X7IHwBCzX2oP+K89RPBdwmATUMEA2wCSVbfjOJ0Qbh4NAhp5z7uk7dN
    go29IkLJnUFneWYsCDNjvtC8VXXBLQwV0fznztJg3x3nW4FQQJoTUWOV458B24lALRUm
    2lRoQ6U7nakSHQHDoPfA3Nh+VcQb/1+1YJllrsX5E0Rky63lFyZwQFL8/arW94moZntV
    tn4pto3CFo/Sx0wYwmhu1sW0Z/vsmjy63nu0PTNGTxVJENIAQNj/BPyoi2ymBOvSnW+s
    7ItbhQn0f7aT4A/I9jlqOsJOxR1sKRn+h7ow6vzm+HgM5nuUmRBrroiSD370+EpsM/+7
    I6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1694789334;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=DmrH1Y1uu5a9ntgfPpGKbpjnT1F1jyR1nz4MQOqV/5o=;
    b=FcOowJZjgrlqTMUUq0gFJpLmFLfHQLR8Xt6lhMjs5xaSKMW9GN5A+bUo+wfYzv9won
    7gLAZDFsg2DMnc3lIgZRAZjbK/dDOF+kQVMbQDwgDbmbk2DwU9JWOkDPC0cnhOKUUBW2
    Lgf4tTAy8WJ4DSXTqsRrO++6sDzPckLRWu0EJiC0yiI4meIxomqy95gLFo4Y9HJvri7D
    cQa8Vqx4ConZ5cgWlCaUpQHv8MpgVSjW1ZRWXpfNf7BMXKYBFdDTzfoUTbx+OMKPetjh
    bIobwcqYhtzcvQqB8O3SBAzw4Sj1xvmcQMXGpAlCAeq434xOjdv3tVAvpV+xzJvJ1PqG
    wbnQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1694789334;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=DmrH1Y1uu5a9ntgfPpGKbpjnT1F1jyR1nz4MQOqV/5o=;
    b=SuM1C4efoeabT6jDxTioH1hEab3jlv6azyVoWSdTxymXQtW7ByLN2hbQ56CBFn7osj
    9+6PbTWcNPvTt1w59mecT5fAA6rVRPC8kvFINQuYn5aqJZIUvVlUvukjOgOfPufQoq85
    HpPsKmYg6jSyDIHDQuXK1amsTjpUAv3oz6Hka68/eOOP7E9GxkJrmwevy1A+PMGW76fx
    qQ+puMQSPRWobLTaOTrObftO0Keo9nZBnIKqfQjFFdxYuiUTKy5BGEsH3mUleEoSv3HF
    cibK46LhLBY+gtUpsGWgi10S4ZcTshaCWwWVqeulxxZ7Ha8BdIQkI85nd6UzxXKm9i5Q
    ryNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1694789334;
    s=strato-dkim-0003; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=DmrH1Y1uu5a9ntgfPpGKbpjnT1F1jyR1nz4MQOqV/5o=;
    b=jV4IIdZDzLsNpCzmUWSDZ3lvl0aJ1PteSc9Uq6badEshFIZASufGe1OQ/AbRHLZEUM
    5Cv25p70rbxkcnHBdIAg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4paA8piJ1A=="
Received: from gerhold.net
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id R04c57z8FEms881
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 15 Sep 2023 16:48:54 +0200 (CEST)
Date:   Fri, 15 Sep 2023 16:48:47 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Gaurav Kohli <quic_gkohli@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916: Fix iommu local address
 range
Message-ID: <ZQRuzzC7i1kyNqAm@gerhold.net>
References: <20230915143304.477-1-quic_gkohli@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915143304.477-1-quic_gkohli@quicinc.com>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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

Please also submit another patch to fix this in msm8939.dtsi. It has the
same mistake.

Thanks,
Stephan
