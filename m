Return-Path: <linux-arm-msm+bounces-49363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E59A44A14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 19:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19ECF189FCE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C645F207DE0;
	Tue, 25 Feb 2025 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T91lnxtk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990F519CC08;
	Tue, 25 Feb 2025 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507506; cv=none; b=BK/YAN3cC56hXGLEBW8ity455kGDO/uCPYEvHQ4hxBL7pyd9bNFBIIoyR7/4wRNl7WzEKHhvrjuZRv6pxuhepGEyaBbvBLEFSmFGEprRHloVW5No3AqLyKRbBm+9xBro/3z2BxN/P6LEl1qqYecMu1WtICipJPZs0nWnNVsecB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507506; c=relaxed/simple;
	bh=MZ/f9oqCHqCtKtbILlhBYk9baVIEb1lnsnj87T1PmFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=feeGZ1qyt1Jzh9sOmSqXgNQtCRdb0l79EBnf9RdeOeYUzdRhZNmx3X5Pe73Sgk7U2uQKmLWZ4kCOPY1ViqUcVYopwRZQ5uP/BW621Abs6BjcpaRe5TF4fr0CWi4PDpDuFv+XVUBzlR+jmTCDH084ej1o5utcX7PTQdP8embXCYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T91lnxtk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CA6C4CEE8;
	Tue, 25 Feb 2025 18:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507506;
	bh=MZ/f9oqCHqCtKtbILlhBYk9baVIEb1lnsnj87T1PmFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T91lnxtk5AvJvOBpYytteS716TfVvSpZ49WVynKsZhZM1bWBuNdZeLvTngHulAuv0
	 yZ7kkzaaIKiA4ZbkLPFkHydTWvd2JjMogRzbBbCNyeepN74QCwU5gMcVJ/M/WKjp+V
	 vZxm1J8FbhOWt7hsfJo4fs4iVjURypqV+Utaj39/UeJFl7Z5K7WnpKebxop654Najt
	 piI4CZk4KJAHSKStW46tCnhJi544DsBR9zmtw48qExzUPwAYyv3lJky3TdNhHLEYWm
	 EyhV24pEHJqP2o8wYzyZrStJLgbW/Uqi2MXqTeYVHdEtbgv7eczZyyQ3oO7Ceoa6G0
	 zuL8CQm+PTYJw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cheng Jiang <quic_chejiang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_jiaymao@quicinc.com,
	quic_shuaz@quicinc.com,
	quic_zijuhu@quicinc.com,
	quic_mohamull@quicinc.com
Subject: Re: (subset) [PATCH v1 0/1] Add firmware-name in BT node
Date: Tue, 25 Feb 2025 12:18:07 -0600
Message-ID: <174050748694.199016.11023927389773223641.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250110063914.28001-1-quic_chejiang@quicinc.com>
References: <20250110063914.28001-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Jan 2025 14:39:13 +0800, Cheng Jiang wrote:
> Add the firmware-name for sa9775p-ride platform.
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node
      commit: bd3801a8d44e0c538f3ffe011274a5c8a9a0a629

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

