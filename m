Return-Path: <linux-arm-msm+bounces-42372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13B9F38FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 19:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380A318902A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 18:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1729206F13;
	Mon, 16 Dec 2024 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFIkBecB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35188206F14
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734373769; cv=none; b=tnnzyZMYci+nsBMWW6/6OVwHIflNntpybBXemYuN5M5GZEcJGGUXVRc5qKWIV9bn+qHIcuDIzAfqaTonvBztCeeC27ZKcUG9JJzslt6onPwCLfQiv+d5zyz5+PDfx6+fVLBv4Mjfh5Ts4i75E2afBSWuatbWGEc9/cl9ayBHrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734373769; c=relaxed/simple;
	bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFxHyZHwYtTyboUyNjQuSAVukXdH3pC+0Urgmk0oX+4WfvITS85xcOuv5AYnbVSKQTXHBnnLAmCSZ/jLblHIJjqTxqic8AHtwqyXe8tjkye7B+O+MnehN8IxK17crdg8+epf/TXtCKlJY3WJcEtRRaiKmf5cE00SMjY0VP5kspE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFIkBecB; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ef66a7ac14so51406447b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734373766; x=1734978566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
        b=RFIkBecBjNqjeoYxVmXSrDHc09wE6avr6cSxLhvDMzz7i9eKzBgYZStqGHW/uPzrlM
         2gAd1SunVIgCUarHTox6+LoHde3rv9rnWk8pG3nTGYlAqAL1dJQCi/Adao/PSmKqe0oV
         OBoqUgWvhXrMSiTZFtoNqDIfhveIiuZ2LLmCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734373766; x=1734978566;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
        b=fFHd5HrJpBtpA9x5Pu6HEPwsFo48OrKSn1cwgU97JSRKDUHBZgWiu6C6HNbKRoJnld
         AVOyKfefZC6ZCdYj/3OKc+AnH9oEZBdaXYq4fHzsK50TiPPl/GSvwQ7XtJYbatSKJ+dN
         VKoGgF1KBFdruHlQyUo16DbCfoF/T5i4saUEEAb5s5vNnS/8qLxAWUAFMKz84CbEmUoj
         qlqcIlYx41Q511HeVTVGhlFPo7/Oh+PYakxlKUrQ2BPCm56AitqK1mW1I2hNhX79RA8H
         o8qis+xBPpLeudZjddUEJQySqO21YW563im+lic43B4GPuvfoj4kVpp5PHc7anyvOSGI
         yveQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX819fTBHexhFiWizzXPAZnNYR0SyWW3ZG0tXgeGALbNwz2mWGxyUxArSwxsuaYRwh+ZRXk2F55uHf9af7@vger.kernel.org
X-Gm-Message-State: AOJu0YxidWpv5KUQW5tOcRInI4WgjusxdGl8gwL0JSxZ6D/g9WR82nUp
	KTyyESlVVXp2MSwHNtJKeolSJsFp9mrLsuXk9J5gfGr61tnLeDd5BW+Fg/C/IpJM5ZfO4rwUjGH
	Esax96GpFEb/9+d5DFM488ccbfDoNrxMtHYfw
X-Gm-Gg: ASbGnctp48AXJFn0i2XeFXqKss7GoYsqy6hwwGNErR90YeEE9Wf6HMdYHEmQJcO6yTp
	VtReqyRSNrBabgYPZiAIoMSkGfYHZeq+Lfbz7pDMFz+0ponl5sACjeyz3G0Xej4pcYg==
X-Google-Smtp-Source: AGHT+IH1rrCqzyUmv/+ovkxDTTujqBxDtcReQhBBlksOzIUEXVcbUlAtrkHnUp3TKKoOBpjZ9dyQODPY9A4b8x3dvxM=
X-Received: by 2002:a05:690c:48c9:b0:664:74cd:5548 with SMTP id
 00721157ae682-6f2bb9a5b62mr5055197b3.1.1734373766242; Mon, 16 Dec 2024
 10:29:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:29:25 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org> <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:29:25 -0800
Message-ID: <CAE-0n527-TKS2Y=SsmALOKrx_QrzT4=j_dTyNgk9A_RDQzVcWg@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-12-15 14:44:11)
> It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
> driver gets DSC support, it will handle that register in other places
> too. Split a call to write 0x0 to that register to a separate function.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor

