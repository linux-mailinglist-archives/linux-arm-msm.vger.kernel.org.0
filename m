Return-Path: <linux-arm-msm+bounces-94963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FAvOESipWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:44:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4432C1DB17C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD0C030500E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C2F3FD149;
	Mon,  2 Mar 2026 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B/2rI/Vr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0C13CCA1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462141; cv=none; b=l9x/rJsvpxqQcMcQUw6RFdp157ybzyypiTaqhF1kBPkhh+iszjL6EF+sCaxJawXXprWcagZ468nMrNI8nQt1GB6dd8RZAGKc0JsuzzijofTSm8V/ZjE0UOw5vjv97tCJYzpo5zSAfdGnUVRdZjwPdTursBQCu0jQCu6ECPJOZn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462141; c=relaxed/simple;
	bh=7yS5Y9NxTOnt3JpxlOWsqa5c8SaWclOvm/XBz4gOXdU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mR2Th4kT/2Gx+NbUOS7/7G32vJ8mYV856Z0QIsHCbXoKASM+U0Mwo30hBevskk4BRh1jCIpRkKSin8QTNZaG8mWNdjFJF9mTSQIwND3oXXsFFp8Xz6DO+VPKWXtIQJQ8Qav9dwjxWq8LBvP539pX46rd4wS46z4hzM2hHBsqnnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B/2rI/Vr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so629405366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772462137; x=1773066937; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUn+iB4YXlBbjldwrLtAyNCdXFG7HtVdj+Ul3fGYGNA=;
        b=B/2rI/VrDQHQH/24WVmQ7klunDkQ6BHfSaJHYUT0BtFB5NAFKTxO7lCy5JRT+BqiYI
         SBs9pbDpdWxWOwH9EZOVo4v4fck09xWyFB/5XeThJl/OwEVVBKMYFcNiXwfZyB8mMzMs
         w8EWi7v3CBy5p0YEfTn4su7rck376zPt+6l5m98V53K1bpWAFhF5FhngjStWEXL0o8IH
         m53aCiwFa9kxO8mlnduUHg1Ms+nEt9wGMg3o5HPIQxWyw4LD0BqUT8pveymTy8SYA/Xa
         oq40XheQkZNblJ8iuTQzjMSYJoXBMZ0Ir9fjsGec4q3J1IR4GOKtGFgqtaZeTHcFuPcI
         3OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462137; x=1773066937;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUn+iB4YXlBbjldwrLtAyNCdXFG7HtVdj+Ul3fGYGNA=;
        b=J+yxhaP7d69BqqDGCNqMotD68UUcO0b3OgBxdh14n9z28ahJC1kRpvbbhV2mqrhus/
         ZYelstmtPlP/iqbp2YAmjoznZFTbGymQCX1iynYDVTq/dWPStTfXSGvV4CxcFgw4i5wS
         yUXajFMOqaioL4DAH4jBLWFKCRDuoRsbEtW4dXNHEwe0jyznM9RRPF1AfLDPRxWTvF6i
         JfgYdEOd4rFRBYZpa5uibipuY7Z02s2ZOuM2j3vO6iAAjTkhS7WCIzNfk6bJw795avh7
         J9792JyGZyE2R0JPi5Mea7Ydoji/hTFlyFYaj0NW5cBTWaG36aM8Agup+3M4kyOs/BrO
         jW0g==
X-Forwarded-Encrypted: i=1; AJvYcCWY1fDshn7Nj+A27A5NnZ5t0FfBqHeUhaf1amOnjgeal/CEJjMjiX3wMAsMVbWz47dQBSlIY3G8pb8ykddp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/mBNp78XHS2nrNZGOIjdmQ5aMlOwAmwmrwv4G5bHjvkm4LSF
	Uo4quDKbfkzJIq78Wv4Dd0piOgmzfv7cJ7zuqzgt8rsj4daNtqb3BeICcBUlOqB0tDY=
X-Gm-Gg: ATEYQzxXuVSpUo9axh3P0lqF13LDbyrd1UGyWcwaC18Mm9tG9zsO62/CIQ3dL1SbRz+
	pAjHv3IFbQUxJ1HwofckO4tFScKSTnAQrLnrl7E2ZT788ILGYKRatw5AdpSbDHi6pFGIyYmxPES
	Zc5wOd4B4eM/aFRmLCRTc4kORIHXarKDMV9ky7VoLLbUcQ5So8prjziR0gcIaywBwOmbXAXNhbZ
	NUVq7iS3yhVr1BYwLGGVBA2n6LY4RSX02pSxyAWs34czyImF0UsAqFYUhdhJdYPf5qcC4WipQJM
	Ty+GrE12aecUvGY0s8IW5jhCHNsgXYw87elbnkLiKb3u1JgdSF6wm7dR3ggDCvqNUHfgCn/cWQ9
	kOJsnpDF6ZnUbMom/XBnpVcVdz/bdbIdISrWZ6qmoco3zJfSzt+Gq+y8Iu0hdlzfq+c+y2GMcBz
	0Pubfk+hXIB2HZjzaMsca4GylZOokH93np0GVQqZMnGWp2xH/7mYZ2y3aFM7MD0V7Szi0+muf65
	yvkypo=
X-Received: by 2002:a17:907:1043:b0:b8e:9e11:6615 with SMTP id a640c23a62f3a-b93765539c4mr610839266b.47.1772462137447;
        Mon, 02 Mar 2026 06:35:37 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9385836a84sm337168566b.59.2026.03.02.06.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:35:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:35:36 +0100
Message-Id: <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com>
Cc: "yuanjiey" <yuanjie.yang@oss.qualcomm.com>,
 <robin.clark@oss.qualcomm.com>, <lumag@kernel.org>,
 <abhinav.kumar@linux.dev>, <jesszhan0024@gmail.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <tingwei.zhang@oss.qualcomm.com>,
 <aiqun.yu@oss.qualcomm.com>, <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and
 frequency
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
 <kusxzlezvsuwcwwdtm7yqwnqea6gdeolkepxpx3estabaiqymo@edj7pgccli3y>
 <aWSTcI6H6+7AXkEN@yuanjiey.ap.qualcomm.com>
 <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com>
 <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com>
 <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com>
 <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl>
 <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com>
 <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
In-Reply-To: <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z>
X-Rspamd-Queue-Id: 4432C1DB17C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94963-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri Feb 27, 2026 at 8:05 PM CET, Dmitry Baryshkov wrote:
> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>> > On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>> >> On 1/12/26 9:25 AM, yuanjiey wrote:
>> >>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrote:
>> >>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualcomm.c=
om> wrote:
>> >>>>>
>> >>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wrote:
>> >>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote:
>> >>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>=20
>> [...]
>>=20
>> > Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
>> > dpu_runtime_suspend, then we should be able to also skip setting OPP
>> > corner in dpu_runtime_resume(), because the previously set corner shou=
ld
>> > be viable until drm/msm driver commits new state / new modes.
>>=20
>> That matches my understanding.
>>=20
>> > The only important issue is to set the corner before starting up the
>> > DPU, where we already have code to set MDP_CLK to the max frequency.
>> >=20
>> > Which means, we only need to drop the dev_pm_set_rate call from the
>> > dpu_runtime_suspend().
>>=20
>> I concur.
>>=20
>> >> For MDSS, we're currently generally describing the MDSS_AHB clock, th=
e
>> >> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not even an=
 OPP
>> >=20
>> > No. As far as I remember, MDP_CLK is necessary to access MDSS register=
s
>> > (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for MDP5
>> > platforms")), I don't remember if accessing HW_REV without MDP_CLK
>> > resulted in a zero reads or in a crash. At the same time it needs to b=
e
>> > enabled to any rate, which means that for most of the operations
>> > msm_mdss.c can rely on DPU keeping the clock up and running.
>> >=20
>> >> table.. The GCC clock is sourced from (and scaled by) the NoC, but th=
e
>> >> MDSS_AHB one seems to have 3 actually configurable performance points
>> >> that neither we nor seemingly the downstream driver seem to really ca=
re
>> >> about (i.e. both just treat it as on/off). If we need to scale it, we
>> >> should add an OPP table, if we don't, we should at least add required=
-opps.
>> >=20
>> > I think, dispcc already has a minimal vote on the MMCX, which fulfill
>> > these needs.
>>=20
>> I have slightly mixed feelings, but I suppose that as we accepted Commit
>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the doma=
in"),
>> we can generally agree that it makes sense that calling genpd->on() actu=
ally
>> turns on the power indeed
>>=20
>> What I'm worried about is if the clock is pre-configured to run at a hig=
h
>> frequency from the bootloader (prepare_enable only sets the EN bit in th=
e RCG,
>> and doesn't impact the state of M/N/D at a glance), we may get a brownou=
t
>>=20
>> This rings the "downstream really did it better with putting clock dvfs =
states
>> into the clk driver" bell, but I suppose the way to fight this would be =
to
>> simply set_rate(fmax) there too..
>>=20
>> I attempted an experiment with pulling out the plug. MMCX enabled with t=
he
>> AHB clock off results in a read-as-zero. I tried really hard to disable =
the
>> mdp clock, but it seems like the "shared_ops" reflect some sort of "you
>> *really* can't just disable it" type behavior (verified with debugcc)
>
> I think, in 8996 it was possible to disable it. Not sure about
> 8998/630/660.
>
>>=20
>>=20
>> There's a possible race condition if we don't do it:
>>=20
>> ------- bootloader --------
>> configure display, mdp_clk=3Dturbo
>> ------- linux -------------
>> load rpmhpd     |
>> load venus      |
>> set mmcx=3Dlowsvs | mdp_clk is @ turbo
>>                 | brownout
>>                 |=20
>>                 | <mdss would only probe here>
>>=20
>> *but* that should be made impossible because of .sync_state().
>
> Yep, sync_state should prevent MMCX or CX from dropping under the boot
> level.
>
>>=20
>> This may impact hacky setups like simplefb, but as the name implies,
>> that's hacky.
>>=20
>> Relying on .sync_state() however will not cover the case if the mdss
>> module is removed and re-inserted later, possibly with mmcx disabled
>> entirely but the clock not parked at a sufficiently low rate.
>>=20
>>=20
>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should just
>> plug the MDP opp table into it and set_rate(fmax) during mdss init
>
> And what will drop it afterwards? MDSS will still vote on the MMCX / CX
> level even though DPU will change the clock freq.
>
>>=20
>> >> The MDP4/MDP5 drivers are probably wrong too in this regard, but many
>> >> targets supported by these may not even have OPP tables and are gener=
ally
>> >> not super high priority for spending time on.. that can, I'd kick dow=
n the
>> >> road unless someone really wants to step up
>> >=20
>> > I'd really not bother with those two drivers, unless we start seing
>> > crashes. For MDP4 platforms we don't implement power domains at all, n=
o
>> > interconnects, etc., which means that the system will never go to a
>> > lower power state.
>>=20
>> Right. Might be that 2030-something arrives and armv7 is gone before som=
eone
>> randomly decides to work on that!
>>=20
>> > MDP5 platforms mostly don't have OPP tables. (I'm not counting MSM8998=
 /
>> > SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MSM8976
>> > has both MDP and DSI tables (my favourite MSM8996 has none). Probably =
we
>> > should start there by adding missing bits adding corresponding
>> > dev_pm_set_rate() calls as required (as demostrated by the DPU driver)=
.
>>=20
>> A bit off-topic, but:
>>=20
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>>=20
>> 96 is in DPU. any other candidates that should be moved over?
>
> Let's go through them.
>
> All SoC except those currently supported in DPU require SMP (shared
> memory pool) support to be ported from the MDP5 driver.
>
> Most of the remaining platforms (except MSM8994/92) also had HW cursor
> implemented in a fancy way, in the LM rather than in a separate pipe.
> I'd really like to postpone those, possibly first completing migration
> of the other platforms and dropping support for them from MDP5.
>
> 1.0  - old MSM8974
>        I'd rather not touch it, it had bugs and I don't have HW
> 1.1  - MSM8x26
>        Probably Luca can better comment on it. Should be doable, but I
>        don't see upstream devices using display on it.

I have at least two MSM8x26 (1x APQ8026 lg-lenok & 1x MSM8926 htc-memul)
devices working with MDP5 fine. I should've probably upstreamed panel
driver & dts but they haven't been high priority..

Btw IOMMU support is here missing as well, so no GPU support anymore
since 6.17 if I'm not mistaken.

> 1.2  - MSM8974
>        I think it also had issues, no IOMMU support in upstream, etc.

Plenty of 'issues' for sure ;) but apart from GPU driver having dropped
no-IOMMU codepath they should be fairly fine, for what's currently
upstream.

I think also here, plenty of devices that do have panel support but not
much upstream. It's kind of all the same though, nothing exciting. Panel
driver with init sequence plus the same dts enablement bits.

Regards
Luca

> 1.3  - APQ8084
>        Had hw issues, no testing base, no MDSS in upstream DT
> 1.6  - MSM8916 / MSM8939
>        Can be done, low-hanging fruit for testing
> 1.7  - MSM8996
>        Supported in DPU
> 1.8  - MSM8936
>        No upsteram testing base
> 1.9  - MSM8994
>        No upstream testing base, no MDSS in upstream DT, normal CURSOR pl=
anes
> 1.10 - MSM8992
>        Even less testing base, no MDSS in upstream DT, normal CURSOR plan=
es
> 1.11 - MSM8956 / 76
>        No complete display configurations upstream
> 1.14 - MSM8937
>        Supported in DPU
> 1.15 - MSM8917
>        Supported in DPU
> 1.16 - MSM8953
>        Supported in DPU
> 1.17 - QCS405
>        Zero testing base, no MDSS in upstream DT
>
> MSM8994/92 would have been an ideal testbeds for SMP testing, but...
> they mostly don't exist (please correct me if I'm wrong). Which means
> that the next viable targets are MSM8916, MSM8x26 and MSM8956/76. All of
> them require SMP support and don't make sense without cursor handling.
>
>> > A note to myself to also add OPP tables support to the HDMI driver.
>>=20
>> Eliza!
>
> MSM8996 / 98!


