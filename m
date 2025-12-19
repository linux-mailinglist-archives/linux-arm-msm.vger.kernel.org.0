Return-Path: <linux-arm-msm+bounces-85777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E7CCE8A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 06:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3A873035276
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8132BE02C;
	Fri, 19 Dec 2025 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs9p6BI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C079238C07
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122524; cv=none; b=Dp677ZTMRwRKZDCEP63BE26vaWcX5Nrfm0GwzDu9XVsjZVOlIJ0f+dRLwxJv8QKh6F1r0AELarPdnp+i1YhsYeCjKYJglIgdZ6hxTemGhzFiO1k7l+1YyJ3R+4BA28AQIJi82drTHj0Apeo237sBxnSsdM+EBcZa4r8CjRrJJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122524; c=relaxed/simple;
	bh=ZhvazSte91iU+jx4QdnhFUqokDPmeF886UFAsqdeOG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX0rtBhVlp56/ZgNgMX6JhK7fzCdEGFpi8Vj6InA1nwHzvFxRRk8QKDr/HR28Hs56FLee/dEibmxcDTFG8/LPQ8UzoCAHQz3O7jL3t8zynP9rOAVYXiheQ9FMj6TsWZ3NZKqNANDibkGbyf4w7h9gwnD+Fc50h7/zTbWfmBV74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs9p6BI7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0bb2f093aso14233685ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122523; x=1766727323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=bs9p6BI7bmrcIORWo/ouvVkwMR2MJQw79BRm4iUgC8T1NeTqSeo+SIADqNiNXFRdBy
         xpFumRz9sK7PWNGUEHAGHUx7DUyiU79cCqzGvukkli+WKMq08QlsDDf4E/uoWwMsoibF
         y/OxEkomcR0WUXCfg7uCZ0RiR2knOXmgWWBzqtRaU2AOYYSCHWQT85fZFxbFuu5ICWmo
         GTHlHqXNFPE7lseUwS7pbfyIcSDCu2NQduswrqexxUVDYQ6JrJCxzQc13bW8WIsTbgig
         fSiCHh5BHSWQwvBsZoHuaPDFJxCfEOJxCVSyTZUpR4LN+QGxXyrL7fPpfDqBj64gCmSn
         e9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122523; x=1766727323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMTTCuooxMDzb9iO4B2W3oktqAuVxYafRzDCiEnReDQ=;
        b=wgxckldTsJ2pRYt2zqO4agc9PNGp/sgzDMHjcGf80WJk2WeUpsHPk95xZLtn1IcmwY
         8gf1OMYVSOq3A/Mbn8nV5mu2NGiW8o7rJsNO069gip+oNYaJACyWy5wwypklbwCp/+x9
         CdxNUexPKcHcURWIESM3Vb3uFUj3U3IIkI/nAUiu4ylnntYrkHfgS7mfQzYv1l6FpqJP
         NLwHaQUIPvjdaoj1eHHSCLbYsZAzlSdQ4TP8DlDerQrNSudYmeOKgF96xJdliCm50s3K
         8T8KxWLjodG879mKa86ZHcnGcTAozburuDhNg6cpAEA7ajp1uZcQot8pknVowH2EJMhR
         fiQw==
X-Forwarded-Encrypted: i=1; AJvYcCW2XLzVaYOO4OipKvC2Lh8hiKC5hEhCgzDmvv97SkX/LMGpAyAuYetPmDP9OJF8sxfkILQXC9WqTxf8ZSh6@vger.kernel.org
X-Gm-Message-State: AOJu0YzQePy6Xj2alJFp6/yShphpcj8BXwONplL7DhsZllMUMQA/Je0g
	6R7eamJIpwEV128OWRLlrhZEbtolHnolldUQ79Rw+XPD4opHjoJUT/UT
X-Gm-Gg: AY/fxX5ryYC0XTGGM4jEu4WAtjyQDro0wg5OY4CWGRmXsV1h5GBM+BLTdARBCpsro/E
	ijtnk8c7TGjc2hnfoAfIUOViMAAd/y4B8ZlyKNah9/AbVMva7+H8Z2dNbTMRvpsX/xU9TiUuo+3
	yvXPx831e4S/QbjlZS11TRdUR2s215wMkqzZLz3LYrxq99Wr9UOz3YyfKyq2O4gFTomIBhfdwrZ
	eEQWfUI4hcr81FxG9IBIiWHwG5hL1ODiIVvWAXSZ+37E75FbGAViVyX5t+kNgOvw5rqvdx8UusN
	1xaQnXPRar4qiJzlYEUMJQEOj+hF2qHhq1wggQCC2PPD5bKsiIxdc72zEbT8hhUN5p+ias91Rro
	KoX0VYQrbxsV29Vmet37GiW6I6/L1ikEOdLQPDKBB3ZVVGAvzSiAUm7Z3rpCEEsn5v+wLcQb1JG
	zzSxxA+JqhncbGD8NZYYU48aaGbhpFtYvSE/3YUE+X5GQxN2pUVDEIjdfrB5C2/hc=
X-Google-Smtp-Source: AGHT+IEckbGoyBwvIpN7+hsyYKZeqS+PjBBpgEAIEIby7FqmlE1JAmvvNFeTVYuKm8/epNSNg9/pVA==
X-Received: by 2002:a05:7023:d03:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-121722ab330mr2043333c88.15.1766122522555;
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm4998600c88.0.2025.12.18.21.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:35:22 -0800 (PST)
Date: Thu, 18 Dec 2025 21:35:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH v8 1/2] Input: add ABS_SND_PROFILE
Message-ID: <ipazh76ewhshd3rtgjr4oz45zaqqmsqfdstu6nbxo3ctrd2x7k@wpd3tyywk5ay>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
 <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>

On Thu, Nov 13, 2025 at 05:02:58PM +0100, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> ABS_SND_PROFILE used to describe the state of a multi-value sound profile
> switch. This will be used for the alert-slider on OnePlus phones or other
> phones.
> 
> Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
> to input-event-codes.h so they can be used from DTS.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
> Reviewed-by: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

