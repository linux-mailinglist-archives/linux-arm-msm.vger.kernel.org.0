Return-Path: <linux-arm-msm+bounces-34619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FB9A0E57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05AFFB2198B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4488A2141C4;
	Wed, 16 Oct 2024 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVNitha3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1948020E029;
	Wed, 16 Oct 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092745; cv=none; b=FPn3PXi/lRygne+ty6A4FQ51HL+l29V9lx3czkXpKsc5ZbKPA7Gbdw5x/opMsITOQDLk1z72M6QeebehGNplOiU9AhYTf00M2EqvjLokcZYloIzWAk9YiiEVaZYCEMitrExF+BU0DRIEjcXghagh8vmmP/SOm6o6LVdTqzLcy1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092745; c=relaxed/simple;
	bh=xvg00xC/GGyxchV7W+WqzlwpMzIlDKahYhoQh1+QZ14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zz5M6gfqN8dyybKfERJKuZPcAvojvd90iKcOMX3A360rPKrLbJIFumnyaMYPmnbUpC4VAW5Aq6ddxnUgdAy4/36ay6FhltpdNuV+26ongxfOJhOA9r7AySi5Ygol90n7gOrIepc2R/W9irizN17x9FGvblPq6KasDpXFQuypws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVNitha3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CF4C4CEC5;
	Wed, 16 Oct 2024 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092744;
	bh=xvg00xC/GGyxchV7W+WqzlwpMzIlDKahYhoQh1+QZ14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LVNitha3Zhb19HzEcYg2R3pmmeXimlSBa0WdZPPlJhiyROtOevTGQvlA1tDwf2OIp
	 DxvndEJOugn7wRnYU9UOhi0nhQA4ofOciKc5ZoUrW73IIK8WKznvcljyJKucfF4qES
	 1s+wkYgf48U+iFQntoQ7rVGpROr1htwrkghnOyPGrrneqqgj7ws/4a+vUMR++QhKfC
	 8zqARD3I3+WkbDJa31z45WpAGcer96EKj0Deqki+kzvo7uDckhZlbeCOmYcoJxEeTn
	 JgauBwrLKLAwPtRrsKHe0lYRY0ICfbWUV+w4dgHh4mWicuEf1nOk09OzYSgRMeJDXS
	 JnQIIaRbjndvw==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop undocumented domain "idle-state-name"
Date: Wed, 16 Oct 2024 10:32:19 -0500
Message-ID: <172909273714.703216.15984644907755213071.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014161631.1527918-2-robh@kernel.org>
References: <20241014161631.1527918-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Oct 2024 11:16:32 -0500, Rob Herring (Arm) wrote:
> "idle-state-name" is not a valid property for "domain-idle-state"
> binding, so drop it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Drop undocumented domain "idle-state-name"
      commit: 422f2d418186e3779957a8e4aee7f243ae4cd45e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

