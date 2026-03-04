Return-Path: <linux-arm-msm+bounces-95360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOcyIDVNqGmvsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:18:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CE202745
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E450F3274123
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA2E329C74;
	Wed,  4 Mar 2026 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3ffOugd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8679D32720D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636935; cv=pass; b=bZAt99CSqElFpQ34oNSJ28i1A1J+j93s8lpXiIE/IapuWmByaGB2E9/86uHrpXz9YqLGoGPJEApKZ5m7u6jQT1fOqQ9M/pBK2gnJWoAs9zUGK4O3N8fX3UFp8Zu8fQ/3DzvjeYpKmIKdTpAFrA0ezFwW4439gPs6PValzeUynGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636935; c=relaxed/simple;
	bh=YhlXiU0XKCWPaqDUqf4rhyXjvfvZOfuj3Ya2JfRbtgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6WSGNQ0SHib+NiL7nYFfvUQPouAO2GLsOzAODpAaJYuBaJNYf2frRiDC5w0BHC1m0HJoM1jlhVHn2UvPl7+d6HiNI/dGrSHtD2qWqkdzwqnQtu91oUqXrF4Yi6A1TuI0Hib3voHv7iOrNKBMlmCmDvf7X21r5sxBFBXjga2uuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3ffOugd; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff9d047981so1019022137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:08:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636931; cv=none;
        d=google.com; s=arc-20240605;
        b=f0HQESNCb2BrNpJe3EQ2pKD8aRsEu2dPHaz9jApC5Rfu8JnoSObCl36K0AjJ9BiNYH
         6VzcDpwwM1fwZVcVbJEVKjQOFJLZUWmV6MX9Q19Ma63KsCbNvtQ+iM89z9zuAsE4JanX
         mXdiiMJ0onANMmi6AfABfoCKGYIcTEsHMmDD2ulqNi8PPB+CkCd0vRuiB7Vsg3GSAk8K
         cM0TCHCbmnsUFbknq8Qrh0Id2/kIBx2/66ylSNr0L4AZnJtjEQJMRg6uHKaictBMfsfL
         8vUX8LXiffNfvOnjoGn69JdCD049G6JMQRQfy3vqxmSZXmCmbQwNVcmk7xT7g9ft5pzN
         ZkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zt95rYDrbJQ7v21KKoOXmX6dHYnzklnNjTFqH4raDgw=;
        fh=F+VpWEceZRTuBU5JdavpgA+PvqOwneuo+aJefo/92dA=;
        b=XGTeMkxnO+OEBFgyfFXndj0YHyfPIcuDrpN13ceDt7iIp/uRKvNSHxMC27tkk2oqZV
         tZjmtE1XVhzj3dOEkhXPyRCKuK0/M+AXNmHErk6hOR+L9pAJyVxwgU2U4G7L78/mAgAz
         P12lE3Pwt06HCwzGdAabN8KXKOGFOUlqSuLhKHiFEovDWd8fiZDFrlB3eYgEYWQ1Nijk
         /rm2M1k0N3TurrSqM9CwbFV6Y/RLpyvW2l+ik/5uZI5v0xyx6SoTgdyZcgAXssg6PCLZ
         wRzjJRChzQ7kIUgFvyHryDFgmfVEa2M/UULpMoCYEo8cefwPKrwqjR8yj60JhDZkW+dl
         CKsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636931; x=1773241731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zt95rYDrbJQ7v21KKoOXmX6dHYnzklnNjTFqH4raDgw=;
        b=K3ffOugdaLQFkS1vn+ekot/3RyzoeBOXHBSNNKzQ+DLP3A7Gk+2gByxVMkTBGGgbdU
         jSMvWlZr8rVQI0nsie9QXkovuJ+Tj08whQp4nXoiUiC37dGNFwIuCG3LbfUIZHgw3LaP
         df6kfbDFeRPeC8HwPVEjNE6YCRhBPVDkaKQljea4u3WUY0EHUvNT1gW2Gse4XSb+FC6g
         W7zAi1tuIoz2rQFxlzfSEzShi8q/06/ZhkoDTIaW+6V4/nYvExX8XXlpUDbsqQGcbqzx
         SHJ68mE4wu4ZcQsDRdpZiLMusGpbQ6K8XrU46wRMPHRBiKqe+NSE1+gxybeKqlwpeCrn
         51KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636931; x=1773241731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zt95rYDrbJQ7v21KKoOXmX6dHYnzklnNjTFqH4raDgw=;
        b=dngwayGIC4TmY2CIp+0+tbO57g8vUukp39mDSa2Cxt4/lVW5ZOmSP2A9oLJJROj8ae
         SoxucSPWpPRShCBhJqJaUO3dDSP8d4V7OQLSPSbsRyqSNFMJUvI3ZbK3n4Egl3Vzylb8
         WspJkRngBVy48+Vf7aWKljyjFZ5sl5oxRf7DV48nvBI3UEcz3i76Lix5Q0OSxyQW1v2z
         8bBxaQ9iPFdsXwLMesYR+wAkjimeuFAKDE1dT/HnbI6dFUoS7T+dcZZjIu3CK8najoMa
         8AnBJiMdhA0XAsAOl/a65CYNaiT15oRw1i58bo2q6E8Sc1iVG27h/+JqHGWGEV1cce6Y
         q03g==
X-Forwarded-Encrypted: i=1; AJvYcCXfxHEJ97AboUVtkRfntrAq75Z5Y8h5TQcbIB4zztiEMSomZ0DtdFGJvNtKowWsK8HmaiyWvvEbn91SpV3l@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQDnfOk9liFJp8Og4q4Y8lR9P/1QThSzY/gGukNVp1I9c55tQ
	IgZ6bS0GqlgNskI2jiDwynNcZ1vlWD68S7rKL4WdvNj0HUEe4PDbZxe/j/6sJ07RpEaPolTG2or
	sD97vi+k+48xenART426lGg9uRXyJ5GA=
X-Gm-Gg: ATEYQzwfz7ikxUc4xYuh2lXg5UDi/++wpca/FHc5TZeW1ZPxGW0I8drjcda5cwZvdAn
	G+CzZ35NCx9NjHAAhz+hgw0nZmvJKe+L4/22F0ZnFLpWML/mmLTRNicCIyGWY/PNqUqavO3Md0W
	4URNsi85OYMv/aY3UruKrwTk1uBb17zdWIQ3pmBauXmHsMxeyfS36nSiXE33ABoqfoZcx/IZ0KI
	bFoP70kYpO977txGm6E6oczSFsrLvpUun3Bx8gcFwcnM4dqH8WDYpK+ywRIGvhlYqptlNpv1s72
	wWJdY20=
X-Received: by 2002:a05:6102:3ed5:b0:5ef:a416:be63 with SMTP id
 ada2fe7eead31-5ff8fc64c78mr3126757137.22.1772636931320; Wed, 04 Mar 2026
 07:08:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303115550.9279-1-mitltlatltl@gmail.com> <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
In-Reply-To: <aahGtIkxtNPeeWKc@redhat.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 4 Mar 2026 23:08:30 +0800
X-Gm-Features: AaiRm53efplzSDOab61tQud_P7APn9ZaH_aClYCYiHE6tyUSiXw8N58pgNHrRTk
Message-ID: <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Brian Masney <bmasney@redhat.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2D0CE202745
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95360-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 10:50=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Pengyu and Konrad,
>
> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> > On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > > From: White Lewis <liu224806@gmail.com>
> > >
> > > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_c=
lk_src)
> > > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate()=
 on
> > > byte_intf_clk, the rate-change propagates through the divider up to t=
he
> > > parent PLL (byte_clk_src), halving the byte clock rate.
> > >
> > > A simiar issue had been also encountered on SM8750.
> > > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_=
PARENT on byte intf parent").
> > >
> > > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clock=
s
> > > so that clk_set_rate() on the divider adjusts only the divider ratio,
> > > leaving the parent PLL untouched.
> > >
> > > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controlle=
r")
> > > Signed-off-by: White Lewis <liu224806@gmail.com>
> > > [pengyu: reword]
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> >
> > Looks like more platforms have this issue.. thanks for fixing this
>
> I hope within the next week to post a new draft of my patch series to
> keep certain clk rates intact when sibling and parent rate changes occur
> [1]. This will be for certain critical clks, such as the ones used for
> DRM and sound. I have it working with kunit, and just need to clean up
> some of my new clk helpers and commit messages before I post a v5.
>
> I'd like to test this on some real hardware and I have the Thinkpad x13s
> with the sc8280xp SoC. Can this issue be reproduced on this hardware? If
> so, can you provide me detailed instructions about how to trigger this
> scenario?
>

Quick answer, no, x13s uses a edp panel, not dsi. This issue is
related to dsi clks.

Best wishes,
Pengyu

> [1] Latest public posting v4 from September
>     https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb=
3d3cba@redhat.com/
>
> Thanks,
>
> Brian
>

