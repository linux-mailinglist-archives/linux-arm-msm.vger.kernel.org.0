Return-Path: <linux-arm-msm+bounces-82805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B0C788E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3891361CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AF8344046;
	Fri, 21 Nov 2025 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0uW/1dM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE83446D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763721481; cv=none; b=gkpeBqjrfXNNTo3wsVBAJqxPoZSaD2ULOLg3X0uhkyhnI9Hh/4NZSqVV891IuCg+E2uutgd+n4duWaI5qLnnvYma3opLKhNxKpADf6ACNltGyuOZ6AYnwldrpnCJuUg2CqLeQ2TgFGa5DtAzEHNcmZPUYkfrsGnFRxDk1KrtVlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763721481; c=relaxed/simple;
	bh=h+kvr0wNLCrjM39Ieb6gHq1Ucrv+4NVkL1sdPqH+Lyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+KcCHN/4fL0omcEYxsM6zixKZd2dRihEr/KX4LHSCc5/NxEDUmLJrpM88LKebYVMFq7OT+Y3op+0zlor3ZmlJZGtn/OulfQavHa622I07xQ1gopiE29P9ZMz0pziEkE0nviv18LwqQ+78a6d5p8hPQRDiAXwKC22PBWJkgLAf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w0uW/1dM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47118259fd8so16397165e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 02:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763721477; x=1764326277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DNZw26Wu83+P7t16OmKTIqHH4/V3iwHNTGrylZ4UnSo=;
        b=w0uW/1dMyDWk+RTf/Qjmy2xOQyvMbkvvobRcXymwX1lM/dHPDyVodyjs2e9BmrdlDI
         yL74c0Jtq+IRO+WfV6vf4DRBshw4wphrg+lU8S2w1OsjTX325nQPFTZjMtfjjBO7vH3X
         U4nivZtdUHKr8GL3oRBSefTOFDYzZkVlSFLhVockMJ1Yff1DpWB8Y7VSnqtiMkZKyzLZ
         tqftToSOkPDISzfSOkTINU1T4nSaZVndJmY5BelTibU7JoyA0g5I04dlEu9P3l5VrgMf
         GafMm9oGzOQFIKHwIucAMKRbmhTCwfh8lUVmzFP/89+njlCArn5TGe2UTNhoahMAwbkS
         pwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763721477; x=1764326277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNZw26Wu83+P7t16OmKTIqHH4/V3iwHNTGrylZ4UnSo=;
        b=L51TH3KXo6K2tXs5GlInpgMkXtBcpQSueNUvb2FpTSaGgUdZfjeNm5sidyC0a59aGK
         ms4isrGGEMTzwlckwHuy4JAff8GcAelPeUr/P8P5a6KutOn8w2IK4fXzH3b+/HLvywxy
         Fa0aJxIcFv7miL1j/NeQ3ic/IiECG+JnBLi3YW2m8NULt5kpTVZp5LwrSstv7y3VCib7
         fT4j5IjCHGEVra1JO/KOjhZlp9Q2lhglfW/Dou0AOYd1lA9/l4ANqrokmVQoEb8Oo+mh
         xBth/nrcM7hSKjT6EZmF6s86xCfbXrSi3zb0HHBrIyuVriypeKRrwhMufGJF0IDXliaa
         trsw==
X-Gm-Message-State: AOJu0YxeHEAQiugv++xT2PlyHJBeHlGdQHdH4prd0x4eSWOr6Z3gIbVS
	locdcdcDymcOt8bwTugFDGvtgMjGMw2LPBHSE0K3Sh+Xhpo1VQHJcUZlpeNxFKVucjB1MiQZ6kc
	YPuWQ
X-Gm-Gg: ASbGncu+76/n3iTDeEAOMmrezct/5utGzjKYYDctIIPnuGyvbh5aLrQ+DqM7sKBPMjm
	I3kfTqeMJj2KDH3talbvnf4UZ23VkANj3CUq4ha8/deFFEq9v31UmK8lNvVtH/O5MqkbOxcT6Gt
	xnbI9H9A8fnrAnCKwgpf4sDRz1Qn6vgPOj6dNb3kUxJw2B6TqNDe++bbvzd8wfRstOdQlCVW+s/
	sdbTjgQasfKuhKV+D3PAcFWrcSXhmaO2wyFf9yAsM8NRHQ76pTYywQWpPdpMtDf9gN+VZ2wichR
	V4MkfOpKO3yGVd+L0T8dnJx4Ci6N5b4jMnnHMCnszrzVAZgdJl9lhZq9PbZOjrG/KF67CJDA/A/
	eBJfXzfIhzzf3xC6lr44Xm7+sH49yFubHSPFM0jSbI7hGoYZNNu8UebFgKpkt4A0zk5CMCuFFFD
	eZiClTB/kyKOi6d0SF
X-Google-Smtp-Source: AGHT+IEe/+CobnqIragL52Lf0hLGv/SJEDMCGs3OgqfZVHwY7RnN2m79lLpdqnMfyNWudV1+O2ypqg==
X-Received: by 2002:a05:600c:5491:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-477c016e60cmr18692535e9.2.1763721476610;
        Fri, 21 Nov 2025 02:37:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf226bf7sm40553985e9.11.2025.11.21.02.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 02:37:56 -0800 (PST)
Date: Fri, 21 Nov 2025 13:37:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [bug report] soc: qcom: smem: better track SMEM uninitialized
 state
Message-ID: <aSBBAL4UjO4PAXAi@stanley.mountain>
References: <aSAnR3ECa04CoPqp@stanley.mountain>
 <69202917.7b0a0220.234ce9.9e36@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69202917.7b0a0220.234ce9.9e36@mx.google.com>

On Fri, Nov 21, 2025 at 09:55:50AM +0100, Christian Marangi wrote:
> On Fri, Nov 21, 2025 at 11:48:07AM +0300, Dan Carpenter wrote:
> > Hello Christian Marangi,
> > 
> > Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM
> > uninitialized state") from Oct 31, 2025 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	drivers/soc/qcom/smem.c:519 qcom_smem_alloc()
> > 	warn: '__smem' can also be NULL
> > 
> > drivers/soc/qcom/smem.c
> >     509 int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
> >     510 {
> >     511         struct smem_partition *part;
> >     512         unsigned long flags;
> >     513         int ret;
> >     514 
> >     515         if (IS_ERR(__smem))
> >     516                 return PTR_ERR(__smem);
> > 
> > We recently changed this from being NULL at the start to being -EPROBE_DEFER
> > but the qcom_smem_remove() function still sets it to NULL and the
> > qcom_smem_is_available() still expects it to be NULL at the start so it
> > needs to be updated as well.
> > 
> >     517 
> >     518         if (item < SMEM_ITEM_LAST_FIXED) {
> > --> 519                 dev_err(__smem->dev,
> >     520                         "Rejecting allocation of static entry %d\n", item);
> >     521                 return -EINVAL;
> >     522         }
> > 
> 
> Hi,
> 
> I remember editing qcom_smem_is_available but probably it got lost when
> amending the changes.
> 
> Creating a fix patch just now. Can you help me with what link I should
> put in the Closes tag?

https://lore.kernel.org/all/aSAnR3ECa04CoPqp@stanley.mountain/

#!/usr/bin/perl

while (<>) {
    if ($_ =~ /Message-ID: \<(.*)\>/) {
        print "\n\n\n";
        print "https://lore.kernel.org/all/$1\n";
        print "\n\n\n";
    }
}

regards,
dan carpenter


