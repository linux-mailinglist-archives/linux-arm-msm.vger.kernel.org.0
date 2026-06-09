Return-Path: <linux-arm-msm+bounces-112258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y9F6Ky1MKGo1BwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C7662E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:23:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="cyWQb/Qd";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XAsK9hdU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112258-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112258-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A462130087B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059B34A13BE;
	Tue,  9 Jun 2026 16:59:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE04492199
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:59:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024393; cv=none; b=mSHQK6lhF8GZLa9lvbfRqwBSRLMBXV3Ybyq27BSqlumhr2617C1sExFoj1VHmk78N8B+b61CLyVfdsIM3ZVjdTy8hUyu2eoEXNO1ZWjl6BxqJJMlqrrNdGnLASpKtli+oyd7mV0GxbolT4j2z+0Ea4kQuGjh16fbGont/4iYxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024393; c=relaxed/simple;
	bh=MNObcwtk3k62SOnd78c5GiP0KzkCASkkFMdouK8Ue6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoYdMDIiihZ3dp5kwsBdENPCFbAHAj5kScdsz4WqoMRdQO0fbkxCPrGZuXVS/yBgGlex739RxXFXMTs3gxcncfJ1kWZGJT/yIo/AwC0OHI64h/oWXz8ilgZHeQGAKpRhWGUEZVqsfrfmxNVkE3FgsAVfbYhNs8DB3UPocOxH+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyWQb/Qd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAsK9hdU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOo1l2785762
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 16:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+aXLrz4Rbwm/JvVNnxvQFAPWGYjid4r3eNfZwYnoDg=; b=cyWQb/QdL61a1mtE
	tuwsSaK2PpYEmlyq/B69ieQamb8jXx/hsdU6HQ/nd9wx1zlF93Wzj8EE2ct2JIRU
	INDa95oZeSOFI54F4SGCkP/Wp+n+2MSKVVaZJweTqwjxX55YqEDrC3tbY3SKWKHg
	gmftXMHdpbKC9yTvAPeARuu/2JYxC+6iOr7xLk5MS0s1eU0fR7Srvc4b2w03PFJz
	nu4SONvk2MdpwN512Hr94pKz0GJ4Bmcrlp4L8RhvD1BOJcIU5LogewsLb+e0pvvw
	vzM751yCV8JH2+AJo8SIrIsfwnAKiN6SjLhWnXcDDg3JlcyGsinmtvmuCQY33yNF
	CHDvNw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jt9ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 16:59:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2bf5388so3140704a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024391; x=1781629191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+aXLrz4Rbwm/JvVNnxvQFAPWGYjid4r3eNfZwYnoDg=;
        b=XAsK9hdUeW10W3Jr6oA7qhA85TIh0+Mh9+Lsnp+lgAW75MAm4ZWuLcnEw5IVXV74h3
         E26u38TCqd6npGyRmWsOyZjCt3789vps/X6qrN0s3y44pOkuhjim8o2b7/6Qy8no9gH4
         mfxtOLR1SmzmK6Q9iT7h7ShM5i4nzsI19D6+shkW3045Gs3szBHNxwccIhBkkjSHUAWH
         Bmus3VnMuyKkGHHHuWZbudi74FYasi6XvJxoNdkRrS4QI8qO4kqoP/W/hBqNBEeA5iVp
         42kKIpVhoJvyfNzJVckQr2XZZWNyPd4EuUVpGAPcbJLR6iL4mOZbxyATSoizEzOlARc1
         Hlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024391; x=1781629191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+aXLrz4Rbwm/JvVNnxvQFAPWGYjid4r3eNfZwYnoDg=;
        b=UT+r1rAmAtlmwk8atY5LShQYwfV8PgqGpQTKzjhlO3E4tXdJkecbfEJxgchsoLRqzu
         SBCBquj+9jU0my3RGbixXV0x658mAHwzrhYrrcXNy+W0qzZEAzCr7czvPy/P8vO+VAQ9
         UwyxqA+YckJTZRKhD22KqTssCIMXyUjV+seW8M1WVuBoCkkvveeLarkB0gcP3OzICmfR
         jxamFV8Q2vcU+37E+gO16zO+WNjadZn/SByP6rcLxUIv64QpLEtOBVN8dVCTWQY3ngla
         Sn3k8/hJ2sVG8U/3Zcc9iiHOGFeWcjW0FdrMcZEvixqwywrf2LONSsSgJewGr+trug1z
         9WRg==
X-Gm-Message-State: AOJu0YwY876aJ7kw+vom6OvS9bC9Ytom84+ppm7YoaFke3fwkgDwDAOM
	2gdyujMjyROlqzLuiKWhmlrn1xW0DyrDMrX6QaEy126r0veOZl9hIiEviRuk1Mj6d0JbEcVrAWQ
	QKWKeGNgvwBbv7e4OEQ7esl7Dt0lOTGdr2E8viJoMqLhbRFeRXlLYK6h1/pITYcxOHTED
X-Gm-Gg: Acq92OF4/agiNlTTS6jXEkP+d2NnXkbwmyoDwPuBG8leycMjb/MydBFx9Qurj9U7l7r
	51vQPqKfJo1fb9xe0zvKg1eBOftrjOqm6VKGbux8GK/sX3AV+6ruRG8XMgPnr5ZAc7tbf3HwpGf
	JuR/Gnq3ouEvWyLh9m6EFNkELpYai5VyQvQvbodazghNdI6CT+tN/XLME+pqg4CWt94Qf+1p7DC
	WCbWTvEaqbdG0MV5XuvnfTrIdVvA9oqbosV0JeISGOvvvyRtwQstd4KlRF4yyDjX+KsMtfRJAYJ
	9n59k7gPivYi030ufpINpNo6nyx6du5HLFhL1hLZSiK2nQRYmPJJ5s8fthzUjfrg4kEM0P3VxMd
	U9yz2ZFUnpQBPm9UOfhW/JpE3Gi67qvKu9gnyMEuXBPkDubOreoODtBbN4tUtD3vSsaE2+EjNkn
	Xa
X-Received: by 2002:a05:6a20:d529:b0:3b4:6155:cde8 with SMTP id adf61e73a8af0-3b4ccd858e4mr26753016637.21.1781024391263;
        Tue, 09 Jun 2026 09:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:d529:b0:3b4:6155:cde8 with SMTP id adf61e73a8af0-3b4ccd858e4mr26752983637.21.1781024390803;
        Tue, 09 Jun 2026 09:59:50 -0700 (PDT)
Received: from [192.168.1.45] ([122.164.83.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm19343348a12.16.2026.06.09.09.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:59:49 -0700 (PDT)
Message-ID: <9ab1340d-72bb-48df-8784-a584a37b5c76@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 22:29:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260521-ipq5018-cmn-pll-rate-fix-v2-1-04b28a92e0f2@outlook.com>
 <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <cca7e305-bdf0-4ddb-b299-aa25a183e229@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k5TDgHoJZq5Uh_PcMqkADtVwRRhUVrsl
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a284688 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=/Dmoft2P+kuiDiPUxd+r9g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=ZRiWFtQW1K3ZmbnfVNIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfX2O8TVQ2EgTp/
 srTBjMH0vKX/p8P7Q1DcMzIeJPAo8J+hexjOuqap3+b9n08H0eQy+MduXXjkg3eUf7VM5eGklcR
 8cAU1Sc5y5Net350xIo5b2pxlbkcSIDQc+hm3/9ajEyqVWZE7SggeLgj6e2fFr90hsqwpxyRtM6
 MavbWJSbggzYndO6WiHOE47gyPNiZfOy+vdE9eBQEQ0vAA+etz9r0QXN1vwWlPrub7Ip5SelYu4
 8Hn+0GXfN+Y+Em2jtES646CK9k3MsAx/PvPsHpIPcxcPoMNfNrBI9VDisn3b85vp3AGFN7feORr
 MRRvzr3GKEoBmmLiHCYpwBinQ2M38UgpjDTOGRMgiEkB1tmHOPv7XwaxfuBBcSrcpv2HTzmAg25
 4BQDyNJYaiz5HkBYkciUREMCHCSn+qx8HFB27zVwlYMvun2+Worxjr+isyr6f45+fSp85xEBbgy
 whf7dr2HattQZJ+ppXQ==
X-Proofpoint-ORIG-GUID: k5TDgHoJZq5Uh_PcMqkADtVwRRhUVrsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112258-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:george.moussalem@outlook.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jie.luo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,outlook.com:email,vger.kernel.org:from_smtp,msgid.link:url];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,outlook.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 075C7662E7E


On 6/9/2026 8:42 PM, Konrad Dybcio wrote:
> On 5/21/26 9:55 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>
>> The CMN PLL driver did not account for the ref clock divider which is 2
>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>
>> With the driver now accounting for the CMN PLL reference clock
>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>
>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>> Changes in v2:
>> - Removed line break in commit message between Fixes and SOB tags
>> - Link to v1: https://patch.msgid.link/20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com
>> ---
> I have no reference for this, but I trust you.. maybe +Kathiravan
> could double-check

Thanks Konrad. As per the HW doc and the commit 88c543fff756 ("clk: 
qcom: cmnpll: Account for reference clock divider"), default ref clock 
divider is 1 in IPQ5018.

@Jie, Can you help here?

>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

