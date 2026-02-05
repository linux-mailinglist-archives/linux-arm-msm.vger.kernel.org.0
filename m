Return-Path: <linux-arm-msm+bounces-91934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC3YKLKkhGmI3wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:09:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2C2F3CD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 15:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64C9F30263D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 14:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C753EDADD;
	Thu,  5 Feb 2026 14:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKNS7N2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aUOiy4oU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC1E3DA7C5
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770300512; cv=pass; b=N3A6FDBv4sOuUXQ+Fiw4KG9kcelODCB7C3j1+mDd9lWhJ2G1HetBUaoo2iDinqyLrTyWsAhrCvmVZ/rhZIwO5cTtwjLBZCJg3JgDt4FcFKs1LXR2oJPa5l3OWuQ7pbssJI7b/imQa7TyiiI3mlXIc2FrqlwQS3E06lgx33vsB9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770300512; c=relaxed/simple;
	bh=zvrwgPZFz3YS0Diur9aNddZEBJJcuOI2hK7uxTbBlOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBjLHjzjNseJ9sGhpV1BInPF6kcd7UUthAhT2dRGiBfRSr1KyjYwAts2b/NCaYktDpmSCoBv8dPIe+oBMX5oNSUr57jRyVZm3ur/AoablI5Gj//1SIC9iVQ9sBFk4Ut1INgQJLTDWjOg5jwdOfMUztBGCJ5GvHA70QKV5F2J+Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKNS7N2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aUOiy4oU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BjjY64125698
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 14:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=; b=WKNS7N2fRPJKf+k0
	58E6ODAGpMpk2ZO2aq22UaW3BtpVXCsqyCi2aqr9/FVCitolicqarlbDaTeOrY4k
	+SRcbOBtrv6+3/KvIOqK5kZ79io2z+vYpHVF5qzWjrSvdlle3uc+4Amp9lWWc6K4
	TCjG8PzLJ73WABTurV+jhW4gE8hM5sdu5GsdTw6NdLkenrI7rVDfDc/MxGp0kg7C
	FlQk63aiqq88hHh10w7i8GSx5gCDx3x7NAEJiHrnKCuUvCTKkqmc4oHEoXmMmicD
	lzejCOB76S+RUhSIK7O8NcHL/B7ira+bOuGpDAoRsmAX/ut99Y5XiwfTeS7wRWhl
	eLa/HA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8rd72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 14:08:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso255092485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 06:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770300510; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfgFCxobGWIbVoYhEF9n/6H7McI5cDKuGX/LYYDoOE1865YuMxO2Uy1xvcCMW+2gvN
         PK19IAlqV+8b7QVbk6tTY1jzZDZLErEhsOq1YjohRZi/x7ODnkQh7ggY6YHx1Iy1wPW5
         gOEgn75ukIJWnTuxXLFkM1qiFxcwvPMgKm301HUoey7JBeC1dnQXTbMGbzl6GpW/S4Ny
         KkCwpNDt/lCoBnR1+TjhkWUv4zw0PANKIWIZLa+YJX1jN9KmXFnLfomDjMzX1Vf7x1Z6
         jvKI++eJO7m0hlbtjJGrUDyOTt+iOGoQ0dBoFwinMt8AOsS9TTS6nVar0OuyizH8LWb4
         yq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=;
        fh=LY/krgwKuDHd2CqLsl7Yo4U6YUaOymoQbBt+9eHT/xA=;
        b=TTtnBu/vg3Rar1xw/G+qRbIxA7BnjZrRLxUr+KFRrCqQ/9dtD1rWBcoUwcbZzLH+Zd
         Yb1VnonrWvlhmEjcVJ8tpALBdtaU6x8xQqOeY27+hwu1lrN7UQJOZ+f3Lhx/3snd+/2P
         9Q9a7QRagO0H5XCV00FgK+D33T+bJzb7RSApqklAm1NXVnnHniRgIVD0GdiJXOb/CVx4
         8IUV7lzM5Dg9uR7iAN6q/89cG+9k2/KdWZLwRdWLZPb+5CDBgGR7fZW3qwzIvLXjdl8N
         vTeWZU3eNMn0cDs0PUwDBkW6nN8HunXgyfCEBmXRmDQVZ1TZoWQBlAXIwE0Jl5PqtZ0I
         +iVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770300510; x=1770905310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=;
        b=aUOiy4oUmIXfMDkTDXZ/PuvGO9X6EZX/izv/eEuF2WUBkACMwRn3ORmxX2LwpBrkRm
         BN+vr4CiKRCvWgABGVBIGj3J+Wxk+D0IThvFngphaUVeofnBTHiqu+jiSdmrMJzaQkRi
         1tgTfgnqiB8GJyBg/E0UcnLP4hvdY8YX8OLgICVis3MkOU2OkkDrOz266rl9g/HN/a6z
         mJYHuUlAorbZ8zDkWvAcz9gfwXwQOnoDd449iotu5Ekb/UY2sF4cXt1bS+tAcB8E5JHV
         9DcJJjDRkG1kNg2OCnOMMgpvB/TwFojHqKwY+l8dKaAvQhxxj80bqg+E6CTocM49Nizb
         e0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770300510; x=1770905310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tEbhX7QsIJFJjYy4TZp1TAQzq0F7kKHJsPeJ5oSlbc=;
        b=c+vIZYTFuk+Xtlw27BZyexbynKtIJEfw7UQ1C9lc7f/DP3Xuyb1a/S7INf/M+SX7Ax
         eeYRi8VGkreEMd47jxKo5OA7W3u9QMORudPxanh9Iy507ndtd90wdVzoQRGAZdPAKvlO
         yEga1FiotXcFcZBw2NuIFiLi2z8BwTY/HP+plonHnj9OmJhc6a+SFj4pElGN+dHKPX8P
         7J/jpWOJ2cuSFYQrdnl3jf3etGf0Kix0vwhI6jS5wfT4nReLw/VZitqDu5XVf1FAABSR
         Mqd/O4Lzn/NfUlJuAwJx9b26rWTyZbuuwwVslFjELKplWPNAC72v/5RiYvZGi4FtxA2y
         eGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6NBC/2HfW/ogu7n3TATTIVAkLwys48USxuavdHJjtqqBHbMlC2PEgaOndZKOlMq4u5x4WrpjOqAUaBGOw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LodoXHvCzE4J0lUC5KxAP3npVvboqjBbdNxihYpvcR+Mm6Lo
	4BtJEpJATLQMyPURqLjZ8+/ziAHi0rxzE4ltAAZV7hAkfOH5TAUSpMb9vmyb452aBSOPVqpNL3X
	hz05TQEfUTndtzAg85RsPuJ8aGc7O8iOOjbjAMS6WcRXLtBgeT6OYMlmCCQwQNtCAidp28AFjm3
	laJHWwXoIJrNW+OiPzGozo47Q97FSK7+O4kC8dMUlaQQU=
X-Gm-Gg: AZuq6aLoWAY/iaJ4xWg/xT81G9hJR+dpnMSAwNKdYJyiHe88zxo8w/BH3VQi7eiq28Q
	9x8OOFu4U8/r4Lewa+zlldxpP1mYLsThYsxBW/Eef7aApRIOclNrBnl7uk3Q2NFjYjUNnyj4kMK
	ITBh7LQbOxErrtnmU5scE7Ey52PxsVKlAzT7m4/WIqpQQsBMVZG6TnIdWsam9Dv5oNOXahlatkv
	lhkzVQwb2h+yBBojqOBzDq94qg=
X-Received: by 2002:a05:620a:4005:b0:8c7:1271:f336 with SMTP id af79cd13be357-8ca40b65b93mr362710585a.2.1770300509956;
        Thu, 05 Feb 2026 06:08:29 -0800 (PST)
X-Received: by 2002:a05:620a:4005:b0:8c7:1271:f336 with SMTP id
 af79cd13be357-8ca40b65b93mr362701185a.2.1770300509158; Thu, 05 Feb 2026
 06:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-eth_vdev_next-20260204_eth-v7-0-f85645210f81@qti.qualcomm.com>
 <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
In-Reply-To: <20260205-eth_vdev_next-20260204_eth-v7-1-f85645210f81@qti.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 15:08:16 +0100
X-Gm-Features: AZwV_QhQg3zAGXsp_X9dDCu7sweoDhvjW4gtGrMn8QDgLlXYaIhuuEdmBlb6JyU
Message-ID: <CAFEp6-0Q7Cy9d5=ZEsct3Y2G3C2w_47CM0FxYsE6YkdksrKhcw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] net: mhi: Enable Ethernet interface support
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vpernami@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984a45f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=V8gMpkdfN-3uPoaNsyEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEwNiBTYWx0ZWRfX+ea8eVL3UnM7
 1VdYpjFgrMrQRNOJ7UYRuiR/4Qw14JIk7QhO26ekVmFLHvjgRDw09Rwx/4Mf2TS219hHI0yVMyq
 haBW5pAZUK9sNLHFdMd+KdOKW++TiZ2nRb+Do73s4uj7aiDfZDVeeBrjCPfrV7BYLb+eCiXvjAI
 eDBTIHzj5sNNhaSN0M6iZHhF1g+kqL4JP0u166pQO+Y0KemX8ui/YjBfqI7MfyWrgph5rGqrLGR
 kwiIpyB1cl89nHeEf3iPMgF8Cn+JniRRmlNMEjudKzWLso/AylsAwtpF8iMB2bnvCzY/z51+EdD
 PLqBIEk/ei1JKX3DarHB6Jv5kCyE53VhBM39jecgYpRnPzL/jddFnMMtwrYWmSzcwXy/1J9qD7z
 DtST6IBSIOcrKX1rBiamPmnOBHtIe0wnU6Yj5/bsXTNaAGhs5Gibt773++di91sZEaLo6lgeSHX
 grOVc5P4Eeyz1OxevJw==
X-Proofpoint-ORIG-GUID: O-h51xP_w07bBjMI1IdFt6vME9lh0lrQ
X-Proofpoint-GUID: O-h51xP_w07bBjMI1IdFt6vME9lh0lrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91934-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 1F2C2F3CD9
X-Rspamd-Action: no action

Hi Vivek,

On Thu, Feb 5, 2026 at 11:35=E2=80=AFAM Vivek Pernamitta
<vivek.pernamitta@oss.qualcomm.com> wrote:
>
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
>
> Add support to configure a new client as Ethernet type over MHI by
> setting "mhi_device_info.ethernet_if =3D true". Create a new Ethernet
> interface named eth%d. This complements existing NET driver support.
>
> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
> M-plane, NETCONF, and S-plane components.
>
> M-plane:
> Implement DU M-Plane software for non-real-time O-RAN management
> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
> models. Provide capability exchange, configuration management,
> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
> R004-v18.00.
>
> NETCONF:
> Use NETCONF protocol for configuration operations such as fetching,
> modifying, and deleting network device configurations.
>
> S-plane:
> Support frequency and time synchronization between O-DUs and O-RUs
> using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
> L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
> UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
> O-RAN.WG4.CUS.0-R003-v12.00.
>
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 75 ++++++++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 62 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..fbec10c1ba9faf1ccf049b808=
e9d391800320989 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>
> +#include <linux/etherdevice.h>
>  #include <linux/if_arp.h>
>  #include <linux/mhi.h>
>  #include <linux/mod_devicetable.h>
> @@ -38,10 +39,12 @@ struct mhi_net_dev {
>         u32 rx_queue_sz;
>         int msg_enable;
>         unsigned int mru;
> +       bool ethernet_if;
>  };
>
>  struct mhi_device_info {
>         const char *netname;
> +       bool ethernet_if;
>  };
>
>  static int mhi_ndo_open(struct net_device *ndev)
> @@ -119,11 +122,29 @@ static void mhi_ndo_get_stats64(struct net_device *=
ndev,
>         } while (u64_stats_fetch_retry(&mhi_netdev->stats.tx_syncp, start=
));
>  }
>
> +static int mhi_mac_address(struct net_device *dev, void *p)
> +{
> +       if (dev->type =3D=3D ARPHRD_ETHER)
> +               return eth_mac_addr(dev, p);
> +
> +       return 0;
> +}
> +
> +static int mhi_validate_address(struct net_device *dev)
> +{
> +       if (dev->type =3D=3D ARPHRD_ETHER)
> +               return eth_validate_addr(dev);
> +
> +       return 0;
> +}
> +
>  static const struct net_device_ops mhi_netdev_ops =3D {
>         .ndo_open               =3D mhi_ndo_open,
>         .ndo_stop               =3D mhi_ndo_stop,
>         .ndo_start_xmit         =3D mhi_ndo_xmit,
>         .ndo_get_stats64        =3D mhi_ndo_get_stats64,
> +       .ndo_set_mac_address    =3D mhi_mac_address,
> +       .ndo_validate_addr      =3D mhi_validate_address,
>  };
>
>  static void mhi_net_setup(struct net_device *ndev)
> @@ -140,6 +161,13 @@ static void mhi_net_setup(struct net_device *ndev)
>         ndev->tx_queue_len =3D 1000;
>  }
>
> +static void mhi_ethernet_setup(struct net_device *ndev)
> +{
> +       ndev->netdev_ops =3D &mhi_netdev_ops;
> +       ether_setup(ndev);
> +       ndev->max_mtu =3D ETH_MAX_MTU;
> +}
> +
>  static struct sk_buff *mhi_net_skb_agg(struct mhi_net_dev *mhi_netdev,
>                                        struct sk_buff *skb)
>  {
> @@ -209,16 +237,22 @@ static void mhi_net_dl_callback(struct mhi_device *=
mhi_dev,
>                         mhi_netdev->skbagg_head =3D NULL;
>                 }
>
> -               switch (skb->data[0] & 0xf0) {
> -               case 0x40:
> -                       skb->protocol =3D htons(ETH_P_IP);
> -                       break;
> -               case 0x60:
> -                       skb->protocol =3D htons(ETH_P_IPV6);
> -                       break;
> -               default:
> -                       skb->protocol =3D htons(ETH_P_MAP);
> -                       break;
> +               if (mhi_netdev->ethernet_if) {
> +                       skb_copy_to_linear_data(skb, skb->data,
> +                                               mhi_res->bytes_xferd);

What is the purpose of the above?




> +                       skb->protocol =3D eth_type_trans(skb, mhi_netdev-=
>ndev);
> +               } else {
> +                       switch (skb->data[0] & 0xf0) {
> +                       case 0x40:
> +                               skb->protocol =3D htons(ETH_P_IP);
> +                               break;
> +                       case 0x60:
> +                               skb->protocol =3D htons(ETH_P_IPV6);
> +                               break;
> +                       default:
> +                               skb->protocol =3D htons(ETH_P_MAP);
> +                               break;
> +                       }
>                 }
>
>                 u64_stats_update_begin(&mhi_netdev->stats.rx_syncp);
> @@ -301,11 +335,14 @@ static void mhi_net_rx_refill_work(struct work_stru=
ct *work)
>                 schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
>  }
>
> -static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device=
 *ndev)
> +static int mhi_net_newlink(struct mhi_device *mhi_dev, struct net_device=
 *ndev, bool eth_dev)
>  {
>         struct mhi_net_dev *mhi_netdev;
>         int err;
>
> +       if (eth_dev)
> +               eth_hw_addr_random(ndev);
> +
>         mhi_netdev =3D netdev_priv(ndev);
>
>         dev_set_drvdata(&mhi_dev->dev, mhi_netdev);
> @@ -313,6 +350,7 @@ static int mhi_net_newlink(struct mhi_device *mhi_dev=
, struct net_device *ndev)
>         mhi_netdev->mdev =3D mhi_dev;
>         mhi_netdev->skbagg_head =3D NULL;
>         mhi_netdev->mru =3D mhi_dev->mhi_cntrl->mru;
> +       mhi_netdev->ethernet_if =3D eth_dev;
>
>         INIT_DELAYED_WORK(&mhi_netdev->rx_refill, mhi_net_rx_refill_work)=
;
>         u64_stats_init(&mhi_netdev->stats.rx_syncp);
> @@ -356,13 +394,14 @@ static int mhi_net_probe(struct mhi_device *mhi_dev=
,
>         int err;
>
>         ndev =3D alloc_netdev(sizeof(struct mhi_net_dev), info->netname,
> -                           NET_NAME_PREDICTABLE, mhi_net_setup);
> +                           NET_NAME_ENUM, info->ethernet_if ?
> +                           mhi_ethernet_setup : mhi_net_setup);
>         if (!ndev)
>                 return -ENOMEM;
>
>         SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>
> -       err =3D mhi_net_newlink(mhi_dev, ndev);
> +       err =3D mhi_net_newlink(mhi_dev, ndev, info->ethernet_if);
>         if (err) {
>                 free_netdev(ndev);
>                 return err;
> @@ -380,10 +419,17 @@ static void mhi_net_remove(struct mhi_device *mhi_d=
ev)
>
>  static const struct mhi_device_info mhi_hwip0 =3D {
>         .netname =3D "mhi_hwip%d",
> +       .ethernet_if =3D false,
>  };
>
>  static const struct mhi_device_info mhi_swip0 =3D {
>         .netname =3D "mhi_swip%d",
> +       .ethernet_if =3D false,
> +};
> +
> +static const struct mhi_device_info mhi_eth0 =3D {
> +       .netname =3D "eth%d",
> +       .ethernet_if =3D true,
>  };
>
>  static const struct mhi_device_id mhi_net_id_table[] =3D {
> @@ -391,6 +437,9 @@ static const struct mhi_device_id mhi_net_id_table[] =
=3D {
>         { .chan =3D "IP_HW0", .driver_data =3D (kernel_ulong_t)&mhi_hwip0=
 },
>         /* Software data PATH (to modem CPU) */
>         { .chan =3D "IP_SW0", .driver_data =3D (kernel_ulong_t)&mhi_swip0=
 },
> +       { .chan =3D "IP_SW1", .driver_data =3D (kernel_ulong_t)&mhi_swip0=
 },
> +       { .chan =3D "IP_ETH0", .driver_data =3D (kernel_ulong_t)&mhi_eth0=
 },
> +       { .chan =3D "IP_ETH1", .driver_data =3D (kernel_ulong_t)&mhi_eth0=
 },
>         {}
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);
>
> --
> 2.34.1
>
>

