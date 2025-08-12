Return-Path: <linux-arm-msm+bounces-68618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA5B21B4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10E5868534F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57438253359;
	Tue, 12 Aug 2025 03:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGZET2TA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286CD311C13;
	Tue, 12 Aug 2025 03:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754967895; cv=none; b=tLx6kvZxcFROYR33ycjq9dZJtfUVqIHCbFlnd1Y/B9iHw5/EHpzlEuXSSevurDO56AcjMNcibZOtw58uDuUTbNyZVZEUaJwhApRx1QY1xKnzzDL+9tGm/fAJaM7nl0IFP2oTt/UhAA7yOfPQqAfhoFBTtxywo7tei++9QLhNN7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754967895; c=relaxed/simple;
	bh=UiUlBm/xJSx87bbg8PskOTQIF+WPl1z5etjU0Lq5sQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NgMyEoESjsxWowuGbCVSOz8tz3ZO0k5Ky/EBgXy/7Q7sOU0xPxMtoS5+ADfAHUp03xn9+gzOGm/D9U2gvW33R3lvQKxF2tsAsdOGivtuCYYO8w3s5LlXI+QJ40JZPT9fuQqed9A/ScCFNq9EnlqYqyCfCLBiKzp8hRnsSrobXcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGZET2TA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F055C4CEF5;
	Tue, 12 Aug 2025 03:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754967894;
	bh=UiUlBm/xJSx87bbg8PskOTQIF+WPl1z5etjU0Lq5sQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGZET2TAXltpmeIQ1hs6WjffD/19eejZel7To04+VRqSnMYsWZtC+wakZWrCq3XHw
	 GqPlCYszrq0cqLZC694AcYzPjbinbxYm71PhkhkXfE5ZAzfAEOXWtfwqQV5/TYRVuF
	 yq4AT56oXzcwSWOxiLZcZ0y5kiagVldZu1tnetx/GoWYXiq8AJRK0LpJwevsMKMYqE
	 mHoEDz9uoM5Ega7GtPk/HkodbAVEnbOARKHQr+bUZ9Y0uo/tRH3ARazHXvKbVMbfjT
	 WKOUac6TqH8tG8G7KkMhZWJ+hUOR2x+aOjkh+iBILm0l2OHmLQbEOzgoTDUV4NBgtT
	 RgKAn0ES0bqsg==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 0/2] X1E HBR3 fixes
Date: Mon, 11 Aug 2025 22:04:43 -0500
Message-ID: <175496788909.165980.10869456237314357740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630205514.14022-1-alex.vinarskis@gmail.com>
References: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Jun 2025 22:54:09 +0200, Aleksandrs Vinarskis wrote:
> It appears during initial series to enable HBR3 earlier this year [1]
> few devices were left out, add them.
> 
> [1] https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/
> 
> Aleksandrs Vinarskis (2):
>   arm64: dts: qcom: x1-crd: Enable HBR3 on external DPs
>   arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable HBR3 on
>     external DPs
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: x1-crd: Enable HBR3 on external DPs
      commit: 60fdba1dccd81420bbe8da0d7483b4f28c7fa833
[2/2] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable HBR3 on external DPs
      commit: 93109afda01593c2ddadb4ec1c42b3bdf695ee2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

