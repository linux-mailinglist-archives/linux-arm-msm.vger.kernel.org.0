Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5666838B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 22:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjAaVeu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 16:34:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjAaVet (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 16:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A1153B3C
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 13:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675200845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B76IbDg7rfJ1kacwa1GZMxROODg9JF3CJO54jHtr+rw=;
        b=L5FCS0W7Sfm5mOnXYzQAFYAqAxOR9raP/1X2Si2qBmT4cK3Kj8FuVG0uSlmQwJm5tbdIhk
        3UfbKwRhQcCE0um5ZKOw8oJ5vTlDiMdkL9XLuR1tglEaVGXrDuFB5/wccYoJrUOjdHWShc
        dk0h7+3sPnBjBiMea5VOkt1LJgryceE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-PJtz-aMtOaadvANelVeyFA-1; Tue, 31 Jan 2023 16:34:03 -0500
X-MC-Unique: PJtz-aMtOaadvANelVeyFA-1
Received: by mail-qt1-f199.google.com with SMTP id c18-20020ac84e12000000b003b5d38f1d29so7279192qtw.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 13:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B76IbDg7rfJ1kacwa1GZMxROODg9JF3CJO54jHtr+rw=;
        b=ONEPn+5eIzOLMBONJ/ucm9jBdke35NcxY1bDvh9vo0WxQrMw/Q16KxwkCaL7EsFB8n
         2Hq7UnI2gQ6XtPD+M4bo70LWZ2tjxFkvKo886ZxWA9lh8tpB8KVY1FNArl/vh3tyIaFD
         4V+UBH6YRHQZoFl+DMROO34/NNreVZdTwtHzOG/vsrEiAmgvDQg17NPO7VMVB36LG6Yt
         HLaa7RZ1j69MRofufDzZVVH5CZhuDVKfcE4SY3kkQuwtF1emJ6eTe5doS2Key5AT2/HL
         tWQRk1wCK/FQ2QwU3hj+C3fzt+QhisHZkHuzZffnezMHTbzxGjD9zBBuphiNrUxz2W+s
         hHMQ==
X-Gm-Message-State: AO0yUKWwEy79jbA1nLIHISHIZGBQklX/z3j6IkBCBxnjF2SIU8bagh61
        Nb6s1qNurl4mW/MOggDzBx0lTjNewq6D+AeJkFdVnQmiuANtflTjErcEq7UtQk/8t1slI/2zzt8
        ZyBp+TrhU9bBL79avv9PbI+iwbg==
X-Received: by 2002:a05:622a:210:b0:3b6:5d23:8748 with SMTP id b16-20020a05622a021000b003b65d238748mr310778qtx.52.1675200843212;
        Tue, 31 Jan 2023 13:34:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+5rIaL7g2YNvj8/qHBaDUmprfpdFLKJYma7DpN0DwL9Ze1Djra/CriopTufBe4wvVl6yskiQ==
X-Received: by 2002:a05:622a:210:b0:3b6:5d23:8748 with SMTP id b16-20020a05622a021000b003b65d238748mr310743qtx.52.1675200842889;
        Tue, 31 Jan 2023 13:34:02 -0800 (PST)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id ga15-20020a05622a590f00b003b880ef08acsm3438551qtb.35.2023.01.31.13.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 13:34:02 -0800 (PST)
Date:   Tue, 31 Jan 2023 16:34:01 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bmasney@redhat.com,
        quic_shazhuss@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8540p-ride: Document i2c
 busses
Message-ID: <20230131213401.dtsewdyuppl6c657@echanude>
References: <20230130154823.117542-1-ahalaney@redhat.com>
 <20230130154823.117542-2-ahalaney@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130154823.117542-2-ahalaney@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 30, 2023 at 09:48:23AM -0600, Andrew Halaney wrote:
> It isn't obvious in the current devicetree what is connected. Go ahead
> and document what's on the other end.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---

Reviewed-by: Eric Chanudet <echanude@redhat.com>

> 
> Changes since v1:
> 	* Document i2c12 having a max20411 (Shazad)
> 
> In v1 I said i2c12 was not connected, that's not true though (I just
> have a board schematic which shows it not connected, but it _is_
> connected on the SIP/SOM, which I verified with series [0]).
> 
> I debated waiting for Bjorn to sort out appropriate label names over at
> [0] (and follow suit in a third patch here), but decided to get this
> series out again to clean up the current warnings while that's worked
> out. Once [0] is resubmitted I'll submit a separate patch to enable the
> max20411 on this board as well!
> 
> [0] https://lore.kernel.org/linux-arm-msm/20230130035642.GA464800@hu-bjorande-lv.qualcomm.com/
> 
> Thanks,
> Andrew
> 
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 6ab4b435c49e..8b7555f22528 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -317,6 +317,7 @@ &xo_board_clk {
> 
>  &tlmm {
>  	i2c0_default: i2c0-default-state {
> +		/* To USB7002T-I/KDXVA0 USB hub (SIP1 only) */
>  		pins = "gpio135", "gpio136";
>  		function = "qup0";
>  		drive-strength = <2>;
> @@ -324,6 +325,7 @@ i2c0_default: i2c0-default-state {
>  	};
> 
>  	i2c1_default: i2c1-default-state {
> +		/* To PM40028B-F3EI PCIe switch */
>  		pins = "gpio158", "gpio159";
>  		function = "qup1";
>  		drive-strength = <2>;
> @@ -331,6 +333,7 @@ i2c1_default: i2c1-default-state {
>  	};
> 
>  	i2c12_default: i2c12-default-state {
> +		/* To Maxim max20411 */
>  		pins = "gpio0", "gpio1";
>  		function = "qup12";
>  		drive-strength = <2>;
> @@ -338,6 +341,7 @@ i2c12_default: i2c12-default-state {
>  	};
> 
>  	i2c15_default: i2c15-default-state {
> +		/* To display connector (SIP1 only) */
>  		pins = "gpio36", "gpio37";
>  		function = "qup15";
>  		drive-strength = <2>;
> @@ -345,6 +349,7 @@ i2c15_default: i2c15-default-state {
>  	};
> 
>  	i2c18_default: i2c18-default-state {
> +		/* To ASM330LHH IMU (SIP1 only) */
>  		pins = "gpio66", "gpio67";
>  		function = "qup18";
>  		drive-strength = <2>;
> --
> 2.39.1
> 

-- 
Eric Chanudet

