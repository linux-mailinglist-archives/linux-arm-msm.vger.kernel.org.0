Return-Path: <linux-arm-msm+bounces-70511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 947FBB32D48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDB111B60797
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 03:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F94A2586C5;
	Sun, 24 Aug 2025 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNMKaTYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568F1F0E29;
	Sun, 24 Aug 2025 02:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004181; cv=none; b=UEyASadh7feATd6cr23c64iR16vLzL2W2tokY/tXaitrWb4Xqt5N0unKjHnSiFXo73LkHtOfuuUIgkIC2+E1NW2LD+4Sb/RnVsAPesfvrlrAIReID9PGEL+bIh40qy8tlW8/8GOvm0ZHbS71CrN8GxhMiQfXuAgwO3zr5xBHXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004181; c=relaxed/simple;
	bh=fC8v100SJSF+CDGX+9cCXQiWjdktl/Bss6Vx2/neNbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNyaVdtJtVCEwy6omaW7GzPiBrspHKa1eIJFxsDCRCCI4u0ILzRIvg1pHBuiHYF+MzcbjLiGojwZ1Qln5BTB4uiQ/gIu6WYT5D/5VYbMnjlUI22E/4gCUbF9ihimiDa4dZJg0jbnb+cZTUrONS0wxfn6pNtRIgfJq8BXldLcU5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNMKaTYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A78C4CEE7;
	Sun, 24 Aug 2025 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004180;
	bh=fC8v100SJSF+CDGX+9cCXQiWjdktl/Bss6Vx2/neNbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NNMKaTYXtykmhJUOZyJ6QEMywg4LhmJ5NPqDmlhDzIf/n+VJ/D58cKrDkYZRcdYCI
	 isMOpVUNdvHZYbvYp8fnQf7H0GmxP/gjxl6rI301e6zy/vwXry6HQbcqI/7LdAXeQb
	 XO6MfYIgVBWsTOQwEI7LxMmkKL0EWVoH+PCdEGS1FzTe6GTxSKjqpxZflbXQYITjRn
	 RaVJpbJtUbQHHcyKnk2xvi7xYal1QBlQlwwfpU7JE/+N0aVnNaT6sCZmS6j19fie6U
	 0HG4H341vLlCKQHaH/1wZJEPZ0+fG028y9lnNuk1OeEr26ssp4LjG+sBot9CmJW0Gl
	 SH08NiaOFMHog==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] Add support for clock controllers and CPU scaling for QCS615
Date: Sat, 23 Aug 2025 21:55:54 -0500
Message-ID: <175600415284.952266.15279808700693557526.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814-qcs615-mm-cpu-dt-v6-v6-0-a06f69928ab5@oss.qualcomm.com>
References: <20250814-qcs615-mm-cpu-dt-v6-v6-0-a06f69928ab5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 Aug 2025 14:25:22 +0530, Taniya Das wrote:
> Add the video, camera, display and gpu clock controller nodes and the
> cpufreq-hw node to support cpu scaling.
> 
> Clock Dependency:
> https://lore.kernel.org/lkml/20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com/
> 
> Changes in v6:
> - Rebase to patchset to sm6150.
> - Fix the gpucc and dispcc device tree nodes for the dtbs_check errors.
> - Update the author email and SoB to use the new 'OSS' email.
> - Link to v5: https://lore.kernel.org/all/20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qcs615: Add clock nodes for multimedia clock
      commit: f9c36698db91780eed4ee3a90794bda2a4252166
[2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock node
      commit: fecc6e0b0260279cd1508903db62f370ef4530d4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

