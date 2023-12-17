Return-Path: <linux-arm-msm+bounces-5118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D68160FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77C00B23A14
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A61450242;
	Sun, 17 Dec 2023 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU2hgYBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B29B4F8BB;
	Sun, 17 Dec 2023 17:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CE0C433C8;
	Sun, 17 Dec 2023 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833722;
	bh=yao3uXY+RP+tZjOrEqPysbGfvyuqbhYjE3+Dx56obBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mU2hgYBBdiAb7Wg6FLYrYVVbU8l4tKEgrnwkWNLTTCrWpOuAGWHEJQILVHP3JAGGF
	 jxlL4wujyhS9+LeJFS6HqgijTU1yPALoXlsrkdAKqoZO5quRq7FsSmKbJs3WQrajoo
	 8JzBEr2p3Dfnre8VpZ/RVqDuVC7NMrMIOdMs7TKaDLVVJk2nqEKH0BXIdY7PlTSxV0
	 TovMQgiEXx6VbJ/mbXw7HzoMnxFJB/5C4XzKAQo9veUWBEMWCElZt1FFdJsYuKwMkN
	 LTWGsCkRUEnO73QBf7kJ31rJY/Ef7Fmd7t9TjB6tXapW42MfvlJm3vMzwyCiZ3vHNp
	 Z0fSqzrsUeQsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] qcom: MAINTAINERS: move Andy Gross to credits
Date: Sun, 17 Dec 2023 11:21:16 -0600
Message-ID: <170283349424.66089.1563929540879666765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211155533.106003-1-krzysztof.kozlowski@linaro.org>
References: <20231211155533.106003-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:55:33 +0100, Krzysztof Kozlowski wrote:
> Andy's last emails related to Qualcomm SoC ARM subarchitecture are from
> November 2019, so move him to credits.  Stale maintainer entries hide
> information whether subsystem needs help, has a bus-factor or is even
> orphaned.
> 
> 

Applied, thanks!

[1/1] qcom: MAINTAINERS: move Andy Gross to credits
      commit: 6594a847820b7ab817b376cd2817c6cce0285062

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

