Return-Path: <linux-arm-msm+bounces-24206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC5917764
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73D902832ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FC4154BF0;
	Wed, 26 Jun 2024 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U21UsIi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D8153BEE;
	Wed, 26 Jun 2024 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376276; cv=none; b=MohUnPqihjXIzY0EN77HeXcw8pwFIutjo+l9c3AELz06hYnc/2xpanRKajNoPQkzj8Qj6nZ3iJdAanXEI/spdsXvMmKCdTlvo2oprDB+9n7o55PKGuKq7iKqqUSkVx7yoT1L0JiCreMH/u1Fm80HjLBXSFLrC08SNRNO76d9TSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376276; c=relaxed/simple;
	bh=BAEZkfwRshHk3dxRHwd195exnrA3NcxIJJAJHcAOk/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ewv0E03rBaEM9IzVmn8R736xQht0tlaHmc2Lx+AVk5rA2EuTzPXq4oUJM/n9oSkmMJ9pzIiJSHqVukIp8UUSnblFYIz7tCcnFHQhlwaMNzmtnKgyS805H2NsVnog2t8d1nHZqtCFjg2iDWa9xku5BlIHQj4wWqlxfCyrQ30NI0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U21UsIi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3E2C2BD10;
	Wed, 26 Jun 2024 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719376276;
	bh=BAEZkfwRshHk3dxRHwd195exnrA3NcxIJJAJHcAOk/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U21UsIi7+LiMeFSdhXTiiiNzf7h790d3pcPciLtl27OfcP4iuD4YHV9xAwJS+r2+0
	 DWfjSH4yDwqr3KJAeJDMRoARR3SQ5Xj/68ZQzZ+nZxpVe1P1/E/TXOJpQJPXlbf3sw
	 /herypIldJCwM4heciNvjaZ4xQMVArc56hkcKFr2q9hwZ8yupLcC7Kvo0F2llAiV43
	 qyrLmPNYXyJm57ZmhPzPViV977wLRcb45rIDZcwSGjPNdN9E1wt3ZNWs/mdbR266PW
	 cmj3+Kq8FfgwxiLzAaXAwZqTezwwcc6kpFVIN/lQxVHRRwbXxlCgaj3UdBYJ99frcL
	 9yNqI93TPMOUQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	krzk+dt@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	abel.vesa@linaro.org,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH V3] arm64: dts: qcom: x1e80100: Add fastrpc nodes
Date: Tue, 25 Jun 2024 23:30:59 -0500
Message-ID: <171937625575.44413.4888335193320639997.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624100214.189991-1-quic_sibis@quicinc.com>
References: <20240624100214.189991-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Jun 2024 15:32:14 +0530, Sibi Sankar wrote:
> Add fastrpc nodes for ADSP and CDSP on X1E80100 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Add fastrpc nodes
      commit: 653f0a1e7d6123e2d6f1f9366f6093aa9b908229

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

