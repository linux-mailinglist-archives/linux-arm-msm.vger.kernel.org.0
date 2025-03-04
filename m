Return-Path: <linux-arm-msm+bounces-50233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E0EA4E8A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA4C97A968C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77E3253F2A;
	Tue,  4 Mar 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brIWI/Nf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0D51D7E4A;
	Tue,  4 Mar 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107621; cv=none; b=PxQFrPd1U82FMsYyuk2E6mQLcQ4INaAzCwIuhB3n5pcOIYMrWbEdMnAAS3g9hofNO4dZCRxwfX4r+EE5BFaAMEiw6Ps5v5Gov9HKwq19hyJOhG9ULAO1V43zRqPwhuPjGF58LabF7lKXfOcBeZ9o45ZW/1U1/g5qslcwrq0FGPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107621; c=relaxed/simple;
	bh=hlxMpdoAjFim9YU25y7FdSrY4GrdSC2HpAi7VKop3xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G9PhcttYONzfHpXYUlQDX1yCvRq2yGeVoHujTkvu5QQ/1vIA4UzquGggyZSYiwI5T0361g2/vjb1yoqgxZCn+SlhmmWC7z/I5t3M3w4dzUubArGPjsvc9bX+/vWwUTXY6YH5lUEvlh4+4OJWQtr3IlGSvZjBTEQopS3Toa/RxQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brIWI/Nf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACDBC4CEE5;
	Tue,  4 Mar 2025 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107621;
	bh=hlxMpdoAjFim9YU25y7FdSrY4GrdSC2HpAi7VKop3xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=brIWI/NfQQv14rL4EfzE6TMsrhxWef7KPKSOMTFfF3O4FEXbyWiN8UG7c8zvnbCi5
	 cNvrgdhOPAYrtgC5CfbhSKsBVaOzWNnexUhqr7nQUKudGVx8oCklbi66ATIo3TzaiR
	 y+8ZxtedCmUh/tRsh5qmR63P7MLW5sdpyB+6ZpmriwmXfEaWz6w5ke09V9J0lR20M6
	 GFNy7nsAjy9HZVrRLHX4cTRV5qRvBgOk3nV52KHJEBL4e8OVnQjh7fHk2bEQo3JlPH
	 x/q3buMTs+tc6yuqIs5RmW561nb+UhPUBmjB17GQwqHz5Wav9uw91XLfYrOxS5OCvJ
	 1plnw6zgZWPqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: qcom: Constify 'struct qcom_cc_desc'
Date: Tue,  4 Mar 2025 11:00:08 -0600
Message-ID: <174110761297.741733.7554822995741465462.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Feb 2025 15:59:37 +0100, Krzysztof Kozlowski wrote:
> Make static 'struct qcom_cc_desc' const.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[1/4] clk: qcom: camcc: Constify 'struct qcom_cc_desc'
      commit: 0f358f1ad56d781642b00454b57e4f35c4d74295
[2/4] clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
      commit: 1801cee7c6607dbf638d9e1e6a198c9b3e2bda90
[3/4] clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
      commit: b9fe89a100ab1a31f56c91682de402c9aeb2f701
[4/4] clk: qcom: videocc: Constify 'struct qcom_cc_desc'
      commit: a8e4ab5bdeeadf873a36f904066185acb1540021

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

