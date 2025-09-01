Return-Path: <linux-arm-msm+bounces-71437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1250BB3EE99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA7A61A877D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5753726D4E3;
	Mon,  1 Sep 2025 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/oWgEzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3BC26CE05;
	Mon,  1 Sep 2025 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755974; cv=none; b=idncJnKLRRTOgGDd3hPAZY4PSxgRFfgu4WwdxtX0zm1OONBCTAY4+mIpvn9LhuB8fFozMS8rreH87pY7jThe2W8kPpJxtSQXd3JAZCKqP6oV0YSb+8L6PKwU6wufJgZbkpqyeQkiqd9+crJ5upFoGyiHZHz9i3d10wV7B556MuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755974; c=relaxed/simple;
	bh=UnTcOchOPjP2HXSW8sIiEzIU7yX/f1gaAsVp8j0mK18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHAZaoAbFoQPIn2g35p4uHApTsXkupsp+7GdJrLSKE98OpG3UU+A8TPbCRbDt6A3CIk9AscA2X/SVBMPXe9WhmuCoUdvjNLpumvQXXHtkRMENvoMny4lkuIksIywLI3fEZp8uCjbI8G5fLzJfXxp7xjAWAq6cMBMfbsZ9KY06Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/oWgEzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CC0C4CEF7;
	Mon,  1 Sep 2025 19:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755973;
	bh=UnTcOchOPjP2HXSW8sIiEzIU7yX/f1gaAsVp8j0mK18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/oWgEzHC3wnOELB2CtEAspLW2iYxDJmfRclSTlO1uonvMEtWpeJg13nENFfVkQnW
	 Nd1O97eJEiyHtBzAoTZpKd7xjjerpM48qhQqWKmskVUSbGo5Mz4VE5SamKsD7u1VKv
	 q61qvBmHsik8j1PYqOsrunzJAQjsA2jS4DlYNahM3DpTI6tYvZXh0+pyX93jSdy9FW
	 qbFVI6wGYH2Ei8E+MnIN/5AEaP4/Ud7aa2Kxnb9HLlOthVszkH9ozqHhO7LJe8TLko
	 4zNdxZlmYY+Mhi6k00a8qnnKnwO87ZfLL/71+s7aAiACWHvxnvPXFVhCmgRJI51Wb5
	 pS76CO+xmh+5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: starqltechn: remove extra empty line
Date: Mon,  1 Sep 2025 14:45:54 -0500
Message-ID: <175675595912.1796591.16210497701793993152.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828204929.35402-1-ghatto404@gmail.com>
References: <20250828204929.35402-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 28 Aug 2025 20:49:28 +0000, Eric Gonçalves wrote:
> Remove empty white line ine starqltechn device tree at the end of
> max77705_charger node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: starqltechn: remove extra empty line
      commit: 6e71c5812856d67881572159098f701184c9356a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

