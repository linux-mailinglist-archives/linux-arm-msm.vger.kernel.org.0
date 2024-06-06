Return-Path: <linux-arm-msm+bounces-21845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD98FDD57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE28B22C5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91674262A8;
	Thu,  6 Jun 2024 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8CzHxKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2445025;
	Thu,  6 Jun 2024 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644045; cv=none; b=m5eFUm0hasAWcNW81JCXQq7kUj+LD3Pv61MbG3SEl4dl9t48ZyA0w6f9PpsDYIU47q1NbMRDqlGSZKoY9dk7A3IGrgTsE7ONiwhcmhCLiErgoYSdqm+38JVgdGgHcWSQEfN828TakhvHI/7jm6BLIUcwwwETuw7XXgpZ4AOtR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644045; c=relaxed/simple;
	bh=A/GjeyD0InaRfkVNnD/wpHfmQMVPc0nvJ9ZoN1aasEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vi7845TU/iTzIcEWtn/Elo3q/2lJBelL/vDAeCYSHd7hJ6oF/cq2CFqDyU0rFtlcIPIPhrM0f4leaMjbsJUWjUEfMbMmk6jaNWaBnZnrjb7/F8Hz3LyKn2cmMfa80E/knfJU/4wCN4Jc22ipWP+lgpwCDc0hppyxfin0z/2NREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8CzHxKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24893C2BD10;
	Thu,  6 Jun 2024 03:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644045;
	bh=A/GjeyD0InaRfkVNnD/wpHfmQMVPc0nvJ9ZoN1aasEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8CzHxKg1baOiUrDJyJkb/bL761Hg9IR6avchJWkabDRudo6Exek7uaB0J1eAdQlT
	 kQSBz01wDM0r/IG9+oEXBLygXWiCQQgLeIY5uK4LI+y6TYsKCb1Y3DMYKlVOmr/VgN
	 hA+3a4d63RtT+n6MdmD+xBswhYXXQ4ooTtgRk57Um5nI+yBLBvuSdzzVfuKTye/zPa
	 o7BOiAmAnCQf2PJe3ESmvWyrM7YjRgxrVPY0mI/1NDcQ9V3F2BbilRqVDl2xg/Bwjd
	 2PSr+WTnwqULxWvGfl0jtWdSDDqymvUn/yxZuG2g6JoD+VJQQnKyoZfDu7qH/Phkl5
	 ozdNArtT3DHWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: qrb4210-rb2: make L9A always-on
Date: Wed,  5 Jun 2024 22:20:31 -0500
Message-ID: <171764403328.730206.7407015069364923910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240605-rb2-l9a-aon-v2-1-0d493d0d107c@linaro.org>
References: <20240605-rb2-l9a-aon-v2-1-0d493d0d107c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 12:00:49 +0300, Dmitry Baryshkov wrote:
> The L9A regulator is used to further control voltage regulators on the
> board. It can be used to disable VBAT_mains, 1.8V, 3.3V, 5V rails). Make
> sure that is stays always on to prevent undervolting of these volage
> rails.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qrb4210-rb2: make L9A always-on
      commit: d6c6b85bf5582bbe2efefa9a083178b5f7eef439

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

