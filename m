Return-Path: <linux-arm-msm+bounces-49711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E09A4826E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D2E164CE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 15:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBEC25F7BD;
	Thu, 27 Feb 2025 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XkNV8E44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D325F7A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668411; cv=none; b=Qs4hN0GFzTB7rRyCDObg1wZ6EQTzOE/udUn0iMnmKh15g5Ul8V3jMtscwbUNK5bqClSB2O6vR94TEH6DvvDrhBH3XJADbqPfd8EqdlW06i9LZT971uM8MYpaNsvDTDN5nUoRbTXN9tuY1M4yUzD8fdji2F0h0w60khFIMtERxGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668411; c=relaxed/simple;
	bh=1udrqKC1/+GEKiLZEz1K9OnQVpo4M0STOjNoCVi1WDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNriBEHKT/uqezvHNy+iHqC0hc79xtuH33bDAjxcJilBF3ScCZ+FmkBEaCFKrGECHQaoBp4ElNLgVGipe4Lw3EYrcZC/zivBCIJpNldKTHk4h5CaIHU6X87hW5vjAoc0O9D+5bWEcsgGbsZXis4ybITU7glGqxrapw3hPRJfsPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XkNV8E44; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so12259571fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 07:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740668408; x=1741273208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf0guquy2kJmRTRFoq5f3uQIwNfA74nT4112GGyUx8g=;
        b=XkNV8E44l5P3sUM0FR8kTv1XZNpSZAOKs5jZQLUrSkGzDiMxApZmZW9k7b6cQAI7DB
         rnFvQKbH1pQP8MyhXjR7mgmvr7WxSG5T2zaw6mCeW2RRLGFWndi0sxGgcVW4U//qvwQu
         CO239rSyOZnvQpT2c6BMo++70KL3Ht1678A+1fFtv/kteqF8AbrOn663H0ouCcfSsBX1
         vSmGHf2yzAkPDM/NXpGYDYKbR5k3lDxGisOPnTTYuQWEJEpdfAanmQWIscEM/AfFBXqf
         qrlmPFy5qji/35h+PEUy26DCykR9TUYbbb8WV+eKL7oe/+ZNGYtwA2qpB3hcg9rOyZ0C
         I8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668408; x=1741273208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf0guquy2kJmRTRFoq5f3uQIwNfA74nT4112GGyUx8g=;
        b=RFdKnfuqrSSA+kP5Hm57qUBp8Yhde89AXtcLoWm/iS8EWU1eT9qFdNVse3LXNSpAkn
         CdOzM/PD31xgYmFWdDaKVES3S2W6v6Gpw+v72AzCuC28H1j1T8RqkfFVa/GcjiaPOoFK
         rm/MRgisCXKIeCrpgZ6sOnC8pUGS/y6biL4BYy7amFzTYY3QcGI8f7jfAUCk/r+5qOHJ
         p/yym44nEABr7g6AXWqcx51dHkIpyCGe87b6dFaic7r7tueJDVRTvCOe7MktDDsw2dn6
         6yg4mVkImoQkfUVs64ju4caApAhxQtILI9zED0NrokPmEgdGlSCK8e1t955mCDewO06o
         8cGA==
X-Gm-Message-State: AOJu0YwpMijYmsAchJaIcyT4+TUBzCzdbVnt+XZ+fSM2KfKjnTGOyhjX
	GuncTq0o3nuqTq1gzViYPaLQpGlu7MtqckTlDIesCKK9L8nu9Q4N32Yjzv4UWPg=
X-Gm-Gg: ASbGnctzJSahRaPxX0ZrYou1TxnvSaXEuYsdBYDH/S4cGoawVV2fNLZWHM3D4UNjnmF
	VTH9qQ7z8FZgCGJFFSssogHzz9+lxa/IZxZTb65xHgH9NnF5GiKnDYn7IyGn/q4tSjrbdOgPkES
	q7utDyBKzhAdWKXm78y2wIMoMeuk+N/af5E4XMfSmpCf/JVLID7GstEn4Fpk1LdfKWdHFXOWlSl
	H9UPH3F1u7xEiBREzJQm/luE1CuCV80dhJdQaPOx8Nx0p8mpxHkHmzCGmoqUjF/ZZYxF5Yn89Jk
	wnCET+qP+9eAf9gh5Dblo9/iSuLqz4YyVmP0ycc5plG6OjQlvvglLsibTXObyyaCQQtqkRBPeKy
	v141etQ==
X-Google-Smtp-Source: AGHT+IGUjggKBMb1Hh6o8thGEop2TdpTiQXVoGUQDCp92ZepD6hbnLakfFvfDGiSDs39LhULvbKvng==
X-Received: by 2002:a05:6512:1282:b0:545:22ec:8b6c with SMTP id 2adb3069b0e04-5493c5c0f14mr5043742e87.35.1740668407636;
        Thu, 27 Feb 2025 07:00:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443b1270sm184575e87.149.2025.02.27.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 07:00:07 -0800 (PST)
Date: Thu, 27 Feb 2025 17:00:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, robh@kernel.org, krzk+dt@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v8 4/5] thermal: qcom: tsens: Add support for IPQ5018
 tsens
Message-ID: <kctrauhx7xghobtnhz4u26d2i7sv7qda3qmqfwd7ik3vobnofy@whnzokvoq24m>
References: <20250227110423.8418-1-george.moussalem@outlook.com>
 <DS7PR19MB8883FE68B807D651C1AF41C39DCD2@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883FE68B807D651C1AF41C39DCD2@DS7PR19MB8883.namprd19.prod.outlook.com>

On Thu, Feb 27, 2025 at 02:56:42PM +0400, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens IP V1.0, 5 sensors of which 4 are in use and 1
> interrupt. The IP does not have a RPM, hence use init routine for
> tsens v1.0 without RPM which does not early enable.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 14 ++++++++++++++
>  drivers/thermal/qcom/tsens.c    |  3 +++
>  drivers/thermal/qcom/tsens.h    |  3 +++
>  3 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

