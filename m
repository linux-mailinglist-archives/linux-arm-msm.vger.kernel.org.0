Return-Path: <linux-arm-msm+bounces-28690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7A953BD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E796A1C211A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8981915EFBF;
	Thu, 15 Aug 2024 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKzH0J3w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B315EFA6;
	Thu, 15 Aug 2024 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754483; cv=none; b=a2HmQppOeAjxEq5v2Gt5Gi8Ldw+jT6hXXI91oiL364qcjpy9qbdSFu+oUCai9S9yZjRVfAE4W2d2Rj/8VbQWv2VXybN/z+bzg1kJ3ANSRpce3TzqxkqgkRJyZjIVNT5Z4QQlAmH5BLM/qZ21FqwZCjhQWdZIiqMcS7B2hUPHe4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754483; c=relaxed/simple;
	bh=pOtLMZdmjpHEfBfVKMPBiIvv7eWRKcnyFj0T5sKqR3E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ghTAbmmQL7x3HhV5omSmrBzjhBWOYvkyXCs8PL05qL4BYqcmTQOKdBI80lr26F9BTKQNUNVRF6BWHqsY0iH0wvntpeOEOaup6uqzaYLF9ggPHst5HbWpcA8QvDZpwNz0NS8vQf3JmAgpYOey1GV+mLGmFZf0WVKT9TGIklyO56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKzH0J3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA9CC32786;
	Thu, 15 Aug 2024 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754482;
	bh=pOtLMZdmjpHEfBfVKMPBiIvv7eWRKcnyFj0T5sKqR3E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DKzH0J3wdDAl5NTiOPqz8pcvDZd/js0QqzjFzv1/kpqPL7RWcYNg+dmG5b3Z4MeoP
	 aSQSF0z1iitnexIm4IMkeEL8W6zuuDKc+xeV2Y0lZw3r6zERXK+E6fxMPD/lOVJKg5
	 vTMcDzWUSfkuup3mrr6e5TQ5oQoBMGfzL//qffj5FjMNWgzjeCeg3KsZ8RACuhboco
	 B0cEA5WExMKUFUbS9FP8D3KysGKNb4ttLJsFUqN7E298JuuX5+0xa5fdw63JWe7Ixa
	 yr3NRMKElcjyczvMuw+TdnzIbRtpwNI+raM+ccHLu3k0nFeWi6DBu/gF8SYX3DjhLT
	 Ky2AzwnsQIEpw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com,
	quic_tengfan@quicinc.com,
	Jingyi Wang <quic_jingyw@quicinc.com>
Subject: Re: (subset) [PATCH 0/3] soc: qcom: socinfo: Add QCS8275/QCS8300 SoC ID
Date: Thu, 15 Aug 2024 15:40:36 -0500
Message-ID: <172375444835.1011236.877973514601510792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
References: <20240814072806.4107079-1-quic_jingyw@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 Aug 2024 15:28:03 +0800, Jingyi Wang wrote:
> Add support for socinfo for qualcomm QCS8275/QCS8300 SoC. QCS8300
> is an Industrial Safe version SoC while QCS8275 is an Industrial
> Non-Safe version.
> 
> 

Applied, thanks!

[2/3] dt-bindings: arm: qcom,ids: add SoC ID for QCS8275/QCS8300
      commit: 6b34e75c48bb913f3431e66353cad9782e7225c7
[3/3] soc: qcom: socinfo: add QCS8275/QCS8300 SoC ID
      commit: dff75ec5763eb9c7ad64be952cc6930b410beb2d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

