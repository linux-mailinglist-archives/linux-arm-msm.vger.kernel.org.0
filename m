Return-Path: <linux-arm-msm+bounces-13792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A0F877A78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 05:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAE928150D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 04:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2BF749F;
	Mon, 11 Mar 2024 04:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fl7kmEqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB11748E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710132918; cv=none; b=fWUAXRCrGzH19rkzyAtUJXFBFZmdzoiCdazbGJGNsFwFq9Nj3s8zVrWUZZpi0znFc4p598+fqgBQz+L/7XacDAarUmWpYE4YrbRr65P5d9qmU8dEa0pEKQU1lkMNi7vPogKTCMQePq6SfCrC8Ph+9jTm3DPY4bOkzEasqiXO8rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710132918; c=relaxed/simple;
	bh=52VAO+VxR6pxEaczzmuSvt4/ZIG5SIz8I9wifrUEdlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaGkrxwHfZrY57sXd4rEkURg9zZuOyi1BiHqsso//0q2IdddEWjag72C0uN8J+jX3OXLm51BxCmefQSCUxMsFRyGM42wo5dxFH3a9/ClDCySQQ6BYR1d+diMrv10jwj/Tcb91ED5aLWoqtf2lEA9W6JISLj+6CSZ3l363eFKkks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fl7kmEqT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dd878da011so5634865ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Mar 2024 21:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710132916; x=1710737716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r41frIqTlBqONH8VqP8QaMgMMTcjKrVSs6Fut4Tm468=;
        b=Fl7kmEqTFr1ciHo6U8j8UUdGXkZB8Ohuiaw0fm7VBGDNONXnmeqKjbzz9w6LOpV+qZ
         3qISYmYLqTSLUP2nZHXk0sneoAQEg0iW76+cb3Cs0+dLdBMZ9LKQw6Vcly7p8wgliyGB
         QmsWCi/FkjUxMxmerM7uUArrcvOGCShlsxU202GSrW7CwkanSlfstDFtn+I25xAm8B59
         BSMQDK4HA5YyjWaCZye8lggflSzkX5pL8RHLy2+01FF3tK+G/mUD7NRNd73dB+KVadhh
         RPDR61xt8dLsaTt2sCPAoouVc2jGeW7Gb5AqMBi5nhwYSJp7qMoVkPSfHVUui265F+XU
         ABQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710132916; x=1710737716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r41frIqTlBqONH8VqP8QaMgMMTcjKrVSs6Fut4Tm468=;
        b=TtOpZfOvwJoamQ/zVpDv5BUGTWQQqMXeASYz4pi0l6aYp4aTmUAR6qioRmJIE4oFVc
         W25Lqhx+SCe4aZG8+xaF6k+cBds/wTlOcW4tKkpQjRUbw5NLJ9cioG4kMr6gqDigQZhy
         vFwGJUi0xbSyXemFTxLcplvfpLPbhE5+aAy78Yq/HGTPBSBq3zXrPO5kmRNfe02qRWHz
         BX5iaUWuMa3rX15PwPcm60lw4wwezmCm41R3nL2fLLCBNolbpp58WUabRE1h8RHauS+U
         MFV5UMskMJZoI8jPZDzONLTmvtEpw8/06YCicVB97/zNkpAB+CkXFxeFAQlkZFXZUeiS
         o+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXdl2jcFcHqWcD4g2k4Jm9dHlN78nTwH39snmf/mFvFkgvt7A/tXMcjjfcXDjpoJ36NXX2fhH6aBwp0ZeNKZx0iO89UMz66ia++DhxQfA==
X-Gm-Message-State: AOJu0YxUeE6yPE+LfmPtDFoK14ht2VeTMgAmX2VW+pC9smjH1WQkOj9u
	W9/SlTrSzBYVwTOgrRwEb7jhwVQxeV0jY++7jHCQaZdaWD8IacWd1nOrKmGYgOM=
X-Google-Smtp-Source: AGHT+IF/HWCYgEgxLb+dSw9tv2WuogjDy/k3Bhq0mG3MZycG67oIAghEvoLpNTZ7QO5V7KxJUIA1wg==
X-Received: by 2002:a17:902:f7ce:b0:1dc:a397:f7a5 with SMTP id h14-20020a170902f7ce00b001dca397f7a5mr4002896plw.52.1710132916337;
        Sun, 10 Mar 2024 21:55:16 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902e88c00b001dd779ea647sm3609603plg.0.2024.03.10.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 21:55:15 -0700 (PDT)
Date: Mon, 11 Mar 2024 10:25:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, cristian.marussi@arm.com,
	rafael@kernel.org, morten.rasmussen@arm.com,
	dietmar.eggemann@arm.com, lukasz.luba@arm.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-msm@vger.kernel.org, nm@ti.com
Subject: Re: [PATCH V3 2/2] cpufreq: scmi: Enable boost support
Message-ID: <20240311045513.om2dbej62kz3hex5@vireshk-i7>
References: <20240308104410.385631-1-quic_sibis@quicinc.com>
 <20240308104410.385631-3-quic_sibis@quicinc.com>
 <ZesbVW0dDd1i2F_F@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZesbVW0dDd1i2F_F@bogus>

On 08-03-24, 14:06, Sudeep Holla wrote:
> Anyways apart for those nits on the commit message, this looks good.
> 
> Reviewed-by: <viresh.kumar@linaro.org>

:)

-- 
viresh

