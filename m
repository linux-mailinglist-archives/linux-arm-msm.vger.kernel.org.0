Return-Path: <linux-arm-msm+bounces-92463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJyTNDX/imnJPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:49:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B11191A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3729301286F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F932342510;
	Tue, 10 Feb 2026 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm8GXbdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsN5VP/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F30A303C87
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716979; cv=none; b=kjv/ePU5M4zJ0b8sJwoWBctZWwKTRQZFv9iCDL16DdHIRO1uRRIw3oR3tdWr3Pc7VM9LW5R1D2K6ABI9OXnQGHwfCHc4cGKAUIEehi30mDJ6cTMXkUdmBBljIg54rHuV9lfIyylAYg8WbseRW8PNJGyiMsXMEnEAqilab+bu5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716979; c=relaxed/simple;
	bh=dRZnCPSAuagSRhTHulUEKZz3BsjQ2d3mxmnElhxe6mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n6JLnitYDmGZPn7kVLU8DzVIHO2DoNZclFAsssx3R3dG75yTdtOIJSTQGpW870rB22UGcLdg162TCVMGMZMmZx/LZy/uwBt3EqYJrAxFauKwZwWszMvEOJvAANnEdXZ3p0gZ9TAUdb6i7/wRREnaDFL779luGqX4SBye3z27DdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm8GXbdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsN5VP/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A53nof801169
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WV92x37SdWX6i4XU/wGKmpKunYauVi2XV35DtT4MM74=; b=jm8GXbdV/fVAGWTz
	c6l1hlfKwOIgXXnTtL0EBIVijyQ+xiWUkgaQ58RR93BFJ9xQqOd+YNHkOKPhfYoC
	zXpdqsmECdqjWEhQ3fqL1w+6t1amM/r+CrgVKyoMh5/FBIkj0khHbF1N/44eC6Y6
	FF0Jmx1KNp8ZOjYYcfVx2a9sGkiI8+nN58TrF2M/zscLIlhCf+nC66oYgQdkV9/l
	DEyBmxSQ8z39OGSC3lo78t5ycoHHxHbx6luaZ9PcZv2X885OQg3tR2iONRhSqgYg
	AoaQ7Fo0bPDJxQNmyQ5zY+GrriuoJMQKw+prP5rtgN2XW06kYGxhsUeX1DTtzHhQ
	795i3Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7x6u0x94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:49:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c52d37d346dso516474a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716976; x=1771321776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WV92x37SdWX6i4XU/wGKmpKunYauVi2XV35DtT4MM74=;
        b=GsN5VP/kHsxS8Ick9rI0Ay3Q9rPjnW6CeLVkBJCtNXX9X8q+YX1B2ezQYWMgtPSLFG
         8+OcKB9QyRx7mVrS1NHW2T8OFzOCC99gtqoYpcoAlOiA6+K2XMzaH+7svK60x0PYTZV+
         e403SmTnRNch47sBAVSo79XrVrxWjaXKKCSwN3cE3J76GdWK23+div48ea9uhLV3yNse
         aEIpQePDE2Ss8zIUDwv2B5O9mf/QwKOCJsVzKJ72FitMOF6Ut79cI+76nOOhI8MJsVT0
         WxqcK/xZamTJt6FOxoYAK1NnpL4wMAkQxOHkYwMTD0KsVpHNzZOoORHinO15ZO3eMsoU
         +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716976; x=1771321776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WV92x37SdWX6i4XU/wGKmpKunYauVi2XV35DtT4MM74=;
        b=vkdXo64GwxLyy9oN3NSwWOegPJns0Ui0kCJU90lHvPhTTDSVFKJeV04jIbfteTpXHI
         elYrYkSNBvQyKVDsPNJo+U695dg69WltI2QA+f0a2XEhERW5aihB/1eLj2xzU1G4AKfo
         ieYMp9N7dWXrE285dRbjEviHB3pX3ZCU5R7HXQrBpXfauAQlsj/k6an3Sc5b1/aAQT8g
         0WuKfTJaQ4VEEsimSShNd20moL7y4R8jlnL6zZ5ZEPjGMks4YGwvyRWP6uyOerUol3D2
         DROVsSWP2DpEuIoD4fruY3Y74rIdBCv5XkxuB74rNDMnK0sdmD77Ujp6bJF0sEbZdk9z
         zO5A==
X-Forwarded-Encrypted: i=1; AJvYcCWMdune3jEWXLFhP8MxznDYhUWtGXARfvQd4rwmpf3bPTpzGB+0D+6YK1ltZyxXKMy0Kfmfu9nEKQxq5Xu5@vger.kernel.org
X-Gm-Message-State: AOJu0YzO42y9m3CTGk21c+Oliyd97rdSII827QZp3M8Ll8wW77ecV6ck
	IsObEtOB5bn7U2dUwh/bp9j0v4TnMyiMFb/Xzxg25bjtEsOaFk1opitwCja76+XlMfKHjClxwub
	JQ2OFzpMnBZijNiY2Z6iv052GMTS8rppL7HlAoUj5/Gto1NfLL670A5haWlMJNfHtQEZg
X-Gm-Gg: AZuq6aLY1UBXWX0WlsZ/hTN4KYkRTy3Hr2uXXFztwm3Iw1GXMrCx3c4oYn6daG/1YnA
	u2GKJtdYTF6BPhWB37Vig5KIvyLmt6sUUvu4QZX+bflw4AJPSl9EzwvdV28SZPMDoZ3vJaIKHuG
	i3iYzJwYIDkxum/NNN6xt1AOU1wn58/FRWfoA/9gfjGxZ4YZMqW1mORq8RXTc0zOPKKQFAlIaW5
	T6d/r8vSthE3geE8kveQpV4MewOdBLhaamf0JX3cAtvXq/+FQEZOIYP+xIHEARzmMNHVH/ZeAWD
	5OJfzrkkDjH00/PnU8Pp+hUEgglHYeg7OgDgIfh+vPlstXwmFqvNGx124cuH/jDpAeb2WM7XcNf
	+imdhB4qe/jYNiENeAcA/wdfgETVk6CgqSxX1/p+NfOkDo6Sc6qp/
X-Received: by 2002:a05:6a21:4cc7:b0:392:e51d:9915 with SMTP id adf61e73a8af0-393ad307569mr13746426637.43.1770716976139;
        Tue, 10 Feb 2026 01:49:36 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc7:b0:392:e51d:9915 with SMTP id adf61e73a8af0-393ad307569mr13746401637.43.1770716975679;
        Tue, 10 Feb 2026 01:49:35 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm14284898b3a.39.2026.02.10.01.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:49:35 -0800 (PST)
Message-ID: <9d3960a6-0742-4ca6-bebd-3a486a510681@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 15:19:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add '#cooling-cells' for
 CPU nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mani@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260210070321.17033-1-manivannan.sadhasivam@oss.qualcomm.com>
 <e90ff54c-0c4c-4097-af4f-7821e6c6dc2e@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e90ff54c-0c4c-4097-af4f-7821e6c6dc2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VUj3D7eMPPe1O6laClzJ3EDOQoegB6X2
X-Proofpoint-ORIG-GUID: VUj3D7eMPPe1O6laClzJ3EDOQoegB6X2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MSBTYWx0ZWRfX0udsPdmLWw56
 sc9RGCy+wbWdzc6T45V03oewRrLtiBbcAwkeNV9/NZqAJJoU/9gVzrdUPu+Wd/ryRzNTkfa1Cz8
 SR2FiMBcScdvemJ8zXlOqREHU/p+5R3XwItVoKX38UZaOytrp/LjIS1AhOaclbUjRxbu4DUWrDa
 NsNKfBTCg1aUKCCfcZTbrJKyjyeTCYiS6A6fUEJWlmDZUVGKxO0Eh/myA2ldbfJPVd1VVD55RDZ
 NC83Svvii5/hxVLK2c7CPz/4VT7LsUkYiZgMXNHPHI79WCjCkxOHmiQeQdxAu+3MI4IPnMibJ46
 JVpfDndk3jwuCJETxncaKjsTjWDMO+c0x/W375h6xbxpo14NMGNwsnoDNRG58giOGCCwmv/tDu6
 ne1IzxrBDxjRpMF8f7gn9nKlHycB1JdXbzK5x6vTTYaIO7NDzFaHABgaoDv+JbPHH5l8nTW5bv7
 2jGVJW1vQHlsObN9qdA==
X-Authority-Analysis: v=2.4 cv=YfmwJgRf c=1 sm=1 tr=0 ts=698aff31 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=KVHPon-nXVvIHQdiTWMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92463-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 731B11191A7
X-Rspamd-Action: no action



On 2/10/2026 2:16 PM, Konrad Dybcio wrote:
> On 2/10/26 8:03 AM, Manivannan Sadhasivam wrote:
>> Enable passive cooling for CPUs in the X1E80100 SoC by adding the
>> '#cooling-cells' property. This will allow the OS to mitigate the CPU
>> power dissipation with the help of SCMI DVFS.
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

done boot test also, cpufreq nodes are reflecting, please feel
free to add:
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

thanks,
Gaurav



