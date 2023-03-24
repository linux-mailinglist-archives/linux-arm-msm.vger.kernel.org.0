Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7FA6C74AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 01:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjCXAne (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 20:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjCXAne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 20:43:34 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3C61B320;
        Thu, 23 Mar 2023 17:43:33 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id u10so441440plz.7;
        Thu, 23 Mar 2023 17:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679618612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckLQ9uv950CpKrgY1+UtJJdCHEwxjY1jwEpa/QYRrAI=;
        b=jxI6F+PWiHG9P+9MvMO2FpW5NieZ4P9DnV7/anUevNm4Dc83tJOGd2gtbCVgGnmghi
         g/quo7VzI3EBj5anyZyGhhfz2m0ppcLCESH0M4INYge4YUd3c6mFfGu5FjFE9a9WjxTc
         luk+dH062HfZZZk3TNkcYMt/oe4/XIuxXyPThe1OmG7JnfvbVCffaKKNJlmH3AjaeCfS
         Q1w6E5+3T34hRQgMTPOB2jRozuqNvLcwwnU4tHG4IGFOktLyeo6+O3sagXlaWmjDC81W
         Qrzm93Y35+56z5rCe/HuO3B/NwOSEGhenhnwfhlGiChLCdKbZCJeKIdmDpj3nRmQTBWq
         CnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679618612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckLQ9uv950CpKrgY1+UtJJdCHEwxjY1jwEpa/QYRrAI=;
        b=NApeK/M2XgdbIs/dEs6JmGYTWgTXl4ekr2/xTLEGLJdhAGTRTEeDm4h0SR5wfccCWy
         b9+r/LVCJdAkv3vMZD/2ejeirkBYIUymeZQkNxtPnSi/DBCFpOdG3JD/oe/rwUMZThPi
         CKjxOJIiGAyfOKd6DoGtVvhqgIlI6tO7LD+ENYp+Sep3pOBNnhdMxMCFAOhKzwznwQej
         KP476HGNgbUwMPPubDFFjJI5Ho+M4MSt30JU+bn/CvPQNKP1k8KzuayHiuyPhJXMXfrL
         JnYnxXxZB8z4zU/HELF13MMJQHiL4LziG43CLeC8AG5IJ4xQPQVqZCMxrdxr6slfUJTY
         lQ0w==
X-Gm-Message-State: AAQBX9efxxGWteb8yyfsxdkROrPlvsAe+Ira5NexDxebYKiXCVfveR3d
        LQb6mFFz5ATSjWfhAoLVC78=
X-Google-Smtp-Source: AKy350YRhXI/oDAT31jHQsIQEmGzRsQWvm7OFn1DR3rocVm1m/LmBaGXW285RfQ670TThS4buAyTuw==
X-Received: by 2002:a17:90b:3ecb:b0:23b:3641:cf16 with SMTP id rm11-20020a17090b3ecb00b0023b3641cf16mr778338pjb.11.1679618612363;
        Thu, 23 Mar 2023 17:43:32 -0700 (PDT)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902bd8d00b0019e8c3cd3f4sm12821662pls.201.2023.03.23.17.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 17:43:31 -0700 (PDT)
Date:   Fri, 24 Mar 2023 08:43:23 +0800
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 12/18] usb: typec: qcom: Add Qualcomm PMIC TCPM support
Message-ID: <ZBzyK0ILtUDr986r@Gentoo>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-13-bryan.odonoghue@linaro.org>
 <ZBxkB04KqY8WbeA1@Gentoo>
 <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89bca327-a860-672c-b4ae-766698d38639@linaro.org>
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 23, 2023 at 05:31:26PM +0000, Bryan O'Donoghue wrote:
> On 23/03/2023 14:36, Jianhua Lu wrote:
> >> +	/* Poll waiting for transition to required vSafe5V or vSafe0V */
> >> +	ret = regmap_read_poll_timeout(pmic_typec->regmap,
> >> +				       pmic_typec->base + TYPEC_SM_STATUS_REG,
> >> +				       sm_stat, sm_stat & val,
> >> +				       100, 250000);
> > This statement isn't very useful and will case a error,
> > After I remove it, usb-c works well. What's about dropping this statement?
> > 
> > [   63.030672] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> > [   63.030702] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
> > [   63.030895] xhci-hcd xhci-hcd.1.auto: hcc params 0x0230ffe5 hci version 0x110 quirks 0x0000000000010010
> > [   63.030926] xhci-hcd xhci-hcd.1.auto: irq 168, io mem 0x0a600000
> > [   63.031043] xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
> > [   63.031054] xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
> > [   63.031063] xhci-hcd xhci-hcd.1.auto: Host supports USB 3.1 Enhanced SuperSpeed
> > [   63.031835] hub 1-0:1.0: USB hub found
> > [   63.031863] hub 1-0:1.0: 1 port detected
> > [   63.032151] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
> > [   63.032690] hub 2-0:1.0: USB hub found
> > [   63.032713] hub 2-0:1.0: 1 port detected
> > [   63.168912] qcom,pmic-typec c440000.spmi:pmic@2:typec@1500: vbus vsafe5v fail
> > [   63.169185] xhci-hcd xhci-hcd.1.auto: remove, state 1
> > [   63.169195] usb usb2: USB disconnect, device number 1
> > [   63.178808] xhci-hcd xhci-hcd.1.auto: USB bus 2 deregistered
> > [   63.178825] xhci-hcd xhci-hcd.1.auto: remove, state 1
> > [   63.178832] usb usb1: USB disconnect, device number 1
> > [   63.182114] hub 1-0:1.0: activate --> -19
> > [   63.182791] xhci-hcd xhci-hcd.1.auto: USB bus 1 deregistered
> 
> Interesting.
> 
> What's your hardware configuration ? Could it be you don't have the VBUS 
> regulator pointed to the correct place ?
> 
> &pm8150b_vbus {
> 	regulator-min-microamp = <500000>;
> 	regulator-max-microamp = <3000000>;
> 	status = "okay";
> };
> 
> &pm8150b_typec {
> 	vdd-vbus-supply = <&pm8150b_vbus>;
> };
I think I configure it correctly, I have disassemble the compiled dtb,
don't find anything wrong.

usb-vbus-regulator@1100 {
	compatible = "qcom,pm8150b-vbus-reg";
	status = "okay";
	reg = <0x1100>;
	regulator-min-microamp = <0x7a120>;
	regulator-max-microamp = <0x2dc6c0>;
	phandle = <0xc9>;
};

typec@1500 {
	compatible = "qcom,pm8150b-typec";
	reg = <0x1500>;
	interrupts = <0x02 0x15 0x00 0x01 0x02 0x15 0x01 0x03 0x02 0x15 0x02 0x01 0x02 0x15 0x03 0x03 0x02 0x15 0x04 0x01 0x02 0x15 0x05 0x01 0x02 0x15 0x06 0x03 0x02 0x15 0x07 0x01>;
	interrupt-names = "or-rid-detect-change\0vpd-detect\0cc-state-change\0vconn-oc\0vbus-change\0attach-detach\0legacy-cable-detect\0try-snk-src-detect";
	vdd-vbus-supply = <0xc9>;
	status = "okay";
	phandle = <0x103>;
};
> 
> i.e. something else on your board supplies VBUS ?
pm8150b_vbus only. I try to disable regulator permanently in code and
usb-c doesn't work.
---
static int qcom_pmic_virt_tcpm_set_vbus(struct tcpc_dev *tcpc, bool on,
					bool sink)
{
	struct pmic_virt_tcpm *tcpm = tcpc_to_tcpm(tcpc);
	int ret = 0;

	mutex_lock(&tcpm->lock);
	if (tcpm->vbus_enabled == on)
		goto done;

	ret = qcom_pmic_typec_set_vbus(tcpm->pmic_typec, 0);
---
I hack it here.
> 
> vSafe5V should indicate to the controller that you have successfully 
> switched on vBus, so what this indicates to me is that on your hardware 
> VBUS either hasn't been asserted or hasn't been detected.
> 
> Can you show the printout of *(pmic_typec->base + TYPEC_SM_STATUS_REG) ? 
[   53.120005] hub 1-1:1.0: 4 ports detected
[   58.675134] typec base is 0x1500
[   58.675148] TYPEC_SM_STATUS_REG is 0xa
[   58.675153] typec status reg is 0x150a
It should be correct.
> And can you check your schematics and verify VBUS is supplied by 
> pm8150b_vbus and not say by an external IC ?
I haven't schematics, so I can only use hacking code to test it.
> 
> ---
> bod
