Return-Path: <linux-arm-msm+bounces-111789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PbnCL7aaJmpeZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:34:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33E65524F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:34:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SnyuigiA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W5YkghLC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111789-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111789-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C903293A90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BBC3C1984;
	Mon,  8 Jun 2026 09:58:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E93B7B84
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:58:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912711; cv=none; b=mKs27UdfpY7nlYaimFx11JK9Jqynn+0tC95B/Sh7Gy1XaIzXBS9pzNF+ZUcn+BmPXbzVAvDwo++/eVJSmj4ZVNdjGjBhc2KFqJt2YzZR1vHLMty7A5T4n2MUgI/6+kNbSL/dbUej6byELSbOls25kosWbCFaHyUX0JaqTESqjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912711; c=relaxed/simple;
	bh=Sf/hY8RxXrPFlkUl+x1zcYoBpjPAFg2+nW5Yf8mB9bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fn3qgtvOmoYqCUKHnhUySI9ciEa5+n1ImX6p+j5RGppbZggpcWM+yrmKG/JJBnp5OQlQR2jApmWNaFwmUuur9Bg1mPDUdukWaBJ0KnIFfJqoPOlC9WicU/pM7qbGXkPuhhOvdCPJNqFKdNKFZkMiclBC8tnMgwCOq4ALtai5vlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnyuigiA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5YkghLC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Okdd2347148
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikWeY+fmqGZYeieX+8lpy/C+q3rmfApSt0SiuwfEHqQ=; b=SnyuigiAvs8Qkl9F
	ZbtfiH4R6AGF26FILXOpyHD+ri9IfqBdvF7vwkMBpF+CEXd/jbpemQxcMC+G/8c+
	HfYgY2yV5dkxg8DHCzP/aTGlO6YH+U5o/zaH77ZWRqgP1LLvPdWbw68LWgYmyvgJ
	+1mdRyKb+zMRcaS2hUuxIf4+OMG9Wccw2+s3Beg+sFN4jPlD1mZI/eo+SIp3z8ji
	8n1lKPMOY7RCo9L3zBpyobh5G0/IHaCDALjuybXtHZrDSHjnHfXgj8rh1UOSrG/R
	svWeb1gSPX73zGdGpPrmWsEtf2erlD9MU1EuIRj1XZXmxsRKs0HQnIjB1Ct48VQm
	Y8ud/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrffxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:58:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915a4ca0a4aso133929885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912709; x=1781517509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikWeY+fmqGZYeieX+8lpy/C+q3rmfApSt0SiuwfEHqQ=;
        b=W5YkghLC+UDOFfwmCOn3ndk7VMod/kCWIE8fIUBjAlMKLyYBAdNLhUv1Lf83tLv8F3
         MpQ73cajkmCGZoajEWieTY2us1EupEjANlx++BGzSKHq9yKa65kUm+s0JovXUDuKFTCo
         qAm8Ht6GtXLj0+FNiL4bumB9gb/qyRxGLjtHObWV+XuF+VN4vUFrDuvcJVBGDXXSW6ho
         H3QiabuzjusPV7YfYDgw2TJff38tErXBPUBJFHK80l+qA8sfy5OOp9cuR8VYTV6D4XyS
         HC/rRlBhz0aPn9Yi5xo3D5vr1ChzP7oRI3WMIlTowH8O2m10BEBU6vUq6gPhPgV9V8MV
         X63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912709; x=1781517509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikWeY+fmqGZYeieX+8lpy/C+q3rmfApSt0SiuwfEHqQ=;
        b=sPrytS83Bxwf+tzkBD656BLvzHcphY7CBTdJayNWR0vB/p5yia7PJmS/RUGZc5x743
         LriYRREaISFP2+8/hRZgy+/MqshbsfcHlDFI59rtSxyM1qBAbF7+e/Tc6ftrrHA0t6Oc
         RbyCznS2+cOK7G8uO4WtT5AUV0Tygo8Z53qDKSQJwwzsSprvUfM06oRkBX16+1G5J2F9
         AGLFMlFt0nZPfnCPTy0TL9hZE7WYX6M9gIP3e3E93FtfRU1M94CeVcRxGyn2HOYT2Dyq
         gQIaI7F7YYnpxknDHl4FsZ2SDZC5JcAQOdF+m241Ajz60a3soWkjEAG6aGLzfVh1LeV5
         iUaA==
X-Gm-Message-State: AOJu0YwIa6BqtRGmyk5Yj0xITPwAaIO4Lk9Sti2FdIhoByGQR2QrYu7b
	zI3IsfLUy8qwbg1ibKz7akWsYKuqkiBIhAmUau9FYQoNnEwt/YmOo3oxktWYVxJLRYJ/gZ9yQjn
	mHjZDX/3lxP+rvnFEFkb0FphjQdduLp6OSETQTBCSyLHoTM5NSlKaKWvqs/vlgWX3NBwx
X-Gm-Gg: Acq92OGiWvpqK9CbOedcm/76RWeb8gcqGDL7Ydtr2bt8kpYdejyISLyN7B8TJpMnPr6
	6WXfcHzAo7aACRzczkViX3BN1J+98Z0hevscrKq8NW0blCvK0ftvE/phbmKJDXnCaFFvlF30l/P
	3tmOxsSACJ2DqwwWShZq7+MJEkyGW79CIvE7NJwCPzetkq3vckpvEnJFA0uqfbSbjMfouX3v38r
	NsY0yDsoL3kwHnGoraebItrU5J4eI90kW0UAHb1pafb6MH3N9ZbqB+slv6GRRokC9rH9gG8Aduc
	c8dYr8dvr7Qr4YCbKqmdNsqYnm08/ewvSpPQqHGsVyUonk3HRNMtoUp+ZZNSFWqG6BRYl43TRcw
	t3bJz57C67GuJgNbkOr/pFlip4ePS+RWsi2wOR8qrqrsID4KaYczcqvAv
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1308795885a.8.1780912708790;
        Mon, 08 Jun 2026 02:58:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr1308794285a.8.1780912708414;
        Mon, 08 Jun 2026 02:58:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm863681866b.16.2026.06.08.02.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:58:27 -0700 (PDT)
Message-ID: <c3bd3338-fd10-498d-ac4d-3578db58d0b9@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:58:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur-crd: Add FocalTech ft3d81
 touchscreen support
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-0-3453ef577bcf@oss.qualcomm.com>
 <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260603-arm64-dts-glymur-crd-add-reset-gpio-to-v3-2-3453ef577bcf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MyBTYWx0ZWRfX7XdD5+J6kae3
 N/KeX7CWDzxCb0fMLxSH6q7T97Hr1Zw8daVfz/m0ZM7ELSOGxf1MLRJTVltWIttKkcqA+kbtSBe
 Lvt1qu3U2GTQS8kJU6Nl1FdyGibir4Z+dXESejshSF9c6a7cM9FXG5SHweRSIwLlJnm4ZAFe/Fd
 s1NtFZi7TIAQU49OZLjBZeSNozI1PGVB1hfS4GQv96B9u23GuQdU8FZLqitZsTqNgAv1pfUdc4P
 uoXbsnOvVI7RMjumJn1pIHR3IhFShv3woTiBYaUXRVhucsbJJeey3lNs4PFPBZxdiIcYaRhBHVC
 A/8tYnCenSeJHTXiHErLdlqM8m94yR4ENXTVyOvXDKM5VnaHe9UBeZApAr7TX4PcQB7DDjQA/pk
 S5XWtiM4kT/TVUlMLthiQ/toWIBl0oRauGkf0wG7HSvcu5/RJ0tRDLT1YiSRn0swBZUbJP6OaUY
 farUoHqGmTWrfFSscuw==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a269245 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=k8c5NOaSzwRjXQmZCncA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nmpz-MLQ5gnChEkeb2THoLTY4MB__Jwn
X-Proofpoint-GUID: nmpz-MLQ5gnChEkeb2THoLTY4MB__Jwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111789-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pradyot.nayak@oss.qualcomm.com,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Daniel_Peng@pegatron.corp-partner.google.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,pegatron.corp-partner.google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E33E65524F

On 6/3/26 5:11 AM, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from
> the one used on Hamoa CRDs and requires the reset-gpios to be wired to
> the device. Without this in place the reset line will remain
> permanently asserted during resume leaving the device offline and causing
> all I2C transactions to fail with -ENXIO.
> 
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback():
> i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> The touchscreen on Glymur/Mahua-CRD is a focaltech ft3d81,
> which is hardware-compatible with the ft8112.
> we have added the required change in DT.
> 
> Fixes: e6bf559f7eb9 ("arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen")
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

