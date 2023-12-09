Return-Path: <linux-arm-msm+bounces-4097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E97F80B5F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 20:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10915B20B01
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 19:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99072199DF;
	Sat,  9 Dec 2023 18:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uclu4fdj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557B7F9;
	Sat,  9 Dec 2023 10:59:56 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a1c7b20f895so372543566b.2;
        Sat, 09 Dec 2023 10:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702148395; x=1702753195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndTha4anD1aznZ6EZWV8m1hC/zS0G2iSKtGiySv+I10=;
        b=Uclu4fdjqvkLSi5inwIc4enFWBOygo6CQI8wyB54h3tFD2LMiV3lRzSYQSZOC4MuuZ
         MNT4nYhQUOLP9ie8Zn7tIGsENcXmNg+q2oJbSOnKBk/sJMI/tSUWwwz0zYegxhqAgPDw
         9oe7uiujtcHajSx8yu6l4ehCPNi/WubyndsCFx/Ltk3j/tH3KPom3VsEMI5VCmKKkMFN
         zGkrCo2cgScG2egx/zC+ZJ3EHY4BLrZcsb6UazWFr4+syMWDGIfGjY12CyMUqUJNx2zs
         hnmyUJS6c07OVsH5vSztewfUuk0/KyZm+ErX3ROzd2VsLdmla7B8HGf/GQZZo3qdmSw2
         nKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702148395; x=1702753195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndTha4anD1aznZ6EZWV8m1hC/zS0G2iSKtGiySv+I10=;
        b=j5XIbHl3WzUquy9Wgq9kTFDyEPJ9jPOwSyyC1MsdP4wFXJ9W0mvEcfmtSXfe3x8u1m
         JykIpcKpuFyLwwkesH6rFI5Qlamt9xnfsytWDZ296Es/V0jMJa8M+1hJKjgG+uYtcsTh
         qKluammAimLxYyBD57rexUGaiIkQavf1LBgIzt+lLs5wTkuKLCXWKyB2LeFDfjOltfaZ
         od0ZmeSYNk8WyAQYBaRfNKAVtAlfHftTvgGNZt2L1mXnP1edqAc13Z3pIdOE71zHfZcj
         yy2+kdDLmUdmdvabru9xx2H5KVq+3iqeD+VotPvb5kwZn7pHPCOysLAkT4/otFgryBMX
         sVbw==
X-Gm-Message-State: AOJu0YyYQfZfEO0KT8gfd5UM3R1jGo+uEHGvdlEB3L61UZTNGQw+RErR
	vyebXTNamkFbYDyW0/E/O4Hwj23gjuskTCRyWow=
X-Google-Smtp-Source: AGHT+IFSNwed3LE/BAR09oAI9nX5Q6nVPIbx6h/kpZ/S0cOetDuH9WHFP8Fd1fjxwbC5NhniNpB4LyOrDoG3LHqR+n0=
X-Received: by 2002:a17:907:7f26:b0:a19:a1ba:8cba with SMTP id
 qf38-20020a1709077f2600b00a19a1ba8cbamr969888ejc.88.1702148394542; Sat, 09
 Dec 2023 10:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org> <9f611e20-9530-42de-b794-b6210f465bf1@linaro.org>
In-Reply-To: <9f611e20-9530-42de-b794-b6210f465bf1@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 9 Dec 2023 12:59:43 -0600
Message-ID: <CABb+yY0oTSakkY8FXaRMON=qO+uRQX73OEB8LXoo3XT77n98fw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] mailbox/arm64: qcom: rework compatibles for
 fallback (continued)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 3:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/11/2023 21:49, Krzysztof Kozlowski wrote:
> > Hi,
> >
> > Changes since v4
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > v3: https://lore.kernel.org/linux-devicetree/20230322174148.810938-1-kr=
zysztof.kozlowski@linaro.org/
> > v4: https://lore.kernel.org/linux-devicetree/20230327140752.163009-1-kr=
zysztof.kozlowski@linaro.org/
> >
> > Important: v3 and v4 are quite different.
>
> Jassi,
>
> Any comments from your side? Can you pick this patchset?
>
Thanks for the ping, though I hadn't overlooked. I want to wait enough
for platform owners to ack or comment.
Picked now.

Cheers.

