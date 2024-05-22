Return-Path: <linux-arm-msm+bounces-20227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714448CC1AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 15:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F85B20E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFD580035;
	Wed, 22 May 2024 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MGYlMjEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E94757FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716382899; cv=none; b=qV5IKTj5g2JmOtzdqnJ1NP9ZB4beBryMMQxzyv2eTm9J4AhFbTHw1XgT/o2i5OBqPsvlkdvYE059eh/7WBpWdwzorNKunkiqKZsvhw/LtoIg8doxGtbrqQ26XRyfPl4Y45efeyDRXxwQW9YfgPNSM7j9ER5n8gA6NaQ3MeUcKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716382899; c=relaxed/simple;
	bh=BinNhgcEH42gS3lWUSSUP7U6VJyoBPjo0uHCGJBaX60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlJoiAY0ybFiZ3qK4EZraIYNuWTYgR6giRWLIjIXSWc6zsCInMS+eEq8bUhoIw+YGEu4yMDVc04YOXjT+lgssXLl1cFdYB5BAhd0bC8wErylkRzV+yJydNDkXnHDIsvhGwirhvAamJiH58bp5A4vSrUaPwulT4/ObUNfAqP2kn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MGYlMjEp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2054959a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716382897; x=1716987697; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qRSyPLhJtHsuvnS9t5bdddtQaBryY+zRRpKLYbkoicI=;
        b=MGYlMjEpnHqhNLU2urthCIO51Pnoi3hbPa2DvTBz4VNkQqdhJlwpWy5hSQ8AGIwTAg
         NTSqVieylwPEZ8Xh9oOjSC+Y2eJR5Qg3EC/blciVu2tvg3sYAopsHoHAoGFUQy7NbnnG
         07jKbFD6jCaC0K+unqFhPMN+XbyXwITA619XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382897; x=1716987697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRSyPLhJtHsuvnS9t5bdddtQaBryY+zRRpKLYbkoicI=;
        b=kGwpooUlcGNgyL4q946WpghzWuYaoL3IfqUwJC3Pp34oiSvngVYQIV6M5iHnkPD+jF
         5WmRLFdxP+eT1gwrof+65lITK8ZAlsmBRcntZWI2e8FcQJuqgSFf9kOd9AKJE4NLwtsa
         rUspnbdS68EFj2o8wgcbE0iz28j1PuYkG9eR8QSi4ngM1R46e5tgR+6+DFAg8nHYG7Bj
         AWK9ka63pCz2UzzpOlaUI+nyXTuZF8AnTNh6lLm4jq6tYG6cmUHHypwFXuw+1I/Lsu/Y
         rjSpAuCzJ44Vf+QyvUQoRs0vK50Oi84hqK1Y8DXl66ZpnqATbIVeqqr7BohlCcUapZRa
         fPeA==
X-Forwarded-Encrypted: i=1; AJvYcCWzJcxhYtNxkofU6eDnzNqHLvwd9H7bkMk/2vReAWR56goFE6AhajIFxaActySdJe+cUxOacFzruHGFBNjQqcDVLUSRRCoZKMz0FLO4xw==
X-Gm-Message-State: AOJu0YxvA8jZe7KG8sGLs3ijddcyfMLpBj+xKnt9hO2hlktthvzMfVaZ
	fbnHYBJPppHJDndtOGAIXTtcTWvBlpQHu+ptp7gw7PPeKESr3UI7a+jcNKD6Sc5eMeDXZDvIlBw
	HEQ==
X-Google-Smtp-Source: AGHT+IEKTTQXxDq3BZ9k8CtamMhjpYgZketAKccXpd2hjRVupBbjpMXGmHY8pZkVTpK7rf6Uqkbmmw==
X-Received: by 2002:a17:90a:cb0e:b0:2bd:92c3:29e4 with SMTP id 98e67ed59e1d1-2bd9f5ecc18mr1848214a91.40.1716382896748;
        Wed, 22 May 2024 06:01:36 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a5b2sm25805446a91.6.2024.05.22.06.01.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:01:36 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ec92e355bfso11980655ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 06:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlmZrEX03bfUkpXH3GnvvOmyrMVcah6ZWmepBe+j3yFiUhPMj5QKorbnlSawxTebKCeJEY7I4en0sj3J5EbW/OK8cnzZNPuP0v04I0WQ==
X-Received: by 2002:a05:6214:3903:b0:6ab:6c2e:e425 with SMTP id
 6a1803df08f44-6ab7f356954mr17023246d6.24.1716382501399; Wed, 22 May 2024
 05:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-10-7aea262cf065@chromium.org>
 <284a3096-cc2d-45bf-9075-fcd1bc60a599@linaro.org> <96593105-0ca3-43c7-86da-7a059cad287f@linaro.org>
In-Reply-To: <96593105-0ca3-43c7-86da-7a059cad287f@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 May 2024 14:54:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtpSQWfe8Jj=L__kYJa74N7KnqMeaW0=cGzagMtBrHiUg@mail.gmail.com>
Message-ID: <CANiDSCtpSQWfe8Jj=L__kYJa74N7KnqMeaW0=cGzagMtBrHiUg@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] media: venus: Use flex array for hfi_session_release_buffer_pkt
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan


On Fri, 10 May 2024 at 02:10, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/05/2024 00:37, Bryan O'Donoghue wrote:
> >> -    u32 buffer_info[1];
> >> +    u32 buffer_info[];
> >>   };
> >>   struct hfi_session_release_resources_pkt {
> >>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Oops no.
>
> Please don't change the size of the structure.

In this case buffer_info[] is a real flexible array, so there is not
much we can do.

The driver seems to only uses the structure to address memory. It is
not allocating the structure or doing any calculations based on its
size, so it should be fine (famous last words).

If anyone has access to the hardware it would be great if they tested it :)

>
> u32 buffer_info;
>
> ---
> bod



-- 
Ricardo Ribalda

