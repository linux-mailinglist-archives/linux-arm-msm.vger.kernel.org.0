Return-Path: <linux-arm-msm+bounces-33270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF99920E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6917B280C8A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23A418A933;
	Sun,  6 Oct 2024 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AB87h8JG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61618A6A9
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728244214; cv=none; b=KXeGSZvlIG6yeRA9sauAVEii5OraxteGYa49ac9/ev7YSd5Jo2m+n70ZyHNfbWvxvpBO7DW4z4gurR/+2+o+frc8XP/ThIlRlXutV33TdNM9axZscdEI7OrHMkx/V2efN7AusxeTNL6eCsXZIamc3RH6nsWxufRVrmbGyzHoSic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728244214; c=relaxed/simple;
	bh=2QuBLBXPMPIfkRsRUagmyNLwy/mxCUEgyopLjMZnsBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCg/+1vemeIUK8f2j730rr9qAWFkKTI+zedqQJghFb04spV70fcV76pb5Yf89ksbKifw9JL/GRE/oOgcSdF7EBFdbHXwLP+JBZ7ap8uoRXCfMGHGMkplaPPfhQ0z8e5LEJ0uZOnP3BVEhzTgTbvudzUzROaa3vAkB3xNB/FgXpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AB87h8JG; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398b589032so5431907e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728244211; x=1728849011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wo3MsXOntYmItcwY79ZeZqCPWJ49BLSVXvm9MYEOwKE=;
        b=AB87h8JGOsaBfyEfc761g0Yx975Z0oQ39YXeLugyz9MMn1jc1HTFWHwstM+yUuYJ0g
         e2c29Z7VmKSnRfXNk7TIuFCKf0+lhfRSY2rZIRIYmlABTyCVDL3M/mTX50EvlCiYbhxW
         5T2AZzJTeZ/0w3ssmLo1abJi4JxIINPOa/Y69xPBa2LbNVXJ7yVQsJmlcN//vdCATiv+
         Q/zvjg+h5SchVGDlnKRLkvgANxeAulMFnwMONb5Bc64g05vAqAHSUYiTj/XKIL+cAbYC
         QsxHDxGf3Vmj7WqpJ8rnmQTRjQkuwwM+RMHch+QwSLci8lNOqdjovdCldHoNUl8Yv8TK
         KJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728244211; x=1728849011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wo3MsXOntYmItcwY79ZeZqCPWJ49BLSVXvm9MYEOwKE=;
        b=YJigufwiaI9Jw9dYky5iDU/hAol4Rg1hvybXhs+fjuGUjBHoZF7iJ5kvu1XaSZ2Fb/
         QGbdehwOoJPGd4z7IQ+Tqm0L3zhYxxHs1w29dVxF/jGAktjC3qd2tlEg59s0cmtRvMJW
         N+L2T7NwItXgmXU83MSsio3HqzWlOtfIIpr2B6zqTwe3tyZNIDVbw8O/DJULQ+mSeC0K
         y6514WLoewzgKYRUC1UqNEUkIDWmAlwXII07VONtWnTkqjifG5Wa/WbS7boJCkSVFcjS
         GPKKw+GuG7Gz+D2SkrDDps97LgnhSHT+TLshwJDYBGU485HC/B2E2cS3wVjL0k6IGAjX
         4oAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjYtHCnODpAh9uBsChC5UReGWsAaqpu/rN2tfBL2K5cCL1gJuHpXc6cG6GGAWcf8C+HeILAaClKTj71czD@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNihUbI2DL7fHx0bzyqwzt1Ld35GsCww7rJK4XlTq+OIahRhI
	zvpPGnB3QbJTtH98ympcxbwCUqkfHYwd6MlO8/l8hgjo583XxKWmVJnWvdgfHT8=
X-Google-Smtp-Source: AGHT+IH223QadBX+OdWDcZysDGA1vJ8EYgW6Jh86/n+HXk7TQDRxSGWRhAtw0uGBq1XTp6GpJuM4SQ==
X-Received: by 2002:a05:6512:3989:b0:535:6925:7a82 with SMTP id 2adb3069b0e04-539ab9cf274mr6043710e87.41.1728244210966;
        Sun, 06 Oct 2024 12:50:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff232dbsm611345e87.189.2024.10.06.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:50:10 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:50:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vedang Nagar <quic_vnagar@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
Message-ID: <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>

On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
> Enable the venus node on Qualcomm sc7280. It was made disabled
> earlier to avoid bootup crash, which is fixed now with [1].

NAK, there might be other reasons to keep venus disabled, like the lack
of the vendor-signed firmware for the particular device.

> 
> [1]
> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>  1 file changed, 2 deletions(-)

-- 
With best wishes
Dmitry

