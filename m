Return-Path: <linux-arm-msm+bounces-42920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D55779F8CB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B50791897FD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0A119D06A;
	Fri, 20 Dec 2024 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GJYQDfLX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B85718628F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675749; cv=none; b=jJ4aKRyMiLV+qN9a90WipeRL3fl4itsKu1fGi4BbbSlezyK3c7iubt3iGDx4yk3qrfiZdOMc673UHQsEz2JVn29egap1pGoWSaudav4agcqUVeXealOWWmu7QugyiBfY8tsjzi5qweblhbPHR+WWt+FEtFVFoQoAOuUQ47/BWjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675749; c=relaxed/simple;
	bh=yTxtHlpZhJaWLrNGQktrEe47fUy0ci77cALAMbauTGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYjS/mzRvganWnJ9xcogAUxLvgN8bUCYg6LJQF/B9IytJFMioawT9mqEXI7Bpvnd1vnC7j2BBOdVfeUQH84rD8qd8zac2KTF/0ljIHPKFmWdzU4OJMGC9iTz8I8pQvvdQLktIi7/gDZtJjuhjIljDe62gHhIMn+/xOgInsM/+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GJYQDfLX; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-728e1799d95so1850904b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734675748; x=1735280548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hENRJeDL2zrkFH/JRQSrNdsVu5tnCmHT7uSM0w/i5Kc=;
        b=GJYQDfLXfDqwTYjAV0XaGCgvIqBwhp0H1Z/gfuppK7LLCA9MI1FzPdzkR62WNlauLb
         9QdSGJ6rSOJ17jR4Ml2xJWKIZSdqFR5d9bnnxQJ89MfxPLXr1YRn/dWWK16XYSlzM9CI
         7pfz1ZA5Ok+IRYXk8j7irPI076eAOhyM+Q+nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734675748; x=1735280548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hENRJeDL2zrkFH/JRQSrNdsVu5tnCmHT7uSM0w/i5Kc=;
        b=skhXX1DeHDxhy+2GO6zj34kK1gk9oj3+pX3UltSOs/280nI/TotnY1IgKv/py+dHac
         UhUK6mONoKvnOayKWakP0iKJtB/YRL2Mk/Onb3b2Gfm35+80t4mKx7NaYheC2K/f9VmY
         +Rk4BWzu0inl4k/ftuDz236M4JD6Z3lpRYORqGNT7wMAONBni1RN9jOsq3oTRp+NvHgc
         9UEvm7KNuGsvI+pYp3RV1wsJIbIO8bLPh1YcXf7Msx7E8wRU6DceKSgf3jsYxJn4sj6T
         us7eLtMNDELteY8UtvkooAcig8ub+BWzW4NR34XuyZCdMnk9lCCZzXbc6vZeAixcX3vk
         tYMw==
X-Forwarded-Encrypted: i=1; AJvYcCWCKGnij0XDlUoRVe0HcIgwEqfnbaa40nGfU6yktNUSLnaSuPkdrPSNcntDFTOxcVFXE8sZSJLjXYAC/MmB@vger.kernel.org
X-Gm-Message-State: AOJu0YyAb0kmYjLsb5NGnCBKjykq91s5acOzcISJa+ZBF2i3TlF+a8z0
	XTCXG1lH9rB5ywhtWP/61v6vV3b+fgfV+I27AG30KuriHdOHdaS5oNtdQFLqzg==
X-Gm-Gg: ASbGncveIf/G3j7jMWIyic167ezOj7SWwYpM9J2BQsfGebXT/et+B10k7CZZKT3TWTO
	nCkGaBCh8xo1q33zyKWfG5WY1QeXVBMQTM4gB+tD+8VIPIsVQ9fUT+o3PhQGrfQJznDld6sZGvO
	6tMDLTUCvZaALYUZeNOfsdwWFth8JfC5iJ9QUNIQzxrTbkc3ScLJ0oxzErn0Iy9Au5eJ73P+Jdw
	AZETO+LipeyOHK/4joTqCJn81tL1hDouQPpts2DVvAhelJZ5TLPD2I6WueP
X-Google-Smtp-Source: AGHT+IE9RQtbpm0MmqI0gbDVgr7DDJO6/SI2ZeXyHFwwSh9QSDTdaNOMl2YtA5pMMEZot8nSPSy9Nw==
X-Received: by 2002:a05:6a20:1596:b0:1db:e0d7:675c with SMTP id adf61e73a8af0-1e5e045a0b9mr3334587637.13.1734675747746;
        Thu, 19 Dec 2024 22:22:27 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:8e99:8969:ed54:b6c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad836d0fsm2358036b3a.73.2024.12.19.22.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 22:22:27 -0800 (PST)
Date: Fri, 20 Dec 2024 15:22:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] media: venc: destroy hfi session after m2m_ctx release
Message-ID: <36jk74quu6pg6q6fw3u6k62uzupcjtiwrvbnn2gpwp4iolxeao@lykirrx4j7mn>
References: <20241219033345.559196-1-senozhatsky@chromium.org>
 <20241219053734.588145-1-senozhatsky@chromium.org>
 <yp3nafi4blvtqmr6vqsso2cwrjwb5gdzakzal7ftr2ty66uh46@n42c4q7m6elm>
 <xkmtptaqzvwe2px7q7ypnkltpx6jnnjeh5mgbirajzbomtsjyz@gefwjgfsjnv7>
 <ga4g3k7j6hx3qs243lcsfyzpuonh3wvxjareaurlg6e246xf7i@xdlg4l42fnuc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ga4g3k7j6hx3qs243lcsfyzpuonh3wvxjareaurlg6e246xf7i@xdlg4l42fnuc>

On (24/12/20 08:03), Dmitry Baryshkov wrote:
> On Fri, Dec 20, 2024 at 01:32:48PM +0900, Sergey Senozhatsky wrote:
> > On (24/12/19 15:12), Dmitry Baryshkov wrote:
> > > On Thu, Dec 19, 2024 at 02:37:08PM +0900, Sergey Senozhatsky wrote:
> > > > This partially reverts commit that made hfi_session_destroy()
> > > > the first step of vdec/venc close().  The reason being is a
> > > > regression report when, supposedly, encode/decoder is closed
> > > > with still active streaming (no ->stop_streaming() call before
> > > > close()) and pending pkts, so isr_thread cannot find instance
> > > > and fails to process those pending pkts.  This was the idea
> > > > behind the original patch - make it impossible to use instance
> > > > under destruction, because this is racy, but apparently there
> > > > are uses cases that depend on that unsafe pattern.  Return to
> > > > the old (unsafe) behaviour for the time being (until a better
> > > > fix is found).
> > > 
> > > You are describing a regression. Could you please add corresponding
> > > Reported-by and Closes tags (for now you can post them in a reply to
> > > your patch, in future please include them in your commit message).
> > 
> > The regression report is internal, I don't have anything public.
> > One of the teams found out that some of their tests started to
> > fail.
> 
> Still you probably can have a Repored-by, unless it's anonymous report.

Sure.

> > > > Fixes: 45b1a1b348ec ("media: venus: sync with threaded IRQ during inst destruction")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > 
> > > This is v2, but there is no changelog. Please provide one.
> > 
> > The code is obviously the same, I only added Cc: stable and removed
> > one extra character in commit id "45b1a1b348ec".
> 
> This is the changelog. It helps reviewers to understand that there were
> no code changes between versions.

Sure.

