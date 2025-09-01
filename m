Return-Path: <linux-arm-msm+bounces-71438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9832EB3EE9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C0B8484FBA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CA826D4E8;
	Mon,  1 Sep 2025 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrCHkodu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42A26CE0C;
	Mon,  1 Sep 2025 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755974; cv=none; b=fDrU8Jb2q2eEDz5oIFPM+2GmWKS/7O8vC/gQZN/Si6AWHrA6AlieQbBtl1r0B5/FA8W9f3640PMv8qxBN8XGXkLOZZydCw6mbaN0mK0vUxfyfQfsqal0452gSSXiYMnMH/zSkwE99Ndpm/3vB99Ifeuqni6GWxbFhIXEW3J7WEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755974; c=relaxed/simple;
	bh=vqWh8nheu3HNr4dOzXBvAARm4CFkmfaBxmpN9yPcMjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUrAZHOQoLEYwhWeUE++v/eWOweJzJg/Gebp0r8ZuTCQkI+HzmiTYbPghfT6hp7/HsqNd4/z6BF+uGRzAqQezAcHNmWTZQCmqYumj73hV1OOr78Vg7uC2vOub39PYAimuVUk6pOQJdyYAagAFDc1QM/UctUpEg41/qFYmftb1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrCHkodu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6A0C4CEF0;
	Mon,  1 Sep 2025 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755973;
	bh=vqWh8nheu3HNr4dOzXBvAARm4CFkmfaBxmpN9yPcMjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VrCHkoduC8HmYqVfOhmm7JDBSLll49/mKBBkN4HiNpRYsj/gMwsYXEQNvFuHlMHC8
	 R8FSCRfRq/AsPxBLLNVqMm2ucQCb7bQHQYJoeLhQei7RQcKzHdsCrzlB8jdh7ELN7E
	 U3e0WDvO+BZpPlDSUKK/s+aaN9B/KSBXPh27GOIKbSWQeVga0pD8u32fJ+rIIvJEuN
	 Xn6F4oL4OeiV9BbFEcXm4W7GV9PtNLMiu9z/NBU7ukUNcPGlMo9ucw/8W6uyeHcW+y
	 McRaPzh5QfqW9oJuZQeGdGa/6DjAiTO8ZaWxcxijdU+AWw78aIkvns1BUuP9ry/VW0
	 0jRCrGQhyNoag==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE
Date: Mon,  1 Sep 2025 14:45:55 -0500
Message-ID: <175675595923.1796591.14252247854637333569.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250815151426.32023-1-ghatto404@gmail.com>
References: <20250815151426.32023-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 Aug 2025 15:14:24 +0000, Eric Gonçalves wrote:
> Add new device tree and binding for the Samsung Galaxy S20 FE
>  4G/5G phone (SM-G980/SM-G981B)
> It features 6GB/8GB of RAM, 128GB/256GB UFS and also has 4G/5G variants.
>  For now, this device tree covers those variants as they have the same
>  codename and RAM is assigned from the bootloader.
> 
> Best regards,
> Eric
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: document r8q board binding
      commit: 5fa902fb5716f419915fdb11c6b7e62f5ba7d14f
[2/2] arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE
      commit: 6657fe9e9f23b1c61d0bcc14a3af732f92fdc19b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

