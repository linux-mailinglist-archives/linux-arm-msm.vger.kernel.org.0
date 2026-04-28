Return-Path: <linux-arm-msm+bounces-105081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LvlQGdcb8WkVdgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:43:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B41A548BDE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE9A30CBC9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031073101BC;
	Tue, 28 Apr 2026 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IF+tWKPT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="szyG72cs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF030AD05
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408709; cv=none; b=gO2AFJtGWkocLuEbOaJ3JLMvQDBXLWM4c4mESXJmaUMf3JaEECIfy2aHmYo3vB33PmSpV1GNqCGk2lLyHmfTPWHxw42NfEa8w4LXcj16XGWGsrNUFDtQg9CnMeQFkJyYsMQYPKWOGMZtFuPLN3zRJDw90kKh6sZ9nY0sR4AHyj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408709; c=relaxed/simple;
	bh=pDmse3ikNE1vwAD5KYJ0YIqBXCY+TX8S31byHNChdqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guvggolHL2x/c1m//jl3w3zCqEzz6FuFLRijviGQ5Sti+W/75OT3KayUEqUA3rPRpJlEXOujyss7WV4ubBvMJl4YZt9U2RMIDXf2cNObSLqz/U6y212JkYYXHEuWKU4RPDu2MZkPUYlWVdFcj2QpVuaaZEph4qTgdwrhzC0t8ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IF+tWKPT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=szyG72cs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777408707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
	b=IF+tWKPTp21nVd/IlYdml0wPUP/d+N7v5exjZAQrvjcdIsPY0fPasq4HdyBK9ImESoqdcJ
	90WUKJH7J5bFVqhaBGGTrQpPzcSww3dTpfD4Bc3ffGStXEotqTIb9Pm8+2lBY+OHpyKv0p
	mI+zQ9LKAOBGkSAnYUE8an6jcnWjhD0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-sRX_fHq_O6ascVNWO3EIHw-1; Tue, 28 Apr 2026 16:38:26 -0400
X-MC-Unique: sRX_fHq_O6ascVNWO3EIHw-1
X-Mimecast-MFC-AGG-ID: sRX_fHq_O6ascVNWO3EIHw_1777408705
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954803bd74so109904656d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777408705; x=1778013505; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=szyG72cswFTsOg6Ct9RakI6QQVe7nBOwegp3Srp1tTypEzuingZKzMgCD6NexewKh2
         HOthfAY9Lv1wYDpSeRytx4mkxF0jk371K842UpxHvHTqWxsy9NzhPTtirkcUJKI/spf9
         pKP6l+0VAkGrlM7WjOnOU5DEAM6pM0R9aii4pINI0sgrxj88EwPY/7345CfTZMA7eQx6
         cpV1NeD8BMQ8HMKeDRB01SRZgWKrZfJm8Yki+NUBCYXU69gxOfc9IJLnEAz38bhRI9c0
         +4JICHyZwPIqaeoj8SgFB6NbnFBGz2i12QbmtIdu1qOMoUluMqcRGRndb9Ijvj08iQhF
         rECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408705; x=1778013505;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6d3l70lYqSnvJpMpEGZJLw4o8TwsL0Q+e8A9O8Mofs=;
        b=O/ag1vHg/W4HzNZ+nxz/hmot/nl6WN5bvGQMDhh3zzbaA/qDyVyI6YxhobFvg5IuVV
         z/6EzK/bbyPQUEWSRHsocYgi2uRmFLrTis+gRjucFi16Zzla6PpNXNRN4uOwwc+oAJks
         RmeBwW9Ahv5aT/hdUv8qSPVyXMVVk5bV3f8akCzU1rD0V1Q3MNmIlByqZrWP+6OAzzQQ
         lhs/n4r9c9Oy/vGlS6M7cvtHgN9cTJO+8revNv12oB0Uoay+9j/ajE0Aney6Pgm0aMWL
         NqrcIuu5s/e/Yju81aTryfmLXNHO856CL+6QhWN93FbZkC957kgTE5j4Ukyd0+t1GkW+
         S0jA==
X-Forwarded-Encrypted: i=1; AFNElJ97QfR9Go4s7JFOMgshk6K0oJMhEW1YTv3HQMcb9ZZxC5xmLxe3B/+1odM7ILBa92YjHR3qBQX0GK3J5KxN@vger.kernel.org
X-Gm-Message-State: AOJu0YwX5xXvbfOiGjxL3x2ol/nGpMAVzcHLpDncgfMTNYbtWHspsQhG
	5O8qldUzqg7zDmvsgQdGhI2RHhj+1x6iHZM9pvnRAvM9tlVJCOPEy7VBlslPjF8iRFTOHAYTwUR
	qufVzUzM8FZqiApQPh4BrWlbNBDdimD2fBkAsjVoYkWjseEwRHNQRAYpehC5Qs+05nEc=
X-Gm-Gg: AeBDievHx9tXCXn0nUK0A/UyH9tC1RxUNvaOEiIyeXrYpndFgFegzA2YEG7FEb7H00t
	AD51aVM2FGttduoyd97H8azuq+lbhfncRvtyROesU+EazO2PN5nc+tiNpcmgE+Qga1BJWdZpZIV
	8bYYz2ZEjtXUakwLg6MPFaT+2i4EfBq3cpLg9WcHSEIambusoSMTcclOXMfPyIqi2vg9+EokBe5
	szmITF2s6sUIwjpQfevo6GmzQFD0r3MN+jrdIpwoZxk88llaQPPZvVHKdp7ERdESmHHUBpt4z3i
	3DE5dGqSqOqyicv/suGO8FNcnjYoXgNH074KImU982K/gSeYfNrQICKmfKSal0vCcJeKe5xp/C0
	ljhz6w1rm9I/XP+zIwVA5cQVquNJuBVM=
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22407896d6.2.1777408705527;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
X-Received: by 2002:a05:6214:318d:b0:8ac:a914:c2da with SMTP id 6a1803df08f44-8b3edcea9a6mr22407456d6.2.1777408705068;
        Tue, 28 Apr 2026 13:38:25 -0700 (PDT)
Received: from redhat.com ([2600:382:8104:bdc6:d862:7b9c:1d01:62e0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ef50fsm699056d6.32.2026.04.28.13.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:38:24 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:38:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afEau1Ny-7RTz4vc@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Queue-Id: B41A548BDE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105081-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,suse.com,linux.alibaba.com,samsung.com,nxp.com,glider.be,gmail.com,pengutronix.de,linaro.org,arm.com,lists.linux.dev,lists.infradead.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi Stephen,

On Mon, Mar 09, 2026 at 10:38:39AM -0400, Brian Masney wrote:
> There are some clocks where the determine_rate clk op is just an empty
> function that returns 0. This can be either because the rounding is
> managed by the firmware, or the clock is capable of any rate. Add a
> new flag for these type of clocks, and update the clk core so that the
> determine_rate() clk op is not required when this flag is set.
> 
> Based on discussions with Stephen at Linux Plumbers Conference, he
> suggested adding a flag for this particular case. So let's add a new
> flag, and update the clk core so that the determine_rate() clk op is
> not required when this flag is set.
> 
> This series adds the flag, some kunit tests, and updates all of the
> relevant drivers under drivers/clk to use the new flag.
> 
> Once this is merged, and in Linus's tree, I can update the few remaining
> clk drivers that are outside of drivers/clk via those subsystems at a
> later time.
> 
> Merge Strategy
> --------------
> All of this needs to be directly merged by Stephen as one series into
> his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by.
> To reduce the noise, I am only CCing people on their respective drivers.
> 
> Note this series depends on 3 previously-posted patches in this git pull
> to Stephen for v7.1.
> https://lore.kernel.org/linux-clk/aZuK4-QJCXUeSxtL@redhat.com/
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

We talked about this change at LPC in Tokyo, and you were the one that
suggested adding a new flag. I initially wanted to add a new shared noop
function to drivers/clk/clk.c. This series implements everything we
talked about in person. The only thing that we didn't talk about in
person was the name of this new flag.

Anyways, let me know if you are interested in this change, and if you
want any changes. If there's no changes then would it be possible to
pick this up?

Thanks,
Brian


