Return-Path: <linux-arm-msm+bounces-113441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JN3VEhRhMWo1iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA60C6909F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:43:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=QXZdZ6Wk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113441-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113441-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B5F1313BF0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881F3382284;
	Tue, 16 Jun 2026 14:31:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F336A34E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:31:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620299; cv=none; b=JCcSjsQnt+aISjU8GEzj74b7X6RjqAS0vIl+nbalPXNUwefcvSKy1X1CV8kYFHs4FBhKgd7hTjv/CJHTa7rGoFWZxR/mMzfK9P2zwMc0GrjFGD3kjMeqWyu5bMSbRHRbwavN1LlG5GpwZpel9ePcA77pK7SWeOt5TIK7WDA63lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620299; c=relaxed/simple;
	bh=AKu8ny0kszQSAdffM1Tfa4w7b8w0z8h25S9eo8xN9l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RPLupWHYwMWUlQfRv1vPNq8F29Ulztvn+UkfcuGMNlrioPa1I++Z/FQsb5/XW043BKPWLeYm353IWdrwdYub/Nd93qABzy3Apsau9d+3vK4/gXcliyfmU1IlNAVZzXxDm3qrL3LnoA0ejBUz4YjXqQ1CcOUv9e44YGxsOANF7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QXZdZ6Wk; arc=none smtp.client-ip=210.118.77.11
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260616143134euoutp014bf450a42edd136bf6b4a447162a87a9~5ljfl5bou2797727977euoutp01-
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 14:31:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260616143134euoutp014bf450a42edd136bf6b4a447162a87a9~5ljfl5bou2797727977euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781620294;
	bh=ku3Ee2bDhasLeZhzpxiTXHUPwCJZBMO8CoQOB2iG2j0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=QXZdZ6Wkwqs9m0xvBo/D2uVAiuduuTIDSYFfqwxHGn8t2x7F/zWXvxh++8pJ3XVVs
	 bTN0byUMCK+93MaVhr8laR8zc7l8fhvR8zHXLFAeAZ1DZ+g+zu/lQCe6jxbPwkMROm
	 R5fgIS51hbJnt7an5kFpiVwK3FdT4NzOQnZrJBy0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260616143134eucas1p15ecd6eb141841ce463ec1127c444009f~5ljfQs_N40188901889eucas1p1o;
	Tue, 16 Jun 2026 14:31:34 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260616143133eusmtip2299c86bd642293089d87635989c6bcd4~5ljenaeYF2096720967eusmtip2b;
	Tue, 16 Jun 2026 14:31:33 +0000 (GMT)
Message-ID: <6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>
Date: Tue, 16 Jun 2026 16:31:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Val Packett
	<val@packett.cool>, Bjorn Andersson <andersson@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Dmitry
	Baryshkov <lumag@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260616143134eucas1p15ecd6eb141841ce463ec1127c444009f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
X-EPHeader: CA
X-CMS-RootMailID: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
References: <20260312112321.370983-1-val@packett.cool>
	<20260312112321.370983-9-val@packett.cool>
	<CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
	<2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
	<f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-113441-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:val@packett.cool,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jonathan@marek.ca,m:konradybcio@kernel.org,m:johan+linaro@kernel.org,m:mani@kernel.org,m:lumag@kernel.org,m:luzmaximilian@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,samsung.com:dkim,samsung.com:mid,samsung.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA60C6909F3

On 16.06.2026 13:33, Konrad Dybcio wrote:
> On 3/20/26 12:32 PM, Marek Szyprowski wrote:
>> On 12.03.2026 12:12, Val Packett wrote:
>>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>>> clocks are enabled during clock operations, preventing potential
>>> stability issues during display configuration.
>>>
>>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>>> Signed-off-by: Val Packett <val@packett.cool>
>> This patch landed in yesterday's linux-next as commit. In my tests I 
>> found that it triggers the following warning on RB5 board:
> Hi, I was clearing out my inbox.. Is this still happening on the latest
> next?

Yes, still happens here with next-20260615.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


