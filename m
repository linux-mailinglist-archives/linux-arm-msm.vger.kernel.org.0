Return-Path: <linux-arm-msm+bounces-41437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE069EC797
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20333168932
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5E51E9B00;
	Wed, 11 Dec 2024 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT+Yv2qq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A731C1F21;
	Wed, 11 Dec 2024 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733906818; cv=none; b=bS7Fq/xsSjOskINnOKLYwGWK7ugZWOOZDzDcc+cSQ8P4BfAMMaLp5TN9Sskk22nsT7RXut2nNd5em9KZwubMOEzGUa80SdnW5hwRS/He4EDnR2c0ARxEo3iglRLk4/y7IFjEDyOjjPjXqdG8sU4rC6hApwXLxyMsnC5nshpZi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733906818; c=relaxed/simple;
	bh=u8rE7HesJK8eF5rDPer2tx63YrHUDJD+InQWPlIuiJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPQ9PApcCprLtVBauhbqNxbtSCaWlVj2rZiWf8K5DfEx0KG7xk+aG2Dr/7xXWXy4I2t5AQ0QAKpL1PO1uX4mCG0pz3eSIiuaLjHD0caFeJPSzOLom9P6JIO8WBDZFfMRtLpBA3K3/nwF+9r2pHcBDlTAH35Uy1HIaraTD1ycju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT+Yv2qq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37E6C4CED2;
	Wed, 11 Dec 2024 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906818;
	bh=u8rE7HesJK8eF5rDPer2tx63YrHUDJD+InQWPlIuiJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QT+Yv2qqqJhSilnfM65d4CMKFJnqvOBRkF2DD3rjqRZa61MnzFLQ3NCrLj1DlS7Dr
	 qH+lwJr/qaUS7a+GRf/CIH/+nZDZORnBlnDNoLdUld05XDGNyDyi9MzBzNbRUR4At7
	 sFxXAlerQgzcPc6J5G+Oqy3ffV6clGOj4dNcwH53OPd2c4kO7xlo7o42hupYPJtxeN
	 i6lRTKIZy8XXW/5PHq9bw5ELxLUTcjRK6YvVgGwZhuA5z3wdgHBS8Nq4Nlzo8w9oDF
	 SWiGsYL8wpvTk+C6TvrABsFYs13N9ZkTdTLxG0tJ9i6sduul9sc1Bgsam3AaWRcA9e
	 XbSSL3r6iVO6g==
Date: Wed, 11 Dec 2024 09:46:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/2] coresight: Add label sysfs node support
Message-ID: <avimk3fdjal6ohezktrexnbguxf6wj5tv6jbcqy5r4bnuww6kz@3xjt3mutne7n>
References: <20241210122253.31926-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210122253.31926-1-quic_jinlmao@quicinc.com>

On Tue, Dec 10, 2024 at 08:22:51PM +0800, Mao Jinlong wrote:
> With current design, the name of the non-cpu bounded coresight
> component is the device type with the number. And with 'ls' command
> we can get the register address of the component. But from these
> information, we can't know what the HW or system the component belongs
> to. Add label in DT and show the hw information by reading label sysfs
> node.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2
> 
> /sys/bus/coresight/devices # cat cti*/label
> cti_dlct_0
> cti_dlct_1
> cti_apss_0
> cti_apss_1
> cti_apss_2
> 
> Change since V4:
> 1. Add label in DT and add label sysfs node for each coresight device. 

This is v5, no links to previous versions (I really suggest to start
using b4 if you want to make your process easier for you), no other
changes so subject is obviously the same and looking for this patchset
previous versions gives me 0 results:

https://lore.kernel.org/all/?q=%22coresight%3A+Add+label+sysfs+node+support%22

OK, let's try b4 diff:

b4 diff '20241210122253.31926-1-quic_jinlmao@quicinc.com'
Grabbing thread from lore.kernel.org/all/20241210122253.31926-1-quic_jinlmao@quicinc.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 3 messages in the thread
Could not find lower series to compare against.


So how do you expect us to do any meaningful review?

Best regards,
Krzysztof


