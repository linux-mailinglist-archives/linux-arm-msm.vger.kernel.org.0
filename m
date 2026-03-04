Return-Path: <linux-arm-msm+bounces-95427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBVPAed2qGnxugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:16:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57D20611E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 19:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5337305DDEA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 18:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918823E5EDB;
	Wed,  4 Mar 2026 18:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeJii/8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389A3E5EC1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647484; cv=pass; b=CVo0zVFta/Ph1NntHjxbocfpHmiS50xOeJG/xY0CHnE06IulmOoM/uiSCjdiG8Hte6QwxhoTwrJGny8n4u9oqlDWTINX3Lcu1bprklW1Wqv+LagCMCu2zaAozq7yshvGGu6mvqqOthqGPC6RAkGOrUAno8syriZ8xDk3UB/tKX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647484; c=relaxed/simple;
	bh=oN5NGIJInR5QcBWc5Qvk+T8OoVWKRMzL5TYgJ3nAL1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMPnHwggaj3E2HB5VLaeO6C2bq/r43dwJCESzCOhXnzxmLtUtt/hWtMlt0ehAuh5T08mSgtv1z5TKboFjGLQtZP3QnE/QK9touKYxzDx4eOZ3Io1k6EaSRhfLjfN4rKWi6fvMTTM9w32AoA0AtlbImNAJ8pQPDyGa/zyrB4qtqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeJii/8C; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b6b0500e06so8810171eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 10:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772647482; cv=none;
        d=google.com; s=arc-20240605;
        b=gJkyfqS9eaG6I+3B0VVTCJJ+uT7AEg1loILYVxHFg1lO43DIinQRvf0S6sORmoZKVm
         +Zch43u6Rmu16xwjX5IJeuZ+yWyBdBDsHq6GOeiAOzWdPiFdVDbhHpNTMkAH4Zb3vrih
         AP0y89y9nhmNqoqzzFOooYqw0H/NT8uru68DbQA6Ul967oQccP3KhXzK7q3upovTR59w
         Vkk0MrXd1kYkDxvix6PotR7M4WbfK2LeOqf2g4SJvCtSCF8MHVm8qrG8oS4UgP5fY7UM
         Ma/nNJeZy9yLpiCaksdCjqAnWjMGuUr1ZnE/Xv1ButvXoCCHHRReXp3swOVZnb49lJAV
         xKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YUW1z33hdtfbSwh+C6wGyvDQ7mFLxb1NGbmJMsFO238=;
        fh=MB/QbiBsFY22SKHtv4OOXD/zcT/TaX/MbmjsgUQdz9s=;
        b=dA1vz5rXp7PP5nA/Kxdxb75nXH2VYKw6dtVWY19VG+gYb8UVQ1669e0SNhUpyWo6pa
         LxsBzgIkKDobgAInXSSAgmwsO5243v3kb8TvKo/CwXb6d22PU77bBxdEddJ7lnfyUcXr
         8q7mfbrvJd4nM0Od1l0cuk/YrQIyE6/PBexl+y/5HxuPoaY/whuMZqPQJN/QAVeVkvs3
         y6AYln4t9KI5fuwk9knVbTQs57NWZbgw8or+JIG5MmDMwl56K6pBDe/JX+9Atuv/r4Z3
         GtnHspQbLGvWoO+9whFt3UJ72/us4uC3gC/fefBb1c768pX2hRpttQ35K2Zao1FQeh7p
         jrVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647482; x=1773252282; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YUW1z33hdtfbSwh+C6wGyvDQ7mFLxb1NGbmJMsFO238=;
        b=PeJii/8CDfMFfJISVAUt+ngDBTYSbEhcSyQ3YUdN0bkjURCFOLLz1hI4MPf+NkVtzC
         ESGGCcB17sv4RgLkwdh0hfYu8JrcaMxf8ouA5fEJgOaG3V4pENbBBFB1+CGn5EZDH8ae
         Y4nlx1DZ2o7vZ2BhrM50Jk0iMiVe0MzDycdIGc5amBC4fwoB5DOxipJk7RskpT1V2TdI
         6oddftBC1yQycQsQ2I1iC7HFTQozYmOM2/Xk38bN9aIJ1YDEqikCddUteiqweALd1Qhk
         KslxDAaoFMnPoBIiDxwB6njZXMGBwCajYfD7EKwQE1aZr7fJV+n0E6clGF+7gHwzzW3W
         3jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647482; x=1773252282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUW1z33hdtfbSwh+C6wGyvDQ7mFLxb1NGbmJMsFO238=;
        b=KHzg5BIFt2D4gazyGHa1W4XRSuyRYfDF3oi5ZfKkWc4znLfPcv7KN2t+N9NKk/2+Zs
         4h/OkbEvmM/JATmISDBPMV4Cd1BOd8xhxI13t8e3D9HhCLzTV4/9qfVL8HM0InDQLhy5
         6N4vrrd9IPoaihIFS1KIgwC3ax42eDCGFZfU5/Ysm/VeHfcO0gB1z3W76Irfs4D14MEc
         QIYOvb6cS7ZkfDotPxS2MWzNJIKvZzY8c3E1v/yY6nJeSa+5QS8ryt7y21QO4BQCmEHQ
         oKMPzDfVoNN0JcwNI41MBNnhqF8FnUjgdV6TyJeY62GE9Z4jz+OWPVemjhhhh7CKqYrz
         jjbg==
X-Forwarded-Encrypted: i=1; AJvYcCXgjVtzz/lkmaSqd/9Vcxw5RaQfoRJApMggza3CDAUOyextlBSrXDZQTh+6LQCCB/BBj46dK6onrRuZwGyR@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsUed84nH5lLrkI6OxxvPIPa24rwh5OKamM7dPicSt6WyPBMM
	zyavTUsmbD3V3qL7s6hqpdQRXpu+D1S9TzjOeKbsA0FCUlkXddWzcUn4YCzheU7XkkQXa4gwEux
	+AgCd06VjbQmB3ZKqysCDs6d34TF9DpI=
X-Gm-Gg: ATEYQzwvXvaF3uiYmXqL4iGvtlSwRE44byKV6Iah/EA2Xpv1cREmQAzR8mjY9yDjBO0
	eAQwAOymHiz53uyhybMIl7N7hyZKnMQXTb3dl3GLyq3cVS7/bLFjvq5Km/OcN3G/esKLoyNnalC
	MZ2kYTtt8rm4q50HhrWEHzQIggrMuhh6nYPRDweF9LJUGLtNyz/GBdIYKm1Ff2UcTx/o4aeKvMs
	V0t7Ke8MzqmzCfZd0DpoQVnr36dwtBkyyI9nou3VXF6lInbST9RZmrEcLlIHonQviFPFJkDqZnp
	xcY6pFc=
X-Received: by 2002:a05:7300:570f:b0:2bd:c883:5f97 with SMTP id
 5a478bee46e88-2be30f941b0mr1107602eec.4.1772647482477; Wed, 04 Mar 2026
 10:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com> <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
In-Reply-To: <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 4 Mar 2026 20:04:30 +0200
X-Gm-Features: AaiRm53L310AKJxACRT6XTM36Tn3jEqmfP1MmjLiZ-2-W9tuhbMJrDR64WApO84
Message-ID: <CAHuF_Zpa+cr6aq89kCon1dC3Q0PEV17VfyAbqF0Ojgmgn32yTQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9D57D20611E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95427-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email,0.0.0.0:email]
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 04:46, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
<snip>
> > +
> > +&mdss_dsi0 {
> > +     vdda-supply = <&vreg_l18a>;
> > +
> > +     pinctrl-0 = <&mdss_default>;
> > +     pinctrl-1 = <&mdss_sleep>;
> > +     pinctrl-names = "default", "sleep";
> > +
> > +     status = "okay";
> > +
> > +     panel@0 {
> > +             compatible = "samsung,s6e8fco";
> > +             reg = <0>;
> > +
> > +             vddio-supply = <&vreg_l9a>;
> > +             ldo-supply = <&panel_ldo_supply>;
> > +             iovcc-supply = <&panel_iovcc_supply>;
> > +             reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
> > +
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint = <&mdss_dsi0_out>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&mdss_dsi0_out {
> > +     data-lanes = <0 1 2 3>;
> > +     remote-endpoint = <&panel_in>;
> > +};
> > +
> > +
> > +&mdss_dsi0_phy {
> > +     status = "okay";
>
> Missing vdds-supply.
>
Can you expand on that? The `dsi-phy-14nm` schema doesn't have the
vdds-supply property. Do you think it needs it?
<snip>
> --
> With best wishes
> Dmitry

