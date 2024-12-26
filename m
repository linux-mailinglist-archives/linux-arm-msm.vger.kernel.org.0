Return-Path: <linux-arm-msm+bounces-43404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0B9FCCED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3141C1883FF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E561DE4F1;
	Thu, 26 Dec 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7HtUkDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC181DE4EA;
	Thu, 26 Dec 2024 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237662; cv=none; b=loVkt3dzAVrTfObkK6UZFxRZdKTjOW/s5Lln8svufo8vT3Zs345mJs2tD4luKjZWjzXC8B5sYoQpn5aZDNGZGNXWXYyxuXwrQphi1lmmE78A1drH+Ts1nYvlKDkPPG6qER6ZuxGC/xq7Txj8FF/6FGEPbLDkdpSo4J5Vgn8K+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237662; c=relaxed/simple;
	bh=Tdy5DFwBnivOBC91PaL/VTYTi0HeN/PRWRnz+8mENnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHoHj1mztlAuHOYaKKEFibNUe8kuVng6alHdz7PaDTFHBWZA66EA4QoA/wgc0Cbr/3FXm5WKM2T49XRTbclALrMnbHQcAliKFAsg+IgZ2l4Crl1N2VE4rbu7GKzZPJ9S8LItSAX2SnekdLvCm2knQarGMeibSrz42rEZqDEZ7QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7HtUkDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A157C4CED4;
	Thu, 26 Dec 2024 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237662;
	bh=Tdy5DFwBnivOBC91PaL/VTYTi0HeN/PRWRnz+8mENnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7HtUkDZ1W/dovHbFwaGnAuniX7Zs9oqM8xsJB37QE+VjcUePU7vmKZsQKmY8XKGa
	 fGpsZvrk5tB2A+3Ox0gZerAuxgQm+pYL21t9RR7IM+sr2tsgFhuNufOI0u1qrtW/Op
	 hFC4nWXQAlWDAoJfRdCIxQmVLnf6BpfFdoU7d7UaGqGZv11Qg6n7RR6pqOQJhKSv9T
	 Nns/sZLw0hUSVWjrr0LR5oVnmVRAdGWXESYGgYEPgH1LJRu1QVm3XmcRpDVaNlNn/M
	 fsH6lvf63BLZl+zTF2HCJ8a9L7sbGKYKoZX2nqc3R37nNunCjuG+qgBsQm+FXkyPBA
	 EoM7zbBVVBMaA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v5 0/5] Display enablement changes for Qualcomm SA8775P platform
Date: Thu, 26 Dec 2024 12:26:58 -0600
Message-ID: <173523761386.1412574.9421967627997070204.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Oct 2024 21:14:52 +0530, Mahadevan wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
> 

Applied, thanks!

[5/5] arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU
      commit: 2f39d2d46c73ad14d43950753b0437879e41af86

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

