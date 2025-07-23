Return-Path: <linux-arm-msm+bounces-66236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B61B0F025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE1601896B56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0EE2580F9;
	Wed, 23 Jul 2025 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmO4y5zY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8161424E4BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753267374; cv=none; b=f7G3Cd3Os+l3ixHONdRHMuaFVxSutnnrRvt+KbvV+87KqfwsO0+QtnAXcu3gPsYBBHrWxk3aT6Wr0iQV41na40qPglLNJgkH9UT0IFoqLJ8TCp//KcKeBhKsIwfo7mOg+Cmv4X02nUqoyoSh73YzlQPJLJPDyzd0FL7Hu+Hav+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753267374; c=relaxed/simple;
	bh=JKpDpZiMse2D5M9fAuVjCtrhFa064H3YLe7cVnhhXMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poYBWhtlFuiwqX33VEqUdMh23YLaxbj+E+ic9n7OlDcVRoimo7rDwoHyyaxwWo0NGWk5rewPYHtYjkiJ+wGw3Rtu48CdxoNUBOGikyd2yizzsr3Ib0jre774dw4Ot04FykbxIoGT48baPcNdnF1gEKrra72um6LQ8vkYQTC+rNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmO4y5zY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N94uWg012515
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lShYL7ZMyd/pc+FPnDTj+pUS2q913Y4tFXrMgYdQFi4=; b=BmO4y5zYqfWqfcYx
	30wMwurjal9olbK0JKUFnevj4eCMDXj25h9R2gJIqu78AM1qOQk0bR0/Ewov1OuN
	pN9ukuc+GLUZCDyhKyZ8M+LvLBIA7uGK3BLUryhrAeUyNjsSbTJE2NR7OIebW/an
	Io4TF0xwfsOo25jHTgo/urTfUDK49uXZiK2M/KGMzwXLYOAwj+SL1G9XVNydpgxq
	9AgwNV90V79z+EZg7ozTkLEcLiQT5eXhrNWcFez4oE0h2w/uk6XNuMlTNP/UXCul
	EfYuVGkZdxdNdIrBpJf+0rpoV06ksL1ByTu5BRDsTsqT4MEwb7PIDaPOTlo3t4U6
	uWJRgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na389e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 10:42:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-478f78ff9beso165747461cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 03:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753267370; x=1753872170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lShYL7ZMyd/pc+FPnDTj+pUS2q913Y4tFXrMgYdQFi4=;
        b=V4N5gYbeshYXMVurts1l9uNrfHO40MxYpk3XL5KlcLL7AqmPh43WCBNK/B9wHQeVf4
         UnwnaQPGWfADKpqr9onTHIKlPgT2QoegKaDVb6DwCof5Pfd9b9KT4wNMZwbJA3E/6djS
         FRngTppvjkdKzBUSRqZsAhkwlfY0kORh4Sql3Yx1rpY01eQB8gofLhZLG6Q9KZ+EWeVe
         fP/ODXkGwZUuvNJ0xnaiDfKBIXld5Gfd2+eykpmWbw+17VIamOXQe+/E6NEsLptB8qX3
         aAEWuU4RJ0HNYq6Xl9sIQxTLS5G6k6O6bzzMcC4o8UU6pfHy33WDZcFzVBwOxPEdBobZ
         Gc2w==
X-Forwarded-Encrypted: i=1; AJvYcCXGWzPKwV5bYTAsY3uuq4NFOLXDxmIooWnm7TDAynAjXjfZYjheaBBDbMHV/3Wsasidt0/k3AAiN365k/rs@vger.kernel.org
X-Gm-Message-State: AOJu0YyMDYF2XcH8lqbk33T34WOurdvPHn9VFp4eogpY4P/4S4CtRjp+
	JEOaw7mtPk9h/GWMTYr5g3NIUy6AxgniKVUyK+tEZN+f46Mqz/MbqONK2Oc3WTlIcr0IClbdnuP
	dSl65/Al5ikofQT0wvgQm+zvZJv/GS+RESb6lR3w809xNfFIwrWUIt8NNPk/nqdHSN6AUk8VPWA
	qXbex68I90/j4H6FiAwYY+OUPioUcxwZefBE7SII6dUNk=
X-Gm-Gg: ASbGncs7BSYHmU4yzGSrb19GMMQ8smoXYcc0px0jpS91ELSze7J9b4svVrp1qw1qZ49
	zeaiwVfZO6FhwYhIQDXGZglzTZWavk6MxUtbZX3UV3F/GztuvslTZbJURYnA0R2oA3C2qeKXCGy
	BE0igEkX0kdwnMQqom3wzDvA==
X-Received: by 2002:ac8:59c9:0:b0:4ab:76d2:1982 with SMTP id d75a77b69052e-4ae6de5f491mr31453031cf.2.1753267369766;
        Wed, 23 Jul 2025 03:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCWcR+zHzMZYaCkssZyjftuwIjbu7hjNB9Q91wbaotDw8ZV2l/gUSxM/5/yVifA/Vhu/UGwHBAadMVZfP3QKo=
X-Received: by 2002:ac8:59c9:0:b0:4ab:76d2:1982 with SMTP id
 d75a77b69052e-4ae6de5f491mr31452661cf.2.1753267369182; Wed, 23 Jul 2025
 03:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zgp0ym-MGzX2eSZdlkVYbgvjkJ0CzKItjaC5pafzQnj1AOZnVAqvCIZfYoK7nwDhUgOA0U8eNolNtaWXbExOAQ==@protonmail.internalid>
 <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org> <5df11ee4-d645-4be2-841f-715343f1b7a4@linaro.org>
 <CAFEp6-0zwy2JdFOvRQ5ghMwD-J6b7F5YcVKNf-5R=8XdEpGDSw@mail.gmail.com>
In-Reply-To: <CAFEp6-0zwy2JdFOvRQ5ghMwD-J6b7F5YcVKNf-5R=8XdEpGDSw@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:42:37 +0200
X-Gm-Features: Ac12FXxdFEfoRoEup7njhCc4_7HGosXKamXGoITcHok5gWf4sO9R5vimfHVCyZY
Message-ID: <CAFEp6-1wO9xwisOAtv6D__nb3Uo=8_f9rHifi-JAQ0oPD+JSVg@mail.gmail.com>
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: jjohnson@kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jeff.johnson@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7DvCNKj7qR8w_SYJVi9ZhYzUP_gPBshP
X-Proofpoint-ORIG-GUID: 7DvCNKj7qR8w_SYJVi9ZhYzUP_gPBshP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5MSBTYWx0ZWRfXwyjNqd2U7BPM
 OzTaBVZIxfcc2P2mTMh/WHLBJRao6bZoJecyUHvOXysoT1LVUQUe1aajdVz92WLQpiDkgRBE5Po
 DsLoEPy8DjH7Gj2uqY9p5eXZStVyxQUdl3iD2IXFMLk5m92mizA7Y3133gC9rUsKsdzDDB0WZSW
 d6XmXDdn1t/QQRUwSE3CwVuLEM8PUlTqH72g2s1MFUAy+pY9R3P75ZJwTEt2fimQrMeB40kKdaB
 CRaWYq4Otva1G/4rm2ckSBrnwJ//l70dzGKpEQSbf+yEtTPkssXGfjHNjRdS33RX6pG2PYLQlnE
 OefB2tptMIWAt3PEgHzQZ/sp4rGJK3gxkfMRCM6n2VFSTE44X0+PxYJmSk04SGdZj7sumW2j0OU
 531rxkBBcuV/YVMsUc7SHeTtTeAg3+HkdgaGYTRKJwe1lXPMZcFSoSOVffQIIAOVKRlpCZ/U
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880bcab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=mUlqW7PtAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=kilpmZN9Kjp5B5WS9hoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=scG1X_LE5o0Lo5M-1hNW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230091

Hi Alexey,

On Tue, Jul 22, 2025 at 5:53=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Fri, Jun 27, 2025 at 1:09=E2=80=AFAM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > On 26/06/2025 15:48, Alexey Klimov wrote:
> > > Hi all,
> > >
> > > After a long time of testing it seems the problem narrows down to qrb=
2210 rb1
> > > and qrb4210 rb2 boards.
> > >
> > > After booting, the board connects to the wifi network and after aroun=
d ~5-10
> > > minutes it loses the connection (nothing in dmesg). A simple ping of =
another
> > > machine on the local network doesn't work. After, I guess, around 500=
0
> > > seconds the GROUP_KEY_HANDSHAKE_TIMEOUT message is printked:
> > >
> > > [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason:=
 16=3DGROUP_KEY_HANDSHAKE_TIMEOUT)
> > > [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local addr=
ess=3D82:95:77:b1:05:a5)
> > > [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> > > [ 5067.100192] wlan0: authenticated
> > > [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> > > [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x=
11 status=3D0 aid=3D2)
> > > [ 5067.193624] wlan0: associated
> > >
> > > and after that wireless connection works for ~5-10 minutes and then t=
he cycle
> > > repeats. The longer log with more info and some info with firmware ve=
rsions,
> > > ids, etc is at the end of this email [1]. Simple wlan0 down and wlan0=
 up fixes
> > > things for a few minutes.
> > >
> > > iw wlan0 link reports the following when wireless network is working:
> > >
> > > root@rb1:~# iw wlan0 link
> > > Connected to 8c:58:72:d4:d1:8d (on wlan0)
> > >          SSID: void
> > >          freq: 5300
> > >          RX: 45802 bytes (424 packets)
> > >          TX: 71260 bytes (125 packets)
> > >          signal: -66 dBm
> > >          rx bitrate: 433.3 MBit/s VHT-MCS 9 80MHz short GI VHT-NSS 1
> > >
> > > bss flags:      short-slot-time
> > > dtim period:    1
> > > beacon int:     100
> > >
> > > and this when wireless connection doesn't work:
> > >
> > > Connected to 8c:58:72:d4:d1:8d (on wlan0)
> > >          SSID: void
> > >          freq: 5300
> > >          RX: 850615 bytes (9623 packets)
> > >          TX: 20372 bytes (247 packets)
> > >          signal: -61 dBm
> > >          rx bitrate: 6.0 MBit/s
> > >
> > >      bss flags:      short-slot-time
> > >      dtim period:    1
> > >      beacon int:     100
> > >
> > > This was tested with three different routers and different wifi netwo=
rks.
> > > Other devices here do not exhibit this behaviour.
> > >
> > > Any hints on how to debug this? Any debug switches I can toggle to de=
bug this?
> > > I am happy to provide more info or test changes/patches if any.
> > >
> > > Thanks in advance.
> > > Best regards,
> > > Alexey
> > >
> > > [1]:
> > >
> > > [    7.758934] ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_famil=
y 0x4007 board_id 0xff soc_id 0x40670000
> > > [    7.769740] ath10k_snoc c800000.wifi: qmi fw_version 0x337703a3 fw=
_build_timestamp 2023-10-14 01:26 fw_build_id QC_IMAGE_VERSION_STRING=3DWLA=
N.HL.3.3.7.c2-00931-QCAHLSWMTPLZ-1
> > > [   11.086123] ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000=
008 chip_id 0x00000000 sub 0000:0000
> > > [   11.095622] ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tr=
acing 0 dfs 0 testmode 0
> > > [   11.103998] ath10k_snoc c800000.wifi: firmware ver  api 5 features=
 wowlan,mgmt-tx-by-reference,non-bmi,single-chan-info-per-channel crc32 a79=
c5b24
> > > [   11.144810] ath10k_snoc c800000.wifi: htt-ver 3.128 wmi-op 4 htt-o=
p 3 cal file max-sta 32 raw 0 hwcrypto 1
> > > [   11.230894] ath10k_snoc c800000.wifi: invalid MAC address; choosin=
g random
> > > [   11.238128] ath: EEPROM regdomain: 0x0
> > > [   11.242060] ath: EEPROM indicates default country code should be u=
sed
> > > [   11.248582] ath: doing EEPROM country->regdmn map search
> > > [   11.253950] ath: country maps to regdmn code: 0x3a
> > > [   11.258805] ath: Country alpha2 being used: US
> > > [   11.263466] ath: Regpair used: 0x3a
> > > [   15.355756] wlan0: authenticate with 8c:58:72:d4:d1:8d (local addr=
ess=3D82:95:77:b1:05:a5)
> > > [   15.363942] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> > > [   15.372142] wlan0: authenticated
> > > [   15.377928] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> > > [   15.386338] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x=
11 status=3D0 aid=3D2)
> > > [   15.466514] wlan0: associated
> > > [   23.167251] systemd-journald[195]: Oldest entry in /var/log/journa=
l/ec3e0078e5e0499bac67949f3edf3fcf/system.journal is older than the configu=
red file retention duration (1month), suggesting rotation.
> > > [   23.185186] systemd-journald[195]: /var/log/journal/ec3e0078e5e049=
9bac67949f3edf3fcf/system.journal: Journal header limits reached or header =
out-of-date, rotating.
> > > [   31.750177] l5: disabling
> > > [   31.753382] l11: disabling
> > > [   31.756385] l16: disabling
> > > [ 5064.093748] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason:=
 16=3DGROUP_KEY_HANDSHAKE_TIMEOUT)
> >
> > So.
> >
> > I wonder what state the GTK - offload is in here.
> >
> >          WMI_GTK_OFFLOAD_CMDID =3D WMI_CMD_GRP(WMI_GRP_GTK_OFL),
> >
> > drivers/net/wireless/ath/ath10k/wmi-tlv.c:      cfg->gtk_offload_max_vd=
ev =3D
> > __cpu_to_le32(2);
> >
> > Try toggling that offload off or on and see what happens.
> >
> > > [ 5067.083790] wlan0: authenticate with 8c:58:72:d4:d1:8d (local addr=
ess=3D82:95:77:b1:05:a5)
> > > [ 5067.091971] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> > > [ 5067.100192] wlan0: authenticated
> > > [ 5067.104734] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> > > [ 5067.113230] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x=
11 status=3D0 aid=3D2)
> > > [ 5067.193624] wlan0: associated
> > > [10437.346541] wlan0: deauthenticated from 8c:58:72:d4:d1:8d (Reason:=
 16=3DGROUP_KEY_HANDSHAKE_TIMEOUT)
> > > [10440.340111] wlan0: authenticate with 8c:58:72:d4:d1:8d (local addr=
ess=3D82:95:77:b1:05:a5)
> > > [10440.348408] wlan0: send auth to 8c:58:72:d4:d1:8d (try 1/3)
> > > [10440.356698] wlan0: authenticated
> > > [10440.361077] wlan0: associate with 8c:58:72:d4:d1:8d (try 1/3)
> > > [10440.369516] wlan0: RX AssocResp from 8c:58:72:d4:d1:8d (capab=3D0x=
11 status=3D0 aid=3D2)
> > > [10440.446661] wlan0: associated
> > >
> > You can put another device on your WiFi network into monitor mode and
> > sniff what is taking place.
> >
> > Kali Linux I've used in the past on an RPI for this purpose and it was
> > very easy todo.
> >
> > https://cyberlab.pacific.edu/resources/lab-network-wireless-sniffing
> >
> > Another thing to try is to do this same test on an open - unencrypted l=
ink.
> >
> > If we really suspect firmware here, lets try switching off firmware
> > offload features one-by-one, starting with GTK offload.
> >
> > ---
> > bod
> >
>
> I configured the GTK rekey interval to one minute and encountered a
> similar issue. It appears that something may be going wrong after the
> GTK rekeying process completes.
>
> The GTK update is handled entirely by wpa_supplicant (not offloaded),
> and while the new key seems to be installed correctly, with frames
> still being transmitted and received (from aircap perspective), they
> appear to be dropped or mishandled in the RX firmware path.
>
> This suggests there might be an issue with how the new keys are being
> applied or interpreted by the firmware. I=E2=80=99ll continue debugging t=
o
> pinpoint the root cause.
>
> Regards,
> Loic

Could you check if this change helps:

diff --git a/drivers/net/wireless/ath/ath10k/mac.c
b/drivers/net/wireless/ath/ath10k/mac.c
index c61b95a928da..4fa7dd62aeac 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -288,8 +288,10 @@ static int ath10k_send_key(struct ath10k_vif *arvif,
                key->flags |=3D IEEE80211_KEY_FLAG_GENERATE_IV;

        if (cmd =3D=3D DISABLE_KEY) {
-               arg.key_cipher =3D ar->wmi_key_cipher[WMI_CIPHER_NONE];
-               arg.key_data =3D NULL;
+               /*  Not all hardware supports key deletion operations. so w=
e
+                *  replace the key with a junk value to invalidate it.
+                */
+               memset(arg.key_data, 0, arg.key_len);
        }

Regards,
Loic

