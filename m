Return-Path: <linux-arm-msm+bounces-30516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3F969CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2591F24D45
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDD51C987E;
	Tue,  3 Sep 2024 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gp9vvm+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0221C9862
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725365001; cv=none; b=ZbIJWiXT2GnEUunjAZTZEShQgWPS9wy04YNSP6hKMpHKfsxAz9p4u8uk3+1yxnxEKSDOCv8sTAzX9CN1K80hHFxUsMEnyaOWQyidaN2b+d8Ag3mGmiIW63gWzHCyN164fn8oT0ZTkAEQNwP5kRa7Jk+Z8XmtX2gG+y8PndHvzBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725365001; c=relaxed/simple;
	bh=kEy0uL+fD2lKj3iUlgQ27J8z/bCXyx9tdiqTWqPKOBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1U4hGChg2fmRH/h1iUEaw6LXLliTujzXThxfjU1zXY6/vm6GtJDMdGiD4LE98k9xDKHYxyHQSOdt3x+mYXzaVi4fY5IeD7P8c5de5YN2G+Aoqqmj7cZll5gLOCtvx4e29Lkngksh4HU2QlZqzQ7pbn/I80daFoR3VCz6zqhOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gp9vvm+C; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6daf46ee332so6029357b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 05:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725364999; x=1725969799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uT/aD2fYaRoviJnEdnc8G+3b8uWSX+p8TECg/DCp5mo=;
        b=gp9vvm+C1jByzbT/wWT7AOvC50nptTMcmhxYhhhMKcqLUevaeqnTxDw0q2ACVCXp27
         +TIQB8Jclw1WEKuEQNqJs0wdJ6KVqe2LQJSK23fr41dTVAgmU9n6YrDWhHZO1OyV+GRd
         28TXKZtpwiP8JNkAiAeqsevQP+/4qwZqjb7V0VInQZSNlvwsLR0CkbekH7DfDM438DSS
         3zpv8eQCBXbPuTBj5DZMN7LYHBh5Wk/VCNJfxjc/QMNEZSQqQ7jEb7JqnD2SO3SMfm/w
         oqDQoLlPrRpIpVFjxiKbr8Zzk3LEnuACv8BjUN4FIz5a0T80vqTZnzhqPPpUaux2uiIp
         2aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364999; x=1725969799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uT/aD2fYaRoviJnEdnc8G+3b8uWSX+p8TECg/DCp5mo=;
        b=JtoKRzjLfG/yRDHeNPo+zraA5paHAM6S2z91BHO17HIhjFXDk3wVtFy6LU7B2jIj0b
         ok+uFugq4natMbY2dvzdMxfxvgr/4+vnGEBbaupNYsJblKKRrNFeLbOBiGwpH26XkDsx
         NZ5QNm7IgEWbSs7jl/xaa2XxOnflLawYeIOGNn4rLN9XGV+YTGJMg1VRP1h9D9xtHNLj
         iTyMyZIShpbcaLFnCtiQym95zxrBJocsck6PEjrGu+wniRejk0Wuphim2BhtNsiRTNk/
         SI574SYcv2fw5l8wUC2FXY+jyzsbSAFsCoZ/OjLVaT7/3ve4dxRzzPaDcbcs9Mc9kop4
         Kxiw==
X-Forwarded-Encrypted: i=1; AJvYcCWEbRb6N201jswrkPo6GyyG40gPIZPuRlxwjMYfybJ7n0GKgDPTTP/iiNb+sx5ckB6go/pnoBhPVzWXtRzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhInhCpWEb49E5yLlxwodWkU7uJbXtuZQbuLVWYywTu1nb1y0h
	KgbtFa23rsL+tTP+738uqnVwegH4PnBY830bBzaMKTXqKO1Gj9ygMX5QVaOfLI0yvBKAku23I8i
	+qVCEtv4wLcz0LXq+q/ziWXXmgDKt/uc8drCYaQ==
X-Google-Smtp-Source: AGHT+IGjLf7ldseShYpxexhc7HH680FQerWRfT+m5UtLRaHJVdDS5HYSjtVrk09unMIBtJDDtIBsKWubTRG962bdoF0=
X-Received: by 2002:a05:690c:2a83:b0:6d4:d6de:3de4 with SMTP id
 00721157ae682-6d4d6de4266mr91396297b3.34.1725364998931; Tue, 03 Sep 2024
 05:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903-topic-qmp_typo-v1-1-781e81799992@quicinc.com>
In-Reply-To: <20240903-topic-qmp_typo-v1-1-781e81799992@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 15:03:07 +0300
Message-ID: <CAA8EJpp_O4B+eciQ9h8nPdiVxy4CTD8nE+WiYbDmUUSuhvwvMg@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp: Fix lecacy-legacy typo
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>, Konrad Dybcio <quic_kdybcio@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Sept 2024 at 14:13, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>
> Introduced in Commit b3982f2144e1 ("phy: qcom-qmp-combo: restructure
> PHY creation"). No functional changes.
>
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

