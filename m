Return-Path: <linux-arm-msm+bounces-19088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D08B9085
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 22:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880AE1F24142
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 20:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55563163A9B;
	Wed,  1 May 2024 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIxWD699"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3861635DD;
	Wed,  1 May 2024 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714594862; cv=none; b=t8ybS7skt8ysfOcvf2J1qxkIOpIXmSlIMQ7FOp42kl+wj2hW1MeAmQ2sf4WHonWmZC4p7bSyYqBBfkM/IsaV2/ldnI4eh/eqJBuotbJbyQEkholJtBhvusUvsC5T2muYod+hWlZFCkys5RStEhO9iDkGXRx6uW46yekht5IjPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714594862; c=relaxed/simple;
	bh=mPOJh2JLb4+G/HCcjgvW7ybqGHrgyvCNEINt8rp7a4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqCkGdOLU9O1srlcwa/sLbnDogoz7STqExEFQyxMkH7oHEIe94rxuOEV5cLokJcq1KzYxY9aIEltRngrRd/Vey7JzhYDtQzHYfCqhsdiCFv13oQVELRZ5Dg2JpNkOcmgx1H0cmIn98LX7PhQ2TurjMUhjGbq8mFqzx4k/JIaWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIxWD699; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC04C072AA;
	Wed,  1 May 2024 20:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714594861;
	bh=mPOJh2JLb4+G/HCcjgvW7ybqGHrgyvCNEINt8rp7a4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PIxWD699KeUiyeFE2xiqaZDvUCYwCCjpg9klaKw2r0ORAtkZQ2o9x9b9ilBZbdnx3
	 vmiiKBT4puN/hh8EAfpUewufEK69gFvB3aIlR7czMeR85JuHdgWrGglEoCUykl0Ajc
	 UB8WdQWssYmDZFjJIzqlYoqseSciHZWluyQozvL/KCRF2Tyji+N7MHWsscIptcznPa
	 SlsAFzi1dXUqQjZm3gPq2JCoTFG9Z2LRhiyBsSaGs//R14U6i7nDDP5txHv8L4zhRl
	 Sq2SXRi+66m8z8+/UaOww2OL+E5TKCOVprdYBMr62Gd2DvXGS2SjVPQgdK9iBuXlRL
	 ew8RfMfdnOpOA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jun Nie <jun.nie@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/6] drm/msm: Support a750 "software fuse" for raytracing
Date: Wed,  1 May 2024 15:20:51 -0500
Message-ID: <171459484204.41039.10194647929173496026.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 19:33:58 +0100, Connor Abbott wrote:
> On a750, Qualcomm decided to gate support for certain features behind a
> "software fuse." This consists of a register in the cx_mem zone, which
> is normally only writeable by the TrustZone firmware.  On bootup it is
> 0, and we must call an SCM method to initialize it. Then we communicate
> its value to userspace. This implements all of this, copying the SCM
> call from the downstream kernel and kgsl.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
      commit: 0d80ac75cba26fde5cae55323b7617f0fec5322b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

