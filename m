Return-Path: <linux-arm-msm+bounces-49014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3FA406C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 10:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D9316CEBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 09:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD492063F5;
	Sat, 22 Feb 2025 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnZNWhD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEDD46434;
	Sat, 22 Feb 2025 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740216189; cv=none; b=SHlsY8v2o0e3v28QTBFr6ROsM+xTIx9td/vZ7bi44NuAkHuaO0Vta6v61ROPYGGWNicxBx2WER18A1L7/9IezEd1r+/Tmojpzl81u+NVicOQIFGOa8RM7sES3eC663STostk/9m1FkqJ4zm5GebSKgzVIQhM/STORIjmQSisVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740216189; c=relaxed/simple;
	bh=d9Ddo/CZA7p51c09ka8t36EE346MIjUHq2P1nR4cCe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9C1Blfsd09CLFQJerNJ9INF3reWVHTp6Ly6jSiZRwfi+v/6/JXvoTQLde4qw639Gh3M0f/dNPKFsoNMuhg/ATcoXuLnzU3OeiTGd1Z9BNLOntEiYxbCA0IXTFfcAKfjEgkZMfdfvs9Udg+h/TwWmJBoQ8y5m9OZ6JN7qxdBjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnZNWhD1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD940C4CED1;
	Sat, 22 Feb 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740216188;
	bh=d9Ddo/CZA7p51c09ka8t36EE346MIjUHq2P1nR4cCe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BnZNWhD1OLkX3kdLgYZECk3rtCtrSZde4PwxrRZlOFio5WCcOKo3aiHuOao/2Y1YW
	 8lPhlLc/uMFCm2fU1zmt9aKJin/S8T36he2t5TEktmlKdm0wTE2a1RpomGGioU1/M/
	 G+q3RqiR3ybe4UhJMsg2HfAAZxzX+O1cLlhNPdUuSTGdsG94EaH1ElNWwkZ5pxiluD
	 RpSk7BetVjSf26CGNh9td5Q3+0H5jKPm8siVsdiLiS4zTE8ZnKNfDzh6Ecc92F4t4i
	 rgHbusQ6378EmXeJqanZ13wT907BKls3wQpBxzXwVTKWxNWPsKdvWd8UxTdQw2X5CU
	 z+why2119B+ew==
Date: Sat, 22 Feb 2025 10:23:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
Message-ID: <20250222-discerning-skinny-toad-4cc396@krzk-bin>
References: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
 <20250221-lpass_qcm6490_resets-v5-1-6be0c0949a83@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221-lpass_qcm6490_resets-v5-1-6be0c0949a83@quicinc.com>

On Fri, Feb 21, 2025 at 03:04:54PM +0530, Taniya Das wrote:
> On the QCM6490 boards, the LPASS firmware controls the complete clock
> controller functionalities and associated power domains. However, only
> the LPASS resets required to be controlled by the high level OS. Thus,
> add the new QCM6490 compatible to support the reset functionality for
> Low Power Audio subsystem.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


