Return-Path: <linux-arm-msm+bounces-8631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38F83F0DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 23:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0768B26703
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 22:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B562841C8C;
	Sat, 27 Jan 2024 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PL1SjgYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDA33CFB;
	Sat, 27 Jan 2024 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706394896; cv=none; b=Ob4F+HSxPcBpcrN/b6tNUMqrAY3yJMTOaczeJqJpoAUqyrfEZ5UASRSOopv9V/zO4K+Y2ecxXx9bXcQMS9GYI3dh4Vqoyfyf2e2lC8LIBkwzR6IfoHfbpb7Q4WVuDBITUp3slidmA6GGJ2PvrCdLQwJYWk5BD4Mc2qjOtlVr6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706394896; c=relaxed/simple;
	bh=Hhvw11bADV2bjGfbXSRM6UUfG0rGz6jSPvNTlTQ1fSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkHXofBikiJ2IVpsN1JnQYhPpZWY21GyPYUprDA65fwD0lC5CvgSs6ZcraIPIM9fIEt3UZ+LoZb8NzyzQXj8pHdqQeZiGi9KFOHyIZdfBSvucRozCjgTrV7WA72K26EJwcEbH3SwLhklT4eFU4IvqpASmg9gGMuGj/llTHJYTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PL1SjgYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E727FC43394;
	Sat, 27 Jan 2024 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706394896;
	bh=Hhvw11bADV2bjGfbXSRM6UUfG0rGz6jSPvNTlTQ1fSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PL1SjgYbBMN9Ummm+Letj34fvEvw4iOu6Yy8m09QFvFXQSeEM6PN3UKHoIK6EpoR1
	 XG9k/kLXpgPcpQGOgN3qYDCf/Y5K4TWc3GzLi+mPMPbuAt7YQlm6ImZLwXH947//Yk
	 T7FbxrScYu4KxDzDH//JAcWApac3IBsWWIKnLLxAadUR2WBeetPCirwdOzMplMgHj0
	 /18VO75Lf5rXx0zPfSiIAsUs3wv4uasnJMygBsJpCkTsDAsoibJwQrd+ZD0zfVcuAh
	 ZzSEIZepskN7Iuc0X5oN566MDkYch4XP/dq5NGJ7FTum9J7TCESpOL+9S9kykMTwpR
	 rUwICHKLZpykA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2] soc: qcom: smp2p: fix all kernel-doc warnings
Date: Sat, 27 Jan 2024 16:34:48 -0600
Message-ID: <170639487719.21016.10220021272067913723.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123053329.12893-1-rdunlap@infradead.org>
References: <20240123053329.12893-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jan 2024 21:33:29 -0800, Randy Dunlap wrote:
> Use the documented notation for nested struct members.
> Add a Return: comment for qcom_smp2p_intr().
> 
> These changes prevent these kernel-doc warnings:
> 
> smp2p.c:78: warning: Excess struct member 'name' description in 'smp2p_smem_item'
> smp2p.c:78: warning: Excess struct member 'value' description in 'smp2p_smem_item'
> smp2p.c:280: warning: No description found for return value of 'qcom_smp2p_intr'
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smp2p: fix all kernel-doc warnings
      commit: 4abcc42a3f874b515c27bf2d33f1c1d567afcf7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

