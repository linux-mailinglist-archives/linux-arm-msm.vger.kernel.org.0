Return-Path: <linux-arm-msm+bounces-87550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC00CF55A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5F931293B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0510A3469E0;
	Mon,  5 Jan 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V79mi+oW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F13431F5;
	Mon,  5 Jan 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640605; cv=none; b=L+loDfB5nmAlFegA5SCWU3dmHnRD/hq05uSCMBuitqjbHs3pxHJItOt7G1u+WWenUSnOF4U1xvuBiyCSjpUTuJf2qY0/CNWxzRQ9jN5yphdwVsy4owgLVl1ez6z91LbrF/EykVXC/xDk03HnWV246skdz2bUk/sL//hqJq0uexY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640605; c=relaxed/simple;
	bh=LoDm3Shzh32Fz0vjSW6nHyXnSnMnTIlkXsEA7J6//4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+6W9BP21SgsPqC2IPnNvOPdMlS0ey3tp0/z1SbYgBxz0RtKDAPYr0ZjOD9/yjPgQZN/gVmFm8TUhbhO/wVmXRLkB+up5wvLWRlg1Th1g/CfgN/2ktGAsbs5tz8v+gIZyWfLs5Kg6TjAHtPQooFmcuQ7ov3N8gzvevMwfqDEIJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V79mi+oW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBFFC19423;
	Mon,  5 Jan 2026 19:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640605;
	bh=LoDm3Shzh32Fz0vjSW6nHyXnSnMnTIlkXsEA7J6//4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V79mi+oW3yCCrNi9mQn9RM0nXJYVZChENOtaJnOzxBLHnoWlaZv64owTRYOeceXK+
	 VAB9bD3j96Pz2nE9oDwbB++iBXk9bVUJu9RsPInR6rtMmj6rXR7cfIDclv71ZYB6EI
	 NRfaf6tdg41DMuX3IZIYD9OyxlKmTWF7OdAYPmT64xVrY83Kh/Yi+92REm7NDPSZxW
	 KPGpXjekTZ6//XVDJhLjKwQnVJJiqUZYcdWdeLVjAf8zxdHw/LfdO9dLT/qyeRapB8
	 qwKLRBxXMIJV2FGwv46v6MGdt3gzQ1xatJUOcKGkB6V5C2y/24DUKtooflTebISpVl
	 VwL6I7gUxm2SQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] arm64: qcom: sm8750: Fix BAM DMA probing
Date: Mon,  5 Jan 2026 13:16:24 -0600
Message-ID: <176764058419.2961867.6173748456448356571.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229115734.205744-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251229115734.205744-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Dec 2025 12:57:35 +0100, Krzysztof Kozlowski wrote:
> Bindings always required "qcom,num-ees" and "num-channels" properties,
> as reported by dtbs_check:
> 
>   sm8750-mtp.dtb: dma-controller@1dc4000 (qcom,bam-v1.7.4): 'anyOf' conditional failed, one must be fixed:
>     'qcom,powered-remotely' is a required property
>     'num-channels' is a required property
>     'qcom,num-ees' is a required property
>     'clocks' is a required property
>     'clock-names' is a required property
> 
> [...]

Applied, thanks!

[1/1] arm64: qcom: sm8750: Fix BAM DMA probing
      commit: 1c6192ec9c4ab8bdb7b2cf8763b7ef7e38671ffe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

