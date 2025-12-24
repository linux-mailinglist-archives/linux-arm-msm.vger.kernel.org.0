Return-Path: <linux-arm-msm+bounces-86495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC5CDB988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 08:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4414A3051E83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 07:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71EE32D0D4;
	Wed, 24 Dec 2025 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcZforZF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7723EA83;
	Wed, 24 Dec 2025 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561563; cv=none; b=l42a3GE9N4+IHAiouUyZGiTAzlOBze0AqVW5uL6y5WmhmVL/JiqRpVk2OXBLm6jocOp4vl9QRGnGZvX8KSR1PM+4YtRnoRlYnJgfSJAumu7vv+n1lP2fKVxhd3jHRqM7N4jxszczT8B1TUvrx79BNNsaZ/YgVfbSLPXa2y64sEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561563; c=relaxed/simple;
	bh=ylJP+93JfVCyvVbLsNC+iyO0mJirMHcMZA2YaclsNzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oYJmiCLgKYqREB+dk0nV/EVEFn0650trjaAlrCbzzJ/wmyhIOB7ZzUfs98Pgqcgprhz4fCSq/GWtjYgLDgX4M1VVWKYBqBUZAqLLA0SATRmkl9PAWD6Mcb2xU1cq1y5xOf4p7yC3ArRbYKydm2cZzjFtIkquz1GNqdr42Unb6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcZforZF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDB7C4CEFB;
	Wed, 24 Dec 2025 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766561563;
	bh=ylJP+93JfVCyvVbLsNC+iyO0mJirMHcMZA2YaclsNzo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DcZforZFCtQ09DeUye0vTlp5wv2lsP7PB8bcBUR08JNKQfbUtXvQz1fKlGjZeKh+P
	 qVZjEY05PMSIGL6NO0kXfiIggwv6fZvSjwpqTwvQqekyOm7CR7uXDspqUim8BfUrxE
	 cveSbjbce1TIBOiBnu22VF+lX5n8INcMOseTQ12JMeVgmvnzTS7KkeVnvJvzwpNyDL
	 1pzJKJbCuPp2DG4RpawJoPrKCqRBdvC5CxScMYJcaDyamB9cvIJeH5qRNenNhHLoZx
	 VQk25LGSMgGHu/Uhkb95Nf0vJhFDWXxhrD+PJKw4bbv0AR1BFtodCLMMveHQgXzd+O
	 1F8kHBiecJoRg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Johan Hovold <johan+linaro@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
References: <20251219173108.2119296-1-krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Add eusb2 repeater squelch detect parameter
 override
Message-Id: <176656155885.817806.9341828805932941339.b4-ty@kernel.org>
Date: Wed, 24 Dec 2025 13:02:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Dec 2025 23:01:05 +0530, Krishna Kurapati wrote:
> Add support for eusb2 repeater squelch detect parameter override via DT.
> 
> Squelch detect parameter adjusts the voltage level for the threshold used
> to detect valid high-speed data.
> 
> Changes in v3:
> - Moved status property to end of repeater node.
> - Updated commit text as per comments received in bindings patch.
> - Retained Krzysztof and Abel RB tags (since its upating commit text adding
>   information in bindings code and moving status property in dt code)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
      commit: a590c0f935349b9f3ae72d9fdec002689915519d
[2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch detect param update
      commit: 5c87da0308f9395700fd3072fcc45b43234366fb
[3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters
      (no commit info)

Best regards,
-- 
~Vinod



