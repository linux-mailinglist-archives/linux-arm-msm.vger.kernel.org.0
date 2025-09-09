Return-Path: <linux-arm-msm+bounces-72851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8809B5035C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A41B174414
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7BE352FF5;
	Tue,  9 Sep 2025 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJwIUKQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE5340DB3;
	Tue,  9 Sep 2025 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437001; cv=none; b=LG1z3ZmZSyPbNBGwM1uz6WM8pAC5EU6WyDW8rivMbw3b98xXFmwtT69kI2wByldjQARv6Odt8HL68rwZvLMjlY6x8taTuzeCb4sg+h7tkHjrRfNHwmjNGqPhX3WgicH2cpmvq+6pLG7QPI731h1eHmOgWwwozzQm9Bop257fGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437001; c=relaxed/simple;
	bh=SHZRdBfB+U++Xz+OoSe5NzvGgCUOwZHF1QKzN2t6TZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWNkiBT5VNUZb5I4reJu/M+OYvoYMCYcUSJltb96vxjilPBhfqMWWqPSQddd5wlqsoCy4XceXyIq50nP+7Iriq3hIGoTLJFvXi2m19keGOcMYR2mwWOC/aS+nyH0E7CQK7YRaOZU7Hj4RrAxfeQwjQWg4LJWi1INVtSXmYbNb0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJwIUKQ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E485C4CEF4;
	Tue,  9 Sep 2025 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437000;
	bh=SHZRdBfB+U++Xz+OoSe5NzvGgCUOwZHF1QKzN2t6TZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tJwIUKQ5XOXwLhu1BqktKXk6rqS5JXwnK2H6RJJrHZWDqCoH8v89Y3ok1y/4uasTQ
	 8Z2+PtGOh4UdETFi4qgR5r5+s/L67R2Z6AEtWa+8B1ySKW4CdEJZPKDTIqnJnJVqr/
	 kZ+Lb8jAJxUIQrF5ZUbtxzjuVkqzm/u2dHM64lK5KDipHwAsLok7TrvwOGYCf4G+J2
	 RBso9JD8kNjGma51M9iHeJioxR+LcSzUlVqaBtGLn0JbL9M+pOMRy8x5SyMhO9mC8M
	 3M3dNOdTLhWjOKgY5fs4zxCeigDSKvCBxkd+ZmYlya1BYjuR32Aut32ln8cEkqZrQA
	 OJ8CFrzZesLgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] Support for Adreno X1-85 Speedbin along with new OPP levels
Date: Tue,  9 Sep 2025 11:56:29 -0500
Message-ID: <175743699552.2735486.15514580662913662588.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Jul 2025 21:50:43 +0530, Akhil P Oommen wrote:
> This series adds gpu speedbin support for Adreno X1-85 GPU along with
> additional OPP levels. Because the higher OPPs require GPU ACD feature,
> this series has dependency on the GPU ACD support series [1] which is
> now available in v6.16-rc1.
> 
> The device tree change has a dependency on both driver and the
> dt-bindings update. So those 2 should be picked before the DT change.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: x1e80100: Update GPU OPP table
      commit: be6f43c64ca0f7929904f31c2a034c81093eb5c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

