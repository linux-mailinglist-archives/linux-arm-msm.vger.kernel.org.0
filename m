Return-Path: <linux-arm-msm+bounces-5571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B86D819E1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 12:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E04D628AD4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 11:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A06D219E5;
	Wed, 20 Dec 2023 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYioOZO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C821A02
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e7d306ee27so13372617b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Dec 2023 03:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703071846; x=1703676646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SufIfXUXtE/IGgc3anNuqd58CF8HQVlRsSz3wdrFNs=;
        b=yYioOZO4GWbJQ1FKbcHMWk8nB634r7ZMkx9PTasis3AWqD43reT+OuSQQafjBzTtml
         LCUc/X45hvgiiYuLKFilG+/a/XpTD9tM0C/MFVCp0IQpocr0Kgb6JR59TPgE5mRKQDk2
         HP0V2CLIdru0RGnpkt2QqVGklLHwgesqFN7d6hBwPucDYpncu+C+k6xlO1A6yYeJ6mFR
         iFQC7POOS1gDKCuL53ubiMXFw2QYSmGCe0xq35U8r4tJ9Yiej5gtEn2MKlJ+2ZhLgL+h
         VD/1mnnAxyFqGiTtR3t2J5CSm8C2Qo3TI3ITLNJWmz14jL92TUhqR1ooVGaS9BlTfIcz
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703071846; x=1703676646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SufIfXUXtE/IGgc3anNuqd58CF8HQVlRsSz3wdrFNs=;
        b=Pl+XSGIM3M/ZgRoOiEK/32R9RhLMd3CnzBJcvmPUd4iyCv2Zff62CkLq37Jqml6x5i
         PyKOplqTEskNLDi9pXMwOv0/5Z3f/1UA9XwhyJEei0ZKeB1ipezfsPJYSsULZjQPXdTB
         6ZPWCx3vRDt5vqloHbTaVpMzmuFLTvVECpjmhMeYmIGPJ4bW8If2SSxcWH+dDda3pdSg
         ojSfVfTB/gNlAfCpmbgAJLE8Q7rR7AdhgJlHVRNQBv8wNgJgTw5WA6gv4/YI02DmCXKN
         sZ9qBD3DWte/GvC0Eoi2SkOaMWW7c2wsjSY/zcq4LiDsh1OrcjGl6xjkJ7rtHJnBt6Pf
         6xkw==
X-Gm-Message-State: AOJu0Yycw1hi+QmvKSPG1mm50kvATSeDTuyaR9i2cvbQQmE/L9vlezsO
	ejoAOl5DD/MUccfNd3jEoxOBmsogRdQg+U3nePzgtw==
X-Google-Smtp-Source: AGHT+IGnvk6xRVkvFKhYWp0Qwy3vExCwRaFW2DEjlA/odXuqOOyoMcBeTXq4E6gIhF5x48xCcjowrVFlndR3yRM84pI=
X-Received: by 2002:a0d:d642:0:b0:5e8:789b:3be6 with SMTP id
 y63-20020a0dd642000000b005e8789b3be6mr480696ywd.17.1703071846489; Wed, 20 Dec
 2023 03:30:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202312151810+0800-wangjinchao@xfusion.com>
In-Reply-To: <202312151810+0800-wangjinchao@xfusion.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 12:30:35 +0100
Message-ID: <CACRpkdYvCF2Bk-akuOX88xW21DZmvX+7k+L5yhRW00wdhfF9Dw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: remove duplicated include
To: Wang Jinchao <wangjinchao@xfusion.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stone.xulei@xfusion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 11:11=E2=80=AFAM Wang Jinchao <wangjinchao@xfusion.=
com> wrote:

> remove the second #include <linux/seq_file.h>
>
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>

Patch applied.

Yours,
Linus Walleij

