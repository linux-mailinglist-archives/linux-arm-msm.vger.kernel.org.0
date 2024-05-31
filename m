Return-Path: <linux-arm-msm+bounces-21199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692BE8D5BB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3371C21A5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 07:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8057406E;
	Fri, 31 May 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpZNIE82"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56974065;
	Fri, 31 May 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141339; cv=none; b=OyTklhGHpaH0AcrMo/H0L5+zMXqQgcgGE7PX/fKOWbvq7Y2R4socRlhZLZIpOpXRT2+cWHQ9iTrRr2ymDCfJkTgUp+EE//115xBcq0JjdSZuEtnpt5mx2v/ScCQuWS6ewcjYuKnLPmHPJYe5oVgDMHG9zsL0ZUkFl1RoBixaZU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141339; c=relaxed/simple;
	bh=HjIdJWtMp7oAzXS9IgFn1t4pdAPbEIwM8TAFx/cY+Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T51xywKzHVo8x/VhnqzaPMy3iZMDa8Lg/YG+V/wlElAi2/4gIaU4bTlNc9y/pDGsWNBf+jwDqbLmXwKioFknp9G2V5STakeRnABtX8IEfHqdXvI6Ax9LmK+tYjgWbJ1HaWLlsJDv6ZN/nJk8sxxIhsS/zWpX3VR1DpgYvocLZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpZNIE82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB93C116B1;
	Fri, 31 May 2024 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717141339;
	bh=HjIdJWtMp7oAzXS9IgFn1t4pdAPbEIwM8TAFx/cY+Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpZNIE82mgBfOROoGVEj+QmrowXev6Z6chCmuSXBDEOhNSBRNzlF0uBGG27+PRucm
	 oi3/ofuqT7husQV2njIOfRUA1fW7c3mOj586FGgEkJfKdqvI7m7S87eoVSCWkFTQpB
	 ncdHODJEC2JroQknxLWAmciJ1FSWiZdkXMUhuvzwmphzU2hPz0bCMilTxVqbzPKEvC
	 ZTDqKTJd1UsjxEJ4E1yzxAR9rRS+6dROr0m7HuVrNsbTnGq+QZ8kEHJ7ypZg5aAhU2
	 HOO/R8//Vcty8MwuWCXOkVng5PDuZbiEN9bce8qiGDt53hEKbsFAlSY32kAv0tAc75
	 NJm/2wWuDbF0A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCwu5-000000001CQ-1D4E;
	Fri, 31 May 2024 09:42:21 +0200
Date: Fri, 31 May 2024 09:42:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Fix USB PHYs
 regulators
Message-ID: <Zll_XWbSNbsLvLdc@hovoldconsulting.com>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
 <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-1-6eb72a546227@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-1-6eb72a546227@linaro.org>

On Thu, May 30, 2024 at 07:35:45PM +0300, Abel Vesa wrote:
> The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
> Also add the missing supplies to QMP PHYs.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")

Same here, the CC stable tag is missing:

Cc: stable@vger.kernel.org	# 6.9

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Johan

