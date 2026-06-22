Return-Path: <linux-arm-msm+bounces-113956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LKhDJFABOWoqlQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:33:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C446AE430
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:33:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HXegT6xG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cuJPJbOq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113956-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113956-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80C6730651BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC9435C1B2;
	Mon, 22 Jun 2026 09:23:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F36356772
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:23:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120228; cv=none; b=GIjWk/lkytFc3VOfUbQpaaUDCv9fqkiJRNRy9AFFXvQqgwcgUw8H3JbIIGPLiXNHXk1y0HURtghWPP1AA5+l49+1IjtcfKClkhWAQn+A7oEshkrke5APQHTU5ARwp0QIML8UiIXqnIKdAX3agNTuHHKGNwMg+Oxu9wWOVKQsV3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120228; c=relaxed/simple;
	bh=c8VS4nGyTnFP4AdAXFYPPQiqy6T5UfeU1oAjQ6t7VYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVnA/KXC5ds/padFSbK0j0um+CA7VxMreQxeFugyvWNpRaxX22vvfsSoJf/TKy6/lKlJ9cRbXwyyquxBLJbBZn5gOAbo2yqu8LuJ1y1/Dj5pRqKl9Y1mcNx1ZIwdcaE0a0ztNfP5ZLjrKe1n20l4hxPfqbWbIHkblvUp53Mqntk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXegT6xG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuJPJbOq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BTBg255503
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6taM6ef1bN+QxPt42w/CWNu41IyMWuyWfriKooZFKWA=; b=HXegT6xGcVB6E7hC
	Gp2CaioZvp3GSkV2kFdGr5VUXmdhLIodZY++ds5Ben5cetNtF8oCyUs9au6vfjz7
	8Addq2k7B79f+bVrjR4dt4DCZNM7ICCVmpfMuRjZBrqiM87XVZJJfjOq9lCARKLc
	u/CfevFZu/WjDj94UtadCxcZSnP2C+oROMOG6e8QWEYnQOlTxAVRv+6fllNCkCH4
	DJ/6Y3VYk4tEBe012D82r0MeJnOb1f7xAu6tJ3ikQcnthdXbgeUsr3sD/lXK1puY
	F7X4/Wzqadmrdw9vHBKsyd3yCDoH91ne+Xz7iG3EKht9lYesziAhfOvEuVuEn4Ga
	1bT3fQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5nxfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:23:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dd10a7e0ecso16149416d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782120225; x=1782725025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6taM6ef1bN+QxPt42w/CWNu41IyMWuyWfriKooZFKWA=;
        b=cuJPJbOqqqc3kp+7l9/1M4N9olzKQe1F+2nC8OS8d2zguxO6EFXLvz2IJyzSXCd8Z9
         ernbPxAPCk1Pbr40H+zA4c8Bs8rEqm8uLSIs374P4HHEtcrSuxBsE01O1963/UFj70nP
         Ms5QIkw6wA45AhC6z4lNXbzp1KEtBH/V8q+7NBCogDkDSDU7zawjjR/E9SJzHQI9RRLS
         f3f5jhpUvC2xrE1EwurrI8/q7X9RCCcIeyyBJsexMKg8B1h2b9sDA/c4Pr93id+T663s
         DuFiUGacTGLdnkuNHZPXGc5SvM5hArE74Omim4IMKif259LnwUymRyMA6BJs6JyDBtrY
         4N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120225; x=1782725025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6taM6ef1bN+QxPt42w/CWNu41IyMWuyWfriKooZFKWA=;
        b=OD1WvAE5ljCAfjsWmJWXla0/X7Ny9QIMNAsGAkBumBAxW/9C5/Tpq9DdeVVq9aYzJi
         ED7rt27yAtTSfgCKTNf/UCY83Q/jQvotzVLOHBRrCpK3YVPjxCdAxWZ2yFrc6MsmO7yt
         S6lWe9PSsj5h29ZX4PxnIyqWI+e+A2eJJTwfyIHxbjqLHtyqXs4XpvacQiJ0ysNpe0Rj
         EMIdb0Ao9KdprKq7RaZmTr3blnMi5qH5BL+981NRnhxAyWOZb43vCJkt+1GBvzJUgIfi
         KNWBpsJzP6JsMEE5ME3bMnAOjiC9996eERr159gAY/WHdvJ12+HtAZZGd4hG6jZXMe5Z
         8GsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MpTbrQRR9FT9V+Ruj4/TJdMHgrk54N0b8RtlN+IpWk5P2uvkb0VvFs0J9lhj7mQaXUxPfKQm/ryz2HB/2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50LjHKK3N80UmEW/mtQZ+iQOpZRAXvkLyoE02mQApuWefasbn
	ZDExl95BWj3Yhj1nnX7NK/62jS7rd4ja3a7re5YXQBOrt3soU/o2QRQ0gLrMX4+bXi+quqDSRRb
	+OPCw6hllH52k0eHUCe5KQpxPm/b0fpfcjuoFIgukyQZJBykCBeYY2ZoBYTBjBbFultt3
X-Gm-Gg: AfdE7cmGMrieCSc6EInXrZ8P6X9x4ZmzlzFvyWBHyIxIwrFUIBKm9hdsGTLNcGFk7ln
	+ATHtnmstHDKmS6kmtum+I6O0xH20pQEq9bM1Slsz+EK79uUbrRMhkLtvOvChSqscOGI4b7dtuD
	RVOItk3J5LNGL3Zx9FKJZkXL5X85IpOg6oYFEOk63+FFMVBD6lg4xGPfGoEvuLzcsxy9zws2S5v
	+XPwUucd+5oMTcQaeJqY8i0TcjgJd6x4irzBVXFLyyNkWtPK1vo4NISBaB7KpWlbhZU2o11mTJy
	GZhkkFJQzz14w/ddsYBNm7z1bedyn+M3oE+rpqOzXqu1fzQjSABmJ8mxF61wB5Re8RO6YUlhfTJ
	KzVlblWLeQghJetj6tgH9S/QrkgddyJwxzhk=
X-Received: by 2002:a05:620a:3711:b0:920:798b:e290 with SMTP id af79cd13be357-9208e49a532mr1311760285a.7.1782120224768;
        Mon, 22 Jun 2026 02:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:920:798b:e290 with SMTP id af79cd13be357-9208e49a532mr1311757585a.7.1782120224342;
        Mon, 22 Jun 2026 02:23:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm325245366b.7.2026.06.22.02.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:23:43 -0700 (PDT)
Message-ID: <66245d8f-7c04-4db0-95a2-e5a43f236a79@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 11:23:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260620-glymur-send-v1-0-fc4a2cfd107c@oss.qualcomm.com>
 <20260620-glymur-send-v1-2-fc4a2cfd107c@oss.qualcomm.com>
 <erlfxo4gcvuaakuggrgroniiwofdrocgtje32idibknj7kb42g@pdh7fo4x6ief>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <erlfxo4gcvuaakuggrgroniiwofdrocgtje32idibknj7kb42g@pdh7fo4x6ief>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5MiBTYWx0ZWRfX5s/OPLdTYezc
 nedknCkz49XqbOtyp44j5frtupw6QsFcc3De7HGigcBr521cKM3mLLjy99IFJ825+wtc2VPD1lR
 vlpD9WQRWL1ABmalXQEJ2Y8uQQDXHtOWKqhs9iVZDCav1vqcr14UN9/8J+rmidpA9nXSpOa6zyv
 j96SwihssOtB143a5tQAn/+SbC4jchD4EruB7y68hYpKNxmltgFXl1ygmUhuxG9cDD7czAC93yr
 bENsIPeBW+r4dwiFY6hZzUFQDaie6CxEbLEt8fX/TJkB+AEgSvzoMpuYYi5NsDjy9t0XkXhowup
 oz+eNyhmKFmN8HkuQI5bTXpqvM224S3nkGFPeg65DPQpuf4tXDhl1ucczakPS+4AfgPNt5kWJGm
 RVMmoLyJPW0Bf61lRU7VqDSroPMSU9nX/ASbHJGDD/Ye6IGPGUzTdlWeo03WHJhbwOX3n5OdL0t
 ETI6MGe2gQBOmgTyuvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5MiBTYWx0ZWRfX1k/gV2D90L/v
 gAwNrD/me6iL1TeQRXEy+RPEYK92uexSQvkZ2viGj7fDpe9tEKHYuo5LrnPGwt/ia9cT7i7IMa7
 Umb+CcoQj/ZGB5VhmH/j3jg+OXpIlys=
X-Proofpoint-ORIG-GUID: D4uGWZmJXo6bTw97DIZCJQDSqztZ6jV7
X-Proofpoint-GUID: D4uGWZmJXo6bTw97DIZCJQDSqztZ6jV7
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38ff21 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hurwLpg0IFdDxU2MNX8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113956-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04C446AE430

On 6/22/26 10:18 AM, Abel Vesa wrote:
> On 26-06-20 21:50:42, Jason Pettit wrote:
>> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
>> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
>> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
>>
>> Enabled by this device tree:
>>
>>   - internal eDP panel (samsung,atna33xc20)
>>   - 2x USB Type-C with DisplayPort alt-mode and USB
>>   - chassis HDMI output
>>   - chassis USB-A host port (usb_mp multiport controller)
>>   - internal eUSB2 host with the Elan fingerprint reader
>>   - NVMe SSD on PCIe5
>>   - Wi-Fi and Bluetooth
>>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>>   - audio playback and capture
>>
>> The HDMI jack is driven by a power-only DisplayPort-to-HDMI LSPCON on
>> the usb_2 combo-PHY DP lanes rather than being a third USB-C port; HPD
>> is on gpio126. The LSPCON is on an I/O sub-board with no I2C/AUX control
>> path, so it is modelled with the generic simple-bridge "parade,ps185hdm"
>> compatible used by the in-tree x1e80100 HDMI-bridge boards (the exact
>> bridge part is unconfirmed) and it needs CONFIG_DRM_SIMPLE_BRIDGE.
>>
>> The &gpu/&gmu enable, the audio nodes and &remoteproc_soccp opt into
>> glymur.dtsi SoC nodes that are still in-flight; those series are
>> declared as prerequisites in the cover letter.
>>
>> Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
>> Assisted-by: Claude:claude-opus-4-8
>> ---

[...]

>> +&usb_0_hsphy {
>> +	vdd-supply = <&vreg_l3f_e0_0p91>;
>> +	vdda12-supply = <&vreg_l4h_e0_1p2>;
> 
> No redriver ?

Right, this must be bound to one of smb2370_[jkl]_e2_eusb2_repeater,
most likely in the natural order (0->j, 1->k)

Konrad

