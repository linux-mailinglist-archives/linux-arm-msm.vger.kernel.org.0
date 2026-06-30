Return-Path: <linux-arm-msm+bounces-115359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sb5hAQuYQ2pycwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:18:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6926E2BB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:18:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Io7mnqVi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="MwsmTTf/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115359-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115359-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E5973029647
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924A73EFD24;
	Tue, 30 Jun 2026 10:17:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2FB3EFD14
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:17:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814671; cv=none; b=ppDkN2QpOOAVZJJzs+bEX1cQ1teG9U6t4Lo6VYWLJcP0yhOD8cnyvSGpZrTmUOVCLsAC3JqJlwsBA5pavtVYMa53d18AhZjes4BqX626caAc+Qr5JFBvOQyqu74S16joX481PjSRAi8ApXS/8Srz5MX2Zvdpog/Ef/K3TF2jVKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814671; c=relaxed/simple;
	bh=VUe8Fz1Splwj9CVltBTk3c3YxkM/R+Z8Y+y8+XBHRcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdC/6cxYG8ovehX+Mev31uUR/tj9DsoQeMtKk2Z68cSMQODfzLBNfV/vQAEuRRv0VhQcBI9lKMy9ftB9IGfNzX+kx/2A3P1ssVw8P0NbZTUf4oib6ESTbgdH+PbSlL+D1gNHRpLe1AOe3fd2/jkDCEpgiZ5AvdsfcGu9aoTX2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io7mnqVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwsmTTf/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mkGG1602260
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2xbza18XahaOGw+Ao1bzJ3dn1GuFQEjkCVDI/Xq0mfo=; b=Io7mnqViZA4cS9h5
	9rNevjy6OvVJVfTS+8iDxlvycBnvTzWaRbNIzS62GzxTNUrxFHLxwT5r9HOp+aGj
	bgiHGukHj0nkC5vNACbjNH1WM/w3IAhMJorrdbRotINU1zSO1qz5nLZUM503W7VK
	oZ/uCPE7s2OFKG4FsbIPJdItIqSwCy3RogkLwbKwg2CTuaDAYy0BoTZ7Gb+Ta/Qv
	fegXoWzJ5sF+ctB0jcDRT8DLroRFBpDvUzLZIWfNdLtJTJZojZEDOZo1JYhYRPjS
	E6PMQMIsDnSiqgcfISz1zgxwIGrGeUXwhRATISb15RMqZk2YhULNOkh635mhVSQH
	tCkBFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprb5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 10:17:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e566bae1bso38940885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 03:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782814663; x=1783419463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xbza18XahaOGw+Ao1bzJ3dn1GuFQEjkCVDI/Xq0mfo=;
        b=MwsmTTf/bmoDPWiiQRoYslwATRpTOWQ2mC6KDF2jHooiWD1ChiNhX8kS0p9LqH78KK
         zv224QR5DjpYQ+OCq+fRrri9b3UTMZaT+jAGukfd+flItfgWmr33GyP10vGnhnR2yIjE
         NadaUZstDVjztSmSATDfAC7Cv/qu7UdqT8fOlJuEQMw9/QUSl0h9dh6N0v9MNbjJvH7M
         HNxCXHaWsic9bh8YhFGwkPSr/Wkt3nJbopdc1eJGHhpQ2orgBjh0bL/U//cvN6ZuJfK4
         6tS7R3nLKUIH7Sb8RwDOPj+qwexdO706apmrdhpVAnRNIHfMs3xidnXtvC/7bn2ZJOdW
         cQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814663; x=1783419463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xbza18XahaOGw+Ao1bzJ3dn1GuFQEjkCVDI/Xq0mfo=;
        b=iOr4p5RgFp4FtVHryqr9QTSZ0VfikGAnF3/f/NX1/9KaoEIdp4ab/os4xEZmdxS3vO
         CxW1QMUuYW11d+QQOZSQYf6G0U4ryzLaKhb7VwsxRgNdymdFxh6hJhE9CKXrI3zGKyXT
         XRuqXkcpvl9L/dTAW5r5bhVLrYRYQ0ISke/+dEMb9FT+h+FWoYVHVW/iVO6yoIpOY1ri
         FVb8V/KJ/J5RCTw4tVaAYGJLn9GU1k9U81KC4bSz9e4Xs8TjXt0Cg/Jo0rMJxiNxTqdA
         lMkpQoHrpaHYZW41g331LmUIwiXvnVtm/ckD/s5SSnxPormLndwa8XaKiaxiyLw0noYE
         xtRg==
X-Gm-Message-State: AOJu0YwgePmSi6l3x1xvMmRVjkUF2PM9iquL8z3NsKKOncasGhjY0sKp
	IFk44YiCQhOVgssCWxj1vRTGhxDryk0fr1+olaof8uG6M7FfXL2WO5bu+w0zs+J33tZOhDTl943
	zO+/F7HY1nwsOc19YcLkqF/NBuY3AmIrc6POJDXqcAnXtjG/+Q6Z64QBLXLEjHj/Gssh4r6tSKJ
	kC
X-Gm-Gg: AfdE7cnsywCl+wNp2wcrgDaez+HiQM35ADOmKAJS/uCqC49rDPH2TijHY7KV01xP51p
	cftBdL6+BXppfUkzmlXSBNloAonTGJJxBXAmxeGs+0aE42HrHKn/eN/RzurjFH/UT8YkoAze4a3
	DRxBfnaOFbx0NCtK8AePPGhcruGtCV2JKnXQw7BtAaQhDMB51yVP9sjLlSbM+4AFEVr4o4gyvCv
	a7cstKBpGAe5GqAJqxcCITr/VrR2Tk/pzSSVlm5ZFIxPl7p/xeeR/Kl7oleJyzjDPeAcAREQFGf
	LsNQZMe28sh0ZKIGQA4M8cyxOE5LwgP3gs1J1ugDN8A0spAj913zZ+7YYX1yvMK6WdThBn9GkiV
	ghlo8chQTYAcvLQla4Q5TFah9wgqD3caEJ/E=
X-Received: by 2002:a05:620a:45a9:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e622e393dmr334187085a.0.1782814662856;
        Tue, 30 Jun 2026 03:17:42 -0700 (PDT)
X-Received: by 2002:a05:620a:45a9:b0:92e:5272:4e3e with SMTP id af79cd13be357-92e622e393dmr334184085a.0.1782814662201;
        Tue, 30 Jun 2026 03:17:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc1esm100192266b.41.2026.06.30.03.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:17:41 -0700 (PDT)
Message-ID: <f010cb9c-7e4d-4029-9f83-f9092545f87c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 12:17:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, valentin.manea@mrs.ro
References: <20260629154812.9066-1-mail@etehtsea.me>
 <20260629154812.9066-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629154812.9066-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CejfGeOFR-jMrSHNAM7itrk0oXK8Oxzt
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a4397c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=4SG1UvOAAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=7CF_AJ1nNsKS5KTexvgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX5Nv5cLV4qtVl
 IR8n9D8CFcvgAggJSndhoMo5PF0qai5nxYYj5ZwqvTmOe9ixnjQBTVznYPvmak2iOg48s/xlXvI
 Kh17yDl0dlE3H458L0SaWbr9CT4ZlBAJWSn69itJp74PiWR39k9w2tbCRHTGSLeLWuJ9hjGu/gd
 +K9k0kLz1csh6ErIReAyEV2m7Jl+4aBMTV+gP+ZqEMrp8lnn0Ot0TColwsKNmRiG0443h67L6yb
 8s1yowth6oaSjmQgOmgSQ2YsuzuTi5VzwFkwzltl5dtOQapzh+lr/d3Xp95Kdc16Txr1mCCI5L3
 bjLQvlFCYbciW7Ck6H5Ltb+SSYXVMth8tMju6zMXyyCB3pqiOGX/ErsHIdES4kELECZwRzNIc7O
 VcmKAGo5qkdFw79huSa+WPDHZK8j8+8pwAwuAwWIlfLeWXqdzpUpocRO4SGMpcEQBWqxT7ijjse
 BWhQzpBrIXEvTeu543g==
X-Proofpoint-ORIG-GUID: CejfGeOFR-jMrSHNAM7itrk0oXK8Oxzt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5MiBTYWx0ZWRfX5vokGzhlbuGk
 3CjRD+jVKguF+CHJgfcWnHj9wYHoauTjtDmrBrstRIvBlqIAL+OwGw77Dj5zXZngGU5RyL4SNcI
 ShpvszNlfvvluH3VxdFbepWdGABMBms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115359-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mail@etehtsea.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E6926E2BB0

On 6/29/26 5:48 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].
> 
> Supported:
> 
> - Sound (with alsa-ucm-conf config [3])
>   - Speakers
>   - Headphone jack
> - Bluetooth
> - Battery
> - HDMI
> - Touchpad
> - Keyboard (with backlight)
> - Touchscreen
> - WiFi
> - USB-C ports
> - USB-A port
> - UFS
> - H/W accel
> - DP over USB-C
> 
> Untested:
> 
> - Camera
> - Fingerprint reader
> - Sleep/Suspend
> 
> Broken:
> 
> - eDP
> 
> [1]: https://lore.kernel.org/all/871px910m1.wl-kirill@korins.ky/
> [2]: https://github.com/vamanea/linux-magicbook/blob/x1e80100-magicbook-6.19/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
> [3]: https://github.com/alsa-project/alsa-ucm-conf/pull/755
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

