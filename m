Return-Path: <linux-arm-msm+bounces-44174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F922A04692
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22E2E18885B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B191F4E22;
	Tue,  7 Jan 2025 16:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcXKJpQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D151F4738;
	Tue,  7 Jan 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267943; cv=none; b=dMcQ9s5+PKl+8T3FtqPZG9XY12MkwgKVMJizVHZBUjfS+8G8K4U3RHEMjY9WsY4Yh2Ydqc9Lrcc3l6OqoLPSoHNbWHQbRae16IVJMyQGZ6Z/Sc3J4OU+xLGJ38EQw95k5OuTbpbBmGPQrHH58tR5n419WXMLiSM/P0wb33NK7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267943; c=relaxed/simple;
	bh=hx/pMlIgyBvSUvaREJje9QfVll71HzZPS5BEhamNka0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOOfsH5GS942xrlWvQ6Zh8sLaRbHtCHlkVXhfT5mXR64YTy5G5koGsZMIVLuK/kRYVB8s62rdhGjV7RiP2MQx1kYpdI4snTCKUeVkW4OKH483BYTgKKjkPLMS4e3lpDKzmlrd82ZeStY19q+5Tx44vXcjj2J39YCk/juoHEcjN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcXKJpQC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB89AC4CED6;
	Tue,  7 Jan 2025 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267943;
	bh=hx/pMlIgyBvSUvaREJje9QfVll71HzZPS5BEhamNka0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dcXKJpQCjqZZegZlhXPn82hNKtEpzyNaDxAbmnMDjCMuPE26pxeUHOln2wuxMpRcz
	 hDrxotCrV2ZvAuwv1+SjFr0EQj8i6KBmjk5Isq1sjWubWGDVEelbu5nfOQKsU98jil
	 JEdsV/sLWeZjn5nFGuO5vinOh6v720iVNCfSy5HsXMZ3jfYqS1cjCmUZ9E0+nrC28r
	 60Pqg3o3Z59tRg4yWHhAZBy8vsSE2UNZa99QPH4k9J1u9bWaUT9Gce8i15yNWPD/Cw
	 bEKEQiz0ntHqmkt/sULgWVvSy9VSWqHEr6sXgo/MUqC3zOblNAu4BiDcfueY9gvZn4
	 ZlK5iUNOihOUg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Kuldeep Singh <quic_kuldsing@quicinc.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>,
	Andy Gross <andy.gross@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/6] firmware: qcom: scm: Fixes for concurrency
Date: Tue,  7 Jan 2025 10:38:38 -0600
Message-ID: <173626793412.69400.280273559890733366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Dec 2024 15:27:53 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #2: Extend commit msg
> - Patch #4: Store NULL
> - Add Rb tags
> - Link to v1: https://lore.kernel.org/r/20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org
> 
> Description
> ===========
> SCM driver looks messy in terms of handling concurrency of probe.  The
> driver exports interface which is guarded by global '__scm' variable
> but:
> 1. Lacks proper read barrier (commit adding write barriers mixed up
>    READ_ONCE with a read barrier).
> 2. Lacks barriers or checks for '__scm' in multiple places.
> 3. Lacks probe error cleanup.
> 
> [...]

Applied, thanks!

[1/6] firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
      commit: 0a744cceebd0480cb39587b3b1339d66a9d14063
[2/6] firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
      commit: b628510397b5cafa1f5d3e848a28affd1c635302
[4/6] firmware: qcom: scm: Cleanup global '__scm' on probe failures
      commit: 1e76b546e6fca7eb568161f408133904ca6bcf4f
[5/6] firmware: qcom: scm: smc: Handle missing SCM device
      commit: 94f48ecf0a538019ca2025e0b0da391f8e7cc58c
[6/6] firmware: qcom: scm: smc: Narrow 'mempool' variable scope
      commit: a4332f6c791e1d70bf025ac51afa968607b9812b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

