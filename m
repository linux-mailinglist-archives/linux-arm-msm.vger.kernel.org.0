Return-Path: <linux-arm-msm+bounces-27656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F79441CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12BFEB249D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED07F14B964;
	Thu,  1 Aug 2024 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rWvOLrtE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39214B957;
	Thu,  1 Aug 2024 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482408; cv=none; b=legaZojcetDq6X3W6VwdrTxMKxBCLkyeMruv6lNOr6P6T6LH3GaGIyywgvCS2/8Y8bGys0zuylAEACe6GLY3bbCldZh1+Mal0FFVPxRsaj45lYzcn4DlIaqSA36GwhbAfOWZJJsMCYQTKkfiHN2muIZza1yPEYFbHHfAeEk2Vi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482408; c=relaxed/simple;
	bh=FHkodLwBkaNsh86EqXVleT/LCfkrzJLjQ5EDyUdDgX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WZoddMlUdKMuoraq/QmcFgNcm6dYcWMNKWtuTHLYhLjKSg16Ghymu83XS9ho3dF1oKB2z4hI5Dny43n9f2Oi4UDZDWM++/mttjO3Mj7U3YJP5XcGP7Q8Oc2Q9iwduW+byNQTW8WYrE+2JuU0tcCo+22puX6vOOv7WqQ4b45jFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rWvOLrtE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6172C116B1;
	Thu,  1 Aug 2024 03:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482408;
	bh=FHkodLwBkaNsh86EqXVleT/LCfkrzJLjQ5EDyUdDgX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rWvOLrtEYNV1e7QOsRQm/bUFTTQP1Rnm+BOgOsvqK11OrlGPIfhocSMngLbAFPJc0
	 vIzUVQSS5pjM5p3cjAWNfPYsKIT6LyL9n9qvasnLrv6YSegiKHzQg/hKYy445IUaLw
	 8rcNj9iwGbNkGddYXBs0GeGPssJZhRLtePDOvZraSpADvU6sJ+yBaqJiPrtrRnw3aK
	 GuTwTFIMeo3pgZpJGbmW+plGTU0OSbEDxvFNSsi9pUsw64/lPTII032H7QLX/6crfT
	 Ll6h/uqcOrmRQOEJhh5msHUXk6fcfwQDqSLBB1QUp7QuPidf7QIWomdOM0edultHXi
	 15+XbnObe7aVQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Raymond Hackley <raymondhackley@protonmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-fortuna: Add touch keys
Date: Wed, 31 Jul 2024 22:19:49 -0500
Message-ID: <172248238601.319692.10234728164556158796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724143230.3804-1-raymondhackley@protonmail.com>
References: <20240724143230.3804-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 Jul 2024 14:32:51 +0000, Raymond Hackley wrote:
> Touch keys feature on fortuna phones are provided by Zinitix touchscreen.
> Add property linux,keycodes to enable touch keys.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-fortuna: Add touch keys
      commit: ccf683fa0c9b5c53534030ddc9dd8a8603f715a0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

