Return-Path: <linux-arm-msm+bounces-21419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3228D7720
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 18:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F93F28173D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 16:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEECB4F8A0;
	Sun,  2 Jun 2024 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAD+jeHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4BB66F;
	Sun,  2 Jun 2024 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717345233; cv=none; b=MIi85SombcmI1FTxsP7khUeqTXiFmW1fumRvrY3GQrjCzyu3t3TZKYJdPghIad8DzaFUqIOAQiLeC1RzdtgIZv6OmWtRZJ+obQAF+k4GxJtYliJJQE+YpXIE63VBdpBgqD99DJRELYOx6E7kyBwMmhHNyTQD2CmUpe/GEtbNXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717345233; c=relaxed/simple;
	bh=llGB0cggUYd2awZBvGcRk2OgIfxu/ACkVJX+wt7sIKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htMrotKRcpLVPASB3LDg58QGee4G5dbrwd/xpK0U7nCUV2wjpGuF2i7tfVdkTMn6MwPmf1ciQL/qPsJo1E0uG/xtnZN+wnQhax7LEF1R88ewi6vRuem5X78kaw39LWVqBhsmbgGlc+min/h+gkFpKCHkArBMGnxBRWLmGKDE0LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAD+jeHM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4DAC2BBFC;
	Sun,  2 Jun 2024 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717345233;
	bh=llGB0cggUYd2awZBvGcRk2OgIfxu/ACkVJX+wt7sIKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAD+jeHMmVzc34A+PlxL1WKnppjauRphGvYqhrba3DlXUy28DohM+BX/Gs1/sIFos
	 mjdbKoQcE85ToldWnvE4vlqAGjjAf7a5TbQfKuoSawGo5lZ4vO6AiIXHEBPDTJvuWZ
	 5hm1cQbpHZiiiKkSiIUKlfOE3jPrvcL/CxOwgBt8znTlg1FzKZKgOZzGePk+4C77p+
	 Aef9Nqvh0XNurN4MRVsrSSken5axhvQeFR8xF/YwhU7bNgtbIlMMft+NWCYs4EsbR7
	 yptshJwgOk3JnIKQDSLjCz0gKjtj/9McbxKhWyIa0qJsmrUR2eY6iQ2scinKSTgJJP
	 E70OgkI2eIPAA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sDnwc-0000000032S-3neR;
	Sun, 02 Jun 2024 18:20:30 +0200
Date: Sun, 2 Jun 2024 18:20:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Disable the SMB2360 4th
 instance by default
Message-ID: <ZlybzjPum7MI3Y2f@hovoldconsulting.com>
References: <20240602-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v1-1-0adf4dd87a9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602-x1e80100-dts-pmics-drop-4th-smb2360-from-crd-v1-1-0adf4dd87a9b@linaro.org>

On Sun, Jun 02, 2024 at 05:56:24PM +0300, Abel Vesa wrote:
> The CRD board doesn't have the 4th SMB2360 PMIC populated while the QCP
> does. So enabled it on QCP only.
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Gets rid of the nasty errors and WARNING on the CRD:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

