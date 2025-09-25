Return-Path: <linux-arm-msm+bounces-74997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90756B9DEE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 997223B98E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 07:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D0B270ED9;
	Thu, 25 Sep 2025 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dM6MELKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221C2652A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786966; cv=none; b=bkdGTAPu11ai2qzoLPq42tL2K7oAALqFC0Kr3REyiISpjpEgLHBn8FuOH1Bw9az9ZZaRF34egunsydB0IpVD19A/QiALli0nzaBzMpzVbEdh9phUW1YddFZFCH4Z7LRI2/vZ3pKycgDDOSrxxJd3xgt/Dn6cTfpBJncNGIdLWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786966; c=relaxed/simple;
	bh=iNOrlSv+UnH9YXYGgLh4d5QBAGujb/M/E8kWZNFFdKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZ1bBrp88Oxvq3tVTa/OSmdw6bcwWOJ8XbUG+gbOSmmSv+atIRxd9hUeGM0l4fUxXftI/0IIcxVPV4hOaSQVdEIp33OmQC4H35eWRpblhiYGnIDUR8eQqfeIEdUIlfZq0nEgHU/cIYxEB6mGMfrd8Scq4nA5ltqG0HKwCyN8G+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dM6MELKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C14C4CEF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 07:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758786965;
	bh=iNOrlSv+UnH9YXYGgLh4d5QBAGujb/M/E8kWZNFFdKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dM6MELKJOIaRJcMFEmVFgHVIxJels1l/eAmAVDj321BcyRJ++kIuMF38I9bugx57h
	 ogeStB0CBDvWr8OFGMnOvOO2WX3F9RwsHqFwwEPoWaKfhlAUiXHwCMduvVI6jNakQC
	 Z7FTwi1uM+JDW43S5m1pTUQFTaVcGsPTg+3CKOoILze6R10a0A61HleC7cvIR4T5qb
	 89k/u+elIPhkMJBrTDm52L1sVtXKpzXNU/vhnZKUqDxDi1m6Wc3OAFQ2yPrVfyVW62
	 5iHh61NPA+UYp9kP7o6nSslER8tKVCDnsrCqNhCagMdVkatBNhgR3Uwmadb6g61BeK
	 hKbCx/yv84ZPw==
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2681660d604so6814635ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:56:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuJwXYBVGmRjdxtI5LW1E5EQ7F0vQ3cTGtpJ74xMISVGFf9Il0w/kvXBnTFMlrF0N4/Ommrtw8WEALCBVX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0NRcpCO1sjd7gYia9CI6SFpqCHWDtAHAcCJEQpt8Wu7AbRaGx
	IEm7zz/l0xK1ek2Jk6emp8Af0om6u+uEWqNYwhN14wm+3SVzbG97R5diBJlAAOToBv3fF4tGZzd
	9kf7AN2FXIjExFm3DHqEl1AcoSpVMiSc=
X-Google-Smtp-Source: AGHT+IGwiFpqHmhXAhBBFAso/lUytZrxuoUy4+24dMkBcof4Rt456e4kjJjM/KaUSq35uvSNF6sG9ZpMzxNTEoW2FNA=
X-Received: by 2002:a17:903:32c3:b0:267:e3af:ae67 with SMTP id
 d9443c01a7336-27ed49d2f64mr28324145ad.14.1758786965578; Thu, 25 Sep 2025
 00:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-13-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-13-8e1533a58d2d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 16:55:53 +0900
X-Gmail-Original-Message-ID: <CAJKOXPfCFS4UDbN_SejG=zJt1Dt_mtz_p_+MGAaEr5SpK3ydRw@mail.gmail.com>
X-Gm-Features: AS18NWDm7SJn3zsL3AKVzt-6BJJFQvrAi-FrGgXNCkiSPvbpCGZr-N3-JKzjofA
Message-ID: <CAJKOXPfCFS4UDbN_SejG=zJt1Dt_mtz_p_+MGAaEr5SpK3ydRw@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] arm64: dts: qcom: Update pmh0104 dtsi for Glymur CRD
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:29, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>
> Update the pmh0104.dtsi to include multiple instances of PMH0104
> DT nodes, one for each SID assigned to this PMIC on the spmi_bus0
> and spmi_bus1 in Glymur CRD board.
>
> Take care to avoid compilation issue with the existing nodes by
> gaurding each PMH0104 nodes with `#ifdef` for its corresponding
> SID macro. So that only the nodes which have the their SID macro
> defined are the only ones picked for compilation.
>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pmh0104.dtsi | 84 +++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
> index f5393fdebe957ea0caf4bbc16117374b4759bda3..d3ea7486d842ec813a79268fc1466e1513426d78 100644
> --- a/arch/arm64/boot/dts/qcom/pmh0104.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
> @@ -6,7 +6,63 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
>
> +&spmi_bus0 {
> +#ifdef PMH0104_I_E0_SID


NAK

I'm surprised you decided to ignore all existing discussions and my
clear point in this.

This is neither readable, nor maintainable.

Please join community in discussing this, instead of coming with
another invention which I already said is poor.

Best regards,
Krzysztof

