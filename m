Return-Path: <linux-arm-msm+bounces-47488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC8FA2FC04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C718165100
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 21:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80EF1C3314;
	Mon, 10 Feb 2025 21:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mDryXL/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81C26462C;
	Mon, 10 Feb 2025 21:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222917; cv=none; b=trvQFhVeewmA4av64jkHBLNRilIdA3bP7y/OP/IA2jtH1x0n0rme6VOxl00Zzmp4lqcxlba7KnYU4QfOj4SQIYK7In8O3EH06ba/98IMIwOzfZwXNfXJEiDenA8qr8JmPcG3CamDMhpIwabrdtDFehKNWbMjU83WPPDUbszAsf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222917; c=relaxed/simple;
	bh=rkzcfXmdY0cWJ7g2nVzxenNJdNZ4J5vhQvxNLSura8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+8ONVdNYRabcxFLjPPscU0YruFAIGImlLkORX0iC8ikfA5AItpnUi3ZhKR4NHYJZSs++wwVzrwD3qTcR2YGi6USoZzVn5v995xNp0374mM0J94akN1Zk1pmqfwVDPQuxZCqKkk/XIjDYPNOBNvYafondPWgzXbATw9i98+scrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mDryXL/Q; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ighf+cCWtVjDbwA7lBmh2KFlX0F9HHQRRAc+dU8AEZg=; b=mDryXL/QcS2+NLebwVNJ221iK4
	LemKm77+MSODAz2Y0hgwvV615EN55OW0NrUlN61R36ifemEa9qBJbYGWv0M/DCqms/SWlaBV0dpPE
	ei9nGBDp23yzLuXTXxpWee8HgVq/qjQ6Vr1bh9QnNDCjx92IJOIIppt4XOzrGmGwlo+4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thbKG-00CqAI-HD; Mon, 10 Feb 2025 22:28:20 +0100
Date: Mon, 10 Feb 2025 22:28:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
Message-ID: <f0e45ece-3242-4d8b-a2d1-fa1478f05005@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
 <30450f09-83d4-4ff0-96b2-9f251f0c0896@kernel.org>
 <48ce7924-bbb7-4a0f-9f56-681c8b2a21bd@quicinc.com>
 <2bd19e9e-775d-41b0-99d4-accb9ae8262d@kernel.org>
 <71da0edf-9b2a-464e-8979-8e09f7828120@oss.qualcomm.com>
 <46423f11-9642-4239-af5d-3eb3b548b98c@quicinc.com>
 <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60fecdb9-d039-4f76-a368-084664477160@oss.qualcomm.com>

> > But what about the out-of-tree boards that Andrew mentioned? We need to ensure we don't break them, right?
> 
> No. What's not on the list, doesn't exist

How i worded it was:

> We care less about out of tree boards, but we also don't needlessly
> break them.

I guess if Qualcomm wants to break all its customers boards, that is
up to Qualcomm. But we can also make it easier for Qualcomm customers
to get off the vendor crap kernel and to mainline if we at least give
them an easier migration path.

     Andrew

