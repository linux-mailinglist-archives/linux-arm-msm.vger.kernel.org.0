Return-Path: <linux-arm-msm+bounces-92934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANqYLRUFk2nF0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:52:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C594143275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93400301454D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1061C306B31;
	Mon, 16 Feb 2026 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0UEOMl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L28QY/9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84AB305E32
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242768; cv=none; b=V4xZQcasLXXwkwTUZ0Nw/++qaqZPtNdf55Pc6U8otuYGkRpgFYzoQnBzdUep53QwqGeYeQvNpQdT/Emur1Kr6z/GMZJJAvw/55aOIcd51GvuRGSrvKWo7k0X2jmHuNeT1LczdaWCeRTxStljrTsLHbKhkOCUuZzGk6A96D7x7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242768; c=relaxed/simple;
	bh=ykMl0sciRzqz/Jhb9q1WlnzOX/TpjzDXC9IGiRz8K0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxp7Aa7XweO0XqDTkRP91eE0ClgCipaFk/nvsNh+tx30DfoBZLKIaTrtWbcUN15vc2pdQ5kKTt35URPaO1p6bqryXkeqNKawKftHLoGyw6gmFuQDchLvj25ntqJoZ8aQZzqKNUMXYjTlH01Hb137g5SFFuaff06VpL0IKMLNpYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0UEOMl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L28QY/9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAXFcd2106412
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKkzol3RpQUR/FhREM6X+TLy3Vg3dKc0rriSyD8MFAY=; b=X0UEOMl+d9plVB5z
	/CJ+Lskug9cEPG4xl0P+Q5Ze4HSHF7wwpyOTdVPCZaGDGJb5lh+RgMk/P1ZEjWeW
	IoxyGubCDunoaX0F+SgYJRVf+KLCLR7yNHMKDzFsguouTuaGV86p1bA8leo3Nj4R
	0d3MkRqsuCSWeyb6lDVBXhUqDWLSBTzJjIzZWF0+0ykyzF6cVPtGtQgT84d4Zfho
	44dYxbcrVZkeWg39J6RXkG/uYsQQYLne0CZum+vB4Jim7wD308O+BZ/aMH/foMvU
	7qPJ3UayUQQ38auqwFkidz5NPPJ3TfuwhQD9ODVe7xGwjtrKLo0w5Dpn6phMQkKX
	1eGxjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujnvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:52:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7177d4ab4so210149285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771242766; x=1771847566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKkzol3RpQUR/FhREM6X+TLy3Vg3dKc0rriSyD8MFAY=;
        b=L28QY/9g4m5x8Qq00p10NbiorNZUWQQVqX66wuBZ/7usn31XLNDAYlTuNu/x+/wMgB
         BKnejgDMCftd58RPZz6fYTYPk0+ThlSALOfrG7qR4DCf0+SX1vy4jZEx8bT3jtNrPI6B
         EddmCbpb4dwK9UVDOEq2T1FXIKhSgOmQqF/lntIHRuNsZMI/sCJo7tAO8iKc6yLQCnVS
         gm4QsBwM5buFNsARsFTa1w5HxGkoAbMxeq44OzuhWoKLMEsMoJaPuisk6NlhgDb700rU
         0bts2mYmuscYe4UNyncKABBpIRazy9A35BUe5sOKILA515QfOBDc1TH0AyT0W/lJb4ei
         zn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242766; x=1771847566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKkzol3RpQUR/FhREM6X+TLy3Vg3dKc0rriSyD8MFAY=;
        b=I6IQlqhTLONpH7Yj7fMMe1S4bLPLEo6EPGcHquXdmaTuXaanjXc3RojKHx5R88Ep5k
         SOG4yr+LwOxOWBLXzvtUrTeER070QQjtURRNhXqdZ0QWvRQBuHQ3aFI5c2ZOhLvIl7JX
         bmc6fSU/1ZV3V1JfLU3pegJlu//Hd/STHSnXJBlu3Dl0N2kGtkUBaf/b2jZl9vEFifGZ
         lm/h6u45PKLK5l+aJCFiU4oUmA2z4HUml3/pgBv4AZQ9iHI18ZDVzA6QnkIj10+wmadQ
         mOK7x7xRTMCtnwDy7RzQWtvPZ5XtSHVQy0mVMPCqYw29Ek+GtvwPbORofOM8yiMOXcZV
         jZhg==
X-Forwarded-Encrypted: i=1; AJvYcCWrQEBe5F+hfDgcIw1Jzgs/Nf1Q7RYQFNjKv43fDeWgRv8fuF+JfNt9a0YskfpUkCFEmB9iIzF17slcPFnn@vger.kernel.org
X-Gm-Message-State: AOJu0YytPALA5QFdxlcOOTlnnXRC16X3BAXmGOjjzKSejR/CFUi3lOJS
	wbGhhk7Z5yaKz75cD0oIt3BklMpfS3770IgSXnUdHrcLhr0RxVqmck/lIO0CGkD4PiCQE25F/KB
	XS9II9vi4Hep8nGgrv1FRfnRgPc5BNlBVa5AT57UliU1wewKE6K243F5hZO1IfaKVkQ4j
X-Gm-Gg: AZuq6aLUETBFvhdLN+ej3vYF9p6jeMPP6j0itOZv9BAhyyA9psBxsMcCDQJlzjFQZnf
	zUzZxQAS8i2R2utjK1/EW4f/HATCBu2OX7x9tTI3AhsbwSUpOiop2ivp/OTPBJHWV8A0vSEJhu8
	buW1/G3p2CLvGGVt9D5wBqWTNhUxl5KeYQnGQY+PdZauuQvCv6YvoCbyCtgNHlV9ahHYTY/xoCe
	Sae496QgMLqnzu6gCN6275Al1PiWfhVB1+kX2QG1u7t52Wuegf9PXb567G7n1cYeN0CEqIgP7oG
	Wnf4ItQ8i/wfZlrDl9WgjIOEhRrZGqzt4B0cH0+svIB5DzmtN2TCvXU4XOMmvQQh+rCjIfhrzut
	2sslieQtrAhiciB4Iko6z/gS9LEc83/BJKwrpzvNxrayayYQRZ2O3uZJ2wwrbrqi/4z6WSVXgjT
	rBh+Y=
X-Received: by 2002:a05:620a:1a22:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb40849cddmr1006113385a.3.1771242766075;
        Mon, 16 Feb 2026 03:52:46 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8cb40849cddmr1006110885a.3.1771242765568;
        Mon, 16 Feb 2026 03:52:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385f5dsm253333366b.20.2026.02.16.03.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:52:45 -0800 (PST)
Message-ID: <56158038-2ab2-4243-8ef7-b5d54014e4ff@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:52:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SWY4BjBPrZhOs51JjLomghNzt2DriDfy
X-Proofpoint-ORIG-GUID: SWY4BjBPrZhOs51JjLomghNzt2DriDfy
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6993050f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=IT9ScGb9VJkqv4s7YT8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMCBTYWx0ZWRfXxamagqcIKhVx
 UGyQaeVFxipiucy1GsnHLEYQOiM6o/Wss/K9W/RsjoOELazR6xB5WifXIb6KIXdZQooqZNfGc+z
 8k+SY0jNw13gydSgTLzYpcT23G5kHq2LPZAhYI2P5wrHGsGctJD8/tGzgnysj83wXkR21T2dL6c
 lX1FqA2jgkG0C4Av5zsYR+jjfBESV6iqlP0His1s6mdGjwnO6a54DSp8XVe1jBeNUPfdZ16aJx8
 ril9ygfz5NHJOswZup0typskXSJR7M5nuodSgnJ5NEXPabaE4J7M58f3Ha3c4xzLjp+3nUmiGKb
 chwnxxjlZna7uXF+nPdgnpxlTEbbrcTJZrD97md6cH3WN6W0VM6KftPt6jHGTz2MbSwMDdxqxpZ
 l6n8akM4bPIxaGGHOoyhEhDJrabhlZ6XvcxOwExVSoTPE0CE1Erc4am84AdDpT1mtn1cZopXJgv
 /OUXhcVlOVilobes8Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92934-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C594143275
X-Rspamd-Action: no action

On 2/13/26 3:03 PM, Luca Weiss wrote:
> As documented in the "Devicetree Sources (DTS) Coding Style" document,
> pinctrl subnodes should be sorted by the pins property. Do this once for
> milos.dtsi so that future additions can be added at the right places.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

