Return-Path: <linux-arm-msm+bounces-12974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3986CAC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52AD3285685
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BD912C524;
	Thu, 29 Feb 2024 13:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+lwSG5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768D12AACE
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709215018; cv=none; b=g5msSi6s/LmY7J9JNC8M+oG9jBrirPRs9npcKFOFDEyUt697EHDb+VaMXf/1jkZm2jdrb1Jus6L07yeVFjkmRJCmeIo9QduWFyeCqawh21vrSZgQWuO0DE1kfka7ITF4foQOZtY1VRxSn83DqrNLZMNO4rTGzyPUDkTb9tKrJG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709215018; c=relaxed/simple;
	bh=Wws5urlY/pHKb5nO9L6+YF0fIvf4wojKA9CEm5jbQIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mD9b/ThBA88BDdmqqFpXRtlGpusKFqznnIpeBqMF0P1B+Rd+KGGqNj29VPUeFX4QSZDHTGKk8ErBu9zoQJylD3GEqoAEpM7tFCZP03DNX4zWVylVEJLOHZH0bIeyROpe39ulD8EM0TmSHH0WfrPU7YB4pTOMEEhyM9Y1WJGawZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f+lwSG5j; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so980503276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709215015; x=1709819815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wws5urlY/pHKb5nO9L6+YF0fIvf4wojKA9CEm5jbQIw=;
        b=f+lwSG5jcLV6Jvh2VptIWbckKIq4g3bVLGsCTxwAmoB4r9wOm0qjHxsBW5YQHXD5Fq
         8MeswxbOLPdHna7vbcMjOQRo6PSium9RcWJbQp/Y0M9FKZE92sK5AzeAwUrxsh+vWq5C
         ejHf99vyHKL2EbnEfZoZnwyS3Jr9mbDFW0Fol20KdUfO6DXeN8sKENFGPsAq+JQsJV3e
         D1QfAL2pGW0tQSzTvnuHeTNs9CzRo6+I937nDNiizWP1bXE0Jp2uGNwa1X+z2T0yQDtF
         CwjAIJTFYiEgrQV+W2IV3DGoBqyBkxYMDkCollRyzlpuS744issI97QqwK64PAaagcqX
         7U5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709215015; x=1709819815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wws5urlY/pHKb5nO9L6+YF0fIvf4wojKA9CEm5jbQIw=;
        b=XDTnwa4D6lsDke802P53TImhl6EAoQN7LivvNG0TvrrGgzWXydhqlLzrKIpeHXv81C
         GY8eb3do9XnaV8xhDT3ZCbrebjdM+gS4AQZA7naY9ZYh082abrjCl27O+Q7o9/tfniXz
         FGZIltm8OqntSLxe3TewXUCr9UHq6CQvefDhGZXzhK1TSp4zIRdepZ0P2agS4RxEJK/X
         76elg2G2JHdaXm1EbGLJpsXofOSjc5yrYfsRKwvo0eSBc2AXpxlUeLJ6o+2iQjmRD/NC
         mdqy5sLp22duaBURkkKDuvKhYnofuNAt2Ft8oEcKJBg93VdMaavivv05M9XPm7os8bZ9
         jaRA==
X-Forwarded-Encrypted: i=1; AJvYcCVEzh+fHWx3fdmodAXUsHnP4CsVV/PNEvhDDIN+l+1FpOiErGvd6rwmL1ArZ6IVP7t/237FB/hdP8rmHqFer69iw61Q+ojoioIK7cwK1g==
X-Gm-Message-State: AOJu0Yy2tzvLDd5VHEJNbZEHFI/8JQJA+mmf51cYl7f9/T1hXqbEJNuf
	Yehz/JU6zsogYRapZMwYqtoQeemj6OfpR7oHkGs57hhlVD5rj9Hcn7Vqd8ZELdGb4baiC4EFHKn
	2DW3Qo2Lix0OX/9T9BcZ6pQtGAD3D9xufL2W70g==
X-Google-Smtp-Source: AGHT+IGyYyjopk2S0BDW1Ghoa/7hBgl0rLX3ecHmVYFRGAMgeBOBqeibeDjXXuQsuPB0jGCrausTn0ucexpYoda4cP0=
X-Received: by 2002:a25:8249:0:b0:dc6:bcb3:5d8e with SMTP id
 d9-20020a258249000000b00dc6bcb35d8emr2335878ybn.20.1709215015418; Thu, 29 Feb
 2024 05:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227155308.18395-1-quic_mojha@quicinc.com> <20240227155308.18395-6-quic_mojha@quicinc.com>
In-Reply-To: <20240227155308.18395-6-quic_mojha@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:56:44 +0100
Message-ID: <CACRpkdaqf8niLVfT7i-x6gVda2nwy1A6akEEq+rYz+cEpg0DzQ@mail.gmail.com>
Subject: Re: [PATCH v12 5/9] pinctrl: qcom: Use qcom_scm_io_rmw() function
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 4:53=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> Use qcom_scm_io_rmw() exported function in pinctrl-msm
> driver.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> @Linus.Walleij,
>
> I have removed your Ack on this patch after your comment
> on https://lore.kernel.org/lkml/CACRpkdbnj3W3k=3DsnTx3iadHWU+RNv9GY4B3O4K=
0hu8TY+DrK=3DQ@mail.gmail.com/
>
> If you agree on the current solution, please ack this again.

It's fine, I trust you guys mostly :)
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

