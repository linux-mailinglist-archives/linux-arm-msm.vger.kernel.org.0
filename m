Return-Path: <linux-arm-msm+bounces-10039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0EA84C3DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 05:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDBF528AE16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 04:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D401D687;
	Wed,  7 Feb 2024 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ye5R67On"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10B1D555;
	Wed,  7 Feb 2024 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707281213; cv=none; b=gVn9gsMXCBBwQYoBdQo1tpl88j+vEuleCbYds6rVzAXbjWTMzpb3kRvO9PnOurI+h38tn/rUBs1HDfV4MwFpO/gNI1b1sPJjUhidCPQbsFnAM23VeBT1fclMFPHqHrspbGVl914B5BrtNge8hmqb2bN4aZEpMcbCSU1GnNthNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707281213; c=relaxed/simple;
	bh=yARU6n8c5B9oVUAuwlcpmOl806MC3uGXsMsn8CkJnGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0fG9KaSaHSLyMwvzsYEhP620XwC9fNNCMRdpXt4OIb08GsPeDIhgNhVd9d3qtFpUW9Ge/zVYt70BuaqaQSXFD8MdvfP0TcVtPYGcVsI8NoY9SJBphLRy+MvPp6VsqUfipaZjCncnkdYPsIysycjtW4gRJKitvxdCFPlLTHkfQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ye5R67On; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6FEC433B2;
	Wed,  7 Feb 2024 04:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707281213;
	bh=yARU6n8c5B9oVUAuwlcpmOl806MC3uGXsMsn8CkJnGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ye5R67OnZxtRRNI9wcqOvXzPMd7RMXFTIIsVPx2RTDFPoF6OncyV/8WkNiuI7GKYv
	 WtPRIM2+3Bn1mUmDbWqmEU9ZNMLiJdE/PnObW24zEDbk2gGnk66k9c/cZARsjEr5UZ
	 frtapjuklnxIu258UQBZ3w9gcghR+LKmll0k/KralCnhY96hD/R/ND27Spcf+2pjw3
	 f6i/bIjU/G8uhKsYWGlYz9XonqwvYwtmOlaH79RtyIyY+RQ4U2n8ShjV0wwL5alu6p
	 fPruAyPCQTCs8u9BU+D57caP0wLGpZbDhqW5coh/kKCgeSXFV/OaSUYle5CsdEleCm
	 Sk0rRcMc6izZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the superfluous device compatibility schema
Date: Tue,  6 Feb 2024 22:46:16 -0600
Message-ID: <170728117676.479358.5233595767406493966.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
References: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Feb 2024 18:56:35 +0200, Dmitry Baryshkov wrote:
> The idea impressed in the commit b32e592d3c28 ("devicetree: bindings:
> Document qcom board compatible format") never got actually adopted. As
> can be seen from the existing board DT files, no device actually used
> the PMIC / foundry / version parts of the compatible string. Drop this
> compatibility string description to avoid possible confusion and keep
> just the generic terms and the SoC list.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: arm: qcom: drop the superfluous device compatibility schema
      commit: 869c3d4eef65f3daf2f7a3a4155655f76a11eb87

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

