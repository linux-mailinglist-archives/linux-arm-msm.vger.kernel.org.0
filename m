Return-Path: <linux-arm-msm+bounces-92538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EBuNQXgi2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:48:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB3120854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 247E2305236C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 01:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D0A2BEFFD;
	Wed, 11 Feb 2026 01:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwGmUgjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzuGOxwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22529BDA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774531; cv=pass; b=G8rTYow26LYnJzPGzwODX+HKviw/v7718BcY0og5sqT3IynfFsS9eZUcJrB7jIlN9Z5dfarEPadL5QlT23aRc4rMA1BhckD40m2BYc5358ImE+e6ij4GMBHQuSMK7+3i3VxgHE6oiTW1kQIv+sb/KfJBBXSEih58oarpMeBhF1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774531; c=relaxed/simple;
	bh=xSGeYmave0IMZ0SkXbSK3JzZpiVmg9C8P170/PXGWPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNrvcibrsgUmJm6+D/iBV7g19C4p8d9g6npbK1ER8bp0eNH/KIowghrVaofCEFiX4u6dD+EnBnlGyhhC9FLv2ua09sp7lzuj74sqQau3MBt1hVdIB+fGqQDZ0EQj45NBhkUKLK57U7dcy81HtuAvvIcXa45y/ZRQhA/kRc0wWv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwGmUgjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzuGOxwg; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHVVa43744783
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EBuYjZ6aifGkd1dAhK++qfqm
	5kl2DiQXlBUEgL/t//Y=; b=fwGmUgjzmRMwoYf1nUK2e1gsG0x1q/7axC9G1d/o
	SaQKNu/YQ+QzxOUsrbCsXbiUGaLdCx/qnzMX5iWyDlQAZ+dzTH0a4Dke+L79hCUC
	Dqe3ddE18USs0bSYjFB8w9E163NOMR6AFGc+UijVhis0AOcsDozykwDz7n7XnhTw
	5rI9i+Fe7/2ST9BhStUfzp7S5fC1LoLhvZOLF31Leg37tpP8DuIakBI5hfxvv0G4
	B7edLcFEpRuIHfvQhSjqF/cZTrAiNAPr7VJMNqcuVtVMLSjPHMpzDgoX0AiDLH0V
	qnn2AlwZkAAnZy5MY4WReynLC1EU9PNwSqH+BXRqhqPPEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c895c1gjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 01:48:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3562171b56dso4122973a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 17:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770774528; cv=none;
        d=google.com; s=arc-20240605;
        b=W0PTAWkvWHU87Y2jmENisRVw+lss2VTUhglHo3eNToR4nntMUUbkV2l4Q68pt9XB5c
         i75MM5m6uwnjxCJ8qgZUr6xcA3r8fY1u5JXTOijNo+d+9gAgfMegzrSYuE5ZS+tKsEFl
         M0TBVWzZQQHFnpL0cRtcS58F+a7wCarj0Ngv4Qj2gnxfSju0qn6GkkR4X+PcaHi6ofns
         y9MT/QEJferPxT265AikbtugY2kPyd2tTPZaFa3tzmGDC0KkWICQ6OWZBOU8ccDYTtsj
         zzut6yLyKpoU6UYf1YDyK7Zh9G9xnxnW8YbLhGdKWhoJSt1eEMXGkbCmQeLEjxeA3Ntu
         TyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EBuYjZ6aifGkd1dAhK++qfqm5kl2DiQXlBUEgL/t//Y=;
        fh=C8BtAUP3noV/bHSCppPEJywGfde2F9mfld8r0IZaCEI=;
        b=L6ErPYltMALLTWBMZomHPvWp9QGyisTJz8TPa4GAuFq6uH1YaUoVEdvDy1IBjBBvUu
         3WqAJ6V0SyW2lAJF5UGbtDl8rBTxbny80QFPnMaLZ+zvzj6geZ+sGkfBh/tmduhGHTI3
         XTRju+jBS4fSpftm7qJhQIubPrxObYt/oeWVkneR880TUL3pzAE098s9Y486Ufa7E+MJ
         xK/1BZtV1fBtLJsNe79W1AN5Lr48K+BMEt9itYbHrqpY3SazNKF2GuuQC7a7XRW8P0+6
         VHcnkINASvvYPTD2ZmVCuTH7WqWpF/9PRqzjM9enV0NFpnCjDi8O9W5QH31ZqbFitkIK
         0Q5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770774528; x=1771379328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EBuYjZ6aifGkd1dAhK++qfqm5kl2DiQXlBUEgL/t//Y=;
        b=RzuGOxwgWi78utb++D/twBmVneUIv1b4zzpvOc9+IG51A1ho9KCNSUvUdvvpGmyOgU
         phPNDY8K+72Uliim2w08E57AhKI6GsSFt2/wT1UV5cX/G1LpryEH5d7Hh0bh3pMZc3et
         4QJNlX3/I+VruCgVX6PaLla9EyDWtYRbANxzpXkvHkVsG7SzjwddCD4AJhOFQ63VvO8D
         rH8gtXIp/L1At/YWQ4qW5k0cO83LC7QvoxNXbvpryU4GzM2JO/nAQxme3Us6ogJ8WRwm
         sWcdPtmhHaRATcXUEmjC1jIwSO7+NoGwEB/ze6Q0PyieFcKSua8hn++Lpm6y1yi271ce
         x0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770774528; x=1771379328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBuYjZ6aifGkd1dAhK++qfqm5kl2DiQXlBUEgL/t//Y=;
        b=vY2wPNHUvhNim5AlbeIo8LgCVfVCE0VT5Vj/pu40ivCJRPHKRNuLJ6FZs598fFdlUd
         sTF4o9mbm0cfJilIcqDIuCqMfM9putcaT2B4sHohPkE/cv07U9ykkNttce5SNhdYZ1R1
         sbJlVR9A1TfEbmnQTKb4G082qL5SC6hQi+MJqyORYaPa/3UzFJT6oE6yld9R9oSsHjU4
         R/22Sw7v7hgGriwQK1jUei3lghAiyu54xJY+UBTf4h3+9FKkNv0yJhLrbXZmoQEMu2nE
         sjpxIhg+NzY6owdygTdckyDZwQGlw7yuKY5WrLLpMoGxD3GTzcHMV9HH24TYdT+GPf5/
         3+mw==
X-Forwarded-Encrypted: i=1; AJvYcCXi/eSy923MrT8P4b9mKcIhiPbyvMe5WvP0XT115w1dlsTCPWI29761G+1Xqv+PllXYEt7uLr7WGlZ/1KAs@vger.kernel.org
X-Gm-Message-State: AOJu0YxfwOSHkIJ0/2wPiKNTjHjGzRu9NS0hp+zIgYWnxfe7cLWUNtj1
	ifEwivdRx7oCct0dXTBXjY6vWnrddpRs4/QHGL57P/nZBa811eIGMOUG9tu/5K8vAotQpGaIgt1
	JYy1gWDjmwgLRHvmTa3MISyG4fGSWFnWg5fCA/r2YYzvbhns09qs9UKixnyHQUjrLm2/tyQ2cRz
	nfrKaLXfLv5ZqwEP66BwF821P2QBUIwrd2ZPtO2KGkRBU=
X-Gm-Gg: AZuq6aIFWgRcmrzTtu3pWXnaTRNStUYuyCdT2KccHk9LPO2jh+45J6p27XkOW9po/nF
	ON08LQH/lTVxCpjZ2IJyssdO8bhwRw5r32hRuHocHj6E+5X1Wn3oAwxxh8XUR98MAtpJpkJGZz5
	FFM5C5i2O7zJTnE/PjB2Ol6xeGrLen6N/XUEpzLjVRyKu6ITdd5VBKiyvE6B/QPxJiSiZUVQmZL
	j2x
X-Received: by 2002:a17:90b:3bc5:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-35667d72a8bmr3144211a91.34.1770774528480;
        Tue, 10 Feb 2026 17:48:48 -0800 (PST)
X-Received: by 2002:a17:90b:3bc5:b0:34c:a29d:992a with SMTP id
 98e67ed59e1d1-35667d72a8bmr3144179a91.34.1770774527960; Tue, 10 Feb 2026
 17:48:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
 <20260209080613.217578-3-vivek.sahu@oss.qualcomm.com> <CAMRc=MfT7ourMH+ShJpnBAjv_uOb_ds0rxJOYaz_HsoT45dJYA@mail.gmail.com>
 <cbc0b42d-fb5f-45b8-9074-d0bcc64a9de1@oss.qualcomm.com> <erc5u6hzofidlf54dsz7htta55o4xwgihgh4tu6mqkg2ijz3fo@6hd6q6iljrfq>
 <dada4a44-f464-4325-9082-50029d6a4555@oss.qualcomm.com>
In-Reply-To: <dada4a44-f464-4325-9082-50029d6a4555@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 03:48:37 +0200
X-Gm-Features: AZwV_Qg2qm_Ag_s2JkmIG-Y77QYxnHbFnwvbLMtmQMEho97MeZnPXtM_u5rHzFo
Message-ID: <CAO9ioeWhNO1vYVvN46wNfr2NFAjD-oERLhMKTXyRkRDLtJTMqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Bluetooth: qca: add QCC2072 support
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Z8aVmRL3xpjTNcZIz8WopLtQrUhOP_Xy
X-Proofpoint-GUID: Z8aVmRL3xpjTNcZIz8WopLtQrUhOP_Xy
X-Authority-Analysis: v=2.4 cv=AfG83nXG c=1 sm=1 tr=0 ts=698be001 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=TCK52CFr6wQZEBS1tEMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxMyBTYWx0ZWRfX42dpOS6FVDuC
 vOuFhUCNU+/8k0X5xrnw/EdHYIWVcCgduwyadUdA5MoxaHdMMO35WJE9WIn4z+2ZKFgv/rpwbPi
 fv3KbKwsWZLlLESd41sDhP1Osqva3oziA5pu7jwc8HQwFzpSyxA5XAbboWrcxRa69lSVXXluxsH
 ocaald/SggLgN9VHNWDqj+4JRBKLx0oQS/vucBpHoY7sGkj6+wscP3PVsxVmRMoJoJQheifDsjs
 sKu59yPqcT6eRkqChRi6CqY27nACEMWMCiDMSeYigZXwc1RfR1rhZMPHEjeTEnMcc5/4WI9cwjl
 RMup+3u3D1R3MLEM11Mxc8yyUCTqGP/tra82aNkuatqnbx0N18jJMa17Lm25KEZRnIX+P2y9JoT
 msfeRzUJKZie1wmrta+/35UhNqcOx+TDskqhe9EU3IzZoCDZ421QiQlrOJGce4RJdX8bwCqA/Ou
 nmdnLOiGjdl5hXGhfNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110013
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92538-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,quicinc.com,vger.kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 53EB3120854
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 at 15:53, Vivek Sahu <vivek.sahu@oss.qualcomm.com> wrote:
>
>
>
> On 2/10/2026 5:46 PM, Dmitry Baryshkov wrote:
> > On Tue, Feb 10, 2026 at 05:41:13PM +0530, Vivek Sahu wrote:
> >>
> >> On 2/9/2026 5:04 PM, Bartosz Golaszewski wrote:
> >>> On Mon, 9 Feb 2026 09:06:13 +0100, Vivek Sahu
> >>> <vivek.sahu@oss.qualcomm.com> said:
> >>>> QCC2072 is a family of WiFi/BT connectivity chip.
> >>>> It requires different firmware files and has different
> >>>> configurations , so add it as a separate SoC type.
> >>>>
> >>>> Correct the sorting of other chipsets for better readability.
> >>>>
> >>>> The firmware for these chips has been recently added to the
> >>>>       linux-firmware repository and will be a part of the upcoming
> >>>>       release.
> >>> Something is wrong with formatting here.
> >>>
> >>> I would personally split the sorting and support for the new model into two
> >>> patches - without and with functional changes respectively - for easier review.
> >>>
> >>> Bartosz
> >>
> >> Yes, I'm now splitting this patch into 2 parts, one for sorting another one
> >> for new model
> >>
> >> support. Please ignore this patch.
> >
> > Please stop adding extra empty lines between (or fix your email client).
> >
> >>
> >> Sorting change has been raised with tittle "[PATCH v1] Bluetooth: qca:
> >> Refactor code on
> >>
> >> the basis of chipset names". Please approve it at quickest so that we can
> >> raise new model
> >>
> >> addition code changes on top of that.
> >
> >
> > Why couldn't you send it as 2 patches in a single series?
> >
> this change includes driver change and yaml change. In recent
> bluetooth-next branch there is a new style of documentation of bindings
> comes as "Split to separate schema". I need to re-modify my patch again
> and compile. Splitting patch seems more convenient for code submission
> and addressing review comments.

It makes maintainer's life more complicated as they have to cope with
dependencies between patch series.

-- 
With best wishes
Dmitry

