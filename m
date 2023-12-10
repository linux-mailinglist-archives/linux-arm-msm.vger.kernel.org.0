Return-Path: <linux-arm-msm+bounces-4128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7780BE10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:21:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8A981C203B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 23:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1A11DFC2;
	Sun, 10 Dec 2023 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0CF8kSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985A11DA5B;
	Sun, 10 Dec 2023 23:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D189C433C9;
	Sun, 10 Dec 2023 23:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250473;
	bh=g0Kbp/5XgQ6d460QwkD98MGAnWFUj5029aJTPRWIMlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a0CF8kSlK21LdgR4jMk5K3WjXb/ww+SXaQDTTADhd8fl1zs3QsEtCPABkRyMJfthk
	 6SItBWwoA+OHwPjzK+EHNp4PnqnnGBzTpysawN7mjFtPy58BCD4gIw9eFn/9HjEW1N
	 r+mpIde0LcLhcYnOFpmJy2VdHyo0I1BnED/4Pg11l+FkfsCSkFZ8TBCwD3I5p/9MJC
	 vkzyaYUpp4jGkiYjuNr0shqX5C8PJO6oiXERC5l2TwRejWFid+ZqKLmBjS0izcvTSq
	 SEFLttcYqRvxbT7v2FjdaQjQCss7xlROPEIbrysmGs5468RGrmQh+LRZ3E3uBnKv00
	 tttTZ+8FwwTKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
Date: Sun, 10 Dec 2023 15:25:36 -0800
Message-ID: <170225073881.1947106.2789378693379094414.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002-fp5-ufs-v2-1-e2d7de522134@fairphone.com>
References: <20231002-fp5-ufs-v2-1-e2d7de522134@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Oct 2023 14:30:41 +0200, Luca Weiss wrote:
> Enable the UFS phy and controller so that we can access the internal
> storage of the phone.
> 
> At the same time we need to bump the minimum voltage used for UFS VCC,
> otherwise it doesn't initialize properly. The 2.952V is taken from the
> vcc-voltage-level property downstream.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
      commit: cad7c46ae2d75b42aa8f1e3f741b203ed796eee9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

