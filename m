Return-Path: <linux-arm-msm+bounces-49177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35896A421AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 216AA165524
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53CC59B71;
	Mon, 24 Feb 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2CNkdl/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF432571DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404574; cv=none; b=Q5r+8FJLRbonVMxjLKMLI5ziFLAPQQX3QKmNLftiYcsmyy60j8MRy/BzJ96VML3SGlP43jXQzW9IofVamhkN+INXEdteVPgggN/8TP/YpV5s0YfxqWk8JB9DtsreVmkYjooRlZ/MD649+usVCiSzyCUcUXS97WfZqE8YYVZLF38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404574; c=relaxed/simple;
	bh=5mhBn5JOZq/Sr6VtMa/3D4upNLR32dDMAVUAlYfycnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FymLG+fNeq0EU0iZwb9FUBQEhNbosKpulXE4/DBGRaAsxpfviPavcVKJleBR5aJEsrVweNeW/t8imJP+UbFSPEP8gxwFi8eDA3p61k6+zfQ1BqTJUAFSES1nQg3W/Fmq99eqJfSQ9plbjWumhCecSg9YTqj+4NOD1uIKXC/53hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2CNkdl/; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30615661f98so42459091fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 05:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740404570; x=1741009370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7IyqSXfcAB07mb16t4JzcS21JNbeSpMHrVwyOTk5Cs=;
        b=V2CNkdl/JDPnhDZQ8jGtzdi8enIFoqaC5Jrlcj3awSqFVzAYaMROtONmV5o+sH+GHw
         mSIjYw01nDxCeRy/LHf0CJBZBkpMPqqL27DqAmwlxCkkU4NATIc62F+UMnAH3giisNPo
         1yhs/r/V5qg8hTvFovRBmDNdYqpy496IMP+9wRI2uhXwnVb6UqSetqBQXv77fBvD0VCI
         g7YPDKggblcOXM+B1Oau0+SqIcuscffqHk5GtCN9SK8+/gW+vWWQngRPXRDGG/fG6aUb
         l0lN7iuo9AQNqcvwSPzMy0QgP0e1elnS8PJvn4x5NANSNuhnLA0eSP79ixtksgNw30S9
         vGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740404570; x=1741009370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7IyqSXfcAB07mb16t4JzcS21JNbeSpMHrVwyOTk5Cs=;
        b=EVIUt7uVgYuTWdn1Lb27PwPC7r8h1UPV1/MKXJtj4kq7ejN1mRbGWYGKv0+iJoehGU
         O2xCeioVCqfJghYTIinmjwYo8bS0VNJ8IWvMad1OTXa1qxtx3anBTF2qWS/oQ7gi3hx5
         Nud2QqJ/AcFsI3Vql4pdzcTSh4XCDU7OhgkorN1SuMvv0Q3qzOGe7gho/junzoBgLWho
         gvc7c4aC0zdFbldBLzwWPDK4Xom2EDyayJFWDHX6e8ZYlV5P1I1alOjrRYLDae03X9sS
         MLX0ifVx1lJzu/BT44jjgvfAiDqAcl07LCYy4UEoXPHk1lkiGQ+7CZyw/0Onj6Vgn9SR
         RE+w==
X-Forwarded-Encrypted: i=1; AJvYcCXmIux36b6SzkL+uyws2GNY8mV22/iBs9XRk8H0KOYro8et+n28UDiOGsNyT8nK0r4oqrXDBRq8GCGWI/sn@vger.kernel.org
X-Gm-Message-State: AOJu0YwPSGsMrDrb7bZejkD3ivhk2nNjkjTtvUgxX5/HBwyIVYb8ah92
	jfetf1NtJu1iTUA76bgOpATCOidRW+YykJWWW0tj7Jd41r3qnn2HJI1k3hWy8F4=
X-Gm-Gg: ASbGncu+71bZ/2Nk50M9hqSI3tRVLfv4rkXBIMNlWQZ+/bC1/GpImdTWesuGaA5+XbX
	lvYpZEkigAi4vuuagsGoIMXNoXzcjVaH52OSmC5nCFFUlT6DuIx4Ivt4I1pVMlUR0TLc+4v3huv
	EUNPcuJ/UZxexlaBeghWwEDVSPzPDGbkUrz4Py3/H3N1nwDsADbQwAqiVLel6O0yAXhnOh2t64H
	Hy+mazhflSKybwz+Lw16lJ2le1hICPMHPovDccPF1lCBpybUp8yzPbTo3760ehuAeJwlgY9Wjb2
	KOdeitKk5rUSsbFaUUlNISjCiRCbdWdIk+O8SW0dPegQE9qVcXMAxXig/DlEGZ7hDtEW1Vx4zSI
	/aagtew==
X-Google-Smtp-Source: AGHT+IE48juDZvdR8qHX9mBe7zZT7U1to+JJITpRs1tHbAe0HEtUtfoc3mNnWKiU+vjpJzPigmS6FQ==
X-Received: by 2002:a2e:9f4f:0:b0:302:1c90:58de with SMTP id 38308e7fff4ca-30a59993eb2mr42883071fa.33.1740404570264;
        Mon, 24 Feb 2025 05:42:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b75esm36566981fa.103.2025.02.24.05.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:42:49 -0800 (PST)
Date: Mon, 24 Feb 2025 15:42:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: George Moussalem <george.moussalem@outlook.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	amitk@kernel.org, thara.gopinath@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	quic_srichara@quicinc.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: nvmem: Add compatible for IPQ5018
Message-ID: <zygiknq3pldkcdonekzamn2uprnjyc5dip57i75p7uahftekxr@2lqgo3wa6zhf>
References: <20250224061224.3342-1-george.moussalem@outlook.com>
 <DS7PR19MB8883591F0D2E21E62025D2D69DC02@DS7PR19MB8883.namprd19.prod.outlook.com>
 <2fcb52a3-7ef2-465f-b460-2f7b565a188e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fcb52a3-7ef2-465f-b460-2f7b565a188e@kernel.org>

On Mon, Feb 24, 2025 at 10:19:35AM +0100, Krzysztof Kozlowski wrote:
> On 24/02/2025 07:12, George Moussalem wrote:
> > From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > 
> > Document the QFPROM block found on IPQ5018
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> > Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> You can send the patches to yourself and see whether they are properly
> threaded.

I don't think outlook world understands the concept of threading.

-- 
With best wishes
Dmitry

