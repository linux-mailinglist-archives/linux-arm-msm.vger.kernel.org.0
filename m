Return-Path: <linux-arm-msm+bounces-22747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 956949093B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 23:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AEC71F225C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 21:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B6E18410B;
	Fri, 14 Jun 2024 21:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlXQOVu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC3143C7A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718401340; cv=none; b=Yw9KH/VNQotDWFbEvyUkEKDnxIv6s6HR2qDtNlUIIrHrFnknM56zZd83BaZsHiMImY0v+bq2+cCOmfcsjYnnl9sOxyh5EARNsUrjyQSX513YS+BfPc5u1DYxxQ4cj4rqobfhBTpSh+vDJlB7FfyxSGVsVXfsNfPF4RVLuNUT2PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718401340; c=relaxed/simple;
	bh=faSPDpcL3yqC7PLRvANwHerlzIJ1Baevv3BJdpBQmo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRlbE6+GkLzWiqYYGmXWo1buys8J+//D2Jd3E/1G5znWuTmsksoBaYGd1nZSV3HE5Bq1ER//HyQ3Bpj+K8ODqvl/GVUB4F8tb1F1IHZCTZoinO9nsrmJjFQVH52FFMvKHFmW/Ut7nYu5OaBYhUZYH0n7OIh4y//zyr8Vsx6prpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlXQOVu7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52ca342d6f3so2100315e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 14:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718401337; x=1719006137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfrFywGdxRVKDtBlePZ25waSont2SOCWw4599ELCJWU=;
        b=AlXQOVu7NEhGuQ0a/O4HIf7ElahCxbZ805Z2rcv7aCX8lcnrMfm9wigZFgqyA+jDAZ
         Nl21lN56B1oWka0akfreOipWwNxQ6GVBslOpuL5ZlXLDvY4NCPc0AoxO64dZSRuaB9Be
         S10ESwpjT8KQbMgXEK9B7ARWbLW8jRaQk7cENgHWaJWW2lHQVyp4cJlMMWVcQwIRS9j6
         0IABzCBi5RNr0HKA09daZFDkByzAfABzhw2SQOwm/xOVv9FjUUO8Dc9IZkt3KyUXkGt5
         LjOr98crCTDfvfuOLmGzwejNlBhBrkFbtNvGeOnebE+qT2A+PJbCAEevmOq5GxVLTZCM
         zxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718401337; x=1719006137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfrFywGdxRVKDtBlePZ25waSont2SOCWw4599ELCJWU=;
        b=iEI9EkutPTYgiJqHXdknYsRyIuPfhAzgv5rTgvQ2cxFoKxhSTTD5iYsl2Jv+6bkV48
         l6MdJqlbbog76bqQcrJy3f/Iu1A+ZZ/8t/E/SENBB3BjQcvMZTWqoLA2GVLBsuTCfit4
         is88EJ+vH9eM31XoVDDLLLI3f9CjWJ+lSynxGp/ZoNm3rT9ZW3yZTP/CPUgFMU4DMoEX
         KLLndLYZ7CJGlGH68ZE14Suv4SwKGr1rB24nDKqDEJNUuMJOwla6hOfnj9uG4NHyvrh9
         fJqjE1IPy0dIpJ6xJe9R772qsz/1BMaPiJKoUtKkwpX1hrjPUiAaOBPCZg4wMy+FKyRJ
         qRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpOYOScT8FGZRaB9RFsp9xMrIc7rW8h1ndy7MnExPuFBh5WLQfwGKHMe9tBJ4vVOOtz65EVzUuZyOdeAmF/dIm/iBsAc79Zu+k/x1pfg==
X-Gm-Message-State: AOJu0YxiUqKYyJtsb7P1L1cshESDp72qMzE1hxIYxTyGpd1/oco1c5kB
	YMfm+dapwM+7C2kaiXbR1xavhCiL63uDxV9cVbhWld5vVSZ4Xx3DZmp3DGKGmFw=
X-Google-Smtp-Source: AGHT+IGsVkod4fXLOnmg6/ZcW7K93n3FUSjBDvgJc0I4Ni8Y7vOmxBSXmUWJdfTPkDiGDeGmgJ40Yw==
X-Received: by 2002:a05:6512:4028:b0:52c:9a89:ecee with SMTP id 2adb3069b0e04-52ca6e94220mr3573266e87.52.1718401337253;
        Fri, 14 Jun 2024 14:42:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825c61sm600737e87.7.2024.06.14.14.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 14:42:16 -0700 (PDT)
Date: Sat, 15 Jun 2024 00:42:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	andersson@kernel.org, konrad.dybcio@linaro.org, djakov@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	abel.vesa@linaro.org
Subject: Re: [PATCH 2/4] soc: qcom: icc-bwmon: Allow for interrupts to be
 shared across instances
Message-ID: <r6bwmhfa4csubsvetnjlj6gzgovewupxf6hkuygqdconldpk2v@otrs4lhd3baj>
References: <20240604011157.2358019-1-quic_sibis@quicinc.com>
 <20240604011157.2358019-3-quic_sibis@quicinc.com>
 <5e5f052b-df59-47fb-aed0-10b4f980f151@linaro.org>
 <5df5dc6b-872f-34c5-a6d2-a64f9c881193@quicinc.com>
 <672b6156-e425-4f3b-86f4-02a34cab2b67@linaro.org>
 <122b5418-ca2d-df7d-a1d5-d7682ce0ed5a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <122b5418-ca2d-df7d-a1d5-d7682ce0ed5a@quicinc.com>

On Sat, Jun 15, 2024 at 01:49:34AM GMT, Sibi Sankar wrote:
> 
> 
> On 6/14/24 13:54, Krzysztof Kozlowski wrote:
> > On 13/06/2024 19:02, Sibi Sankar wrote:
> > > 
> > > 
> > > On 6/4/24 12:16, Krzysztof Kozlowski wrote:
> > > > On 04/06/2024 03:11, Sibi Sankar wrote:
> > > > > The multiple BWMONv4 instances available on the X1E80100 SoC use the
> > > > > same interrupt number. Mark them are shared to allow for re-use across
> > > > > instances.
> > > 
> > > Hey Krzysztof,
> > > 
> > > Thanks for taking time to review the series :)
> > > 
> > > > 
> > > > Would be nice if you also mention you checked that it is safe to have
> > > > both devm and shared interrupts (so you investigated possibility of race
> > > > on exit path).
> > > 
> > > I didn't see any problems with devm being used with SHARED when I posted
> > > it out. After your review comments I went back again to vett the exit
> > > path for races and ran into an pre-existing splat [1] but the bwmon
> > > instances work as expected on module removal/re-insertion.
> > 
> > Using devm and shared interrupts is in general sign of possible race
> > issues and should be avoided. Just "not seeing problems" is not an
> > argument for me, to be honest.
> 
> Didn't I go further and say I got it tested though? Also can you
> elaborate on what race do you think the bwmon will hit rather than
> being too generic about it?

devm_request_threaded_irq means that the IRQ is freed after the
bwmon_remove() function returns. Having IRQF_SHARED means that the IRQ
can still be triggered even though IRQ for this device has been disabled
in bwmon_disable().

In this particular case such IRQ probably won't cause issues, but at
least it needs to be validated and probably commented in bwmon_remove().
Just stating that "you tested and had no problems" usually isn't enough
for the expected race condition issues.

-- 
With best wishes
Dmitry

