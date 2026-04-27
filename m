Return-Path: <linux-arm-msm+bounces-104699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEo5LAlD72lP/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:05:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A4C471795
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 13:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5994E3013B43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EF13B6BEC;
	Mon, 27 Apr 2026 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pztrsW4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUBQJhGz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0FC3B5842
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287635; cv=pass; b=Nt+HjxdDH6x/i4e6HHP12Afl9wX03jFFcUSzWlBxxAbYThWBkyf1MOp8gM3/APQ1FG8frHX6ETJgO2ub56urP9BglDV0n6gd0+UZ4rBrbkFXC+9zCvjbarostxYp+AwzFQqPbbhLQVv/3LdyKjBSnEN/LzTaki5CG3oRaEiM+Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287635; c=relaxed/simple;
	bh=Co1q/Eu/gzTPkSEXZxSaqGiYtH1RA+n4y0rGxJeiOa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+5G6SQoGA9288sPuI7tmQkFUoYxJE3GBRdz4y0pr4DPCH1kXFG2OGIKuOM8LvbDabHk3l7ryaht35TSL/tgdwft4qbxmhkx+iGbvgGTEaby8yELIJ5EKUrCW1HwSYtnNUogOnFr1smeMBvjgtgzPYdqbWQUgP7rJj+8w9S0ptE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pztrsW4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUBQJhGz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCuJ1501589
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5U/yrL8PQSDEVwiEtEAPGtFnPQyAwz2ZefbjQjz7/Qc=; b=pztrsW4P6fGzKpky
	cVlcnyLSl+Jb/lPtU9A0FakitFYUyc6JiNYu2nQWmg/hnYFtI6145r0YBaJkT4Sq
	ykd9DMTFpCApSsKymQEo7swvKVcqBno8LPnzGU1QV3SUksgW+YVzri3MyVUrrlx9
	MuFGCPBmBTce58cTKZutv2qPvCyDz9VMfc1ooNwEmMr4VfYJkNnh2vbvZMmf7goA
	TVqNnvpkTpsyhNN/JtLCvXl5t2FfHs8qL0kEtiP1xMg2nThbbNAzG0cl3039Pvyg
	BhfkEr1PO8zwbAQ62RjVHDT1h/TzxUoLo0XwTyk7U9LBfu0KEdzuOl6mGCvuyHmB
	sI0+2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnr9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:00:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb9f8bbbb3so1431335785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 04:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777287630; cv=none;
        d=google.com; s=arc-20240605;
        b=SSnr2+BZHq87A3tuy+cpcaN67QFGgLB5SQelfZAVeSosf4gO3izYSqsmF42VxLRf13
         uqER03t/SqJylIQujet5i4kbEk+jpyB9KJmsA1ihRynpFjZD2GywU7QhV7wNgIK9AbkR
         4cpGcqGdZKnYL3IRuUPYhickPF5i4kkgXaNCzJi8Ii6hbHh7GzYi4NpHNSbeXsjnsewK
         xkQaofzZ14bLEEGlKcdyvsAkR3+MGWcu62TZpniQ24fwH0VvTpUUHgGbGmB5Yj13oS5q
         u/iiGxBE/iJYFzy/XfwY+Nt9cP1VC4VbRaxeze7zXkVzOphg0D/Fe31mTzlTxOQqJ/Vc
         wkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5U/yrL8PQSDEVwiEtEAPGtFnPQyAwz2ZefbjQjz7/Qc=;
        fh=Df4IYnn7/ql8ZnRWYdfRjBwuGPLQl0yX/NOK9y3IVPA=;
        b=lxYW7S7/N5pAIjlDXiiyW4AavQLDn+LxWC73R/dW1ItF50sThCEZarWbss1kmRkE1r
         q1cyf4zNpLm++bm8D6RY1R+hJdqRGeJ94m6btFMqH2B+5KZNHfiU5zCWk/7rpjdZSrv5
         quj/1BPj35LSp3C+JXo+lGqvxQN86X7aN6ljjKu0q5DeF2dd7S0stJZvCKMAGetIQhXG
         HluFIEpDRhdGnbeluYfimBOte0Eip1weL9nZvXoaFDJ0vqroJ8Y2gjFy8UoFDb3sTu6W
         8DktwriuXEXXpn7BLx+5H80zYKrflhuaAVGs0+WFPLbULLrABCCzB8i+QWngGnbW+z/M
         nKGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777287630; x=1777892430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U/yrL8PQSDEVwiEtEAPGtFnPQyAwz2ZefbjQjz7/Qc=;
        b=hUBQJhGzQ9Z8rKlz6odeaCeJVKW/7BSryn/0362+RAIAbwjHAPrun8ecVW/qKjgpcq
         13qcXXn40vehfdwYnQr/uLUoqGKV9r/YcmahR2brkCVOC+1hIOHbFFZpbad3cyvQGAGM
         xTmEvMOCGx/2eDi6gQsszfuiYnyOf4HtZmkLxS9PbReUEzuyjQsSMl8QgBJGSDBrYESH
         lmOi0MxZnCaDUjQ9X/fFNI8dSEJY96WpyjudJ5mBQ29CpIDF1RGcjErjddsNXB/8mC7A
         oPS43AuXShlERRE567DkWARFfHIpMjHbqiFaCwOdPJp1gKDB/ktYwouii4lbGke66wBx
         melA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287630; x=1777892430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5U/yrL8PQSDEVwiEtEAPGtFnPQyAwz2ZefbjQjz7/Qc=;
        b=kiIOXNtGvvmwdAE7VU7AO+znEcfRhZ1ajdDBTmqL6ewNiai3yQYsHEAHuAqCrQw8c5
         WWg4vg+HS2LMN5DA20sIBtdOr41/LG6hTG7lOe3Mb6mrDq+FWvW8B9F0EEJ1LA0VzRpB
         Xbh93qbbEMKLnJ71IYIb4UBAVRYw6hf87K1KoqenihnEJdNTvXFa2vvDVVrcQQls+xPe
         dX6rDz6eZ3ibuldXugVWRE5z7girMJtDirTjNX7NLNY7GobCcuLMCk74E5n5Ixfr4JPy
         UVnr3jzFX6KNPGf4zvjjrhcaZMZ+01esgNYSO8vYlpU8yY/H92ODDgyv8ATcVrftPCWN
         yh1A==
X-Forwarded-Encrypted: i=1; AFNElJ+Z0nvH7Cd+OF/jaJ2NL7tAJph9zIw2DND1ARaCN15/mqaWWDqRikZ229l6cAJSTYOSQumza59QjqKC+fzL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1H85cTCJW5S81IKhGF/eingI72nlJGnIn2r8kEtuIoPMLCyap
	wNbI7VxECwncB1d3jffKKoWR2e89z++Oc8/J7/MPJQpMvjabQ/3y7ZDBIZ1btWG8zRgVCF+78yr
	JkBfE/+/VoT3zZQe8Tg6VGgSIZudH2jBIEBJxYbZCJW7HhzGQ86XKlkC21ajz4dbw9H49IYbpqS
	FJS49mn4dmO5JRDcKrFo19TDbGwcmV9Qod+bTuxLQ3BaU=
X-Gm-Gg: AeBDietWnNAOUCPV5twBFUpd7RIzv1BS9OLP921N9HLS+dZSqJNP2T/yICTqKMhND/p
	MI5y5ES4k7CR0TWAPxYQkosSwf6o+51BivUQw0BapWLZ4WumE1KGSDpVrr9KSubl0qPsQfmz7YJ
	kFcGQfjGfUaUt/CwXSOMTqVT0mwSjez7k6gMK9vJ8h0aQffW69SXV9ml3elcxLm5U5/3OYvcG+w
	XNg9wZgQC9OZk14QPk=
X-Received: by 2002:a05:6214:76c:b0:8ac:b0d8:65f2 with SMTP id 6a1803df08f44-8b028744091mr605817316d6.19.1777287629951;
        Mon, 27 Apr 2026 04:00:29 -0700 (PDT)
X-Received: by 2002:a05:6214:76c:b0:8ac:b0d8:65f2 with SMTP id
 6a1803df08f44-8b028744091mr605816376d6.19.1777287629447; Mon, 27 Apr 2026
 04:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
 <5l46jjjywvg2gtkrmazswyprj4vqlwbo54jpbnuh7scc6clesg@zxsnca6uzbev>
 <CAHz4bYv_gyCU0sPi1RCrB7=x1noW6+QCFuuCXgAXymbTsWgwQA@mail.gmail.com> <6ijpvrd7mm5c6zsvogzm6uwsxpwqugur7oles5i55cqyage2hd@rig24poqt27g>
In-Reply-To: <6ijpvrd7mm5c6zsvogzm6uwsxpwqugur7oles5i55cqyage2hd@rig24poqt27g>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:30:17 +0530
X-Gm-Features: AVHnY4K9fahHNQIgQDMhV1d9OA5xtaARTgEmBUpyZdT9H1-ztzhZB-aIxHLz41M
Message-ID: <CAHz4bYs6X2B-fsS1o4B4UgOab0Lqz4mTZOTKGoiFThxfaLEFSg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNiBTYWx0ZWRfXx0808e0J6/sC
 3g2smb26SA75vTEZngXtG0F+wRiPNiPjP9pQj3/LXtSN/kmI5UYUcC4MVgKiG6y0holp7wwQqUu
 2O/P6I82oBThLQ8phpudeZ1MOPmNPT1B7pAxkh6m6qUoKbOiJwyJFC+xEFt1w/wceTI8XeRvVP+
 IEoh5yTFBINGOLlAnyStOcnm40FBDPvsWJtM/+wzDCvLJkSsxuh2e2RerhAZHnNw4goBva4uf3f
 N0D6MFFaEu6j3oQ5bil5zrIGaUfoClr4HRSQR/4fijgglXmaSKdcVuGhLhPVK+mh4aPgHc7RJyr
 AXGEfTmB2uWUpXDXeCTKwdqggn6PjTZIV/1/uCNrZ/cMfqLgRZAv5pFUfCaQF4//A8eCTew8NNZ
 hkWrdUK9bZxEX/gSQArGHYYMFDS/cIcrz0p7avOCa0n6gNtkIwMbMqSUKWQtA0RqKYJ51zF1UAc
 Y2qvBg3v6tZY3HiC+zw==
X-Proofpoint-ORIG-GUID: brAzmeWP_76_SiZxX805bS82Kzy-YyLw
X-Proofpoint-GUID: brAzmeWP_76_SiZxX805bS82Kzy-YyLw
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef41ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=tR5ujEc8VL9NYh0UqXcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270116
X-Rspamd-Queue-Id: 24A4C471795
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104699-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,f100000:email,0.0.0.2:email,qualcomm.com:dkim,qualcomm.com:email,0.0.0.1:email,oss.qualcomm.com:dkim]

On Thu, Apr 23, 2026 at 1:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Apr 22, 2026 at 12:45:22PM +0530, Swati Agarwal wrote:
> > On Sat, Apr 18, 2026 at 4:10=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Fri, Apr 17, 2026 at 08:50:14PM +0530, Swati Agarwal wrote:
> > > > Enable primary USB controller in host mode on monaco EVK Platform.
> > > >
> > > > Primary USB controller is connected to a Genesys Logic USB HUB GL35=
90
> > > > having 4 ports. The ports of hub that are present on lemans EVK sta=
ndalone
> > > > board are used as follows:-
> > > > 1) port-1 is connected to HD3SS3220 Type-C port controller.
> > > > 2) port-4 is used for the M.2 E key on corekit. Standard core kit u=
ses UART
> > > > for Bluetooth. This port is to be used only if user optionally repl=
aces the
> > > > WiFi card with the NFA765 chip which uses USB for Bluetooth.
> > > >
> > > > Remaining 2 ports will become functional when the interface plus me=
zzanine
> > > > board is stacked on top of corekit:
> > > >
> > > > 3) port-2 is connected to another hub which is present on the mezz =
through
> > > > which 4 type-A ports are connected.
> > > > 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
> > > > connected.
> > > >
> > > > Primary USB Controller
> > > >           =E2=86=93
> > > > GL3590 USB Hub (4 ports)
> > > >     |
> > > >     |-- Port 1 =E2=86=92 HD3SS3220 Type=E2=80=91C Port Controller =
=E2=86=92 USB=E2=80=91C Connector
> > > >     |
> > > >     |-- Port 2 =E2=86=92 Mezzanine USB Hub (when mezz attached)
> > > >     |
> > > >     |-- Port 3 =E2=86=92 M.2 B=E2=80=91Key Slot (when mezz attached=
)
> > > >     |
> > > >     |-- Port 4 =E2=86=92 M.2 E=E2=80=91Key Slot
> > > >                          (Default: BT via UART;
> > > >                           USB only if NFA765 module is installed)
> > > >
> > > > Mark the primary USB controller as host only capable and add the HD=
3SS3220
> > > > Type-C port controller along with Type-c connector for controlling =
vbus
> > > > supply.
> > > >
> > > > In hardware, there are dip switches provided to operate between USB=
1 port 0
> > > > and port 1 for primary Type-C USB controller. By default, switches =
will be
> > > > off operating at USB0 port. After bootup to HLOS, it will be operat=
ed in
> > > > USB1 port.
> > >
> > > Why did you choose this configuration?
> > Hi Dmitry,
> >
> > Thanks for the review.
> >
> > This configuration follows the Monaco RB4 hardware design and intended
> > usage model:
> >
> > The primary USB controller (USB1) exposes two Type=E2=80=91C ports: USB=
0 and USB1.
> >
> > USB0 is intended exclusively for software download and recovery use
> > cases (EDL, ramdump, fastboot).
> > USB1 is intended for normal runtime operation after booting into HLOS.
> >
> > The hardware provides DIP switches to select between USB0 and USB1 for
> > the primary controller. These switches default to the USB0 position to
> > support software download mode.
> >
> > To avoid manual intervention, the board also provides GPIO=E2=80=91cont=
rolled
> > equivalents of these DIP switches. After booting into HLOS, software
> > switches the configuration to USB1, which is the intended runtime
> > port.
>
> I assume this behaviour is documented in the board documentation?
Yes, its documented.
>
> My main concern is that with this approach it is not possible to enforce
> any other mode of operation, even if the user wants to keep USB0 to
> continue to function even after booting.
Yes since USB0 is non-functional when boot to HLOS. Only USB2 will be
used in OTG mode.
>
> >
> > The external USB hub (Genesys Logic GL3590) connected to USB1 is held
> > in reset during download mode and is enabled only after the system
> > transitions to runtime mode via software=E2=80=91controlled GPIOs.
> >
> > In normal operation:
> >
> > The secondary USB controller (Micro=E2=80=91USB / USB2) is used for ADB=
.
> > USB0 of the primary controller is reserved for recovery and debug use c=
ases.
> > USB1 of the primary controller operates in host=E2=80=91only mode to su=
pport
> > downstream devices via the USB hub.
>
> Is the USB0 suitable for OTG? Is it possible to connect USB devices to
> that port or is it peripheral-only?
USB0 is non functional when boot to HLOS.
Regards,
Swati
>
> >
> > This setup ensures reliable access to download and recovery paths
> > while allowing the runtime USB topology to be switched automatically
> > by software in accordance with the board design.
> >
> > >
> > > > @@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
> > > >               bias-pull-up;
> > > >       };
> > > >
> > > > +     usb1_hub_reset: usb1-hub-reset-state {
> > > > +             pins =3D "gpio7";
> > > > +             function =3D "gpio";
> > > > +             output-enable;
> > > > +             output-high;
> > > > +             bias-disable;
> > > > +     };
> > > > +
> > > > +     usb1_id: usb1-id-state {
> > > > +             pins =3D "gpio13";
> > > > +             function =3D "gpio";
> > > > +             bias-pull-up;
> > > > +     };
> > > > +
> > > > +     usb1_hs_sel_switch: usb1-hs-sel-switch-state {
> > > > +             pins =3D "gpio14";
> > > > +             function =3D "gpio";
> > > > +             output-enable;
> > > > +             output-high;
> > > > +             bias-disable;
> > > > +     };
> > >
> > > Why do you use gpio-hog for SS switch, but then you use pinctrl for H=
S
> > > switch?
> > Initially, I attempted to model both HS and SS select signals (as well
> > as the USB hub reset) uniformly using gpio-hog.
> >
> > gpio7_hog: gpio7-hog {
> > gpio-hog;
> > gpios =3D <7 GPIO_ACTIVE_HIGH>;
> > output-high;
> > line-name =3D "bootup-high-gpio7";
> > };
> >
> > gpio14_hog: gpio14-hog {
> > gpio-hog;
> > gpios =3D <14 GPIO_ACTIVE_HIGH>;
> > output-high;
> > line-name =3D "usb1-hs-high-gpio14";
> > };
> >
> > However, placing gpio-hog nodes for HS select and hub reset under the
> > TLMM node caused dtbs_check failures, This resulted in schema errors
> > such as:
> >
> > make LLVM=3D-15 ARCH=3Darm64 -j99 CHECK_DTBS=3D1 qcom/monaco-evk.dtb
> >   DTC [C] arch/arm64/boot/dts/qcom/monaco-evk.dtb
> > /local/mnt/workspace/swatagar/upstream/linux-next/arch/arm64/boot/dts/q=
com/monaco-evk.dtb:
> > pinctrl@f100000 (qcom,qcs8300-tlmm): Unevaluated properties are not
> > allowed ('gpio14-hog', 'gpio7-hog' were unexpected)
> >         from schema $id:
> > http://devicetree.org/schemas/pinctrl/qcom,qcs8300-tlmm.yaml
>
> See how it's handled in the qcom,sdm845-tlmm.yaml and patch the bindings
> accordingly (ideally move it to qcom,tlmm-common.yaml).
>
> >
> > To resolve this in a binding=E2=80=91compliant way:
> >
> > HS select and USB hub reset GPIOs, which are TLMM=E2=80=91controlled So=
C pins,
> > are configured using pinctrl, which is the supported and
> > schema=E2=80=91compliant mechanism for TLMM.
> > The SS select GPIO resides on a TCA9538 GPIO expander, which does not
> > support pinctrl. For this signal, gpio-hog is a binding=E2=80=91complia=
nt
> > mechanism.
> >
> >
> > Regards,
> > Swati
> > >
> > > > +
> > > >       expander1_int: expander1-int-state {
> > > >               pins =3D "gpio16";
> > > >               function =3D "gpio";
> > > > @@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
> > > >               bias-pull-up;
> > > >       };
> > > >
> > > > +     usb1_intr: usb1-intr-state {
> > > > +             pins =3D "gpio45";
> > > > +             function =3D "gpio";
> > > > +             bias-pull-up;
> > > > +     };
> > > > +
> > > >       expander6_int:  expander6-int-state {
> > > >               pins =3D "gpio52";
> > > >               function =3D "gpio";
> > > > @@ -863,9 +971,72 @@ &ufs_mem_phy {
> > > >  };
> > > >
> > > >  &usb_1 {
> > > > -     dr_mode =3D "peripheral";
> > > > +     dr_mode =3D "host";
> > > > +
> > > > +     #address-cells =3D <1>;
> > > > +     #size-cells =3D <0>;
> > > > +
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&usb1_hub_reset &usb1_hs_sel_switch>;
> > > >
> > > >       status =3D "okay";
> > > > +
> > > > +     usb_hub_2_x: hub@1 {
> > > > +             compatible =3D "usb5e3,610";
> > > > +             reg =3D <1>;
> > > > +
> > > > +             peer-hub =3D <&usb_hub_3_x>;
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@1 {
> > > > +                             reg =3D <1>;
> > > > +
> > > > +                             usb_hub_2_1: endpoint {
> > > > +                                     remote-endpoint =3D <&usb1_co=
n_hs_ep>;
> > > > +                             };
> > > > +                     };
> > > > +
> > > > +                     /*
> > > > +                      * Port-4 is connected to M.2 E key connector=
 on corekit.
> > > > +                      */
> > > > +                     port@4 {
> > > > +                             reg =3D <4>;
> > > > +
> > > > +                             usb_hub_2_4: endpoint {
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +     };
> > > > +
> > > > +     usb_hub_3_x: hub@2 {
> > > > +             compatible =3D "usb5e3,625";
> > > > +             reg =3D <2>;
> > > > +
> > > > +             peer-hub =3D <&usb_hub_2_x>;
> > > > +
> > > > +             ports {
> > > > +                     #address-cells =3D <1>;
> > > > +                     #size-cells =3D <0>;
> > > > +
> > > > +                     port@1 {
> > > > +                             reg =3D <1>;
> > > > +
> > > > +                             usb_hub_3_1: endpoint {
> > > > +                                     remote-endpoint =3D <&hd3ss32=
20_1_out_ep>;
> > > > +                             };
> > > > +                     };
> > > > +
> > > > +                     port@4 {
> > > > +                             reg =3D <4>;
> > > > +
> > > > +                             usb_hub_3_4: endpoint {
> > > > +                             };
> > > > +                     };
> > > > +             };
> > > > +     };
> > > >  };
> > > >
> > > >  &usb_1_hsphy {
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

