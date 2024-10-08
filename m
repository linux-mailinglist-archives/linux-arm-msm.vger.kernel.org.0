Return-Path: <linux-arm-msm+bounces-33588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B523995441
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4E81C25551
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3F01E0DA6;
	Tue,  8 Oct 2024 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rial4+8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B21E0B6F;
	Tue,  8 Oct 2024 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728404496; cv=none; b=YDoJhC5jtKFiam0Cy36aGk4k2SOJKBbQtLy2eZ0jlYShPtb0sbKK1OPMCWhX6lsRmTl4k96o1XEjNSCy2cgaJumvsF/Wv2snjbO55LuVWYabnW+rCn6hGcaYWkpA/1CFJ5l3gD2bAQk3auGnS2EKRQAZqymGXcpGVcInUsn1UyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728404496; c=relaxed/simple;
	bh=cK2AO0UyBXyi9yD7+SO928e2An/r1n3pdnmvV5sfwgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YPJyJqQOOu/4WlTRbxZ3qHWPCFvw00s250bIidFO8N6g9jNVGCEIO8NM0nJqhQe/ubQ+M9hsUl4/ByipBa1eS0RMRnH4OVes7lyrXR6x9XBbKYk2s5y9WYkKqrT3F5H9dgdUTiKB95IbRudJ+xz+8deUUbFysJhklTCGk0Lt8ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rial4+8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DDCC4CEC7;
	Tue,  8 Oct 2024 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728404496;
	bh=cK2AO0UyBXyi9yD7+SO928e2An/r1n3pdnmvV5sfwgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rial4+8Mhh4nfHDTBhJegLh6zRIquS0VDkRcaOvfYZLgvc7sXhw4GwNvU0Ukdh07o
	 47BRMJASioeFu1ZdKGuKad5OEKWS6AYHQDdJZICt0jWMeDJLIFiHCw7b3k+g7QlGWJ
	 OD2YTfWloURe7GrecrRXGguE8TsYix1KAyhRcAywhffV8a4npviKMsrLHrFi39AOft
	 qNMnEF1xHPFWOpCbWJLTELg4NuHq/vWf5MfzyRhpbpPramxf6Jpz77nVbhQzZYyyLi
	 QqibyHuwSvbpX5v6rH0UCUk7yrlYbVc8nE2KgmaLYmbcy7U8rZjzb5qU8VHJOA/H6K
	 gtHJLj0M44I5w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
In-Reply-To: <20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com>
References: <20240911-qcs8300_tcsr_binding-v2-1-66eb5336b8d1@quicinc.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add
 compatible for QCS8300
Message-Id: <172840449361.301890.16032825347779980062.b4-ty@kernel.org>
Date: Tue, 08 Oct 2024 17:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 11 Sep 2024 15:44:25 +0800, Jingyi Wang wrote:
> Document the qcom,qcs8300-tcsr compatible, tcsr will provide various
> control and status functions for their peripherals.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: Add compatible for QCS8300
      commit: 1857a06502dd04ebd682d99697e66aa38b15d43a

--
Lee Jones [李琼斯]


