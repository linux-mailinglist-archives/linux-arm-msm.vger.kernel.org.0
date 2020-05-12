Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9341CE9B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 02:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgELAf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 20:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725855AbgELAf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 20:35:27 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8458EC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 17:35:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y25so5526972pfn.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T83vTCwaOu/l7IbXH3GIrZ2sebndH8AtIbOjOcFOKiw=;
        b=IGcm/dET1rxwKVDQcmNORUppFub7U7i7TpLGJxT7aftq6PLsHo3Q2kpuu256Ik+gTm
         4U7FaWV6JVtZDdwTqn5KnqHIrDMze42Qyr3hD2akrj8wZI7Znjh9EDzhAodCUIWYyADu
         askH6eHWoJk8KBBGBHi9UL8yQ2GCrhFvyNuPPiykmSOB1Tkish/jGf8PNdEFC9lzKvP7
         I9TsuaHhBKXB/lr+nbFyVJeTv7AbkAJMpsJMYCRCnTTTT1mmqDEMkHvCvIDWuP38+2TI
         KOe/GPvkYm0ShiY5vhvlMyve5EcutfFiLSKouzgRcYtR2ebA1aodeGuxVYGZn3ciKrZH
         f3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T83vTCwaOu/l7IbXH3GIrZ2sebndH8AtIbOjOcFOKiw=;
        b=du+voyMqBmxChx88+G2EWCG0ppDQs+1Gahf2feLLPwP+4XTI3J5kwL3AjP988qHVPf
         26fm9KTXfnV8vui7JdCZEzjplVVo0JE/lM1HRgmfMNQief5342aPCQt4c9q4d/d2taeu
         Uo84XAmU4Oyffag5GTwXC6ATLvsqonSoISugxWom4YvZrK72WHaCcsoY0A/cL2JJ2Njh
         uq3dzH9fBEx1I+r+E/AJN5XKxhW3gRO32xCrlchyYjHk0KSZi7bmP32kl2H2dM0zRzKH
         PNckfVznbLIT8T3KFsgMn2wZ80GD70zrRdP5I2Ur8MRGvepmFhmxt2lgyDsTx9JKXF06
         jPpw==
X-Gm-Message-State: AGi0Pualh5GqRd2EWmsFyPMbe/jCYCADCXdoQKHi7/UUDNxfhIKTgA83
        iT6U1pX/ftCCHm3g6TmuBWxXCw==
X-Google-Smtp-Source: APiQypIlsInVbpMwAmAv0PBIrdW08DiGTGVAB7QYuaz3l5TaQnx80WTzLSic+Ae5WHDcMvsqJympTA==
X-Received: by 2002:a62:764b:: with SMTP id r72mr18585601pfc.207.1589243726915;
        Mon, 11 May 2020 17:35:26 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u5sm10434247pfu.198.2020.05.11.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:35:26 -0700 (PDT)
Date:   Mon, 11 May 2020 17:33:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Vincent Knecht <vincent.knecht@mailoo.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: socinfo: add msm8936/39 and apq8036/39 soc
 ids
Message-ID: <20200512003352.GC5349@builder.lan>
References: <20200511212733.214464-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511212733.214464-1-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 May 14:27 PDT 2020, Konrad Dybcio wrote:

> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> This patch adds missing SoC IDs for MSM8936/39 and
> their APQ variants.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Applied, thank you.

> ---
> Changes since v1:
> 	- Add a proper commit log
> 	- Add a missing sign-off
>  drivers/soc/qcom/socinfo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index ebb49aee179bb..14831ed392e28 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -188,6 +188,10 @@ static const struct soc_id soc_id[] = {
>  	{ 216, "MSM8674PRO" },
>  	{ 217, "MSM8974-AA" },
>  	{ 218, "MSM8974-AB" },
> +	{ 233, "MSM8936" },
> +	{ 239, "MSM8939" },
> +	{ 240, "APQ8036" },
> +	{ 241, "APQ8039" },
>  	{ 246, "MSM8996" },
>  	{ 247, "APQ8016" },
>  	{ 248, "MSM8216" },
> -- 
> 2.26.2
> 
