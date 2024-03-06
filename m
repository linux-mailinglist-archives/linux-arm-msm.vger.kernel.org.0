Return-Path: <linux-arm-msm+bounces-13534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 522DB874073
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E76761F24A89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A97A13F00C;
	Wed,  6 Mar 2024 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hP/X1F1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD513F010
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709753678; cv=none; b=WY+hlMdfrmH4sBfPLtI3QEN7CLSh0MeD5OYFRnLUkbV6B6bbguKnlk9dD34yLZiDPoN3pTPyTA6y6zZ8phQMsFgzKaVViMO7j4/CaB4iMX+Iduw/PaSwSdpYWV4Mnw3eWzRJfnQHoKpxICMujHIcO0B/3R2/Z1Y8qQE3oFgANtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709753678; c=relaxed/simple;
	bh=GPl4f9lkb9zfcnX1eSvWK+7OEpHSENA0ItGNLyBGujs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edH+jtS7v1iQPzmefz/5+YDSCnkdqTAFsINEZh9sOqO7i8LS8TdTpB8xji07icUQ3ScXf5XWpwzTgx347+gwJ70YjofqnKyPvdey6jyz5NqSLOv0tGDdd9GUj1mofK/maAwt7uDz9ZV9tsBeBuPIwrF1XrEcsj/KLGIPqhR5q5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hP/X1F1E; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60943ad307fso1082667b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709753675; x=1710358475; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=691+S3DdWk+L0K/JU/znAwv1QVBesVwE/4bn6nlDzxc=;
        b=hP/X1F1Ex/22E2USdubYniRf8BuMzaCcBZAP97njsPWN6akgZ4s0kO2oB76IfGfxxW
         mfLMJA0FVtrmhlgL44EjIl8WjMsaTB6sdPFPX0Mx4QCtx1pRnPNj3JicYiQBs1OPA0Nm
         iWtaiJC7+fHYVfSIvwdKLaWJ61wmM3RvQ0MUn5+fha0SsaIzHhulcjs0B47wyaSS98za
         eEsRNxfHaG4Ahu9AZ0aIAeYc94W1WclfgzmNxDHOLqxLeTP9IDf57Y/WNt+mf4V4nRo/
         BdWHyVk+j1G6w0Tbwpi9/k/s3yMZosK7wFClEytI5/TYT8R1OQikr94eR7cuyEXk9Mkr
         jyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709753675; x=1710358475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=691+S3DdWk+L0K/JU/znAwv1QVBesVwE/4bn6nlDzxc=;
        b=UEz5YDghbBsI14N3HPoQLRjBlzx66gQIT8nSza7kAzgk7NxGdEC+lldT9htejtHiQN
         WypomWqiornhvjk/acLUW6SUDWmrR1HqfJmF7f6KMTVc3P9Sew5/IdTISy14C/V/YzOo
         hKUXwTVwrNeJl7oPYx9Ne1JEUvv3wK29e7/5a1T3ngfCgP+RiO9ZmCuHugoIskeSnOnx
         mBQyXvBMrCneQ5Cn1lzM9glcNRrpJnw2lA/q/EczG2bR3TShJfxMqrhQ8qP1ZnMKslT6
         1EvvQYKCf4VOLz763PxZBc8rmctEYfc9mkMCLqWA20o1stUlNyU7Q+OigqYQPNqusM2N
         qH4w==
X-Forwarded-Encrypted: i=1; AJvYcCVk6ZryGvhutzWt84EO3Ic9Ho0mZKQAmAb9+4xgz5+uAcqdOe/LpM2poRfoWI6PmWOoWkFv1CYKD007Man1iTb1qbeLjCJtuVfwxK0+hA==
X-Gm-Message-State: AOJu0YzkSFEwEQIMEkw7EQELIoUjIo9ckodTthjN8TcAkFpoZaw0h4oZ
	q5AEYq7bgrvmMlE2j9Wasd7sDusbru6zHp8nycwUAKPmvKJYXknNXkEzkTQVSkLMcV/Ddr6rmNp
	EUJuN1WKfwPhOUFb2sPJvAENfjVLVp8WLQLGeJQ==
X-Google-Smtp-Source: AGHT+IGfu6v6iBASHmlnOcH0IML4GeYFVxrMhaEGg0cT57WTqCMrmKobsugqpKnztn7XphhO9id/EyH2W0TGTFiCjtU=
X-Received: by 2002:a25:ce8c:0:b0:dcf:fecd:7d3c with SMTP id
 x134-20020a25ce8c000000b00dcffecd7d3cmr13047837ybe.46.1709753674996; Wed, 06
 Mar 2024 11:34:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpreeGWfstEKEFiHM_RJCZbYYdo0H=fY0GqPPtZM-7ZUhA@mail.gmail.com>
 <20240306153610.1289999-1-amadeus@jmu.edu.cn>
In-Reply-To: <20240306153610.1289999-1-amadeus@jmu.edu.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:34:23 +0200
Message-ID: <CAA8EJpoghqa5r2vc5XXdfVJy1WDBysXs4LdMybgdgqMTcEPDfA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 17:36, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi, Dmitry
> > How is it "some"? You are enabling this opp for all IPQ6000 SoC instances.
>
> This is not the case, please see `opp-supported-hw = <0x4>;`.
> Also: https://github.com/torvalds/linux/blob/master/drivers/cpufreq/qcom-cpufreq-nvmem.c#L345
> This 1.2GHz Frequency only takes effect when BIT(2) exists.
> For fused 1.5GHz devices, the 1.2GHz frequency will not appear.
> I have tested this patch on both fused 1.2GHz and 1.5GHz devices.

I did before writing the comment. You have the only IPQ6000 case, it
sets  drv->versions = IPQ6000_VERSION = BIT(2) = 0x4. So, as I said,
you are enabling this for all IPQ6000 SoC versions, unless I miss
something.

-- 
With best wishes
Dmitry

