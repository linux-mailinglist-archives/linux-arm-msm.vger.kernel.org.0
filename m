Return-Path: <linux-arm-msm+bounces-79074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB98C11DFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B67F7581CA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ABE34FF49;
	Mon, 27 Oct 2025 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="honHckfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB1734F49F;
	Mon, 27 Oct 2025 22:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604542; cv=none; b=ujGzvPkTdXnI19oxOOHxDv6Zl1KPzA9iChlVTIocpVk/Bd0nyx0L8y3i5rd/QmK86jWe+vsoOlGPAUN8envYVmtQAyPX5xsBc+LXecq2ionmCsdNA8Zwl0RcNr4zILxkI3HvTigmJ4uuCefMbowR1HcFC6kl56nhZqkiK5wzeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604542; c=relaxed/simple;
	bh=nT23kEGUVHx2xkhQSGW97MfkaCgOIvNHb+/9U5QLffw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m+yXW/YxgBD/YawvRjh0x3YgFrSglnn8JSVILamGU1OAfPpIXtfeUd3O12lmOX8VdyETm/57WyNsc91PJ6PkPEyKd/URa8nSv+nmAO+tKCTj6o9+xX0V0UxnqtA0IQq32XYy02lI5jhd8sZH8+ZgFYrLBrAmioikCCh1i8j6MXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=honHckfe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEE1C116C6;
	Mon, 27 Oct 2025 22:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604541;
	bh=nT23kEGUVHx2xkhQSGW97MfkaCgOIvNHb+/9U5QLffw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=honHckfe2cM4aHB+287wiC92pIFrB7tmyPwCd4KwyWTcmjLUTMYfuYJ/eLLQZrbPc
	 /EFJreR0lAuxa+cTWfZiYbj9YZdc77jvQFEkOm+TjmVS9VPzqhQv6BD0V3goLGvyzG
	 gJAHv7lZ57mC9ti/WmMwDLdTwFiEnC4Or2len/jzzUjU6DiMVEeHjEcB5JRpSDDcqH
	 bMLxmhRI9ML0pNAUE22OoXVTGup+GZ0djbqh12rwdFuSn0hmSbLOv2eJgeJByBhH1O
	 Y/6qmVVunHxjcAX0xdocTZY8yjoT5NLt8ikvWcAm+5rYPKJ/oIff8VpshPLIEvGUb8
	 LefNbISGrJXcw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm2290: Fix uart3 QUP interconnect
Date: Mon, 27 Oct 2025 17:37:34 -0500
Message-ID: <176160465211.73268.8985081477120326294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009090718.32503-1-wojciech.slenska@gmail.com>
References: <20251009090718.32503-1-wojciech.slenska@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 Oct 2025 11:07:17 +0200, Wojciech Slenska wrote:
> The config_noc interconnect should use SLAVE_QUP_0.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Fix uart3 QUP interconnect
      commit: cdf9756037d74dee865570e808e4bded7402c662

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

