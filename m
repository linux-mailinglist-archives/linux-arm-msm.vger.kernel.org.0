Return-Path: <linux-arm-msm+bounces-21311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 690DC8D65A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1A91C21AA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C4A74042;
	Fri, 31 May 2024 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdhjgPgu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1BD33080;
	Fri, 31 May 2024 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717169115; cv=none; b=IVP9bJWL/xisj5xPVacmDR6l4UQ0WjZysBkt8OzP+nq9aoVqSJDYo2w+jDPPisDyRVdUg8fA4shUaR1dfUg646+3LLT9f4KptXzlmAOv8S9CV68NesQF/+tTcqiduDCwUw/nHoJge9krKDKy2r4uKPmQoe3mIZ7zadnhNI4BekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717169115; c=relaxed/simple;
	bh=zxVsxyf0/sNtu7IRBazt4q5BudR9fH+3gYfF6OkKIKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UI7JtRyXgKJGgkBcu4+37vRptdk6GBpTFG79qQumA/6Oq+lQkbC9fVDnwMcMc4MWLL0jUD6lb1ANfiKGpvZ0wnOQit954KEpPaLyKOXabTguaYTcJHcAxcsz02UQko9ijaTkhUX/65Wc6IzhJb/YBkv/+YWn3gjpbBQZeN5TKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdhjgPgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814C0C116B1;
	Fri, 31 May 2024 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717169115;
	bh=zxVsxyf0/sNtu7IRBazt4q5BudR9fH+3gYfF6OkKIKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KdhjgPgu/aHy5I2QrRAxUXtQkttbYDOkDQlkRn7uzZqqQoRibwHweW9F5yVdE07xo
	 EDPX71jtSXZfP1t7lWWR6mUFqTNnBwxfYu4LSqt+HoUU1jQdo5IZTw+hN4+c6arg66
	 v5340PxwQl6ndm4KJI3HtSDHzvAcFPrLtWP7E5Epnv29r6pwCSXRHM5BysnthyaKyg
	 98HpnmMJF1MmgUJ8TvFSekQpH3/Cg1FI+/5sbMKCIehP6CSoK4weQmFO2CHFxh1L1A
	 HsYaxaarxH7RRKlMd5iXTlYyTDyYji+6QRkB4yfyWNms98WGqPdYDmD7qwEGLiVlzs
	 ZVT8nhMRS/yYg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240527-smb2360-bindings-mfd-qcom-spmi-pmic-v1-1-31a2c051529c@linaro.org>
References: <20240527-smb2360-bindings-mfd-qcom-spmi-pmic-v1-1-31a2c051529c@linaro.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: qcom-spmi-pmic: Document
 SMB2360 PMIC
Message-Id: <171716911326.1158996.10059017246764192377.b4-ty@kernel.org>
Date: Fri, 31 May 2024 16:25:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Mon, 27 May 2024 10:02:03 +0300, Abel Vesa wrote:
> Add bindings for SMB2360 PMIC. This PMIC is found in boards like
> X1 Elite CRD and QCP.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom-spmi-pmic: Document SMB2360 PMIC
      commit: f22e741dfbc63c7bf5b0640ae5f0a81b00e01b43

--
Lee Jones [李琼斯]


