Return-Path: <linux-arm-msm+bounces-47352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24B6A2E39F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 06:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37D637A1105
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 05:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FD818870C;
	Mon, 10 Feb 2025 05:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="YUh93J9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1B13FD86
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 05:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739165229; cv=none; b=TlOeLJTxzFtrCHQPEcRIKPXv0fgoO6rq8XoCSvs+I4XIuwPnW1AlyHoNxi7wJ0+IFKKCaefZofHitjFjpc/xwRdcbf8FnsZGXn/7rExiOM7Z4E44e+bSArj/W8Q3f3J11QPyIFLM7GOnJ8BgHaMj973l78EL69bXSkOprCLr40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739165229; c=relaxed/simple;
	bh=ZaZzKvk7Jpw0Xk+IM63SQtNmtlnk3CxqcAOuqfBd0y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1BBjlYKbJ7xpDDgsUMpKhmmm/VTV/2ag9HrgE0i1IFgOvTVmYvI/Gap8nxJmtH8VIVcddkD2QTgd7FAoUVNKBDXbWGnsPE9ieqw7lKlFyoRYFry9jpBLDEVZGd2v9x49bplbXqs3hZ/Uhv5vpOLhmb/M6FVKf79r01qlHzJcWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=YUh93J9j; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de594e2555so3493946a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 21:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1739165226; x=1739770026; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YPOmzVXXpww8b7P9KurA43+r96Qxt23SjHf/CrmgaYM=;
        b=YUh93J9jC1obNHeeEGPIkWgW1cJguy3tw6DIyWUy/mM+ixte3w2PddKcPg2xo8UcXy
         lK5ZXgF40qBME2VTjrMjXCEbef/QAyh+Pg+AOGVRPHqdblPMhkX1jennOuT+s+3GDKja
         qWwNQ3QHcVDRrfvdA8pBTtuysxLasfXux0BGmpA/wIeRhtbJ37gqnnySFFK/1iQbYbW+
         pxOuD12/kJTfQGY0DFrle7VOmZ/PqUl+y+gNyeWtKrErhCwrZHShyoK3Lvk0vGUaaxGO
         i8muMzdiiHwmrT03OPEAaIHwTbx4Oi6w68p1ZPQaeH0377rb1TC7EBji8SpHS3zJKBuN
         ZjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165226; x=1739770026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPOmzVXXpww8b7P9KurA43+r96Qxt23SjHf/CrmgaYM=;
        b=LwqdCFP/knCTq2R+1YbBP+yKXz3dciG1sTdPgUJDcAgWN0irtu2uyQRyVkh7bWCk3V
         ZU28TUZGW0hES379ppeyx55ePmC+Hk4XApiyx7TaukA0WqEvwEGzQ/cwwwwMZf7yOp+8
         TTg59/FeqncjbW/BnXTHVBVQOoK8t9lKHy0klXWScjcoe810LYyS9HLwx6HnUHgCjApa
         ymwk6rX1Tf/vQYgxZ6xScuVnPpH8dZNe2BkXmJ8PXwlOhnRhAhke8YL/x/q+ZSmMoTDP
         vYSQNtr6WtFfvQjPSgX184JEzR+uOdgUuXbdWrD1qhK0kPqD8I2XFIsfaPDTpYtQ6BSt
         so8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXJH9Lfa4oA4dkijmhYfpUYmBZt5iUUXZzM64D0VNzgGinZ8QnhKVCFl+oKInrTxntguJKEsj1GmjaM8Nf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzibc/uBvHSUVU8n/y2ZePZi/83eqMhMnJF571CkGXlQ8JPY2Xu
	SaS+NIkJAjTquOvKrtsJ0pmp3RBrIBlgf1VoHOIXk4wSIS+8BMd6I+kfnM7Wtyx7P0PhchPEcQt
	E0YqsQ4rMPfusef4DAjfrlcjWC9LI0M/qPqlMiQ==
X-Gm-Gg: ASbGnctCJ+hXddhY/vhHqQm6hcpbuqhGhuKCzLlFtEqJ3yLKOxyNR0jKMsynskReK2/
	5TTBJVSVvuyr7Dkee1j1ja6jDbnks78v71pVtY0v1Fwmpsp/Ak3m0E0oiMTykUgHw4Z4MW0FhyA
	==
X-Google-Smtp-Source: AGHT+IGjQIlzFHCfcDhIb4mXCz1GCQin1Sf8Lm53FCexRLyu5mlSb7CIelWVQUH61W9fRtlXczKUZxn27b99cpM/+8o=
X-Received: by 2002:a05:6402:3806:b0:5d8:253:b7df with SMTP id
 4fb4d7f45d1cf-5de450988e0mr12327805a12.27.1739165225957; Sun, 09 Feb 2025
 21:27:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205-qcom_pdm_defer-v1-1-a2e9a39ea9b9@oltmanns.dev>
 <2vfwtuiorefq64ood4k7y7ukt34ubdomyezfebkeu2wu5omvkb@c5h2sbqs47ya>
 <87y0yj1up1.fsf@oltmanns.dev> <87msez1sim.fsf@oltmanns.dev>
 <CAKXuJqhuNh1mV-40LpO3bffoGSOiFLkRB+uZ8+5+0eThctm+-g@mail.gmail.com> <87msev9v9k.fsf@oltmanns.dev>
In-Reply-To: <87msev9v9k.fsf@oltmanns.dev>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 9 Feb 2025 23:26:53 -0600
X-Gm-Features: AWEUYZmIZnrYQpuBSNLsNqjCDTjp8CehJeNFZ2kQMJArY-kRSvx_e5-GL-m08oo
Message-ID: <CAKXuJqi4h3QPBQjnvMeYTJbu-tiAL7Ti+nX-rADgENvwv4GhqA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pd-mapper: defer probing on sdm845
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
	Alexey Minnekhanov <alexeymin@postmarketos.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

> > I know that Bjorn already said this change is a no, but I wanted to
> > mention that I have a Lenovo Yoga C630 (WOS) device here that is also
> > an sdm845, and with this patch applied, it has the opposite effect and
> > breaks audio on it.
>
> Interesting! Just so that I get a better understanding: Is remoteproc3
> loaded at all? Can you please send me the output of:
>
> $ dmesg | grep "remoteproc.: .* is available"
>
> and
>
> $ dmesg | grep "remoteproc.: .* is now up"
>
> (no need to apply the patch for that)
>
> Thanks,
>   Frank

Here they are, this is without the patch applied.

steev@limitless:~$ dmesg | grep "remoteproc.: .* is now up"
[    5.746470] remoteproc remoteproc1: remote processor
remoteproc-cdsp is now up
[    5.880144] remoteproc remoteproc0: remote processor
remoteproc-adsp is now up
[    5.975094] remoteproc remoteproc3: remote processor
5c00000.remoteproc is now up
[    8.642160] remoteproc remoteproc2: remote processor
4080000.remoteproc is now up
steev@limitless:~$ dmesg | grep "remoteproc.: .* is available"
[    5.491202] remoteproc remoteproc0: remoteproc-adsp is available
[    5.546421] remoteproc remoteproc1: remoteproc-cdsp is available
[    5.565271] remoteproc remoteproc2: 4080000.remoteproc is available
[    5.580100] remoteproc remoteproc3: 5c00000.remoteproc is available

