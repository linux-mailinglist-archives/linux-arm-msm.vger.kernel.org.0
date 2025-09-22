Return-Path: <linux-arm-msm+bounces-74440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A497EB918E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE5B61900004
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 14:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FAD1A317D;
	Mon, 22 Sep 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eln0plRe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8A19F111;
	Mon, 22 Sep 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549630; cv=none; b=Sfq+wPSjmAk3Sm1Ej62OU6Mf2YJIPPvfEz3LpUfmePkXeAVMXXjELGd5405kjYw99KEjsWfwjer53tEcBfJB05fKo2Z1h+Id4+d5EztZkFO4Dr6JaD6b7inGIi2ZUMJXDN+ysFq05ulTMJhcSTP1WposRH2xE1aWq9mBEHSgdQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549630; c=relaxed/simple;
	bh=QM4Xe+Ere+bNd5tqXHknQgb0b4fotLoTht1uGvK9hSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyNqOJt8D09BGoVUKomwVZdCadjS5ac+1XutzCNfsjWbhNPT56i3uzPRk7fd+SXVGY7npfkNuRSewpx4mvVqE1mbkGa112W4Li8FpJYVZTJck6FvR/KCbNPy4gf4jUkD3BogHPEG5KkYcos9x9r3nQuxZzdGqQrZcARa/OzOrmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eln0plRe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A008C4CEF0;
	Mon, 22 Sep 2025 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758549630;
	bh=QM4Xe+Ere+bNd5tqXHknQgb0b4fotLoTht1uGvK9hSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eln0plRe+pAFA8SgXSlmm54EpxKcIi+paMDG3JraQCQqeKv3kfkI7aSh8KyYEeT5P
	 qtkL7OJanS5YXSbdSHZ0Fh+2Fdj63MuLvlJNG99uPGnrRz93f/Cjap5OvPdBh5LbcL
	 PkAA3kTGUlM12FjXf0ko2N3EfJfmi1tGS5CSIZrlvMC0fn4saeWl7qmrpfMfBnPOj0
	 RAAUaaNBPRCn7TEqkctkGM9Y79NyJmLNB7vwGd3pbf4fGT1ZyWzlLYJ8pde+YUUGJ9
	 bIZ4ENYXMho7+iofDPesxH/IJYXB8W25YzlT4aXPKz81dnLT2CgNh0yepgscJhR2r4
	 GJENzJXwDe+2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] remoteproc: qcom_q6v5: Misc fixes to prepare for reusing the "lite" ADSP FW
Date: Mon, 22 Sep 2025 09:00:23 -0500
Message-ID: <175854961651.817693.12196182147383570806.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
References: <20250820-rproc-qcom-q6v5-fixes-v2-0-910b1a3aff71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Aug 2025 18:02:32 +0200, Stephan Gerhold wrote:
> On X1E, the boot firmware already loads a "lite" ADSP firmware that
> provides essential functionality such as charging, battery status and USB-C
> detection. Only the audio functionality is missing. Since the full ADSP
> firmware is device-specific and needs to be manually copied by the user, it
> would be useful if we could provide the basic functionality even without
> having the full firmware present.
> 
> [...]

Applied, thanks!

[1/4] remoteproc: qcom_q6v5: Avoid disabling handover IRQ twice
      commit: 110be46f5afe27b66caa2d12473a84cd397b1925
[2/4] remoteproc: qcom_q6v5: Avoid handling handover twice
      commit: 54898664e1eb6b5b3e6cdd9343c6eb15da776153
[3/4] remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on X1E
      commit: 142964960c7c35de5c5f7bdd61c32699de693630
[4/4] remoteproc: qcom_q6v5_pas: Drop redundant assignment to ret
      commit: 1ae4e2dbf4cbf7c1ab2bdc89af1dc1a6af4106b3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

