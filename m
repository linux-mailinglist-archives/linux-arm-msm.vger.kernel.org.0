Return-Path: <linux-arm-msm+bounces-113761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RnCVCYnYM2q4HAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:37:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BFE69FC9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=i1bV33TJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113761-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113761-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 027D7303B7C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C76D3ED100;
	Thu, 18 Jun 2026 11:37:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11093B42F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:37:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782647; cv=none; b=mxvxd8dMhcRI57xyHkYl0c8e5Ct/iui8KU3hl/Rn+FJAg+dEsZjRcBxmXZt3r2hP26mKStG4ATlkgPS/ygtLBP4sqp9oyK2iJ5YwIa5j4fTgxpvL4EpboHiNevlU63mqkWtQkEbZ+FWKgKRgllY3YexAt8OjyCw1gCrBEzUleHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782647; c=relaxed/simple;
	bh=fpa/H07iVRbVBLt1YaDl0sTETMOvCiyWgWwZf6Kug4A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=tcutXdL7yqKr0rA5jA3JHCMLnDQM22MqQtDKh6hzotA9X2RRP2+a9tRWkwnzTmjW8QoS1L2OI9SmKjQKSe1jWjUP5drPfHUeZjbcohdj1aMLKHxLoOA+oU0/xTjTJqIe1cMWZLnIGl5ZKlICzy/9Pq8WPbOV4obzERg4IGswQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=i1bV33TJ; arc=none smtp.client-ip=210.118.77.11
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260618113715euoutp01ad1594ca78bb788295ef10e1c91f1107~6Kd314IIo0544405444euoutp01S
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:37:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260618113715euoutp01ad1594ca78bb788295ef10e1c91f1107~6Kd314IIo0544405444euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781782635;
	bh=yudMLDN6lpMb0Z/7uQmRfp4PbQdrNR6BkrAQrkb/XA0=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=i1bV33TJT0EVirmuBK597IABsnI95i8FFnxt/YA9bl2bvII7ecKhk9DPE/xTrV8Og
	 Mab6B9cFPvqkmKbLfQV+1U/C0D6IzXa3M7JJuYx+NfMu1O+j0VfcWbtYK8Zuj5z5Qx
	 0L9Zzz6qUSWL2+L25K3Q19NvQBPRSGRaeUXz/GkA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260618113715eucas1p2340cead7e78cb4b3d1b91a7f2c23874a~6Kd3lMwT81088410884eucas1p2M;
	Thu, 18 Jun 2026 11:37:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260618113714eusmtip2cf281128f9e3ec3839f51cad471e7dba~6Kd25GYMe3002730027eusmtip2F;
	Thu, 18 Jun 2026 11:37:14 +0000 (GMT)
Message-ID: <d4c1e329-78de-4d02-99e5-3e4887bdecf8@samsung.com>
Date: Thu, 18 Jun 2026 13:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
From: Marek Szyprowski <m.szyprowski@samsung.com>
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
In-Reply-To: <6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260618113715eucas1p2340cead7e78cb4b3d1b91a7f2c23874a
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
	<6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.65 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-113761-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78BFE69FC9A

On 16.06.2026 16:31, Marek Szyprowski wrote:
> On 16.06.2026 13:33, Konrad Dybcio wrote:
>> On 3/20/26 12:32 PM, Marek Szyprowski wrote:
>>> On 12.03.2026 12:12, Val Packett wrote:
>>>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>>>> clocks are enabled during clock operations, preventing potential
>>>> stability issues during display configuration.
>>>>
>>>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>>>> Signed-off-by: Val Packett <val@packett.cool>
>>> This patch landed in yesterday's linux-next as commit. In my tests I 
>>> found that it triggers the following warning on RB5 board:
>> Hi, I was clearing out my inbox.. Is this still happening on the latest
>> next?
> Yes, still happens here with next-20260615.


I've just played a bit with that code and RB5 board and found that this issue
happens, because enabling the DSI PLL clock fails for unknown reason.


Here is what happens just before the warnings (I've missed that in the initial
report):

DSI PLL(0) lock failed, status=0x00000000
PLL(0) lock failed

It looks that the generic clock code doesn't take care to properly balance
enable/disable in __clk_set_parent_after() when enabling one of the parent
clock fails in __clk_set_parent_before().


With the following hack the issue is gone:

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8cb0db3a9880..c59326d4877e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -510,7 +510,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
        rc = dsi_pll_7nm_lock_status(pll_7nm);
        if (rc) {
                pr_err("PLL(%d) lock failed\n", pll_7nm->phy->id);
-               goto error;
+               rc = 0;
        }

        pll_7nm->phy->pll_on = true;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


