Return-Path: <linux-arm-msm+bounces-1117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFC7F0F3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 10:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F29711C20506
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3EA11724;
	Mon, 20 Nov 2023 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnKBTdqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E5AF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 01:40:11 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5484ef5e3d2so3699059a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700473210; x=1701078010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV6jnuj0MIJn5B1cSBOWhgza7MPZBJRiYSVUNCCfxoQ=;
        b=tnKBTdqTH2v5QIK/8edrvzQFZb8apHTEAfY+wELANUcP85EWRU6FKdoInsFm2HiZzc
         hEelushABY33DtQO5HoRg0ZZX+JwbKmXktlT3f7vYALWMk9An5kIE2MuVfRs0Qw2MugE
         tKdSBBmfJOVg5MBNV5SB1bqOmaRtqRgxnVgFvGAiIo5bE1lfarRG8ABSybfl7tJ+qp42
         BiGTMnip3Y0Bc/dZhDoQZzceWcblOysCuYe4/EeltHLTV4RomX7i7BQhXFymP89KP4ES
         0TnEP6BD7TL9DXRQqy4asHudx6ACdh5UiHwMOLlg4hnTyY456LTD5NmiXbHxCrvntYgX
         9/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700473210; x=1701078010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV6jnuj0MIJn5B1cSBOWhgza7MPZBJRiYSVUNCCfxoQ=;
        b=QY7JvxXiokc9HmfmX42h07VEaIMv24U1y2yXAiwbg+riRimSaDYXEslgs9Wzjy+G5n
         wWkv5OtltgrDP52zGKH+FAblnp4ukLan8l81IdQ5Y8eRUI+2PODH7+cclGTTcchPU6xX
         EScOO0pUZS/l0SuZ9yw9LUO43TArdzG5YH/y6IFDXneIv6m1MvsPFk9JTE1KIXz1uSmY
         UqPs0FR0SsLm/mFUcS9s7H1eEbqeJHv12MRMBL3T0Jlhgax3Ue2lcVT7nm3X3/af5Pqt
         9MmW0lcPWQsyZjDTvOTjgC4jrrYR5RecZ2aHMdRAwNrRBPGHy4l2kVNC5vyVoSFCZfZK
         8kZQ==
X-Gm-Message-State: AOJu0YzolMKKpHKl3gl0i0+i7KUy9t+rbzAleuE9iW0r9JWR7fCsNIwr
	hEYdkooSOxZJYKjeb2Nwgt/YPcuego2Sg1jGwMoCdw==
X-Google-Smtp-Source: AGHT+IHpuPkkpzf6HvIRoyFCjRddB6IaTOcD9D4X7AuwnDGekaJENUnnI2Ieq7XREu67tB5Cf1SPCBLE6vU7Bq9YmRk=
X-Received: by 2002:a17:906:41:b0:9bf:6200:fe33 with SMTP id
 1-20020a170906004100b009bf6200fe33mr4386460ejg.16.1700473210292; Mon, 20 Nov
 2023 01:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117173650.21161-1-johan+linaro@kernel.org> <20231117173650.21161-4-johan+linaro@kernel.org>
In-Reply-To: <20231117173650.21161-4-johan+linaro@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Date: Mon, 20 Nov 2023 17:39:59 +0800
Message-ID: <CAAQ0ZWTbAqnX2te5SEMT+q_FyHY5jopDciqF6sY7a9nr76f0QA@mail.gmail.com>
Subject: Re: [PATCH 3/3] USB: dwc3: qcom: fix ACPI platform device leak
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 1:38=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> Make sure to free the "urs" platform device, which is created for some
> ACPI platforms, on probe errors and on driver unbind.
>
> Compile-tested only.
>
> Fixes: c25c210f590e ("usb: dwc3: qcom: add URS Host support for sdm845 AC=
PI boot")
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

