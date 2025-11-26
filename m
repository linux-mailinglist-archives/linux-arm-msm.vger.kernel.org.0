Return-Path: <linux-arm-msm+bounces-83511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0682CC8BC32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD45B3AF474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 20:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6996D34107C;
	Wed, 26 Nov 2025 20:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7cEAe7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3394A34104F;
	Wed, 26 Nov 2025 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187521; cv=none; b=Pmp/Jp5nvtAj6TGUcOELYqvngh1llYSt1wsYRtaaF4AO/lS8MCmppG02KY9eXYGCbZ+f4o6yklfaeps9Tdotzg95klep/6UJ+BBHDkVoG+QbqiRjaiR026HdV8eb1p/7z3NDYyH1f5gDDxwreC9X9qPdPbDlKdjORnFGeHqWST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187521; c=relaxed/simple;
	bh=zv5NPZLk5xocYfuAXyByIGPAeSW64LITYQnD70lfGL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QCH4MMCeuV9pL3KiUuRlHYC1/loP0+PqPx1LrmvBJR8W626KJQjSGwWfhnyfgtBmgNzL4lAhpDF7LTCBqzUACe3mcaISn836zRqdo7uXwIqgDekjfXGIEzhGGvUx4r0Nsa8WOm1TiPBST7vCHOz3S5iM42e6u0ijsIG0DYqPrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7cEAe7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10FFC116D0;
	Wed, 26 Nov 2025 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187520;
	bh=zv5NPZLk5xocYfuAXyByIGPAeSW64LITYQnD70lfGL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7cEAe7XnvRePeOgvazlK6nMvfb6YHvv4oyRTu7cnWVEX5M4pwGIzyhjzw1bV1jnm
	 iSPLB88Vr6mvcYHBf0bjJwdoGCRAeUR9dBHr4s9npw1F7ddkfM+J6Hf3VZ/VzntxyC
	 Q4743w5j9S8yVAWn0/qKxivsbyq9Thw20I9Z79UEYa9tGhCMPQfvEXiiylDcMNtZwO
	 bl2hLy7hkWcvg5KBED2s1b6G6Q8voQF9slZy8H1MpHmK791pSPG0TUPusKFjqBLNZ5
	 +1r6CXfUzH+/1nWTJ/FZ4Unje45xL5oeeaZsMdSV6DD/cTJN2DW0XD0abI02ibIE1g
	 au+msK4d5KJ5Q==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Start using rpmpd for power domains on MSM8974
Date: Wed, 26 Nov 2025 14:10:42 -0600
Message-ID: <176418784420.1591314.3648653659027460213.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Jun 2025 15:19:55 +0200, Luca Weiss wrote:
> Switch over the ADSP PIL to use power-domains instead of a regulator,
> and have one commit switching over the MSM8974 SoC plus all the devices
> to use power-domains.
> 
> Note, that I'm aware that these changes are not backwards compatible and
> not really bisectable, but since it only affects the ADSP on these
> pretty old boards, I say it's fine to have this. Get all the patches
> into the same release (6.17?) and then we're good again.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain
      commit: 3d447dcdae53b13b5d7df32c4d1d35971d460008
[2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8974
      commit: a1f2c2d55a81c38d63c251ebb7e73e00be37c229

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

