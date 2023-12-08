Return-Path: <linux-arm-msm+bounces-3828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DD8099CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCB51F21367
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771B563AE;
	Fri,  8 Dec 2023 02:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxmD7BhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF163AB;
	Fri,  8 Dec 2023 02:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257EAC43397;
	Fri,  8 Dec 2023 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004023;
	bh=H15XYAtye/qQoEeLo3qCrLhORvyocUOUC7CpeVLwFYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZxmD7BhH26wMckfyxD8AICsBMmIxLRtgjev2EoLun64RRYpBvF9e/WEK5i2ujkCmG
	 54WctvSXWE+XxUkQxsvZ8JNkLcX4h2QLmrppYht7yZZxPET4OGNkbkYNOGeMQ7NEeW
	 bjBnEt7H3NmrWV2i8al4yNeZ7Fkjg/CebgjPpi0otoVgWQQOUvCQIJkqU0eFNYh5Jl
	 YyPPh3Fw4PnNhnTNAffyQMYmE7PuR2+8502Oc5sl8oe90tiq15NfozeKwOtfFO+364
	 R5OFpvy41Na3HEc+RT/DvOI8fVbPGJ58fOZ2/8J8rzXsIIjhJ9hgmsy5MzjcM4/rbY
	 Aj47/OF0JcWOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: add few more reserved memory regions
Date: Thu,  7 Dec 2023 18:57:47 -0800
Message-ID: <170200426909.2871025.1437158063576224855.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-ipq5018-misc-v1-1-7d14fde97fe7@quicinc.com>
References: <20231025-ipq5018-misc-v1-1-7d14fde97fe7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 22:12:12 +0530, Kathiravan Thirumoorthy wrote:
> Like all other IPQ SoCs, bootloader will collect the system RAM contents
> upon crash for the post morterm analysis. If we don't reserve the memory
> region used by bootloader, obviously linux will consume it and upon next
> boot on crash, bootloader will be loaded in the same region, which will
> lead to loose some of the data, sometimes we may miss out critical
> information. So lets reserve the region used by the bootloader.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5018: add few more reserved memory regions
      commit: a427dd16e61f3d145bc24f0ed09692fc25931250

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

