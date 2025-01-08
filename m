Return-Path: <linux-arm-msm+bounces-44477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A86A068D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DD43A6381
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5EF2054FA;
	Wed,  8 Jan 2025 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPtBQ39+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C322040BD;
	Wed,  8 Jan 2025 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376713; cv=none; b=T9JaPAXNblUW0c1q9ioTW0RhDi8YztSb9jEM8hdw/4wT2x0Q966fxZX83nWdAFOxRL5ZM471ClM45/x344v7u5O7cHpmSKQ4axISr/Pk4ERTG56iHltvBSJknz/MPNlAfw+KKT0ToCkR43dnr9TDRseMrjxJz8Lgr5dDs0ghkWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376713; c=relaxed/simple;
	bh=vOnt03fRxj4FJsLVrzWj1LlWSTsGjprX1+wILvy0GJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S92jGRNb8bzbr8q43JM3Nbv8tJPSh78a8+N4g4wv26xQKYtLZJ00N8Fr5vzuEpPsi9Z7394z67VfWy68vURSdmX5n2oGKe7VW3wcPtHzfLdzFBQnKzsFs0YfNivowWWAniW50LxrdL/QAlq3NriVKj2YebAepLZ5eG7X485qyOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPtBQ39+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5746BC4CEDF;
	Wed,  8 Jan 2025 22:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736376713;
	bh=vOnt03fRxj4FJsLVrzWj1LlWSTsGjprX1+wILvy0GJg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qPtBQ39+Z1+TiaHH0LoY8dcENaYtli6RAC5KwAQtVf1CL5C1VFYL1ldOJRm/U/yRH
	 edv2bS2IdCsQgpCr+h2J1nyCLBan7sY7KRqaPktcbUnWJs60hdG69/4FtWfMFUsvgc
	 hcLNOtuOMjkY3MtUGdw5qjjhoIjgHjhxhmaGvN+25sHAVPnRM/9fh1u0MYmbloklgw
	 4cBAw5T7j3tpROnwfuKTA9wYp7UBTQ/sk2tdMk/iR4jkP83HcV/J5MpnoXtqzPKBJ0
	 LYQLaKEsePPduea4IA4erhN17uEEy5YqG0xWJ6AVWonIQtXR4QMYfu1SIXcqXgW5zc
	 JotIpThNJx+NA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robimarko@gmail.com,
	quic_gurus@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: (subset) [PATCH 0/2] Add SCM support for IPQ5424
Date: Wed,  8 Jan 2025 16:51:45 -0600
Message-ID: <173637670468.158785.6383662978686205801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
References: <20241204133627.1341760-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Dec 2024 19:06:25 +0530, Manikanta Mylavarapu wrote:
> Add a scm node to the IPQ5424 device tree to interact with the
> secure world.
> 
> Manikanta Mylavarapu (2):
>   dt-bindings: firmware: qcom,scm: Document ipq5424 SCM
>   arm64: dts: qcom: ipq5424: add scm node
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: ipq5424: add scm node
      commit: 2561c1377d4153ad1e31878eaa9b6a8d2975a71a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

