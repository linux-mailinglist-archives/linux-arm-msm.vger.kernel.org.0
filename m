Return-Path: <linux-arm-msm+bounces-35733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC39AEFB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:30:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D45F7283F3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AB412FB1B;
	Thu, 24 Oct 2024 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CapAVDcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F531170A2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729794649; cv=none; b=MmU9QfMa6qTkquWa91Wh7IroRMEg5Y6C1hfqFEuCk4yIOyrI7DPmpuRdRtZyREghf8t717v99uyXrymTbVG2i38KDNgf4w0MhNDsLxf13c27Z1p7rQIIPRY9jROxzkMRK4hLl7h5LKHxL5OfkZFR7ZCOw/p+PTmapiyOPQUrtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729794649; c=relaxed/simple;
	bh=yI+Y9272Bgo7aFmteeZjMbL2tyekwQZD9WYomhNosGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyt59zD+UQDMYrx2CVIdjEVGZuIdIGa2uhcYI7H8Q2STZ8ylH0a5ZyVJPqJPHc7RxTdYT3vIpYDQQlEUdzYVxaZ3H8LXHkOnyP+rdIBv6ELqRBYnNw9nu+2jV2mazV+SoyMDRVQL28kzq7XEVD2EjCLISBxczjcqNdbQfOTEbMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CapAVDcl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539ee1acb86so1450108e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729794645; x=1730399445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1/sAyVSibd5hLQyAm0VwFvDlH9FogTkRBA3XUw/H7Y=;
        b=CapAVDcldXrlwG1oPgfwNT4+8yQhjpJJHKUCrivuRl1qflYk4l3Oly3MYNUXRUaIzo
         IDmivzTgDN9/L31V0cNqXOE2qhkXF+Dwmvf/Ap3DW7kzdlyVL+dcwaP/kNLVIsrIrmKV
         FSUKK5l3Tox2m8zbvbwC7M8iWfjk3yjS06lAeb18B1qF3XIlxfrULSxktrvmw2of/KRS
         F28014xKz53Rt3CNvQooRFSk+9ma6LDkFdi3my5+zkrg8DzG7Kp/FWwlTFOCfOZCoyqb
         ldYHRN8TscE9sj09cJz3VbKOmQJlkGyOrEg7bnOkd5EyBKPG6f7ttD9FIg5Shg3m4yTw
         vYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729794645; x=1730399445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1/sAyVSibd5hLQyAm0VwFvDlH9FogTkRBA3XUw/H7Y=;
        b=YxwiZDJaC/tisPcoqjkQiukFpwApALY9TSS3rZ+iN+p1FXyKB0ZjXgmRHI8Dvxv/EM
         WTtfXFg7Ta6/jmQkrqFyDKozjBFnG0NQAe2VIbZheR9bgYrWI+L+5VvZheTQ0cE3VzP0
         CyxPCmkfF6XZVlug7g0locOOYcm9uRYdF/k0/SSMpLUAgXhlvHASH030YTndREnrHpaD
         LSMOyMsw3HxNTIdk/WFeD5BXhbxt7IdkqCmFABvyk7F40wfdLc46BTAhKVrp5LdiJnGH
         r0jp7B7+/EjeHazRV347ItQ0G9jipgXmJ04C6fzXoYWkP6xTCH1gDWLqxwAvOP9dQcJt
         z/jw==
X-Forwarded-Encrypted: i=1; AJvYcCUPjdhAXC/DwDxEW9nYns9QwWJ2qsXRJ0yKS1+Td1vKKAKkzH9lDwF6/ZYpaZy9vUCUcMxSNGAL8P+5Lh2m@vger.kernel.org
X-Gm-Message-State: AOJu0YxPcjXeUk8/MmZF+qnGG2qFCdhMzJMvZ3LILIWqsLGJFo1WTLzf
	ln/NvTl0D0hp5HHcFw15tKBd/m8vOLIhyhAFqf/t8XYdjAIQ/lThd6lAqkfjLFA=
X-Google-Smtp-Source: AGHT+IGrzoUBynCTOp+oNLSSYcxeqavz0ElVUXCpaD9ZGmZJS9xhP5O/rMH2mwesCuRuN19+XBvTWQ==
X-Received: by 2002:a05:6512:2254:b0:53b:1526:3a63 with SMTP id 2adb3069b0e04-53b1a373bd1mr4614519e87.56.1729794644786;
        Thu, 24 Oct 2024 11:30:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm1430864e87.212.2024.10.24.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:30:43 -0700 (PDT)
Date: Thu, 24 Oct 2024 21:30:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable sa8775p clock controllers
Message-ID: <amatk3cl4rayggvir732jtopirqfjzvra4dspohc3xoctonfvs@zuxbjhncu54d>
References: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>

On Thu, Oct 24, 2024 at 11:22:55PM +0530, Taniya Das wrote:
> Enable the SA8775P video, camera and display clock controllers to enable
> the video, camera and display functionalities on Qualcomm QCS9100 ride
> and ride rev3 boards.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Changes in v2:
> - Update the board names for QCS9100 [Dmitry].
> - Link to v1: https://lore.kernel.org/r/20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

