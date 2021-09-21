Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437C8413D68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 00:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbhIUWQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 18:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233957AbhIUWQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 18:16:38 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3980C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 15:15:09 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso573916otb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x94ioewznGOI6gQ5YIl2Sid87jK2fFCaelf+CMRDOF4=;
        b=LQDy2v9QFGuKgGFzbnu14WqsNjNrgXyv9aqQStW0dN1rlBn6zqLA6wafLgrCdwonci
         Vv9TZHEZOvDXcy27gpXabClErpN0tyQ9KTf+mfDBrm4qc05iSzbicIGjknVKq7kDPbf+
         K0LuccmlXYwpWPBJSTadxC4N7OcU8WPOPPhlKX7VkefaaquWGLLPR/20fU4t+XFyB/Zt
         cgkBQjI1x/rD0hopFATYcJLi/vRmU6Pw4jfIqOFeM+p8TGv9OAONpbKu+JBQvnl94sZW
         eWXDawIUl0PMQc7D7YRB/qhPCLrH7QIX/LOj2m2jzrxx2RQlu2XODeHlPZLHgp3PuMfd
         e1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x94ioewznGOI6gQ5YIl2Sid87jK2fFCaelf+CMRDOF4=;
        b=Uarc8eAEUoQuKtjXnMXZHNb9Dz88RCY+NS7YF1lGm4SG6fC2nhNHAPdvDIklxdojpq
         5/f/BPg4KqjWtu9tfPs/7jKnutgjNN+EaRfBVqv3AQbfjIcbcM3eddc6b5FNS5cY1oFC
         66uULi0Q/9BeQKUpMgLq8ksApJ9cicL8rgWUxXIInY7F78zw0f6gUaCvT4+eJXr/E4T1
         SJvWNhpujjWwOk+TEfTdR0EoItSdO6BqOsrFcgHcU3ouYX0FvqDGxaCv2BrMWs3KoOfa
         S3tWnHk2e4jdlBy4VbgkAybNSOj1E5U7TXqbQfrqn71PFk+qc5eYuZtk5XfBRfk1Dmxu
         SrQQ==
X-Gm-Message-State: AOAM5318LjJPL+leLl08shWSN3SMabfq5sopMDGt3vnggTBOtjeQcvrT
        E33EV/6dB6iY37jr4jSa6a/snA==
X-Google-Smtp-Source: ABdhPJwBlxa/coBdaEbNyj3pl6qZm1u0sr6cLsEoVWt9mrBrMs4sa3Qu4OYYNwIeGjc4Iht8aPIzBw==
X-Received: by 2002:a9d:4702:: with SMTP id a2mr13819459otf.271.1632262507823;
        Tue, 21 Sep 2021 15:15:07 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id d10sm90595ooj.24.2021.09.21.15.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 15:15:07 -0700 (PDT)
Date:   Tue, 21 Sep 2021 17:15:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: Re: [RESEND PATCH v6] arm64: dts: qcom: sc7280: Add venus DT node
Message-ID: <YUpZaQ42ldzEKtV/@builder.lan>
References: <1632199829-25686-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632199829-25686-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Sep 23:50 CDT 2021, Dikshita Agarwal wrote:

> Add DT entries for the sc7280 venus encoder/decoder.
> 
> this patch depends on [1].
> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=529463

The stuff you write here will be forever imprinted in the git history
and it's already unnecessary, given that the patch you reference here is
available in linux-next.

Things you want to mention, but shouldn't go into the git history, put
those below the '---' line.

> 
> Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a8c274a..f171ababc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -63,6 +63,11 @@
>  			no-map;
>  			reg = <0x0 0x80b00000 0x0 0x100000>;
>  		};
> +
> +		video_mem: memory@8b200000 {
> +			reg = <0x0 0x8b200000 0x0 0x500000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1063,6 +1068,76 @@
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> +		venus: video-codec@aa00000 {
> +			compatible = "qcom,sc7280-venus";

I do however now see this compatible defined in a binding in linux-next,
so you definitely should have listed that patch as a dependency - and
preferably held off sending me 6 versions (plus resend) of a patch that
I can't merge.

Please ping me once the binding is merged, so that I know when I can
merge this patch.

Thanks,
Bjorn

> +			reg = <0 0x0aa00000 0 0xd0600>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks = <&videocc VIDEO_CC_MVSC_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVSC_CTL_AXI_CLK>,
> +				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CORE_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_AXI_CLK>;
> +			clock-names = "core", "bus", "iface",
> +				      "vcodec_core", "vcodec_bus";
> +
> +			power-domains = <&videocc MVSC_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "venus", "vcodec0", "cx";
> +			operating-points-v2 = <&venus_opp_table>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_VENUS_CFG 0>,
> +					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "cpu-cfg", "video-mem";
> +
> +			iommus = <&apps_smmu 0x2180 0x20>,
> +				 <&apps_smmu 0x2184 0x20>;
> +			memory-region = <&video_mem>;
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +			};
> +
> +			video-firmware {
> +				iommus = <&apps_smmu 0x21a2 0x0>;
> +			};
> +
> +			venus_opp_table: venus-opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-133330000 {
> +					opp-hz = /bits/ 64 <133330000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-335000000 {
> +					opp-hz = /bits/ 64 <335000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-424000000 {
> +					opp-hz = /bits/ 64 <424000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-460000048 {
> +					opp-hz = /bits/ 64 <460000048>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};
> +			};
> +
> +		};
> +
>  		videocc: clock-controller@aaf0000 {
>  			compatible = "qcom,sc7280-videocc";
>  			reg = <0 0xaaf0000 0 0x10000>;
> -- 
> 2.7.4
> 
