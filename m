Return-Path: <linux-arm-msm+bounces-25531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB192ABA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8223A1F21C63
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F87D8175E;
	Mon,  8 Jul 2024 22:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="c36DbQaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E99A29;
	Mon,  8 Jul 2024 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720476062; cv=none; b=nxvp5o0ejVe0rXkVe6eMvYiNWDQos+Ew6VnBL4EsghoeNwxwq4fLcSgcp4ZT/xugOqfyMD0Ntqs+/h1foVriZp36vOjqMMAPct3Sa3MJLtssDzMIf8y+9/7gNvedgehbytYLxEMXxQvoxTxMAemywhkC3YjGDZWq8n+CiO5EQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720476062; c=relaxed/simple;
	bh=wtnVSxXq29f5iFdhl5fEAoznapxognapQK/cSwlm+1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6EOi0aqRsl0hTZHj42pfk2nmrxxPhO6yuYkoCNMh4ApJvi9uoWd06r+5GiUNT/NMVfyu9FrBDNGd4mYWlP+PQxIjXRQ1fLmDbiirw62yB3MLOmpd3awrspRpOSP7Wrs9IQ3OIOJBT+DAf694FdI+D34lmEzX7R6nR5hl7TK2XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=c36DbQaf; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jRDWR2bjVptTFoGrIOLDaYNTD5O0so4xnPf0nvQC5Uo=; b=c36DbQaf0pGWmOUe2QeXu/O62W
	UbgtQ6dSRNYDpEQiWsaoaCfvz/x9E/dSpb4Z8hefPpqPs/YaTQ1ZGqjixI640tPFQd/n9Cohgt4rK
	Gthju22MCilSEtZXtKSRooAgm9qb+T4PwZ2FywkwtMufyrBeHksbB0Aa+oalYneaRrh8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sQwPn-0024yp-IL; Tue, 09 Jul 2024 00:00:55 +0200
Date: Tue, 9 Jul 2024 00:00:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Halaney <ahalaney@redhat.com>, kernel@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Add interconnects for ethernet
Message-ID: <a4c69b23-c6e1-4f6b-b096-600b64430e75@lunn.ch>
References: <20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com>

On Mon, Jul 08, 2024 at 02:14:47PM -0700, Sagar Cheluvegowda wrote:
> Define interconnect properties for ethernet hardware.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
> Adding interconnect dtsi properties within ethernet node of SA8775P,
> this patch is adding support for the interconnect properties defined
> in the series ->  
> https://lore.kernel.org/all/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com/

Thanks for adding a user.

       Andrew

