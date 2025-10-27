Return-Path: <linux-arm-msm+bounces-78970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B8C0ED44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF4733A34BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466DD2798E5;
	Mon, 27 Oct 2025 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HosMZAWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB15824BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577429; cv=none; b=cM9aZUwoe6Qe/ap01zrjjXENs6X321ijc0oI8E19diGTZRJRvw9KRD9fhyjw2SGzJ3czL/h20MPK4eyk+69Vtkaz/PRTIa+V8yweoXaG6kmSyEswEWyMzkYLrdEg7zmMgJhwIyCr6eBC1ZlZS6KDvcAvvpU03WHO2GC7E4ZUsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577429; c=relaxed/simple;
	bh=FR8f0o9ghG0deDpmoGKVQY2Rna2kf/qaf+nd7kZylfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdWDgJmmciwOMadIBZWQ1tjg9PGelcgOjkWrKgMxwLkPkIjvqp0N1qc8LTHv2BLFZTg99nvap4ralHrJkwJ7HZhxhvqskjkMg52hQcmneu4lUxK/4abTOdzIDRV7eEFMvJMHr+EAcixpMOdstLeufHh/ntU5N40IspqVmw873ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HosMZAWT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47710acf715so6750725e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761577426; x=1762182226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UKpkOIXxwDv4N6ETMPC6x38UtxY2L9u2nMKcGEac270=;
        b=HosMZAWTnBI5fHKAvY7Zzfa/ysWPhbKKwFzKnL8A76vumBaTbIM9wc4glGVaDuYuRF
         7aTqQeZea9vtgJ+T6nTuENckZg8hlj6HayU/xA3D+/PZSXVYzdakiaHq4kMf0ajobAN1
         NHJuddPTdwdMz0Yu3+HUpigjGKYhNfbq3PtqweXETPIKxAIFWjxrVAB8BE4JFC0iMne3
         XouzqXEqsBKSHEehL0GSx8RAQKR+Kxqzb/XqnwE6KJvRgj/Rihk3dO223rHs+/0cIw80
         AShFXr2HvQKiMeDVoDDWraj2IBBx2gnBBLBmq9avHEkuEfp5j4x/cUGWrh0sbRNb3mvj
         JAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577426; x=1762182226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKpkOIXxwDv4N6ETMPC6x38UtxY2L9u2nMKcGEac270=;
        b=ORtrIsowz3tSVNi1bn51k25mEA3cIpB0BaRl+nHRPr6+pus20aZIuyUbPES3aMBEZv
         GjZAG7PlbeqN0AXPBy+68jBEEnGprKXDXkkmJO22m2jtt+YecrITAYdudmu7QKg2OfkW
         ZXERJi0i9d4KYcyvKhaQhZygcJP/hBvrVOlL5+aA0za891DHz4ClvrcSJW+j8Op70kOj
         1AurtPSBHiRryhdwB/75Z3Fpdo5W68xwrOQknib/OIOx0xIFLVwIdyFoqgrt5yfs6002
         s4+/fUQkOes86VmdN4lr4cvkdyLs8fBfdx9WXsgLhVxloS97WBTnn+4C6esTpyK4BXob
         6kSw==
X-Forwarded-Encrypted: i=1; AJvYcCWkflpj4suszEpAbtST6cbEXyJElAnTi7CWYi+4dH+Nz1Od9lWjhey93ZHAUu5h7QgwKYuBTm5mjuusiQDA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb5r/fDjCXkJZf5jDOgNuge2nyt3dDJQ74nL9ijbj9fvcU5WvR
	PCu9VDsxVx71/YvFQaHKhQmxX8UXQ2EyaDGPPjd3rDPbPvfUWPE3fE2AaYjBW9r+eho=
X-Gm-Gg: ASbGncsNJwtCg90Iodsvv0mr5gXACDlVqzeUlxV2wvGXhog2xFK5VIwHuXjUglQxtdl
	+MQnx+LJAuf5k/rPCXGDzUahPXya5ISZoX0kR7ITdZoZS/8oosNjJv8ffsySYwX7PGcCRm48Edd
	wLNcew+ZrsVubGGfMA8TKChOsPQqoeGp7HqZFa9T3nbhkd6pEwUccwNeZ36qWWjShiJhtgfDeew
	H5IWzPBgScOXS/rMihnH3oj/Z+pHlyfsB9AwrCCqbiVRYtnx8aGYbuTTd+WsU3Rf8qhdTdAdYJK
	a/v3VQInky7bHLincPj6FzSpBGBOJvjU73M1uHCflmqG1+bb/pOeayoGRcrrB4oyQeMAsU/e+H4
	0lLm6el0BqzIG9ZriKJFjXEWr3BLUTBwV9PzwCUOvC42npeBH11Hx5IDrDrOIq9U6xM+XVkSw
X-Google-Smtp-Source: AGHT+IGdgZKKc8tkom/y4GwEbztmjQrk8NHF1ywqGi+zVO4NSb3Xu2bsylUy9DS3LDmgv6YYp+masg==
X-Received: by 2002:a05:600c:1da7:b0:46e:4be1:a423 with SMTP id 5b1f17b1804b1-4711786d630mr260978135e9.1.1761577425808;
        Mon, 27 Oct 2025 08:03:45 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475ddccaaf5sm68399545e9.3.2025.10.27.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:03:45 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:03:43 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>

On 25-10-27 14:29:01, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > Describe the Universal Bandwidth Compression (UBWC) configuration
> > for the new Glymur platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> 
> Bjorn, do you indent to pick up this patch on your own or would you ack
> merging it through the drm/msm tree?
> 

Please note that v3 is out:
https://lore.kernel.org/r/20251027-glymur-display-v3-0-aa13055818ac@linaro.org

