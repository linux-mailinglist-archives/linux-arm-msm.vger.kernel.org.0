Return-Path: <linux-arm-msm+bounces-44157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E812BA043EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E16643A3817
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9921F37A7;
	Tue,  7 Jan 2025 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPIK0cBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAAC1F2C4A;
	Tue,  7 Jan 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262876; cv=none; b=uNM4H2Lx4867et6uGMhO1zqYKTMRINr1yMnTtre9ydAjGOeh3FDQ3fFqVpydiWgYmZJIHJssydl+VyEMBrE+uHevOn8lhcxa3ZQoteXkpQAnIOSn1Hqk9Cop/+0HzwR4NgBqR+ceYsNtQEeTiQl/YXpwcziyKmFUh8vpiL7Sioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262876; c=relaxed/simple;
	bh=nY41R+8xbgU5j4u1gzwrwy499YU8hzHpbxqellmnmx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJYr73ndp0YuNVpy/0qpil+wW1rU0jrTCAgV+oOn1vaZTx5YxDxhA85c14u5yqKRTlBHvZ3SHUiVAn98Is7PZ+GceQzwhq/v+VBPTxaP7CEBa+9wjQTocW+NOplS4XvJSBpz8nzUKI3tX7ECvpS0dY3HBNL0qf9tkCUPvHBikWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPIK0cBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93561C4CEDD;
	Tue,  7 Jan 2025 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736262875;
	bh=nY41R+8xbgU5j4u1gzwrwy499YU8hzHpbxqellmnmx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPIK0cBFeNDs6JRamCDrPbzrQ0xDa3ANLlbC66BRtVWzy+HCJ8aUtL+urqBQkJHOn
	 XpTWc0CiEa0HjDq1MvdBC+Wz3JS88KnalOXNrrFNpvfazTnt5n4Gg1SeHMZzc0mnGG
	 a+SlmrJEEyQnWTf0thQEH9yS69YeTgrtJAk6B4e6yu2/qSI6Cu8BhLPrBTLJjQmWQ0
	 k4zJSc6Zo90e4TgntLtYz9AjHSgm+ATWtRXszPmKhBRVvG+qNePftLkyomRTjx7ESm
	 GsDfOHD0ra0mt/RV4aYyg6/oIZEDLRalbEEBTkCNl1DD5TJKdwvyXbAPnkxKvxp1Ju
	 7+NtXLZZvzoBA==
Date: Tue, 7 Jan 2025 09:14:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 5/5] dt-bindings: nvmem: qcom,qfprom: Add SAR2130P
 compatible
Message-ID: <173626287367.3576773.11518882094846922788.robh@kernel.org>
References: <20250104-sar2130p-nvmem-v3-0-a94e0b7de2fa@linaro.org>
 <20250104-sar2130p-nvmem-v3-5-a94e0b7de2fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104-sar2130p-nvmem-v3-5-a94e0b7de2fa@linaro.org>


On Sat, 04 Jan 2025 08:19:16 +0200, Dmitry Baryshkov wrote:
> Document compatible for the QFPROM on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


