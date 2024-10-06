Return-Path: <linux-arm-msm+bounces-33275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176699210A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 326231F213CD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603CA18A95B;
	Sun,  6 Oct 2024 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ym7gB86w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290318A928
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728245342; cv=none; b=HoyCYPUM06b+OitWI9pIwCTILkBk9qpkwSxmdf+O22IBkxYBabMrU/J/HFJUqv+PMtUsSwiFj16hMQ0VqYZ6T4OteeBREPrhYnp+kbdr1Gl/odK1AkqX0vPw9ag1WOiC/+ShOArrnm+NzpnGrzezxThTKS0vAQMFdCywKieR6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728245342; c=relaxed/simple;
	bh=9xGDpi/jA95ojqNc9c3wQkAfuzmzm+dGXz6YwpBqnhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGuvXAG1pX8yBFPmHyV9NqUAK7uZO5kKHays3nIizv5yA01pKrljRALrWMRglFSBJtMDw7iObx5tJYFJnGn9xDA1CMKY/VBI1xEEpWjd5KBatQUs0c/WGPJpZ+Tobem3wxOzT4TYnsPB88g6Asr3nPwJbyf5etTiSoeNN4yCGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ym7gB86w; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso37935031fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728245339; x=1728850139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1CNIHOt8fvcwETMUAw0ufzYaZKbLYWoq5arc8dbVRfg=;
        b=Ym7gB86w5MXrtMLyaDAGw+upAcxgLYxAPhcqWqMLvZ087kJUjUMXhBfldPBqNKkUtf
         r1Swb459MBr+6NsfowzZ6NXX2E9kUZ0tRYJAMeEWAHijrDdlb1ayRrhyevMrnLZnJbwW
         yqXXxan8JTwPJ2YXoVPzcgHjYXsBrWBKMi8Nmcmtf79BmksV1WrD7jo5Qa3TgMozwyoW
         hPHWY8+EzxA4iHYr08y3O/8fYU/Q5wRgzQ6CuYQbb2fEf2fWg18ucGJgIO906oKCJxk/
         zNyiS9EVf5GBQJzFrQUdbFemLv2rF/XNjlLQcO6jNF2FFwF6w8pHyI6wOKH0+poNYdcJ
         c1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728245339; x=1728850139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CNIHOt8fvcwETMUAw0ufzYaZKbLYWoq5arc8dbVRfg=;
        b=am0dnSx9IOqkRVYz5q5dH5nnWfp9cKD/1njx/MiCGXvgA0pS/vKeaeecFXNOCRYdvK
         QQacx5PVXEnwIBK4WOkLxhaAJRStQ8GbY3b8sNJX47PWj978+7J17H4QiXsh7fkS8Taf
         Dbr3Ce/fzdGpYbEDrwoI3VgwIcDl1mzhDmWmSFZnridiMFwYFr6LV07nh+n+YRMwGvsp
         LcxIE9Lv3Q65VbmyF5DF8ENQ6jyFLeaT1wFnp1o4drP7LjeLYdsAzjQVYvKPmAZcnomq
         DbR3488PsYBC0asAGKLelDiinpWx3/cYLN768kBDZlbU2yoh9xMsZ9Gx+v4MD+/3O3zC
         Wuwg==
X-Forwarded-Encrypted: i=1; AJvYcCXON1IaoqDewaERAOSjFEVJ6J3o3Kd8trNviJ8zme+pMQMFs1pd1UkyPUERUQGyhnmxJNr/Qyvb9Q8pQgdD@vger.kernel.org
X-Gm-Message-State: AOJu0YyNP8ifcMHd3WmENUCwn5nOxh5sFwRYa9jqF+qQqEDTtT5Bnvao
	Ky0bxIXElrpUfBlJIHuaf0lGctcEkAF0sW9pqePckm+912kBmQ2+nJs6imXt9xM=
X-Google-Smtp-Source: AGHT+IF6OTa70sIjp7tcQGOntDCvvftTUjqZUMbgta3o2jm6LLM0vAoPx5aZuA/nwzvRdyDNRSh4eA==
X-Received: by 2002:a2e:bc28:0:b0:2fa:c387:745b with SMTP id 38308e7fff4ca-2faf3c64c28mr37712301fa.31.1728245338878;
        Sun, 06 Oct 2024 13:08:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9adcb37sm5870681fa.60.2024.10.06.13.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:08:58 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:08:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: stable@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: qcom: sm8250: switch UFS QMP PHY to
 new style of bindings"
Message-ID: <ebbksal6u5kkvywrlq4d7f7vjntfjvjtfbrtmt3roj77dr2gg5@nzocu3q5har5>
References: <20241003143532.108444-1-sumit.semwal@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003143532.108444-1-sumit.semwal@linaro.org>

On Thu, Oct 03, 2024 at 08:05:32PM GMT, Sumit Semwal wrote:
> This reverts commit cf9c7b34b90b622254b236a9a43737b6059a1c14.
> 
> This commit breaks UFS on RB5 in the 6.1 LTS kernels. The original patch
> author suggests that this is not a stable kernel patch, hence reverting
> it.
> 
> This was reported during testing with 6.1.103 / 5.15.165 LTS kernels
> merged in the respective Android Common Kernel branches.
> 
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

As an important note, this patch is targeting stable kernels, not the
main tree.

-- 
With best wishes
Dmitry

