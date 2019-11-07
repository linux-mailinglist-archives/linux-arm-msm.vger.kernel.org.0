Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFEEF3C4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 00:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfKGXos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 18:44:48 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36901 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfKGXos (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 18:44:48 -0500
Received: by mail-pf1-f194.google.com with SMTP id p24so3519435pfn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2019 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1U0wPcyIG/9s48x7IfdmB9lT8/kPl3K5MB9kafPq4kQ=;
        b=S/s0azMruXPaRqNJcdoSSNkgORzM89gGHIbVO3fAYv89FVXvjk65KmQCaB+E2lLDHI
         TDhBW5Uvr0wpQNkWB30A72fd1dcPgpNO05sUddxV7PiITIbZb/n1wO8Maymbtu70efAT
         UbvjUadU7q+GmiUrPpH/VD4LB57GqGRa0Djnv62+JAQGXllBk4OkIKDkRrNZ7XF9oxFj
         oL0Sp1ZG6QJFhJ9+XfeKGRPbcU6zVtuM43aCeDuADFRhaWjoYLo0exQ9VPBMjgeG73+J
         GIXl3Q+jtb8RNcoi0EPu6PxrxyHkCTQPYUgnU0Y1UsvyYCApwid1bfnWK+6yN3YMrsnN
         fxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1U0wPcyIG/9s48x7IfdmB9lT8/kPl3K5MB9kafPq4kQ=;
        b=oOcNfLvgOxPwyYhJshgw5GDVJiPRNoX/JtQR1ligJ4QnRUa4HoDHnXnyFT5COLI1Vp
         FnX/O5slTeQK9ycjgfrZ69hfbqM25TFkHsC7PkBnZraq0WpuAWNU36+fIAHBSe7WdAUn
         fKEo+1isbWdlol34q1BS9SkeCjpaOQHd7U0YR4s+x442UddaalqEsPz5d/0rzK85BayU
         isGXkfSynFA+q1510NLiVArvZeIyvMsOoQC3YqhJY85zdtJyhKt2F9tPUFSE0iIKrBT7
         /rHKL0n/x0JWt2SM3NzMAGljNO3jPf+ha3wYZflcaNucb9MNP7YhtBV3aRTkQGIcGoBF
         ePpg==
X-Gm-Message-State: APjAAAXCmFbQPqIrDPFJ86LDEU0K7DwAnvaGfWGhUyVxuhAccoDp0+h0
        ypigqmaRbagCelPfaf7NhOs/02jcCqE=
X-Google-Smtp-Source: APXvYqy81x91iTDJeaZtLHQ93IDGUFfWCM+caD2RnLcNF36qUqvWx1bxNzAOZp9kckdHErPtHKxvvg==
X-Received: by 2002:a63:cc17:: with SMTP id x23mr7923619pgf.446.1573170287415;
        Thu, 07 Nov 2019 15:44:47 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z5sm3459995pgi.19.2019.11.07.15.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 15:44:46 -0800 (PST)
Date:   Thu, 7 Nov 2019 15:44:44 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     eberman@codeaurora.org
Cc:     saiprakash.ranjan@codeaurora.org, agross@kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/17] firmware: qcom_scm-64: Improve SMC convention
 detection
Message-ID: <20191107234444.GB3907604@builder>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-10-git-send-email-eberman@codeaurora.org>
 <20191107191846.GA3907604@builder>
 <1eb1c0db6f2d9e65479205ddad92bac7@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb1c0db6f2d9e65479205ddad92bac7@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Nov 12:20 PST 2019, eberman@codeaurora.org wrote:
> On 2019-11-07 11:18, Bjorn Andersson wrote:
[..]
> > > @@ -583,19 +591,17 @@ int
> > > __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
> > > 
> > >  void __qcom_scm_init(void)
> > >  {
> > > -	u64 cmd;
> > > -	struct arm_smccc_res res;
> > > -	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO,
> > > QCOM_SCM_INFO_IS_CALL_AVAIL);
> > > -
> > > -	/* First try a SMC64 call */
> > > -	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
> > > -				 ARM_SMCCC_OWNER_SIP, function);
> > > -
> > > -	arm_smccc_smc(cmd, QCOM_SCM_ARGS(1), cmd &
> > > (~BIT(ARM_SMCCC_TYPE_SHIFT)),
> > > -		      0, 0, 0, 0, 0, &res);
> > > -
> > > -	if (!res.a0 && res.a1)
> > > -		qcom_smccc_convention = ARM_SMCCC_SMC_64;
> > > -	else
> > > -		qcom_smccc_convention = ARM_SMCCC_SMC_32;
> > > +	qcom_smc_convention = SMC_CONVENTION_ARM_64;
> > > +	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
> > > +			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
> > > +		goto out;
> > > +
> > > +	qcom_smc_convention = SMC_CONVENTION_ARM_32;
> > > +	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
> > > +			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
> > > +		goto out;
> > > +
> > > +	qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
> > 
> > If above two tests can be considered reliable I would suggest that you
> > fail hard here instead.
> 
> Is the suggestion here to BUG out?
> 

We generally do not want that, but leaving it "unknown" feels like the
next scm call will have similar outcome to calling BUG() here, but be
harder to debug...

So I would be willing to accept a BUG() here.

Regards,
Bjorn
