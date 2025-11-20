Return-Path: <linux-arm-msm+bounces-82699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E121CC751EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73C974ECFFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 15:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2726A8D2;
	Thu, 20 Nov 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZI46eVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592A23C4FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652713; cv=none; b=fBZTYPvwJgfOFgfzySgj8b6N61mC2Do1wOZxGQvnJ5hA0OUUXQNZHZ32yX9AJdojEhtFUwb25cMspueRiKRWJrnY8pG8kUlLjW9jo7BUcdpIQVb2zlFbulqodZCopcIZj/il3SELhQ30+95MJih84Bhzlst3WIR86Ik7gFmzMxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652713; c=relaxed/simple;
	bh=dtzyF3iuy8kapZsEsjKfyLmM+ZoFSdqs8IgBpnNu5ng=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imlTcV694L1ti52d+qoX8Gz+i7G6/AisWA4dKIUmKXQcUuaE0V3SPrmx5wDPut9qGk7gnBYOfKa4x+sjBTwxz6UrCaRv20oWSMEtJ8nVPL9NHrpI1FZH2/DUkvDK2964ITD3NRblIEQajEoo2lXnAcwmXAtlm/caIBx0yaeyjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZI46eVg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so7264555e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763652710; x=1764257510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vIq/O0/AL91lguWZ3GTEHU1lL1GNwH+lI8GY9Jzrdtg=;
        b=UZI46eVgy0HV3PnHrmfFZx0r4pmdBmkFbVnO0PHWgZBwzyUWJi59CQQTKOQDk1Qmry
         E+bz0+wePiwCdQPst/Ytmnb/UV3LRgkotaDbGleszgwH9ZB6hyJnTqZatRtvKtnLnFfN
         IEoPyUp0RUfZVBnN3Gx21CzIei2I/bVCOJEelNnjA8BOCUpH6sX28AbMsR5nSEEjjYZt
         qK7Ks3GefMyticqUxMFeImLIBqrdGRLqeNkNRQoD9kxFOSMwyFCs0YDLdv7oVWgh3W87
         UoW5cxFBwy83V7Xtacyu3SYVVWVQgR7WRLf//oWnkzeVIUXv0Vze5iJH7Wuc3HbQyFPG
         /54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763652710; x=1764257510;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIq/O0/AL91lguWZ3GTEHU1lL1GNwH+lI8GY9Jzrdtg=;
        b=a1p1DRIQ9Dlzz6qpkxFXr4juiY3CincM/VfCJp0CsQ9S+dU4SqDGYnB++q1OLKedyt
         XNxR8s/Nlk7Y0Z73ei+AdwQabIc+4mCFq75oh+VrHKeT1SY5iD5bVi+k1LTzAwgydIlO
         4V0+NflodpsJXd1Y1NZkO0VN3xCv5BQYMGxTBJhZKI3KwxfpC+u2DbSiTudZh15y/G2d
         PD84HVwLkrsGbYThMUVX4/9IWia6JBaaZdNkXMTblcbXFzNdCnZUIkvm2d5Kbehejl5w
         vEToMFIZ5gZOc0Ioy4ppULS8qZ5van3lLtN7mLSWea+cf2mZYVHTETOtwGyMjWsPxHIW
         m/lw==
X-Forwarded-Encrypted: i=1; AJvYcCUMvh6dvu/nB4u5I6n5hOUA8UesVleJX5gaETceH2QBU3KdYcLRH5wXV7rF+WyXseWu5k98cg6fz5E0FLZS@vger.kernel.org
X-Gm-Message-State: AOJu0YwAD7h91wQ6+qCOHXsq1gmRYElhtahbvoAdbRTwnfEPU8OYNQMV
	qx1VfyJKJwuXGS7prkM0zhU3FcrDNvcGJ22y4qkpqAKDBto8i8YxIFwI
X-Gm-Gg: ASbGnct4xm3Yu5N1w08/OLo9rFaYs4KFYTfyrtqx2wh73wKjGAv+iHdX4AebKVWM+Al
	cCNWoXfPRl4xcVQSJz0G7eR13Q4oBypYO461W7zQIhlwA65mgqcINpF+ZVImhD0G4Ln7NRNDq8d
	BHN0exiq6BX1Eguen1cWx5lUO2UyE4HiLq+eIBujoudZgnYFfLHCepEhL3oQHv5i0QdrSFq92Ch
	UGsDfPTXgknutkOEX7F44+f9bs61fXW4kB5TaKGHHkCOAFwNGXnLTdBsOtEOcDTfBwmgArtKFfB
	ngqIlqbxqiN9jXLDFiOLs6suJSm4hf4fXJj50ew/7dpOnBvJtIMxL6wGVX2VR1TlZr3eHFREO2P
	T4BFWWlWrfdOeTdS1UH1FK9tczjwwQJChIQIBOki+V06wp5W/8YeWh37jrBhShxBkyKAIGtHHC9
	2tYNnGT30V5j5vbmpECsfLajGf3ua2PDqdNzENOYE=
X-Google-Smtp-Source: AGHT+IFVqJA7RS7HvRm6eGAX5ub1WJX8xe85GZesCDT1y7PS7OVTND/zM2W/thezDZ6HHob9eXthYg==
X-Received: by 2002:a05:600c:4f47:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-477bac15384mr27816695e9.24.1763652709759;
        Thu, 20 Nov 2025 07:31:49 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10763a9sm113819275e9.12.2025.11.20.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:31:49 -0800 (PST)
Message-ID: <691f3465.050a0220.105096.7667@mx.google.com>
X-Google-Original-Message-ID: <aR80Y5n2OspElbTL@Ansuel-XPS.>
Date: Thu, 20 Nov 2025 16:31:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq8064 board variants
References: <20251120135435.12824-1-ansuelsmth@gmail.com>
 <8e75be2b-643e-4380-a018-3cb718745101@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e75be2b-643e-4380-a018-3cb718745101@oss.qualcomm.com>

On Thu, Nov 20, 2025 at 04:25:37PM +0100, Konrad Dybcio wrote:
> On 11/20/25 2:54 PM, Christian Marangi wrote:
> > Document QCOM ipq8064 board variants ipq8062, ipq8065, ipq8066,
> > ipq8068, ipq8069 now matched by the QCOM cpufreq nvmem driver if
> > socinfo can't derive the variant from SMEM.
> > 
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 18b5ed044f9f..0eb1619fede8 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -299,12 +299,32 @@ properties:
> >                - qcom,ipq5424-rdp466
> >            - const: qcom,ipq5424
> >  
> > +      - items:
> > +          - const: qcom,ipq8062
> > +          - const: qcom,ipq8064
> 
> Since 'items' requires that all items are present (and in this order),
> we would normally have a board name go first.. but I suppose this is
> some sort of a fix to the issue that sparked this (posting the link
> for others to have more context)
> 
> But since these SoCs do exist, I wouldn't say this is necessarily
> wrong..
>

Well we can see this as a ""template"" for device that might be added
using the ipq8062 or ipq8065 compatible.

When device with that variant will be added we would have to just add an
enum with the real device name on top of it (as first element).

Honestly I should have added these compatible long time ago as on
OpenWrt we have tons of device that are ipq8062 or ipq8065 with the
compatible structure

"device,name", "qcom,ipq8065", "qcom,ipq8064".

I feel it might be wrong to simply add to the list "qcom,ipq8065"
without the "qcom,ipq8064" part.

> https://lore.kernel.org/linux-arm-msm/20251105112136.371376-2-ansuelsmth@gmail.com/
>

Maybe I should add a Ref: tag referencing that?

-- 
	Ansuel

