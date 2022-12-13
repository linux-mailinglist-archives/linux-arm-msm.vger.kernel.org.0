Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0739764BBCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236094AbiLMSTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235025AbiLMSTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F7A18B
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670955538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IB2xWWEhlxjxvd5E16+7UlIAcdyRYrIeQUS+dQ8G5as=;
        b=B4k/NCHeb59cJ9kuUddtd5HTzSuKXY8EuJBaXVLZ007DkJ+1eCbuOV4thyFM5NEGOJRTMF
        jBD9fJV9sO+m7Tnc53AqZy6RYJxB6g88uePRxVUWLN+1knECpPOyTlIQaXzKXGb85kZnrq
        pdXP5jLfrJQgpg+1OFGm9vOd6nq93V4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-aFmDrRF_MFeqz1NjNPqCkg-1; Tue, 13 Dec 2022 13:18:57 -0500
X-MC-Unique: aFmDrRF_MFeqz1NjNPqCkg-1
Received: by mail-qk1-f200.google.com with SMTP id x2-20020a05620a448200b006fa7dad5c1cso536991qkp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IB2xWWEhlxjxvd5E16+7UlIAcdyRYrIeQUS+dQ8G5as=;
        b=Rbjgp1k89+IjTxJMJJN/7bA2iABuieinw5aL5Ha6lP09kpPvvoet8ok4qfaaOa0EhW
         CpnS/iEE9pJKRJRZ0dKWIa+6koXsUbrt6rNrBKEAM3q3M4gJ3ukEJb4XxInfwOpgk4WQ
         xmAMYx3PfUWzfDDQhAj027lsm6IkQukwojNk7cCqf91HEfIuyRleyXW+Ph42VLEUbWDl
         BsnhSszWlsWjNgHzQ1y1YOtKV9gAIQFGIXwAKdWsa4xiLZ7svJVMl1DMDH851R0aQOt/
         2e6vQv/DkSsa3OoMkEpu0IS9E/PIi1P4eLabHIHSMRRZnyY6/UTarofVnqBK/h/3zRiy
         xrgw==
X-Gm-Message-State: ANoB5pm+prp/nKlE4gFZbRNcL0UrO2sshRWoiUESRpdoBunTuPovPEcP
        6Y1P/+oNPIolgrmq0+/AJgEgIOcSvLKMNTNDpS7PUi8WkKRwqq6Gk/ENwv5pJ2jirL0eXMvmmKU
        b36Gtdg/wQEvmcCHkZXg1SsWsyg==
X-Received: by 2002:ac8:4601:0:b0:3a7:fc39:6cd with SMTP id p1-20020ac84601000000b003a7fc3906cdmr6098303qtn.10.1670955536921;
        Tue, 13 Dec 2022 10:18:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf454Nj/rmnIAteUanUGwEzqlFebZfbSW1z6x3zce+VTz1RN6aooF8g678jM0uM+cBNWpgunqA==
X-Received: by 2002:ac8:4601:0:b0:3a7:fc39:6cd with SMTP id p1-20020ac84601000000b003a7fc3906cdmr6098280qtn.10.1670955536668;
        Tue, 13 Dec 2022 10:18:56 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id y3-20020ac85243000000b00398313f286dsm281671qtn.40.2022.12.13.10.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:18:56 -0800 (PST)
Date:   Tue, 13 Dec 2022 13:18:55 -0500
From:   Eric Chanudet <echanude@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pm8450a: add rtc node
Message-ID: <20221213181855.ylkb3dglw3bkwor5@echanude>
References: <20221213005539.1133443-1-echanude@redhat.com>
 <219F5CF2-BA91-4749-A32C-84BCF541ECE0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <219F5CF2-BA91-4749-A32C-84BCF541ECE0@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 13, 2022 at 04:18:00AM +0300, Dmitry Baryshkov wrote:
> >diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
> >index 34fc72896761..af761dbfbc66 100644
> >--- a/arch/arm64/boot/dts/qcom/pm8450a.dtsi
> >+++ b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
> >@@ -13,6 +13,14 @@ pm8450a: pmic@0 {
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> >+		rtc@6000 {
> >+			compatible = "qcom,pm8941-rtc";
> >+			reg = <0x6000>;
> >+			reg-names = "rtc", "alarm";
> >+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> 
> 
> 0x60?

Checking downstream it uses 0x61 for the ppid. This is also the case
for all other descriptions of that RTC I could find. On the other hand,
that does not describe the "alarm" register bank at 0x6100.
Should it be added, if anything to match reg-names?

I tried a quick test of the alarm on sa8540p-ride:
$ echo $(date '+%s' -d '+ 10 seconds') > /sys/class/rtc/rtc0/wakealarm
It logged the interrupt:
172:          3          0          0          0          0          0          0          0  pmic_arb 101777441 Edge      pm8xxx_rtc_alarm

-- 
Eric Chanudet

