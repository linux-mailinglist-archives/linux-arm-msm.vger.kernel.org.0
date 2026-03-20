Return-Path: <linux-arm-msm+bounces-98969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KtiEEycvWmR/QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 20:13:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5262DFD00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 20:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A77B300F5A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 19:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13992D97AA;
	Fri, 20 Mar 2026 19:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="XZmytjf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB22D978B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774033992; cv=none; b=KV7JE2fgwUj5BZJNFeNrDvq0swyAmgHqKL3WUpcGiSozH9PTSpwJiKVNzNgDQlsQR+aZ5zCNoOC5inQBR/kg49Pal6wxzkpHCutV4QuSf9FrWbiV/Kvudc9a9INaAAg25D+lQSOjWV3vX34FLFHZev4HEoyeUdIk5pw/vHe6Bpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774033992; c=relaxed/simple;
	bh=JOczIFB/KWR9QK9+29E/6o7G3dN7AFvLmbBpZmqM8JY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7ADFn08d1ZTuDA+p/koB/mqRVP9BRgb8jcgStzpnHK00dJ2zGzSBI0WZflb1XOvuVGZ/6rl+/i8lsgDEgNo+ewLUKJ9rwosxx35QJhCqx3WAGUs4HVaBDMDLAYA+uU7NhdmRJ7R3D3Y19XD3GavV+2wRIPgHe1HxcjdMTaxXHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=XZmytjf9; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774033981; x=1774293181;
	bh=DU53y0zR+yESbQQ8vsMbLInprF8o2ZYU0QnZx7ReE3M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XZmytjf9VMqAaBjdI3cdhRkFJZfBINC1chrezCGUGAhl3ZbwS6gRPf7apufMQVcXd
	 WjYZXIwTUzSaEweLr0XZkzB3+Bk4kEQRb1mwoQfWlfrg9mdu1VjbZ3YjrwHq08L9Sb
	 eoFgX3P97l9L1TfilR2lhYI974YKz/J1QlY0svgp+bbSxC93cu0+jbNBeAaKS4pABX
	 5XE6hZNoeYHysmFztXQ4TRntC4hICDnizDjYBA1BvlbkzGu76LPq0j5ZA0B0HWwCUD
	 0BGvsNVt1P7qiYejUEqhIYdvGqXHl/Jw2XG2+3ZyuDD6g+oFmeORTixufF6aL6bVTD
	 71hbx9kTH++1Q==
Date: Fri, 20 Mar 2026 19:12:56 +0000
To: Pengyu Luo <mitltlatltl@gmail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, jeffrey.l.hugo@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width calculation
Message-ID: <z5Q2MMTkjlFG1ye2Vv0uZrEyVqazEnPeBWDmYwlvpZKK1m5tRSfP94gZNEUbec9qKSiaUQpzyqveE8ehad3JkL69HRKnHMSKJUhOm7mP1nE=@pm.me>
In-Reply-To: <CAH2e8h6wvab7tvZRUt0xS=SA5+hnKopQKCayT0JEgWL9_e3uTQ@mail.gmail.com>
References: <CAH2e8h6oinKxN1ndcvHCSc+=bFLXVVDZVAVF0cQHoiaMvEwhPQ@mail.gmail.com> <X2fV9mpVHV6Qk8-ImS7vxqDQXFt4K85jPKJWnxVono324hHaRh7x13f2HYM4CKNK-UDqrmP8Jz79-oVklw8vLBfaxPbVuQq4FBfblu27R9s=@pm.me> <CAH2e8h5tns-sXZ3-cvBmeAgbkNT1sG0kxNeaUGZnHoFEYh-Tjg@mail.gmail.com> <ZPf83Rxo54mgr4un9o9CNu9rXp4-8cQ8jkYIfHZODIzbJXEMISRS2PZKYqDCijOAq1N2eq0Wnt-kS0ys9KV0uB5TawUQLNjNcSzfQeUWe10=@pm.me> <CAH2e8h6wvab7tvZRUt0xS=SA5+hnKopQKCayT0JEgWL9_e3uTQ@mail.gmail.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b1d8d5f1b63b9c361bcdb711c3dc0bc9b2d590b4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98969-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,oss.qualcomm.com,lists.freedesktop.org,marek.ca,vger.kernel.org,kernel.org,linux.intel.com,somainline.org,linaro.org,poorly.run,ffwll.ch,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.927];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,marek.ca:email]
X-Rspamd-Queue-Id: DD5262DFD00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Friday, March 20th, 2026 at 9:36 AM, Pengyu Luo <mitltlatltl@gmail.com> =
wrote:

> On Fri, Mar 20, 2026 at 9:18=E2=80=AFPM Alexander Koskovich <akoskovich@p=
m.me> wrote:
> >
> > On Friday, March 20th, 2026 at 8:20 AM, Pengyu Luo <mitltlatltl@gmail.c=
om> wrote:
> >
> > > On Fri, Mar 20, 2026 at 8:14=E2=80=AFPM Alexander Koskovich <akoskovi=
ch@pm.me> wrote:
> > > >
> > > > On Friday, March 20th, 2026 at 8:08 AM, Pengyu Luo <mitltlatltl@gma=
il.com> wrote:
> > > >
> > > > > On Fri, Mar 20, 2026 at 4:17=E2=80=AFPM Alexander Koskovich <akos=
kovich@pm.me> wrote:
> > > > > > >
> > > > > > > On Friday, March 20th, 2026 at 3:36 AM, Dmitry Baryshkov <dmi=
try.baryshkov@oss.qualcomm.com> wrote:
> > > > > > >
> > > > > > > > On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Koskovi=
ch wrote:
> > > > > > > > > On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovi=
ch <akoskovich@pm.me> wrote:
> > > > > > > > >
> > > > > > > > > > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshko=
v <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander K=
oskovich wrote:
> > > > > > > > > > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan M=
arek <jonathan@marek.ca> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonat=
han Marek wrote:
> > > > > > > > > > > > > ...
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> That's not how it works. INTF (which feeds DSI=
) is after DSC compression.
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> INTF timings are always in RGB888 (24-bit) uni=
ts. Ignoring widebus details,
> > > > > > > > > > > > > >> the INTF timing should match what is programme=
d on the DSI side (hdisplay,
> > > > > > > > > > > > > >> which is calculated as bytes per line / 3).
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > >> (fwiw, the current "timing->width =3D ..." cal=
culation here blames to me, but
> > > > > > > > > > > > > >> what I wrote originally was just "timing->widt=
h =3D timing->width / 3" with a
> > > > > > > > > > > > > >> comment about being incomplete.)
> > > > > > > > > > > > > >>
> > > > > > > > > > > > > > Okay. After reading the docs (sorry, it took a =
while).
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > - When widebus is not enabled, the transfer is =
always 24 bit of
> > > > > > > > > > > > > >    compressed data. Thus if it is not in play, =
pclk and timing->width
> > > > > > > > > > > > > >    should be scaled by source_pixel_depth / com=
pression_ratio / 24. In
> > > > > > > > > > > > > >    case of the code it is 'drm_dsc_get_bpp_int(=
dsc) / 24'.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >    For RGB101010 / 8bpp DSC this should result =
in the PCLK being lowered
> > > > > > > > > > > > > >    by the factor of 3 (=3D 24 / (30 / 3.75))
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+)=
, the transfer takes
> > > > > > > > > > > > > >    more than 24 bits. In this case the PCLK and=
 timing->width should be
> > > > > > > > > > > > > >    scaled exactly by the DSC compression ratio,=
 which is
> > > > > > > > > > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_p=
er_component).
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So, this piece of code needs to be adjusted to =
check for the widebus
> > > > > > > > > > > > > > being enabled or not.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > The widebus adjustment on the MDP/INTF side is al=
ready in
> > > > > > > > > > > > > dpu_hw_intf_setup_timing_engine: the "data width"=
 is divided by 2 for
> > > > > > > > > > > > > 48-bit widebus instead of 24-bit. there shouldn't=
 be any other
> > > > > > > > > > > > > adjustment (downstream doesn't have any other adj=
ustment).
> > > > > > > > > > > > >
> > > > > > > > > > > > > a relevant downstream comment: "In DATABUS-WIDEN =
mode, MDP always sends
> > > > > > > > > > > > > out 48-bit compressed data per pclk and on averag=
e, DSI consumes an
> > > > > > > > > > > > > amount of compressed data equivalent to the uncom=
pressed pixel depth per
> > > > > > > > > > > > > pclk."
> > > > > > > > > > > > >
> > > > > > > > > > > > > Based on that comment, this patch is correct, and=
 the
> > > > > > > > > > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_c=
omponent)' adjustment
> > > > > > > > > > > > > only applies to DSI.
> > > > > > > > > > > >
> > > > > > > > > > > > If I keep the INTF side at /24 and change the DSI s=
ide to:
> > > > > > > > > > > >
> > > > > > > > > > > > if (wide_bus)
> > > > > > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdispla=
y * drm_dsc_get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > > > > > > > > > else
> > > > > > > > > > > >         new_hdisplay =3D DIV_ROUND_UP(mode->hdispla=
y * drm_dsc_get_bpp_int(dsc), 24);
> > > > > > > > > > >
> > > > > > > > > > > Please check the actual fps (I'm usually using a vbla=
nk-synced GL, e.g.
> > > > > > > > > > > kmscube).
> > > > > > > > > > >
> > > > > > > > > > > At least this matches my expectations.
> > > > > > > > > >
> > > > > > > > > > Hmmm with kmscube I am getting 120FPS with 24 and 100FP=
S with 30. So I guess that's a no go
> > > > > > > > >
> > > > > > > > > Although it was using dsc->bits_per_component * 3 regardl=
ess before for
> > > > > > > > > dsi_adjust_pclk_for_compression so I guess that's what Jo=
nathan was
> > > > > > > > > referring to earlier...
> > > > > > > >
> > > > > > > > Do you have any of the patches by Marijn or Pengyu?
> > > > > > > >
> > > > > > > > - https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-re=
gresses-again-v1-1-6a422141eeea@somainline.org/
> > > > > > > >
> > > > > > > > - https://lore.kernel.org/linux-arm-msm/20260307111250.1057=
72-1-mitltlatltl@gmail.com/
> > > > > > >
> > > > > > > Nope, I can test with them though if you'd like
> > > > > >
> > > > > > Tested the following 3 patches on top of this series:
> > > > > > drm/msm/dsi: fix hdisplay calculation when programming dsi regi=
sters
> > > > > > drm/msm/dsi: fix bits_per_pclk
> > > > > > drm/msm/dsi: fix hdisplay calculation for CMD mode panel
> > > > > >
> > > > > > Getting constant FIFO errors with them applied:
> > > > > > [   64.851635] dsi_err_worker: status=3D4
> > > > > > [   64.851692] dsi_err_worker: status=3D4
> > > > > > [   64.851730] dsi_err_worker: status=3D4
> > > > > > [   64.851766] dsi_err_worker: status=3D4
> > > > > > [   64.851802] dsi_err_worker: status=3D4
> > > > > > [   64.851837] dsi_err_worker: status=3D4
> > > > > > [   64.851903] dsi_err_worker: status=3D4
> > > > > > [   64.851940] dsi_err_worker: status=3D4
> > > > > > [   64.851976] dsi_err_worker: status=3D4
> > > > > > [   64.852011] dsi_err_worker: status=3D4
> > > > >
> > > > > Personally, I use
> > > > > timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_get_bpp_in=
t(dsc),
> > > > >                          dsc->bits_per_component * 3);
> > > > >
> > > > > DIV_ROUND_UP is magic for me. If not, I got status=3D4 too.
> > > > >
> > > > > This works for 8-bit dst bpc with 10-bit src bpc.
> > > >
> > > > Did a quick test with that (plus the 3 changes listed above), still=
 getting the
> > > > FIFO errors and no display.
> > > >
> > > > Are you using RGB101010?
> > > >
> > >
> > > RGB101010(dst bpp) downstream, my panel supports RGB101010, and I can
> > > use RGB888 for it too.
> > > I am testing rgb101010.
> > > BTW, have you dumped registers? compared with downstream.
> > >
> > > I hardcode
> > > display_data_hctl =3D (0xbe << 16) | hsync_data_start_x;
> > > in dpu_hw_intf.c
> > > downstream uses 0xbe for data_width
> >
> > Can you try this series with ac47870fd ("drm/msm/dsi: fix hdisplay calc=
ulation when programming dsi registers") reverted and with the following 2 =
changes?
> >
> > https://github.com/AKoskovich/linux/commit/af24b0e2ee212153953dfee040da=
5cc077567363
> > https://github.com/AKoskovich/linux/commit/e334675c0caf47956a838e2eafda=
22fb689a967d
> >
>=20
> I don't mind testing it, but some parameters are obviously wrong for me.

Did some additional testing, reverted the change in dpu_encoder_phys_vid.c =
and
picked only "drm/msm/dsi: fix hdisplay calculation when programming dsi
registers". This results in the FIFO errors. But then when I mirror data_wi=
dth
calculation I see downstream, display then works.

Can you try with just this (ignore other change I suggested):
https://github.com/AKoskovich/linux/commit/af24b0e2ee212153953dfee040da5cc0=
77567363

That should make the display_data_hctl calculation correct so you don't nee=
d to
hardcode (I think)

>=20
> int new_hdisplay =3D DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(ds=
c),
>             dsc->bits_per_component * 3);
>=20
> This gives the correct clkrate with fixes([1]).
>=20
> fixed ac47870fd([2]) will give me the right hdisplay register value
> @0xae94024 (I compared with downstream)
>=20
> [1]: https://gitlab.freedesktop.org/drm/msm/-/commit/e4eb11b34d6c84f398d8=
f08d7cb4d6c38e739dd2
> [2]: https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltl=
atltl@gmail.com/
>=20
> BTW, I can only do 8-bit dst and 10-bit src test, 10-bit dst and
> 10-bit src gave me
>=20
> Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_mode_set: set mode:
> "1904x3040": 120 915552 1904 2180 2212 2244 3040 3066 3070 3400 0x48
>  0x0
> Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_pre_enable: id=3D0
> Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_power_on: id=3D0
> Mar 20 20:46:00 qcom kernel: msm_dsi_host_reset_phy:
> Mar 20 20:46:00 qcom kernel: msm_dsi_host_reset_phy:
> Mar 20 20:46:00 qcom kernel: dsi_calc_pclk: pclk=3D172992000, bclk=3D1081=
20000
> Mar 20 20:46:00 qcom kernel: dsi_calc_pclk: pclk=3D172992000, bclk=3D1081=
20000
> Mar 20 20:46:00 qcom kernel: dsi_link_clk_set_rate_6g: Set clk rates:
> pclk=3D172992000, byteclk=3D108120000
> Mar 20 20:46:00 qcom kernel: dsi_link_clk_set_rate_6g: Failed to set
> rate pixel clk, -22
> Mar 20 20:46:00 qcom kernel: msm_dsi_host_power_on: failed to enable
> link clocks. ret=3D-22
> Mar 20 20:46:00 qcom kernel: dsi_mgr_bridge_power_on: power on host 0
> failed, -22
> Mar 20 20:46:00 qcom kernel: msm_dsi ae94000.dsi: Power on failed: -22
> Mar 20 20:46:00 qcom kernel: bias enabled
> Mar 20 20:46:00 qcom kernel: panel-nt36536 ae94000.dsi.0: sending dcs
> data ff 20 failed: -22
> Mar 20 20:46:00 qcom kernel: panel-nt36536 ae94000.dsi.0: Failed to
> initialize panel: -22
> Mar 20 20:46:00 qcom kernel: [drm:dpu_encoder_phys_vid_enable:471] enc33 =
intf2
> Mar 20 20:46:00 qcom kernel:
> [drm:dpu_encoder_phys_vid_setup_timing_engine:292] enc33 intf2
> enabling mode:
> Mar 20 20:46:00 qcom kernel:
> [drm:dpu_encoder_phys_vid_setup_timing_engine:304] enc33 intf2
> split_role 2, halve horizontal 952 1122
> 1090 1106 0
> Mar 20 20:46:00 qcom kernel:
> [drm:dpu_encoder_phys_vid_setup_timing_engine:315] enc33 intf2
> fmt_fourcc 0x34324752
> Mar 20 20:46:00 qcom kernel:
> [drm:programmable_fetch_get_num_lines:202] enc33 intf2 prog fetch is
> not needed, large vbp+vsw
> Mar 20 20:46:00 qcom kernel:
> [drm:programmable_fetch_get_num_lines:217] enc33 intf2 v_front_porch
> 26 v_back_porch 330 vsync_pulse_wi
> dth 4
> Mar 20 20:46:00 qcom kernel:
> [drm:programmable_fetch_get_num_lines:221] enc33 intf2 wc_lines 24
> needed_vfp_lines 4294966986 actual_v
> fp_lines 0
> Mar 20 20:46:00 qcom kernel: [drm:programmable_fetch_config:261] enc33
> intf2 vfp_fetch_lines 0 vfp_fetch_start_vsync_counter 0
> Mar 20 20:46:00 qcom kernel: [drm:dpu_encoder_phys_vid_enable:507]
> enc33 intf2 update pending flush ctl 0 intf 3
> Mar 20 20:46:00 qcom kernel: [drm:dpu_encoder_phys_vid_enable:471] enc33 =
intf1
> Mar 20 20:46:00 qcom kernel:
> [drm:dpu_encoder_phys_vid_setup_timing_engine:292] enc33 intf1
> enabling mode:
> Mar 20 20:46:00 qcom kernel:
> [drm:dpu_encoder_phys_vid_setup_timing_engine:304] enc33 intf1
> split_role 1, halve horizontal 952 1122
> 1090 1106 0
> Mar 20 20:46:00 qcom kernel:
> [drm:dpu_encoder_phys_vid_setup_timing_engine:315] enc33 intf1
> fmt_fourcc 0x34324752
>=20
>=20
> Best wishes,
> Pengyu
>=20
> >
> > >
> > > Best wishes,
> > > Pengyu
> > > > >
> > > > > Best wishes,
> > > > > Pengyu
> > > > >
> > > >
> > > > Thanks,
> > > > Alex
> > >
> > >
>=20
> 

