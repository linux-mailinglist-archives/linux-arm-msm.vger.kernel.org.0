Return-Path: <linux-arm-msm+bounces-39611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 309619DE95D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 16:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4CB5B20E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 15:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0311448DC;
	Fri, 29 Nov 2024 15:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BrGnU19w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7C8208CA;
	Fri, 29 Nov 2024 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732894151; cv=none; b=eJleWiXb4FLSgh41Ba+4XoRSVzlCMIjyktmHoHl4YzrwsLqZ6ieyxDb7JN4pfwIHwLjthWOYY8uwnirjp8BUD4eUYvwWYVxXlqXvhQr3RSKz97PB02yuYHdO0VZJdHd7HUmnMFLjUBhOvbS3jBUXRGpbroq72DrwMDqNuZGPy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732894151; c=relaxed/simple;
	bh=lfmDZAdOZcwsj0j9s3hNP6RbUmz5QvoDJrRmMvPJITI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7jj2eQHpTTuf3IsdU7f4MzFOq8Ukwi5r839vMfDorvtuEzhwFdY7k6Qd8/lLU34Vml+XOKsbcui1HjBSqE4NBqii77uELz/vBrzJjyT9zFQAg5bVLIfGbe/AzD5ZjzJR6bGFllqlmmjVcROX5ZtM6sQbA6cuT/xk8ufJKf+dEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BrGnU19w; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MKLFyWXQI6exBSS0mW7Tm+wDxmLwRTvmq+HQx8mM2v4=; b=BrGnU19wKVt8sK1IDm0aNQuqcQ
	ND3qjMakLiuVMAZUMNZl3bxzIbpQ+Jjx7F7EiIox+jWQ+V+M50ddJa9etJZM6ZxdY4DIoRwm1vuWj
	hH8TS3C7yAm7/HWkFj/Af2bvDXO+QpiUwN057gzjqpFc5PQETwGPINpI9UMSdDO7quK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tH2vX-00EmO0-Fm; Fri, 29 Nov 2024 16:29:03 +0100
Date: Fri, 29 Nov 2024 16:29:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
 <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
 <3c69423e-ba80-487f-b585-1e4ffb4137b6@lunn.ch>
 <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>

> I was mistaken earlier; it is actually the EMAC that will introduce a time
> skew by shifting the phase of the clock in 'rgmii' mode.

This is fine, but not the normal way we do this. The Linux preference
is that the PHY adds the delays. There are a few exceptions, boards
which have PHYs which cannot add delays. In that case the MAC adds the
delays. But this is pretty unusual.

If you decided you want to be unusual and have the MAC add the delays,
it should not be hard coded. You need to look at phy-mode. Only add
delays for rgmii-id. And you then need to mask the value passed to the
PHY, pass PHY_INTERFACE_MODE_RGMII, not PHY_INTERFACE_MODE_RGMII_ID,
so the PHY does not add delays as well.

	Andrew

