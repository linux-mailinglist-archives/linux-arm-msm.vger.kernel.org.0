Return-Path: <linux-arm-msm+bounces-35740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C89AF2E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1176281E14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D95618BB8F;
	Thu, 24 Oct 2024 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOcsbaJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D0189911
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799314; cv=none; b=INpXaxKApJYztK0AU1asIV8SJuycO3aFdFB1bdcOuf3cgrjj6EajAMls1ZOdsg1Rfgl2lyeHtxscayok3ordDm7M+ObJN6fRFZPldKbs9HV04ofoq8kcUUq0epT5mCeqAV01dFmFZblgzfZN3A3GNxGV87IYLDXJk3/P/2v3E58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799314; c=relaxed/simple;
	bh=rP3nE3YfLu0nrtohxJZRriv9faFfru/uo3MCztPmSj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFwK3tdh2/1XIojhpir0LHuEL/C/WgSGg4BPTz2obItbLIwWf26gzgM0ZITPa2FF58VcI3OXJgsSmZu+tTJ1yOoaamYuvFM7B/57U0SF5H3jvF8zYKDIyKvoU12/nOxVJ6TX4Jps6SWdgRd4IP75fZ48SlDd6kRm+I7JqOOZQnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OOcsbaJm; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so1630530e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 12:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799310; x=1730404110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGBoqND71236knReCQexeHrHy1YPglXydeKm7AcaSgw=;
        b=OOcsbaJmwaiwiIvY3idfBf/Po5i076YwWgH3ESX+BQ3eX7/66WWiRZc/FxYSQ1jRhY
         OHAy7cYhyAmU0XLQNWs9AG4G6u6FszQViJNMUBE1X3jBqw67w2SKLjYMF8kG6NFvsEne
         b+R3U73z6QRtS8B6RDNXsEID+xuX7hCn97QH6vE+LCYaIHo4XPQxPrJHsJBsKOhFivxx
         rydlENCDnAfsrKih7111EzC+WOq/PdGtts0lYgMbE+5nW30TdqCNc0yGpoebMbxPVFP5
         yCos3bxZr0sv4bgtflR7kxtR6emngwtMXABJwIC1bFrS2HLIER53JvFDI2Rr1pz87T+W
         4dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799310; x=1730404110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGBoqND71236knReCQexeHrHy1YPglXydeKm7AcaSgw=;
        b=MJ+kTfnoAalglR1FvLHYetfrOg4OqRiiu87GOpcjnVISbPkLgd5usg6JPIwmGCI3VE
         vMhNtth5j3KFgBK+VyhfkplTeqt3CGcyOqshExyhHpj5z3anZwJB+gKBUAXBZpwY6aOh
         uaCpPV8bdoxoXj1GUBp1tXorLaX7Jk2bfWJR6ivUc+TMEsis8/TKQuFv8VubEcLzvJk/
         PuJqpoFnHAixBN0DHXIYXnb8u+jozJZSraoBSLczD+gzSJCXFLCdHWurkSkcpoqFcihK
         vlKKTz9P860XXiI8Uc9dEiDpiUSdBB+1+1PCgW1MqLy4C5MPpcGoaj4rVLsD/NWUNTjy
         Kdcg==
X-Forwarded-Encrypted: i=1; AJvYcCXGf1cBmlWerZHnAsY5cHqzyrb8KpQLYUJGzWdn+6VJ0yCf8VOJiMet7HG/wC4mUJJhEueLRGayjeO9uHJN@vger.kernel.org
X-Gm-Message-State: AOJu0YyaYOgqzaddrxevbhYTmifp0J4IW1bdbDzzlc+OWhOu02wDGSbU
	U6mym+UgGD6yYCaZchsuR9vpZnV4u7IolLEngzlWgVps909sFAhVKclKh+N4Y70=
X-Google-Smtp-Source: AGHT+IFxNfXsb6FF2TOOX13EEGKrWhQ/IAyagU629O/aokFyrD4j96vGZ/8XXEmR0CIVaotIUpg1zg==
X-Received: by 2002:a05:6512:230b:b0:52e:7542:f469 with SMTP id 2adb3069b0e04-53b23bc0b0fmr2106888e87.0.1729799309863;
        Thu, 24 Oct 2024 12:48:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2241ffc6sm1451111e87.179.2024.10.24.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:48:28 -0700 (PDT)
Date: Thu, 24 Oct 2024 22:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <lewbl6nglqzvhe4ho7ayzqwj7xrgszqfrapqo46cwbfhsftptd@ap7l6zqpo275>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
 <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
 <3765cf3d-8477-45a7-af0e-b0c78f41eaad@kernel.org>
 <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b297305-0141-208a-e414-fb7dc98317b9@quicinc.com>

On Tue, Oct 22, 2024 at 12:55:19PM +0530, Sibi Sankar wrote:
> 
> 
> On 10/8/24 17:41, Krzysztof Kozlowski wrote:
> > On 08/10/2024 14:10, Dmitry Baryshkov wrote:
> > > On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
> > > > On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> > > > > +/*
> > > > > + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> > > > > + *
> > > > > + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> > > > > + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> > > > > + */
> > > > > +#define QCOM_DDR_LEVEL_AUTO	0x0
> > > > > +#define QCOM_DDR_LEVEL_PERF	0x1
> > > > 
> > > > I could not find any driver using these. Can you point me to usage in
> > > > the drivers?
> > > 
> > > It's well hidden. These are the raw values used for DDR_QOS memory.
> > 
> > So not a binding? Then these should be dropped.
> 
> I am not sure why the term "well hidden" was even considered :(
> The driver just reads them from dt and passes them along. If you
> want the dt to list magic numbers 0/1 instead I can do that as well.

Well, it is well hidden, because e.g. Krzysztof could not find them
being used.

No, nobody asks for the magic numbers. Please drop them from DT and move
to the driver instead. And this is one additional bonus point for the
non-generic node names. ddr-qos is _different_ from all other "memory"
types. It doesn't have min/max values.

-- 
With best wishes
Dmitry

