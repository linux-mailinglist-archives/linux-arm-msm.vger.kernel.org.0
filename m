Return-Path: <linux-arm-msm+bounces-81904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E50CEC5E393
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9891B4238D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2D0327204;
	Fri, 14 Nov 2025 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ac3WA5Xu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6A32693E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137106; cv=none; b=oz3CpwUTWIBipTVldTFJYszcxofmw+TKaa+tFWxJpqB4JXpbvr//IvfZ4gGcMDtolyYeuFASgAP0XhWIjkHD4kfrwnMst1zFTBPYB3GqfgC9bNH8X+9G3jQHE3PNDwkcyW48vkBRNf9Y+PQPDpz1YU9/QHQ9a/PMXuBWR47q/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137106; c=relaxed/simple;
	bh=QEjF1WF/vRwN70ClSuEqTx6+UbIiyHQ3zt9JLkF/88w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQnDwhZPVl7sWuUkFMO73vwUFKDtM8Kl0vMRtg8nTxUV6oWynPJDB3jxXMKReXunlQyySxDgAHIblghl3rX+/mvv5ZCXvnPlychR6a1nFG3z7cbICx52ZESkxOROPoXU2vByXY9SCeFaZfnUCFAmOZ2umWDNjZTox98jbJEXJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ac3WA5Xu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB0C19421
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763137106;
	bh=QEjF1WF/vRwN70ClSuEqTx6+UbIiyHQ3zt9JLkF/88w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ac3WA5XuaQaAWGL8uFBSD+0TpGKP675lNRhFD+YZcUdIJSOqNhyLGcxJ/ap84XylO
	 oG75GiSnC+95uA8uApQgdSauzQhKnGOI0gMWIvM6PDGZDKA//5gJb+1iPm8KeMU8Pe
	 hxJOOL5PNqFhaZBjKdxNbdm+Vog4fvukWS+9k9xG8jvjd7jyLw4wjAdrgUZcwFzdDI
	 37yFAIYt9lzbliOLiBImWMtjcwKMziKeR0uCaFWRgPeWYbPal66DGuFZF+WcfG8iyI
	 jqxtzdRG93PtvBAd7R1TUcMeyiOQp8TmCxWViJzbgbSqMyVwvQ2OquFFCmYJ2z7qp+
	 53kOMVYCt74mQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73161849e1so367008066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:18:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1Ibb+U9hoyGzcC7frFcPVLkSQRPPu13lGEnnCW5aR0i/yJeefSHD8LbDNHvLGKAPATYi5DCf5Fl8RQsko@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4WG/zRKzqUMjXEWmzpYImcPQvG0K4qBYG3nVc+oLdXZFx4GYE
	6s991mx6t14zF0no73QtO+bA32Ro8Bzmzdp1dTBVbWOT5YdDb2W6XpJNWd60Cz5271JCxV5xot7
	htmzBID5yC46rmHv1OWaCrJ6+PnwmSw==
X-Google-Smtp-Source: AGHT+IEvLOFyqCU+gTpIpUldy/VCAnVeRKgX2Fjb/dnX2vDFUQSF+Pi1VBgJh5ukSnrIkAAXLmy9kEIRZ3yzcpYSJ/s=
X-Received: by 2002:a17:907:a089:b0:b73:5f5e:574d with SMTP id
 a640c23a62f3a-b736796a33bmr324954266b.59.1763137104773; Fri, 14 Nov 2025
 08:18:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113130519.2647081-1-wei.deng@oss.qualcomm.com> <176313578860.3262114.17056319042303889483.robh@kernel.org>
In-Reply-To: <176313578860.3262114.17056319042303889483.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Nov 2025 10:18:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJX3doLFv-Nc6o+L1W_o8VjtvGp9dqdpsotuyG17zU7Lw@mail.gmail.com>
X-Gm-Features: AWmQ_bkWy46OX7PgV9ZUzhlCrs70KVuhH4A3WuQtX93vwPtAy017ORp1pZrC_NY
Message-ID: <CAL_JsqJX3doLFv-Nc6o+L1W_o8VjtvGp9dqdpsotuyG17zU7Lw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable Bluetooth support
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, quic_shuaz@quicinc.com, 
	quic_chezhou@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 10:06=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
>
> On Thu, 13 Nov 2025 18:35:19 +0530, Wei Deng wrote:
> > There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
> > Bluetooth work, we need to define the necessary device tree nodes,
> > including UART configuration and power supplies.
> >
> > Since there is no standard M.2 binding in the device tree at present,
> > the PMU is described using dedicated PMU nodes to represent the
> > internal regulators required by the module.
> >
> > The module provides a 3.3V supply, which originates from the
> > main board=E2=80=99s 12V rail. To represent this power hierarchy in the=
 device
> > tree, add a fixed 12V regulator node as the DC-IN source and link it
> > to the 3.3V regulator node.
> >
> > Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 99 +++++++++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20251112 (exact match)
>  Base: tags/next-20251112 (use --merge-base to override)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/qcom/' =
for 20251113130519.2647081-1-wei.deng@oss.qualcomm.com:
>
> arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): =
'vddpcielp3-supply', 'vddpcielp9-supply' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/regulator/qcom,qca=
6390-pmu.yaml
> arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): =
'vddpcie1p3-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/regulator/qcom,qca=
6390-pmu.yaml
> arch/arm64/boot/dts/qcom/monaco-evk.dtb: wcn6855-pmu (qcom,wcn6855-pmu): =
'vddpcie1p9-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/regulator/qcom,qca=
6390-pmu.yaml

This is the 3rd report of your typos. Is there some reason you are
ignoring the reports?

Rob

