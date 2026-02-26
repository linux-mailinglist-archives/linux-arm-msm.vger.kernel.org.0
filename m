Return-Path: <linux-arm-msm+bounces-94275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAppKg4koGkDfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:44:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 330741A4774
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE761300F5F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525403A6409;
	Thu, 26 Feb 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jn5LswYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B72522A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102660; cv=pass; b=WeXwlo5icPYXI8PXK2s6a4ndjH3RIV6WSBMbZAFFFTUnzcoNgjAQtYEwMEFdwrVTiZOov5OKLnXjUUnor3kSMkZsoL7hnspq/LAQHRJ3qiZv8s1/ggK4gbtBYI13AjeuxKb5igzJXgDSNgNPrjFsEMcjbqCR1SOJhJPeiR2q1+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102660; c=relaxed/simple;
	bh=3Ek7ZWKgLpFhHdL6kAq6xhGbaGNzo41GNvmmzaf9cmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+Vc8XMEA4Xvu6fzaoCFWrwI79nler4m8JHa54qAqxMTi2W9kwT30OrRqmFzi1i61lfVDtu0vPAXu42D20BkRzI5Fb1aWGX8CHl4IYRJZwZeNOOALix/x6Bl1CUZnKF8MQF4Gn6dkfIjVe3kyTeAU/lKlo1sc4DXbXW/ze6p2WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jn5LswYe; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so461054241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772102658; cv=none;
        d=google.com; s=arc-20240605;
        b=QRiy4U1QcMItd+UuFaSm+pyTiWRC/WCKaAx21fy6MNArySF8DDZrDIQAA/Nv5JbFZd
         xJlIplKhSFSYpFgK9oDsyftF8y6uQbDHusYsx0TPMMc9/Iw0oqH3zx2N2V+1TI7OQeY9
         3wpqwpLOoKMcnO92lw8kAA7H8womDj3HrmWXCIe+qhrJR06faBYx+JYevzT9LUTEtOXA
         iou8ww5f9D54qIAHC5bwpeXqdwc0hkRX+Zv3FCx9g8QRAyFtQJMc1z78ptooWzkCSd0P
         /0r2+dBKJ5ozHgw2cjECb3EStdo17b/LEXWLCqkyI9KL7otthrfve2663BNm5iY6UM+n
         UxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cD12pgEfdQ5/Nd9GA+nMEM8ckUbIwEu5Vfttv9M4WJg=;
        fh=M+pmnsyAso8dsTcDjU/ldb5Ht0qt9nqMuBj57QkJd5w=;
        b=RyrzcKB99c+ex8ad/ODuEgiBFZH2liu1/mUZUgjfAlCl58L6Jds8A4BpS5vpocEFVl
         C8WPL4i1FkLopFQdg6MqZk2OJbIx3/Gd4W2zzYIMIJq4LLCjyegLCmIE3ktqI9k0Ad+0
         RzZETlSdl3TEJLjOM8XFf/X+LQuTI/BhQvilDZs/bmjXS9hPHnmr6H5JixS0Cv9tjDQ7
         3LSD7Kd4Ersm1JW1JsiU6RpXSIchV8ugX/ncztO0iPZqXOnqe4FKFF0ZLy749Uf3BRYN
         fXMERgOyHSFoaxpc9jx0Zgh1vTdD1Rd9dm7D/T/WRcTrxYxljIDVkANtrcZTs7StnlvU
         ALQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772102658; x=1772707458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD12pgEfdQ5/Nd9GA+nMEM8ckUbIwEu5Vfttv9M4WJg=;
        b=jn5LswYejxMb75SoyOtWf8VluBupAqUkJZljzwLm0kz+5uaBeN63c1VsnRjl/np+wM
         7GCc74IVgUbNBppj8pwyz7QHEHoL/DP4QDIy0mQefny9Sx9j9Y6TGEJ4IaW4fUOtP1yV
         p6HqWRAhNQuEmX7CZtZWSjwS7yo7BEVj8HRf+afjDyTRVxd6EMaiUdm7fqhX4MpCK9oO
         dCnuOWG0XSXTFgYrxkGE8c7QMBY28DiSZESuvwCFzHad5oMgT3Z9hNHHfKD+DZAFh12J
         MsPqbQ8P7c8rau4tijNApqf73p8T2mTmKIJnjzVpuQouWOGtkeEHsP77oQAVhO8If0l1
         uKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772102658; x=1772707458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cD12pgEfdQ5/Nd9GA+nMEM8ckUbIwEu5Vfttv9M4WJg=;
        b=Wq/3xqkYdK6bIYEunGBl6rCVhJSasfXtFhkHeqSmMGm1zysbJ12XEZbNw3NPyigL6m
         3VzDIEJv1e7R2zvbwM+hUy0eBz0a3n7G/saU0LCMZ9cmhIbTFDiyt3NEKcSqwArAGtHA
         MgAyO+ZEIhhNqKldFOAiwCoIpDP47GogPuzMFxBp2//lwfwd5lJdbPF6atZ7qBGYKfZl
         dJM4DvB8JR7RtMhmJ0SI1OzVYC8zmHUAuGxpJx/xiIID1xnj0NQTJO/mz/O1ZqTzHpyU
         wdLxCPHpfZXh2zfhIHFtQbCMresHadsTttOmRkpYk9B9T4IINyfiWfN43ay5otmO3hm3
         ymng==
X-Forwarded-Encrypted: i=1; AJvYcCW9WVdgsI2dtUmDsmgVpWwt2sFxWu3nFGYzpLVnM3bpNHdMF6qnZUaAd5i58cbYvgqklyPMPnNpEb9nlsfc@vger.kernel.org
X-Gm-Message-State: AOJu0YxMM1H0nbNd3rQH9OdxeBHwwBABIfankaryIyK8+HaqJLmIauAb
	ZfPait+mdf8fjypU9Do0hepVA1EIDYJPBmCg41GSpYCTdv9ETJ//pGTzqubZO+chvit747w+7ls
	/EUYs3ScMWGLhZLyURmvz08m5zsqBDnqbKcmcN9ZXbQ==
X-Gm-Gg: ATEYQzz9XbvjG17m400FsOXYxyDDpoTdsfIJK2iHMWhYtjv+KvCY2BuAKJaztnAqx4C
	de7jQWh869nJiRx1/ADq6LzAyVd/7oAFlrsICVLOrzAvIf+BUoIl+/3GDbt7YLmSm8SdW4kqnzO
	vR5dETbuz6BteB5iMbScIiw/74CltJbMyuElJBI5PJekmKRtQS5Td1Mq+DShvShuwskMgyM06F6
	4CbBoZWE5oLWaeEqhqJe/IsS9j3t68qINWrV3yXSmSlIfQ0xrkLR03oPkm1RPLLYSlKwzr0Mm7p
	/DZRJSs=
X-Received: by 2002:a05:6102:418d:b0:5f5:5c2e:59ba with SMTP id
 ada2fe7eead31-5ff140ed02cmr2205194137.33.1772102658094; Thu, 26 Feb 2026
 02:44:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225054525.6803-1-mitltlatltl@gmail.com> <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll> <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
In-Reply-To: <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 26 Feb 2026 18:44:02 +0800
X-Gm-Features: AaiRm53sGdce1eJ6hV-SAxn-qLkKqnA_zFO2EDrbOzCBgEEtUkG39zInYjqgp78
Message-ID: <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94275-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 330741A4774
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 7:02=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> >> Document DSI PHY on SC8280XP Platform.
> >>
> >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm=
.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> >> index 9a9a6c4ab..9223af1f4 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> >> @@ -23,6 +23,7 @@ properties:
> >>                - qcom,sa8775p-dsi-phy-5nm
> >>                - qcom,sar2130p-dsi-phy-5nm
> >>                - qcom,sc7280-dsi-phy-7nm
> >> +              - qcom,sc8280xp-dsi-phy-5nm
> >
> > Your other commit claims it is compatible with sa8775p, just like some
> > other devices here.
>
> If that helps, they do have the same values for the REVISION_ID registers
>

Thanks for confirming this,I will add this to the commit message and
fallback to sa8775 then.

I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?
I notice
            REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
SM8250:     0x00000014                               4.1
SM8650:     0x00000025                               5.2
SC8280XP:   0x00000024                               4.2
SM8750:     0x00000027                               7.0(*)

(*) SM8750 is 7.2 in the downstream.

Best wishes,
Pengyu

