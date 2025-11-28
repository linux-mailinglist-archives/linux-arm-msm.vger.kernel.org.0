Return-Path: <linux-arm-msm+bounces-83773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC4C91EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 13:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A25E344A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1529E315776;
	Fri, 28 Nov 2025 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbvGwAAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDB30FC20
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331516; cv=none; b=ksTDXWrTKB8jPEvzlKc/cRbFGsZgRYNf9bBixIw4Hh6/7m/Y/auvsWoB3N+pUaQ5IqPfuz2xzF8AODq4ncV1F+Ijf7o9LXMniyEJSZw2uaZzdc6rPYeu9JGJ54T+b8dRAnMuTDDu67Cb4G/OxwVrLC9HFFUnq9drQuABow5jWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331516; c=relaxed/simple;
	bh=PLh0YYqKKtVf//IZFwd4BXKiwNuaffkN//mL9hOePbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQbBZtOw9ESIyNdOGOVU1H+g8bcJdZZThIwgxX/1nK5gudf91CpMi+Yc73D6ar2lqYKSAJRolob9bhkhz/fJhO36Gt8byjxRoOk+nX1jsuKsMnIbU3bmumX6uLgnk68JAmJczhnyvv2xotAD0pG4x4/pfxKZ6CUO/UianxRwRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbvGwAAP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A855AC2BCAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 12:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764331515;
	bh=PLh0YYqKKtVf//IZFwd4BXKiwNuaffkN//mL9hOePbM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RbvGwAAPyPMSixzQzyVeqVBgwInMAQJFjSvP2xNNhH8Lfo1MRkFJzZnAbUpOpU8Gz
	 2Wgpga7Bl0QR/ivCHvq/qtBPWVHHmtqR5oUyQdk1IY376o5ZtuAnE8ZGK8cD841aZ+
	 t77Yohdpu8C7b3eGA/P3PbobHyJtNE4yCyY0YBJtjhwKq/Y37+HR1x5T0g5l8fI+bJ
	 eMxieM8Jo/Xkq88zivnKOE42ZKxWz5C8q4q0I9bUdWHzh2kGds30U+3yLF5CGgs+B+
	 ynaNLQUXRuVmjEFfaDSGcowvGy29OiFsfOeJ4nnDuZHt8hNaI5A+uQBRXhhaQy+eoD
	 hsWikdMFvu2Dw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-595825c8eb3so1679515e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 04:05:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1383QGJBAqZUsoSd6oXBiFnTf03SuYigSqhogp+aY9CKEdrVUJz4GZ1ACsQ7s6mtJbBP5114zC36ZRgfe@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaskgXnsNeTptzzLTHps/t8a4IEyUh91zKePdP+JWkg9GouDV
	iuu7tz1LDRad+LT9EkmFUcRfVyI+waasAg0rrpC5XSRBVhH6OtvtW7iCKfYm+lDzKPE8T6b/Mrs
	SGkXH5kfVpq0w2NhOAQEP6e6wFzEdG+iXqqV+H8SiRg==
X-Google-Smtp-Source: AGHT+IGQ6Hj12QsS85blhF49x2TTlICoWGDxlwIhIavyJN6qeiKzvLiOIBy0mwSV2CTlhl6dAIHoyhSGp7Rq69/Jdpc=
X-Received: by 2002:a05:6512:159c:b0:592:fd2d:71be with SMTP id
 2adb3069b0e04-596b5285dc7mr5376568e87.34.1764331514089; Fri, 28 Nov 2025
 04:05:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-5-9a5f72b89722@linaro.org> <b1d8234a-6d29-49f6-bfc7-bdc738895d79@oss.qualcomm.com>
In-Reply-To: <b1d8234a-6d29-49f6-bfc7-bdc738895d79@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 28 Nov 2025 13:05:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc0Mh5CjS0C+Ss-AG1qQ2YPOr=kkWc+Bbk5CLgPoPVrqA@mail.gmail.com>
X-Gm-Features: AWmQ_bnN4NlR26dNy-7lGmNw7aEJzVFRbeeSl6p6s5KAdU3TnKlS0JNANPCTfNo
Message-ID: <CAMRc=Mc0Mh5CjS0C+Ss-AG1qQ2YPOr=kkWc+Bbk5CLgPoPVrqA@mail.gmail.com>
Subject: Re: [PATCH v9 05/11] crypto: qce - Remove unused ignore_buf
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 1:02=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > It's unclear what the purpose of this field is. It has been here since
> > the initial commit but without any explanation. The driver works fine
> > without it. We still keep allocating more space in the result buffer, w=
e
> > just don't need to store its address. While at it: move the
> > QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of thi=
s
> > compilation unit.
>
> It's apparently used downstream, at a glance to work around some oddities
>
> https://github.com/cupid-development/android_kernel_xiaomi_sm8450/blob/li=
neage-22.2/drivers/crypto/msm/qce50.c
>

Thanks. This driver is very far from upstream. :)

I think it's still safe to remove it.

Bart

