Return-Path: <linux-arm-msm+bounces-68251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196FDB1FFCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692A73B0D09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 07:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9BE2D94B6;
	Mon, 11 Aug 2025 07:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZQz9W81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753712080C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895720; cv=none; b=qBfUUAhfdi13mnV/jHsnrutf5I/HlRG680bFkcPTWx/O7uawa+jhJARRLGowMXW3UZvqcQ65CaoYzgDfBPJQzy0bMMxa6jgFgopsFOT/HNwXn2o/tL1bOpiEtCIsnNDb5uICE4mAZDf3ETYjbWRgc+PoyuGUySV32k3WxI+AILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895720; c=relaxed/simple;
	bh=i5i+o2f+rrl/OAOkHKuvWRjEKuAxEakK5GVIkg3Co6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laKwCF/jHzswHQsbsmHcRVLfcIsuOG5xwXO7x1Xc+Bs70X1dVBruGBGLbKzqLs4lRnK30SjTN6KaLIiq1Ak2SQrPECarF1vlfpDORoSOC3nfcyYt2hksfj1+Hi8V8zG2t7aUJYyko9cBovAPt1gD0xPj+V2cGJbogvkgEXgSPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZQz9W81; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4245235a77so3375826a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895717; x=1755500517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHEw2IHzxA4wFPAA7C102H9OqGdRlerd4Wo31dulLWQ=;
        b=SZQz9W81/mXFsNxJ/m3ywX8jkIBpAonPnoei/q2JpUG5H5shjzuloeEut9f5VOTkSZ
         8HtUlOLiknpX9bxHSZM4vD61gZ+mrCfdAzka1joWQg0DaZ2Y2DJyoRjzzR1YiSlFnf8c
         FFPfVHfyjSWC1TWZbhntRW3MvERT286sVK5rNpwSF4qtlaYsVrFE063JIXP5ioKYeInm
         VvQjWFa8QcGP8pAWKtsn05XqknTOF/UIhkhqsDfxA7JGhgoCWzAJBvXbWmRhX46dR9BD
         FntrFGOsuiSC3CCgKdZxmM+cud8WuLuzGF/7dqphZQnTAQtyR1nOz7Cnrtsbe8IHdPCE
         G6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895717; x=1755500517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHEw2IHzxA4wFPAA7C102H9OqGdRlerd4Wo31dulLWQ=;
        b=gG/Fr2tKwCIHA2M3agA8YZpTaB7tanxwBybl5kUGHbZ0nOyFhUx1JyEG0kmJmLd0Z/
         lSF4kNQNhTfIB9ZkdIfB6ZwE/EdLiS+VcFq4jpfJbVaq2o+tNJ/jHN8Sha11Y3BN7S6w
         qHsazreYwcqytTeRQfG+bpid7CY86WfyhmM6w4RS43dgA8bbk2yzeNOVdWqbrux/yFT5
         8jHDsbb4jQzyC5Xqsfanp4zeg5pSto48jyBxGuJVuy+dO6tLSKj01C1FUgO4N3fmxQ0Q
         diBI/z5s7o6hsscb4iyedIBz2KbY85Bnis58+kcwnqH7xVdJ68ksgiFgHFWvhfJBDP8I
         ssKg==
X-Forwarded-Encrypted: i=1; AJvYcCWP3DSEM5cZDhL6sK+EpH26Xm79DE1z5mDoUS4qPdEMfpZA9VNfpNik3ZEyI3pHA/etjB5JT+ibCd0VgN+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5QxBTeHS1mtb2e36OrhjiPu4TLEQXbZYMZ5vH+AewRVpDxcES
	5ZSziaX8rj/Bi4pjV4jpa+veU7+gBSDVuD5QhA/1UmDTi1J44dYtsoGhE5JXWKSkkGg=
X-Gm-Gg: ASbGncuAVQGtsJaNKUtrwSwBYfOAoCS3WFcPUyM0oDQN/kFBm3x52Iez1aarvF1QaW9
	ai/SntWuCf2KTZm17lvfhAzjSlHvlofBfMlXb4tl0Qhz/XRCJnIXYtwfZmMYHwK2gE3jPr9GalA
	RoSmhk+W0v8c6JR2MTSDLshea9j8StyihYXdBz6cspMZ8q1jRJ+DIf/TReOb01P4Q1UEyalfJyc
	wVEPGH2Sj/KE1LLn83VpZILUjqHKO23/ePUM15t25Im8rDa/KtjsVOoHjkRDvvRXdlkLuOBkzeg
	xfMipDRZbUqHnBC8zDAWTn5jL8+pAPTzCwg4tklJ0ivdaqQi7SQ4FAya8XVPpAC8YI+LRcjBy2W
	7K5l+MszVEUIISkA3/fP+Ll7HO8Kxz2pNFyI=
X-Google-Smtp-Source: AGHT+IGfBYscmszLcQ4WIVww+p90HeYYLjnd7VEGcPNozcJMTJpfpN4Si84n434k13+c6xYJKAYYSQ==
X-Received: by 2002:a17:902:fc4e:b0:240:469d:beb0 with SMTP id d9443c01a7336-242c21fc427mr199498845ad.31.1754895716651;
        Mon, 11 Aug 2025 00:01:56 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899aaecsm265961735ad.119.2025.08.11.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:01:55 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:31:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konradybcio@kernel.org, rafael@kernel.org, ilia.lin@kernel.org,
	djakov@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
Message-ID: <20250811070153.5rjj2cudgs7rwiwc@vireshk-i7>
References: <20250806112807.2726890-1-quic_varada@quicinc.com>
 <20250806112807.2726890-4-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806112807.2726890-4-quic_varada@quicinc.com>

On 06-08-25, 16:58, Varadarajan Narayanan wrote:
> From: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> IPQ5424 have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Added support for ipq5424 on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
> 
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> [ Changed '!=' based check to '==' based check ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v5: Add 'Acked-by: Viresh Kumar'
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)

Applied. Thanks.

-- 
viresh

