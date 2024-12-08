Return-Path: <linux-arm-msm+bounces-40931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D009E8720
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 18:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BF2B18854D5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 17:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FC6188915;
	Sun,  8 Dec 2024 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JeFfeIW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285D115D5B7
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 17:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733680023; cv=none; b=KnXWxrZ0BpYOSViNyh15pg/1K7bHzT6lfMshcbiyFIIDEzbXnTzOmS9WXjQMdmi75tOkxtjyYONrGHJwrp4BXQQjv/mhF7Xy9U/f+Km15iehQkRtVtll3tZtSq9IqF5X6ImO35VdvyX/OVsKQ1s5xEBZ6gn3jWbSGqr5AYOU/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733680023; c=relaxed/simple;
	bh=DKRo/Nv0Y8HbOJvLk3acS15e0zEitScFgX15VqdGeyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oo+ejZhwpFDgE3x8ZD58qYjD+SBEELMwdAN5wx4RxkyqDfDPtS0wLamnnurSfukJxrYEinxw7rogJ9wUow54tAzaVPScP+7e7QENdHAnp2YwdgBpL/jj5757EAT8zhd2Tk9rOGrokDPHTZkNZbPoCwlUAfS5/L1V0nZdMPwSo2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JeFfeIW7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df80eeeedso3608284e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 09:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733680019; x=1734284819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KXLchoBaMxB9S9j2NPKIN0e4atGZZxZFtq8qcdJcxUU=;
        b=JeFfeIW7Nz46QeXQlwHi6c/Z00OpFPpw4t2As1GsLAM8O6z1WQJ1xYp/Oqj9ZHpjbA
         ur9o23E3PFTT7TzunfwTse+2iSR8RPy0uMDwAJfitGHauqI5pxatOQY1lCCfh73QSUiu
         AUN+wJHkD2Iy+cizPS6bzwJFcUuQreNPjQwqKoGjgnxEGz5t4OSrINFiFshEWOoNBmIF
         puI1P/XtEFgZrsivo3Uf0VcXQOzVuPC5/ilCoBVwHv/ie1VP7yaLLm/F96wYaQ+CEY1S
         6UIPQyVY7wq4FiSymcHnNEorQlz88Cp6PxS7GsuK2GqR/XdBjFNXlfZEEyiUce5FeXr6
         DU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733680019; x=1734284819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXLchoBaMxB9S9j2NPKIN0e4atGZZxZFtq8qcdJcxUU=;
        b=JIJFxKZJggWKgcYEY7aikppNzV1lA3Meje4ntoxZ43Jn1dE9I0AFdV6H/TaxvpvdjN
         eov5QU1eqzhkrtvTlUGo2sGdXjdVub93TsktZYf3dXA4xaDQ2yBC7O7qzn4YLrbDTpOa
         A/KA5dQwoLoCskfHlPkL/0ACXL+d/DPXMBcGjWHsuOGKcvg29jvXwmn7urRYb9azT/3O
         hoLr5iPaZOfxmxyL7JiCTWGIkNB8l6m5vZO5KUv/0QvIgb9LvvNzHh9Ue5vy9/M07u3T
         HSryz1VxMoY5tuASMjGki2jPHMmDBxEYStrTxCZIsZiyXnZ3IlCo/NBzJFcg2lLFC3m0
         SIPA==
X-Forwarded-Encrypted: i=1; AJvYcCW8SwFgXNX1EyqDSc3IFDrSB0EcPVNA/9364emmnMWYlH+XYyLO3AUe/imbfwzXFflW2MnqyrQnITx3Ek4f@vger.kernel.org
X-Gm-Message-State: AOJu0YyfjX8Yhuc45H8FxpsiDb/iBjmzryCG/vtdB0n/kNh4GKJ4h3hY
	IT4TuoGoK50aN4MvGCYeQoALh9IQ/uURsMYfabPfEHFc+R0ZB9Q/zOQJp4nS+oY=
X-Gm-Gg: ASbGnctefmjMc1y3hRkAJz3xpzdirwMxgm1P3VK+yPK7tbU9oVXVmoLhZTusHch/87m
	DS/fkm21FVuGQHQYUjj0QZWZ+fqYLGViT0y7RIIFZMVs5O/dRY7ea6eEekRQ3M+7ceju5vqVcm7
	VAuQz8iTunx1tOQ9KNbvTJ0h/nJ56siTSfMPqeN27WNM35GUNNRQRLv4s6dkokeXvPxsp3L5nkm
	24zqhckbnut+jpg339pozbAIh72iphnOKJv8eBJLEFQigxyewkqJ6zzsdQBI00ZwPYMUVLzWt9r
	tXgeHsKVsP6owvkXjefJ8YceHZ858Q==
X-Google-Smtp-Source: AGHT+IHKwzZsrTkeCVLClrojGrlSuHRyQuLTzbAD6SRgqOJefWQsJjXNC7HllTA/XNvZyQZu69EI6g==
X-Received: by 2002:a05:6512:3e09:b0:53e:39ed:85e6 with SMTP id 2adb3069b0e04-53e39ed86b0mr2161676e87.32.1733680019099;
        Sun, 08 Dec 2024 09:46:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53f93369b98sm433326e87.280.2024.12.08.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 09:46:57 -0800 (PST)
Date: Sun, 8 Dec 2024 19:46:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 0/5] arm64: qcom: Add support for QCS9075 boards
Message-ID: <cpxuqo5luqqk6wtk2d3wqsbchq4awrmna4xoye3klatrzu4j54@axbgklv6kdqs>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <7f52e0d2-0934-49ca-9c7d-4ba88460096a@kernel.org>
 <Z1LVYelWl3sPPHcD@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1LVYelWl3sPPHcD@hu-wasimn-hyd.qualcomm.com>

On Fri, Dec 06, 2024 at 04:13:45PM +0530, Wasim Nazir wrote:
> On Wed, Nov 20, 2024 at 05:41:39PM +0100, Krzysztof Kozlowski wrote:
> > On 19/11/2024 18:49, Wasim Nazir wrote:
> > > This series:
> > > 
> > > Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> > > 
> > > QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> > How does it relate to qcs9100? Why this is not compatible with the
> > other? It looks like you duplicate here a lot without trying to make
> > these built on top of each other.
> > 
> 
> QCS9075 is non-safe while QCS9100 is safe.
> Reference: https://docs.qualcomm.com/bundle/publicresource/87-83840-1_REV_A_Qualcomm_IQ9_Series_Product_Brief.pdf
> 
> Separate board files are needed as thermal mitigation changes are
> required for non-safe variant only.

To reduce possible questions, please include those in the initial
submission.

-- 
With best wishes
Dmitry

