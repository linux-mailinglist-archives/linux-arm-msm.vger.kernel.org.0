Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083263B7938
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbhF2UUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbhF2UUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:20:33 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D1AC061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:18:06 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w127so174209oig.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OMPfNJAe/qqe5Xpzm9vVbKrJ6GxGvnxyCwP6HHf4Axo=;
        b=soLdk9LK4La9dHppHKfw+XoncIPdb5S7iHatZTsparvVIyD1yuvz9eH9yknWmBWd7p
         LI0gTrlLKuuaScD8tiPo3PAEAnWCLs4FpsNrKnb/nd8mSud5jVsRJfRM1G6qcNiyUikn
         NIz7a1iZRbSBcLdr9RbRQilE+e+EpJkzI53d5w6aJlAibeN5uvc21IiVhle7oC78PYTr
         xheG1BMKV9fMn2ocQoeZKTIy5J8tYD0PVK+44rtAhW8jO+D9j75aIiovCAMWZaQjnj29
         7fNM1hg4Dg34QqOE/gF8rjYRfI8ubbZqSiTt7YIzz3/wHE7Dw5evmFTQG2JNXLsEayNw
         H9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OMPfNJAe/qqe5Xpzm9vVbKrJ6GxGvnxyCwP6HHf4Axo=;
        b=gheSFIc5bTsmw1jsovETeWo1w4g8zG6KCz3P/hJBW2KdoEW976JgbduPOjoWvM+8G4
         2i4MzJ2r+reFxnehhoo1m48Pt9AbQeD4NI8AehDmhuCjYq0bwdbCh20JUDE9XYvjSXHu
         vcsYsPNNdJWU/X/Q4LWuK9j+rOcAvPWOHYVn0JhpyRJqB02nbn3xp5xsW2/pDnJsxcQ2
         lch+vb0OPzbDhkTphhkNRw1iIeB8NSK0rWcrGpgT9NtZ5DkNuC3P3r7CCDdhmOK3CTKr
         CwmC5Vfa/z+Qg2Yw5DSrMqBfCjl/9NdOS+Dp14Bk4bASKhDJkXuIWTZffJuSpD0bf3WG
         tUaA==
X-Gm-Message-State: AOAM531NaKLNVGBkxT3Db2Ci/60evENlfd/0TGjgpy5HEZuwx3sNekb5
        Dpo0prpbAdp5nvkkRbPQlrtnHmhEVqa7iw==
X-Google-Smtp-Source: ABdhPJy10+VdOuNHh8N9zfOKYRx2mNF6XWjzFIRhxEo0nEI8YQuzPpfBM7Fv2mXUsTm6v/ZWxcv2xg==
X-Received: by 2002:aca:c4cd:: with SMTP id u196mr12298422oif.62.1624997885480;
        Tue, 29 Jun 2021 13:18:05 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z6sm4106010oiz.39.2021.06.29.13.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 13:18:04 -0700 (PDT)
Date:   Tue, 29 Jun 2021 15:18:02 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and
 register role switch
Message-ID: <YNt/+q/vbXeIa4A2@yoga>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
 <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
 <YNtAt3dCGGyj5DU/@yoga>
 <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c63c286a-f7c0-0874-59ad-e9ee43660a33@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Jun 14:23 CDT 2021, Bryan O'Donoghue wrote:

> On 29/06/2021 16:48, Bjorn Andersson wrote:
> > What's wrong with the switch that dwc3_setup_role_switch() sets up?
> > 
> > That's what I've been using in my UCSI hacking on Snapdragon 888 and it
> > seems to work...
> > 
> > Regards,
> > Bjorn
> 
> A good question, which as soon as you asked it made me completely doubt if
> I'd tested the tree without the patch applied.
> 
> I reverted both on my working tree and indeed it breaks role-switch
> detection.
> 
> In TCPM the connector is a child node of TCPM
> 
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/tree/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts?h=usb-next-5.13.rcx-rb5-tcpm
> line 1396
> 
> We use a remote endpoint inside of TCPM to hook up into &usb_1 line 1303
> 

That's expected, because the dwc3 role switching logic registers on
&usb_1_dwc3 instead of &usb_1.

> Not entirely sure what the graph tree looks like in your USCI case but I
> guess the connector is a child node of the controller ?
> 

No, the connector currently a child of a completely different rpmsg
device, i.e. in system terms it's the same as your design. One thing
detecting the change in parameters and then invoking the change on the
dwc3 controller (not the qcom variant thereof).

> But I think your question is why bother with the role-switch in dwc3-qcom
> 
> dwc3_qcom_vbus_override_enable(){} is switching bits that probably ought to
> be in the PHY but for whatever reason ended up being buried in the qcom-dwc3
> wrapper.
> 

I missed this part when I wired up my role switcher and things works
fine, but I presume there's a good reason for the vbus override and it's
not unlikely that I missed something in my testing.

I do however think that it would be appropriate to use the generic dwc3
role switcher and then make that somehow poke the vbus_override in the
qcom instance.

> Certainly we want that for qcs405 if you remember - I'm assuming for the
> sm8x50 too.
> 
> Even if we shouldn't twiddle these bits on sm8x50 I believe its wanted on
> qcs405.
> 

Can you remind me about the purpose of these bits?

Regards,
Bjorn

> I'm open to correction on that one though
> 
> ---
> bod
