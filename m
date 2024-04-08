Return-Path: <linux-arm-msm+bounces-16783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1489BC1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0492838AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603ED4DA00;
	Mon,  8 Apr 2024 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jueTwUG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2D482C7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 09:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712569308; cv=none; b=qNYgaOiwOdKlWS8GkTCJ+uK+6ziVzcYoiM5PepiKRdMq6GTpnKBTYIeXunf4L6PGh64pNkouWpDi/i3tXdYg9f5QqGZBSh6VKmQ2sz5mUJYA+HqC8CqTpdYBZ6KD0lfTkNsFrNCgOSwgrd3DdxuXKG4XNXqsY7Us8JwrPxxwfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712569308; c=relaxed/simple;
	bh=2OSuI87qeGvpN4vzsuqcY61LwKCgIvnMstgmBULzKjc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=husMOYWOYhR9V33EABLSCV709riWYg6bceXPoZyZi300VYSBM6yJVEsEzw2gd4x39Ghd1kKBeZUgk5Ix7s2P3whoiW7SfEr8Ym4o0d/4tA2Uukt22mkCmXVLoOJwTuQ6qceTAPX3pU8AJv+QPmKHjG2qs+kMHJY0qYDCDtsRlsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jueTwUG9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d886dd4f18so11588481fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712569304; x=1713174104; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1sjyF9zPEl2TEamRL6KiFbzsyaAM9a2KSULoVj+d9A=;
        b=jueTwUG9hNYGikyha+uMGTbLG5g43pwY/7JHCeMZkTaizz9DuCVjG8sKWTciiDMc8x
         A0kdBc+KcCRky2XyPawS937Shcz1NHCnengA32ZqrRx+VrWsitesxxCUYf+1c08NkBvf
         cJblrxfC6JNx/9l1OSg1IwpCBinuk0txLwCZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712569304; x=1713174104;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1sjyF9zPEl2TEamRL6KiFbzsyaAM9a2KSULoVj+d9A=;
        b=gnmBCQtnWJxAd1jBtuIal77RJ/1TGJmlV44GglLl0HBuJ2e5a0UJ72fIWmcVKSAWZL
         AxZCz6liOLhOUJyh/cGVjiay6YvOuE/1KGkjNopmvyq1OjN4NDWCmZatQUrctL1BbGK5
         Id/78rH5IdhGmhS2n2cQOnTzrAjUTOTrjgnK5+x+E65/NpfVjYgvqWKfvMrw8sjMiIXB
         dbiFYBlfvJYzk+KvYXivcsfDPOUarxkl7JZPeCmKjUILuSUHGTmmCSxv5z7DdN5lbC+V
         0XmG37uoNP+VWRs/ck1deYyFwDP/GhaCpKt5nD2hSmS5FP63LX8w6XDaSalQIaBmJ38y
         eTkw==
X-Forwarded-Encrypted: i=1; AJvYcCUuysaKMfiRgYg30amEtTulphGS1jpE2Z70Dm4Ej7Bt2gNvsRVC18iVKsBySq3xd2HNiGKE2U6o5F2/oke7TzgJtNobLxw6jymccq1FQw==
X-Gm-Message-State: AOJu0Yw/v6PGSzGbn4Y3aDCT+sKqSoQgQj1JNOxAuF7R5eqGhJhig8rE
	dQqpuIL79CO0r3/0cfVcke2ZdOjB5cXOd/AsPIpDR0Hnueil176DvB6P6kVWaJSlALP4L6Sq3HM
	Nhwtg6etKrQMOVs4JOuIGO0+BxzhzVBDOkOPy
X-Google-Smtp-Source: AGHT+IF9NjrwqKlld09cONkAoXbGH6b8es74pe1Um/RUmrsKTi3n/+lKueJeNAGkqsUBxbs47mKMH0KhlmofkKRnCCk=
X-Received: by 2002:a05:651c:42:b0:2d4:77c0:d61c with SMTP id
 d2-20020a05651c004200b002d477c0d61cmr4901918ljd.35.1712569303584; Mon, 08 Apr
 2024 02:41:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Apr 2024 02:41:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240408093023.506-1-johan+linaro@kernel.org>
References: <20240408093023.506-1-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 8 Apr 2024 02:41:42 -0700
Message-ID: <CAE-0n50cZ0MoT6M97NAXPNfejk46MkLxQgvBELxFVGgNRRaP9g@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: fix VCO div offset on v5_5nm and v6
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-04-08 02:30:23)
> Commit 5abed58a8bde ("phy: qcom: qmp-combo: Fix VCO div offset on v3")
> fixed a regression introduced in 6.5 by making sure that the correct
> offset is used for the DP_PHY_VCO_DIV register on v3 hardware.
>
> Unfortunately, that fix instead broke DisplayPort on v5_5nm and v6
> hardware as it failed to add the corresponding offsets also to those
> register tables.
>
> Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Fixes: 5abed58a8bde ("phy: qcom: qmp-combo: Fix VCO div offset on v3")
> Cc: stable@vger.kernel.org      # 6.5: 5abed58a8bde
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Thanks! I didn't know the qmp_v4_configure_dp_phy() function was used by
v5 or v6, but upon further inspection that seems to be the case. Maybe
that should be renamed to qmp_v456_configure_dp_phy() to match and then
qmp_v456_configure_dp_phy() get inlined into qmp_v4_configure_dp_phy().
Either way:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

