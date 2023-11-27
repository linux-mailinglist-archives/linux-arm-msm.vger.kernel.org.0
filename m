Return-Path: <linux-arm-msm+bounces-2084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53C7FA0EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF89B2102F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 13:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABA12E413;
	Mon, 27 Nov 2023 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPsJzX5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D1B2E40B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 13:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619C2C433B9;
	Mon, 27 Nov 2023 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701091380;
	bh=34e6n6m+2RJavyVA7BHcIYWwWMAhTNkHTD3FkOlHlcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NPsJzX5fAho9QFkhty3D+NJSw5DG6A3+7zlKb2a7IBa2l/SFMvRqh5qdZvrGkhQ1m
	 t7hGZke542Vbno3YnwzzFoAq18CQa9mhc/XNytwAdtZXPHcJD4ukLHPS+WDTVFZYov
	 BPa0kOBl5JyCqqIq433jmM618zrpvYXnyeeKStFTxImOHZ8csHtoB2C4SwYWp6l/9D
	 AKMbLDD0fUUi9eA/cRBlRa6UZCZXQ0VYrmeHqUtMI/lOBxvg8Tby3Ob/UvljD4x1I0
	 XxZKcblo0FVceelTtWNVJw4oWsVa+Jn9vb77U8JANM6N/3M1IaLsE7F96AxkL8/LBP
	 ujY07xbZ4lzlw==
From: Vinod Koul <vkoul@kernel.org>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
 kishon@kernel.org, dmitry.baryshkov@linaro.org, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231117061501.537529-1-quic_rohiagar@quicinc.com>
References: <20231117061501.537529-1-quic_rohiagar@quicinc.com>
Subject: Re: [PATCH v5] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY
 support
Message-Id: <170109137700.42627.3042149947525086118.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 17 Nov 2023 11:45:01 +0530, Rohit Agarwal wrote:
> Add support for USB3 QMP PHY found in SDX75 platform.
> 
> 

Applied, thanks!

[1/1] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY support
      commit: 7f6f9e0def00cfaeb1d034fd13dbd84470aeccbd

Best regards,
-- 
~Vinod



