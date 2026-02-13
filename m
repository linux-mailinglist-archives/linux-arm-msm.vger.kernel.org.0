Return-Path: <linux-arm-msm+bounces-92773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJtgFqAOj2lfHgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:44:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9E135D2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303BC30500E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5605D3570CC;
	Fri, 13 Feb 2026 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsA/6lJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHgOxmNS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2901A354ADB
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770983069; cv=none; b=qsAjayMG39Zi2asu8UAvxTJPVz5QxQBzPi3wMgFw16jidDLzI5qoHv1AoaQ98FJYYf+BbZFdSxan4baP1rJ0CryD5e2yH8GYi74liI/PmAEYokwX0Bg4xbjDMY3fy2VSlUqdOg3NmFv6x3d+FAcqk7jLp0MCAZDrmzGPlGk/ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770983069; c=relaxed/simple;
	bh=+LcElemC9nrpmLe2wlI1S3kt++mTKmvfF+Lzk8NSmJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Koi6hxraFxi9yphZEPQvu13zbDXpMF6oO1kNSOBuvoZTPEEDf54xXg9+eETU3M8dBacZenIdcBSAyGcLL9QjnusrbzP6VpwoO47oL4xkAzOlFJilvFmflacSKmkinddBDABPV7dKrW0WwlUBwBAS8UeaGq2XtgJtzRSL3jrFrEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsA/6lJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHgOxmNS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9NeKA2733800
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vSrmcdAUNqsFYceKcue3EIkbdR/J2M9wFozyoLawK4=; b=UsA/6lJkJTcz2qii
	GXXtK0ekEnwCstsPCyrTES9LqYiXoRqqNtv7X59djSC6fG03KlDE3Umk9N/5Gjn9
	IdTta8bFwRRyjQA5k5wy4lSAj++FdhuJqtfp/t0CZpFNA5szdcfBvWiJJ3RDfkc0
	7qLDm7g2w3+fwUc5Sv1wuiR4HTDHEsRyhednJ/kaa51/1fkSPcsr7dtyv0xT2kRj
	H7s8QxlGxj6H5lftwqj/dpQSDeSQ96MaWRF9XbPivE05h13qojWwaqsAolqjcVy1
	cJ8kUSBJdJ8IAzs7APnGn2cn6moXdoscqHLL26Ty/Dy2wgvMjuwKB1DyoGrU28NJ
	CmBXsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9s6wt6gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:44:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8c273332cso36192615ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770983067; x=1771587867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vSrmcdAUNqsFYceKcue3EIkbdR/J2M9wFozyoLawK4=;
        b=AHgOxmNSbHRBCfP5a+VThY3vUc52eWNf/NDnHqr0laU3GQ/W0JPHQUbshZihy0R1b9
         94aR7QC4zTHp47gpZ70FVVubqiaBirAct1MKvo2tiTSpHbE7yL7VhRU3QrxNYj0zEw1o
         WCJfL3xVVDBYaujitSU96sB+RQVd+X44sqkO168RwnCdaukiMfGwmUisLe1omADEUHbr
         frpNb3NRXB2G5xtdNjiPBMlb6H3NqcAA73RwlXdgHS8+6jVFYnS/3JVBvKiGT121dP6P
         hINXyby7AQD7EjzQZgWVgBqbiy25uEwnH4Np32HM2b4EcHsPpDAPiVpXhNgbzI4bj95C
         Bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983067; x=1771587867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vSrmcdAUNqsFYceKcue3EIkbdR/J2M9wFozyoLawK4=;
        b=Iw3K84iu2fYIC9e2jAaBjpzWaKQ5YlPYv+7WWsYyyHWGWCYSerCClORdWepcxtwAnM
         Ypm72+vTzASMJxok+Lr+vOGxsei7z9lqii5Zk6MnlxuPcnxHlFN50jovQKhQ1gT6bw6i
         cs+fqEVblB/d+wBEhlAnQfLgYzM+GBflMjp0RCOQy75x3o3oSwImMXw5TtIZ2urX4ODB
         SCEsRZIt8sh5319VTO7LesvZhn+MykckjHNBtdHjSOQjllz6t9Wlk5WzfJUIJTo3tkKv
         LdzEKXZ0D/uRogpxdRvkEqKfX3rvGB1MNDnaq9L52dCqGoEg+/hjrihempwZghycNUyn
         s2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWD/lmhdpZ+IL/wDtd/R3WRUa1W6G9+TgGzXVbQe44JQ2DC8oxH23ACuF8sEgKEcquMmWEscz2UHDfBprn6@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5xPWEOXINBAMvQVHqoejett5SslDAKQYBl2PH6j9x9nwlGUd
	Cl2h6RHWx4Nw/6g17bbRZmEXX9kRsHGmvVfLT3VrFfHgB0nJ6AMcj1RdwpkrORn2wVn1tI+AESi
	OSlpSgnCL5vb9XTaQ0UOBuM/pkG1Okh0jOSBo2tq/MikdPejmhJ2aeC6R6eoftBPK6mss
X-Gm-Gg: AZuq6aIpde2QgH++UOYClTWeoJvOu2EIb9N+rIriCuy+pS/4e9NltdLB/vh4nlouo8f
	L0SOyEE4n3c9LH9jH4k0IPsTAkkSOPCDl8isbok6A04a9lGuAbsXYZDGH9ALm1++Oi4WqjH4stx
	JFyhvJs+vfNwAiXaiM9nAZIuo7pQ+5gBESJyODEq73xe/Ew3uZraiMnnL3jJbPW6Ca+7967Ipdr
	s+lRf1Rob11ikZuSEYjchX/XGtkon4AUoaZSbuYmntsYGWB+6YkJWG2Rg/TkFk0CmvpM2flXyjJ
	85r2S13FWbbfShjZTqV2+Wo14hDQ/ClHlWp2KqqyZjdoDQx+8zQXxVBmzxX4pVQr6ZYRCoL6IiY
	HkvNkNolKtMbEs5kCObiP+wWs32d3P5JfnpYfIsWLQIJTIl5VJfAc8vwjWg==
X-Received: by 2002:a17:902:f611:b0:2aa:e7f3:fb05 with SMTP id d9443c01a7336-2ab5064a0d6mr17365605ad.59.1770983066665;
        Fri, 13 Feb 2026 03:44:26 -0800 (PST)
X-Received: by 2002:a17:902:f611:b0:2aa:e7f3:fb05 with SMTP id d9443c01a7336-2ab5064a0d6mr17365185ad.59.1770983066087;
        Fri, 13 Feb 2026 03:44:26 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964e5bsm117648405ad.48.2026.02.13.03.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:44:25 -0800 (PST)
Message-ID: <d5de6feb-d3e8-423a-bc68-7de90e767c61@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:14:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <20260206-tidy-aquamarine-cheetah-2badc0@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260206-tidy-aquamarine-cheetah-2badc0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w1pjQdAijFMR_c8C3CYCL0WD_3D-1FJW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MCBTYWx0ZWRfXyzH04ufZTYIK
 3EB94PHwfgS8L5JLSn5MmW/0LLWpxqO05GituvVX4OtwurmKzhB4+VGQ0L37EdBUUQuECrV51JJ
 VMXJis+I79Gt4KrvO8TDSwotQ4xKaRmK6wwaV4Yn+zqVPMyEgXZl6ABzq2ilr/pOgvTOagBRr3q
 N+k16abD504yMrlfhWvu4ggbzNEjnKveoloOnwuSjgZ4SOSdMApX8VtU8g8r7Hu4O2846EJlEF/
 81Twnxzix1qC20XLuV7bEoG5mV3yS00i0xw6OkbpLUwSS8MgYJVSs+yRnbtX9e7+tEia59GdknQ
 3mCrIQnn4atx4pPTzI1I9dXoD5CVipUOyr7Y3Y2SUOEydmG7TKDqbwIAIEuAqMJw2KT5YUwUOGR
 d/xDkm8qn0YD5np5lzsBQR3u2G9jUJbObHL+MxBtVjVPrf50owqYWnGs7a96o9pmBc2pnTFRZaU
 HPWga9wAA/AVmUgnEYw==
X-Proofpoint-GUID: w1pjQdAijFMR_c8C3CYCL0WD_3D-1FJW
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=698f0e9b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=Xc56VXtM65tYru8N8fYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92773-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree-specification.readthedocs.io:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1d00:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7E9E135D2D
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/6/2026 1:43 PM, Krzysztof Kozlowski wrote:
> On Fri, Feb 06, 2026 at 02:44:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Enable Qualcomm BCL hardware devicetree binding configuration
>> for pm7250b.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> index 0761e6b5fd8d..69ad76831cde 100644
>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <2>;
>>   		};
>> +
>> +		bcl@1d00 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
Ack, I will use node as "sensor" as we are enabling hwmon sensors here.
>
> Plus, I doubt this was ever tested. Considering lack of internal review
> I do not think this should be posted.
It is tested on qcs6490-rb3gen2 for pm7250b BCL and pm8350c bcl
>
> Best regards,
> Krzysztof
>

