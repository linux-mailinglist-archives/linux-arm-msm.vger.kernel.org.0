Return-Path: <linux-arm-msm+bounces-115268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id baZTEMRiQ2raXgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:31:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D36E0C1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:31:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c6ArBMGB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NSKMWpGo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9491430088AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B12D2382;
	Tue, 30 Jun 2026 06:31:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6142BE65B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801088; cv=none; b=WQpyntuGI4L/6zrYykHW2udkXubeaJirzJbLfhf5MORPAZadyMM3u+pTWxLk50cHiRlRQje0HXhxw4nrROgvFqEkS+bJ1xkMEMHfk/xE9S0J9xhjMx4f6fBDEML0BtOg+PsRoBowK+oSnlfTkrNzzx03mknXjV8Ud47v1jfjwGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801088; c=relaxed/simple;
	bh=fB5FZFi/JtIIK6yO3WlocRT93udau4n5g+elhz3Q1Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntYdW4ctI9QEKhUQGDOJrU3Ul+qHJwVaPnAfqUtQEQ7x5U5DSgHoqwTgYjpPcZ9N3kcZoirl8/PGJu2FTqajDmyGUl6EzR6/KFCBiSiEYd6HsYk6WcsLiVnWnNnwjyndlKmLEOIvb7oQrNGlYmPIy1GMBkHJ+rgBvjym2HLug0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6ArBMGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSKMWpGo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6Caqh1088933
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=; b=c6ArBMGBUXKghJ7z
	nzIsn5DVHzzeXAxjXdAJ2AIwkLWQUiwMttHUEbnwlwgHTzF5nFDDi3Lx+rma9Y0Q
	n3gjuWAmaeQOQJYu52jOKOY0PXai6QA8QDafwCqrqP0hlDmPUsQ9Nd/tkb0pEh45
	VArN6b+F/lKVK5qUXSDRqY7A45CIGSEq3fIiuESHXiL3cZn98hL+Fve2WAV4Aen8
	TOI8ALjDWR32LReYKusDC8HUcLLDMWsKnwOj+9TOT6IQR3lNC8VpUFqv0b2WFrbW
	ACIOBuynbtQKyc/4oBuaKHh/z/V9U1+vCS/8yBf9K1EahAgXuLD/BE6vx4ohjVoK
	xctdeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f462fgk21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:31:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c82843005eso39971995ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782801084; x=1783405884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=;
        b=NSKMWpGo8eK91lmBJJHVh0xnz+pYPJPru95q/vFpLQnhB2ryWP1WuWrwcqK2U4Xzlc
         dhOaDgfpqxuka9EQkZyfvW7YNuaomZT7qMy+X0gc3H2gv3GehGjeCiHRjjlhY9LcfkUl
         QeXx7+FlcDynYbDaMeaA5LG7E4PJGeckMdijju06GBmh8318oK7bY3tYWIJdUjxJ11MW
         OrA8BkVAAVn0200/CPj8aQtttprgeuwE0FLW19Wrk/aYpU/LAF2PFcPJdt9moRB5VwV1
         yjrizWguFKzYkN9DQ4nIsD4yq/LnpCk7nlL3jX64TR5E7rLMIZfbhwOQtFkVjc2M0tdO
         vOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801084; x=1783405884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiHhD9IKo187vZS4YzdCS2BpTjSk43R73dB7HjTainE=;
        b=U16g5SMfujM3kzzrCQ4hj13Sng3bY5yWaYvlTbMe06XHH3tv/z/aqDKM0rMw34cu0B
         yonPMTTkY5pVfn61J3zYr0pDXTucpvMR0PiPuEpWDs+SR+l5/AxjVxDDtJHdE65DKjGz
         b/2tH9eSLmZQb4U8DbNZ7PxjWeNQElf5BPiDVXRFrp+K4ZVJCCvtuDZocd5dlTyvyrY0
         u3A0S0wgbJ6DiZEZmxnA/RpbuwCowrh0Ksdwgj8PtslRm7VcTiOb0ZqyEja1R+aYaP49
         hRFexxbmq32sdnDBWLJjco88RXZUdIAikCgyAQ/3oa7+0RszSvoKlyStPT9fyO9XZAOD
         8cfg==
X-Forwarded-Encrypted: i=1; AHgh+RpWEOK6L2PrB54aNrrG5R3ln3gudfwz1asa61uXHP0ALnlhrYbbcl1EsTghyvQAtNdgKNjJFIHrZ5ogDeG+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+seeeUHWu5UKkpHYABHV5f7YXBjeHOT2Cnv+k37WLPW8RTzy
	t9igu+xi85H3V7Pgjz8BMlsI1m3DlcXpe2RqXor/mf/lkD/GGTAzEMaMxbDi+jcf9qzux3K6P79
	egAMdYHWQoQxY3kSDhesa+k0BHG62ZWvZ9mLOT+NkHqK0C2NNAaKDK2ce5UUpc/vZDl5c
X-Gm-Gg: AfdE7clkoN7z0KFa1oxeZJ4wCnRB+WkNY0Ecj+34VDMWTX5UVHAEdPVcHfDvOeJpend
	9xOT+wjzOaCic0D9ypNMAGhgyLJHjDwJhCcQUIse3exOhl1PzJ1mS0clxVbhGb/8M95AVEyYSRu
	+scs/sz6OosZGEMBnXOvv7s520fFVRyubgor/i1RY+wTsiqyMBYYJtBuuypTzScfQ8bFJJtiYSn
	rhLHZZTPjtQ8RiLG8dT9beFjGcxNDHEoBF/ZatqKZYQIaS+mEFfoudCpXxVHasqwsGdmWTpgvnf
	knQKbat9FVbhmzs7/0Ty5N/YBBYH3Sp5U8hIlyOPbV+WUvoj7iVvTz7y9y56n6LhsjY5dBhcI93
	9rtBkr0gsTkwuxAr+mmExDe6sSwioWAsMi6FkXstB2a0=
X-Received: by 2002:a17:903:1b6d:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2ca2e71cfa7mr18253445ad.26.1782801083712;
        Mon, 29 Jun 2026 23:31:23 -0700 (PDT)
X-Received: by 2002:a17:903:1b6d:b0:2c9:e9c4:82c1 with SMTP id d9443c01a7336-2ca2e71cfa7mr18253095ad.26.1782801083060;
        Mon, 29 Jun 2026 23:31:23 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828b10csm6361215ad.40.2026.06.29.23.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 23:31:22 -0700 (PDT)
Message-ID: <bc3cb302-5463-4e43-9b92-d141cafa2b8c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:01:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
To: Steev Klimaszewski <threeway@gmail.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com,
        jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
        will@kernel.org
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
 <20260629211614.6942-1-threeway@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260629211614.6942-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX7TL5FY1eMTWh
 MI6XZYeCiDc6I5Kt6zrr1Ji45suQo2jsHhvB1IZj+e9XCKqvmeNcwjU4udVY4S61BGHTMjlJ1FC
 LmXCRjqjElRQl1VpoirxV4AdOWprPizn1S+bxQQAhmL35wIi4D+TvSsat0RzkHmcwKjA/7S+WYM
 RJJae3kd9TqamejKo/O+yj1hrQ2QhkLB3lqkclbpQsvbsNvCaLzl8tmuNCF6rZVBv+14IDHbOms
 88FG0zxi/BHhNpEkWUrae1+T6Q/iIQecCUg+62HCAkoXheRC/L9Jlt/0JUtuUP06dV8U/AdKr8t
 pBoiQyXBBD9QltuXKY5nXWOGt8oiXqYdn/g2XiZOQo8h0PGv+GCU6Ilet0RjBPGEutDWOvdtBob
 OfGpuzAZOFieBn5DsEUfvEP5ZrqUicqT1vyBJpzqaOZJiDfSrDBwFBKzDg1tixEl+7fp1lZwlw9
 U+6WepLXBRN47jrix0Q==
X-Proofpoint-ORIG-GUID: wTvS31PoSDY4QpZnRIy9Qld1Ro6rNYLs
X-Authority-Analysis: v=2.4 cv=JqbBas4C c=1 sm=1 tr=0 ts=6a4362bc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ZQGdKSwLNShbWPe5TB0A:9 a=uz0CFkoBDNAz_8sc:21 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: wTvS31PoSDY4QpZnRIy9Qld1Ro6rNYLs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX6Vz9qLCyChJO
 Z0gqtQdcuLlFWpEtDQCXhFAhr0KoKINkgEtScOEjpERk+pFVZRwoXG3bSD8X+RfGFHQHbqSDWBn
 v3iBwyQyhtCnb522qT+6phLoeet5cZw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-115268-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:threeway@gmail.com,m:bhelgaas@google.com,m:bjorn.andersson@oss.qualcomm.com,m:jingoohan1@gmail.com,m:jonathanh@nvidia.com,m:kwilczynski@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:will@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,oss.qualcomm.com,gmail.com,nvidia.com,kernel.org,lists.infradead.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E1D36E0C1A



On 6/30/2026 2:46 AM, Steev Klimaszewski wrote:
> Hi Krishna, and Mani,
>
> Turns out, this patchset causes issues but only on some machines.  On a WDK2023
> (Volterra), this breaks suspend, and on *my* X13s, it also seems to when using
> the command `sudo rtcwake -m freeze -s 300` when resuming it crashes the
> machine.  Interestingly, it does not crash on another user's X13s.
>
> Included is the info from Volterra's lspci -vvv and further down will be my
> lspci -vvv - my X13s has a WD_BLACK 2TB SN770M in it which is not what it came
> with from Lenovo.
>
> WDK2023:
>
> [alex@volterra d3-bug]$ cat volterra-info.txt
> Linux volterra 7.0.14-gefea59a29f1a #17 SMP PREEMPT Mon Jun 29 14:47:59 CDT 2026 aarch64 GNU/Linux
> Windows Dev Kit 2023BOOT_IMAGE=/@/boot/vmlinuz-linux root=UUID=a8f7fb76-9ae0-49af-a830-09025b783224 rw rootflags=subvol=@ loglevel=3 efi=noruntime clk_ignore_unused pd_ignore_unused regulator_ignore_unused arm64.nopauth
> [alex@volterra d3-bug]$ cat volterra-lspci-vvv.txt
> 0002:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
> Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c20000/pcie@0
> Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: pin B disabled, MSI(X) routed to IRQ 182
> Region 0: Memory at 3c700000 (32-bit, non-prefetchable) [size=4K]
> Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
> I/O behind bridge: 100000-100fff [size=4K] [16-bit]
> Memory behind bridge: 3c300000-3c4fffff [size=2M] [32-bit]
> Prefetchable memory behind bridge: 3c500000-3c6fffff [size=2M] [32-bit]
> Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
> Address: 0000000017a50040 Data: 0000
> Masking: fffffffe Pending: 00000000
> Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
> DevCap: MaxPayload 256 bytes, PhantFunc 0
> ExtTag- RBE+ TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
> ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 8GT/s, Width x4
> TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
> Slot #0, PowerLimit 0W; Interlock+ NoCompl+
> SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> Control: AttnInd Off, PwrInd Off, Power- Interlock-
> SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> Changed: MRL- PresDet- LinkState-
> RootCap: CRSVisible-
> RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
> RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
> 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
> AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> AtomicOpsCtl: ReqEn- EgressBlck-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> RootCmd: CERptEn+ NFERptEn+ FERptEn+
> RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
> FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
> ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
> Capabilities: [148 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [168 v1] Transaction Processing Hints
> No steering table available
> Capabilities: [1fc v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=70us LTR1.2_Threshold=136192ns
> L1SubCtl2: T_PwrOn=60us
> Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
> Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
> Kernel driver in use: pcieport
>
> 0002:01:00.0 Non-Volatile memory controller: Silicon Motion, Inc. SM2269XT (DRAM-less) NVMe SSD Controller (rev 03) (prog-if 02 [NVM Express])
> Subsystem: Silicon Motion, Inc. SM2269XT (DRAM-less) NVMe SSD Controller
> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: pin B disabled, MSI(X) routed to IRQ 183-191
> Region 0: Memory at 3c300000 (64-bit, non-prefetchable) [size=16K]
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable- Count=1/16 Maskable+ 64bit+
> Address: 0000000000000000 Data: 0000
> Masking: 00000000 Pending: 00000000
> Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
> ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 8GT/s (downgraded), Width x4
> TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS+ TPHComp- ExtTPHComp-
> AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> AtomicOpsCtl: ReqEn-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS+
> LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: Upstream Port, FltMode-
> Capabilities: [b0] MSI-X: Enable+ Count=17 Masked-
> Vector table: BAR=0 offset=00002000
> PBA: BAR=0 offset=00003000
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> Capabilities: [148 v1] Power Budgeting <?>
> Capabilities: [158 v1] Alternative Routing-ID Interpretation (ARI)
> ARICap: MFVC- ACS-, Next Function: 0
> ARICtl: MFVC- ACS-, Function Group: 0
> Capabilities: [168 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [188 v1] Physical Layer 16.0 GT/s
> Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
> Capabilities: [1ac v1] Lane Margining at the Receiver
> PortCap: Uses Driver-
> PortSta: MargReady- MargSoftReady-
> Capabilities: [204 v1] Latency Tolerance Reporting
> Max snoop latency: 0ns
> Max no snoop latency: 0ns
> Capabilities: [20c v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=10us PortTPowerOnTime=60us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=0us LTR1.2_Threshold=136192ns
> L1SubCtl2: T_PwrOn=60us
> Capabilities: [390 v1] Data Link Feature <?>
> Kernel driver in use: nvme
> Kernel modules: nvme
>
> 0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
> Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0
> Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: pin B disabled, MSI(X) routed to IRQ 237
> Region 0: Memory at 30300000 (32-bit, non-prefetchable) [size=4K]
> Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
> I/O behind bridge: 1000-1fff [size=4K] [16-bit]
> Memory behind bridge: 30400000-305fffff [size=2M] [32-bit]
> Prefetchable memory behind bridge: 30600000-307fffff [size=2M] [32-bit]
> Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
> BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
> PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
> Address: 0000000017a50040 Data: 0000
> Masking: fffffffe Pending: 00000000
> Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
> DevCap: MaxPayload 128 bytes, PhantFunc 0
> ExtTag- RBE+ TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <64us
> ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
> LnkSta: Speed 5GT/s, Width x1
> TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
> SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
> Slot #0, PowerLimit 0W; Interlock+ NoCompl+
> SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
> Control: AttnInd Off, PwrInd Off, Power- Interlock-
> SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
> Changed: MRL- PresDet- LinkState-
> RootCap: CRSVisible+
> RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
> RootSta: PME ReqID 0000, PMEStatus- PMEPending-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
> 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
> AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
> AtomicOpsCtl: ReqEn- EgressBlck-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> RootCmd: CERptEn+ NFERptEn+ FERptEn+
> RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
> FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
> ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
> Capabilities: [148 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [158 v1] Transaction Processing Hints
> No steering table available
> Capabilities: [1ec v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=70us LTR1.2_Threshold=76800ns
> L1SubCtl2: T_PwrOn=0us
> Capabilities: [1fc v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
> Capabilities: [2fc v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
> Kernel driver in use: pcieport
>
> 0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
> Subsystem: Qualcomm Technologies, Inc Device 0108
> Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0/wifi@0
> Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> Latency: 0
> Interrupts: MSI(X) routed to IRQ 245-276
> Region 0: Memory at 30400000 (64-bit, non-prefetchable) [size=2M]
> Capabilities: [40] Power Management version 3
> Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit-
> Address: 17a50040 Data: 0000
> Masking: fe023c00 Pending: 00000000
> Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
> ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
> DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> MaxPayload 128 bytes, MaxReadReq 512 bytes
> DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
> LnkCap: Port #0, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
> ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
> ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 5GT/s (downgraded), Width x1
> TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
> 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> FRS- TPHComp+ ExtTPHComp-
> AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> AtomicOpsCtl: ReqEn-
> IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
> 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
> LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
> Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
> LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
> EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
> Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
> Capabilities: [100 v2] Advanced Error Reporting
> UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
> ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
> CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
> MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
> HeaderLog: 00000000 00000000 00000000 00000000
> Capabilities: [148 v1] Secondary PCI Express
> LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> LaneErrStat: 0
> Capabilities: [158 v1] Transaction Processing Hints
> No steering table available
> Capabilities: [1e4 v1] Latency Tolerance Reporting
> Max snoop latency: 0ns
> Max no snoop latency: 0ns
> Capabilities: [1ec v1] L1 PM Substates
> L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
> PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
> L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
> T_CommonMode=0us LTR1.2_Threshold=76800ns
> L1SubCtl2: T_PwrOn=0us
> Kernel driver in use: ath11k_pci
> Kernel modules: ath11k_pci
>
>
> X13s:
> cmdline.txt: BOOT_IMAGE=/boot/vmlinuz-7.0.14 root=UUID=dc44a82f-6d97-490e-a4be-4c3bceacc658 ro arm64.nopauth ipv6.disable=1 clk_ignore_unused mitigations=off cfg80211.ieee80211_regdom=US efi=noruntime printk.always_kmsg_dump=Y efi_pstore.pstore_disable=N quiet splash
>
> lspci -vvv:
> steev@finn:~$ sudo lspci -vvv
> [sudo] password for steev:
> 0002:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c20000/pcie@0
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: pin B disabled, MSI(X) routed to IRQ 215
>         IOMMU group: 14
>         Region 0: Memory at 3c700000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
>         I/O behind bridge: 200000-200fff [size=4K] [16-bit]
>         Memory behind bridge: 3c300000-3c4fffff [size=2M] [32-bit]
>         Prefetchable memory behind bridge: 3c500000-3c6fffff [size=2M] [32-bit]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>                 Address: 00000000fffff040  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
>         Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0
>                         ExtTag- RBE+ TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
>                         ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
>                 LnkSta: Speed 8GT/s, Width x4
>                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>                 SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
>                         Slot #0, PowerLimit 0W; Interlock+ NoCompl+
>                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
>                         Control: AttnInd Off, PwrInd Off, Power- Interlock-
>                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
>                         Changed: MRL- PresDet- LinkState-
>                 RootCap: CRSVisible-
>                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
>                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
>                          AtomicOpsCtl: ReqEn- EgressBlck-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
>                          EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
>                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
>                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
>                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [168 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1fc v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
>                            T_CommonMode=70us LTR1.2_Threshold=86016ns
>                 L1SubCtl2: T_PwrOn=10us
>         Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
>         Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
>         Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
>         Kernel driver in use: pcieport
>
> 0002:01:00.0 Non-Volatile memory controller: Sandisk Corp WD Black SN770M NVMe SSD (DRAM-less) (rev 01) (prog-if 02 [NVM Express])
>         Subsystem: Sandisk Corp WD Black SN770M NVMe SSD (DRAM-less)
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: pin B disabled, MSI(X) routed to IRQ 253-261
>         IOMMU group: 14
>         Region 0: Memory at 3c300000 (64-bit, non-prefetchable) [size=16K]
>         Capabilities: [80] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [90] MSI: Enable- Count=1/32 Maskable- 64bit+
>                 Address: 0000000000000000  Data: 0000
>         Capabilities: [b0] MSI-X: Enable+ Count=65 Masked-
>                 Vector table: BAR=0 offset=00003000
>                 PBA: BAR=0 offset=00002000
>         Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
>                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s <1us, L1 unlimited
>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0W TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
>                 LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
>                 LnkSta: Speed 8GT/s (downgraded), Width x4
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
>                          10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- TPHComp- ExtTPHComp-
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>                          AtomicOpsCtl: ReqEn-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- Retimer+ 2Retimers+ DRS-
>                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
>                          EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>         Capabilities: [1b8 v1] Latency Tolerance Reporting
>                 Max snoop latency: 0ns
>                 Max no snoop latency: 0ns
>         Capabilities: [300 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [900 v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1- L1_PM_Substates+
>                           PortCommonModeRestoreTime=32us PortTPowerOnTime=10us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1-
>                            T_CommonMode=0us LTR1.2_Threshold=86016ns
>                 L1SubCtl2: T_PwrOn=10us
>         Capabilities: [910 v1] Data Link Feature <?>
>         Capabilities: [920 v1] Lane Margining at the Receiver
>                 PortCap: Uses Driver+
>                 PortSta: MargReady- MargSoftReady+
>         Capabilities: [9c0 v1] Physical Layer 16.0 GT/s
>                 Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- LinkEquRequest-
>         Kernel driver in use: nvme
>         Kernel modules: nvme
>
> 0004:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c10000/pcie@0
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: MSI(X) routed to IRQ 217
>         IOMMU group: 15
>         Region 0: Memory at 34700000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
>         I/O behind bridge: 1000-1fff [size=4K] [16-bit]
>         Memory behind bridge: 34300000-344fffff [size=2M] [32-bit]
>         Prefetchable memory behind bridge: 34500000-346fffff [size=2M] [32-bit]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>                 Address: 00000000fffff040  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
>         Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0
>                         ExtTag- RBE+ TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <16us
>                         ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>                 LnkCtl: ASPM Disabled; RCB 128 bytes, LnkDisable- CommClk-
>                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
>                 LnkSta: Speed 2.5GT/s, Width x1
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
>                         Slot #0, PowerLimit 0W; Interlock+ NoCompl+
>                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
>                         Control: AttnInd Off, PwrInd Off, Power- Interlock-
>                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
>                         Changed: MRL- PresDet- LinkState-
>                 RootCap: CRSVisible+
>                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
>                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
>                          AtomicOpsCtl: ReqEn- EgressBlck-
>                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
>                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
>                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
>                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [168 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1fc v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
>                            T_CommonMode=70us LTR1.2_Threshold=0ns
>                 L1SubCtl2: T_PwrOn=10us
>         Capabilities: [20c v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
>         Capabilities: [30c v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
>         Capabilities: [344 v1] Vendor Specific Information: ID=0006 Rev=0 Len=018 <?>
>         Kernel driver in use: pcieport
>
> 0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8280XP PCI Express Root Port (prog-if 00 [Normal decode])
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: pin B disabled, MSI(X) routed to IRQ 267
>         IOMMU group: 35
>         Region 0: Memory at 30300000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
>         I/O behind bridge: 100000-100fff [size=4K] [16-bit]
>         Memory behind bridge: 30400000-305fffff [size=2M] [32-bit]
>         Prefetchable memory behind bridge: 30600000-307fffff [size=2M] [32-bit]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable+ 64bit+
>                 Address: 00000000fffff040  Data: 0000
>                 Masking: fffffffe  Pending: 00000000
>         Capabilities: [70] Express (v2) Root Port (Slot+), IntMsgNum 0
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0
>                         ExtTag- RBE+ TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit Latency L1 <64us
>                         ClockPM- Surprise+ LLActRep+ BwNot+ ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ FltModeDis-
>                 LnkSta: Speed 5GT/s, Width x1
>                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
>                 SltCap: AttnBtn+ PwrCtrl+ MRL+ AttnInd+ PwrInd+ HotPlug+ Surprise+
>                         Slot #0, PowerLimit 0W; Interlock+ NoCompl+
>                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
>                         Control: AttnInd Off, PwrInd Off, Power- Interlock-
>                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
>                         Changed: MRL- PresDet- LinkState-
>                 RootCap: CRSVisible+
>                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible+
>                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP+ LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- LN System CLS Not Supported, TPHComp+ ExtTPHComp- ARIFwd-
>                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- ARIFwd-
>                          AtomicOpsCtl: ReqEn- EgressBlck-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap+ MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
>                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
>                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
>                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [158 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1ec v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>                            T_CommonMode=70us LTR1.2_Threshold=76800ns
>                 L1SubCtl2: T_PwrOn=0us
>         Capabilities: [1fc v1] Vendor Specific Information: ID=0002 Rev=4 Len=100 <?>
>         Capabilities: [2fc v1] Vendor Specific Information: ID=0001 Rev=1 Len=038 <?>
>         Kernel driver in use: pcieport
>
> 0006:01:00.0 Network controller: Qualcomm Technologies, Inc QCNFA765 Wireless Network Adapter (rev 01)
>         Subsystem: Qualcomm Technologies, Inc Device 0108
>         Device tree node: /sys/firmware/devicetree/base/soc@0/pcie@1c00000/pcie@0/wifi@0
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupts: MSI(X) routed to IRQ 288-319
>         IOMMU group: 35
>         Region 0: Memory at 30400000 (64-bit, non-prefetchable) [size=2M]
>         Capabilities: [40] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [50] MSI: Enable+ Count=32/32 Maskable+ 64bit-
>                 Address: fffff040  Data: 0000
>                 Masking: fe023c00  Pending: 00000000
>         Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unlimited
>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W TEE-IO-
>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend+
>                 LnkCap: Port #0, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <64us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                 LnkCtl: ASPM L1 Enabled; RCB 128 bytes, LnkDisable- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
>                 LnkSta: Speed 5GT/s (downgraded), Width x1
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- TPHComp+ ExtTPHComp-
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>                          AtomicOpsCtl: ReqEn-
>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers- DRS-
>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported, FltMode-
>         Capabilities: [100 v2] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr- BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP-
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+
>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr- CorrIntErr- HeaderOF-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>         Capabilities: [148 v1] Secondary PCI Express
>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                 LaneErrStat: 0
>         Capabilities: [158 v1] Transaction Processing Hints
>                 No steering table available
>         Capabilities: [1e4 v1] Latency Tolerance Reporting
>                 Max snoop latency: 0ns
>                 Max no snoop latency: 0ns
>         Capabilities: [1ec v1] L1 PM Substates
>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
>                           PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>                            T_CommonMode=0us LTR1.2_Threshold=76800ns
>                 L1SubCtl2: T_PwrOn=0us
>         Kernel driver in use: ath11k_pci
>         Kernel modules: ath11k_pci
>
>
> Sorry for taking so long to reply about this, Konrad suggested we provide the
> info now, as I have been applying the patchset to a 7.0 kernel, but I know the
> patchset is already in -next (maybe 7.1?)
HI steev,

Can you also share dmesg logs also with console suspend disabled mainly
suspend resume logs, in both the cases.

- Krishna Chaitanya.
> -- steev


