Return-Path: <linux-arm-msm+bounces-105267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIeLEiZo8mkBqwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 22:20:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157349A0E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 22:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A59300A12B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 20:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D0F39282B;
	Wed, 29 Apr 2026 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJ1yil7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T24P9Fi6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E569938423A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494032; cv=pass; b=hjbs3AYbjiMQVUNf6rhPUWcGSNhFwd7ecslJ0M3vqJt1ARnKjOBvAzAMwdkL9IqxG43QueH7w+OyFF+i7DMd+Gzk66bmet2kklEhIewOBSvFS0yD5OAdkYpTjds9wndW6LBMSKwN/X1CMsaA8+tFzFQ51585NHOGq4N8hRWFv1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494032; c=relaxed/simple;
	bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gig7OppLseqxeLVJDQpfa7iVFrb34x4YUfKqLWiWpPRMV127AnzrFXiwP/eqlHxwmDsNNP349Mw9GfHDgghuehDOA8CCZJrm/y674tGS47xvKUOqbhlrJ8XXNQnwPZNgixqVK0G+WxsuuWO0p0SrYClYuigYO2R8r9q5POzw/PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJ1yil7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T24P9Fi6; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF3sq12094208
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 20:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=; b=ZJ1yil7RRd4FYxIp
	p7Iy/QHM4zbRhNpPA0hYLTXJPDkjEZpj0nlJd1/gcn1CaWRIma04TC5JKe3D81SW
	vVeiRZzWMnD6h1j+/NrrML/N1EdSQ9j/g1w/HfPjcjKblwHioKNVvbPOTS7wMt1g
	t0Gzh5vN5ormYORSYWNaDzPSF5QRW2Nn76i06d+SpiMnh38SIooyjOtYhh5AvjdN
	CZmgTmQB8ODoWqmGpsdbBkWvdolXxWGtqhvkZLbyynEZ4or8H895Tf9JexmnCUm7
	KfrnoxvQeAAeJ1xqAifF8YREdrGH3wXxomLatFCwx3CMWJQTzOX/W5W2A3BAs683
	leNRfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3u6k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 20:20:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf0245b0so3002961cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777494029; cv=none;
        d=google.com; s=arc-20240605;
        b=hXA3O+i21gy37Oib8+9a87wp9uqut1fhJgH/zKmq//QxI9C5x5MB1plCFPrjSAN3iQ
         AsU9eawa/EEqgbVnb4bd9BYHkk7Ds05AqFVPqXe7sFbJBxT6BzZxwbJbOnvhHRYiw/Pp
         eJMSG8UBZPCQct8S3oAl4kKSJT0KZBNdZQ8FBxtdS3SCzMRL0BEqbiwEfh8ht80PfDy9
         In75tZX3e6IjRtzcfeMPyErMEz8SQprxiH5wlDmbugtYF4xh7+9BtwZvBrpGs09sY2m5
         uHtD1UhPi9SyGjU9fh5/qmz3oXa/YDe++i2oPZxNESmx90Cq2725/dke5YQmAOiQo5t7
         E43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
        fh=by5CzDpll0H6SJpOnVq0n/HS283Mut+7euO4tcEMJqI=;
        b=OFdvp4Uf/yyJpP1nZbif5tHDd0n25mZkat1ujlsgnQAtiykTInrJxjLVYODS/Uuk0Y
         37cQvLbqzoaAshqDQDyjYW/2oC3fi7z1nvq0nJf4krukzQp/zwdt6WTP6kc9tAKeCaWm
         52JcI+CYsBdFO78MpJy0lOk8ORXNClAPdiWbTMoYRwjflWUIVJS8rKjumpL3WmNkodEl
         iC9Z98RvjZbfVXV65Ca2TAuasdzaTFXFtgG3GHpBW9aRne1YJNk4Y7lDsg5iRx6MXdHf
         ovA8YPtZgzCep/Cy36c2FlrmJ3nnc/IFGYCgTlqwZ0KH038p5QNNF7hBgqVYmTd+LIJB
         QyUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777494029; x=1778098829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
        b=T24P9Fi6Gf9Zjk4iMavuKmXO+S0kBOW1j11fp+tN8dJeMhZ7AyIwSiSIil0oREiY7O
         aft2bmgLO5PlC+vWwAwD/jJscZIZdBXEOtHD1hbtYl1+yd33QyWzyFG8C+UyzydLmKAN
         ctxniHxGmG2dGtuWcGQ1RiUsyXYmdx+3Lq58ciWRCYw7n30BGnGWxPewjF7M0CB26raa
         n+CKzEGTcjioh1vWjBETZ2SAzyYVBB4IQvLZTAtHnk1MRQLSBN2P7EGZ6G2Hx2w8mHrq
         Bn0dIxMgTFx2Y7H3gtVcdOZq1Dsw1ffCJbqJUversd03uc+fk7UXUZM+4L94JeprgeeY
         ltUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777494029; x=1778098829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Aw2ShP6ftvHuS4AfDxVpzaTpHpMJuiVnhHUXu+8jX8=;
        b=Qh8pJQS9nR5xUzEQPrHmEpljPw3vJnaFQPV4kp58fv3GmSvuIBFrdUN+P6/bfGxGwh
         WNY6iDyYslGfgQckRqRY1mF9hJqGApSQv/YNeJuPVKW9Nvbalem32q9W9pimBtcdOOtp
         f4ajNJkUj1x04p5aU9dogifCSp7ZJ4P2E9yTJbTVXe3Nov+a/Ys+1sC2mjsDazmAuOWH
         SYMtxFUbcKTiojvLjdLaSPUGw4sBWddtkoah0dgVbzwZY5zcZF6gnn7rNicOyqbwgwmz
         66MRdJS7AofwEaDOhdTvx/focOu24CLsw56WkQOZwn8KhGYQolyLu0mOb/xYXyWA3VOj
         Nf/w==
X-Forwarded-Encrypted: i=1; AFNElJ+YAu50a3ySVdQKLGAOYFId0K8kwfinuMa2Nkr6g/lDVF/WUakf7Ex5mfEPpFupWyNWxUDykM3bc0o7IF6d@vger.kernel.org
X-Gm-Message-State: AOJu0YyzaSECMb92MNkCQ/+sPcQ56JCJXL/MMDV/ydIpJuytLWxv6buo
	frgQ8mvhdFNR6xlDKHVgvHgf6XrGq657XKwdB1ebiiVeOu9vtDx6uHUx1TkFncRCtsV6RkI57Vx
	ErcpMvoKToqnYFXd1c29cLbXtbc00NfbN8UffCbT9+SwLl5FoyZZGoz4ntCE391N4stpGr1kLu9
	tueGtnwBGklPKanlGmmHa6VUGTreQzl4InCtIJ5K2/ZTk=
X-Gm-Gg: AeBDievKmj6l+r+H9P8NPMad0vCa2nVd2cgNZYhmFWhJX7zvv8XCE/M6b946mn+rq3H
	sUWVI89tR7lp72jb+zZSe4qtIDExAj6E17tDAzLeEjljF1uppiJBR0I2FqB/Y0jSGBsEo+5JMOS
	C6tytiMdHtxCJ4lc0JM5FupKaRVLKN1tl/DnYzYduXyJ/i6oKFzPfc97BhNax+Ky1zOc3mssFIC
	sLqepSCLtPHhjNA1bLRJvl7YkGI3elog9eOowCknHMLZXOidA==
X-Received: by 2002:a05:622a:4cc6:b0:50e:89e9:271c with SMTP id d75a77b69052e-5100e10eb2fmr114762641cf.17.1777494029287;
        Wed, 29 Apr 2026 13:20:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc6:b0:50e:89e9:271c with SMTP id
 d75a77b69052e-5100e10eb2fmr114762001cf.17.1777494028820; Wed, 29 Apr 2026
 13:20:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com> <b4de6c89-dd89-4e02-8d79-911e4f9f0813@lunn.ch>
In-Reply-To: <b4de6c89-dd89-4e02-8d79-911e4f9f0813@lunn.ch>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:20:17 +0200
X-Gm-Features: AVHnY4IQns7j5YMIXICXGX8mkvbJAvEU7QYVILcU5HpEGI8Bxfo-jvWggVlQrrA
Message-ID: <CAFEp6-1GdaJd6Ua15TsyQC07QDbArXO2JZa9nKVFoCG=4xBpWQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Support for block device NVMEM providers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OJfx9geallg2vlDiPuGvCUpLnxGWqwye
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f2680d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8 a=ICsrgdoeZ6IjgJzXnBsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: OJfx9geallg2vlDiPuGvCUpLnxGWqwye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDIwMiBTYWx0ZWRfX5nXGWiV2/05V
 +EhbkMipk7D2l22w1gA8T6kkgLrWmPBxEQoAgW5kfuWZxPOHUObB2muVmksMv6gPw6ylafcyL7u
 e65GIuuo30LQwQIV7NO2jjfrgEzdL2XEDm157N9qQkmZCCxagHaOcwGwnnq4flClqpWBbWf81Vk
 ujyjtm4hkwM+peD18EXHxzjFxYyXXY+8iRJIGJb5cSeN19r9mCzzUioTAN/2tGS2jff+RRfkJoh
 AZhnYzpfpFk0NgWmjKPTAIJA/WErVfDABgvxwVwbNZRRxuRMgBKdLxVDZGZt1pJPSFx1+gWSfA1
 iqvO1D1ogD+bR+POBdQjjlfTkJP3ub9hiZiZ6CZuC4u4LaAYpzrStGn95XfcHH6mVUvCjXYssnw
 cX10IlBnQuLfgtWFH1OJdv3QgbpuXo4uHu9rfgwzEDu3tyDmevVRnw3fheGf8e1EASy/HS5+ts+
 LTuOdaHXlkhg14iPm1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290202
X-Rspamd-Queue-Id: 9157349A0E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,vger.kernel.org,lists.infradead.org,makrotopia.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105267-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]

Hi Andrew,

On Wed, Apr 29, 2026 at 3:06=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Note that this is currently limited to eMMC-backed block devices, as
> > only the eMMC core associates a firmware node with the block device
> > (add_disk_fwnode). This can be easily extended in the future to
> > support additional block drivers.
>
> Would this be
>
> https://elixir.bootlin.com/linux/v7.0.1/source/drivers/mmc/core/block.c#L=
2641
>
> Looking at that function, mmc_blk_alloc_req() i don't see it doing
> anything different between an eMMC and MMC.

Yes, that=E2=80=99s correct, in the previous sentence I should have referre=
d
to MMC-backed storage rather than specifically eMMC, since the MMC
scope also includes removable MMC/SD cards. That said, eMMC is more
likely to be used as an NVMEM area.

>
> An eMMC you don't expect to go away, since it is soldered
> down. However an MMC can be ejected. Is the code prepared for that?

I was about to say this wouldn=E2=80=99t be an issue, since the NVMEM devic=
e
would be unregistered along with the MMC card removal. However,
looking at nvmem_unregister(), it simply performs a kref_put(). This
means that if a consumer still holds a reference, e.g. through an
nvmem_cell, it might still be able to access the NVMEM reg_read
callback after the NVMEM device has been unregistered and the
NVMEM provider data (bnv) has been freed...

I guess I need to try and dig into this but at first glance it seems to be =
a
general NVMEM issue, since even though most NVMEM providers are
not hard-removable, there is nothing that fundamentally prevents them
from being logically removed/unbound at runtime.

Regards,
Loic

