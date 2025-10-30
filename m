Return-Path: <linux-arm-msm+bounces-79695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B130DC20950
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D8584EC08B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8C82620E5;
	Thu, 30 Oct 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k3fHEQr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F65625B1D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761834289; cv=none; b=cRwj5yfXmcIF8eaj0x8KPTBtIYeg/+UwRJ98l58Oa/+VRFZmZB9CH5JmjQ8htSNSOuW9ZlbnSinxltSG20mI3l5d7NtfWx5jLSUJJ9I3rhmWprSEAfd1pMuxs4Fdm8yV/XF+3/rX5IMSk/dhdcxoSdZlXRyoeBfSsgREvczjWYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761834289; c=relaxed/simple;
	bh=hkzBJcLkt8NnJ0Qlv6pX3DEghu4dTrO4pfdOBi9n0Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWmA5CrQ7vm5Sw4kbBfky4vCY5koPd7dL3iBrFRpuMovzWIQa6+ACC5rkUI6oYp5OuGXxwyUFdBtVirIIFvV3SZaqlIBRGUzI0qWdjkpelkeDwKtg7UpawKQgOws7WD6r8TbWHJtM/uFk0zPTFeydeTGJN8eW1cgxd5nJjzkHtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k3fHEQr0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so12793165e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761834286; x=1762439086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c3pjjXRLzxOERlgauXUFdVB9N4SMWOueTsxW5ITuFlc=;
        b=k3fHEQr0VtHQIX0FLmjXIF0Gh6qRQDNgDCqn4CkOoF1kVwGKCcexmLchP+5KcHuFu+
         9a2YexDgn65EPDoE74qvI1Tv7pnOtBW/I9cSW2oiuBYdkTd+5APKOn7jRJs3X2xbhoIg
         5IORsVfA60h0DZj+t8Dr1GqhI79riN5tnBWtGs7keLOwThIjmmwOnjvlOvGwl1pw3MW3
         NbHGZ5FtNC1xz12F4x5Z/cdVKzewlmbZN1iDQkVjkuj53cMmhI7lQRM7lBKbuJdbxP+G
         SYGCk8Th/tTGRNyHuSKNmJfSBFWq6KCA2hoC9vubRIJppjjciv0zbJl0WB2ddjZ7HeLa
         /QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761834286; x=1762439086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3pjjXRLzxOERlgauXUFdVB9N4SMWOueTsxW5ITuFlc=;
        b=dP6gTD+PqAt6LH3phTs2AK2sZTzqti/wnEhheVAumtg5YHA/UOj19aT6pEVszq9sj+
         WjYAHUb+LZmnBwO0ZsithXcOb3F482aTkzQYpss9DY7Y7I99eJR8PJbLKugh+YrQdmCx
         mqZB7K1e0NOAui5CiZ9Y6iLXYFjyuGMZUlnFuS+zwn1YU0l3X7JmN24BLl70FdbGB5K3
         8x15NlpcYwk2drFTEphx/CXBQ3TwvMR2kk+Wa0qDRxtqTTZ9PMqZiycDSxABmuFtjAYh
         HGI7FruTvRJ4aWW4hRSdqrYpEG6c0ocguGd6l1Pc/KiM+h5CAnthWzAat9nKyl5ivYHz
         pH0A==
X-Forwarded-Encrypted: i=1; AJvYcCUhTWVDzuU8R9ZzK6NjsukkuoHBF4DPkxDbpZ6mRt+0M+GFXdxG4l1oznIxZBXsWAiaDM6vUq/qFscS6ttN@vger.kernel.org
X-Gm-Message-State: AOJu0YxrsusHVi9beTQCzs1C2ufu5rEHllz6hw1Pizyqn0M47GiVmWuT
	F7DatH0uAW4B+laXtONvJ5XhnCRrF2IAr5A9fjqbsxbdL2g+VkR5tpmVhp0yXY1pWN0=
X-Gm-Gg: ASbGnctcBJKlYfQXymwqPLxmgZppc3OU73n/chuUQlPih/rIPkzChxJ5yemUyjUI0UR
	ZGZwZzDAEL2cMKMZdH2Ceo8mpyYGtkZVA7qrArv8giGUvYid9Bd16XXbZJokWF+qpFVXiWM2HmF
	WoIb3sl0fMMh7ojyEqPUEg2L5DHNO54Gut5KdwrSf2ayAcZoiGIopDMHs+fK2i1qbVDLHt6IdHy
	/vKRjbDPwUEiUNL6Z5PhpdVFjK6/hyzVRz4IAbLmRNVXTE8+/a6W3kmsPVgMd68eYrebmApsGKZ
	5hG0N/+UcVoPYz+ADkUuSh3Qj7Cxiq7tFym9LzI4DsBvXAj7aILy3c65eC4lGtkEl246eliuFPi
	I0MAHVFns6K+gCVtLkL1kzUhoL3NoBTmwV+/haHEeF1X5bPnrq+5QWGUkr9IWrrVWXiKbmngS
X-Google-Smtp-Source: AGHT+IEvOGorIdXH2ej+0qCIr5+s9oVPz6skbtMVgapGmijQdH6C6LacDuKEfmcYhGhBiKWz2mBTqQ==
X-Received: by 2002:a05:600c:8b8b:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-4772cdf71c0mr14297875e9.18.1761834286434;
        Thu, 30 Oct 2025 07:24:46 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm32493987f8f.6.2025.10.30.07.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:24:45 -0700 (PDT)
Date: Thu, 30 Oct 2025 16:24:43 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite
Message-ID: <v2leqaegp5xtzadcrksxfp5sv5oeeegsakwv6a5w3tj4zxsa5o@uuvn34rjygqg>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
 <20251029-phy-qcom-edp-add-missing-refclk-v4-1-adb7f5c54fe4@linaro.org>
 <bncdkcnbqnlz4rj5yhtgeey5d2ksuwpz7ms7kvkjci3p4gdtt4@e54svrukfobu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bncdkcnbqnlz4rj5yhtgeey5d2ksuwpz7ms7kvkjci3p4gdtt4@e54svrukfobu>

On 25-10-29 11:38:53, Bjorn Andersson wrote:
> On Wed, Oct 29, 2025 at 03:31:30PM +0200, Abel Vesa wrote:
> > On X Elite platform, the eDP PHY uses one more clock called ref.
> > 
> > The current X Elite devices supported upstream work fine without this
> > clock, because the boot firmware leaves this clock enabled. But we should
> > not rely on that. Also, even though this change breaks the ABI, it is
> > needed in order to make the driver disables this clock along with the
> > other ones, for a proper bring-down of the entire PHY.
> > 
> > So attach the this ref clock to the PHY.
> > 
> > Cc: stable@vger.kernel.org # v6.10
> > Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Thanks.

> 
> > ---
> >  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > index eb97181cbb9579893b4ee26a39c3559ad87b2fba..bfc4d75f50ff9e31981fe602478f28320545e52b 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > @@ -37,12 +37,15 @@ properties:
> >        - description: PLL register block
> >  
> >    clocks:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 3
> >  
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: aux
> >        - const: cfg_ahb
> > +      - const: ref
> >  
> >    "#clock-cells":
> >      const: 1
> > @@ -64,6 +67,29 @@ required:
> >    - "#clock-cells"
> >    - "#phy-cells"
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - qcom,x1e80100-dp-phy
> 
> Don't we have the refclk on all the other targets as well?
> I think we should proceed as you propose here, and if this is the case,
> revisit the other targets.

So a quick grep suggests that the msm8996 and sc7280 do have and are provided
by the GCC, but they aren't attached to any consumers.

Will check and try to come back with a different patch for those.

