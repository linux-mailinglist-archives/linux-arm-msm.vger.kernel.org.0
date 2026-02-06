Return-Path: <linux-arm-msm+bounces-91996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC7pJq22hWmOFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:38:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4DFC229
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C67D0308F9C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E022634F24B;
	Fri,  6 Feb 2026 09:35:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E07F3314DC
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370516; cv=none; b=AoMdTEqG/4BV/bakMDQeGBAfQGPoS+cvflYwGvGRTUwh+ssBjQmjQF2d3GKXtfsFXbkeNWzaofDlcwXCnbRMHe+035CuFxghDRVy1AiRpRKFz5utBKPqSko59tGhxT77OovAaNS5evX2LkQKuk96R7pj3fGOG/ar1z6t2JzNTGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370516; c=relaxed/simple;
	bh=pIk8ctLXvGGQoexJ39+u+i88l55lBO5MXhp+wDnNMsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovlO28J9bK+I33v7qi+QkcVR0e+OwLiUTz82xvClGN1fSfmY3A/REpRCryX+CTrCK0Ggmij09DLZxIDs3qxIjQVZhwxlI+y7tmrwMImoC+9r8cNTLf7GZMvKcjd4vtpRawPnSlS5+eHAbIwg/0uAIC9FS8MPi3RuvStX2d6gA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-795055a17a3so20626917b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370515; x=1770975315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97h4eVOHCmmh09MnKxer+8uCDsA8AM3Tmyg3WdIsF/E=;
        b=nb94tWW7AR1vvhtHKZ1/TvZLOZmRea/1bROu5FHJVpigYy6Rkk37nzX8VRhnKddxKx
         HiMcIdZ9Bn6WvoVauSfxg5Wk0E89rizStyh2npc6Ezy3RqaAF15N7ZPkiNotdivOkizP
         tznyUC7nw+yS2DuO/pRqJDhTyOMpcvBe1aPHT1LgibTVyhSifEASl78OFNB4r/KAekqA
         Sdbeeqcxxe8xHK8N3g6eSbEuQIDEQDDCcT+1YQOWlC2wDXjHzyZcB/fP8JIrWbc2ILy7
         1hdxC+Yb5RzD2+zqyUH0wuUaO37bJDMKB0sMKu6MSf4qqvPurLEfl3Swn2+M2AHSBN63
         RhqA==
X-Forwarded-Encrypted: i=1; AJvYcCUdcI4QilhicJc9ZfvMZEtff2eNa8BHS0UR4YP0EdMDEYivk0Z8wWlgVD/WoV2vhkO7oEm9aGMrTosCAX+o@vger.kernel.org
X-Gm-Message-State: AOJu0YxoN0M5JPzBiv6KXVSdnqtrzTnHw1AUjs7RpCE1NbsxICy+iKnr
	L4bUh/cdx/5lEum5cpBqDsRVA7SiFOApjRPQzEfDpXPtRFm0fNgQfMOMcOEIxg==
X-Gm-Gg: AZuq6aJv9MAe8juKe8vRR0t0T++Hn1EuMeP+JemVpBE+qjbVR+KdJ0Y5zXwofrbv3dO
	myULKqfRXaIVviNSH0ODHrhv7CL7Yqfkngx2MCR8R5uy8lph9ZxlDpCkrAGjX0A1ED2BewtlxLC
	V4GRzSlnhs9pDMujsdROyGI032JktF6eRwX5eZmLRiB/VqUjoygxAf1R2eb7x9PqOA7JwwLMyBH
	kiyW2ta57dfhJrkLW/GssSstarjowory2h3bRkRaZyzAn8YwHFkugbF/mssiUJ/MOn7Qf5cp2UT
	zJCeOePERDG8NvHd8JnF7ogBRfSfG/0fdssqDr9C8TC3dBLVnYt+3F1jL9gIMJ5gfxFwsXNlwfO
	RLwjjvJsO49spjpY8jeWxc5wi2zVaF/+UC3rKoFgJB+nQtP5KmP+onSHB4hdegA62GqTRPUqEAh
	21dT/Drvhi5tzzHBDr1IzJLCrmL7++OBIeIAt+hTCAF1gO82udJxrl
X-Received: by 2002:a05:690c:c92:b0:795:fbc:e2ad with SMTP id 00721157ae682-7952aaa0b68mr18302027b3.27.1770370515612;
        Fri, 06 Feb 2026 01:35:15 -0800 (PST)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com. [74.125.224.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a2a13b6sm16147337b3.56.2026.02.06.01.35.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:35:14 -0800 (PST)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649ecf22226so1230236d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:35:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhNVnD6/hYNBtpEwdJbC/I19OXke7LYirYEHptoJa/7g3tQhgZmS6HHOvpBh3/cNdpJ7pr2sj6L6sYn6qP@vger.kernel.org
X-Received: by 2002:a05:690e:bc9:b0:64a:cf14:ff0f with SMTP id
 956f58d0204a3-64acf14ff9bmr377569d50.97.1770370514307; Fri, 06 Feb 2026
 01:35:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com> <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
 <CAEQ9gEkH8mJu+kwghbFFwNi9RfbQ6CzykoYVJqa6YAL-74SaKQ@mail.gmail.com> <eefc4df5-78dc-4dbf-89f5-c255d3ae41a3@oss.qualcomm.com>
In-Reply-To: <eefc4df5-78dc-4dbf-89f5-c255d3ae41a3@oss.qualcomm.com>
From: Roger Shimizu <rosh@debian.org>
Date: Fri, 6 Feb 2026 01:35:03 -0800
X-Gmail-Original-Message-ID: <CAEQ9gE=sw9dmD67xRK0uvYLt9bd=ervifBSAjagNTw+zVr0e3Q@mail.gmail.com>
X-Gm-Features: AZwV_Qga-r_Zgfnv8uUZI65QJGlxWjZjfmClBEA6Z83uIl9y3Hk-Wet5N3VASR4
Message-ID: <CAEQ9gE=sw9dmD67xRK0uvYLt9bd=ervifBSAjagNTw+zVr0e3Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 05A4DFC229
X-Rspamd-Action: no action

On Thu, Feb 5, 2026 at 12:52=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/5/26 1:04 AM, Roger Shimizu wrote:
> > Thanks Konrad for the review!
> >
> > On Wed, Feb 4, 2026 at 1:21=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 1/31/26 11:31 AM, Roger Shimizu wrote:
> >>> Thundercomm AI MiniPC G1 IoT is single board computer with
> >>> AI capability based on Qualcomm QCS6490 platform.
> >>>
> >>> This device tree is confirmed to work as below:
> >>> - GPU
> >>> - HDMI output port
> >>> - PCIe M.2 port (for external Wi-Fi or 5G connectivity)
> >>> - UART / serial console port
> >>> - UFS
> >>> - USB Type-C port, with Display Port
> >>>
> >>> Signed-off-by: Roger Shimizu <rosh@debian.org>
> >>> ---
>
> [...]
>
> >>> +             vreg_s1b_1p872: smps1 {
> >>> +                     regulator-name =3D "vreg_s1b_1p872";
> >>> +                     regulator-min-microvolt =3D <1840000>;
> >>> +                     regulator-max-microvolt =3D <2040000>;
> >>
> >> Have you cross-checked the regulator settings against the original
> >> vendor-provided sw?
> >
> > No. Those are from RB3 Gen2. So far there's no issue.
> > If there's an issue, we can fix it later.
>
> The issue may be that once you enable one of these regulators, you'll
> see magic smoke.. please cross-check it

Thanks for the explanation!
I'll check it.

> >> [...]
> >>
> >>> +&pon_pwrkey {
> >>> +     status =3D "okay";
> >>> +};
> >>
> >> This one is already enabled
> >
> > May I know where it's enabled?
> > From my search, pon_pwrkey is defined in:
> > arch/arm64/boot/dts/qcom/pmk8350.dtsi, which is disabled.
>
> Right, I must have misread.

Glad it's clarified.

-Roger

