Return-Path: <linux-arm-msm+bounces-91429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEPODxVPgGkF6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:15:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E81C91D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 08:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 778073003356
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 07:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826B7286881;
	Mon,  2 Feb 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9qUJOzN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C782F1F181F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016528; cv=pass; b=h3Nwa+fai093pOSQOeFfyuM2KHOwZLFlIFlmADhWAxRDq87D1UV1U77awq984c03reVuVjquCrwGOvKpHmCm79lcBgbOyDPJ34vDERIBKerwnKjUuo2fEdYeG3QiY0Tr0cf6AyfyNS0dmdfFPvrYLUPUOXwwJBUhVrSyTWT+AbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016528; c=relaxed/simple;
	bh=ztmSMRxEEhqHKEigenhjjYGV8aFdHmjSmPiuWDxrdqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GnEnWsqa74hUptqDgr/cGlrhrsgYUfCnu+STH2l6YBr3h3ou6wVFCLvSg3BYORNfMboQUn2jBkqcjii40ivl7JGg0GvhrFG209/qMgOLhP0xV8LFWsbBEG6aaeD0oyQRoImRLVz/hWZfMe173NlV2lDl5Veu6OacCErQEnIcNG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9qUJOzN; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64938fce805so3495326d50.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 23:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770016526; cv=none;
        d=google.com; s=arc-20240605;
        b=I+PqmZEXYIfMVbRP+8TKEs1bg3CjgSXPG2Ij+7e7FFq3EbcOa1ICO4V5h5Tbz6aGRW
         tCA6m0Ivmq+r385+VeTJnhcjWd2l0aUVMHsXHAoCxzaF6GG6b5MocrDJzu/BlWTVDsfq
         iIJF3+Ss/rT3JdkVrev8L9TZWfUK2xdbxGIFegYYwkkRM1rFP7Znx8PKCQ1MlhuIdaa8
         Km9ka4BXAIfEwYxLrXaclCyyPYXk6n/+x3gneWfXct0wUgVkwq0Vltob8GRlkpWB2Y9Z
         0d/5HdFcAfAn9XLb5eH/8YlHxCjOZ17ZeoMn5+gfJmrM8kUIU9rDZUhxrUP6hsKD0mwb
         WXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AOhIjuxpp6TSu7OUXd09SI4wwYt5TFMCJ2RUNnmG8u4=;
        fh=y1ENJ0n2JGLsEIdjGAK+AcF6m6QpNF+Dfnxqek228ho=;
        b=UzhzMLcROF/qyjBJCJscgdXXNmibH9O7eV52NVBGLPDexl3csUUVbV1SjYbI+Jy1Dq
         2HwYqqTD9V37RBez+M9OyrTLR2hldAiOkd0ADI+kSROl6n/Vc1I3m9rZ2Gqmik2HtFWj
         BBPVomhuvZLZN6CO50BZqnu8pZYcdIWnby6hcnydh2wvYymfCxtzLhHNTaPNcXI9uGpV
         cVG+hIJ6n4RA5/yRrKGFhwc62xnk5Pbg1igrBDdJwZumVxgCCNHY9rJ1AsYlxz36/Y3o
         JJ3QvV1j7RkK52f57E7a2SP9dxUfRreKnTkQAagGLoxN66zYQJL0PRN5Lg7IEGPmaZwU
         DaCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770016526; x=1770621326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOhIjuxpp6TSu7OUXd09SI4wwYt5TFMCJ2RUNnmG8u4=;
        b=q9qUJOzN9eWvvZcg5r+oJ+45qKyBpXOJSTOwZcfva1YIIpKCcCaZEu6QwQVu9SdebW
         SpvV3wff7rR8UP+pCdZGFk3a9wD4euLLjLHTG70Bfnd5eItNWk13+o3KQkGiuL1AomTh
         Cp0qd3wO32R74M3hZK+yVSKl88fnh1JqbnizN6sMppb99OxOHCAhhsxIFATjTHItDGd1
         TLCKXDqEVRO2Mp3skTR0mgTg1SygJ49gQLgO+7JHr2sphBC6HV0IxXbVRypS+VhvepDo
         2WdXPlCgB1vnLczO0QHg0n60j1AJHhuQz4QFBYgV4JHDFO9JDw2ZLDpmQnNGO2wruw+Q
         XSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016526; x=1770621326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AOhIjuxpp6TSu7OUXd09SI4wwYt5TFMCJ2RUNnmG8u4=;
        b=Z7fFAVElPRCn0OZrdSBWDSGS5bK063Io7VEWc1jiBT7rZLgd18p3d2hf5A7Ul3+sl2
         PpUQRXcQhazpwhNGaAQwWlZP/L4M77B4Zpn83mOMLpYw6Ixl8rk4KAaK1WslOn0iPi3n
         IkRus2Q4doTW148qSwUK95Ujpxco5LclvZVCSHZCu1JE4HAKh/hGdAaBGZGSPOFrgLF6
         ZtTtjgjG8cXRw6HLlOzvov3bu2leACjL3hRlrNzbvreBCaN0NzprWXvE2pIHIYTkLLbS
         a3ONdh9VppWh5G9hnwNH3m2z+c4TghgGJzn8//UPYll73ALfhWuzIN2zYxZGfHsA6ojj
         uTLA==
X-Forwarded-Encrypted: i=1; AJvYcCUT9OI8puraqRNhGa9vdiUOvjuVN7R4bueD4SZwkFs8cSn2h0+8+Og7nE8jhbrfmYm52Airn91/xuvU6tIo@vger.kernel.org
X-Gm-Message-State: AOJu0YxSh7PyxHyK/aI4xnBCRElxKjZogLCvI38xOeg9JS9k1RsQWMeo
	9BEraRt8BSiVOHzYSWplJeCecuM4RMc6csX6q9zI8FfN7tssr7wGPIgWJZ4LO81qhhvZANwvbwb
	xK6eDKYaCCyAamscxYhhcLXwJawfdX+u1bN3Bfw2SFQ==
X-Gm-Gg: AZuq6aJGcNnCMJivopApDojp6tvZaNbgOFRg2ymOiLw6k7L8247Nuf6z6xdMVP9q4Va
	CgzxYbw0TKG3FQFhyhLoT5neMxXdN9zHfq2iWhjSyRQZPeXGQ2CQzelCRdrVYyVLZ5QsFQoCO/Z
	c9oL8V/Gxt1dhowV5prIriuKv0ngF7B1U6ArlzHB4csTS3h3Yko4o7fISIwuReK3xSxrXpIEKII
	kfuJDRy70+5dlxi+15gyx/iMCDfX6D1MhPDp0lwH9co6jrl70WnB2xSmiflZ/Seb06uUwwU+Mev
	Ygo=
X-Received: by 2002:a05:690e:1347:b0:649:b002:2553 with SMTP id
 956f58d0204a3-649b0022aaamr6055975d50.79.1770016525726; Sun, 01 Feb 2026
 23:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com> <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com> <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com> <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
In-Reply-To: <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 2 Feb 2026 15:15:14 +0800
X-Gm-Features: AZwV_QgxNMYnRxQupdZOrh2Yv4jbFQ5rsdru-fR7eVF3kXxCsbW0Ix_tK3sAtyQ
Message-ID: <CABymUCOmq_FVOQRVQSz97wjF_gtdji4dXz0CucChvFyqmyw06w@mail.gmail.com>
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC check
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91429-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: C6E81C91D6
X-Rspamd-Action: no action

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
1=E6=9C=8827=E6=97=A5=E5=91=A8=E4=BA=8C 03:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=
=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 20:31=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=
=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:49=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2=
026=E5=B9=B41=E6=9C=8826=E6=97=A5=E5=91=A8=E4=B8=80 18:13=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > >>
> > > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=
=8E2026=E5=B9=B41=E6=9C=8822=E6=97=A5=E5=91=A8=E5=9B=9B 18:22=E5=86=99=E9=
=81=93=EF=BC=9A
> > > > > >>>>
> > > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=
=8E2026=E5=B9=B41=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 17:30=E5=86=99=E9=
=81=93=EF=BC=9A
> > > > > >>>>>>
> > > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > > >>>>>>> Currently, plane splitting and SSPP allocation occur duri=
ng the plane
> > > > > >>>>>>> check phase. Defer these operations until dpu_assign_plan=
e_resources()
> > > > > >>>>>>> is called from the CRTC side to ensure the topology infor=
mation from
> > > > > >>>>>>> the CRTC check is available.
> > > > > >>>>>>
> > > > > >>>>>> Why is it important? What is broken otherwise?
> > > > > >>>>>
> > > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > > >>>>>
> > > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > > >>>>> engine starts without a valid memory address, which trigger=
s
> > > > > >>>>> an IOMMU warning.
> > > > > >>>>
> > > > > >>>> What is plane splitting? Write commit message for somebody w=
ho doesn't
> > > > > >>>> exactly know what is going on.
> > > > > >>>
> > > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > > >>
> > > > > >> Sadly enough the text below is not a significant improvement.
> > > > > >>
> > > > > >>>
> > > > > >>> Currently, splitting plane into SSPP rectangles the allocatio=
n occur
> > > > > >>> during the plane check phase, so that a plane can be supporte=
d by
> > > > > >>> multiple hardware pipe.
> > > > > >>
> > > > > >> What does this mean? Without virtual planes in place, there ar=
e no
> > > > > >> multiple hardware pipes.
> > > > > >>
> > > > > >>> While pipe topology is decided in CRTC check.
> > > > > >>
> > > > > >> ?? What does it mean here?
> > > > > >>
> > > > > >>> By default, the plane check occurs before the CRTC check in D=
RM
> > > > > >>> framework. Without topology information from the CRTC, plane =
splitting
> > > > > >>> cannot be properly executed.
> > > > > >>
> > > > > >> What does 'properly' mean here? How is it executed? What happe=
ns?
> > > > > >>
> > > > > >>> Consequently, the SSPP engine starts
> > > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > > >>
> > > > > >> IOMMU faults. There are no "warnings".
> > > > > >>
> > > > > >>>
> > > > > >>> Defer above plane operations until dpu_assign_plane_resources=
()
> > > > > >>> is called from the CRTC side to ensure the topology informati=
on from
> > > > > >>> the CRTC check is available.
> > > > > >>
> > > > > >>
> > > > > > Thanks for the patience!
> > > > > >
> > > > > >
> > > > > > Currently, splitting plane into SSPP rectangles and allocation =
occur
> > > > > > during the plane check phase. When virtual plane is enabled to =
support
> > > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, s=
o that
> > > > > > a plane can be supported by 4 hardware pipes. And pipe number i=
s
> > > > >
> > > > > number of pipes
> > > > >
> > > > > > decided in CRTC check per interface number, resolution and hard=
ware
> > > > > > feature.
> > > > >
> > > > > Okay, but IOMMU errors were reported with virtual planes being di=
sabled.
> > > > > So how is it relevant?
> > > >
> > > > After revise of splitting plane into pipes, the number of pipes wil=
l be decided
> > > > by CRTC check for both virtual plane and non-virtual plane case to =
unify the
> > > > plane handling,  instead of assumption of 2 pipes at most.
> > >
> > > This needs to be explicitly written.
> > >
> > > > >
> > > > > >
> > > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > > framework. Without topology information from the CRTC, plane sp=
litting
> > > > >
> > > > > WHat is plane splitting?
> > > >
> > > > How about: s/plane splitting/splitting plane into pipes ?
> > >
> > > This plane is not being split into anything. It's being mapped onto h=
w
> > > pipes. But before that, the number of necessary hw pipes is being det=
ermined
> > > based on foo, bar an baz,
> >
> > Thanks for the correction!
> >
> > Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> > allocation occur during the plane check phase. When virtual plane is
> > enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> > be needed, so that a plane can be supported by 4 hardware pipes.
> >
> > After revise of quad-pipe, the number of pipes is decided in CRTC
> > check per number of interfaces, resolution, clock rate constrain,
>
> Where?

The pipe is decided in dpu_crtc_get_topology(). Change to quad-pipe
 is made in later patch. So I drop this in this patch message below.
>
> > hardware feature and virtual plane enablement. The decidsion of
>
> decision
>
> > number of pipes will happen in CRTC check for both virtual plane and
> > non-virtual plane case to unify the plane handling. Before that, the
>
> will? Do you mean, after this patch? If so, please use imperative
> language. See Documentation/process/submitting-patches.rst

Yes, it is in later patch. So drop it in this patch message.

It is possible to keep plane check unchanged, and rely on re-allocation
in later stage to support quad-pipe, if quad-pipe use case is detected.
But to unify the allocation logic for both non-virtual and virtual plane
use cases, and to centralize resource management, we'd better defer
the allocation.


>
> > the number of necessary hw pipes is being determined based on
> > resolution and clock rate constrain.
> >
> > By default, the plane check occurs before the CRTC check in DRM
> > framework. Without topology information from the CRTC, plane mapping
> > will be skipped for the first time as number of pipe is 0.
> > Consequently, the SSPP engine starts without a valid memory address,
> > which triggers IOMMU fault.
> >
> > Defer above plane related operations until dpu_assign_plane_resources()
> > is called from the CRTC side to ensure the topology information from
> > the CRTC check is available.
> >
> > >
> > > >
> > > > >
> > > > > > will be skipped for the first time as pipe number is 0. Consequ=
ently,
> > > > > > the SSPP engine starts without a valid memory address, which tr=
iggers
> > > > > > IOMMU fault.
> > > > > >
> > > > > > Defer above plane related operations until dpu_assign_plane_res=
ources()
> > > > > > is called from the CRTC side to ensure the topology information=
 from
> > > > > > the CRTC check is available.
>
How about this commit message? It is more coherent with the change
in this patch.


Currently, a plane maps to at most two hardware pipes, and SSPP
allocation occurs during the plane check phase. However, when virtual
planes are enabled, SSPP re-allocation can occur within
dpu_assign_plane_resources() during the CRTC check.

To support future quad-pipe topologies, which require allocating two
SSPPs with four rectangles by default, it is more efficient to perform
the primary allocation in a single pass rather than relying on later
re-allocations. So defer the allocation to CRTC check phase by default.
Allocation logic for both non-virtual and virtual plane use cases is
unified in this way.

> --
> With best wishes
> Dmitry

