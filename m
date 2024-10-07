Return-Path: <linux-arm-msm+bounces-33379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D0992E22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDCD21C218E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA95CE574;
	Mon,  7 Oct 2024 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UdyExYMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737C1D279B
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309638; cv=none; b=Z0d2s3/iGr0GxS0/1l7hwxLlXEfTFXaXZouQ1DsjqI2HK1zfaD9GseqKtS0ZhwYATBTnINsqw0HM3qbj9p8tuQwr8GGzUJ9OPOE4AihbAWQIKgpqBNgESNFkXQ2MZWG4bzkt/VUNZP/jLkrb9YRWpGSpBb9JYy6gUfNRsZ2qJJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309638; c=relaxed/simple;
	bh=tzGpZ1B7fLhxjfs5UNJtIfBOrNHIIXSsKYxOPsRE4oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AL4DNsF6eaDTLL80vPPLfoHfffUX+wbHBst4KY0Bh2VMIVIpcX6LpyxRF6PDfyUDeQSWkBLquPJU8p2iDZXKGcZuH0hZ0ec2gHnf2F0RMwSUc0ZRGaBjmwUhVsDu5ZIAQQcmv5i9Mm+UJ9BG476erVdn/kPc3BB5VTwv8Hylb48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UdyExYMw; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so5364313e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 07:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309635; x=1728914435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy0Gz3EdQGICzEnD8uO0/8WhRra84BxD7rRmoP1WUZg=;
        b=UdyExYMweQhf+E6SJEMdDCQkDx0pW2r/swhKNEMNlXEXVIAbclZeI0i+vQ57kDBROk
         fvFz+ysbn/vtLfJSbK4x6PcSAKRzsuF03iIieQEC0bMdJ4rJNTeznJv7euIdJ0hFsZop
         yZrZmEt2wZiFQXlr3VT8bIJF7Xyw4SFE67AaX4zUMQcaktB2UCprGs9U7bvoqaq0iITM
         Emmk4d09oVXso7VSFlXBp6mP3TzvfwUERh3hm1gPN6z0t9VIYEld989NgqKtIRobp1yZ
         FGGFZVwKkTqRxFpq0dn+uDjDS7r3fM26QXkbGVD1Y0n75w472KhmNkfu17jI+BPImFp/
         u+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309635; x=1728914435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy0Gz3EdQGICzEnD8uO0/8WhRra84BxD7rRmoP1WUZg=;
        b=AEgCfkrjsvKZpK2Xv/gDU6yqPaAELVlRxhBqzePjqD0EgHzQT66NkRSlu/mWKyQp21
         yp41zalsQ6X+K5VF2j+ilHFY3bohearSUROI1E7D22Fo3uEq/5ev7S8d5T8nz2QfJ/3t
         bgAD5TEzHQmZhxtTUKh6ocuhz4MAwolnzS962/HiUEnlOa2PK8SXNR3RWI2jpCb7WQhd
         mVghu3WTPwjPs6ahmpr92aKLseq5z+qnYHJ1KWISUEJynaNO+whj2qjIJdXPVP072485
         BcNoYh8sJvxU0+bcsn4jAnu39ETa39Q/auoltzpHr5Tm7RKprPaLdkcg0OcBHKJ8ps1H
         xQ7g==
X-Gm-Message-State: AOJu0YzmI3fsTctNMPrxZHJD7UP/FwY5VEEtqcITIy6dYvp5cufjwfnz
	SpXSmp47J+lmrut9DsMImREADeOIeu10qA+mKxeEgIAKgXWPLFHdbsHWcyd7l7Y=
X-Google-Smtp-Source: AGHT+IGW7IqZl9Mpin4nsxqbo6HR3Y3Qib6EmFhulT1fG1XZoxfVQ6sWL1szp7/l8264Leo2fYTojw==
X-Received: by 2002:a05:6512:104d:b0:539:95f0:a05d with SMTP id 2adb3069b0e04-539ab9c7251mr5074412e87.58.1728309635246;
        Mon, 07 Oct 2024 07:00:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d2f6sm855423e87.152.2024.10.07.07.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:00:34 -0700 (PDT)
Date: Mon, 7 Oct 2024 17:00:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
	Arun Kumar Neelakantam <quic_aneela@quicinc.com>, 
	"open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rpmsg: glink: use only lower 16-bits of param2 for
 CMD_OPEN name length
Message-ID: <zdpszrr7lhe6bvnq3ullwet3pzfidnhfo3wlvfbljnu7q4j2z6@3romukxqjyvd>
References: <20241007044723.25347-1-jonathan@marek.ca>
 <rmybaobbmhmynz3or4uwvhdgqjrkahmkwz5ncct6rssnfpq4jh@ulqeqesixyhz>
 <8b050bcb-640d-4443-ca31-787ec5c02a7d@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b050bcb-640d-4443-ca31-787ec5c02a7d@marek.ca>

On Mon, Oct 07, 2024 at 09:19:05AM GMT, Jonathan Marek wrote:
> On 10/7/24 9:16 AM, Dmitry Baryshkov wrote:
> > On Mon, Oct 07, 2024 at 12:47:22AM GMT, Jonathan Marek wrote:
> > > The name len field of the CMD_OPEN packet is only 16-bits and the upper
> > > 16-bits of "param2" are a different field, which can be nonzero in certain
> > > situations, and CMD_OPEN packets can be unexpectedly dropped because of
> > > this.
> > 
> > Any idea about the upper 16 bits? Should we care about that data too?
> > 
> 
> Its a "prio" value, it should be OK to ignore it.

Could you please document it in the commit message and in a comment next
to the qcom_glink_rx_defer() call?

-- 
With best wishes
Dmitry

