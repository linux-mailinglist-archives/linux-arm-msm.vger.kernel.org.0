Return-Path: <linux-arm-msm+bounces-39922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E99E0797
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176C92826BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA8F187332;
	Mon,  2 Dec 2024 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiiQOL6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538AF185B4C;
	Mon,  2 Dec 2024 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154680; cv=none; b=bxt54pyAgzhLLH0noe/D9GcFJlKU2EnG9nqlDw49ew35aeQwQiZZBJgitUqLIQh2dIEKI9sCPZutjyGkrlasQDO8IcgAU5yeUkX+a6JUAund/bXfcde5YVxjrumjdr4erUc+h0yAssBm0e1Sh5Ikk72sGhQgOol1PwWmKlUPoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154680; c=relaxed/simple;
	bh=NF9KBv65av+5jRuoOy7Ctn63OEotXIm20V2oKExfkQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zgivo5/iv7L8JgKSGDlRqPwWtqOUsB4NmQ/+fuReowDuLnGlikjAtqU+gbUEcKQkb1JrCEMyjEacjec1VurzITbB/fyGzPfdzoux7It1RLBy+BcDFeebRoTVTL4wtNYCqEH+QIHhhWBkSmpPxHpoo+PikEYSlfty6RGGbH0s/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiiQOL6q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14912C4CEDD;
	Mon,  2 Dec 2024 15:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154679;
	bh=NF9KBv65av+5jRuoOy7Ctn63OEotXIm20V2oKExfkQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jiiQOL6q6i/lyGZ7yB5Rr53LuAhZQ4/N2I9/3F+Z3DUreFImS7tNQJyKwoU7zItPr
	 2dn/Xz9P6yZ4+GvK+koSlGtsrtik34JiLjPFOW2jQCbajvRm7/aRA2iLvGYDWzQ88y
	 T+RZ36EzB0Vla9JzsV1VmqldQMZAVU6e4+dWZTJmF3zyukUbfUeiErSw4KQoHH83al
	 p8v6uyUkeEGqDEw16TE+i3x0NqTzyM0J0UxF+lDijCIB4AJRQvrFKGFP2Gzf5p+hZN
	 d9pWJfTzQeKebaLAxXuoAcKsHUCVWwukyrgfdeOYbkAyaSeK9Kr3ZpFvzhqW2tuD/2
	 Dj4Vs8iRaZ0Ag==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Song Xue <quic_songxue@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: Add LLCC support for QCS615
Date: Mon,  2 Dec 2024 09:51:05 -0600
Message-ID: <173315466528.263019.16689044990703460545.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031-add_llcc_dts_node_for_qcs615-v2-1-205766a607ca@quicinc.com>
References: <20241031-add_llcc_dts_node_for_qcs615-v2-1-205766a607ca@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 31 Oct 2024 18:49:02 +0800, Song Xue wrote:
> The QCS615 platform has LLCC(Last Level Cache Controller) as the system
> cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
> interface.
> 
> Add LLCC node support for the QCS615 platform.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs615: Add LLCC support for QCS615
      commit: 29af58ab4d17f5085a9f10b27edc7f1421894c5a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

