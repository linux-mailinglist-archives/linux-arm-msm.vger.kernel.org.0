Return-Path: <linux-arm-msm+bounces-98585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1ZgCIK9lu2mojgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:55:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 239922C52EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D634309916F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 02:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E04389113;
	Thu, 19 Mar 2026 02:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaXE2ant"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B83876AD;
	Thu, 19 Mar 2026 02:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888940; cv=none; b=cJ0XAtlI2nKQKX1AKcCkQNz12ma5UurQq47VBW0WTXbW/cPx+wYOPAaCt4FBtWse9UfZJgoa8hKj4TKNLjrfLgalSgHDoS7iOpZIsCIZmwasmzGZvXog0OmiYd/EujruHraSOltiaLwI3VPAzuLZSIw8SE/ANIG2ksQKViVeBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888940; c=relaxed/simple;
	bh=JBDcZtrG6mP/xc3gO7VDWwX/f7UpvWRqfTVDJQ9Ka3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BR8OO+wbPGdqI/ywPZrk3bgLkrqpPh+h9jlU3HmLXuOab8fbb0qpwCSuPNZrZsMeTOEUHgUJxNTh0dcZUKmflQXk75NQDL0I9dVHsDME/9a9IXNNz8x1D84nkJYntoXpCn4NKmJ5gWQqbMx44qgjeXNGjG5iutgXnIBNOSSwSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaXE2ant; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4591C19421;
	Thu, 19 Mar 2026 02:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888939;
	bh=JBDcZtrG6mP/xc3gO7VDWwX/f7UpvWRqfTVDJQ9Ka3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaXE2antR+2qcW2JyGyf3j3ytXGJhuhWliLmRXEZCYYn3f6Iz2vAzBbUw06nBEBFM
	 TBSU4N0wO113tYoYLjp0HbJcD6+WDo8wE9KF+IF0K/FJxW9NQ+pv+vt9fpw0kYjLtI
	 i/FfWVfuTuR8AQPYvbskeEq0gl92MOu8sruKbLBWqljXAWmLQvxKglVXDKO9dwy1Kh
	 HW+fxYftX1Ge9fxykbUsL8fcIew9w1yQg32FFezUgESpVLQhu0GB8UIOXQ2LXp7/Lu
	 10ralfWqjLT2qK79xcQWf3ckQP4IyjTB58kbURxZuvrG2Wwu/Kz1KuxHz27iBYUr4j
	 ynjBwMPt4lsgA==
Date: Wed, 18 Mar 2026 21:55:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/25] Introduce meminspect
Message-ID: <abtlUQqMOxj5PwGB@baldur>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <abdnp90cC5PI9wyz@baldur>
 <20260316181647.m7x4ncmwdjho6yvr@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316181647.m7x4ncmwdjho6yvr@hu-mojha-hyd.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98585-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linaro.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,vger.kernel.org,kvack.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[56];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.969];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 239922C52EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:46:47PM +0530, Mukesh Ojha wrote:
> On Sun, Mar 15, 2026 at 09:24:39PM -0500, Bjorn Andersson wrote:
> > On Wed, Mar 11, 2026 at 01:45:44AM +0530, Mukesh Ojha wrote:
[..]
> > >, to get all the regions as
> > > separate files.  The tool from the host computer will list the regions
> > > in the order they were downloaded.
> > > 
> > > Once you have all the files simply use `cat` to put them all together,
> > > in the order of the indexes.  For my kernel config and setup, here is my
> > > cat command : (you can use a script or something, I haven't done that so
> > > far):
> > 
> > So these need to be sorted in numerical order, by that number at the end
> > of the file name?
> > 
> > Do you manually punch these in? How do we make this user friendly?
> 
> Yes, manually.. but I think we can do better. We could make
> this more user‑friendly by using the section header and string table in
> the md_KELF binary both of which existed in the earlier implementation.
> Then, we can write an upstream‑friendly script that reads this KELF
> metadata file, checks whether a binary with the registered name is
> present, and stitches everything together to form a complete ELF that
> the crash tool can consume.  Let me know if you have any suggestion..
> 

Can we somehow identify that these regions belong to the minidump and
teach QDL to build the ELF for us?

Regards,
Bjorn

