Return-Path: <linux-arm-msm+bounces-50192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97855A4E02D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D3433A8923
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B572204695;
	Tue,  4 Mar 2025 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ez2WwGYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BA1FDE3A;
	Tue,  4 Mar 2025 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096965; cv=none; b=Q3sQS+fBjHVedQT+UTLW1GaMOia+hrnRI0JMqC/wqYpZzTIHJRXdC46oi0xVWNOrTp9YFp12QcOaPbra5jyGl+AgUDXEyWvFuKrAFZeW06w65wCFBtpyA69enPiymCPLBQmtrp8GrPDDXlqwLjQNb+xyGA+mYESaXwtAdbpXI+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096965; c=relaxed/simple;
	bh=4v3KbgYZQNuCqrOxlaSm630DSI0PqWqeDAG2Y4G+F/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyYRWcjolpmQENhnGSLTyWzspjdIUWEn7Lfs9cwu14quQTYeF3tp/yikLbIea6hCDQ+c65B49ZYaoo78s1NKlfTie2vBbYLx16UtPrg0kZSPFPXqEJSJWF2+flaPSc+ghyKWnsgWCjyImONfhmKA+S45IbPvF7oJqbLgMTKn0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ez2WwGYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925F1C4CEE5;
	Tue,  4 Mar 2025 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741096964;
	bh=4v3KbgYZQNuCqrOxlaSm630DSI0PqWqeDAG2Y4G+F/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ez2WwGYN6mYDm5p246LE8lVdKtqeemebOjTQcRgXfmjRJaLpKSSYVqhJ9WVCkBAkm
	 qUXsVi2d/p83+W6238h0W8EfSlG7GyMVuDKQh3Vk+oj099J0QjV1KwRiQFLjDyh/yd
	 +y1Dh7JFxUoOHdMH8KiuMIQZ9MT3wWLCZ2njxERHm7szWeM4NdbN5bmcL8sjEOvfEI
	 3Qm82FELaQJMLD0SpHjcc/WWzO61isMtPJJHl/VMk+6vPH8NDYgW8EdCzpIyeJVyIn
	 QUr9LGHremKH06KE5gHmUhul7ww2C6sI8mTGuAu7Q2upk8gZw4gQ7ll02Pm+EnK43E
	 MRNbKpEXF+pcQ==
Date: Tue, 4 Mar 2025 08:02:43 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: qcom: sm8450-camcc: Remove
 qcom,x1e80100-camcc leftover
Message-ID: <174109696263.2518364.7677859064556164651.robh@kernel.org>
References: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>


On Tue, 04 Mar 2025 00:39:36 +0200, Vladimir Zapolskiy wrote:
> Qualcomm x1e80100-camcc was moved to its own dt bindings description
> file, however a small leftover was left, remove it.
> 
> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


