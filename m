Return-Path: <linux-arm-msm+bounces-8397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8821783D62E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B68BB2580B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 09:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C10618038;
	Fri, 26 Jan 2024 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THE4oRek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520A1EB3B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706259130; cv=none; b=HeO33mVu9usZLsG/2R3wKOYXCqFfaNtLxdCqyoO6LqdJWsVF8fkpy4p2hxQ1dUkMF5uJ54bRDvQc0m5MOdgiRp+gUVVz61B5YHVwWo54V0hOLCmZMI8nZEiWGmrXU0SNzTQPh14Q0hRMCU25ivaErEM/O/MQ3xZHqahj/+zm5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706259130; c=relaxed/simple;
	bh=xusLqnJYd8yMsZfx31W/7jX/Ptf9Msa1Y7THQIiVTrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAfDK04S3dLT6hPl+qE55tNeTbUBQtMmhimDNnJ81s3rIk14lvVNOLG/XBB0O9K6DwMgviCU81Z/jjrgfTMLUqg4XQ5jzDrxynp3teKLpcq9J9fESaVXMDrTNLmSEp17H2CN4HI/xNv2d0Z8ZoGUGJzq2YyKuP4mZmXj6tmYBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THE4oRek; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc22ae44595so292734276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 00:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706259127; x=1706863927; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S81DTGo0RxOmNoDRhjegpnnjf7jQff8tYCdklC47ijY=;
        b=THE4oRekc+wsc6inPqtWwtq5fXODzyX704oUscSaTwvQwR1IxG1RkMnjl6UJWwXGTK
         OQlAlzKpoUqtmECmZJQu6jfY6HKzvhZQmAFfkEjJRk3S36uz4VrcnEC/bLqJcIoMJ2zm
         4JSLE0yvOlQ/H4MkJ9nvqxQ+PPC/lwl4fPQYmGQmdmCF+Mo2ZYV7qukKaQgqGrBKIxI6
         GI7P229Q+TjSco5or7OuDtNGLAA/ujjUI0oO5lkmA1qncKZklB4VGdNOb1P90tWI7zVj
         G7+V7M7ACHO/clT5hFBgri9b59BxUYhqk66bejvG1VmeuKd+urB7ykQBnmMMlDEB+8vo
         /d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706259127; x=1706863927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S81DTGo0RxOmNoDRhjegpnnjf7jQff8tYCdklC47ijY=;
        b=ocfJWgGVo+tKVybnNIstDB+aN1LKJpC6DbgKQUW9f2yHoF3N1KxAxbFnZOptgk8KuA
         7Lns9+8/vMHOlNhuPyUq1WINldrn4rN3OuVIuU/Hy51VMhtJJiOPm44VkZUbobistzmS
         lfN4BXoZJv9uJCZdHZTyhTalj6URmB6jaExWHlHVxJzuBP4w49dt3CH09Sp977MhnfEU
         AnSsHwS2NaGz3X+v5ANE5lneG1TKrVByvS8XBCsCx1lU5qYz+9Au+a1RmVCQYcoLO1/U
         6g3kJxvh4eGtQh+R7Oj+w6XnYZatFLwokKHdb+5bCIBh7HvjZIwEvy5355Cv5NbH17Fy
         FLeQ==
X-Gm-Message-State: AOJu0YzlJeyEfchzGseW96ZDW/YMPnpFsin+Wmg2fd3aJbE1HjwVtqZ5
	9AIaZILpnPe5huLGv3nOY+0WX+/aaSHxK3Rd9lhceMTxdwZPDb44Pua54MuGHheSZbAJE2H5kxo
	l89WFNfllI3RI1LgOLu9BL50q9iKHUC5E+BDP7R5KNiFV+LrUBr8=
X-Google-Smtp-Source: AGHT+IEDhwUqA0ezn+xg6AQkgkKJlqIKM2kSQJnzsF6FONphx1zejBQuxcLC/vvkE+BOten67lfCsyIzie0IT51qYE0=
X-Received: by 2002:a5b:68b:0:b0:dc2:23f7:665f with SMTP id
 j11-20020a5b068b000000b00dc223f7665fmr894722ybq.127.1706259127403; Fri, 26
 Jan 2024 00:52:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org>
 <20240126-phy-qmp-merge-common-v2-7-a463d0b57836@linaro.org> <CACMJSeuOmz2DC0m98k9MFx71A-9jyZkrWQMGt8DVUrqKJk-bsw@mail.gmail.com>
In-Reply-To: <CACMJSeuOmz2DC0m98k9MFx71A-9jyZkrWQMGt8DVUrqKJk-bsw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 10:51:56 +0200
Message-ID: <CAA8EJppz+-GSSKuwQi9uTknPLka1N-8=bOdTqu20cPsmxQPn7w@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] phy: qcom: sgmii-eth: use existing register definitions
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jan 2024 at 10:10, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Fri, 26 Jan 2024 at 00:23, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > The Qualcomm SGMII SerDes PHY is a QMP PHY. As such, it uses standard
> > registers for QSERDES COM/RX/TX regions. Use register defines from the
> > existing headers.
> >
> > Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> I have reviewed v1 of this patch already.

Hmm, for some reason b4 trailers didn't pick it up. Or maybe I forgot
to use it, that's also possible.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

-- 
With best wishes
Dmitry

