Return-Path: <linux-arm-msm+bounces-24967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E315924FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 05:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89AE3B2A6B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 03:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AB2135A71;
	Wed,  3 Jul 2024 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omumXkBc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE72135A5A;
	Wed,  3 Jul 2024 03:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719977870; cv=none; b=YagKDUnx3fT3BDDaTT2mNzQy+UEzc7iTPeZ0Kv+aXuYRGfGKstlE+HXeS4qiNH+QDTrDLIFkhjWPVCksg9iMa10qji0HrYxMD8GNzeArmflxMLGF/EhnhvYBeogvtxozQPAA+Xr2VuvGCTyJQdLUd1JPYIRlf1AFgO9OupOC8zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719977870; c=relaxed/simple;
	bh=MrRMLuZGnH4chDqAexCHNS3u5ZHKBvCO0vv1QbfsWZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DLOg4WRFIE89/QEtkVIi0i+rvWpEGtC5U8I4SppVqbgvWAtRGdzwqPFe2lLPjtyBqv7mFANn5brBwusHlEYP3Hf++i3VTYvAUa9RH9yiSQY0bKom96XkV9xhbXnOpooGsx4onUgsYdtzu7LoP/YKt0AAe/Vs01pP+TrS7IJZfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omumXkBc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0CCC4AF0A;
	Wed,  3 Jul 2024 03:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719977869;
	bh=MrRMLuZGnH4chDqAexCHNS3u5ZHKBvCO0vv1QbfsWZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omumXkBcKx7XyfbZF7zI9Hc0Gi86+0y+Ai08DIwGg/tUxI/foXYWg+pTufZJYDFET
	 F5/wYYuYtQFNZBIijjmn+iCDVaEXWROTHMeE1vt5ySjhImtw8G53pgbfRWUd7IrFvm
	 cuEKrqLV6buTWo7nlqaH2ecKJcuHN3dYScHVurA86Myngn63fPOcfceYBD//KZ/wBo
	 QohzQdGlkraNo6oEynRlzYRjaH/gLbr2Fl8pvNkDpXTaUu5ML4X73YCN2fioTkLEIu
	 vNj0FManXNep8/sE3wddoi5jxEzZZEwiZ84blglKFBmiTvJK/N/eWHoWSxz70+RrL/
	 TYeLBt8+wd7hA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: qcom: sm8650: add port mapping to speakers
Date: Tue,  2 Jul 2024 22:37:32 -0500
Message-ID: <171997785361.348959.2519165219541907269.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
References: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 27 Jun 2024 14:57:13 +0200, Neil Armstrong wrote:
> Add appropriate mappings of Soundwire ports of WSA8845 speaker
> on MTP, QRD and HDK boards to correctly map the speaker ports to
> the corresponding WSA macro ports.
> 
> Runtime Dependencies:
> - https://lore.kernel.org/all/20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org/
> - https://lore.kernel.org/all/20240626-port-map-v1-2-bd8987d2b332@linaro.org/
> - https://lore.kernel.org/all/20240626-port-map-v1-4-bd8987d2b332@linaro.org/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8650-hdk: add port mapping to speakers
      commit: 1cda6acb8fbd9c1050737d50a60c0b91b8c64dfb
[2/3] arm64: dts: qcom: sm8650-mtp: add port mapping to speakers
      commit: f3b84707c41fe1c2ca41588278ac1845d15a5006
[3/3] arm64: dts: qcom: sm8650-qrd: add port mapping to speakers
      commit: 519df670e8921d0f9bea2be1049ad601742d749d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

