Return-Path: <linux-arm-msm+bounces-24857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8B891EEE6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8778C1F22732
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 06:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EDC7E574;
	Tue,  2 Jul 2024 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2N1lwNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CA976F17
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901469; cv=none; b=KHh4Ri4EoxURb4KBt/CMJjYeuWkl/3J68wK5YSollHxV5b72yt8wJDkYuy2Sf1Uh8ZkB0Z0uM0A4UYY5b3S1mHf4bSNS5bRg45+ccU82P4sWBXRik8gG5RObpRpGWCP7yofHBdISMP2sVew6r8rOpFvyfnS9ii9J2EPQ6zKLOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901469; c=relaxed/simple;
	bh=InAhoUN8tcseJPMHm9g66x74qz1q4L1w7tnrp4q2JsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7WypD7XdDjUJ/0DlAjDX84h1E5XE1xMnerBNJNmBrVk339wbl2TQhcK2poJErQnIKUG5oQeIOUbtumYt531Bxk0Bkztwqihnm9NrhnGSYmvGiO72XrXinIP6YOf3z5CyivroE0MiFdJImAX2qqfn4D6bifNRQT8uHshYW4oLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2N1lwNs; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so6147632e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 23:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719901465; x=1720506265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDo5IygLtEAB+cPD4fX0+9qX3XWf/HFh9CkZqeTvO3k=;
        b=b2N1lwNsdAc6F2kYGz5Kme/belkl+xxHosId+dCCZfnbeqzjBc5HNCZUelmLQMT/hS
         Ni40G36hsDBEQsn14C6iT/HJeEgbDM9YwVzNQpiQQAAEtHTSsXw4xjPc+SnU4QhSWk+q
         O1N6oWY3pQy9dTzCJxNNhzQccafc9BnvMncJHc8RYVDWRRG+qJS9FuWEqft1AvRSIuJ9
         2Eqp6iYm3b60mwYZn+rqnGPE3jPP2b9nkZqYNOwJrwgXBJpazOj1PobvOCtpL5h4dgii
         /ouHcvqwcpwc6WCZk/WOATRb/QhvblBirL75SrLr1uylXOj5tG1toDo/VkyGmofKnaGn
         ER6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719901465; x=1720506265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDo5IygLtEAB+cPD4fX0+9qX3XWf/HFh9CkZqeTvO3k=;
        b=Mi3K0e6JadyAn5guz70JrknVo7/jaD+tl7ID0d21UCp8ians/YhNkHaGAwBe2H7KjM
         Yuv1FhZ5UiV9wruzlyckoRpg+XzhlQgx2gupKn56MhLWWnHbfaEfrJ/fTNESqy6cLcxF
         4VAGOuzACS5LT5S44Q6ylBpSEafkv2uN1AL0d4MQazBdTHIhyvCNDVaf9Jpv64pBKDjQ
         EWBXEUkGcv4IEmjC6n80eDUMRXA60/RcnTLXNxrjEfF+SymEyaC/t5E2vWji8Krw7qwi
         BOpnkmmt3JvFFtqooMzgnMDGJbqGbS/oBsljFtqcso8ygJ47UK3i+bJmxvRbNdGIamfj
         oaNA==
X-Forwarded-Encrypted: i=1; AJvYcCVf/sjRh2tbv1gPPLLkA2NlxfZ8shCDNZ8QpUrDMi0/mM4X8dmZ+/8lGQ54wQNBqIAA0URSuxRCgNcjdbqpfGtKLi3wKtEvWlrehhq1Lg==
X-Gm-Message-State: AOJu0YyrsLDXnORaaqRrXsUC3h5HvLNAVg8fufW55GlB+elbrkg3Mray
	sDrbyG8E98jry+QgOKZzFlGo0GoVR5LWOUegFRf1V3HY9JGeiLva5AUBizxJCVw=
X-Google-Smtp-Source: AGHT+IF75P/sOWPMtLxALLKSe++8Cf/2bVEGI3L9gmOs0TCyDPgWQ2uHOuklB9AeLyumfAx+WoRHcQ==
X-Received: by 2002:a05:6512:10d0:b0:52c:ab83:d783 with SMTP id 2adb3069b0e04-52e8264c68emr4508470e87.6.1719901465067;
        Mon, 01 Jul 2024 23:24:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b840sm1665664e87.11.2024.07.01.23.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:24:24 -0700 (PDT)
Date: Tue, 2 Jul 2024 09:24:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dang Huynh <danct12@riseup.net>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qrb4210-rb2: Correct max current
 draw for VBUS
Message-ID: <ql24nvbdqfzhtogocmsh2xm2wkjfddfcvoxnzbzvjgcucy7gyz@hqgvr4oul7pb>
References: <20240702-qrd4210rb2-vbus-volt-v3-1-fbd24661eec4@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702-qrd4210rb2-vbus-volt-v3-1-fbd24661eec4@riseup.net>

On Tue, Jul 02, 2024 at 01:01:19PM GMT, Dang Huynh wrote:
> According to downstream sources, maximum current for PMI632 VBUS
> is 1A.
> 
> Taken from msm-4.19 (631561973a034e46ccacd0e53ef65d13a40d87a4)
> Line 685-687 in drivers/power/supply/qcom/qpnp-smb5.c
> 
> Fixes: a06a2f12f9e2 ("arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling")
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
> In previous patch series, there's a suggestion to correct maximum
> current for PMI632 VBUS.
> 
> Unfortunately it didn't make it and probably forgotten.
> 
> Link to the suggestion mentioned:
> https://lore.kernel.org/linux-arm-msm/CYMDEAJZ0TJK.K31XZB3E9QOG@fairphone.com/
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ----
> Changes in v3:
> - Fixed wrong usage of electrical units.
> - Link to v2: https://lore.kernel.org/r/20240701-qrd4210rb2-vbus-volt-v2-1-b7bcd2a78c8b@riseup.net
> 
> Changes in v2:
> - Fixed typo (voltage -> ampere)
> - Link to v1: https://lore.kernel.org/r/20240701-qrd4210rb2-vbus-volt-v1-1-5c06f8358436@riseup.net
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

