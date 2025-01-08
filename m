Return-Path: <linux-arm-msm+bounces-44284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAFFA05127
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 03:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ECBC1889CDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 02:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CA619CC22;
	Wed,  8 Jan 2025 02:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyRbOvJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C78919C54A;
	Wed,  8 Jan 2025 02:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736304777; cv=none; b=HXCo219GThPhcJJXHdIHaTAwzH9V0dGu2Rd/pEBR0FLEajebfeS7Q8ctEfPiMwohPe2hRxPjsVUHvLc8zHc2HLAogB1oJROwLe5jXt0FeR8q9uV3deQF3rom4hjqebSoXrozwsLHXCWnFKONYWfDilw+XPdEOGVJbsAet3YkvlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736304777; c=relaxed/simple;
	bh=bWk0N/iUuUmPksh/fczOo0wVV/WukZ+Ms8pDNiaGQZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+hJzv3yYWV83hdf9DA8ntlS2iEI3TlUCl/eMCbYf+NEfdDSyin875e15LcuoFnCXhTc/o089swr7/3gugfrpBzJvKeVTu57eVCpDu8FeDb4g/NlTdDckFu34MH1Rsu5yM+lALAPAcNkTFCxSX+PJToOwpOjARwR5w8c65wmWRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyRbOvJF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DA0C4CEE2;
	Wed,  8 Jan 2025 02:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736304777;
	bh=bWk0N/iUuUmPksh/fczOo0wVV/WukZ+Ms8pDNiaGQZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyRbOvJF2PC/qT3MNekGSZii9EkGPm8hFQigHKgfapeMtQdVLwzqFpPJDl1PqKj++
	 B0HhCEaG3BJH3a2XCQ+2PjAEsz1x7aXAjqJtc7jaIdr6MwKvQQu4x4/qkE7OYyUEvM
	 vdKYWn5swry8SaDgVnwpbZ6f8616SsgZLDtRKIJkCqXFQIHtSDqx+S6C3RCSO9Yv0l
	 kgW9brB4T6trQAjxLPL75KQhtVNfgFA4AUA74DUpKCVLeFgSDQSf0CcMdlFFaTvafy
	 Cit5jImGFVaaPeKISmUO+M0s4qNds7gxAf+C3Zb/a+2/cZz+DPFAQcX1nPwLxH5fyy
	 CZ/usle2TsF6A==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Xin Liu <quic_liuxin@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	quic_jiegan@quicinc.com,
	quic_aiquny@quicinc.com,
	quic_tingweiz@quicinc.com,
	quic_sayalil@quicinc.com
Subject: Re: (subset) [PATCH v4 0/3] Enable UFS on QCS615
Date: Tue,  7 Jan 2025 20:52:46 -0600
Message-ID: <173630476486.101108.6875505033763914837.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216095439.531357-1-quic_liuxin@quicinc.com>
References: <20241216095439.531357-1-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 17:54:36 +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Add UFS support to the QCS615 Ride platform. The UFS host controller and
> QMP UFS PHY hardware of QCS615 are derived from SM6115. Include the
> relevant binding documents accordingly. Additionally, configure UFS-related
> clock, power, and interconnect settings in the device tree.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: qcs615: add UFS node
      commit: a6a9d10e796957aefbc4c8d53ed7673714e83b31
[3/3] arm64: dts: qcom: qcs615-ride: Enable UFS node
      commit: 4b120ef62ed653f4bc05e5f68832d2d2ac548b60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

