Return-Path: <linux-arm-msm+bounces-1475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8137F4347
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9AC1C2083C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3222135C;
	Wed, 22 Nov 2023 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ih3Q7htX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEA0100
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:11:01 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a877e0f0d8so5310697b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647860; x=1701252660; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PsCyThm4g6sI5epAQyEGxjAV4aR3jzwAzhrpvksWUpc=;
        b=Ih3Q7htXKVRZWORsl2uinMvltKr4kKGHrGrGfi1j72FbIFdKwvZlVN9M4Ns324cOGs
         o1xjKrt3Do7GDSyv7iZw7uCFt1Uqz9/8eQZgawB5Q94GPopiI4JZUJ0h5umGlNj39KbM
         8X0X6kyDwp6/BJJcjSSRgq5RILZs2oT9casio3qywwaU3RoHSYpz3nwunSCwdI9rzFPS
         1j15NivNaiGOYfogcY7fPOmdgsuxcjeY0Pe1fwodHyXGop/NRvPNuO8wlVQfMq0Uu1aX
         fAjY4xOR/y7SZfAvJVbsd3t/kIIi2oq/zIldzu/TJCBuOIhdzyjXN22B58ra7KAPspzG
         /9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647860; x=1701252660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsCyThm4g6sI5epAQyEGxjAV4aR3jzwAzhrpvksWUpc=;
        b=jw/Wp78XjraY8d2/ULpWhlDjagPpfIG5nnY6ZdwMww0f82wKDhBgvk/f74pu8qHnzc
         omL9jC36azpKH/jNO/YVk+TQF1qPnd43uw+AbI84c+vRkSzIxdtd2aVFQM+UR5wrHiQt
         zRpoXSiRWH9OojsGUSdwr8bx4/GuNVU0QLPyC/3mlQTIDgVT/CR54bZIw0lFQoI3EJ5Z
         58ZgeqlsEBOorr2Jy3Wz8M8jb7b0pIzHEzQTqoj3yav+DT44ZBfHo3+wuyAqHaSkefHS
         ZZjp8c1NiGl1KNBCox39eH0b0xkgdNn5W3lfd8OzPUz/B0is3S7yPWhO/LJ2Y7evTbQt
         Zo7A==
X-Gm-Message-State: AOJu0YwbzBf7MljaBQR5J5/YZH5K7288H9Pe2cMk9K0yMsmRboI416ZV
	qg7O2MiylJ/T+sjdp98TwhNcUYhTt+gfwwA68PvNvw==
X-Google-Smtp-Source: AGHT+IEqAhkglUSA/Dn8loksX8eQaBVIwCLF6JA54T6lxkJY9gpJDdPmDPFJVBiFwwTK3wpD2FY5pWOJcJSnNjPLaN0=
X-Received: by 2002:a81:c74d:0:b0:5cb:65b8:7cdd with SMTP id
 i13-20020a81c74d000000b005cb65b87cddmr4070036ywl.1.1700647860502; Wed, 22 Nov
 2023 02:11:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-1-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-1-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:10:49 +0200
Message-ID: <CAA8EJpouV1EfZDz828xa9bJO=3Q5sDNWwhhC4tdCsXrTNNSSxw@mail.gmail.com>
Subject: Re: [PATCH 1/7] phy: qcom-qmp: qserdes-com: Add some more v6 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add some missing V6 registers offsets that are needed by the new
> Snapdragon X Elite (X1E80100) platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h  | 5 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h | 1 +
>  2 files changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry

