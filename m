Return-Path: <linux-arm-msm+bounces-109422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NODOjK4EGqzcwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:10:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0FA5B9EA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 22:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83243301AF42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 20:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B523D37204A;
	Fri, 22 May 2026 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbgztTsE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEnWvWbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7611352028
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480564; cv=pass; b=bFykGxsd/1sCs84lBGndmqF1wksoLyk0uuF+3B6WWgLzxYHYEapJz47bRZm7qfP71HMs1Bud7hb34IBaRpRLzb+b9uJl6J21Y1sZCqNbao4bQYK0m0hbPq1lJ/XLZknaekb8GJgQ7/b9ZNIzKwR3jQUmTYCN16rEJRYoxQiDjKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480564; c=relaxed/simple;
	bh=BYenqKReshgy7WMYk3vXJQUj0YK+MP2HizGUmGHcwiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAeoFXGNumW31zR0nOO2btOYs3A9DQrnotGJnVcKJ6Yxsc4l1v8Pj1UJX31trFgR44WCatbrh5kszBmw6dFt47Jo1+gFR6xl6hyo+CAaZ97rcDe0ZaLvewkYczaTfb8L4ckqRgzuM9xIRJY4LftpJdwbbjeep239DciiFy87I4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbgztTsE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEnWvWbh; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFrUnT3005127
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=; b=EbgztTsE1C9CerSE
	ANTpW3uvn5Il5z/EcdPUowP+j1DovIhpYLkshTBQcFSp04zrMrdGzt9VrEDdhC4u
	/OS8jPtLzIIC64gNN8r1/jWRO1QKY7ePcVrH1lXNsJdefWwgMAsp1OkdSnzgxz2A
	RmeUVsDokIDB0hnA0AhEfhHrMWZiz+A/5xNfbXHXQ2JjFfmAuTexFDG4uSh9GBE4
	Uj7Hhq2m1Z1Dkp6h7E7qH5ORpxVxb0PHRo1f9A+gQd3r8tvMFo7+/vT88LSzxMd0
	CYtP3evhGCD5OxWn9UeuQY1sqK6HwmFMAEMNY2/FH5RrzV0e0fIlG8WG6aFtaO5Z
	vTsYIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbrm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 20:09:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-910304978f3so1550880385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779480560; cv=none;
        d=google.com; s=arc-20240605;
        b=W6dxrSD/JkZE9KNVqRGp9d4ArWUFc+mn37lorSeKEO8bzQFg6bap6yvzv/0drGi1h1
         EeD6w4XMpc2hKqBaMEDo4VIrG8GIB2xhG30FO3ecpQolgbt82wEPd3srhG+b5Rdu5LZd
         b9jEzAcYHCJCpIXlA6TBaQWZV1D0/TIKFpUphdZSnWK/Fmo6IKdNN4DiCm2JmKPXtitz
         9XEcGe0tKYKlLtIaorfmA9iunldkaiNVgqD5aE8FY1uaoHS98xo1eqOQcbMEKkhCkoeB
         zAytBz2RPtL3SKPyOKpeaPikBZOSXitix/ToB7QSCgYtAYefsE/63jEaYEJ3ZaV1A6da
         kkpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        fh=iuNeA/kn5PIdZ9vK2CmV5sNuR7I+CCWTiCzyy/VG8vk=;
        b=hA+koTJf6JfgPJwtD3Eu7l1eawY0lOUIcrF+SZBZCBmqrwts7HtXji4DxfBDytWS4a
         Dc5e/+CEOlKlL/tUL8uJGEw3siH4EhKW/OI2Cr5h5yvnwgtwmBXuConZWyeguYVzhYqI
         aYt+WIQ5tzpj22ycFojggaqOfGMXAhOUWm3uACb4NKJBBLTloSkidk8XxCbE5OXKSoiC
         jd/rCVBGYUvY0MwBudiJhh6PiTT8yZDW7j6uzCwHH0IByYSphdGczGPWPTNFEbhTmiY7
         T3tLUO3UZkaXhDi++RgP9dNxaIYNUlslXBZaWJYXF1YZSb9yrZe5tDSUBJ/5bfv9FEwY
         7o3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779480560; x=1780085360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        b=gEnWvWbhvP0+e6LYTrWsbs3M/By180X7joJLIy4G7R1DWU4m/8cj1rAnGMnluHIE1P
         Fw+WSudfAqe9Dfdh/nGbPNX8BTcQz7+0XSst2n7XzpU5SdFspXvzqSfiduK2u9PKJKOy
         uletSv8F+H/t/Nyvg0VEHGnud9pDORrgqyA+eb/1zkC4pmc3TJmaB7f9P/Q9PL4vHkSP
         IzKTr7crAYdi1pS/NkT3miojCZLXR3uLhm0AUsq5OCorx/BWtGzsJ8Oj3Hqvx90LlZo0
         nBTgkIIsatOI5JDP5IzvlomB8GRyDteSzeo+tQzDLPa5b9AhqadO9439KBaU0+fYCkQm
         sktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480560; x=1780085360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4mgJ5edVM+mqGwYghHMz4APWCN08GCaqEMyrnNrUOWY=;
        b=JkZyxL522r/STLyu5RSbRJzmPimYjR3lfqhVAy56L9Jy/5rtNG303n88S2LrIjf8ZH
         p0QCfpI7jHqcW/0ycxNAd6IpqxBA7CTftGHBuAc/r97dC3eBN9LobzjVL9EbGxUophyg
         sIcLiSLZFN5HU4kW7+GR5PbWd4zNgfwbsMxY8odSPAtScmeBLep3XqOXTctiAN1RfKET
         joMv5P/GVsXae9DWZHENAMACRcNrUuowKQOfI3EJv8EfafEudL85P7oHDh9HFjhpAtKY
         zy43em1OjVmTheqiGrxUVOeLE9aRGnrZ2xDZ2dA6dayMs9UZHBG/wVvHjc5nDAY6+64p
         H5jw==
X-Forwarded-Encrypted: i=1; AFNElJ89zQEWAl6Vbz8zKASbA8XIBWn1/c3FcsVyFwBDEcpSZPZwIaBsbnRqnLbMq3B7WmBVG/7050Ix/TFkHnM6@vger.kernel.org
X-Gm-Message-State: AOJu0YwvnvTSgIrJWMrtheK+yoDzNx30dRNux080xHgBHW+OmjojpcPh
	/DITh7KfYLPTKZ4QOateG6tvYptx0HOaHfs23TxJFi/tZHT7mPyxEhqXHQvwwec+Sv0baNNWsJq
	VuRAxSKMeeczPn2B1cP/Sjv3izjhE1/oiakYAWba1EziFLsXbR5UtXacPHKJ1T2kJRcvRn4wdD5
	YYSgFNby2PUpFEW0N8tWUIrO12+ioBL+T9QEbKhfv+fgM=
X-Gm-Gg: Acq92OHxPibYs2ovQtGrgPTE03XnFRZAGPTS7AfIYsNcFK1apadJJ0/ptldshu6BdY3
	l91alV24oa/rBwgP2X8r/gFu39QXLtsVK+1mXWfJT3ke0K+nDHByPeuV1uagJ+egUH4au+MtKJA
	xY5Ai+p0PgbMKqcMnmL8bd43r/q1dtrBez8b7Gr2xLscxIpFMl1gStZTRCRJLRhmorU/t2INdmc
	uiyPPBKtpfap1FZ7dhsenCeP6GLtUgtDX9QqZutTWYBNh3hDed4UvqExagLjmDPnXu8
X-Received: by 2002:a05:620a:28c7:b0:8cd:aa61:ad8f with SMTP id af79cd13be357-914b50cab94mr617028285a.14.1779480560183;
        Fri, 22 May 2026 13:09:20 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:8cd:aa61:ad8f with SMTP id
 af79cd13be357-914b50cab94mr617022585a.14.1779480559708; Fri, 22 May 2026
 13:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com> <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
In-Reply-To: <20260522-mhi_runtimepm-v2-3-fbebf41a82bb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 22:09:08 +0200
X-Gm-Features: AVHnY4J-9F8AAJuD_tJW6-iaDPIYDcwXI9s5goDnYZwmGPWaSdjsV19cBJfwNa0
Message-ID: <CAFEp6-1sdQn11NKom6cfwtJvZX-CnPRpJeVzQ+99Sb4A4L-qaQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] net: mhi_net: Hold runtime PM during active data
 path operations
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10b7f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=omgbQWz8Cy1bZfrwG_oA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDIwMCBTYWx0ZWRfX0IFWAx/5AwXH
 CHCaikmzxqU54297DnxP2MflXz0yi4+GHjOrL+s6eJFPBRcLxa2HTsIxCc8De0BoDR5YQe0Vppt
 R/59f9wYJaAKqqKJPLIYFUnUe21XQ7UrOEuiGPd6cbBTapMrDBXHmMGVa3/z8jObLzVVBJHDYyo
 psh2qgv4RNyb+sTVaAbb3oB5pdS7SNEDyg0TuxQYXu/WDUSqikypi1+grb1E97DRUDyxkKPSeOR
 uUQHSaXe3NIof0eKAirshdM3afo9MazqoBGSYCGaiTkCXQnnsJzuOFISH71t/H2WgGlpk6j/2qC
 wWTZuMv5aGR2fBTCgqU1b/af7V0IA8SPH9Yt699uGH1z8+LPWbFV1aMTj+x8dAC8OrLH7YRbjWy
 DczG5r1p+av516xsqv6GZAttJKgwiKEAuMpCHiejTQQSAfuZaJEnb+kJv+g80i0ExMhaU+myDrc
 F62t+dmCW7qfKz/5Tgw==
X-Proofpoint-GUID: jJzyklfpn4opiSVI5qnZwoWgX-LGwoqW
X-Proofpoint-ORIG-GUID: jJzyklfpn4opiSVI5qnZwoWgX-LGwoqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109422-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,sipsolutions.net,lists.linux.dev,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8A0FA5B9EA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krishna,

On Fri, May 22, 2026 at 12:01=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> The mhi_net driver does not coordinate with runtime PM, which allows the
> underlying MHI controller to be runtime-suspended while transmit, receive=
,
> or RX buffer refill operations are in progress. This can lead to stalled
> transfers or failed queueing once runtime PM is enabled in the MHI core.
>
> Add runtime PM reference counting to the mhi_net data path to keep the
> controller active for the duration of TX, RX, and buffer management
> operations. Enable runtime PM during probe and take/release references
> explicitly around these critical paths.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  drivers/net/mhi_net.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8..5d7f9ccdb17b 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/skbuff.h>
>  #include <linux/u64_stats_sync.h>
>
> @@ -76,11 +77,19 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, =
struct net_device *ndev)
>         struct mhi_device *mdev =3D mhi_netdev->mdev;
>         int err;
>
> +       err =3D pm_runtime_get(&mdev->dev);
> +       if (err < 0 && err !=3D -EINPROGRESS) {
> +               dev_err(&mdev->dev, "pm_runtime_get failed %d\n", err);
> +               pm_runtime_put_noidle(&mdev->dev);
> +               goto exit_drop;
> +       }
> +

I am wondering what the value is in pushing this PM responsibility to
each individual MHI client driver and requiring every MHI operation to
be bracketed with runtime PM handling.

What does the client driver know here that the MHI core itself cannot
handle centrally? It feels like ensuring the controller is
runtime-active during transfer could be handled generically in the
framework instead of duplicating the same logic in every client.

>         err =3D mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT=
);
>         if (unlikely(err)) {
>                 net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
>                                     ndev->name, err);
>                 dev_kfree_skb_any(skb);
> +               pm_runtime_put(&mdev->dev);
>                 goto exit_drop;
>         }
>
> @@ -251,6 +260,7 @@ static void mhi_net_ul_callback(struct mhi_device *mh=
i_dev,
>                 /* MHI layer stopping/resetting the UL channel */
>                 if (mhi_res->transaction_status =3D=3D -ENOTCONN) {
>                         u64_stats_update_end(&mhi_netdev->stats.tx_syncp)=
;
> +                       pm_runtime_put(&mdev->dev);
>                         return;
>                 }
>
> @@ -261,6 +271,7 @@ static void mhi_net_ul_callback(struct mhi_device *mh=
i_dev,
>         }
>         u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>
> +       pm_runtime_put(&mdev->dev);
>         if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_=
DEVICE))
>                 netif_wake_queue(ndev);
>  }
> @@ -277,6 +288,12 @@ static void mhi_net_rx_refill_work(struct work_struc=
t *work)
>
>         size =3D mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu)=
;
>
> +       err =3D pm_runtime_resume_and_get(&mdev->dev);
> +       if (err) {
> +               dev_err(&mdev->dev, "pm_runtime_resume_and_get failed %d\=
n", err);
> +               return;
> +       }
> +
>         while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>                 skb =3D netdev_alloc_skb(ndev, size);
>                 if (unlikely(!skb))
> @@ -296,6 +313,7 @@ static void mhi_net_rx_refill_work(struct work_struct=
 *work)
>                 cond_resched();
>         }
>
> +       pm_runtime_put(&mdev->dev);
>         /* If we're still starved of rx buffers, reschedule later */
>         if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) =3D=3D mhi_net=
dev->rx_queue_sz)
>                 schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,20 +380,41 @@ static int mhi_net_probe(struct mhi_device *mhi_dev=
,
>
>         SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>
> +       pm_runtime_no_callbacks(&mhi_dev->dev);
> +       err =3D devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +       if (err)
> +               return err;
> +
> +       err =3D pm_runtime_resume_and_get(&mhi_dev->dev);
> +       if (err) {
> +               dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed =
%d\n", err);
> +               return err;
> +       }
> +
>         err =3D mhi_net_newlink(mhi_dev, ndev);
>         if (err) {
>                 free_netdev(ndev);
> +               pm_runtime_put(&mhi_dev->dev);
>                 return err;
>         }
>
> +       pm_runtime_put(&mhi_dev->dev);
>         return 0;
>  }
>
>  static void mhi_net_remove(struct mhi_device *mhi_dev)
>  {
>         struct mhi_net_dev *mhi_netdev =3D dev_get_drvdata(&mhi_dev->dev)=
;
> +       int err;
> +
> +       err =3D pm_runtime_resume_and_get(&mhi_dev->dev);
> +       if (err)
> +               dev_err(&mhi_dev->dev, "pm_runtime_resume_and_get failed =
%d\n", err);
>
>         mhi_net_dellink(mhi_dev, mhi_netdev->ndev);
> +
> +       if (!err)
> +               pm_runtime_put(&mhi_dev->dev);
>  }
>
>  static const struct mhi_device_info mhi_hwip0 =3D {
>
> --
> 2.34.1
>

