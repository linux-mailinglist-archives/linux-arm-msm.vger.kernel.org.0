Return-Path: <linux-arm-msm+bounces-81735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD51C5ABC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 01:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A343AE813
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1715D2192EA;
	Fri, 14 Nov 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFJtv9To"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F121773D;
	Fri, 14 Nov 2025 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079229; cv=none; b=sT2l7xXgImx+0eaA8pdm6B0Ah5t6Tf3nfgEejHQK442/VrT7tqp+WxAz7LGY+3I5AoWDv1MQGnxWzgHpDYm0jvLjOCvP9kJarM2gtS9NCvxfC/+uR+r9mOFgl6Zgtq+bWSlofeAWdMMTFqzlKZhY/TeQqo1EbnIQIjEZN8pavgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079229; c=relaxed/simple;
	bh=qEug4otsJCrUwbTNsNXYtGwAc41UDVGLIUzMDsCsm58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eMPhaNZ11KRRPoaHyxUgNyyc9GiRkcd+NzE0IeiuuXlvWHLnFP+oogC1phn41ncE+XRJNN34b6HEGvsuf35Jm0RaO6wAUVmQV9+ufKUqdsPFBh5QRxmK1u9ibzBh8wGj8QCpLii5v/gWETjU4O49CzdkKyfVL977yFKywbq4U6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFJtv9To; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224B4C4CEF5;
	Fri, 14 Nov 2025 00:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079228;
	bh=qEug4otsJCrUwbTNsNXYtGwAc41UDVGLIUzMDsCsm58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFJtv9ToW0uoL3iJ98lAp2QxMprHYFIHELYj1jyrxsS2zTCDhglcXaI0QoFlNLOtF
	 ZTjZ0RPXbABOOcpDQ1Q+oljKiKPmi1xO0o+ILnB8xUKVNw6aXRdVExN4lR7uYKEaIP
	 OX1tLXwTUtmmI3Pva+B84YSydVha7gAc2zphYRpPFu7jqzMqnk91evuYNH+2nNk4pf
	 sI+WEShK2S2GqmQkEDatdKE32S2Jfh6uC4p2ZUWv4Jrl3CDgnOeISWmyTxC4B9c7bg
	 O3syqT2X5yxBid+KharRNkjRets5mjobdQioxxpx4HAEIx1nSpL/EpUuQT/TyCeyUP
	 HCKE3FxNtT8zA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: mdt_loader: minor cleanups
Date: Thu, 13 Nov 2025 18:18:06 -0600
Message-ID: <176307948645.2565969.9540997429398218177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
References: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Nov 2025 08:40:09 +0100, Gabor Juhos wrote:
> The series contains two small patches to clean up the mdt loader code
> a bit.
> 
> The first patch merges the __mdt_load() and qcom_mdt_load_no_init()
> functions in order to remove a superfluous wrapper function, whilst
> the second one renames a parameter of qcom_mdt_load() to make it
> consistent with other functions.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: mdt_loader: merge __qcom_mdt_load() and qcom_mdt_load_no_init()
      commit: 0cda8823b176a5303a2c4bc2366908e3049c416e
[2/2] soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_load()
      commit: 186b8f8fcc86949eaf0c3bd11a47048ec4c78b5b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

