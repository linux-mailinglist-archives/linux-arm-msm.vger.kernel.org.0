Return-Path: <linux-arm-msm+bounces-6775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8282897B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 16:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59F0728822E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 15:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C243F39FE7;
	Tue,  9 Jan 2024 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hb5FMXcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8539FF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5f2d4aaa2fdso31551097b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 07:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704815654; x=1705420454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ldk2xHvhyxy1bWq9YLzjnpGm/58hFkzg9pcqfNBBmU=;
        b=hb5FMXcKsUq7fX0vXAKCCNvET5wEaaBu/xkUeybkiU0niekxL4UGng4PsPUzJTQvcw
         iLqHS1ipgKlVuDs7GbvE336ShcpzLzikxc6E+K3XVBD4Ump0vAxBxLa5UajeGz31PsAU
         TV15uHSAvKPHbGhdrJFUtUV+WYDc6WFS3TI3ADMKig0BhJ6QVKFE2it5MPrTeaGg868b
         6T6U4aFof/Yfu+LJo48nM7jJvjEQQfzZdVWzbk80WHDpax/zFkm5CBkPNRWP4Z2WLqWI
         q2tv//Bki5N1svNhUTgsgoB5tTZ9PBJkx93DVmlqtEOUR5Dq3boA8n2BzmVikfIOux7Y
         QhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704815654; x=1705420454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ldk2xHvhyxy1bWq9YLzjnpGm/58hFkzg9pcqfNBBmU=;
        b=lPokuMbC2oTtZGVJL5TpdbUhIkzu0wnwWHgHAYmuiOKlnJ9WrocWBn0wt2D0auKdzs
         ndMu9SCAkDLlJuyNxbTDZqLZX55X+71NUduoHJo+9a3AeUy4TBXp7ZhfI7W0nImMMJf6
         eBeasvzuvRShmyva7IJdCPJ3mgggjZ7PWOa2yHyOismDcR491V6jEZjLrfd5MALkIhAH
         bfGi0Y1YLpNfhsfFPGgXxA77zVMBp2+JlCUe3zbsVdMchJhMVeKOjSaTWVHFVewFY2Ok
         rynoK9TvP+JGccjev9xoU2h8unWHFug8JW67NPN+YxiMb5eynesB68UmVmDy65yNqwZR
         pfPg==
X-Gm-Message-State: AOJu0Yyd0JfBgnqIVS8sCuUwS9dMbVtsjt2ws+TW1EPP83baFDJxslsW
	A6DHnrYqmIk3G9ekfRQ4rr2W6WoFyp6N0o8Dbfpp9ECrkY4sDA==
X-Google-Smtp-Source: AGHT+IFQLx02meGGq6nOyBFkOTpO0En98GI9sGvhPt+XmfUE9q14ZOEEaIb6XJ1QuivkoqSvqoF4dv8hq42FRAIxTWo=
X-Received: by 2002:a0d:f1c2:0:b0:5e8:7687:77c9 with SMTP id
 a185-20020a0df1c2000000b005e8768777c9mr4837433ywf.1.1704815654195; Tue, 09
 Jan 2024 07:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org> <20240109-phy-qmp-merge-common-v1-8-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-8-572899a14318@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 9 Jan 2024 16:54:03 +0100
Message-ID: <CACMJSetxG33D5JH=2N5LtGuznp-Q_6Bv0RL+jwCPaOsz7LwV6g@mail.gmail.com>
Subject: Re: [PATCH 8/8] phy: qcom: sgmii-eth: move PCS registers to separate header
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 04:04, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Follow the example of the rest of the QMP PHY drivers and move SGMII PCS
> registers to a separate header file.
>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I'm typically opposed to the idea of putting defines used by a single
driver in a separate header (for what reason?) but if that's
consistent with the rest of existing drivers then ok.

Bartosz

