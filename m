Return-Path: <linux-arm-msm+bounces-34449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41399EE25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CE631C21021
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196D91AF0BE;
	Tue, 15 Oct 2024 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/+dY4uM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E320311
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000208; cv=none; b=Vma4cODydf4Jv46OpvN/H0GAZ20nwLz6COrGZGI/8BS3SMoXgHi1DJnkAyg12vaNj7v3eITSHxF15MQtHiigvl7iS3PlZwqfgJRL9PaGZncW9pOq23l2exZlDmsfmk2hFw2VP8RQVbtLXtuwqum0mCXeqDryQTW9M8tc3FNysxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000208; c=relaxed/simple;
	bh=H4nUnTC/mdAHJ8whTn4/NoSOHF5aQx8EjvAPFGyij9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY0QDmK4nOmL+uBvLhP7+H2arHsiEwODMEcfsVLJXMj277joEEt6I1QhYiTmalAY2MYNYnYqjCF4x2IpIYALyzHNQW3mEQQtqgq1XEIchO4E6U7Vh6j/5edhrshfuLoWo2HnT0cKQe/efLzil+URa4JMDBEq7+31A/yKKRgSUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/+dY4uM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f53973fdso1782962e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729000204; x=1729605004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FD0iGhVyvSNI4hIlLRLN+1/oqBE9b4I//1UiQGbWTqc=;
        b=W/+dY4uMj7JDg+lelWE516EqBEXuPjblu+Q9KXcqETw3Hu9alLTK6H5lOrYqhRcfuG
         +cZ/ViL4/2P9f80SOQZVWdooIVfU+MyWv+OJvxD/AD2CrznziPymoEO8Zn/cAQaikRFS
         9SdmGVe7uOOqKTrZh+x0JKlBP7dvbFQXB/I7QynbYkhEHXc6rB8zssYWLmphZiqCfLUO
         UHXjfg0szYfhToIG0XX+oj9qNTCMta+k/jAXvtuxdZK0OGWR0H3wPoCxq1DrSZA+IA+b
         ASLcHFJYL9en8s/ZLaXMNjzGHpB6FxLptG8P6OI8NYYHNeeNFF5gtyPV9uQvCKhr776v
         NIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000204; x=1729605004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FD0iGhVyvSNI4hIlLRLN+1/oqBE9b4I//1UiQGbWTqc=;
        b=B5CA9f78MeYvRAzvcQGEXDWJVNoPYzSjI9nPJPplbjnUFaQhgKhphlb/8m8LlAQeb8
         rLVMGdVKMY4Q5zh/7qTIwm53Y8DO0YWNA03psop6QhKaM/PtKMGHb8j2NaGpo8vz6x8r
         Bj/K/5YadSfIOlmy+8s3d303/hUGb32qFJ/GE8jGnKfyqggNXO88xNTifMzWTIGZl7IL
         EIZljems3ZYvusZ1joKIIwOCvlqcCXmXNbOrB0OVyFWlGSOLLHVpQi/+u8nQCZNo//3J
         0LgUgpjbXWf2k+dv2zMNUsTu5eykL7O/5+5v1ugiLnav5qn9VSi6Klrb5gFpKoc0iRH1
         eNPw==
X-Forwarded-Encrypted: i=1; AJvYcCVfFrLnMkEAlTu7TEGsYMmwBOnmIucN/omgoGq9Zl+NfELakaMFYqrkY0ZOEa07jNhlVTiD5O+BRHlZCuoW@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1oZBO1m8ota6357xAOiv83Wk8hr0Uo3KVtBNwzvzEgsdtm/Q
	4tQZHE2WWKDlUO4SQ/HM/SYc5FS5+JhsPCRDAJTGj+cqeLeB6woC+4iKBVO13dM=
X-Google-Smtp-Source: AGHT+IHoxE97W7pq98kCNKGan3wyUPPB4piqn0nLwlER2aqV9877/qmvV1C9BfrTXGFUKRAZTXASDQ==
X-Received: by 2002:a05:6512:2311:b0:539:f51d:8273 with SMTP id 2adb3069b0e04-53a03c8fd6emr210613e87.1.1729000203622;
        Tue, 15 Oct 2024 06:50:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa896bsm174209e87.30.2024.10.15.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:50:02 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:49:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, fekz115@gmail.com, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [RESEND PATCH v2 1/1] arm64: dts: qcom: sc7280: Add 0x81 Adreno
 speed bin
Message-ID: <jg6fkul5qxq4vcsxk4fky5h2s5mn5lpbf7sgm74ga4sbsibcrl@2evll6msgvkg>
References: <20241014194825.44406-1-danila@jiaxyga.com>
 <20241014194825.44406-2-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014194825.44406-2-danila@jiaxyga.com>

On Mon, Oct 14, 2024 at 10:48:25PM +0300, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 
> A642L (speedbin 0x81) uses index 4, so this commit sets the fourth bit
> for A642L supported opps.
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

