Return-Path: <linux-arm-msm+bounces-114613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zj9zIIJKPmoFCwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:46:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A476CBCF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:46:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=THusoym3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114613-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114613-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F73D301CF70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 09:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CD83E51F7;
	Fri, 26 Jun 2026 09:46:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C433264FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:46:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467196; cv=none; b=SInLXo6qkWTY49804VIGaRG9AIgLExGFRnEUdE6cMMkTnU2oebHY30NktaDrP7kKkKCx1zbtlmEU7KXQ2xyvpImeFXrL0qpDp+8glZO2yS9RBUHOi5uxFjyZUQVNKbsq3siRIawXwQu3sKEqbU6IqfGA5CozunQxF5SLcqs9ssA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467196; c=relaxed/simple;
	bh=oisu7zR0v38Y828rHjRNScoVsE+KgSpp45xewOkjlQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Br8LjtoDQdtaOAAGkPW4A1sDU/ppDu5iQlf4KcZBxZh7sTMBg2eNoDrKdzvNPzyDqr/olsBXyefjNdWa2C8PHvcwxewwydHk2Qj8516IH7vA+FNKjrzBTiNiV31k4u64aGsmaB9m7jze1zmO4VqJItPLw1ScOZykDiK9UWvf8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=THusoym3; arc=none smtp.client-ip=210.118.77.11
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260626094632euoutp0184fde544062b5fb8d45b9cf02e32307e~8mHfAoMP02103721037euoutp01f
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:46:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260626094632euoutp0184fde544062b5fb8d45b9cf02e32307e~8mHfAoMP02103721037euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782467192;
	bh=8uVPoGobuqUzzib+j+IavUKdevfV4LK7AEjzXVVlfJI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=THusoym3AQEp+Cp/GfVMABZpu86o8fbmByBzeBK0MT+XkyCaBP8ajZXvZJR/5Uc/b
	 elqjf7hiYD5JLKQbCNh2bycoUmiOCkAFfdpzrgvcKuQwV8IcV3KKYMwi+/Qfp69RzN
	 +jeR/rlOpWaUfFGDsLiXBBAD03b4apuXMzG3ifRE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260626094632eucas1p2a0bd78e844ebe4e0205a0b900f8e3289~8mHemOR-Z2319923199eucas1p2t;
	Fri, 26 Jun 2026 09:46:32 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260626094631eusmtip16a3e68a99088c6511be0c08558f47356~8mHeBvm7K2611326113eusmtip1K;
	Fri, 26 Jun 2026 09:46:31 +0000 (GMT)
Message-ID: <750856c8-ac82-4d05-9c8e-702d091e930f@samsung.com>
Date: Fri, 26 Jun 2026 11:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona
	<jagadeesh.kona@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>,
	usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260626094632eucas1p2a0bd78e844ebe4e0205a0b900f8e3289
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260626094632eucas1p2a0bd78e844ebe4e0205a0b900f8e3289
X-EPHeader: CA
X-CMS-RootMailID: 20260626094632eucas1p2a0bd78e844ebe4e0205a0b900f8e3289
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
	<178093139446.244194.9422100472802070367.b4-ty@kernel.org>
	<c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
	<CGME20260626094632eucas1p2a0bd78e844ebe4e0205a0b900f8e3289@eucas1p2.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.15 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114613-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:konradybcio@kernel.org,m:usb4-upstream@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83A476CBCF2

On 11.06.2026 21:38, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
>> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
>>> The sole reason this hw exists is to let the branch clock downstream of
>>> it keep running, with the PHY disengaged. This is not possible with the
>>> current implementation, as the enabled status is hijacked to mean
>>> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
>>>
>>> This is an issue, since the mux enable state follows that of the child
>>> branch, making the desired "child enabled, MUX @ XO" combination
>>> impossible.
>>>
>>> [...]
>> Applied, thanks!
>>
>> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
> This breaks at PCIe at least on SM8350. The attached WiFi card is
> not detected anymore. Rewerting the patch makes it work again.
Same on QCS6490-based RubikPi3, after this patch the XHCI USB host controller PCI
devive is no longer detected.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


