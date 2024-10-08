Return-Path: <linux-arm-msm+bounces-33535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956A994788
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B672A287FDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F351C9B99;
	Tue,  8 Oct 2024 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5rZzCog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125971D3634
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728387839; cv=none; b=SPLGYGDXmnduDUIGkGCJdtmZVFLgbbT00wgEqZrRGUKNX2MiHrMfH6zG+8BUkeQ9x9kiPPZcMRO0LJsM51cebr5MA7zU+f86+rWAQbgmTS2b+D3go8QNBtERz5X7Dp8ACl3XQMsjPnwrotAMl/l4D1StHwpLAFAE0T/6jBkDm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728387839; c=relaxed/simple;
	bh=zBXQMo+hM07ISY9mj7NP1MH4OBDtnawZVDrwzKCnAzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO/JGkDUT/mX1m+BwNzX4lvcCZWV0I7kxQ+ClCNVM7XsYUasL5arNQQGp+Pl4tUjLoFrkVgYfVADFGzx/RNXkQFEpjhyKDF6kYvWAWtN2rTJe2+fCmwgSBy7kQb9JKdJNHz3YLCH6HNyQyLSRF+kn9tL+pBXnzFEkY5MM/peGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5rZzCog; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fabc9bc5dfso62533231fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728387836; x=1728992636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZEbLtJwY4BWNq5AUUgxIr2eH5iz7eEs893mPnqpT/g=;
        b=H5rZzCoglvsytILw/YD/s3urTa2QSNm+qaIx16pbEbVSERup97JooTcYVGOpGBpoab
         47PPHREj7QhaF7OFfbLCRuzpuDgH4iPfcn+ox29GS8ot1tD6JhdwBwPTyofvIj4F/B2P
         ScgVh0MKjELuk7SC08ooZlIkBRJHmXeFohyexPbbbfkWIkrLKbUwsfLSLnW9h+f76W4z
         igw3IVlj2s1D9f0C0xLLGVZJImbRTa38HPOUZtnIDCsmGLEHEb60ihZ8uE4fqe2bwyca
         tejrAvBe1UdEJ2QPMR970JO2x/V81JTC8QMW05/Hpa8pmTS6fgisWrfUX3hIDN6KLXdm
         V9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728387836; x=1728992636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZEbLtJwY4BWNq5AUUgxIr2eH5iz7eEs893mPnqpT/g=;
        b=kwjMem6bjlrcvYPd4K1iOS6ca1AipRIrl1MLAl83UU5QnH8WXhCRkibgTIpD7vgdwV
         mK8M2R++WxiH84pIfxG/QGJ5YteprQZHTTCvc0QUydpAvlBNssbIi7ksCprDuR7dX4x5
         TCiKk3lGWFNRYGXmhkTZOl6cXwJR4wd+kC8mMF2cMzq3kDigOSTrKK/xhin/MwQR5Esg
         bmzVtjdwPQU6LfAwCn6tE4JbV8sx5GVNbM9Xn4ExRgGV+2ynF470YuIvZ4PoTKCjmzB7
         e5PNbj6L/P4Glp374Z5XaOiJP6gWB0OemCyQSokvM3Rf3gdUfKaW6CxwtrI23Kr086mo
         lD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/MEuOYCYs2wkCxi1oOLZrdfx69kUi+0CVckvkSBZi190zcNGSrM7y7BeDzVIer/gfGpwM1gDbTz73kkBD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTUsWDzaghnIZoU7ZlMydS0pEWz9jEZ3hUERQOK3RPjAnM13o
	8YONL37ERx1wFQ4Bi/M98/Ssj+pm+4s+Dn5zxLJAIBLLTD9ecp2Bf+YIrg1EoQ2utPNjJ9KVf87
	UTQ9KQw==
X-Google-Smtp-Source: AGHT+IFRmk8nWaWReszOVxOJdsqYxPAYN9CRreBKrrphj5YabLesxtoOk1jlIBv6qgKrPV3VYMhaNQ==
X-Received: by 2002:a05:6512:4026:b0:539:9f52:9e4 with SMTP id 2adb3069b0e04-539ab9e40eemr7285600e87.48.1728387836010;
        Tue, 08 Oct 2024 04:43:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d168sm1178132e87.142.2024.10.08.04.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:43:55 -0700 (PDT)
Date: Tue, 8 Oct 2024 14:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: qcom: scm: Add check for NULL-pointer
 dereference
Message-ID: <4j7qx24xwxo4l4bfagjob2pb2taadqlc22gxeiwjttfwrtqua7@eheozhig65gm>
References: <20240920181317.391918-1-quic_wasimn@quicinc.com>
 <zxzjrnmoun6fm2tzrx6eaxbvy5kddvld7hezknt7k7mvfcqw5a@u3fgfo5yqw4q>
 <ZwTvsyUv+ajI5suH@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwTvsyUv+ajI5suH@hu-wasimn-hyd.qualcomm.com>

On Tue, Oct 08, 2024 at 02:09:15PM GMT, Wasim Nazir wrote:
> On Sat, Oct 05, 2024 at 09:46:26PM -0500, Bjorn Andersson wrote:
> > On Fri, Sep 20, 2024 at 11:43:17PM GMT, Wasim Nazir wrote:
> > > Avoid NULL pointer dereference while using any qcom SCM calls.
> > > Add macro to easy the check at each SCM calls.
> > > 
> > 
> > We already have a way to deal with this in the general case. Client
> > drivers should call qcom_scm_is_available() before calling the scm
> > interface.
> My intention is to check all corner cases and provide proper error logs
> wherever the check fails.
> 
> There is no active case/example where it is failing but irrespective of
> client (using qcom_scm_is_available()) or driver using any SCM calls,
> want to add this check so that we don't need to fall into case
> where we need debugging of NULL check and error logs are enough
> to detect the problem.
> > 
> > Unfortunately your commit message makes it impossible to know if you're
> > referring to a case where this wasn't done, or isn't possible, or if
> > you've hit a bug.
> > 
> > > Changes in v2:
> > > - Cleanup in commit-message
> > 
> > This goes below the '---', by the diffstat. I don't know why you don't
> > have a diffstat, please figure out how to make your patches looks like
> > everyone else's.
> 
> Will make this correction in next patch.
> > 
> > > 
> > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
> > > index 029e6d117cb8..3247145a6583 100644
> > > --- a/drivers/firmware/qcom/qcom_scm-legacy.c
> > > +++ b/drivers/firmware/qcom/qcom_scm-legacy.c
> > > @@ -148,6 +148,9 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
> > >  	__le32 *arg_buf;
> > >  	const __le32 *res_buf;
> > > 
> > > +	if (!dev)
> > > +		return -EPROBE_DEFER;
> > 
> > -EPROBE_DEFER only makes sense to the caller during probe. In all other
> > cases this is an invalid error value.
> 
> I am returning EPROBE_DEFER so that any probe can use the return value
> to retry while at non-probe place it can be treated as normal failure
> (-ve value return).
> Please let me know if anything better can be used at this place.

Just drop it. This adds no benefits. If SCM has probed, then __scm->dev
is set. If it was not probed, then the code already oopsed by
dereferencing NULL __scm call.

> > 
> > > +
> > >  	cmd = kzalloc(PAGE_ALIGN(alloc_len), GFP_KERNEL);
> > >  	if (!cmd)
> > >  		return -ENOMEM;
> > [..]
> > > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > [..]
> > > @@ -387,7 +397,7 @@ static int qcom_scm_set_boot_addr(void *entry, const u8 *cpu_bits)
> > >  	desc.args[0] = flags;
> > >  	desc.args[1] = virt_to_phys(entry);
> > > 
> > > -	return qcom_scm_call_atomic(__scm ? __scm->dev : NULL, &desc, NULL);
> > > +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
> > 
> > I don't think you understand why this is written the way it is.
> Here I am removing this check as before reaching here __scm variable is
> already checked for validity.

No, it wasn't (or somebody removed too much of the context)

> > 
> > >  }
> > > 
> > [..]
> > > @@ -1986,6 +2113,13 @@ static int qcom_scm_probe(struct platform_device *pdev)
> > >  	/* Let all above stores be available after this */
> > >  	smp_store_release(&__scm, scm);
> > > 
> > > +	__scm->reset.ops = &qcom_scm_pas_reset_ops;
> > > +	__scm->reset.nr_resets = 1;
> > > +	__scm->reset.of_node = pdev->dev.of_node;
> > > +	ret = devm_reset_controller_register(&pdev->dev, &__scm->reset);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > 
> > Why did this move?
> &qcom_scm_pas_reset_ops is the first ops which might use __scm, so moving its
> registration below smp_store_release(&__scm, scm) so that __scm is set
> before utilizing in reset-ops.

So scm->reset should have been prepared before smp_store_release() and
only devm_reset_controller_register() should be moved after
smp_store_release().

> > 
> > Regards,
> > Bjorn
> > 
> > >  	irq = platform_get_irq_optional(pdev, 0);
> > >  	if (irq < 0) {
> > >  		if (irq != -ENXIO)
> > > --
> > > 2.46.1
> > >
> 
> Regards,
> Wasim

-- 
With best wishes
Dmitry

