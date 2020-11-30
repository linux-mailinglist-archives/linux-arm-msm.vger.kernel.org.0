Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4302C89F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 17:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbgK3QxK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 11:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgK3QxK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 11:53:10 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6073C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:52:29 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id f16so11896770otl.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Nov 2020 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/XXlFUfvEmfiDn/MNxM4LtUq+eujOKOrXOcsUik59H8=;
        b=vWn4k2e3hASoVqqW1KaPIjR/pt4eEcJvI6l+KWsXBNrwMF24HhuNGqikWKn2P+1hWU
         4WDuhxfz9mZaoRkeusXue9+mpes6rEmF+vbRzNsbKnzb7On5VTc1adrWRTIoIwTdNoGn
         Zp0Eysb6uyd6L8t3UjdkdLQBRjKzcDXmwOvkaOmEZ/sdD3buLcbRQd90KxK3I3LoA9i3
         PH84klrCOC4fzBqNwc8jUxthxMMcAplNfccmZyQkDm6VdWq8iLeEpqsE+gNxCmOM1Kmd
         Ex/bdXWLQfnCfJIfsJYhDQJy4Zd8D8qZc0KuiQrZBfaO0xQI8IPUOlhgAnMFriwwmTEB
         iNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/XXlFUfvEmfiDn/MNxM4LtUq+eujOKOrXOcsUik59H8=;
        b=j8sw5aeFzAu4k4B5ZLK1q3pyftlHltzj/qTV3IXOXGy7CjTeUZAKscebHNZQYBHcri
         IyvD1Eu7OdR3XUvRRNwbXgbvd6yG5YU9UJE/qyfiVCta0RtfEaZd+vF/DeEcliTnhMr/
         hFqYXvP9/2E0SbMqcEqdcxLdwbuRy1qfRxInAAtXRDfZhEP5YwYD70dPo0Hj+GlALPp0
         B2yvqBKLYwyOqgW7wPK2mA2FhGGUY7yYiWVCOPIjo7IMiDczW3AGnBovGsOnzTQW3EVu
         Dd7+81/CDReSSjjZoa81cBaztW8EqB0ujbFCDvuxExM55Ve+A+upPSM7d2zg56dHai9q
         6krA==
X-Gm-Message-State: AOAM531glRQl24wRwlnjRgETL5Tum1y8tspWe5Kh4cU+pTtMxnB0Y49C
        NCVKlpVL7uTd1kzAVjQFsVBgkFOnAwUWVw==
X-Google-Smtp-Source: ABdhPJyf+HzoZY0JkxVZtejoP3tDH9NuzEFnXB3oRNpPA4uz7o2H3uqU/nSnUsKFXUwUMVl35e4z4Q==
X-Received: by 2002:a05:6830:1199:: with SMTP id u25mr17849430otq.323.1606755149178;
        Mon, 30 Nov 2020 08:52:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t5sm9233268oth.16.2020.11.30.08.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:52:28 -0800 (PST)
Date:   Mon, 30 Nov 2020 10:52:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for
 I2S driver
Message-ID: <X8UjShseQ0F7itZe@builder.lan>
References: <1600440678-2137-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600440678-2137-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 18 Sep 09:51 CDT 2020, Srinivasa Rao Mandadapu wrote:

> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add dai link for supporting lpass I2S driver, which is used
> for audio capture and playback.
> Add lpass-cpu node with  pin controls and i2s primary
> and secondary dai-links
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Ajit needs to certify the origin of the patch, with his signed-off-by
and as you are the last to touch it your signed-off-by should be last.

Also, please advice on the dependencies of this patch, because the tree
doesn't build after applying this patch.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 59 ++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index bf87558..5724982 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -220,6 +220,44 @@
>  			max-brightness = <1023>;
>  		};
>  	};
> +
> +	sound {
> +		compatible = "qcom,sc7180-sndcard";
> +		model = "sc7180-snd-card";
> +
> +		audio-routing =
> +			"Headphone Jack", "HPOL",
> +			"Headphone Jack", "HPOR";
> +
> +		audio-jack = <&alc5682>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dai-link@0 {
> +			link-name = "MultiMedia0";
> +			reg = <0>;
> +			cpu {
> +				sound-dai = <&lpass_cpu 0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&alc5682 0>;
> +			};
> +		};
> +
> +		dai-link@1 {
> +			link-name = "MultiMedia1";
> +			reg = <1>;
> +			cpu {
> +				sound-dai = <&lpass_cpu 1>;
> +			};
> +
> +			codec {
> +				sound-dai = <&max98357a>;
> +			};
> +		};
> +	};
>  };
>  
>  &qfprom {
> @@ -725,6 +763,27 @@ hp_i2c: &i2c9 {
>  	modem-init;
>  };
>  
> +&lpass_cpu {
> +	status = "okay";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sec_mi2s_active &pri_mi2s_active &pri_mi2s_mclk_active>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	mi2s-primary@0 {
> +		reg = <MI2S_PRIMARY>;
> +		qcom,playback-sd-lines = <1>;
> +		qcom,capture-sd-lines = <0>;
> +	};
> +
> +	mi2s-secondary@1 {
> +		reg = <MI2S_SECONDARY>;
> +		qcom,playback-sd-lines = <0>;
> +	};
> +};
> +
>  &mdp {
>  	status = "okay";
>  };
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
