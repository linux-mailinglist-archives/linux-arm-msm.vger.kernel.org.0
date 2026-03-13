Return-Path: <linux-arm-msm+bounces-97349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJz5GdPFs2kqawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:07:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DEB27F507
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 484753260BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C6B371064;
	Fri, 13 Mar 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwAiTMSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA8370D5C;
	Fri, 13 Mar 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388673; cv=none; b=myXKy3BVZAxstS/zF82N01k2Bi75SYWEl63F6vOtep9dejx4Lmx8zkvTSluyu/Mk94P3FcLpEl3BPbPIsC5ePLBqn4n+x0S7eiyeeRr+iB23vxONPKZgsMyJE0sVAOJrNAAPxfUF7nSebBJ7FWrg8fO/MaEYMBuq7VjiDdWwHCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388673; c=relaxed/simple;
	bh=p882Fm6gmrfbwZNp/tLC8K4V0QWDNdfpdjCm5q82XzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZtI97q8duwt+euo83V76pTNpDBzcwrHv53lyKAv64dMOPFVtTEE8Vx6/VHjDpkzCcmmpYfQ3zOtuaXznJ3vgckzVxlbv8NBwi6lq6AWScHZhvOIWiM0ntQPhzTe/I9RqDQ+YgaLGk8t7PLm41wZkPDzbmQ9V8IJ/ekKL869A+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwAiTMSX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7477C19421;
	Fri, 13 Mar 2026 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773388673;
	bh=p882Fm6gmrfbwZNp/tLC8K4V0QWDNdfpdjCm5q82XzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwAiTMSXGGSJAdnzBpEc5EYidRE5gqTZC35Lf4M+twde5a1BciNlZCri3CeZnbkzJ
	 gAn2uiKpGm1limQgShzdbITD+ZwfL2DAOEO9UuugGWzI9HXQnbDXk/OscMp1wQdg3t
	 H/QSRXlXyLCM43dstDyvz+l42dn2oOI0sTM9DGmnqENGpG8qHuMgLlrbwmW1Td/ToS
	 zSaeANZ6IoPfwfla/diOf3cMK+digZxbbKD+wE0XwkyZUHC6Fy+1erNRUOjRg5rbAZ
	 v17mwi5X/V44LKGxe/ajdGr195mDLJcZgg0gggGIPW7h2byWFQ73adv23G9sc7vkTm
	 CGcwVhBa8fl3Q==
Date: Fri, 13 Mar 2026 08:57:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Enable QoS configuration on QCS615
Message-ID: <20260313-illegal-satisfied-harrier-0f4ab2@quoll>
References: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311103548.1823044-1-odelu.kukatla@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97349-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7DEB27F507
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 04:05:45PM +0530, Odelu Kukatla wrote:
> This series enables QoS configuration for QNOC type device which
> can be found on QCS615 platform. It enables QoS configuration
> for master ports with predefined priority and urgency forwarding.
> This helps in prioritizing the traffic originating from different
> interconnect masters at NOC (Network On Chip).
> 
> The system may function normally without this feature. However,
> enabling QoS helps optimize latency and bandwidth across subsystems
> like CPU, GPU, and multimedia engines, which becomes important in
> high-throughput scenarios. This is a feature aimed at performance
> enhancement to improve system performance under concurrent workloads.
> 
> Changes in v3:
>  - Refactored the schema to define 'clocks' in the top-level
>    properties block as suggested by Krzysztof Kozlowski.
>  - Removed the conditional logic that strictly checked for
>    'qcom,qcs615-aggre1-noc' to define 'clocks'. Instead, the property
>    is now defined globally but explicitly forbidden for all other
>    interconnect nodes except aggre1-noc node.

Where is the rest of the changelog? v2?

Where are links to previous versions (or: why aren't you using b4?)?

Best regards,
Krzysztof


