Return-Path: <linux-arm-msm+bounces-13791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D63DF877A74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 05:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 760F51F21E8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 04:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1568495;
	Mon, 11 Mar 2024 04:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUuReWxJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34166748F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 04:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710132651; cv=none; b=Jvr128VOt4AQcw1pNAxohrZ037G3U//S76pIlVvYFCwnKY31SmuVLPj0KeGy88BVWyfwlDTErhCobOWHu6yjMNvR44q8ZbRKdtzlFzQPvexeci32qrmgebtXNaHFH4DqIZ5dAJQ6lQtuMW7nFxvNT23Buz5w0eaUNWGfLPWXNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710132651; c=relaxed/simple;
	bh=x/uzfXxOzbqKSd67PBuy83Et2SEuvF/AVOWHtH5UYWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntm+ud4V93eRnnY08NiZ0B+Tw3XrfBcGo5f2r4z0ljmDY7Khc9tp6g/wcGidkEp8ijNeh+UCy7OpmFX3Gg1h8qLG3s5/5nUdej+Pl51bDgo6v1UPhL9puA53YzwfGevCP11nle2v0+kZwaNBX5Y0D5H42JvzW0aNwtNHJQ71QLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUuReWxJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dc96f64c10so30188105ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Mar 2024 21:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710132648; x=1710737448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1/vyyb7UixM+MEvW9AsLcC8YOFSA6iDMoo7vUn6seo=;
        b=EUuReWxJKlbMsZrvH43PpeDcO3bhy7s4tyvJ1bivV+M8Cj0WyvkkacvlLhP9ml4Yk2
         QP5aSbivsMM90HwvGbYKTPF/1d5MAplBP8KL525TeV3e29gq80a2HEcWmyPc2p5elrl6
         3nXBAjDXio424qm5+Yl58A5ut7Br66syHBNNqGiJHqCUJD1ZwcpTnJbrAfBQGEwM1nIG
         QD7kQeXpP9LzlfM0G7TPe4I6V1KhYwVCafpaRJnZx4rzgZB7UH9q2kIT4/+FmxV74IVD
         T/CMQZrWc33k3peybKymV2oaT4dRmxuXKNCfV8THXSv8a2C22LMSBr0QvVgQ3afBZahZ
         ySgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710132648; x=1710737448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1/vyyb7UixM+MEvW9AsLcC8YOFSA6iDMoo7vUn6seo=;
        b=lcWgiR0+WkTq9rPLSR47/hp6a5dff+S9yBmkg+02euP3xQpswLBCVjcScJaUv5J9K+
         BUyFevDBYWA1AA/fVxmrHvk1m7LmJTMeEmbJqu3lhLGzm5SMAHouJivaQ8L54IBSgBR7
         CcWtv3MWEZFz3gg7bjzweMeZiy6Q2yYF+FFQ0eYsL2ZZz3wtmRF5BaMnvnvlcXu335Ul
         agmStMK8rNzJqGN3d/40QaCQTdBMAH590RkRd7k4+WZ4WVVUVrLIua0zV6XxXyNCQZyu
         WCJa+nXNvElhJCmOApgk4jIVdnXpjWDt5XseNCHqvfskeu/D+72U3IfEVQkBs8Eyzd6N
         VgxA==
X-Forwarded-Encrypted: i=1; AJvYcCXU3Yq1ngFxltnkK+gTnYOEsrZ32MzbzPsyQ8nO2rdwph+nXBdf/0I7Cc1hOX9uW1JIIj9FzSemYPID+yPRh7Vp8DMAOUGrZ7Dov8e+hw==
X-Gm-Message-State: AOJu0YzmznSemUIdNpCHv9XUyWBOzwCoUw7dSqZaieeVNncv9Z0agL2C
	3MDRBEAUAtGNspQTM5ublJTTadNnlhiTAUsbMlE+bn3Vw8jouvWVKD8q98cWt+U=
X-Google-Smtp-Source: AGHT+IFaFumoYymXG0elFv9QWhPYx1mJ45zKOvRlcg+v0XYxM1IGW4kDZhWUjELeGZppoh4j4XYmZg==
X-Received: by 2002:a17:902:ef8d:b0:1dd:6296:1709 with SMTP id iz13-20020a170902ef8d00b001dd62961709mr4639033plb.63.1710132648326;
        Sun, 10 Mar 2024 21:50:48 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001d8be6d1ec4sm3591966plh.39.2024.03.10.21.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 21:50:47 -0700 (PDT)
Date: Mon, 11 Mar 2024 10:20:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: dietmar.eggemann@arm.com, rafael@kernel.org, xuwei5@hisilicon.com,
	zhanjie9@hisilicon.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_rgottimu@quicinc.com,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V2] cpufreq: Fix per-policy boost behavior on SoCs using
 cpufreq_boost_set_sw
Message-ID: <20240311045044.7vvzbsx5nqs5a2lr@vireshk-i7>
References: <20240308103630.383371-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308103630.383371-1-quic_sibis@quicinc.com>

On 08-03-24, 16:06, Sibi Sankar wrote:
> +		/* Let the per-policy boost flag mirror the cpufreq_driver boost during init */
> +		if (cpufreq_driver->boost_enabled)
> +			policy->boost_enabled = policy_has_boost_freq(policy) ? true : false;

Can be written as:

policy->boost_enabled = cpufreq_boost_enabled() && policy_has_boost_freq(policy);

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

