Return-Path: <linux-arm-msm+bounces-33657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5873996449
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D038B21E1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F4C188012;
	Wed,  9 Oct 2024 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvV6fD5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A23BB48
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728464374; cv=none; b=aZg1+b6bQ8bSwLFaGvm4qhynqCmnqaU8zsE08nsoXTGpduksro70iL9x77CRUJeogcsMrdIi4upMo5Gm4+kFb6MCCAOLB8/4gF/ertUAgx2xixA30lb2fkdt7ejAr+uEBIolC4obD42eRdKJeWsTtXfEg22y79a32vl89oZjHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728464374; c=relaxed/simple;
	bh=Fg1XN0GxX/Kla6xLUfQtPJ1bcuD9q+/DrBFKS3emMBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4GYdaNuGr+f3TPEdKKaXnkTRAR4xLT8w10v1FXAzeH1yMDbdMK+hsa/vG6bvkWPR3+rH7wZwAgcBIlYoj/F3fThxATXQ0hVVgkHAb/kbB7SNBMsbqvuZ+rrVBItdgnG8ge7HtMCVLsHXrfRyQzECRiQ4pdY0CgrupEMHq+2Ks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvV6fD5P; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a994cd82a3bso489635266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728464371; x=1729069171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg1XN0GxX/Kla6xLUfQtPJ1bcuD9q+/DrBFKS3emMBo=;
        b=yvV6fD5Pclo4YZcxjNTCiwPPq34ltVo2CVS6XTqcJKS7mlf08jwAbEJomL54khjZuG
         +wx5LktCotmHyagNSpXm39ySsMFPulyHaXefiO0NYwCPdmRxuS5dAMLWYc1Eeour6DPH
         pTanHAVh90SUGR3QE81IJWt03cpZOXTw9tPAp/xL58KN+mY5kqt9dwXNtrX8rwjgOdXp
         kksq3GxoTfMHqsQQhR4YFABvF7FDz1veAsIz+VzbUrHgem0GY9SrbUGRShngssdVbLI8
         L2Eyvl1pCCpD6Dht0LNPcDIa4vubwL/E48Xrt2DdWNe4wFejbeD9AmSipV4E/FJm5C+f
         3guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728464371; x=1729069171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg1XN0GxX/Kla6xLUfQtPJ1bcuD9q+/DrBFKS3emMBo=;
        b=Avp08lwWkebeZi68RPN8pU4tH0VhS+NFsPIseE6UR0/fAEXsl8EC7xrRgbjGwKd2HX
         +BNL1dJK6Yx3XOIifz/Y90LRFJ/Lz0UAzJGJGDCFYXbpm8alIzp7CxH96wnlCv32wRni
         zEp4W+H45cfg429U1PcxBh2XD2ebHuz5nT9Gl0nfJohoD39d4WFOgBM71R4tvXKdeb8T
         GzV4FLJ+XKN4RHainOVphnE6DckYMrwR4CX4nfdPmQ4ui+PxicHIc1Y4KOPDhZywXnY+
         OUQknMrcjBXjoPY9QyHVVtJ4pk6GB5/HhVrXZx6NshXP2n4Az3KU6gp+3MdrpR4EuilD
         fEnA==
X-Forwarded-Encrypted: i=1; AJvYcCUUIwKCL64KI65NXoRx0emI+XwaY2W0a86QM8buJ5Mh2qbjwXYJG0p+U7BWvYwaP//e1qwoiw2UI7tw3RaM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xupSDQX5Q+qJfc47x3H2hOtg6/O/KIyFrmCkbF/E8yeg4bcn
	UGqOanki1VkqY1ZANCiPKJsMOaF//0spK7HGGy+ofr5EWrTBgbzrpFkn1SL9OdQ1KdDW5jsKK90
	ytMCTdXizrbsmxxK6SBCDv+xDODXUqQhuOVJkIQ==
X-Google-Smtp-Source: AGHT+IF5e5okLD8RYMY+0AoiICHKx1edgmljuMThgQAgpMLA2oJJxnHHHurgh1/t1QXhU0PNT2KsnIunoqJl2lcEQHc=
X-Received: by 2002:a17:907:96a7:b0:a99:4ebb:a400 with SMTP id
 a640c23a62f3a-a998d1b32c7mr166641966b.26.1728464370570; Wed, 09 Oct 2024
 01:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
 <20241003211139.9296-4-alex.vinarskis@gmail.com> <CAEvtbuv1OUekj5=fzafJKby6jBiZ6BzgT4TrrihDNdiQQM_vQQ@mail.gmail.com>
 <CAMcHhXoRgBS5q=70=nj72_dH3R2eHf3bPt=ZxjsUQEV5FZxvsQ@mail.gmail.com>
In-Reply-To: <CAMcHhXoRgBS5q=70=nj72_dH3R2eHf3bPt=ZxjsUQEV5FZxvsQ@mail.gmail.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Wed, 9 Oct 2024 10:59:20 +0200
Message-ID: <CAEvtbuuW6ynBQjZce28X3qZ8EYaCKYM2nH9212GGA7hMxyk8ig@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, robdclark@gmail.com, 
	peterdekraker@umito.nl, Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

On Wed, 9 Oct 2024 at 10:55, Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Thanks for taking your time to test this.
> For the record, which variant did you test it on (low res
> IPS/OLED/high res IPS)?

OLED

regards
Stefan Schmidt

