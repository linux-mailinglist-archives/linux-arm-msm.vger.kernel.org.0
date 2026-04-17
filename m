Return-Path: <linux-arm-msm+bounces-103512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIZgIdgC4mna0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:52:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFF4199A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 11:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B1DB32AA093
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B083B2FD9;
	Fri, 17 Apr 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s177EnDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C6F3AC0C4;
	Fri, 17 Apr 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418750; cv=none; b=fReiLP4W1FW2hpOqFh2rLTc0r/xsu3Wey0HWjL2A2M5prnUjNuNp+YLOwetEn3r/wWaZtsRyHeSnwGhpQ6xvHQz7y53KsKrHFhf02kK+BlL7xVziYZvH/6G3xorQ3xzaqPOdvqlh1L10qj00Auhom2FZ4tuX7acLTkISWpCQkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418750; c=relaxed/simple;
	bh=Eh1S2IzmtKMHkjqznYSHNrmJkZn1+LZInRAwIKWmG74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uP8CSshkeUyRe+VJ78BfJLlUmDcihywIYjdfDoUyMOkJ7rBZvly7F2dHhLBOi7xYAgYxWWMlbxFA4bgwfhHOa1Zq+AhBB8xSDrbqXhelh0iVhbkHNuUDw7OqnspBhU25tyWypEm8h8ydNU81A4/RLmyk+19DAHNhjfMPPhVR96Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s177EnDp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC98C19425;
	Fri, 17 Apr 2026 09:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776418749;
	bh=Eh1S2IzmtKMHkjqznYSHNrmJkZn1+LZInRAwIKWmG74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s177EnDpVKE+++up2dzu3jyS841mG8kncq+z7IJrAhMXkGHbaYMphlScCfU6DCeAR
	 chf0Kfi794MSnHzQ6zHgeBM+1kOtUsTGdr4oFWacLn3dgLz2vAL5o6SDqq5zVos8WL
	 CYzFVDbDHg9hXEytF2czL5c5IAjRIRst6XZDDJPULbjhczpusR4BqXFJro4Gcry4Pp
	 ABy2spyrdJOaH3/Pvi50tq/UdEAgWs3fbpyzklQ/vHoquQ/OK3gOpkvKQYKxJ1cIck
	 AcDXxP0r9CQTPaQNRZC93EYhgnaQ9DploIryVQ6DckD6Fbgb4z7DL0uFKwCzLhTOYR
	 06vE9twJmZS5Q==
Date: Fri, 17 Apr 2026 15:09:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <z4h53al3dcy5u63zglu4rdavm3cse6sy2bbha2kxxepplawnho@4pwg7fx3cmnj>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
 <adem2WKh2B-Leivq@baldur>
 <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
 <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103512-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1DBFF4199A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 01:18:16PM +0200, Konrad Dybcio wrote:
> On 4/13/26 9:06 AM, Qiang Yu wrote:
> > On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
> >> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
> >>> On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
> >>>> On 4/1/2026 12:05 PM, Qiang Yu wrote:
> >>>>> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> >> [..]
> >>>>> +static const char * const tcsr_pcie_4_regulators[] = {
> >>>>> +	"vdda-refgen-0p9",
> >>>>> +	"vdda-refgen-1p2",
> >>>>> +	"vdda-qreftx1-0p9",
> >>>>> +	"vdda-qrefrpt0-0p9",
> >>>>> +	"vdda-qrefrpt1-0p9",
> >>>>> +	"vdda-qrefrpt2-0p9",
> >>>>> +	"vdda-qrefrx2-0p9",
> >>>>> +};
> >>>>> +
> >>>>
> >>>> TCSR clock refs are just not for PCIe alone, they would have supplies
> >>>> for all the ref clocks. These supplies can also be shared across other
> >>>> clock refs. I think it is not the correct way to handle the supplies, as
> >>>> TCSR does not have the complete supplies map.
> >>>>
> >>> We have complete supplies map. You can get it on ipcatlog. Here is example
> >>> for other instances eg USB and EDP:
> >>> - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
> >>> - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
> >>> - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
> >>>
> >>> I only add supplies for PCIe in this series because USB and EDP vote these
> >>> LDO in their PHY driver. They can remove them in PHY dts node and add same
> >>> regulator list here.
> >>>
> >>
> >> The regulators are reference counted. Can't we add the USB and eDP
> >> handling here as well now, and then after they are voted here we remove
> >> them from the PHY?
> >>
> > 
> > For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
> > QREF diagram is tied to. I need to confirm that mapping first, I'm
> > checking with Wesley Cheng.
> 
> I think on at least some platforms the reference clock for the primary
> USB controller is not sw-controllable (so we wouldn't get a handle to
> toggle the regulator this way).. please check that
> 

I would suggest we move forward with atleast PCIe regulators for now. Since USB
and eDP are voting for these regulators on their own, we can work with relevant
teams later to switch to this model and this is not going to cause any
regression for them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

