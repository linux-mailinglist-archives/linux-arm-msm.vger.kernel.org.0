Return-Path: <linux-arm-msm+bounces-80209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39499C2F336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 298CB4E52EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCD32BFC60;
	Tue,  4 Nov 2025 03:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYeyvUfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDE62BE64C;
	Tue,  4 Nov 2025 03:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228177; cv=none; b=CnY9OMM2sv/UQB9uujoPaAa/ZxR9xApfzfcfiZVqwc1VuNm6PuNuFA5Lpz/PauvAKZ3rqRcP0XpIjRNo4Dq9dVgwy/l0QQq2oQAv2Qq8r/EWFIrjmAy9Ra5MIPkTGli1MsdnZ7YzDaFrD4UItFWgaa6bUvkj8gvj91S59RrkDos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228177; c=relaxed/simple;
	bh=U2ixmBW6vD5IuWIsDRqvN+xXZuukpsmnDpocXTqbN6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ocv3qWZMbg0ba4tyXcfYTEJo4j9x0ZNrnx7M9vGg3f0JqaSLv6cbq3a6h6JjxibyBfqaxd436zwYvv0PBSZ8IlbB29om3BgegHzW/B/UwhEOI7+jgRX02Di5tHUk+t78n+SbADfg28FC7qP+C2Jv4MqSQPbSWnvtS740HhISMa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYeyvUfc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B947C116C6;
	Tue,  4 Nov 2025 03:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762228177;
	bh=U2ixmBW6vD5IuWIsDRqvN+xXZuukpsmnDpocXTqbN6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oYeyvUfcSNQ/WBtlUch0F0dYe/yCsaB8ezSbrAG2tBRbHC9U8Bz7pTJ16W8eyp79w
	 36hjjgvhZbArjZsGEs0e7eg7XGZz9c3N8kpaae/fyalE/lrpqFakXtCvnTn3He9PUq
	 /R8ocDe/U9JFy9s841xYK/1pxGvDG80aTerk6mleg57pll3ExqCUQqrq2qpRg+djrU
	 LmVRn4/suMMWG1RhqqLmIVpwuyJWMSihHRgvQQwZOGfcMzy86nYHvGC2Kjb/HPw1b8
	 8pV8uwuJ/uypIzd/tOlZX7uK4Ky2PwG3iqx3E8TXfL/ywCbbJ7b/jeFY5LGp7VcZQK
	 F5kwYZqr5szNw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: (subset) [PATCH v3 0/2] dt-bindings: soc: qcom: Add soc related bindings for Kaanapali
Date: Mon,  3 Nov 2025 21:53:01 -0600
Message-ID: <176222838026.1146775.13955186005277266199.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 02 Nov 2025 23:25:05 -0800, Jingyi Wang wrote:
> Add soc related bindings for Kaanapali Platform including IMEM and SCM.
> 
> 

Applied, thanks!

[2/2] dt-bindings: firmware: qcom,scm: Document SCM on Kaanapali SOC
      commit: 682921ab33129ec46392b27e9dafcb206c2a08dd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

