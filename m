Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E13F1AFD5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2020 21:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgDSTVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Apr 2020 15:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgDSTVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Apr 2020 15:21:41 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DB2C061A0C
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 12:21:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o15so3385969pgi.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2020 12:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RGMN6tbtT6za2or0wESO5PWSuHGgRvOO5vUg0g7tI/c=;
        b=YzeFIPgR3xDhN7Clw6ZM8Aqizc6EXlVaPyg6cUMeTK5zjZ9wpu+8TOXbJvs8m17x2e
         HD/72UoaLoPAw8JSrBJMCMqJWleXN08yQ7TBCyf6QwGJr+rmThs197DRTJhEWaiuxW+0
         4RvhvXDLDrYR7kpKhWAqdZVjlXG1dSGidNRk1MVdMc+21ttu5wepnN5gj/aF9hA6isBE
         nJeaeiows3eRK8RhpBI2zG12nTY8xpvPiQi9cm79+/Nme/dr/hmIGUExR4AePnyyd36F
         5Y/cWYBWBrk0Oi27dBWPR3nvHijhFJO+W/UyF8d3awBO8UPmYG854Z/jxfnO1zKxlnRD
         S1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RGMN6tbtT6za2or0wESO5PWSuHGgRvOO5vUg0g7tI/c=;
        b=c16tnbcZZWzX2cgAZCeeckHLEWypWb7QTR1IhApxXVMVxbbSG9R3gaKaZDlMYCUoFQ
         s+VjdlLEX+x4DTicuf/AtjlvFHbhF141KTIvZ/ZyWhmUHH0kOtHl5FlKR9VI1u18E3u0
         PgMfyxI8M1FviHj4PHWa0X/2YmQpvwfUps3l2n0m3HlwkKZuoCuRKwvjaPV++Vfc9Lf4
         xAGCKMcbcXx67bhYwQ5yxBT0mOWh6zfFwSN6HgDcdLvOcx2iWFOtRfCo/yfEGQtgYIr1
         8d/DsMt1NHoq8jjyWvF1Ihna2StNuw1KgE80GlF36rgYskXVUo6AF5fS7Z62GJKhtuV6
         /Bxw==
X-Gm-Message-State: AGi0Pua6Zw6VPFy+AKko/BY+lY6qErElv+nkNcOxzQXh1hRQRz2bVSvt
        2r2KR3usNbfYlYXzVjUOT67iPQ==
X-Google-Smtp-Source: APiQypLIKEQgXhQvct1QrZGarkIuUOJr9obBhQy5yuCohrGWlylbu2HUorcgT0wcj/Y/BW9elhJ9NQ==
X-Received: by 2002:a63:5d60:: with SMTP id o32mr12883753pgm.172.1587324100903;
        Sun, 19 Apr 2020 12:21:40 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o99sm11880162pjo.8.2020.04.19.12.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 12:21:40 -0700 (PDT)
Date:   Sun, 19 Apr 2020 12:21:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sc7180: Update reserved memory map
Message-ID: <20200419192137.GF987656@yoga>
References: <20200417142605.28885-1-sibis@codeaurora.org>
 <20200417142605.28885-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417142605.28885-4-sibis@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 17 Apr 07:26 PDT 2020, Sibi Sankar wrote:

> Add missing regions and remove unused regions from the reserved memory
> map, as described in version 5.
> 

Your patch looks good, but I'm quite unhappy with the way these turns
out and we have been ignoring the fact that different devices on the
same platform (with TZ) might come with different firmware versions and
hence different layout of the peripheral memory region.

So how about pushing out at least the peripheral regions to the device's
dts (the others are pretty much static, except when using coreboot)?
That should reduce your patch to 4(?) delete-nodes?

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 63 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 83 ++++++++++++++++++++++++-
>  2 files changed, 144 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 17eadd80f15de..e613d70cc0198 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -28,6 +28,69 @@ chosen {
>  	};
>  };
>  
> +/*
> + * Reserved memory changes
> + *
> + * Keep all modifications to the memory map (from sc7180.dtsi) in one place.
> + * Delete all unused memory nodes and re-create atf_mem/venus_mem/camera_mem
> + * and wlan_mem memory nodes.
> + *
> + */
> +
> +/delete-node/ &hyp_mem;
> +/delete-node/ &xbl_mem;
> +/delete-node/ &aop_mem;
> +/delete-node/ &sec_apps_mem;
> +/delete-node/ &tz_mem;
> +/delete-node/ &camera_mem;
> +/delete-node/ &npu_mem;
> +/delete-node/ &venus_mem;
> +/delete-node/ &cdsp_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &wlan_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &gpu_mem;
> +
> +/* Increase the size from 132 MB to 140 MB */
> +&mpss_mem {
> +	reg = <0x0 0x86000000 0x0 0x8c00000>;
> +};
> +
> +/* Increase the size from 2MB to 8MB */
> +&rmtfs_mem {
> +	reg = <0x0 0x84400000 0x0 0x800000>;
> +};
> +
> +/ {
> +	reserved-memory {
> +		atf_mem: memory@80b00000 {
> +			reg = <0x0 0x80b00000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		camera_mem: memory@8ec00000 {
> +			reg = <0x0 0x8ec00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@8f600000 {
> +			reg = <0 0x8f600000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@94100000 {
> +			reg = <0x0 0x94100000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		mba_mem: memory@94400000 {
> +			reg = <0x0 0x94400000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +};
> +
>  &apps_rsc {
>  	pm6150-rpmh-regulators {
>  		compatible = "qcom,pm6150-rpmh-regulators";
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 853ba6e8a53ca..f73ffd74d4fcd 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -69,18 +69,97 @@ reserved_memory: reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		hyp_mem: memory@80000000 {
> +			reg = <0x0 0x80000000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_mem: memory@80600000 {
> +			reg = <0x0 0x80600000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		aop_mem: memory@80800000 {
> +			reg = <0x0 0x80800000 0x0 0x20000>;
> +			no-map;
> +		};
> +
>  		aop_cmd_db_mem: memory@80820000 {
>  			reg = <0x0 0x80820000 0x0 0x20000>;
>  			compatible = "qcom,cmd-db";
>  		};
>  
> +		sec_apps_mem: memory@808ff000 {
> +			reg = <0x0 0x808ff000 0x0 0x1000>;
> +			no-map;
> +		};
> +
>  		smem_mem: memory@80900000 {
>  			reg = <0x0 0x80900000 0x0 0x200000>;
>  			no-map;
>  		};
>  
> -		venus_mem: memory@8f600000 {
> -			reg = <0 0x8f600000 0 0x500000>;
> +		tz_mem: memory@80b00000 {
> +			reg = <0x0 0x80b00000 0x0 0x3900000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@84400000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0x84400000 0x0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		mpss_mem: memory@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x8400000>;
> +			no-map;
> +		};
> +
> +		camera_mem: memory@8e400000 {
> +			reg = <0x0 0x8e400000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		npu_mem: memory@8e900000 {
> +			reg = <0x0 0x8e900000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@8ee00000 {
> +			reg = <0x0 0x8ee00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@8f300000 {
> +			reg = <0x0 0x8f300000 0x0 0x1e00000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@91100000 {
> +			reg = <0x0 0x91100000 0x0 0x2800000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@93900000 {
> +			reg = <0x0 0x93900000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@93b00000 {
> +			reg = <0x0 0x93b00000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@93b10000 {
> +			reg = <0x0 0x93b10000 0x0 0x5000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@93b15000 {
> +			reg = <0x0 0x93b15000 0x0 0x2000>;
>  			no-map;
>  		};
>  	};
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
