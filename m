Return-Path: <linux-arm-msm+bounces-116696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3UgiNNRvS2qQRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:05:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2270E6AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:05:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tq3L3rjf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="bJ5bkz/8";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116696-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116696-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BF2A30297AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FF93C13E0;
	Mon,  6 Jul 2026 08:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659F3EDE59
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327942; cv=none; b=Red2dyhw1mD4tLEACsN4WR/GTs5t1ALxM9ZAHMM70TMYxJ3BD3J8zkDmve1i9YxgqE9BOVIXoKNeIAGWghFiy4VrDW5wBTIyk9FmJ0qGxP7N+iK2rN7tM0zXFimsTFvlAG9st34Px6DEAo6Bkefz9U5+KUtEAxReRs8wCndbNR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327942; c=relaxed/simple;
	bh=tYtKorlCjSEc+kIak32nX5p+8YIlegseq0j59+xyY80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn7aybXH9+yvh+vWpU1Ai8PgTMOIZr8ZBZQgXY5BmHMfu8DQQkdRNhOJa4gjkWdz7YlH4DfPbDMjKkiEhj/AKdOgBorMwJqFFlBi2DeEgC3Z0gqTBAcvT+85FZU70UpbyLHYmF0AX/DFAJnlfusBf1fgrOoXJbHTtuKCOP5BSTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tq3L3rjf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJ5bkz/8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641c3l3614111
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjFNLgTs6Mexw45vQ9qrAv84qz6gDD4xFsiNHpVE9Sk=; b=Tq3L3rjf180cAZKe
	+Dc/jkaNBOrUwy8VZMIZEurYnuq5UBOIVbh5Km/mxnVwZU+waMqGzmoOEyBqQUjO
	5N7TJXoMBja8scaga0v/A48mwf6NTxB04hbPfz4BY64E9t46fvUSTTANMqucxO7k
	Ilk3pg/Q1lLRRPE7r8AAYFs1wacHrButgMdXUafOJGlwc1tG1nTNS7l2Qzczdt2u
	WSCm8uXPTZwVlhqZApLYAArTPrCiEPo0HYYapaftRwvMJBxPeJX9rT5bJUUlgYcv
	iGJxabWo+GcwskJeG9jnhP1/a+yZBx8kKOqu/gpYqkMUlWLpVQGYeYo5seCczCFY
	DJ+wRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnew1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:52:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c82843005eso52103985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327932; x=1783932732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjFNLgTs6Mexw45vQ9qrAv84qz6gDD4xFsiNHpVE9Sk=;
        b=bJ5bkz/8iBByo4/ethiCkfUED0paX4bn4Hd4syrQOaMBx5OdGLb4U/ozYdS9EHIurj
         pPzNa8iUcI5xbfrHQLPGNFxbKUsgiaMuK0RqsnDmYe0KZyJm05mn4sWcLYYl//9IzGwq
         bA2ylyWUEztzROsYUEzSqG9SPAQtR0RqDDmWX5JbF7qNHFZ80kmZYCM8gP9aJ4FhZOUn
         RlYYdfcZCWVAPqLzCOksJkIAwKwAJYlZnqF0iD4XbBSF7rCemVxgnOGZU+cd6OB6iWAB
         vh8dO2D7OJDyPOBh2IUfSXqCtnBXFB20yIbOZ/Z0eNKrazQq3bDu4eSFSHn59Z7g8KeQ
         gmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327932; x=1783932732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjFNLgTs6Mexw45vQ9qrAv84qz6gDD4xFsiNHpVE9Sk=;
        b=mKH6clMWyv806nvXtuCJmtzHnpc3wCYDfmCXUpadvmE3jvQgPflIRYN3om15BZF+w9
         pcoSemWlPUt70YV+qZ9/ub7tihuk5C4RN/3KBhnv8QmtJ+HNH1buWYExHmy+c9NHPQ0w
         2RaSEzdpBB2pIC/TnMj4UU5bRepJJfLriBB5iBXFtIEv81RcTXrTTt199c/oEfujgtBb
         J3su00bhMDNCWEbKTEkNRN33daBjTKU4rvxxOsK5wK2wpQtVB11e0TaWDEg9xpGTIxUM
         UNBRNwl80xZq6PS3a6Ws7MFs8KuK4dDNkZBIgOArsN4vjBzSuzQZjeQnblUPTdUVzAbt
         J5Ag==
X-Gm-Message-State: AOJu0YwVMmZiARUCXOdWLJjqNjfKKx5Q0tgVmXvDcMwp5GgukXx+C27q
	NJZZcerCW8z/bes8oRPhirpcNaPLEZszmL5oF/sbx62BVLf9SvqZkC4zHGo6ANLy+2XVacguFjV
	F4CLRIuJ7nA0LPVIpLDuaM00ck6MSOftYB+Ke77cMJfPF/bRl+aJ/aB0Sk9roo1s4hQY9
X-Gm-Gg: AfdE7cmojpaK6Akd8BMRhycXYwroH0QVSl2dIdoP/Qm2L6xHsiWlv27EzrA4Z6bUw7u
	djAXa/dLD52Q/MgC6q3FlHheJ6qXkRQ4ym4IysgfDKfUyDAy4OWBwGyVyYAqiOvVJvrDJ0Z1WVw
	QDGeEAIWB5EhfZHWauqPEkBfLnJgR6JTJPIsDqkQdpqz1m2Nl8lz1OJOor9tci63tgkRDgV5XOM
	IPUdhn5E+cfHEc4PDSIKCC61VvqIOgxstlkVuI0x1CA6DRPs17tg0pue74+xK+y7e4ZfLxj4JAm
	9ZkRQm7d6FkQnX/FsNv+VNTPM6o6SNWSZS+xOGGL7SIj5idgm4oWnj8N2z65jpwso7dTlg5wYF7
	Kl+3tF64QRhBccFaV6fjHLWCf1mrTgVEj4ygnnULb
X-Received: by 2002:a17:903:3845:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2ccaa36ce09mr20820825ad.14.1783327932098;
        Mon, 06 Jul 2026 01:52:12 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2cc:aa36:c046 with SMTP id d9443c01a7336-2ccaa36ce09mr20820495ad.14.1783327931503;
        Mon, 06 Jul 2026 01:52:11 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260acsm46383945ad.6.2026.07.06.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:52:10 -0700 (PDT)
Message-ID: <52b7ee6e-bd99-4555-8a49-6cdde1331714@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:22:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <7815e3ac-30c7-4564-9a7a-6a1ecb9278c8@kernel.org>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <7815e3ac-30c7-4564-9a7a-6a1ecb9278c8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6cbd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=DWWUBYW1OiKU4YM7QbkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 1NXccj0yeUDrEHos1g92mq416E-JjPgY
X-Proofpoint-GUID: 1NXccj0yeUDrEHos1g92mq416E-JjPgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX5cVkZLf0jBpF
 eZYMoledGQxdvBujFnri1eEMAm9JI0F0WvcX751wcHQsrFDaZqP0WoqXlAvsrUmX4NTgHgZRLtm
 yz8mLuBnrCYYLe7L6wJAkAVNHrjiwA3woQRIOPM+4Zu627fhgHjAwyBnDxiJL8jnP2Pe2CH5S+C
 bjEaK8u2zDdb3WY60S0ClL50abLtSL+YKcqtrvuvCngwts4v/p2bRY52i3I4SQ3XP0NLM4BJNmY
 DuN1vQ1LY0dBDP5GWSmO9rHxGGzzMsfd6PH6LLXOI4VIGvjvk6nG50fGRl2AT0CWr06Yx7iEml8
 TqjIm/pIaF3FMJro5B7Gl19RaUiJYltfly1AK3WwuyVgEPZOs73g4aDV0nH+muKhReiyIRCIJ4N
 6qmGQGoxU7uTbU4/oyA/TBhWS3TygNT3oval1zdZKtMDbcvUyfV/ZSlnKm2210t+2JD+M9lcPuM
 jNnSDT831k5CtoY9uEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX4/2FMagDCl4I
 1F4sAM6tXf4aLMIkSNflUyFxOgiprtM3ln7K9ZXe89hGXrcxxgFsQcW+Inicrmyzp9qXrJ+K408
 4UXIrzZdm4c48jPu7neL0F0xVEUuRd0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33D2270E6AA

Hi Krzyszto,

On 7/6/2026 12:03 PM, Krzysztof Kozlowski wrote:
> On 06/07/2026 08:04, Nabige Aala wrote:
>> +	lcd_bias: regulator-lcd-bias {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "lcd_bias";
>> +		vin-supply = <&vph_pwr>;
>> +		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&lcd_bias_en>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	vph_pwr: vph-pwr-regulator {
> Why so inconsistent names?
>
> Anyway, drop the node, not used and not controllable.

As per the schematics of LCD display Bias driver , vph_pwr is used as 
vin for that.

So I created vph_pwr , if you want , I can drop that in next patchset.

Thanks,

Arpit

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vph_pwr";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>
>
> Best regards,
> Krzysztof

