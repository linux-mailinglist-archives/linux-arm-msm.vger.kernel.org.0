Return-Path: <linux-arm-msm+bounces-41557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2849ED710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C8D51887CAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 20:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93A8200BBB;
	Wed, 11 Dec 2024 20:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FATNfFS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C81D6DA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733947960; cv=none; b=GL1alhWOn9HXmMpX6RcPrqBDitTf1MrAHxqBerQp2vhAVqn9soAD2VvdIbzcMpefldMmp8fzzLUljnxcnxI0LzcAeLntAIlu16qWQUnomxnleDiXbRHTMmSsAwO3zdlIiuI3CPfNiX1HYETTBGLuJjjhsbJVzc3XXL+MYfRGyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733947960; c=relaxed/simple;
	bh=/fVcvfI/nJgq0KL9QHFEEc3B//jpEClgu6sMbVc2hJE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ij/OydOoOz4khqG0+CIEks2lxwX2mS+/LseV1yN0rBtqbiMBRZr9PwCXBWen+xbkexxJj024Nr81pIgx+zEAi/m+ewF6b7HdvaHQHu2lO70T0YrHnuOKDHphqOwSQDQvBSStj/jptGerp/fEMrWFX2w33F9NoyJKq/5Lv+1kk30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FATNfFS1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38637614567so2252605f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733947957; x=1734552757; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPN2+AhDq4P0SWNYP6pOLiBUFHEUMd0r1OKMpQRaBeY=;
        b=FATNfFS18kvqaKIJKr/FAXZZq8pJ/DSe7M5/JRLICn/BMsu08fL3+FZjtQ8m4JgnMf
         opTGKwMkj/aDAc5KoTV90802yFTRaaKVvfbnhqPtKXQcL5MgSBA0K4cNb08RJlVWMur9
         Bo8EH0L1D0ez1LbfxXYS3zE78TJPNRw/CE5xVP/OvqtBTk4l2iHy0Qhmj2wGGnY1Jt9T
         kMa9GWTIFfpM9YOnu4B5+7EbpePIh5tJ9DDb35Zes1aVxb4i4T0t3tQ51N1LKWXNMHi2
         CKdhHQUxhz35Vckk+VlLIMgNUiQKrHd4oHbwGxjgBmYanNhAwg0skyxrGtZEWHBrVCe2
         QhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733947957; x=1734552757;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPN2+AhDq4P0SWNYP6pOLiBUFHEUMd0r1OKMpQRaBeY=;
        b=NGZUsRLKTNiSFODy8GqGkCDACeVeUhcTjcnXOwUsFJtSOzoDP8jcjBf0pjX1NhKD4K
         ja3SyDeofwYDLD9xqatYJFFJdRWUwf+C7BFPpvdPh00LONl2tDCdk3BOSdy0fNzcH944
         Z+Z+QJKUjO7Ri7bh20QTiYqMtXfVgoSutZves/OPeLb456dmyZuQGW+aRlVd3SHrdgke
         hzWpuNXPZeTbnGraIgnawggeKDXR7FM/jczTqWyNxLKjyrnvMgn4gLegmN9u0Xsrlpv+
         DUYQm7HcFW5+MTkkWx4wOlYYxl+IUwZP1uX3XmoWYW54vlJ2Pecxz+9Zfy0ByR17Oibz
         Oq/A==
X-Forwarded-Encrypted: i=1; AJvYcCWMy8DWv3a3rUQpX3op9FXBr/jeo/6eSNG4e5SpCSLvKTbdLARk6f+QJoQ5GQnklQSpRenxmAbkl7j2InSZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxip4t8YwAicIAhVIHhktvJ+OBXWaWHLyzjD8JVOSEO+Tg2UM9E
	5CDjRq8N+pFxQQ9GppPOAb64DN0BMbURlXFOOkOkxie77TphqZ5nGspcKCeNLjM=
X-Gm-Gg: ASbGncvmVRY/BYUvpGqAJ7nkeVU1SGVdJ6/HfX3edUnG0Wt4lKlhiWnW7JdWWgElvjF
	fFSuwmOKf9t+bB/+lDTXAr3XbTwgY1x2Xjqa9cKmlcRAgANkYrLVaEOhopxpILzhNKErlt6v2Di
	kYI9dMTaV2xLVnyagt6VcFLQm8S10NLmhH5KfrfyiB5In4GshkqrR2x9D2K13OxUxPtM+6juce3
	08aqb5HGPeR+3YFaOzcWUPOQQtmSuzU8nA1t3aWV0vviQJMVP3J8VfG
X-Google-Smtp-Source: AGHT+IGhKdHf66Trsg0Xay3Wa/RqDWr8rS+2Oi6F9OIapryWlc50G8eqxXs0nor3X97sj8+KlZI9gA==
X-Received: by 2002:a5d:5984:0:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-3864cea45bbmr3619738f8f.30.1733947957412;
        Wed, 11 Dec 2024 12:12:37 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ee54736sm23968785e9.41.2024.12.11.12.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 12:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 20:12:36 +0000
Message-Id: <D69592H3JKB6.21HDMPXX9Q6OF@linaro.org>
Cc: <broonie@kernel.org>, <konradybcio@kernel.org>,
 <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
 <perex@perex.cz>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 05/10] dt-bindings: arm: qcom-soc: extend pattern
 matching for QRB4210/QRB2210 SoCs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-6-alexey.klimov@linaro.org>
 <ghlkqehfs5sagxrcvyywixfkt6ie3pwwtqm2j3n3c3xytjl3sb@d435kwmo3nki>
In-Reply-To: <ghlkqehfs5sagxrcvyywixfkt6ie3pwwtqm2j3n3c3xytjl3sb@d435kwmo3nki>

On Fri Nov 1, 2024 at 7:54 AM GMT, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:49AM +0000, Alexey Klimov wrote:
> > Add missing QRB platform name to the pattern matching Qualcomm compatib=
les.
> >=20
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Since I am not going to use "qrb" in this patches, should I resend
it as a separate patch? Because we have platforms qrb4210 and etc.?


