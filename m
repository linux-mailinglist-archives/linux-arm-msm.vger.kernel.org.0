Return-Path: <linux-arm-msm+bounces-3829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0758099D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74CC81F21340
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2987567F;
	Fri,  8 Dec 2023 02:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lj5nBKVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B763C6;
	Fri,  8 Dec 2023 02:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B460C433CC;
	Fri,  8 Dec 2023 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004024;
	bh=7Y8XKefUpcS7h4WyLwRjwdyYfEpECpluqg4Ut7OmPo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lj5nBKVHajJpWArNrqb04bZTknHZAOoBb1awvf3qraAhqWduI+myT8yNms7fiRk/y
	 rjbXrAJUzY05uxUN4pF9It/HqhP0jr8+0HZGS/IEXuvEvUdBGHgak0FoWJNkDcxlXh
	 cnd8WotrYzwDTfD81j+S4mJlZrfWbfAyNPJw49t9UfUNRnsxadWMEkgu8s9Dv6g2Uk
	 rcM/EXdSuviLV+5B2ulmyH8vP+/P0Jb2AU28eNst7wqWMZ3xrXp20xjaEff8QmXVXT
	 zH4CCQiJFiiAUIbiyD6I3Co+u9e4GIdew4pUgpS9FcXlMQinSq0wMAaYYpdjp4WtuQ
	 0kTwO4KlIG/mg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5332: add missing properties to the GPIO LED node
Date: Thu,  7 Dec 2023 18:57:48 -0800
Message-ID: <170200426909.2871025.15697445467291685865.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-ipq5332-gpio-led-v1-1-0f0f52617648@quicinc.com>
References: <20231025-ipq5332-gpio-led-v1-1-0f0f52617648@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 19:20:05 +0530, Kathiravan Thirumoorthy wrote:
> Add the color and function property to the GPIO LED node, which are
> missed out in the initial submission.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5332: add missing properties to the GPIO LED node
      commit: 63a021f52f69092f17d24707cd8e81f914f8d1e6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

