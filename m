Return-Path: <linux-arm-msm+bounces-44683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B233FA083A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EDB8188BDF7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512D2063F2;
	Thu,  9 Jan 2025 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8v6Tdy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930021A2C0B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 23:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736466355; cv=none; b=hnZLd/EgjWqlNVK0yBnddcnxnIIDrSLWLjnt7rG5Yojo+vaSHzA3ESvqGJLMpxQrUSKmBCJfYuAP6OAe4S6BpueVFNJmPHyTrip7VaRhRivmgUPMZHJOgkXySwoi7Zhlw4ojeeqdZKdNPcEHKVv8dnQZFBH1pV5C38n9ADzYRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736466355; c=relaxed/simple;
	bh=8Fn5tpVxQQ8gfYVSYC9d+1uDg2CraF9og34DhkJKWIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZEQzmuJCvS7B+GSoyV0bBn1H1xBGWG26h2farz0ZFClsuDDyCYb6bCu/ZXf9yiOxgxgriE5vjCaAtb1ZvaNH+EBdA8QxXtmET+YHB2oBXnehWeba3hw5CdKF/MaaVBt2MBGCmq+dQyE/K0v5mWUgEEJBUN4Vsm8/iYXqOB+wOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8v6Tdy4; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540201cfedbso1400750e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 15:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736466351; x=1737071151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifd3ai3biKTaNdzvBUxlg/E6YILRTZjA+4tT653tYFI=;
        b=m8v6Tdy4LQPEbBePJGn9UjyfYUl+qdgW63TRlUGyiummSqbbz9vYHG35rkyqvCUdCC
         eJawDuEF1lj22SqgVt+4UsgRzFYXBhbWobHn2yU3avqBTemOQofRInDvJWKm5HwlpTJa
         NvqdAPX5mmsAkvB1yz3vgr5dYd/5/b4nIW38/EQCiXAq9kLXVrfhbnvcih4Kb5Hkt0ED
         yCgOdzVVwqwjIV3bLiAnyv/J+tsaRELqLqWGUw8wJUmaeRTRh4FXMGLTE9ide/gPHN4c
         AAAMKdHrm1NtqDIX2burdYrgYvf1yXQObAuf65RF3WwGsISCyeCy19ulHgTHgXAZi4ee
         B5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736466351; x=1737071151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifd3ai3biKTaNdzvBUxlg/E6YILRTZjA+4tT653tYFI=;
        b=PLu/EZPRD8slHd+kUhHGRltAuWz9GkEhriirpn5hemcCKQ3/dKx9PrysQABuLoXdN0
         CQlJrE5S5piD638jJnJgZYCo4MurvYExO3Vqgc49N6GDx2YxerjE6bi9sVwmUNXSL/Ko
         gb/jJuAl8N3HJ+aQrTv5oxBJx3NardcCoX6NR6MGAIJows15XB7V1DoTC8O8PxwcHx+q
         YPDGYr6RYVq7lkOsXlc6tz2hVHwFtoOnvWcLbb1Upi+PRhznbfbiu7PG3bDMs6hnVum3
         4Flfoquo57ckkT2vlxfMK8YfCb/5ITFUdkjLA+w7VB9rAC7uSlso9Oe+uKONosgbtS/K
         TIqg==
X-Forwarded-Encrypted: i=1; AJvYcCXGlcs8GVMk9B1ACRsQoYlLjIgzOKWBkKvOxd8jGVQzAqth6ohymWQOHjoQiDghqmzRt1POo3UZKd/N89K8@vger.kernel.org
X-Gm-Message-State: AOJu0YwgneQOaIavvYM4DAAK9IvkcvzTpoORUxn8PdZ+N5hESXLqHAPe
	cdWnK+Jwofpasm+CDEbD7y4FFA5qITJ6Mg0AdBaJoshPrOkZh+JHvwAYRnCWFik=
X-Gm-Gg: ASbGncv4Rq00vUqw/ZVx+VOblK1VpH/x081NF7Ryc8GqqTqG2Wv2xFd6MmnWjYX1l1d
	V3fUppocdJRRVSzAbUFj2ohBHLKW+t+Gwj9r2MMm0xrLC23UDes61RfINgy05Tz0dgeDGw67iSs
	QSI1c//7jGtKr/YGM+QY+fqzWaKFP4lBAFLtGRjgnyCX60G6EDPDWwdfXpzFjjWZ4us4XhCSc1/
	AUiwKhPlYQFJQZb42GjNZ5JXInWjWh58Wew0Pi6yC7N95qqxvDVyDib692C+RHrADy4me4wNbcZ
	rHvvwkjsuoD2fkmXJT9YyeePIaj2FG+qKmsa
X-Google-Smtp-Source: AGHT+IFE0TD0xLOUiVIfjJiuGh9UVHHNy8CtrSGHCWyGYMHymyrvfqIdJCqZCoyf+hgFwIwzU5DqeQ==
X-Received: by 2002:a05:6512:2205:b0:540:2542:cba6 with SMTP id 2adb3069b0e04-54284527758mr2364630e87.21.1736466350748;
        Thu, 09 Jan 2025 15:45:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becaac3sm333191e87.229.2025.01.09.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:45:49 -0800 (PST)
Date: Fri, 10 Jan 2025 01:45:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephen Boyd <swboyd@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific
 compatible to soc node
Message-ID: <x6smfgtq2ojzl774jd6d6fsilxj5dte4jbfypbvxvdmaqd7pem@nnpcnyzz4l4i>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-7-swboyd@chromium.org>
 <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
 <0ab00013-0265-4336-bc30-f49492e96424@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab00013-0265-4336-bc30-f49492e96424@oss.qualcomm.com>

On Thu, Jan 09, 2025 at 03:10:33PM +0100, Konrad Dybcio wrote:
> On 8.01.2025 2:02 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 07, 2025 at 05:28:43PM -0800, Stephen Boyd wrote:
> >> Allow an SoC driver to probe for these devices. Add the SoC specific
> >> compatible to the soc node. Leave the original simple-bus compatible in
> >> place so that everything keeps working.
> >>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Bjorn Andersson <andersson@kernel.org>
> >> Cc: Konrad Dybcio <konradybcio@kernel.org>
> >> Cc: <linux-arm-msm@vger.kernel.org>
> >> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> index 76fe314d2ad5..257890a193e6 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> >> @@ -782,7 +782,7 @@ soc: soc@0 {
> >>  		#size-cells = <2>;
> >>  		ranges = <0 0 0 0 0x10 0>;
> >>  		dma-ranges = <0 0 0 0 0x10 0>;
> >> -		compatible = "simple-bus";
> >> +		compatible = "qcom,soc-sc7180", "simple-bus";
> > 
> > If the new driver requires this compatible, it will break compatibility
> > with older DT files (and it should be avoided).
> 
> IIUC the intent here is to provide backwards compatibility through checking
> for sth like IS_SOCPM_MANAGED(), sorta like HAS_ACPI_COMPANION(). In that
> case, power sequencing would be done by the socpm driver, whereas if it
> doesn't hold, the resources would be toggled by the device driver

I think that this way we end up having PM code both in the device driver
and in the socpm. Ideally in my opinion we should be able to migrate all
pm code to socpm, keeping compat with old DT files. In the end, if this
is the only change to the SoC.dtsi, then we should be able to live
without this compat change.

-- 
With best wishes
Dmitry

