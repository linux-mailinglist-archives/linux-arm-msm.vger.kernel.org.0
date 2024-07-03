Return-Path: <linux-arm-msm+bounces-24965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A86924FC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F26E28F183
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38766130A79;
	Wed,  3 Jul 2024 03:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOLYcK5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C248130A58;
	Wed,  3 Jul 2024 03:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977868; cv=none; b=FyqPMBT9CJPOzduqwYWujwcTJXq2v3gunMhfUWp7J0RFVQLj8Lw5JrUAts2sWEysA40SQ/cOdOEGi+9Xds20+tAyGm+4OT3WSA8T7VyfZnC2AiKKAsWLLanQteaHa2miz9EGnK3OM7ASSDEkTJo8hLHNkW4eXXjvVQgKkeP/KIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977868; c=relaxed/simple;
	bh=6TDXQTG++TbpVEUx6lNGsMRPGRrbhV5OIIZyQ0wWN/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMZvxpXcEucy6MES81oknsfWBToA3nuD21t+E2eJ03rAPEla9HgDWO/+o96xym/10orFtj1iarl9XgFoIffG9nj60Gk8JSFAvnONJIEaAzyYi4dfzj/nLFlgkWdT4AvSQy19g4A40c2Ge35wAqDsRqUoUXmOrEZZdJn4HWVOIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOLYcK5s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA56C4AF0D;
	Wed,  3 Jul 2024 03:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977867;
	bh=6TDXQTG++TbpVEUx6lNGsMRPGRrbhV5OIIZyQ0wWN/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOLYcK5sw8G4aalGY6eoXeipol1qQptTqfvynDmFWdhqvmYsoxsOQ26lA6aJpRSoR
	 jExO6/QG8c3DIkxnMfzWVTwswosjW8ITKR286zuqfv/xRfdEzYbtSB67/07rmSlSLD
	 C3wj4rn3BTEoLNV77M9BJmXPqEP0HxvwGWVpL9sLR54SNJ1I4y1z2ta5LCuYECPMl7
	 G/q4oVIdJadM1QnNT5QURaBdQ64cNtzsUYXPWy1bYCrg1PXSHgHIe0ZL8NsS9TQK8C
	 3iQoonotf6fql13EbqKbUZ9/0e4AVAtQHxuuO4cITJw1+CxJNx+Or9c1MxtSUS4FYF
	 HuEPat66vSXAw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Name the regulators
Date: Tue,  2 Jul 2024 22:37:30 -0500
Message-ID: <171997785361.348959.6115195331037721492.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627-fp4-regulator-name-v1-1-66931111a006@fairphone.com>
References: <20240627-fp4-regulator-name-v1-1-66931111a006@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Jun 2024 15:15:54 +0200, Luca Weiss wrote:
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm7225-fairphone-fp4: Name the regulators
      commit: d870196e3383b92179dfc051fe6f038df9a94ea9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

