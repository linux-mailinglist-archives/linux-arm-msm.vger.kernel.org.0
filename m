Return-Path: <linux-arm-msm+bounces-30335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044F4966F13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E611C21FAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180CB1547C2;
	Sat, 31 Aug 2024 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDRD4bvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C815099B;
	Sat, 31 Aug 2024 03:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074346; cv=none; b=eXfxzAuQEdGGziDLjBmpWkLb/yBD+0jqDfokqXSbqLXIpXnHtZ4EpPq2I+PXzzHa6oduLqH6AymAEDvWJM410T+CGu2vdJcf9ILzzcaMBZvQ0SckhvehE+CgrH9CwsVAZ8iHApvZl8mNPNj8m5rZRvJ6tOhAVIpQtVmWIp0wxF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074346; c=relaxed/simple;
	bh=Lp0q530IdV/hpTMrQs3hFIcEYPKLeusmgXaDnrjVndI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pekCxTodlFdBwzFi2A5uf+Q1k642kvuGVKAmyJUM7hlwiw4IoPQ3WHkEN5h5wJbft1N9O6Wd+Mucssht1rp5wEB598GHZt62vaYGWVTkH+/4a3c/jrnXTxwuLsa71UPwXvzqnXOROIfe6mODe+Fy+QUGcz/u5lCZ654uzUQX1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDRD4bvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13FBC4CEC7;
	Sat, 31 Aug 2024 03:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074345;
	bh=Lp0q530IdV/hpTMrQs3hFIcEYPKLeusmgXaDnrjVndI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bDRD4bvfO9xdTm+DVDCk2sho1V670AowwJBopkmO2yzDBqIMqPewaFYWt0AMTcDXY
	 aKq7HtLNHBkb+F0rzLh4fvbyEr5Dfegmhcb8CtKi3Pf0c36kL2/CVCJmr33JpG9RZI
	 ypxB4VbY97spo6zqr008J5dd2HYVDXOIH3KG9DiASO1y/PdQA07W/ui6ZKj82zMcla
	 R2CC6jwpLTPIyVgLxGwCoOhwapu/mYP+rEYJevFgP4DA79tHJNUNvhSX4KWFskrV6V
	 oDqpi/GZYol8s+BR28XlusoPZmKgHMpQ300VZurS4wAzWygonYN3tVJQQe2FSseRUD
	 qMTSjlotOFQbg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com,
	quic_narepall@quicinc.com,
	quic_rampraka@quicinc.com,
	quic_sartgarg@quicinc.com,
	quic_mapa@quicinc.com,
	quic_cang@quicinc.com,
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2] arm64: dts: qcom: Add SD Card node for qcm6490-idp
Date: Fri, 30 Aug 2024 22:18:41 -0500
Message-ID: <172507431833.12792.13543272937622578069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829114748.9661-1-quic_sachgupt@quicinc.com>
References: <20240829114748.9661-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 29 Aug 2024 17:17:48 +0530, Sachin Gupta wrote:
> Add SD Card node for Qualcomm qcm6490-idp Board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Add SD Card node for qcm6490-idp
      commit: fec09568a355ec70cbad254168da4391e0241238

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

