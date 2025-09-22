Return-Path: <linux-arm-msm+bounces-74441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF5EB918F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 16:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC32189CFE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 14:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35881A9F99;
	Mon, 22 Sep 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJgPTcWJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEA19E96D;
	Mon, 22 Sep 2025 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549630; cv=none; b=E1RCQ9ERK2a+ES9rKdflc8JiyLcjhIfmIl2bQGKkR1wa/ThhajCWG+1Zxukt794YL7LDJxuN56/c3ZJD8GcdljJW1ypXfkus+sa+xErhIka7kuG2zbwz6rxEFt6dLWL7WRaq2WHBkoimix87iBjQrKaCPecGs6FQwW3Pe6BFLNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549630; c=relaxed/simple;
	bh=ot5gDs3uWkRALVnz+D+awLfgmWq2/BB15HPR7a9xRHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4CYsODOJIMyb6jfxJu8fwu7IS6wwMpuuB2Xdxi6K/+hAdshdOiaeV2JZbyvt6h18ytubVQUTHd7LSn9Nw40Mgyj1jvDvbrSzb435Lnoyzt+ANDnx/kOZROzUoARHslVJsSVwp9pWUmxxXnNmVqVg7syCzarxlrd9raxHBKmFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJgPTcWJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395E5C4CEF7;
	Mon, 22 Sep 2025 14:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758549629;
	bh=ot5gDs3uWkRALVnz+D+awLfgmWq2/BB15HPR7a9xRHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kJgPTcWJ79YRYc8fyVQfzA9WO51HxkAAkipic4wiQdRZGE4PGnJyw0PNw2I+SFkxQ
	 gsCzYLdpQxtunXbrSxOjA+GPFeTRVVr/xBSakEMgeszVa0aciitD8bY83RPX8/+5FN
	 noB8NFHCLiAdsVgT99Og3QTeGLCtrQimPD17u/n4rAtfgTmkwo48b0GkbFWIM6R47g
	 A/OvDyaqCImpc9s1vrNOGU9Sc3g5ohwm1fxPZccpX+BdXJST/x0yVSyoMGu6gnB75q
	 MGELkyabon82uNdt22X9JuWH53r0cz/fJ2RoDfHJs229jwN3TLyXQrpMkUkEsv5j8S
	 +ZvXZo9rZEWSw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add support for remoteprocs on Milos SoC
Date: Mon, 22 Sep 2025 09:00:22 -0500
Message-ID: <175854961650.817693.4199511918479024240.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
References: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 13:15:17 +0200, Luca Weiss wrote:
> Add the bindings and driver for the ADSP, CDSP, MPSS and WPSS on the
> Milos SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,milos-pas: Document remoteprocs
      commit: 24723d7c09ddac90bdd9e9864f92eb43ed70a083
[2/2] remoteproc: qcom: pas: Add Milos remoteproc support
      commit: ef575ff2054ceb2bd6701630db2f3d33f5c1a1cf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

