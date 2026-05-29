Return-Path: <linux-arm-msm+bounces-110243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNguLr5iGWrDvwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:56:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB76004F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C81023148612
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A11C3CD8A9;
	Fri, 29 May 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmKtrD/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKXtChek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2C3CBE71
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048310; cv=none; b=QiR79V92mI+sgLW4LCRZLUlYrQdplYpYJ+ZE4hMHpAp54IGivlSq4jFEJl++UodB+3NcpNZUrEkDnqefr7swYgzlZwleFLV/nlBsd2KyWBxCdoNfC8E+bqhP+2I33vliE4ndVH2VbsGQYtlWBVGJ7b0oaKkXhWsA1Z31WETHkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048310; c=relaxed/simple;
	bh=zoyilBfk5qDO8hOlBWwDvNYKqnHe5RN10J6n1BXF8tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqGNRH5NaYNhBRM/Itu2iSRLmOZQ8QiTwdfB33d5FBS+GyYxriYATghACvJGmD4vWl2Tj5DwmGYoZ1GgAiEftkemeEnL02KnOb/zvVlSRmEIPlditiGat2+U43YvQX7PS2kKbUTY7yl0rkJ+eiXkaWFvq/BDhRkqHj5LKAjhSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmKtrD/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKXtChek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6UEDR1370222
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb/59PC5N1mTfolTJiRqjQBDqh2SUyjAiE2eqB+Z8IA=; b=UmKtrD/Vlb1grMgd
	5XI19AMj4izHqFDpeHpoNpUfqKZsP2XEM6zXaz5kX5EEZF9W82T/flTpVpJi3M/k
	ZMyp9SNWmhHFOBQFWjy8S0XPjzweWkxll0TddRmpds8ZA1nF6IRwJHGySClBrF4P
	2becXo2opzklkwMVO53N1Mblj97AqoDHPey+cqEBwgcTUjQz++roPthsURDNagdz
	SwwKejLMIWx/sqKW027P1C1TRGKOqhRyWS8p2+ty3dLfCCTepWpincXOz/w0cgAB
	WTkEVzAXxjRzipe07kX9kZnBkqkH8lJZ++MEMQRy3xjUP9uhiv80KezIvbFjGwu8
	mK5R5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5ujfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 09:51:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf2bc4371bso1099095ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780048307; x=1780653107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kb/59PC5N1mTfolTJiRqjQBDqh2SUyjAiE2eqB+Z8IA=;
        b=DKXtCheknf6hFxeW7vRZGFB4gWQr5DKeP4nZPRquVajil4ikHUdQ6nUjkEUDaCHHF0
         /AauzyfwA9aTkyXZABdov2rF1c4wlzCQ+6zMAsMylQiAtmaAhDiQbW6hnKzl+DrrDEzP
         uUC2V/62cOilHrFpmogdHIeEND3ymu1JCCS3d7PiTMfJ+KVYs4zzqIYHLzW3PYOeY/nL
         LvTvtwctut2fA9e5/2psVlPkvXyF1ThP3YJYU64e65ch2pGzvNky5gDEAs28mx5yP71M
         ipqmB4Kn4Vy32NmuYwDkMx4FcirETFJsJrCPuFPCXjm1fhMHyVTOL5rBVYKLJ+dUbOm2
         TiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048307; x=1780653107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb/59PC5N1mTfolTJiRqjQBDqh2SUyjAiE2eqB+Z8IA=;
        b=bPCZIMjUr52j+EpP0XpjvkxJlxTTyPOroCV05mAecj61RtCdRDsfZ6Ex7pMMF08LKg
         ypC4876W0339tKFA4fcEdLakCSiiivKH9UfDlscEluKlWiYeEOctpEM+KBNAMiC1+QSC
         T9zasY1lqHB7iNyJTIPUKySGblJm9Ww6rix7X7cgb9EReGLpUwDER5oCb7wvnds36hGi
         XmOCqeJ/5SOptcp8i5EJ6GuJXLZI4oDd7sf3hwiElQQP7BPrYpMSgcRgzJSBFOmVRyGh
         hw+eEYsploV3XRIa3aAnyOxrUKauOToRbgGtZ++ny9hW7daBsMMAcqmV9DRqfus4NCMU
         ZMdg==
X-Forwarded-Encrypted: i=1; AFNElJ+ZUSmMt0fFv2hjUlDP4qo9dJzk7oGgBCTUiLfLGainl1oUbS5O2su3+37Fj6kCYbrxZ/tLb6lsjxEsK7eq@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFRtq0Gv30Oc9tzyXb2/sW+z5oRjx8TtRiN66hUMyGiG50T05
	nDguz8wYSM1O8dmZbbuMJPNqMDx9vnqjBRhgV+XdowtPjUPS7rHdT5yIYIVBEzvjH2DznxvVkk0
	impIdRSxc3JMRCkVjYAKvkf46EPrIrRdQbdx4olGy3EzFtDwcnNh/o9T5Dvk0J926fG4n
X-Gm-Gg: Acq92OGnOMVc3sG23MnT8L1R6YVoaTjioSSu0cqjv7OyNRi+mE/Ww3G6/71PQd7Kvj6
	86G9Gm9PuLL5Aa1QnO4QALlQCUuzOi8xdFH7vLzacdF6W4iePUAWu1dd67uuwhG9OFlKTJ4Bg2z
	51ApAnm2R6YBVJbxVohaE2l7lT/7urR4WVRqkNBXrQy7DL8xzNNyFaG5IVMjTpduFhkFW1TDeYv
	W8actt53udCBE6m7W2sdGdg7EgT6Q+NrcNY5UOK3OuEAzJBy85ML+q0D9WDTwtjnH+Jf/im3ldE
	juk5OfZLCwC05uGPo2zYwykSvnoL4rql4XqGGbGZNLTKWTSIIfImU2/KVw3V3GAddG64zFeE7rH
	nbExVQCf4w79sbkXKOjmYHdBG2qSygxaCWTLOqWA8oIrOCGrNyy3DfLESl5k=
X-Received: by 2002:a17:90b:268b:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36bbeb52b1bmr1787533a91.12.1780048306595;
        Fri, 29 May 2026 02:51:46 -0700 (PDT)
X-Received: by 2002:a17:90b:268b:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-36bbeb52b1bmr1787370a91.12.1780048305759;
        Fri, 29 May 2026 02:51:45 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c3d44fsm1608825a91.17.2026.05.29.02.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:51:45 -0700 (PDT)
Message-ID: <924cbe51-2f70-4d62-ad8d-51a7cc7d1656@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:21:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] arm64: dts: qcom: shikra: Add CPU OPP tables to
 scale DDR/L3
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-7-f51a9838dbaa@oss.qualcomm.com>
 <4ugjyb73ftcjypi6wfqz47j2vvvfxj3ljunsqlixzdzzajy72c@3gb2bnx7coy5>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <4ugjyb73ftcjypi6wfqz47j2vvvfxj3ljunsqlixzdzzajy72c@3gb2bnx7coy5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PK54WaMY_qPBgtXhnlrx-o2BGYfqm1Tv
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a1961b4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2PthHyxMAGplJbN0v-YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: PK54WaMY_qPBgtXhnlrx-o2BGYfqm1Tv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5NiBTYWx0ZWRfX5PhODmRrzM3n
 /qvDjZhUmVlCyoTS2/BqKtwy6yuDSm7nVVFKhFWASeWZhNeOGBoG6VUKCM8JYK0evBprEb6IG69
 5BjXjSabnAh1ATe7r6emgF64t8xiCndpnyAzPSlj6yclKTH+TeD/ugWH15Egq5uESCy0+uc8E2h
 LK+UXhPcjUkUN+Bb+svAgeDNf+uddgMHd9BRl0QksyzoVd0IjC6/K31ntN0qT3P5CaZeu/p+EQ3
 exi+13OzwzzZMRgr+ju7Tpjv5fdxBhlUvoJqQDHwzEf2nSbNFg4y4y9jXPl22FypslcW7BLka6N
 2u9dEVrkzfPq+gvvZ+BI1qI+B/t7ls/3uAECudwbDu/O2Xm/k1cENn1J80GxKloiU1bTgShFsKR
 OE1wZd0E6zsH6izze8dE6+QtRo82ANmOgHhVTmi69d2lQl4tfmLQ7Dv11QFskGfmwz/tOIVcHCq
 OkgtY2adWKzNJA+PmgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-110243-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[4.196.180.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 35DB76004F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/2026 2:53 PM, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 01:19:11AM +0530, Komal Bajaj wrote:
>> From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
>>
>> Add OPP tables required to scale DDR and L3 per freq-domain on
>> Shikra SoC.
>>
>> Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 84 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 84 insertions(+)
> Does it really make sense to split cpufreq_hw, EPSS and OPP tables into
> three separate patches?

Okay, I will squash these three into one commit in next series.

>
>> @@ -144,6 +164,70 @@ memory@80000000 {
>>   		/* We expect the bootloader to fill in the size */
>>   		reg = <0x0 0x80000000 0x0 0x0>;
>>   	};
>> +	cpu0_opp_table: opp-table-cpu0 {
> Missing empty line.

ACK.

>
>> +		compatible = "operating-points-v2";
>> +		opp-shared;
>> +
>> +		cpu0_opp_768mhz: opp-768000000 {
> Drop useless labels.

ACK.

Thanks
Komal

>
>> +			opp-hz = /bits/ 64 <768000000>;
>> +			opp-peak-kBps = <1200000 17817600>;
>> +		};


