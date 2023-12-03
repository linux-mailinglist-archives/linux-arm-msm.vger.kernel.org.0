Return-Path: <linux-arm-msm+bounces-3082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69D8020AA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 169C51F20FAA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1532AA5C;
	Sun,  3 Dec 2023 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmwWiRZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1F8658
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 04:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE563C433C9;
	Sun,  3 Dec 2023 04:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579098;
	bh=PMGhfJKILDRGAquDVmC5ECWv+atrPXjObH+Arp7fiXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PmwWiRZf06siAYWOH7J/IWFLdXE5GLQpOuligc/9BJo83QdqQ+haOxC9f127YvjNG
	 Jym4dGZ/000RjENSxEzvvxB3Y+Rueu4Tyr6/Nr3M9+rtGJoHsEriy6t/r95CX49b2i
	 nM5ET0MpaiRJw+DLzEzU1N1lT/93y9OWnNBmXEhw68JsbbtjyNUbJ2BqhAYhSNhM4E
	 dTGJFwI2CqQRgHFM4JsywfR9fI+Qfz8T6jurfrrJfYgphqGmPERmjwp6IelVOIKF8K
	 DQRIwWEBcE+FXMMG8VX8YNCnJ8kddmr6l/TaYnUdB5CW0nfGjInZL0gy+DKR6S0vn3
	 VznCPgpt1lH3g==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Avinash Philip <quic_avinashp@quicinc.com>,
	Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Subject: Re: [PATCH v2] soc: qcom: llcc: Fix LLCC_TRP_ATTR2_CFGn offset
Date: Sat,  2 Dec 2023 20:54:29 -0800
Message-ID: <170157925799.1717511.7839634771829753246.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012160509.184891-1-abel.vesa@linaro.org>
References: <20231012160509.184891-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Oct 2023 19:05:09 +0300, Abel Vesa wrote:
> According to documentation, it has increments of 4, not 8.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Fix LLCC_TRP_ATTR2_CFGn offset
      commit: 03970d2fa35497d5a5812d67ce94ca5836335159

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

