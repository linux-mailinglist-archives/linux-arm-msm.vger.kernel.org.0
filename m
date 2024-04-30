Return-Path: <linux-arm-msm+bounces-18918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D22178B6F18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D24A2823F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4D51292E6;
	Tue, 30 Apr 2024 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8/0UXeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AD1292D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 10:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714471616; cv=none; b=Myqdn6KMOQYx6kbKDcOo47kCo7Wo62CloL17/B3KBT5ZPhM5V2kY+2AKw75MP3akp2MtSii38l9dhVjrMfGchavAyUejxtIzxZfJ4s8zSK2v+98pYZgE3zSWTKSAUG1/LfpRxM3n8deGuB8YZE0QjMJy/zWJn8XSIO67JYYZc2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714471616; c=relaxed/simple;
	bh=axteUmH6ZxwjdcX+M+kFgVq2+FpkI3vjfHuuHBVqfQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cR2vxQBjqsYKREAkwXi1B19V7iiAM1r/Cm8uejzmt9r1fYYK4DMmLF6edWTrLL+ffwdzbLoVWptrSkeDsGUUWa10QDwACJSZdxeoC1CWoctrwX1YAoxi5r0PTd/taNb0MSJ/n68YusR6tx2+//L888hKb1AZwU7Pw8IULJ1THI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8/0UXeA; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso4576386276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 03:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471614; x=1715076414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MlCHLOgPqDRLXHqKx+3SitAREHYVUHF6/1Vu/GrVjUI=;
        b=P8/0UXeAedpFngzpVva+dG/ekjEUqzLQDewZ0IiVBKfmBKncpwLUfE33/AkDd+uw/+
         rl17QyBkW0FzgeYj9Zk3iahtPUksRKaDbWzv+2DmbN1fj0MwMz5CywUAQcxXUzELzxyR
         Ptvi90SAMjlsa86Ddx3jHptpnVE0vRt4eiJHerD+j5YzgAb95uv9y9thRhNOckWumegb
         yHow4df75bRryeYg08PaMEQynGF6Keck1gGb7OFWKk8kl1JW0n0zqw0ukDpQf9iEBz8w
         6fyWHutJA37DrmU6cMYuq/JjxN+Kd8OlyW0g8TX9h7kA2QN3ZA1gG/9ANYClcpa2bkOr
         becQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471614; x=1715076414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlCHLOgPqDRLXHqKx+3SitAREHYVUHF6/1Vu/GrVjUI=;
        b=iMOM8gx67s5rDIo8tNCJ7ByAgDDSIPfp3qthEY1jIpT8TaoxUkC+QPJLNnY5Unv7zU
         saZe06X+M6+S4jAxYdA7yAbxcuUgIiYuilS1WEWNexQcmwh27OMAY53EN4aJsKnwHLP6
         HA/qXjGqdPyBHHYRRl1g7Wj4N4X+zYq2S8O9pRdlzhGrsQb872Eij2pvCpY70OECbK/o
         z0cZOP5kNM/+XE4GHKge1sQRgO3BEVPEdF/7R4Qlddr7RAbDdL4SlKJ8cS8MGelDXLwE
         0CWQEnnpJrf96RgL7t57HDOQupGAkszpQwOrE/2y/ESxS+YLcUlFtbzzQz/DlKyST7oF
         Fvqg==
X-Forwarded-Encrypted: i=1; AJvYcCVMwNDEahREW3QqxZg3dR3ukrR+E70/qn3xs0SlckicHAssaI71OYle2NNLaYimXHGiNc99/LlIWW0KofWy6aYMX3qjecjOvIvJaHO4XQ==
X-Gm-Message-State: AOJu0YyDAdxvWX7fjPPhw0E9PQzDVQadntHyiaUsdoSK8YoTXeWY30hn
	SW4hWQvl6wQkvPIut7hr/QHKc+4za+TSikqJs/ozgJ1AEB66xVh5qh/jc6cgEDyCtFB2jiyUkxH
	5Sjfyi9P1SA/6k3DPhIKNbqD3UccF/juXCr6DbQ==
X-Google-Smtp-Source: AGHT+IHoP+iVd7qlwAFzYWTdougtImUWdhZLRa6FuX18dZxDNxyUVqYihujO3viQd+oKo5o++hiv2iH4hzQQlPWUCcM=
X-Received: by 2002:a05:6902:cc2:b0:de6:a86c:b84e with SMTP id
 cq2-20020a0569020cc200b00de6a86cb84emr248624ybb.16.1714471614593; Tue, 30 Apr
 2024 03:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
 <20240429-usb-link-dtsi-v1-11-87c341b55cdf@linaro.org> <a35c0e9f-9f1f-44ea-8248-cc632c6db291@linaro.org>
In-Reply-To: <a35c0e9f-9f1f-44ea-8248-cc632c6db291@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Apr 2024 13:06:43 +0300
Message-ID: <CAA8EJppK0YPqQXGmQdZrrkTz-mf5h-vOsoak1p0fSMWLKDuovQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] arm64: dts: qcom: delete wrong usb-role-switch properties
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 12:34, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 29.04.2024 2:43 PM, Dmitry Baryshkov wrote:
> > The usb-role-switch property doesn't make sense for the USB hosts which
> > are fixed to either host or peripheral USB data mode. Delete
> > usb-role-switch property being present in SoC dtsi.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> I'm more than sure all of these devices are physically capapable of
> doing both modes, but the infra to switch modes / provide VBUS as
> host was / is not hooked up or present yet

Yes. So it makes sense to add the usb-role-switch property if/when the
board gains dr_mode = 'otg' support.


-- 
With best wishes
Dmitry

