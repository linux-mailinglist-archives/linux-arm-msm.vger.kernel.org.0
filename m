Return-Path: <linux-arm-msm+bounces-35734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5D39AF043
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 20:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B16A1F22301
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9A3215036;
	Thu, 24 Oct 2024 18:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOMgJkmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B3215020;
	Thu, 24 Oct 2024 18:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729796218; cv=none; b=Yx+TcPnw2F1wOzCGpKN+3fl++c7S+omFdLZDgaw1BNUZZQdLgMHVkKmE3irTBPyf41isUG80jHNfiWCLRTpNNNPJNEMSgSPQiCBH58pGPVtnSljpLVd5UB7bj5HHfo76pX9igawzJUQmA6SlbUmV6wA36ijP2vA8MjTUE9fNP14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729796218; c=relaxed/simple;
	bh=P84Y0qJZG/7dz1Swpa2xtavPk25/zI0gwrJaeHwiuns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5kNrbs1uPNTH4cufx+zflhSbt4SpZr9/2bvmwORx8PVk3OU9e1Qez4iQ3lVpCEjLjIOD0F8hZJp6WYn9WtyIUPMMnJiu9uMZPVqEExG5RtQ4kuhwJ9nvHMSFNnvMVNgiaE3waxSuHUS6LMigiMiJ5ldS6sVjfaOi3pDIdgnrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOMgJkmj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD34C4CEC7;
	Thu, 24 Oct 2024 18:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729796217;
	bh=P84Y0qJZG/7dz1Swpa2xtavPk25/zI0gwrJaeHwiuns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tOMgJkmjJEbBjFFzG3lvoF0veFmQTjBec0Vpu/2BGott9T4PDQGxEf+cIG+gCuWRu
	 3u27QuW2Oc2yjLMdrWGR7xgSC2UAr5v8SgcliDjtOzL9RN0o2EpDZYelwlAl7iBGRL
	 pclEmiLtT2r7O41w/UPMGHAgqk6NmW9McDyC7DFolQ6ni+9uJMLQt3lSuEbtYFFM/1
	 EMZcchQ9evLd8n9s+hB52emAzPldI2GKGG2O72wI5fbgLIh7QL6TgxcUpG4eQ94DvK
	 J6UA7dmL1f5DeQd5wKRkHX2LISIkHlqXLrtQgHYMeQduEXl7H8/QKmermuZ9eY8kQf
	 q7dLECkBetfvg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2 0/2] soc: qcom: pmic_glink: Resolve failures to bring up pmic_glink
Date: Thu, 24 Oct 2024 13:56:53 -0500
Message-ID: <172979621232.309364.9966362822139382018.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
References: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Oct 2024 17:24:31 +0000, Bjorn Andersson wrote:
> With the transition of pd-mapper into the kernel, the timing was altered
> such that on some targets the initial rpmsg_send() requests from
> pmic_glink clients would be attempted before the firmware had announced
> intents, and the firmware reject intent requests.
> 
> Fix this
> 
> [...]

Applied, thanks!

[1/2] rpmsg: glink: Handle rejected intent request better
      commit: a387e73fedd6307c0e194deaa53c42b153ff0bd6
[2/2] soc: qcom: pmic_glink: Handle GLINK intent allocation rejections
      commit: f8c879192465d9f328cb0df07208ef077c560bb1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

