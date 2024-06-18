Return-Path: <linux-arm-msm+bounces-23158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3833990E049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 01:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBD61C23117
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 23:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5BD1849EC;
	Tue, 18 Jun 2024 23:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDkePBQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4A179956
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 23:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755092; cv=none; b=qfDFbKKEtfhhV88CJBElmvM+QLeWiiqBQfwISVObr3gtJuDGbS4rWm2gWW8FRYM9nEJpeDKmFnxsJrcUfxZg3WhvljCwKlecKpbUppcfNxX3oJR3daSYEitxAuENPZxM5TmPdaIR9leMb6f95sqaD/8/Fvynd+xB/Jy5UWDGack=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755092; c=relaxed/simple;
	bh=Av3TTsyP97Equ1dgYMgOqRCJJMpER4XsO+kGCyXEsLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YB3U7oVtC8wy7N4bPQgvSwjGLknvi/iW+UxNdFX46cXSFJmF36OyEG5k3FguiSx6mE+lp+dVqEHirSlpvdZuMZyRqgNnwd9m993lMWmPHZfAaAcUa7SgIF+o8oEVdsTls/OBB8I3YtMM5IeY9IUanGCp45sQEUUrriaQL9QjANo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDkePBQJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso4764174f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 16:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718755089; x=1719359889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1xf5EqnHZTHgrB035+MoUK5o/+Iy37BFkV8U6lWAsI=;
        b=bDkePBQJb3YBj2V1K7quFxkU1gEXaBPeteG8Lpu5stsU3xvWx1OedEQCgMWfVTo2fR
         Yd3Xk3YJKIHeH+HS/I+m75RA9Te3SxOHjjksHXmGaTdJr/uL6fc4XrYDMbisXxWXHRlQ
         H3iKixNOGGJRQfPn/bxWNl+wnUpMZwG6hbnOi3d7gR4eA73VotTxjrx4b08mjyxYakCo
         Mzw5tftvREx1y6V3t+xoEXslCEqk3KZihexvr7iMKQ+YPjvAOfjjYroZ5MfWdvFD+0L4
         xPyQAvT3bNDGTHdgXovc02ULIzvBelWG4glsIDOlXLXDnf26D2+VcZT0+zko8ChyrEQZ
         PSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718755089; x=1719359889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1xf5EqnHZTHgrB035+MoUK5o/+Iy37BFkV8U6lWAsI=;
        b=Mq1pYiY9lJGRlg+Lb/9wisg8qkWrqz6lqSilEaD+Jv4lOLVJocubMHSy3RoCQhiVyY
         +bBo6z4BqdvAHItmyxPMWTY5Sl18GDqrChuXC1DVBREAROuVgfMwK9F1xQhJRocMrglx
         bdfUwQsd8m/TP6pqtfqxDsfjJxcQEB7lxn9llgYaCvwOU+cFokqShp4BfrUI29l80vy0
         Yd3trUhgbsH+c9LLYwWLRIXuPqqteY62QlLU16RSYnoPbcHn6V0LPPkiYtr6LgwYgNax
         HpqDTocdxQJFEseExxqYekgKJzy4bKkMeF/rKnnpteJ/TueeYzwUy8vb/wOZUEOJxKOM
         8pNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu/hIY/R5Wats7qOOBpNeM/n7kUtRFJBIwud+8QJbyPHjTFQq5wsE7QmsWOuzaSiNGMvRJb4wlPBsI/gFyR1/XvJWDZ8Cvc2NuM3/S5g==
X-Gm-Message-State: AOJu0Yzejgh3T8auVzhNEu9X4MeaVrhB8pXX55sAz5NwVlqqXf2C1xoM
	NiqeDJzKLzUlqV/uEDLMWmeKA8xuT81jiW5Kcgt9+cJKxLUhjbVrQDwSJxk9a04=
X-Google-Smtp-Source: AGHT+IH3SthiBieRBagQGvya+fCbppYDWVdvuwD+iWbpivS/w5xvmwg3ky2tSRJqs4Shme1sR5VGBA==
X-Received: by 2002:adf:ef48:0:b0:362:172a:b156 with SMTP id ffacd0b85a97d-363177a1d38mr821091f8f.28.1718755088764;
        Tue, 18 Jun 2024 16:58:08 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:6f30:7340:4e06:bff7? ([2a00:f41:9028:9df3:6f30:7340:4e06:bff7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-362e3e1abd5sm1438994f8f.47.2024.06.18.16.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 16:58:08 -0700 (PDT)
Message-ID: <106cd2a2-42de-41ec-8d2b-f4cd6ff9165c@linaro.org>
Date: Wed, 19 Jun 2024 01:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/9] Add support for Core Power Reduction v3, v4 and
 Hardened
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <nks@flawful.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Robert Marko <robimarko@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org>
 <ZmlUElvlOPBdfn61@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZmlUElvlOPBdfn61@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 09:53, Varadarajan Narayanan wrote:
> Konrad,
> 
>> Changes in v14:
>> - Rebase
>> - Drop cpufreq probing block (merged)
>> - Pick up tags
>> - Drop quotes from CPR3 bindings $id:
>> - Drop useless description: under compatible:
>> - Link to v13: https://lore.kernel.org/r/20230217-topic-cpr3h-v13-0-d01cff1c54cf@linaro.org
> 
> This patch series is needed for IPQ9574 CPR support. Do you plan
> to post a new version or can I try to address the comments and
> post a new version?

I'll resubmit it soon

Konrad

