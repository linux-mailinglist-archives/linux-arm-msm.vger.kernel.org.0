Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962F23A04A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 21:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhFHTtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 15:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhFHTtM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 15:49:12 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E7FC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 12:47:07 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id w23-20020a9d5a970000b02903d0ef989477so17103894oth.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oPH7MZcO8dfsKVtwmd/nA3Va8+4eG9+TiTHrp2cp3M8=;
        b=oLExvtz2vC3ZuG9Uv3AoRpeHuDhy82B1oEhVzpn4N4xM/jruf3KPUstlvjh3BbmB8U
         nHLCynKK69yvuTMO7ExTmctiKRjmjNK/P4aywFkLcoUlMDjJpcaeMRE58qeTJKybgYPv
         hft6+nx6wJvHuO8J/t1KKRwtASb+OkcdqE9ALFF6UAhQtHXlGX83s3YljRyvmqZ1+zxf
         COFh4ntNiG5WF+532jqy6nwYAItHG8q7mzYoNEmQqggrOCWJc3Y4069uIP13tD5waW0T
         w1B0kmaMfw7fkLPxI4qxdAlMsVy7B/RUP48yJVromzBmW1onBiYES0DCjSQTipobCnp6
         oeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oPH7MZcO8dfsKVtwmd/nA3Va8+4eG9+TiTHrp2cp3M8=;
        b=XTb60MH7Mshakle6DmWCyXe0H+sTa14QMmm3ncSbEDp9o25b9AbP5bQjjCWyNOOkL+
         yfYILnAVwRKe6OggyVv7V+50OCfHPmeyqauZQndvRfjOEmy9ma33BoDrvJtHaCBy++sl
         SeHoucSrAp0YgiT91pz55n2FlZDGfCOS09131xHloofvCkqJbcbgMe8s7jKkUrE/56Rq
         ACY6TXwjFCAQcuVR/oy89p0Wbh0iMOviXMWMc+/fmqOvzSuJueWVsEfGlTs3G+Pc0Scp
         pzRiZQJcH/BtQvbU7MPVKeKyLwwohQExbeMZVbQBHUuSFGfMMelYFyY++5AgxKKHWTXM
         lcjw==
X-Gm-Message-State: AOAM531MigXuhvg9HHT+o+c8IB8XWJ5oz9c3B8am5CBw3asXDsf4Friv
        H3KqGe5iD1nJ8+oqKif1jEUjNw==
X-Google-Smtp-Source: ABdhPJy/E30JyOor+4/AQuCo+sTmNhondzp8OHJ/IghLHF2Q7V57nQkV1rpBJF6i3AHB1P2Kzs8gxg==
X-Received: by 2002:a05:6830:3089:: with SMTP id f9mr9913816ots.276.1623181626810;
        Tue, 08 Jun 2021 12:47:06 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m10sm195799oig.9.2021.06.08.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 12:47:06 -0700 (PDT)
Date:   Tue, 8 Jun 2021 14:47:04 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add support for SONY Xperia X
 Performance / XZ / XZs (msm8996, Tone platform)
Message-ID: <YL/JOJibHOXYCOty@builder.lan>
References: <20210608152737.154218-1-konrad.dybcio@somainline.org>
 <20210608152737.154218-3-konrad.dybcio@somainline.org>
 <YL+dSBRwS3bf1ztb@gerhold.net>
 <409ef9ca-0533-ddc3-3332-5cc2af0aa1e0@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409ef9ca-0533-ddc3-3332-5cc2af0aa1e0@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Jun 14:08 CDT 2021, Konrad Dybcio wrote:

> 
> >> +/delete-node/ &hdmi;
> >> +/delete-node/ &hdmi_phy;
> >> +/delete-node/ &mdp5_intf3_out;
> > Is it not enough to set those to status = "disabled"? Kind of strange
> > that you have to delete those entirely. I guess ideally "hdmi" should
> > even be disabled by default in the SoC device tree.
> 
> Saving memory and bloat where possible. Deleting these makes inspecting decompiled
> DTBs simpler and allows for ever so slightly bigger kernel images (the boot partition is finite).
> 

While that is true, the typical method is to disable the nodes, so
please follow that.

> 
> 
> >> +
> >> +	panel_tvdd: tvdd-regulator {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "panel_tvdd";
> >> +		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;
> > regulator-fixed is active-low without "enable-active-high;"
> > If that's what you want it's probably more clear to write
> > GPIO_ACTIVE_LOW. Otherwise, perhaps you forgot that property? :)
> 
> Interestingly enough it doesn't work *with* the property, but does without :|

The regulator-fixed driver overrides the flag by the presence of
'enable-active-high" property, so if it works without said property that
would imply that your control is active-low.

So please make the flag reflect that.

Regards,
Bjorn
