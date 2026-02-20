Return-Path: <linux-arm-msm+bounces-93511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDaAAmxxmGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:36:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F575168670
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 697B0311993E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC169286D63;
	Fri, 20 Feb 2026 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk3FWQkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAF28003A;
	Fri, 20 Feb 2026 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597929; cv=none; b=tEXfuv+M6/eeYWp/Wu2fLNpaK1EBGgq+g4pVeIDlj81YwKYR5odbbPdF7bQ2zEymD5+ADTQ2iw5MoWZ3BDk6/l+5NwPtGQCy/qqpF4tdBvwCgAY3Vqg/do7yeB4N43A90mQe9ZTkRciLkahqxb70DirbmNCy1wMwfIAlOFWHiBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597929; c=relaxed/simple;
	bh=1M11SA+ltr4NvATrgDpjQBdRLpS+kLn6M09PWZGJHwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjKf48r2h33I+8W3xbfv3mq9egpVh43sdt7Uh5l2Q6l5BAMMlxoq3BsSR2Ifz4eukrxK3G2W4KezVgulnL3pLzwnWxta2XFsw6Gf9aSjOK2rr0hUvzTEOTRedL7TtO134YAyKFlYGxDXlqiZoPPBv4HReFR8uxd5zX4nukmIZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bk3FWQkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBB8C2BCB1;
	Fri, 20 Feb 2026 14:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771597929;
	bh=1M11SA+ltr4NvATrgDpjQBdRLpS+kLn6M09PWZGJHwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bk3FWQkKC69HK9KxV/2pry1as+Bp43u2/WPQsyclljFvWmGBlMqBN1/YGtYjD76cp
	 uJzdU1WD1A1dzp5rQjQJzZ1vrQTOkdtZUhJ/12kKffMUyFVrsScHFIP1hiviQGWiqW
	 jHlK457WVcIluxjTTkB4AF+709yUvPYdBj3Uul60hi2hzzQaPx2ryShVj1hsaCv3Ve
	 p99Cel4LEdeseHqZOv1CPG/+FUF5P/FYuRKDB431/aswKbEEtqAVb1jLF3md8A4QBQ
	 QemQZ6eEclpciuBP5EnifKUOh61yCMQkMWCb1BU5HMdSuCrlPAh5/IzpiqU6kPkZGf
	 QGhvmkpTz+dzA==
Date: Fri, 20 Feb 2026 20:01:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, cros-qcom-dts-watchers@chromium.org, 
	Brian Masney <bmasney@redhat.com>, Neeraj Soni <neeraj.soni@oss.qualcomm.com>, 
	Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: crypto: qcom,ice: Require
 power-domain and iface clk
Message-ID: <3cxejy2jplgqufj5fivi27ii3rrcrhzdyvmxd4ekp2ik3aqa6l@tiwyslt3ng5p>
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com>
 <14a71b33-4c10-41b0-a6cb-585a38e05f56@kernel.org>
 <06160c6c-a945-467a-be82-7b33c5285d0f@oss.qualcomm.com>
 <7216c86d-2b87-496c-9548-ccdcb3c98b6b@oss.qualcomm.com>
 <1f99db18-d76c-4b87-9e30-423eee7037e1@oss.qualcomm.com>
 <dd34525c-0a25-47ae-9061-c4c7ab708306@kernel.org>
 <2830a189-a5ce-45a0-92fe-7a01c3b012a7@oss.qualcomm.com>
 <6efcdf51-bdb1-4dfc-aa5e-8b7dc8c68cd3@kernel.org>
 <b217a08a-2755-4ef8-bf39-af1c3e628cf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b217a08a-2755-4ef8-bf39-af1c3e628cf8@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93511-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5F575168670
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:13:06AM +0530, Harshal Dev wrote:
> Hi Krzysztof,
> 
> On 2/6/2026 4:20 PM, Krzysztof Kozlowski wrote:
> > On 06/02/2026 11:07, Harshal Dev wrote:
> >> Hi Krzysztof,
> >>
> >> On 2/5/2026 4:47 PM, Krzysztof Kozlowski wrote:
> >>> On 03/02/2026 10:26, Harshal Dev wrote:
> >>>> Hi Krzysztof and Konrad,
> >>>>
> >>>> On 1/26/2026 3:59 PM, Konrad Dybcio wrote:
> >>>>> On 1/23/26 12:04 PM, Harshal Dev wrote:
> >>>>>> Hi Krzysztof,
> >>>>>>
> >>>>>> On 1/23/2026 2:27 PM, Krzysztof Kozlowski wrote:
> >>>>>>> On 23/01/2026 08:11, Harshal Dev wrote:
> >>>>>>>> Update the inline-crypto engine DT binding to reflect that power-domain and
> >>>>>>>> clock-names are now mandatory. Also update the maximum number of clocks
> >>>>>>>> that can be specified to two. These new fields are mandatory because ICE
> >>>>>>>> needs to vote on the power domain before it attempts to vote on the core
> >>>>>>>> and iface clocks to avoid clock 'stuck' issues.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> >>>>>>>> ---
> >>>>>>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
> >>>>>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> >>>>>>>> index c3408dcf5d20..1c2416117d4c 100644
> >>>>>>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> >>>>>>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> >>>>>>>> @@ -28,12 +28,20 @@ properties:
> >>>>>>>>      maxItems: 1
> >>>>>>>>  
> >>>>>>>>    clocks:
> >>>>>>>> +    maxItems: 2
> >>>>>>>
> >>>>>>> This is ABI break and your commit msg suggests things were not perfect,
> >>>>>>> but it is not explicit - was this working or not? How is it that ICE was
> >>>>>>> never tested?
> >>>>>>>
> >>>>>>
> >>>>>> I took some time to educate myself on the point of DT bindings stability being a
> >>>>>> strict requirement now, so I understand how these changes are breaking ABI, I'll
> >>>>>> send a better version of this again.
> >>>>>>
> >>>>>> As for your question of how it was working till now, it seems that
> >>>>>> things were tested with the 'clk_ignore_unused' flag, or with CONFIG_SCSI_UFS_QCOM
> >>>>>> flag being override set to 'y'. When this is done, QCOM-ICE (on which QCOM-UFS
> >>>>>> depends) initiates probe _before_ the unused clocks and power-domains are
> >>>>>> disabled by the kernel. And so, the un-clocked register access or clock 'stuck'
> >>>>>> isn't observed (since the clocks and power domains are already enabled).
> >>>>>> Perhaps I should write this scenario explicitly in the commit message?
> >>>>>>
> >>>>>> To maintain backward compatibility, let me introduce minItems and maxItems for clocks.
> >>>>>> When the Linux distro uses CONFIG_SCSI_UFS_QCOM=y, we can do with just 1 clock as
> >>>>>> before.
> >>>>>
> >>>>> You must not assume any particular kernel configuration
> >>>>>
> >>>>> clk_ignore_unused is a hack which leads to situations like this, since
> >>>>> the bootloader doesn't clean up clocks it turned on, which leads to
> >>>>> situations like this where someone who previously wrote this binding
> >>>>> didn't care enough to **actually** test whether this device can operate
> >>>>> with only the set of clocks it requires
> >>>>>
> >>>>> I believe in this case it absolutely makes sense to break things, but
> >>>>> you must put the backstory in writing, in the commit message
> >>>>>
> >>>>
> >>>> I took some more time to think this through, and I agree with you now Konrad.
> >>>>
> >>>> These DT bindings appear to be invalid from day-1. ICE being an independent
> >>>> and common IP for both UFS and SDCC, it cannot operate correctly without its
> >>>> power-domain and clocks being enabled first. Hence, it should be mandatory for
> >>>> them to be specified in the DT-node and the same should be reflected in the DT
> >>>> binding.
> >>>>
> >>>> The only reason I can think of for omitting the 'power-domain' and 'iface' clock
> >>>> in the original DT-binding for ICE is because we failed to test the driver on
> >>>> a production kernel where the 'clk_ignore_unused' flag is not passed on the cmdline.
> >>>
> >>> That's a reason to change ABI in the bindings, but not a reason to break
> >>> in-kernel or out of tree DTS.
> >>>
> >>>> Or if we did test that way, we were just lucky to not run into a timing scenario
> >>>> where the probe for the driver is attempted _after_ the clocks are turned off by the
> >>>> kernel.
> >>>>
> >>>> Sending a new patch, which makes these two resources optional (to preserve the DT
> >>>> binding) would either imply that we are make this bug fix optional as well or
> >>>> asking the reporter to resort to some workaround such as overriding
> >>>> CONFIG_SCSI_UFS_QCOM to 'y'.
> >>>
> >>> Either I do not understand the point or you still insist on breaking a
> >>> working DTS on kernels with clk_ignore_unused, just because what
> >>> exactly? You claim it did not work, but in fact it did work. So you
> >>> claim it worked by luck, right? And what this patchset achieves? It
> >>> breaks this "work by luck" into "100% not working and broken". I do not
> >>> see how is this an improvement.
> >>>
> >>
> >> My point is something more fundamental. It worked before and it will still continue
> >> to work if:
> >> 1. We pass the 'clk_ignore_unused' flag. or,
> >> 2. If the Linux distro is overriding CONFIG_SCSI_UFS_QCOM to 'y'.
> > 
> > I do not agree with this. I already commented about your driver. If you
> > do not believe me, apply your driver patch and show the test results of
> > existing working device.
> > 
> >
> 
> Apologies, it seems like I failed to explain correctly what I meant.
> Here I was talking about the existing in-tree ICE driver and not about this particular DT
> binding commit. This commit, as you rightly said and I mentioned below too, breaks backward
> compatibility for existing in-tree and out-of-tree DTS.
> 
> >>
> >> But that does not change the fact that the current DT binding does not fully describe all
> >> the resources required by the hardware block to function correctly.
> >>
> >>> My NAK for driver change stays. This is wrong approach - you cannot
> >>> break working DTS.
> >>>
> >>
> >> I agree that this patch in it's current form will break both the in-kernel and
> >> out of tree DTS written in accordance with the old binding. If this isn't acceptable
> > 
> > What? You just said few lines above:
> > "it will still continue to work if:"
> >
> 
> I hope I am clear now, 'it' referred to the in-tree ICE driver and not to this particular
> DT schema commit. :)
>  
> > So either this will continue to work or not. I don't understand this
> > thread and honestly do not have patience for it. I gave you already
> > reasoning what is wrong and why it is. Now it is just wasting my time.
> > 
> 
> Apologies again for the confusion. I totally agree, as replied previously too, that the
> updated DT binding breaks backward compatibility. Like I said, I will post another patch
> to preserve the correctness of existing in-tree and out-of-tree DTS.
> 

The ICE hardware cannot work without 'iface' clock and the power domain, which
are shared with the UFS PHY. One can argue that ICE is actually a part of the
peripherals like UFS/eMMC, but I don't have access to internal layout, so cannot
comment on that. I ran into this issue today when I tried to rmmod ice driver
together with ufs_qcom driver and got SError when reloading the module because
ice driver was trying to access unclocked/unpowered register.

But you should mark the resources as 'required' in the binding and justify the
ABI break. No need to preserve backwards compatibility here as the binding was
wrong from day one.

> The only point I am trying to highlight for everyone's awareness is that as per this bug
> report https://lore.kernel.org/all/ZZYTYsaNUuWQg3tR@x1/ the kernel fails to boot with the
> existing DTS when the above two conditions aren't satisfied.
> 

And you sent the fix after almost 2 years. Atleast I'm happy that you got around
to fix it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

