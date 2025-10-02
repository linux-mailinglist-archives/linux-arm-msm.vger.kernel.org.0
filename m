Return-Path: <linux-arm-msm+bounces-75781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463E0BB351B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 10:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA9F461BAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 08:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8C42FC87A;
	Thu,  2 Oct 2025 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KOI05EOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE972F3C07
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759394489; cv=none; b=uxx3ziy+XACcCjmAZ5G5rlGM//yqtjhTkp736yx9uxUWss407mG6bnPh0dvXIo8IGZLGwpAangnpth2i8DE+wVPKD0MYxRmlRRUdI+nhtpGp9WadB+IWzFSZTdQMaO8bRszzoKabQjO5YcDjAYzq9ivHXN3yOP1lnirwv6d5LFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759394489; c=relaxed/simple;
	bh=KXEH8lY/tuXNDSNR525jGqgLwK5Fk3nK4GuTClcHc/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1skg1pFErHgPlOFzw3+QPRgmZ36/jP1uoHocd/JZt0zRqQqSJEJkK5B77JI5pkJSZg62oDSYgeSJoPLPCjSWudYv5CBsu9XHwzdvg/gkv3RHCp4cKe6W0qjyNoWO7HJrnNrqk6Bdw8CddHvnVCEGTVjcTUkSC+ApoQbfTqoZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KOI05EOj; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-394587df7c4so510558fac.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394486; x=1759999286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRs2HgZQCtBeGXI9qj8l0L5wA46oSCjHp6c77COo6HE=;
        b=KOI05EOjoFGTwea9jR0vkw2CKU6laGmJha0OIFCzekBZdrSf9PIuVLjUGAfAhWcWRy
         KP73cLlNPxMhOE6vJSd7tEhZ/0GoqV1/I4KlZYVo1OcWJIh3XycMjMjW29in1nB2TrYn
         y9Pp1f/vgAMq8BGhmlxwtdRUwGcS9Ai1isuT5PqVjsJpOHn2sZBf4unp+KDTlfx714CB
         vhvC0E/Brst/GJ/R8oKU1A9cLnieZ5EKf7x8gDUML9QI+1vffjGl1Y+gdfTuiWpQhwYR
         Gd/rKYv0GpuCdaXdYyJL9ybmRQjnuyCJraIOSNteHuA4O8EjwaRC9V2enlKecmGf/7Tw
         OMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394486; x=1759999286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRs2HgZQCtBeGXI9qj8l0L5wA46oSCjHp6c77COo6HE=;
        b=I7DHVrL5X6OKAGoxRB/lToYTChRy2hj7UJ8rqtSXI/jBmXkEB497EqhYoYDocOy0P1
         gx1baRADpQeDHPZhEig5ys9T778oLzjsWzfWyEKMykOaiQL9p5oqnlKXv2Vlc5h5LK5W
         Z/8rugfrifWyJF46JBq6lRn7B33usrUp6M25334FrcAUZurgXVEOSDT0JJxlp9pnOr21
         UHouxtwxDuSOTydkRuOXHbYXvIL1RZhMi1D8shNKu5X1qassUqsE2RQY6Rxj98rtTazS
         yxIE/g/M6K0b1fAvuO0L/fHW6hltCo3QA71vOZiMhU97F3alOTiiiiEEV+dmjlVUwXX+
         aNwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWL0CkPwNdGyerX476tCqw0yJJf1mw8jJXZdkMx43IOn1B/lypMtqRCcFBbxFOkTzbu5JH8bLfk0gg/hZC@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvD6DckzZMCyXR3XDIrTZmzZlIdG735jxObWRMVHF4CLTZN1U
	aa8HDbIVLPGOmwpByJ6uLXJ0xm++gN/dbn0K+CK+r0f56pIXblOs0zVnyOyeWpDp0L68twFLj5R
	u3Do+ge5l4TZExZcKKujs2kdosAt83du9xmdCojnYFg==
X-Gm-Gg: ASbGncvoYWoC575kkRxoPT9S6K76VfRP+0VsPGJH7r8m2daN2a/2dRKC8Lr9ocGGY+e
	E38QuUwa8CLmuj+LNTyaqS3U5AYNKcfLYhxncdnjjN6bQluphfDa1tCjl+/wrmwXmO19Q9KaD9Q
	VFPu5aLH0fJ2TdFhvlIudGmvDDvYgg2fJWxFalZiQsoZZ5JSMH56xTXjkUReIJDzbReaQSC0BWz
	3faV2ZgzBQ7Iaub9CVhiztEtbQkZ0EK89QF
X-Google-Smtp-Source: AGHT+IFdxe19aSB3FNHWco6xM2pvw1ZN8obwBln7idZ5E/P9IK5Q/zYbBXb1d3G6WQQ45jHzBmBw7fP/yjYIvCTtv1I=
X-Received: by 2002:a05:6808:3092:b0:43f:7cd4:4fc4 with SMTP id
 5614622812f47-43fa402c2c6mr3295400b6e.5.1759394485922; Thu, 02 Oct 2025
 01:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0b14c3d51245f9eda2341504c05bd0f5b0828b7.1759243439.git.geert+renesas@glider.be>
 <a5907537-cecc-4564-bae5-981d3ad85d7c@oss.qualcomm.com>
In-Reply-To: <a5907537-cecc-4564-bae5-981d3ad85d7c@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 10:41:14 +0200
X-Gm-Features: AS18NWD-0rE6kz3-A73Pl3SUY0al8gOtGel9P-SlAuJ2V3nZRT-_jgAcPjsmPd0
Message-ID: <CAHUa44FcCyqaWCbsdEMj=Jr9vcsxHh+nK1qOqpbtJsx89C7tqQ@mail.gmail.com>
Subject: Re: [PATCH] tee: QCOMTEE should depend on ARCH_QCOM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 10:23=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/30/25 4:44 PM, Geert Uytterhoeven wrote:
> > The Qualcomm Trusted Execution Environment (QTEE) is only available on
> > Qualcomm SoCs.  Hence add a dependency on ARCH_QCOM, to prevent asking
> > the user about this driver when configuring a kernel without Qualcomm
> > platform support.
> >
> > Fixes: d6e290837e50f73f ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Applied.

Thanks,
Jens

