Return-Path: <linux-arm-msm+bounces-37250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAF9C0830
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 14:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708661F222D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B3620F5AA;
	Thu,  7 Nov 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="btMjS0Hj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9972114
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987716; cv=none; b=GV7YC76n6qkwot022CFZ8/n73fdypnBWt0+q15SESBBTgYC1YdQmzi8B2IQeHfL3h3FgYs2R1AT41OoO/LdVDAIzx2cT6cLDaJzPg3UydeujU2HTQnFUcKoi21030+f0S5O4q8lzZRGi2TauXhIyopy/RTPf+zxSq1DlJk8w9B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987716; c=relaxed/simple;
	bh=pAUOPbJ3bRm/k22zy5CUSLWAw1T4ExN+FFkWUH7eKiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duRSLcP5dID+lJQx6NfOomtsgRJR82Q7RPar14pk3yfSft0vmN1tEpPbtYu1dnJSSGyu0Kug+4htYHYy+WH0gkqu8gNGPe8K3dhogDhT+wXCciMIWrt2ELgYclss2YuKUFPMxWh9vxDSmqhThzj9AT/nTREGduIfVzMGeOlEETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=btMjS0Hj; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5743074bso8498841fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 05:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730987713; x=1731592513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAUOPbJ3bRm/k22zy5CUSLWAw1T4ExN+FFkWUH7eKiU=;
        b=btMjS0HjxZAeXGEnGFOLLBgYUAUYl3vocHmgJNkxSx6m8HlrYxFz7snxjclNc+BXsx
         iwv9eI+zya32tSGIZl/8K4i2iNaB2rB1OiEPJj9167zIHteN3OEt03gsdpTRGxusqWiw
         dfUITdPUQrrwy+PPt75ENkehrlSOfH0DRTC6Q02XCy67QZEOSDCcPrelC7YYlsIY/yg8
         8NZwzl7+6Vxrk5rBvl7dOyEVVA0n68cxsJfadQQtnrTATla+RwB8t23031rgRiendQki
         pkJXyhYCPCFfXtWaSUfURXo31nvy9Y6f+bXtCJZa6/MQ0HIKEY2Wkw7HLR7Ae6qCXKk4
         277g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730987713; x=1731592513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAUOPbJ3bRm/k22zy5CUSLWAw1T4ExN+FFkWUH7eKiU=;
        b=haBhCuEVe5qr9tdGLdC5s5RfdenO1Nte6j8xTEdXAGMelNiYHZuE0HcZMa8QTqf1Vv
         OsMDg7CN/KTibi1X0sJg4VY0TK95w0mk/FdGBlwvaBagX4CoyFeN3ZR6/PWQyB52owaB
         xUVkDlrwXBiGdBw8OnQkqg6LyVQZJn19bY2Fv0Qz8476lhtQ/kYGov8VoGXImLe1DzHC
         CxjYXXDrtph/01y8CwtvqrFlzSu+eZPoVctPPU3iPl0uqVqoUAza5hxrF7DCPtTk4DY1
         ucagxSaYOJJ2mCIE+u27hnOvC7yqpQmJMq9M08sABkNJkz3Q7QAkHjCDRU6icAHvZqsK
         RAwg==
X-Forwarded-Encrypted: i=1; AJvYcCV9ALCphXZ1lFjFDGQZ6N9LWJ5kQO247YzBJsA26h4GMYU4EsfRMvXhrKzSanSm+wZ58KInKGUipvpBvF5/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ZJOqxHwya9DJTBzxTqxFQ7HTsIB8+sU92ZcuG7UGn9WZ3guH
	ZaJPZhA4Pp5nO2KGZhLuppvmMwYEf0lRAKYsNRUo767KZ30j6lOTgybhuMRTbk4M0zJRyUIQCOM
	1PyqVM17ZH40qOBOEDzkonvIFXiY4S/rfC4/V0w==
X-Google-Smtp-Source: AGHT+IFNavuHzM67z8nD84tGq8SasaggEERCVa8QxVSdpo1jnmEECTHbl3HJt9yjMo5chmDOsynf6pkzaU7GoLeC2Hk=
X-Received: by 2002:a2e:a106:0:b0:2fb:579a:fff with SMTP id
 38308e7fff4ca-2ff1e9044e9mr169261fa.8.1730987712796; Thu, 07 Nov 2024
 05:55:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org> <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
In-Reply-To: <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Nov 2024 14:55:01 +0100
Message-ID: <CACRpkdZ1Pkd_iKDNE+m_R4Anbdv=dcg77oC95yqaAM_dp0BRYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: implement cacheinfo support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 3:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> On ARMv7 / v7m machines read CTR and CLIDR registers to provide
> information regarding the cache topology. Earlier machines should
> describe full cache topology in the device tree.
>
> Note, this follows the ARM64 cacheinfo support and provides only minimal
> support required to bootstrap cache info. All useful properties should
> be decribed in Device Tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It's really neat actually!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

