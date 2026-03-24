Return-Path: <linux-arm-msm+bounces-99521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN7xCSL5wWlSYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:38:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7F93013EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD3F43008221
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E80B36605A;
	Tue, 24 Mar 2026 02:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg+lxsBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF13F221FB1;
	Tue, 24 Mar 2026 02:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319610; cv=none; b=Ed7Jyt4aDRWB19ZGB0PdzLaeYourZ+4igrCkm8pl4v3nAotSDyKifl/G6vaY6by0ugop4laoqaZSCz9+aTG/A9z6nc/98tjc981gA4cINBWC9ArTwmglg5hKJuNVpENDzBYjY+Bh/Wy7aWB5EvcWirs7xQwNzHk+aR3BlloTJuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319610; c=relaxed/simple;
	bh=fBp/0Z0LpO1M67Jopgvd6AsAAdujYI1x1bo/Xt+QSds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XItMdHKpEJqM0Guqhcr9KJjdCnmWoV0ole7a+1C1I1vHsuSbBkJUCL623+UCDsshzC8A2oXbvjyGtbUdTJ/Xehm6FVA9c6SRjgoBdW6fqRIb7SD78Qm7xxWqXW5BKeR9vl9U118rfpiHCq2aIrIq9S1kx9FCyZASCh6TpX2R5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qg+lxsBT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBABC4CEF7;
	Tue, 24 Mar 2026 02:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774319609;
	bh=fBp/0Z0LpO1M67Jopgvd6AsAAdujYI1x1bo/Xt+QSds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qg+lxsBTZtD11oMJoC9+k/56mZYQPde6Vwak+fbcGywe6msT+CgHV0MbXOSRtq2vv
	 9wJ1Ja/jOqi5R83EpgyIRWkz8jITnp+MRSDjl/ZYJ8nzszqm9V57IhvhgmNdHIkbJZ
	 /fqgLkbXHeOrzsRKFnfkQLg1qwetS8YhXfuzf4cCxKvcLkcVPbkOBOiU2FHaKWfGzf
	 9L9djIl6h3gBKUTklf9AEOYRfUTZuG1wOqiXJxLAaY3YEt6Uq8w8ZNQkdJ+s6wgMGq
	 b7d/Yp1xDo7jc7+oGdZkmIotIpk/xJ42GSX555TkUmnVVTFDswPzldiXu0KkKJdicB
	 jDCVmrhz4BcqA==
Date: Mon, 23 Mar 2026 21:33:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Message-ID: <acH2K3-qhGMgkAtX@baldur>
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
 <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-99521-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 7C7F93013EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 10:26:53AM +0530, Jagadeesh Kona wrote:
> 
> 
> On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
> >> Keep GCC USB QTB clock always ON which is required for SMMU
> >> invalidation on X1E80100 platform.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
> >> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
> >> --- a/drivers/clk/qcom/gcc-x1e80100.c
> >> +++ b/drivers/clk/qcom/gcc-x1e80100.c
> >> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
> >>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
> >>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
> >>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
> >> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
> > 
> > Is it used during all SMMU invalidations or only for those related to
> > the USB controller?
> > 
> 
> Yes, it is required for all SMMU invalidations.

What happens if it's not enabled? Why isn't problem described in the
commit message?

If it is _required_, wouldn't that imply that this fixes a problem, and
if so, why isn't there a Fixes: tag?

Regards,
Bjorn

> 
> Thanks,
> Jagadeesh
> 
> >>  
> >>  	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
> >>  	regmap_write(regmap, 0x52224, 0x0);
> >>
> >> ---
> >> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> >> change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
> >>
> >> Best regards,
> >> -- 
> >> Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >>
> > 
> 

