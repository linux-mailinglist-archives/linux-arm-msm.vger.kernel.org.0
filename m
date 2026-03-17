Return-Path: <linux-arm-msm+bounces-98223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE16EhJyuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:24:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FAF2ACF6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 045D33068A2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410222DCC1C;
	Tue, 17 Mar 2026 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e4LFqt0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B33A7F78
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760699; cv=none; b=sgBYE6lyJnQMlLH5mbWG2UxDXTS48nLc7jDBJtcmIqI0ZrQ25EfXEL5+EwtQJPEN7ia/ywCo43+xOtcgSLUG9FbynapsyQyROSf0t9QIp2tbYQ2MbTlGwV8rU81VHMzGlT6UBamv/ZPtfUa6kOGKQoaJ4tv+0ijKILuMgZia70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760699; c=relaxed/simple;
	bh=MTlQUKHqujhyRDTQpa/l9iNeRNtcW5BFPyz3Fu22eMY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=snyvbAHphUWHXvO0xIuEh5HTe9HJ8JirOGcQZWwTwbImzYR9mj26ey4/RBoA3MuRRgJnZF5L4ZkPOqefHL/8atBGZFZrNnb0y9BgZ76PnOvBKCUkujPEEfrf/f3Mw7T6J+lPzKeTB2F5DYUCjPsZTdAFUNm57AR4P31LIf4up8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e4LFqt0s; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b97e5956208so77555666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773760696; x=1774365496; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLOIoVOvc3ULrd60PWM378GR2y4L4v7j9eb4/ygVlt8=;
        b=e4LFqt0sqymm4a+vM1grmnv90zLPMfLx6/18kSRYk8D0Hm3IlcVZrVypGCVo5buSIz
         jEsDM6oqFQ0wwtUONP34vRJmou5+ZuIH6slTSaU6OVPr95/G1GtQ2f1X2KJ5H/1TJ1vM
         cVuIY4Pg4ECpoiZkOEvY8zaSqHMfSmIh1s+jInZ2Qh+DJyxPzpSH80/TxmhAnJPI6P5I
         Li0y7sf/v0IOXQYBGGEvG7kcV7zNhwiIdEHaG4dBdeYpepmS846GkB5R61FN2JUCJG/q
         EvzyC1Hs0WMHS0kJ1rpWYrlih844ZJQsdEiirbPAASEOhi46UFHLO2O7W/ld9griX5db
         xCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773760696; x=1774365496;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLOIoVOvc3ULrd60PWM378GR2y4L4v7j9eb4/ygVlt8=;
        b=eCA/U/e/RMKDcMNl9eEPKeq4d0LMMmumv17Fs2IrUSN/Ch7ctICKz02Cv9wNNuO28O
         0gFtYyO0k5cyhnsN87lTZ2KdgzyYyQkEIPHwpbKjjd+SVEJSUiRr4VeBp37JuUY2bWUe
         RHfVpaiRgUjZg3HqOxjQ5XsC8W7KIkfpxgdN+4AOv4v3aE7+V5yohfj2e4JRtKzaIhVb
         gKueBKV2omwsPwQca2bruXbt9O5LA9nu9zqBFiUdFEsfso3RekfijoTZ1+8vzXXNzskC
         q2KMHFVr7eR0FGuhXPslfH5kcK1UhTqkfjZMHFY59s/PG8KWKM9mAEyxNuBhDsOPliqb
         ndCg==
X-Forwarded-Encrypted: i=1; AJvYcCW0LnsNpWNLqB3DW412rOEKxX810hDdof/ls1limDvoTboM34iuONRmHdqIPcZ7qeX5qcRmW99SGLXEJ15J@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhc3heb0SBJs4L5S6AgxUvjiwa77+ia7kyHArS5I57vnoQL6kx
	PixAhZI93PgAlI0bmTQmOskqSXZD+njtNwBwvvRMTEwF4hFYuO1gjU6O6FenZTl3dy4=
X-Gm-Gg: ATEYQzyWi8bp84Icl1C3qK91TqAdpenhy9Vfn08yAIfinghXKqJpV+cCvi2XSqwNiw/
	TXZiYebNSeORH2Rck/TQ0IvBljW64P6U2SgFOGXSmu1uoAPQMMpo1llRblfDh6Ub07OcWkVExhb
	kwPBSnpWioNgGcF2T9L8gORdysJKfkqrc0d9iMCKK4/7dJOOWRRMvqBAmoVbbJFK7l6gZbwyeYf
	awfO2IIIn+Qx6lMRQAhKLmSTlAUZoSAWD3dYzxRUluzlh785dLgE9WkVG6ypWoGc45EkaQkYdLq
	OWSlowudtKJ5rulDlL6Vuz2hri1txTpADlBK7IvLBN9IO3XDaKDXpNLQb8e5zIvPWl4aybYtMBA
	JJURqgJUP1YaaNDW72/ExupaHjzkE6adX7OHdmFm+0dsXZ4CKpZrP+B40on4WJ3bwAz2TCw9O7c
	LzdKPajGhjHByZH7+a7CIolW4NTxJr1GI8gCj9hVypWp/edFuAJ39u3F4xDGDUPhFXwV+q
X-Received: by 2002:a17:907:8dcd:b0:b93:c5a9:a5e6 with SMTP id a640c23a62f3a-b976507af92mr1026443766b.2.1773760695505;
        Tue, 17 Mar 2026 08:18:15 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcc17sm115389a12.5.2026.03.17.08.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 08:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 16:18:13 +0100
Message-Id: <DH55OTHPTVD0.3CEOFJJRR8A12@fairphone.com>
Cc: "Luca Weiss" <luca.weiss@fairphone.com>, "yuanjiey"
 <yuanjie.yang@oss.qualcomm.com>, <robin.clark@oss.qualcomm.com>,
 <lumag@kernel.org>, <abhinav.kumar@linux.dev>, <jesszhan0024@gmail.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <krzysztof.kozlowski@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <tingwei.zhang@oss.qualcomm.com>, <aiqun.yu@oss.qualcomm.com>,
 <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and
 frequency
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAO9ioeVrQ_TfU5-auxNHG=dL8VmeWtBaC_NE09UECodkYrFv-w@mail.gmail.com> <aWSv+kVV3G18I/NJ@yuanjiey.ap.qualcomm.com> <e5ebc660-e30e-4fcd-ace6-5a6c889e9a8a@oss.qualcomm.com> <4g6fyehdc3fejx3pzeysmghigazfei3jz2vmnvxrnqkkbtbxdb@bdlcddxlvbhl> <cb22367a-678c-431f-9f52-33663f4af9d7@oss.qualcomm.com> <jr4h4sx42dbxpknm5nkgj7ydpkivm4nglfz7ui4bjpom7wf6ub@spqb27d3ov2z> <DGSDE0ID17DQ.XQZNKZH5UKPO@fairphone.com> <g3dclilgoee6a2dyfqdvk67asjb4ptur5nc52iqqeqpiiourpv@46xstae5zsy3> <DH4WJ5KZ39MS.AHLMLFB8E0JW@fairphone.com> <3e5f80a6-d9bc-46ee-89ca-b1b2ba744493@oss.qualcomm.com> <necpphuujv4cyc33sf6eaaamh2hnub2poch7rjgvxzu6id62zw@rxotgr3rtbsb>
In-Reply-To: <necpphuujv4cyc33sf6eaaamh2hnub2poch7rjgvxzu6id62zw@rxotgr3rtbsb>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98223-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[fairphone.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,fairphone.com:dkim,fairphone.com:mid]
X-Rspamd-Queue-Id: 94FAF2ACF6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 17, 2026 at 4:16 PM CET, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 09:59:28AM +0100, Konrad Dybcio wrote:
>> On 3/17/26 9:07 AM, Luca Weiss wrote:
>> > On Mon Mar 2, 2026 at 4:17 PM CET, Dmitry Baryshkov wrote:
>> >> On Mon, Mar 02, 2026 at 03:35:36PM +0100, Luca Weiss wrote:
>> >>> On Fri Feb 27, 2026 at 8:05 PM CET, Dmitry Baryshkov wrote:
>> >>>> On Fri, Feb 27, 2026 at 12:34:04PM +0100, Konrad Dybcio wrote:
>> >>>>> On 2/27/26 4:48 AM, Dmitry Baryshkov wrote:
>> >>>>>> On Thu, Feb 26, 2026 at 02:35:52PM +0100, Konrad Dybcio wrote:
>> >>>>>>> On 1/12/26 9:25 AM, yuanjiey wrote:
>> >>>>>>>> On Mon, Jan 12, 2026 at 09:38:41AM +0200, Dmitry Baryshkov wrot=
e:
>> >>>>>>>>> On Mon, 12 Jan 2026 at 08:23, yuanjiey <yuanjie.yang@oss.qualc=
omm.com> wrote:
>> >>>>>>>>>>
>> >>>>>>>>>> On Fri, Jan 09, 2026 at 05:22:37PM +0200, Dmitry Baryshkov wr=
ote:
>> >>>>>>>>>>> On Fri, Jan 09, 2026 at 04:38:07PM +0800, yuanjie yang wrote=
:
>> >>>>>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>> >>>>>
>> >>>>> [...]
>> >>>>>
>> >>>>>> Please correct me if I'm wrong, if we drop dev_pm_opp_set() from
>> >>>>>> dpu_runtime_suspend, then we should be able to also skip setting =
OPP
>> >>>>>> corner in dpu_runtime_resume(), because the previously set corner=
 should
>> >>>>>> be viable until drm/msm driver commits new state / new modes.
>> >>>>>
>> >>>>> That matches my understanding.
>> >>>>>
>> >>>>>> The only important issue is to set the corner before starting up =
the
>> >>>>>> DPU, where we already have code to set MDP_CLK to the max frequen=
cy.
>> >>>>>>
>> >>>>>> Which means, we only need to drop the dev_pm_set_rate call from t=
he
>> >>>>>> dpu_runtime_suspend().
>> >>>>>
>> >>>>> I concur.
>> >>>>>
>> >>>>>>> For MDSS, we're currently generally describing the MDSS_AHB cloc=
k, the
>> >>>>>>> GCC_AHB clock and the MDP clock (sounds wrong?) - there's not ev=
en an OPP
>> >>>>>>
>> >>>>>> No. As far as I remember, MDP_CLK is necessary to access MDSS reg=
isters
>> >>>>>> (see commit d2570ee67a47 ("drm/msm/mdss: generate MDSS data for M=
DP5
>> >>>>>> platforms")), I don't remember if accessing HW_REV without MDP_CL=
K
>> >>>>>> resulted in a zero reads or in a crash. At the same time it needs=
 to be
>> >>>>>> enabled to any rate, which means that for most of the operations
>> >>>>>> msm_mdss.c can rely on DPU keeping the clock up and running.
>> >>>>>>
>> >>>>>>> table.. The GCC clock is sourced from (and scaled by) the NoC, b=
ut the
>> >>>>>>> MDSS_AHB one seems to have 3 actually configurable performance p=
oints
>> >>>>>>> that neither we nor seemingly the downstream driver seem to real=
ly care
>> >>>>>>> about (i.e. both just treat it as on/off). If we need to scale i=
t, we
>> >>>>>>> should add an OPP table, if we don't, we should at least add req=
uired-opps.
>> >>>>>>
>> >>>>>> I think, dispcc already has a minimal vote on the MMCX, which ful=
fill
>> >>>>>> these needs.
>> >>>>>
>> >>>>> I have slightly mixed feelings, but I suppose that as we accepted =
Commit
>> >>>>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable th=
e domain"),
>> >>>>> we can generally agree that it makes sense that calling genpd->on(=
) actually
>> >>>>> turns on the power indeed
>> >>>>>
>> >>>>> What I'm worried about is if the clock is pre-configured to run at=
 a high
>> >>>>> frequency from the bootloader (prepare_enable only sets the EN bit=
 in the RCG,
>> >>>>> and doesn't impact the state of M/N/D at a glance), we may get a b=
rownout
>> >>>>>
>> >>>>> This rings the "downstream really did it better with putting clock=
 dvfs states
>> >>>>> into the clk driver" bell, but I suppose the way to fight this wou=
ld be to
>> >>>>> simply set_rate(fmax) there too..
>> >>>>>
>> >>>>> I attempted an experiment with pulling out the plug. MMCX enabled =
with the
>> >>>>> AHB clock off results in a read-as-zero. I tried really hard to di=
sable the
>> >>>>> mdp clock, but it seems like the "shared_ops" reflect some sort of=
 "you
>> >>>>> *really* can't just disable it" type behavior (verified with debug=
cc)
>> >>>>
>> >>>> I think, in 8996 it was possible to disable it. Not sure about
>> >>>> 8998/630/660.
>> >>>>
>> >>>>>
>> >>>>>
>> >>>>> There's a possible race condition if we don't do it:
>> >>>>>
>> >>>>> ------- bootloader --------
>> >>>>> configure display, mdp_clk=3Dturbo
>> >>>>> ------- linux -------------
>> >>>>> load rpmhpd     |
>> >>>>> load venus      |
>> >>>>> set mmcx=3Dlowsvs | mdp_clk is @ turbo
>> >>>>>                 | brownout
>> >>>>>                 |=20
>> >>>>>                 | <mdss would only probe here>
>> >>>>>
>> >>>>> *but* that should be made impossible because of .sync_state().
>> >>>>
>> >>>> Yep, sync_state should prevent MMCX or CX from dropping under the b=
oot
>> >>>> level.
>> >>>>
>> >>>>>
>> >>>>> This may impact hacky setups like simplefb, but as the name implie=
s,
>> >>>>> that's hacky.
>> >>>>>
>> >>>>> Relying on .sync_state() however will not cover the case if the md=
ss
>> >>>>> module is removed and re-inserted later, possibly with mmcx disabl=
ed
>> >>>>> entirely but the clock not parked at a sufficiently low rate.
>> >>>>>
>> >>>>>
>> >>>>> TLDR: reassess whether MDSS needs the MDP clock, if so, we should =
just
>> >>>>> plug the MDP opp table into it and set_rate(fmax) during mdss init
>> >>>>
>> >>>> And what will drop it afterwards? MDSS will still vote on the MMCX =
/ CX
>> >>>> level even though DPU will change the clock freq.
>> >>>>
>> >>>>>
>> >>>>>>> The MDP4/MDP5 drivers are probably wrong too in this regard, but=
 many
>> >>>>>>> targets supported by these may not even have OPP tables and are =
generally
>> >>>>>>> not super high priority for spending time on.. that can, I'd kic=
k down the
>> >>>>>>> road unless someone really wants to step up
>> >>>>>>
>> >>>>>> I'd really not bother with those two drivers, unless we start sei=
ng
>> >>>>>> crashes. For MDP4 platforms we don't implement power domains at a=
ll, no
>> >>>>>> interconnects, etc., which means that the system will never go to=
 a
>> >>>>>> lower power state.
>> >>>>>
>> >>>>> Right. Might be that 2030-something arrives and armv7 is gone befo=
re someone
>> >>>>> randomly decides to work on that!
>> >>>>>
>> >>>>>> MDP5 platforms mostly don't have OPP tables. (I'm not counting MS=
M8998 /
>> >>>>>> SDM630 / SDM660 here). MSM8917 / MSM8937 have only DSI tables, MS=
M8976
>> >>>>>> has both MDP and DSI tables (my favourite MSM8996 has none). Prob=
ably we
>> >>>>>> should start there by adding missing bits adding corresponding
>> >>>>>> dev_pm_set_rate() calls as required (as demostrated by the DPU dr=
iver).
>> >>>>>
>> >>>>> A bit off-topic, but:
>> >>>>>
>> >>>>> drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
>> >>>>>
>> >>>>> 96 is in DPU. any other candidates that should be moved over?
>> >>>>
>> >>>> Let's go through them.
>> >>>>
>> >>>> All SoC except those currently supported in DPU require SMP (shared
>> >>>> memory pool) support to be ported from the MDP5 driver.
>> >>>>
>> >>>> Most of the remaining platforms (except MSM8994/92) also had HW cur=
sor
>> >>>> implemented in a fancy way, in the LM rather than in a separate pip=
e.
>> >>>> I'd really like to postpone those, possibly first completing migrat=
ion
>> >>>> of the other platforms and dropping support for them from MDP5.
>> >>>>
>> >>>> 1.0  - old MSM8974
>> >>>>        I'd rather not touch it, it had bugs and I don't have HW
>> >>>> 1.1  - MSM8x26
>> >>>>        Probably Luca can better comment on it. Should be doable, bu=
t I
>> >>>>        don't see upstream devices using display on it.
>> >>>
>> >>> I have at least two MSM8x26 (1x APQ8026 lg-lenok & 1x MSM8926 htc-me=
mul)
>> >>> devices working with MDP5 fine. I should've probably upstreamed pane=
l
>> >>> driver & dts but they haven't been high priority..
>> >>
>> >> I think I have been saying this: having a panel & dsi enabled in DT i=
s
>> >> the only way for me to know that the display is working on this
>> >> platform. I'd really kindly ask you and other activists to get at lea=
st
>> >> some panel drivers and corresponding DT bits upstream. It is really a=
n
>> >> important flag for me.
>> >>
>> >> I can propose some kind of bounty for those getting MDSS+panel suppor=
ted
>> >> in Qcom DT. (Beer at the next conf we meet? Some stickers for the
>> >> laptops and phones? M=C3=A4mmi?)
>> >=20
>> > Hm I realized yesterday (through trying it), that also MDSS is broken
>> > since the no-IOMMU codepath was removed from drm/msm. I thought this w=
as
>> > only affecting GPU but it's also affecting MDSS/MDP5 :(
>> >=20
>> > So I guess no panel enablement anytime soon until the IOMMU situation =
is
>> > sorted out, for both 8226 and 8974...
>>=20
>> If you're sure the panel drivers are good (e.g. they worked on 6.whateve=
r
>> prior to drm/msm saying sayonara to carveout), I think no one would obje=
ct
>> to have them merged separately, so that you don't have to wait until
>> who-knows-when and keep rebasing them by hand
>
> +1. Please submit them and cc me so that I don't miss those.

Including dts?

The drivers themselves are bog-standard, I've generated them with
linux-mdss-dsi-panel-driver-generator like it's done for most qcom
phones/devices.

But I can work on it.

Regards
Luca

