Return-Path: <linux-arm-msm+bounces-23513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B6911B20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870D1282030
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F8416D9AF;
	Fri, 21 Jun 2024 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9ZU8SJM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808A116D9A8;
	Fri, 21 Jun 2024 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950304; cv=none; b=X/oCPYtVITfUqvUjGolSe0h6j8v21U/R7DCH3QJBARsyVD73eWDzxR5joszqEJ9EtfHE4YBSkA6uFzJmsxdOv1wg/4yCzgN7OEZXDPKUpsTMYGkLpSdCDi5djtt7Xin58ZZ3IkNDt/+osAS0Gjw7fp59/EJVAer2UxMRxdNNlJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950304; c=relaxed/simple;
	bh=SnlVex2au9WIDVFBuKTqnVLh0QtiLPrt8mCOwpktnRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hg03nFZTc5hLuy5aIE+8psyfwlBeTPQGljlhdECsp8vApIEDsDmMaD3HVpaQJbV3LENsmxrU2+DI2DLbOSQof8dA8QGJfTd0Ch7zn4h0G1wRbNKysn4uUkUTmY3FJmdyfYHWQEHWlRFFdIcvUtd2QVgAEuhS/OYF2UCHnqR/dP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9ZU8SJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF8FC2BBFC;
	Fri, 21 Jun 2024 06:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950304;
	bh=SnlVex2au9WIDVFBuKTqnVLh0QtiLPrt8mCOwpktnRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9ZU8SJMOVB+fBoV6UreMtWrEIBnjoo0KsZtHeXHyy4p/nmC3FT6fwds2a4yH/BiK
	 4mBhZhvRmIOeLrC3sSeccaT1QFqHE9Dl2tSln8SG+n1itPvmfgy7Jh3/NechpiNATo
	 MbYpOle+pWHZx3qNNm8wFONT9hNRc9i+IrQYM7ZYnGCQbgh4ov/hEcTGvd4AzPUZft
	 gabf22vQHf2YzkL08TvzNv8CqlO7Flyy00ic7cejlJMqAILzZiNg8zUs2iC62tYiQG
	 mgiT6gsLwbb8TbxRIHL4YBIREw/phObzQqCsvTtzpgvXd64tzu1FA6d7fRdyrb9SH5
	 GwBVQ/G1GxooA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: Re: [PATCH v2 0/2] qdu1000: Fix LLCC reg property
Date: Fri, 21 Jun 2024 01:11:26 -0500
Message-ID: <171895028802.12506.3175097705958876053.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
References: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Jun 2024 11:46:39 +0530, Komal Bajaj wrote:
> The LLCC binding and driver was corrected to handle the stride
> varying between platforms. Switch to the new format to obtain
> the base address of each LLCC bank from devicetree.
> 
> -----
> Changes in v2:
> * Updated the commit message for bindings, marking the change as revert
> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240612062719.31724-1-quic_kbajaj@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qdu1000: Fix LLCC reg property
      commit: af355e799b3dc3dd0ed8bf2143641af05d8cd3d4
[2/2] Revert "dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries"
      commit: e32ac54b0529a8727235c04aebe1f2d689fa5cfe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

