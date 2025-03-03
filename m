Return-Path: <linux-arm-msm+bounces-50203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AA5A4E3C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430BB1885A42
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFC525E837;
	Tue,  4 Mar 2025 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQ1W/RQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13725290A
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101658; cv=fail; b=XtKgNVgd6qxO1UP8oEP/6ataTReFxn4PGyDjjMPPO+wigTvmYOoc0H3tNTYMYcRViCAHKk8Vq7qCSOHxC+D/lrxfqyI69sAq+7BZ+0vXVjf/CoM5U4496JRQ2ICS/CnyVJ+brUkEjjDBoV7eJTJm32mfNbx6ngm9AJy3USD6Z3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101658; c=relaxed/simple;
	bh=YWn7+B5gR6wZlpJDRspD1mV66nJRedzZrS8mLxfwwG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYT6Qhlqsv87P5I3aVzR9tMtzBeBkbQlLthGS43XQM84WKDIuR9ok8/YQxJ2XMTLfWi7hQu86HFEXvOsgEegg//pJwqomX7o4Nqd8VrRWA9wDgrueOavy2/3yOH8WLAYI1rXMIMySdFDRNtojyoDqKyvO/ynX80AJw40Rnprcik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1W/RQ5 reason="signature verification failed"; arc=none smtp.client-ip=209.85.218.54; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=fail smtp.client-ip=160.75.25.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id ED5DA40F1CF8
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:20:54 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZQ1W/RQ5
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fVZ56W6zG06s
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 18:19:34 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 43C4E42726; Tue,  4 Mar 2025 18:19:29 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1W/RQ5
X-Envelope-From: <linux-kernel+bounces-541148-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1W/RQ5
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id 66DA742749
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:26:50 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 40B583064C0C
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:26:50 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AFEA1893EA4
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521C91F03D3;
	Mon,  3 Mar 2025 08:24:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501E01E1A31
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990274; cv=none; b=NgFSNUFod+jy083OWw8UP7+9U1TI4/FJ1iy7OzMPtKV6L62Gy4siEFNpVTdmaBazjEPXEMv83+0GJEYJ/4r6/y6k/TkbPJa1VHy5ZmQfRuelyrkXSnqM1uHa+QZnH3IWc1eJgPGJsFwPSc27m9sCPF9BA/prdPRLKdvzamQ0f3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990274; c=relaxed/simple;
	bh=hSBIYLscn2H9J+MqRxZlM/7jQNfEuoPNFDdWWYwe6ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEXOBSOV3AFkmiDbEOsb6kkT8Ll1QJ+DZuY+1VGKKgIP7tf+Q0IUuPU52qH0QYtV8sg5BZpWZg/a+WN5rqzVyI4UxxW59FXxvW6LQSvI/hE8uaFFAwZtLqXFKzjUlqQ9/Sv+zO68KTfD1Mig5J/dluDQGJU1MYBo3YJ1kpOCgTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQ1W/RQ5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaeec07b705so664445366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:24:32 -0800 (PST)
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
        b=tMiRrGx+YDrvZ2fDFT5nae58MfBoqWRQ2B8XykKsrkmsFG68wPnwS2iZLX3thahMEV
         5pNADOZ6JqKRLY8in3e+CF3HI8ZNcNubu7ahvmBm2YVwhGV7R115odpv081nvz8ogbf+
         fRlCOQfQ1w5j2Txm/Cj3UxKB3y+jhWPUYzwY9oxsZigGY+Ggp0irxmbWoQNq//zK7cMc
         Kp1+55dr+BQOll/tqLK0uPG1D/hosiZoJij5OqZUmb5n2JXDgcS7unvkHom8ijFfHNLt
         SsEZ8r0NBa6uilKmMupXqxKxC9VZW9+jzNv7Wnt90JbNXeiAbHRKoT5o54ZPvv9aFXrf
         3l4A==
X-Forwarded-Encrypted: i=1; AJvYcCV8zh63Z3qjMalws9sXnkMWt25g3q+4ufujpvUlT/KzQcb6Ny2zBSWNf5RzM5RlGQkUeTay8iNdEYk5xrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuYNhjysgan5/k64/C9ar0hgACHzbJuksaPQMEieFmWuHO6tCb
	8nwRTOLdfAfApLserB8eoTqBp4ebsK9b8iagIXQTb9RxoDWOsJ5YTtToez+OeBg=
X-Gm-Gg: ASbGnctG5Fcq+v1WdXqY/kZ+MhzWqsxnwJ4Qm6DtLLn5nOKXJvMbA1fgnmIhFYk7n1n
	f33K8td+VxXOqVz6tNXlZXLa/FksQ/UcqMKpn6Tm1tsph3G5SDAkuJesDPbEt1OKlBMNsh0Mnnf
	lqO0xFYVADk08AhbLtD0GqXiFrerEYunjQPCdd46et+/hvyv0n+lOAvaiDiGN7JBqus149T1uUb
	DXVIQo+MNWBXXEUFFZZgF2hPRqUjfMn3J8SXg9aiwUsknTFVKit2mBLujrSDhvOIu3bVVuz3RlA
	zSym+HKPBOHs6fXyfB8F9zLf2G7neuRNEwAhikXd/YICwbrsbQ==
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
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fVZ56W6zG06s
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741706388.53403@9CdOfECILJvwoYt+F5kRKQ
X-ITU-MailScanner-SpamCheck: not spam

On Mon, Mar 03, 2025 at 09:15:14AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdp=
u_hw_pp_get_vsync_info=E2=80=9D.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable =E2=80=9Cc=E2=80=9D (also because =
it was already
> >>> reassigned with the same value behind this pointer check).
> >
> > There is no undefined behavior here.
> Will any software development concerns evolve further also according to
> undesirable null pointer dereferences?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereferen=
ce+null+pointers
>=20

It's not a NULL pointer dereference.  It's just pointer math.  It was
a common way to implement offsetof() before we had a builtin for that.

samples/bpf/test_lru_dist.c
# define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

regards,
dan carpenter


