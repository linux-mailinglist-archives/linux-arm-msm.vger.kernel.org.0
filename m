Return-Path: <linux-arm-msm+bounces-28691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3E953BDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFD5B1F2257E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B3315F403;
	Thu, 15 Aug 2024 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXaj2xQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1C15F3ED;
	Thu, 15 Aug 2024 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754484; cv=none; b=bFWU6MblViLtRiFiCVfPPf/kivnPDre3GfUftp0/3ne+CjKSNDgDhyxn5I+KIPRwEWidnDXbowo2en3XeuZeNMD/mgd6TmlYHjAAQTyGyBfrIcmAlGzi9rge/sS9Sunau+1ST2+thmYH3qBZYJ5+XVWU/P/6xwLNyT1MJK7CB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754484; c=relaxed/simple;
	bh=wUcFxvIMn4NJgrabO74aConfzyULLpCm8Vw4C0XKOtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIYbl/+IS539sMSJqOPV6KWHso3Sogb8Yq3rrjuLoyE/rfRZai1mkZIvz9XvOH7LpXyQ9/ciHtVks8hfJKnw5ehDHlB3bNUb49g2p/rywRGjirLB+cWAR8dyEz/Byx+RsCicOPOOqVndtx9ls044MMt6Paoz4ekiw627YO8Rh1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXaj2xQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB12C4AF14;
	Thu, 15 Aug 2024 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754484;
	bh=wUcFxvIMn4NJgrabO74aConfzyULLpCm8Vw4C0XKOtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EXaj2xQsLB0SLTaMynmLyvnMQ8+DDWq0VQJwyl/kk+lGsuVa+j/RO1JKSnKouLCMD
	 K3wlwJiwEphhDh/RB695j9RJXy9AgbWJBCeKJAieQqkDR1KeRczPEkDY4fj4hbVf9X
	 wTTpZgsiysdeRpvickmYly2KA2jvhrnEptJSqHbzcEGn5rK8Vkpf4XNgnUP/n/1WSk
	 UJhZsVznoZPA/jabDIkwwEG+cZybg2PSL2r5S6GHZPF7PGqWt7ftUKGhRs1KTDme++
	 351xJ5Dtiu8Pn4+q9a8EePDFFUW58KtDL1SHDtsS0byPfXSF9vjL+51RhYbTbEXpUn
	 NdPMsUTf1ND0g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH V4 0/2] Drop required-opps from required list on SM8650 videocc, camcc
Date: Thu, 15 Aug 2024 15:40:37 -0500
Message-ID: <172375444821.1011236.13851740123076656109.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801064448.29626-1-quic_jkona@quicinc.com>
References: <20240801064448.29626-1-quic_jkona@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 Aug 2024 12:14:46 +0530, Jagadeesh Kona wrote:
> On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
> sufficient for clock controllers to operate and there is no need to specify
> the required-opps. Hence remove the required-opps property from the list of
> required properties for SM8650 camcc and videocc bindings.
> 
> Changes in V4:
>  - Dropped change to disallow required-opps on variants that don't need it
>  - Split the change into separate commits for videocc and camcc
>  - Link to V3: https://lore.kernel.org/all/20240730034552.31271-1-quic_jkona@quicinc.com/
> Changes in V3:
>  - Made only required-opps property conditional and added it based on the variant
>  - Link to V2: https://lore.kernel.org/all/20240720052818.26441-1-quic_jkona@quicinc.com/
> Changes in V2:
>  - Made required: conditional and dropped required-opps from it only for SM8650 platform
>  - Dropped Krzysztof Acked-by tag due to above changes
>  - Link to V1: https://lore.kernel.org/all/20240708130836.19273-1-quic_jkona@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: qcom: Drop required-opps in required on sm8650 videocc
      commit: 6720e8dbcb1b6b3b43e38998b522088814ae1268
[2/2] dt-bindings: clock: qcom: Drop required-opps in required on SM8650 camcc
      commit: db30c1160ca5f115476cd8c8008f67572acb2c08

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

