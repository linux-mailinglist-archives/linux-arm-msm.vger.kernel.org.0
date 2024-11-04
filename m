Return-Path: <linux-arm-msm+bounces-36867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4269BABBC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 05:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC2F281792
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1219618D65F;
	Mon,  4 Nov 2024 04:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1ErGYEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC86A18D633;
	Mon,  4 Nov 2024 04:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730693635; cv=none; b=lkGahIILb1+Fl8RO/ww7gZV2CipOXYJbQIcAjxeSm5LeWos+M3gP+E3z/HBJnOm0l4lQMhkw3Sk9IjRm3IHizuj6E53LGZDesPmm0OUi6pseDG+G7NxAVI5vbS6D4Or5Fi0EYNsWAlbaLy7ugACAR1s+o5CGNA/sLpwE6rjfIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730693635; c=relaxed/simple;
	bh=azTJev3j0aYSCUlE+4pXquSIQAAENlVvUjar8ppBjHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/MoQSEnltgIcRqxg3mdURDG7M606JMVsabQHZNMbvo7HMw2bL5ZtY8Jow92uSuIGAs8IpbblDLGCj5Q4Hm66ILnWyDaGUfN4XvxC2f3b0Rex6nvjFarG8obbStOvO1m7SDhk8qusZuvNyCCEpj4YV+01zUL1OIMJee1UM3/hNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1ErGYEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016B2C4CED3;
	Mon,  4 Nov 2024 04:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730693634;
	bh=azTJev3j0aYSCUlE+4pXquSIQAAENlVvUjar8ppBjHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1ErGYEpAP2wPKlHYE+ZOpy6t3joSEzM9HbAhNhQfX7xzdze57bUd2a5TUUMQaFBl
	 HC+fhEFm3bc7niu0IiRYPlFNJxd/zXDV1+LF6AjBa2jOSXKlyYN1ldOeBqgqHRz8wQ
	 gkVwLGBpRm+uNemKqDiFhDp2Tm3J4oGQk8dN3Jn5mxFQL2gHTeDE0+g5IwtmiN5iX1
	 jDqK902+0LFHi+NOXOv9IT4Q8hg8RnXNO2cXVuzC8CUAAArWnaBW8TyNObglr5as24
	 cRBYRp4QXjk3LFYNmPpgvA4yMQ9HbDPUO07yC6n1rsxxsnIkDMRViEct9Ok1AYMHs8
	 dDd/tcgqaSJ1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/3] soc: qcom: llcc: add support for SAR2130P and SAR1130P platforms
Date: Sun,  3 Nov 2024 22:13:41 -0600
Message-ID: <173069362374.23540.7269942391053238978.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
References: <20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 26 Oct 2024 18:43:30 +0300, Dmitry Baryshkov wrote:
> Add support for LLCC programming on Qualcomm SAR2130P and SAR1130P
> platforms. These platforms require few additional quirks in order to be
> handled properly.
> 
> 

Applied, thanks!

[1/3] dt-bindings: cache: qcom,llcc: document SAR2130P and SAR1130P
      commit: 53b3e2e0c9a36263be6874203c68bd7bd104663f
[2/3] soc: qcom: llcc: use deciman integers for bit shift values
      commit: 6dd3f08c72d607372db9b96df95fc6f462981ee2
[3/3] soc: qcom: llcc: add support for SAR2130P and SAR1130P
      commit: 1685f685ff8036c74c3b5e9006ec7ceda5bafefa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

