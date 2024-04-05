Return-Path: <linux-arm-msm+bounces-16456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055AB89937C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 04:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FCF1F21F55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 02:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878E918C3D;
	Fri,  5 Apr 2024 02:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="azAwXyZu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87514256D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 02:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712285794; cv=none; b=fi58GRy4ttbwdaoQ+YEw4kOsYRFUpbchr6lX4DCBVqHr54b8NGdHlgwiBMrg5RMrVOf0L0Bb8qY4hcI/9DNPtszAFL2lNo3FDDZEQxNZJqZwMKzdjgz6nlpYSctWkkVkGbtka6gTk5ZJ/uSE6N0NIbCmMKSCekPnPHgKDJtCZBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712285794; c=relaxed/simple;
	bh=kM6XH+bKgyVxIo9DuSq7aqXJXv9/t19xjoc9OIcTDSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V74L597SdMYy2pwVXqMu8ZTsudKgcDCPeA7w6lmXBJ9cyyHjjRFSdp6yXSgf9bjqtceXqFbMjx/sz8gOKCw4q1WjJIPlo6QuUqjnfDpZRcV4t80+6ufLwYnkb5ZsnpDoOESDTopnVTfZcKv2jIZeR3tqP9BpkjruO6VssG0MNy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=azAwXyZu; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dbed0710c74so1631843276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 19:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712285790; x=1712890590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dEsqNh0qk6wjxNfe1EBS/5T4PtCYN6iMohqr+1wRzko=;
        b=azAwXyZuUXce94YC0Umv2/ExAqJ+7SymgHbihppuPlaZVOpvv+wU+2kQpPmuZu+DhD
         Ns71h9e25/Qn/GtHj2x7JU0Eg5XCTcerMF9nwv632Vi3q4p/fQ9QecNJhYI2U+y6BNQr
         1MUDkhw7DZDjJT8tW2JwBRCQJRaTsb1Vd8Kg82ex+Dbp0OqhLTPX5nv1bHCQNa7fMEyW
         kRsjYNlNmKjcRtWYlN2ycLCWXuRTNTLdm7s/6SBvcBFV9+IOdIMGwuneEMkYvKFxs2yn
         1XmyJHx6YKZlLowfb6UltGOsKDyAPUJoznIKTEy6g2BsLd+AcjGAVqAdcjLogZGhn3V8
         Kirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712285790; x=1712890590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEsqNh0qk6wjxNfe1EBS/5T4PtCYN6iMohqr+1wRzko=;
        b=ZYDmX9Zax4AHdwvGeDFh7jgH8id+BBejan5lE+ZVDhSGc2Ju85sBSBIRuUTXKhKzDa
         PCjyCuAY19qLgKMRbyUBOEgakvpsL8mvLeh5eczv3fEwhUJ/EWCjSt+nQtPLQ+91EeSI
         Rt4lDUIwL7c2F+H8UfCwkb+HWm7wkPkV9lmbIiWNJm6oczK8q/mBrH20LX4vh05Z+o+y
         Kcq0hUKQ+EAsHxAJE5mq5PG7CZ/aba9yzYcKCg8/HqbvrQ00tjWCUox1G67xN7T1rmUu
         MRK1/8gXVCLGUpIbU1t5n2O3PgOHM2/vVTkHKWmCRrUXFddEygGQ4hQLHJsfWUaKCN2L
         JyFw==
X-Forwarded-Encrypted: i=1; AJvYcCWicrvsf6Ko6g6TV6AVgleYhaO/9ho/Dkq+bPYHCglz39fScEHltAq6tAec96KrdaKnmsBWxnX+RVLiSE/We6DzFtAGdCm41f6i5abY0g==
X-Gm-Message-State: AOJu0YwpQ6FxZO4LYl0BRJS9uEQAO5yMTgAwIprhBaz4hAhWa0QlVpbr
	zP+Zvx10VBeV03l0+vYzTx+SvnvLvHojVFv/Xr5+QkFlQLHfqeEvDDqrQmtxyjtN46vVH03Rlqn
	L/aYBG/ahYL9vPHVEzFiVNw1xpc116G4bmYz7uQ==
X-Google-Smtp-Source: AGHT+IG4u2Lg5AEQseN8XhnyCdvNikS9yjicoQQjhDBxxVZhO/lMnvhSuSj5pAzYdpOCxOv9gcRM1CyMxY7VDXAbmhM=
X-Received: by 2002:a25:aace:0:b0:dcc:c279:d2fa with SMTP id
 t72-20020a25aace000000b00dccc279d2famr88256ybi.30.1712285790527; Thu, 04 Apr
 2024 19:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405000111.1450598-1-swboyd@chromium.org>
In-Reply-To: <20240405000111.1450598-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 05:56:19 +0300
Message-ID: <CAA8EJppHXkTNSNaCoYWZaRmKw=AfWL4N0WCqR6uFgNdbkw4VUw@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix register base for QSERDES_DP_PHY_MODE
To: Stephen Boyd <swboyd@chromium.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-phy@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 03:01, Stephen Boyd <swboyd@chromium.org> wrote:
>
> The register base that was used to write to the QSERDES_DP_PHY_MODE
> register was 'dp_dp_phy' before commit 815891eee668 ("phy:
> qcom-qmp-combo: Introduce orientation variable"). There isn't any
> explanation in the commit why this is changed, so I suspect it was an
> oversight or happened while being extracted from some other series.
> Oddly the value being 0x4c or 0x5c doesn't seem to matter for me, so I
> suspect this is dead code, but that can be fixed in another patch. It's
> not good to write to the wrong register space, and maybe some other
> version of this phy relies on this.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

