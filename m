Return-Path: <linux-arm-msm+bounces-49522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103AA4611A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110CC189B574
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15FA221720;
	Wed, 26 Feb 2025 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWmMLq3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40AF22171D;
	Wed, 26 Feb 2025 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740577256; cv=none; b=uS+VDb55GMaLPgs0TjH2TBEu5FV41vyGI6QzwKio2m03l+dBcFx/3b8eRqMLdfaRrIw63DJXzkJEhaY4PUKS34A2hKHUE0TpB3HwbYS3t6D8/lzZEcWjA4eMIbaB/jlBduGSfcx78nfgISze42KLHhDZTuM90JTR5QRHv53nQ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740577256; c=relaxed/simple;
	bh=atuoiEKGjvWyG0l6/UFsnCxdhe/5kXleknnmrJEwoKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q69EnpzLV2GINIWhksi7Rhj0yagWXe8Hog/ZKVBglCDqw6gEaCpM5fguYj31l7Dww0NbpP+3WdpsCuuq9MekWssvEeJNbQpn9PsUmBxyh50wdPoYEegoMuG4kdHWvAP8txTGk3rbrier/PA/NYlsrK8gKiKjwFVO7pi7VP0AG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWmMLq3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435EFC4CEEE;
	Wed, 26 Feb 2025 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740577256;
	bh=atuoiEKGjvWyG0l6/UFsnCxdhe/5kXleknnmrJEwoKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWmMLq3uAF3y2ZQT1/rQ3LleLhY4mG04y+swrybrChGcYmaD0gzzHxfrUW7wNJKQS
	 44ieF4aFZxbAn0LZv8rSeJTA05U+LF8Y4ufHGIg3yUDOlXYi6nCU9vOQ0kvWl3YbWb
	 FqfFqPVuE/N6Dd4g6X1xduVeYhy56riVWotlIfFH9qt/khY7AEyYQmUVjnODHeuyGQ
	 u2lmx/75u895a460DSuovuz+DRRjOa4BMQBckbWQPGIT8goDnUnnUbcr0U2AMgkNwh
	 IP/ATa7Q7Ay6g6Bgf75e8udLVsqCSL78oOBOYv5w2YdXkCgFuEc14/LURcMqT0MijD
	 2Y6ZwAi1WI24Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable panel and GPU on Fairphone 5
Date: Wed, 26 Feb 2025 07:40:46 -0600
Message-ID: <174057724685.237840.10215426173351646866.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
References: <20250202-fp5-display-v1-0-f52bf546e38f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 02 Feb 2025 23:45:50 +0100, Luca Weiss wrote:
> Now since upstream DPU driver can use 1:1:1 DSC topology, we can finally
> enable the panel and GPU on Fairphone 5.
> 
> Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display
      commit: c365a026155ca926f878dee528715be8a02dabc7
[2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU
      commit: 984748d30cd3ce0e11d63b0ba16dcbd61f7b4b9d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

