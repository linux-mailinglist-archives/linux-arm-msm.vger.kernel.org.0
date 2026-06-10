Return-Path: <linux-arm-msm+bounces-112448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DOq2KIhWKWrsVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:20:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84464669334
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:20:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rro6mXnw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N1eMuy+9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112448-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112448-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E90D3300EDAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB4840682C;
	Wed, 10 Jun 2026 12:20:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD983F871C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:20:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094020; cv=none; b=Eea0KkAJ4sh0vc47+XWv3QxY61G+mwWZkIeMzvQ6bqvOHJ1pKtRZa7n31/4JVmun1ckK1IpKUmbcuDZZp7iBeeLCsc5uQYBqglJAYv83LFQ6qqkenxm/KHbMYBMnLeN3Mvhkw5lZ+1ruTKwK26ARsVUSpBZrCgvYD9fcNe6ZWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094020; c=relaxed/simple;
	bh=n05w7UKa4EOGpacFVht3bcetkCd2ImYv2BLEkQIR8ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lL4P5wIpSXkWv9fGNCex7MNj1fVsLqS3uDOmvLrYRZhZ4BXMn5OrBWr7PGyqMYB3beO6SPazIIQfsReHn0bY0WRi7yz/zNFHwVMYcnGAvrg9TVwB6Fi9UNElQmtxifE4VfDB01g6uO49HFhMP3qFCFy8E+zjVYyGRMJLjWaR0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rro6mXnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1eMuy+9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACC02a1606476
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=; b=Rro6mXnw2bwZJ9kd
	tAEdKPr/Yu453AEL85ph0zrTEDSXmP1sU5EICBb9z2bS3+SEOxLbVbQV36x4tyZu
	JRQGSHrMl03F1jaA5OoFEkE34A1ez5Up4VY+4DmYrHsaJ8N1KZwa/duytBYycttg
	aqxqjghoYF+Kx1uqlMpX8kaCWs7ms/nR2OwGF7a71RQnvSKiX4VbTObbSSgwseb3
	rUeKo++PUvWmrUsBlxrM1fGRfHucZ7ZCp6rTZD4t9o//boO/Z+AiUNQweWEsdW08
	5D0ctAr0b+2Mch+G0ccnCp/bHHmiVrwqxBj+dQfgUB/a3rGsnSNVu6TGG1MWXp1E
	Hnnzdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9qhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:20:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915732517cdso91233085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781094016; x=1781698816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=;
        b=N1eMuy+9ess7gU1xqQ4AqLL0ZGtWWZwL+hmCdfnrIAsWyBcAzOaMYa/ivX/S9KEMT7
         WoNAKNAbZXqPODq5DBfIbWNXHAXDdRm5cRJhBxMIbdYMqJmPcWn4ZaOYLBiRyX4hEiWq
         5S1IrfulhFbvYgJNEibVJ2WFUIosO7pkql9/NuRrirsCjKlYy7BUbY8QznpktxPl8Vnn
         4LNo1oJNaRU1TO6PFkz+sqw7X1bp5Yvfy5+TsUyMLL+xTkk5bpNMvLv4Jre1GNGmjZhZ
         F56QcrhJnySdxATk4gJlnbwnZ4Moro3tGdDvBgieK//nM8KkT/7HmI18fB1xuIYdLdOb
         DIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094016; x=1781698816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhV6KkeF91rvMR0xezabgIbHP1+phX9VACeNByFDZyM=;
        b=n+w/HDja/SJEWGXIQtKzUKZn5+MThzDXzYt7FIuI+hOtdtRbc/mW1J8VR7l+xcjoVo
         K6O6B6qfHsaag+62TxYI41XOWNUHNczU1EhrPCExagBobZW8zNuzmel7eXhnJdSEQhZI
         XeIn5NwJyzeEKv2gOvTq5oFo2XptODz+8MC7K2NcpjaKvlbZFqOxm7HxiHtQ9U7PHQg/
         jzdXZzbvMiwWBOUk/tACtmxATf0VswvH+jeGW4YCK9OUjsYfHOS35DHhrgvGJopKzm1U
         HiX5HruheaffpzcLbBV2b/PayfN2IpAerlzCuCqM8bMssLP3v4Oumcg3DflxRQg0rWFR
         6v8A==
X-Gm-Message-State: AOJu0Yytw17wiIjbh5MADOhtJHvUAbHNNJmZ9ZUUvxh6oAHuLWW19z4R
	xDdPa2z30wPAB3nRukCWWnk1nRWdX3hnql8XBn4+qX1Zs9i4NqpYs+PmOIQ5OD3QQER7/ktO9xY
	JA0Sn1NDd+XtLWc0lESkipB/EDwgO3R/1sqVb5sRJfPa+SEP1xC65jZXT9Qdx9IxCUbEr
X-Gm-Gg: Acq92OEiJGcuq9F0ALv63AiJkWkDRZMHJiTmRQyU6cDXINlUOL7JWwdi4xsRsvD54xT
	ylyR6jMZw55JQuqYCtav5/wZeJZ3RMBHKfgoXy8RXboUOdl+m5jBSYJF6RepojDCcfwZShnkDM9
	RStxGdohNerhUiYqDsldJ8ucOqdkOsmI5ZdWnJNCyKRfmJ4aNQtTRWA8XR8FxTOryyilZEv4DoH
	vNGOJZ0S7q03NNTSOKLJ8m3RWE+lOv8T1LDrfAOz1o2sh7+yWY9HxUbn7skqYsWwrkRFkmWtelI
	gj9qq8yo+TkC3dL5k5+BVtM9qCPQiFsTAvOWS8kpt38ftKpxL2yUp6wq/YhKzVgHwcmo4D8xm3I
	1fZ6coDYkTb4c/MWziYe5sS6MZkNNMMB+5udZ0JP0FK6XyNeeAWsPmi8z
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr715458185a.1.1781094016399;
        Wed, 10 Jun 2026 05:20:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2a12:b0:915:6433:2599 with SMTP id af79cd13be357-915e6cb8633mr715453785a.1.1781094015831;
        Wed, 10 Jun 2026 05:20:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm1189730666b.38.2026.06.10.05.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:20:15 -0700 (PDT)
Message-ID: <29e58a22-fe1b-402f-81c0-e12e540730ce@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a295681 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B3kY6bDR6iGi-FOxjEwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: DaWzoYGHUYJWBDyzne64jKl6USL8gc6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExOCBTYWx0ZWRfX83N2IkqZwnid
 8Iip4qUGIQc68jYkSlINMVyDZuiR/aojVhlIZuhcDmvEKRwC0Xin9R4HBnPDYLFaTUd0d04Bahm
 XMutfvXlGosqlj64hQz6It9mYq8lT1ZV/ACyYEwqBGVgQBKEKax01IxEB8lUSEAiaji0VPcJmn2
 6E2ZQdqljtws/fyW69YvcKG7QYTTcYp9WCYW0zRYFMsPSoFqBm1JAp2jK5Av3R0SnPm7yYFswYT
 pMtMujo21/vch4gFO4JTwtQbm9UU+rMsYV55EYEUKagkrcuAE8YOXNBsYX5ZvzoWGIr8M14x2BL
 IPPb8NzyJJ+OLFkXa7e4WVVCe44OxYoY9w59LyKFJO2Nk6TKSaYXjykSjmxQZpxrknv4YH1CuSZ
 Lh/11cIo7wviRzKY/jNdxziSAM6dESvge41/seoPpp+IYw3Jy+qZguLJMM5y1FGBSZeDOgGJk2p
 LZ0oCD+dtnS4wA7UY0w==
X-Proofpoint-GUID: DaWzoYGHUYJWBDyzne64jKl6USL8gc6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112448-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84464669334

On 6/9/26 8:00 AM, Vishnu Reddy wrote:
> 
> On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>> MMCX voltage levels.
>>
>> Add MMCX domain to the Iris device node.
>>
>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 7076720413ab..6150380795b8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
>>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>  			power-domains = <&videocc MVS0C_GDSC>,
>>  					<&videocc MVS0_GDSC>,
>> -					<&rpmhpd RPMHPD_MX>;
>> -			power-domain-names = "venus", "vcodec0", "mx";
>> +					<&rpmhpd RPMHPD_MX>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mx",
>> +					     "mmcx";
> 
> With this change in place, the backwards compatibility for the incomplete
> SM8250 ABI which was merged from v5 in this series, which handles the return
> value of devm_pm_domain_attach_list(), will never be hit right? If so, we can
> remove that piece of code from the driver.

The point of backwards compatibility is that we can never assume
that the user has updated the DT (because e.g. it may be embedded in
the bootloader)

Konrad

