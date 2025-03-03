Return-Path: <linux-arm-msm+bounces-49973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E0A4B940
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 09:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 002923B260C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 08:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7B41EF091;
	Mon,  3 Mar 2025 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ1W/RQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510F31E98FF
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990274; cv=none; b=BzHsmm5x48P+nOQHEd/0F0S+dqWWfgqll4bdbyJmAOMR/i8OFwOOqkC+L78HCRvReiexE8vQ9aar4KQpTl+w5NnKNnSEuP1OF46B7451cvW75Ym3wChPYbQ/dGz/8bjBL3z1OcAw9hKB+Oo5J4+EaINy9huTOxGn7ShjLnI9AVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990274; c=relaxed/simple;
	bh=hSBIYLscn2H9J+MqRxZlM/7jQNfEuoPNFDdWWYwe6ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEXOBSOV3AFkmiDbEOsb6kkT8Ll1QJ+DZuY+1VGKKgIP7tf+Q0IUuPU52qH0QYtV8sg5BZpWZg/a+WN5rqzVyI4UxxW59FXxvW6LQSvI/hE8uaFFAwZtLqXFKzjUlqQ9/Sv+zO68KTfD1Mig5J/dluDQGJU1MYBo3YJ1kpOCgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1W/RQ5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac0b6e8d96cso86148766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 00:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740990270; x=1741595070; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
        b=ZQ1W/RQ5pKHe6TuSfXOOT8Y1/PkFTG7ziIuqCfIBuPCyOp5tNnH1ufGf9RtfhRcTGh
         1M76XPwwFhZLx3vuuIWLTXaC0F+nLB4dwcXcIwomg6E9VBPNJdyKw251zXFlkxJOIK0g
         aSzJrZlR7Eanw6I82ZLVXkksb3VXsx8SCU30MNrIJMrV9chLYs3a2wzboY5gTtRsZBTy
         iqxnfXUG89mZwhF9E0Q8mPMSA2CdkWuM5nK67He+MWYzkm47y2wGu28LBrnKFi73Wrlz
         OMXrXhBsJHaIjUsvI08nypKwfYvs0Ze0r676YLdW/ELE8/11cd/B4x8WI1swGZOFjZMV
         ndgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990270; x=1741595070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
        b=opsv6Bf8HC6rnfTfwobGKn/UVImA0j9tojiWBh9LKZXxzH9s+HlVsjcJbErGsrVGCP
         16sPPpDl8yCJDAovdKvd6SXU0cGvcPlUeyyf57xCSAyxIbb0JLhfH3uMebc4A8vNPo2h
         1LAbJW7kCr6lztrbEQfzF3D74CTgXPK78B4S4qN0h9b0VbI8oqZw9Jfj5sdWrIQzal0t
         R0jAS2hN3X2kypKYs9kv/eZqVjQrMSLnFbov4cId5uSnHY0tRKWojNfl5lyYyUpw4jMb
         5w8iILgl29RghOuyjz2E6enuVNh9YyMiXxnjl0IZIKkrN7EWQyreKY1vg56Uk6TFJQtD
         Vgyw==
X-Forwarded-Encrypted: i=1; AJvYcCXg9vZUr7Ad512sq5mI6QMj9ghwpIls/OZ3fXjV6wsXAeFCpl9qXM1qrOa4kMl6LfpFQI+BlH9ddIVNRGr4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4r0BN9UZ5H0SJaBaAIg8YRUoRVpQEryj5Un17DN1kYeWjcOw
	1CMqVZUW9r9jxblse0QtG8x5F9GIrZbMVEGy6DCOICNgP4Og6XBLao+CH6O2oW4=
X-Gm-Gg: ASbGncvVgfHosv7bO4ZpoEb1FhmDZbPtqzYIDwxB6+RfOKUccCTwFo8vtLBbAusL2sD
	yjFhweHrXPR21GckV7q7KIwQge7RdQANGVL+BJQHPNMelGekIFxqUWcog0/ExCwE6Uf+vjOi0gN
	FL5OSn9hvvPBn4hOuFMSWx7CXcUFtHxAJsKgFU6kxNm8tWKAKweIBR69LJ4YsVIOICwEhHHMSLi
	xK77PtLUQGN2q2J7r+0gldHhkBZT/yRBypoF8bppNbcro0jR/86+hd0+clOPdUa3OGqCfmbd4lv
	7zFlea+hnPzKLK1D0VmgmwPest2jTaXSwaFon+GNLbX9iM2lKg==
X-Google-Smtp-Source: AGHT+IFy4o0lL4wbVfv25BbUZiZprY5pePIQkrVcMtYcd0n6ALHYFSnKECFQ/9k22YMwYBQpC08ZKg==
X-Received: by 2002:a17:907:6d0c:b0:ac1:791c:1526 with SMTP id a640c23a62f3a-ac1791c1cd3mr169820066b.56.1740990270586;
        Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf3f3bbfb3sm525674166b.77.2025.03.03.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Date: Mon, 3 Mar 2025 11:24:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
Message-ID: <ce9599fb-a798-4f22-b51a-3341e690f8bc@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>

On Mon, Mar 03, 2025 at 09:15:14AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> >
> > There is no undefined behavior here.
> Will any software development concerns evolve further also according to
> undesirable null pointer dereferences?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers
> 

It's not a NULL pointer dereference.  It's just pointer math.  It was
a common way to implement offsetof() before we had a builtin for that.

samples/bpf/test_lru_dist.c
# define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

regards,
dan carpenter

