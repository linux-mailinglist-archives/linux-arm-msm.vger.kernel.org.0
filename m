Return-Path: <linux-arm-msm+bounces-46571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA3A22A2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 10:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B040A18860F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFB71B4253;
	Thu, 30 Jan 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lm6cPiPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AA18F2DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738228980; cv=none; b=U1WMtlNA4g78IQOX7PrXto+Jycx0Eqn4CWvOet9Cn/NTJCjfUcHOMPqe7Q7YW32Nu8nSl0QyXrLa33zWipnCHie6OkIrmkih89GGCfTFRpllEgZ2rkvDfpE6txjSBxo/HPzSBUoKqSn1CuSJU1zwJ8j1d93iXjY/2R7GO7Vcn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738228980; c=relaxed/simple;
	bh=l/y2rKHTeHCMIdFJknmDGptmgyKdHRXNKUnma+8hvQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns20oIjp2l+02ee/z6F/W2OwGfYLi4I4OIdIoe2bNDdnYne6PnlKtXTb6DERuzg/ZCGPHJf16Lc7wUjvZqdJeDCvA4EeLKO0BhAzJkQMTu9I6dLTJ35By8L3AW/IIaquNLB6/oq22S25ptlb0et6pbCfniamtPWWihcljj30Aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lm6cPiPU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361f796586so5555515e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2025 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738228976; x=1738833776; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bABlzs4WV4zPMzttcVzuljSykTsEdocLqyABjUyKlak=;
        b=Lm6cPiPULMyLjJel+LENu9CHVV5WB3c9v37E0JsvoOxlBLzzdCbU8mFoX44w8wUiL6
         zzsuUSq0vVXhGR7zS6xwDwyrszF3fVX97cQq591AeCgIPyJN+wPXpwS2cC9N03y8pnw9
         29bCgH/GHn2MmkEeW+75k59pPksxDAoJCqdXTkcaIWOn/5aaCadzSdyMeD8p/RkLyeBd
         dyfxKFVWIKikMDHRnPYOfsPOLspSmYloS8z6Uctv5y5K4TbppY8/lzS38q7alazruWZ2
         JMDeWcIybOrJ48iC6VrEUOHZ13e2oPPVLdXa2idzMZCb2WYn7Rja+xCZ804/+4KMQL1s
         QYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738228976; x=1738833776;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bABlzs4WV4zPMzttcVzuljSykTsEdocLqyABjUyKlak=;
        b=gJhAsEVbuLTMYRQ4PmKoWqlrsQlKW6J9WYbamp1hLNQ3xNvlcDOBefJBdZylBx9I6j
         jbcv8kvGxgEAj/vWQ5fyaz23p+znug2GFgzT9Y1UHCPIP84Leg3c/KEIuq28k6Fa5YbG
         kjq2bXnfssvWXKbZdEQwzRZg2zFJga9sPIAbjG9bbbHTTHX0uPOiik+XcDLdDEzjeqsu
         oZStfbvadpxnRfloeUK1ggTf0ee1qPkODFIpfVgN4DDZMwzh9tzhKFnhwjxjWDyhB7fp
         ZB2RfwlgYw/twVeF3D0DNRMB+tvS2kfQsSUq5WG3MUCFEwl2rWr159UBMYHmxqkUcSh2
         Db3g==
X-Forwarded-Encrypted: i=1; AJvYcCUAHm9knbrAMwxEyQ1penHzsm9oQ0aDSAckLqsWqlzHv2WnyBNsJ9BsUYor11CdRNHdhKFM2xmFmjs9kY9I@vger.kernel.org
X-Gm-Message-State: AOJu0YwJOK++4xQRwnX3Di12UGFyi+Mrv3dpbsNQ6tttfIS01/PkV6Dk
	zI8RWzmsRhMIWWq2TJsobefVMi0PrKsWCfr3Qj5DZdTtOkD+y9t6ILiFTuoFHEs=
X-Gm-Gg: ASbGncsIU+X0axodvhOLa61/N1gptMrYD3WH5SuGwDkODeNAWrXXrJv+bIINkIH+4/M
	EdnaJA3kSwclf7ZBTtcI3R5NnBggN6bM7l3g/mLFOrLucwIaBYr9Wa9lJY3oXUjMHL7FcpGd4wZ
	89RpubXGd9OWSCTXRtCLh9haGu6BupN/33Y4Jd62UqPyim3omyUZhds9hf0tuYJTAomdzDoJiD4
	e9D7VEAEdvdpXZ65tT/m+uEULQ3jWfqd3J3kfX9sXyEATEh2eq0aIQ1xrKPR/D4BUpo2jvqtGV/
	VupL9RtZ2t8DnYOrlVz+gw==
X-Google-Smtp-Source: AGHT+IE7mw9vUK2x3N8IkDN7zen3ZP75QkC7O/wisGJaB9+GYHuUpDqUdPuFOauTpZOn5BwLdabLgA==
X-Received: by 2002:a5d:598c:0:b0:38a:50f7:24fa with SMTP id ffacd0b85a97d-38c520a682bmr6008492f8f.54.1738228976499;
        Thu, 30 Jan 2025 01:22:56 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d443esm16834705e9.1.2025.01.30.01.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:22:56 -0800 (PST)
Date: Thu, 30 Jan 2025 10:22:50 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,wcnss-pil: Add support
 for single power-domain platforms
Message-ID: <Z5tE6hrmVLUD5lLB@linaro.org>
References: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
 <20250129-wcnss-singlepd-v1-1-b01a6ba0b1bd@lucaweiss.eu>
 <9c573fff-31e6-4319-b8d1-527a3487cc20@kernel.org>
 <4981958.31r3eYUQgx@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4981958.31r3eYUQgx@lucaweiss.eu>

On Wed, Jan 29, 2025 at 10:42:22PM +0100, Luca Weiss wrote:
> On woensdag 29 januari 2025 19:44:54 Midden-Europese standaardtijd Krzysztof 
> Kozlowski wrote:
> > On 29/01/2025 18:51, Luca Weiss wrote:
> > > From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > 
> > > Support platforms such as MSM8226 and MSM8974 with only one power rail
> > > (CX) modelled as power domain while MX and PX are regulators.
> > > 
> > > Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > > [luca: reword commit message]
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >  Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-
> pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > > index 
> 8e033b22d28cfa8203234f744b3b408e976e20c3..d3c71bcf0f02122eb0dae214f135d8d7f71a9600 
> 100644
> > > --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> > > @@ -69,9 +69,11 @@ properties:
> > >        CX regulator to be held on behalf of the booting of the WCNSS core.
> > >  
> > >    power-domains:
> > > +    minItems: 1
> > >      maxItems: 2
> > >  
> > >    power-domain-names:
> > > +    minItems: 1
> > 
> > 
> > This should be further narrowed in allOf:if:then per each variant,
> > because now you say that all devices here can have only one power
> > domain... unless the compatibles do not allow that, but then explain in
> > commit msg.
> 
> Yes, the compatibles are so broad that they cannot be used to narrow this 
> down. I can add this information in v2.
> 
> I'd add something like the following. Let me know if that isn't clear enough.
> 
> "Due to the compatibles qcom,pronto-vN-pil being so broad we cannot narrow 
> this down by SoC without introducing new compatibles."
> 

The qcom,pronto-v2-pil compatible isn't too broad here IMO. It describes
a specific hardware block that needs the CX and MX power domains to
operate. The hardware block doesn't care if the power rail is being
turned on via a regulator or power domain. At the end, this is a
firmware difference "leaking" into the hardware description of the DT.

We can describe this in the bindings. Both CX and MX must be present,
either as actual power domains or regulators. For the old setup (=
either PDs OR regulators, but not mixed) it's already there further
below. You need to adjust the part where vddmx-supply is marked as
deprecated, undeprecate it, and then try something like the following
(untested):

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,pronto-v1-pil
              - qcom,pronto-v2-pil
      # ... drop deprecations ...

      # CX and MX must be present either as power domains or regulators
      oneOf:
        # Both CX and MX represented as power domains
        - required:
            - power-domains
            - power-domain-names
          properties:
            vddmx-supply: false
            vddcx-supply: false
        # CX represented as power domain, MX as regulator
        - required:
            - power-domains
            - power-domain-names
            - vddmx-supply
          properties:
            # Not sure if this works here, might need to put minItems: 1
            # into top-level and restrict entry above to minItems: 2
            power-domains:
              minItems: 1
              maxItems: 1
            power-domain-names:
              minItems: 1
              maxItems: 1
            vddcx-supply: false
        # Both CX and MX represented as regulators
        - required:
            - vddmx-supply
            - vddcx-supply
          properties:
            power-domains: false
            power-domain-names: false

Thanks,
Stephan

