Return-Path: <linux-arm-msm+bounces-35703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A03E9AE98F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 699551C2265B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D311F4FBD;
	Thu, 24 Oct 2024 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5Wt/0N6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76491E765B;
	Thu, 24 Oct 2024 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781985; cv=none; b=tqrNmAbuCI1bfPnlG3FGn4q66vOeMaNZD9IxUh5SXEuxmM9ul3HQqyvUeJBQeDMjNLNYZuax5xVhxAhMWkgOzTcdcrJhtDXWaQsU6wBKMazKzxld/JeARGdYNDo/i/VMCtGeVG4UJ5xNAWuRewdKkRIJH8UeUbH/FUIqYHGdEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781985; c=relaxed/simple;
	bh=0yZttSVkbPzcnYISlyffI81ZlULJCTwT3ar+Vp6eaC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iouu7pncT06Rb/E7sjXwCoIHjyf+2S06+bxmWI5xn6sA8yRavsqzluxmV6gG08MkYup9+wefXRHR3lwZX7OoN2SjU4QRc+k1Foi3Gqn404QHYltqoPGNelZ2iAPGSsRbK3RfoplquhHaSUfIWQWSLAMAfzgztw14P64s5Ziwk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5Wt/0N6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9744C4CEE5;
	Thu, 24 Oct 2024 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729781985;
	bh=0yZttSVkbPzcnYISlyffI81ZlULJCTwT3ar+Vp6eaC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5Wt/0N6hFOn2JKGvzJffEFvSBDYvv4bxWV/k74vLI6cK7H6oTBfdVH0XHUCIRhCz
	 mnX8W0pCAIW6h1MBxb+RheoPLdO897Hi/a1KmmS+3tBS3LEUDh5dJRm8LgAWyiU0Jo
	 Q9GWWkWhus2E5yCSJjSt6MP+zMcXuu0GJKfHzalWwfm4wYIqGidr547/xMV2SEyKes
	 dp0Zii6h1d+hn6Nz/4AlI9SZSKZPLjVw3OJq95mVnHgfUzggemhdhdawTRF0OCExe0
	 13N3hoVDbJF/ywEbkTviKr5jIGR6IoX9r49XRSH0Uk7cbLKTFKMzPJwq/oLqezfGDb
	 OpnWki0JunWVg==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org,
	Rosen Penev <rosenp@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: ipq4019: use nvmem-layout
Date: Thu, 24 Oct 2024 09:59:33 -0500
Message-ID: <172978197054.296432.3598676796224371500.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022002444.843484-1-rosenp@gmail.com>
References: <20241022002444.843484-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Oct 2024 17:24:44 -0700, Rosen Penev wrote:
> nvmem-layout is a more flexible replacement for nvmem-cells.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: ipq4019: use nvmem-layout
      commit: ef4b38462e627f58bc929fc502e601dd396f1ae2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

