Return-Path: <linux-arm-msm+bounces-100656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ThDoC67/yWmj4AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:44:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4896355577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 06:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 507F93003818
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 04:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459CB381B1D;
	Mon, 30 Mar 2026 04:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAU+51BD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7r7ncy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C4374E63
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845867; cv=none; b=FYrKqBKZb6eVacJdw1wYdSPeIr+lbDwMiYh4Tw3fV3iLaTURfy9GnMMTTI47ITUgJClU/26C+uZnrl1lrnAg3wzSfPzp4TlwcbwzjN5wtOt3p5aA7KTWKkibIgrXXo2Tr6nFH37aRav/WNEMHe/kwKsw6GSrA/aCfH0DNFgXn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845867; c=relaxed/simple;
	bh=uyfQilYdCCjAPT8/So/ShWe6NNCP5J9ta3jF8nqK/lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnZZGxtn+gh+vvwxJTBHIMgjMPDjhTrfDHLJtJTGyA8nyYXNEgaBFVnbXqKD8ec+AT76e5iN/RPL4mq/vunPaCI5dtBVwUXezwZyIG9znBxG+Vm/CRigkVVJFJiuZOZgt2AL2Hkg3BJkpzQSI4iAnV4CsWdx/FgxeUz0IZtj7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAU+51BD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7r7ncy+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TH0P7G2964239
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CRwWQquz2DyYJPWRUFS4WTKAOMFffdNJez/Sd08E0pU=; b=jAU+51BD/H5ctyI6
	hEfhf4aK7TC7Ml4LYiUzHWuvbt8BdcZto/8B6oTEjgXZOUoeN6+khLSoe3RPDjtH
	jSi4Qcuc+K1mhA05zeEWywJ9BOcUldYnYk88JBZzZXaBFCjnVJm1eDUH5RPGQAjS
	rPENex1dHDQWxt28Tc31XoOl7qVq/vEBoi7fw5IwHI4txUkBWD7eaAvf8h8VXFEB
	tOlu9x+/0MjC0mJszMGwIqF7by4zfzO76pMkRLPn1COpg3/PABNHYLMlSgH6hjo6
	qzqd112FtWBk1s3yqXdTc2Qf+3YWYtajI8zPJlrfWf/Y/8q836+K9QN+I7wfa1O/
	1scEmw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c2as0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:44:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2471321dcso56174375ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 21:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845864; x=1775450664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CRwWQquz2DyYJPWRUFS4WTKAOMFffdNJez/Sd08E0pU=;
        b=e7r7ncy+YtCRCDxWcY4H+K/+ts7MZ/DD9rctQ5rInF31eK+WtzzpmiEcVGcDlZYYwv
         EUJxQBrKLnm6Q7z7uANoGCEGY69tPUWhgMqOZdd0bBtJDIIZCU4IR8EnV7iUn1B0VOVw
         L3zHmNz8v9ONpTysGQDjZXHhmUoX0H5K/1cm2NSUJEe+yloejaFH9rHGSfNLVMhOWlUF
         nvcToyvwhBMFr1L1xEjyIDgysL+W/F6Q/QoXouJvnI4xRLfOgiQYdjJCoqBwVfdYTGaf
         /unTXDVP+MqH8Sgz2NYS9nDMOOK62sQ3/Yp/W0X52APlLiQyrKmfQqFiD3VHOw1m3BFd
         GZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845864; x=1775450664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRwWQquz2DyYJPWRUFS4WTKAOMFffdNJez/Sd08E0pU=;
        b=pvxHCN/aDJmv9JbuC6tVqhQ07iV0SlIIrrP5IjIvuwhY3VyBGeXKma6JWc0tRiCEiR
         uN+NxOjG7kvb6dkuKwWtsPc7NOkBLg4rHUyF4Lg/GV4yJ9YgS7sKzgR/jzbGoaigx9lR
         vFgf5+KRXDxEHtjizXU/F43t4jxQcgT2w1p3zzrFT7UwFKqMuFRvt9AOkd4zEgn/7auk
         dNvzRE62xPtUAnRyLAVc5PCc8jSK1Gplp9C6xKCUUVKUFbBBcdXNOaNHQ6kMyEpwCg3p
         YVypT/eFga2c9qTMKy/jJjf0VUvQdEVQEtJC7Jkrjoveg1kXPXcclCC22z4JEx0ME2so
         mwmA==
X-Forwarded-Encrypted: i=1; AJvYcCU/3bS7e6kGOKzxjexXP/AOUFP7IA2lAqOjhMokLyXkzrtAp6Z9KTOW/6UnnRCF8eZWUFrdzjzF2gWbXGgp@vger.kernel.org
X-Gm-Message-State: AOJu0YyDc1DJWyvAT5Mmll7RMmZcPyhm53bWMXVsNiGxC46HXcjFg4XU
	ZzPVexzV6vq2V6VD2+AHFOWnVstrv8g94i1ulX6LW++MMwjouhGL+8FCyfEf7en9nG9W1KNQDbu
	SRxymcFFLjFKALXfP3LpJEoQyrqp/bTn71B93++iF6h9dCstxAnQBlA2pYFi2rc3Xwb9/
X-Gm-Gg: ATEYQzyh/rqzX4EXR9ZYvHF01tQGDDo4Ul9SPTso9KJQ1W6jcQdLBDXwdMMaxL2XD5z
	2tyLhfQzji7WZ4vw9or6562Van+K2UbLTegG3cDDDM3S5jtf//gVATG22Vd2RibUArfK507JqT9
	uzBtYdDokIpP9Nccrr5XgZiHE0qFZZR0x4eJCJAde1zTnj9qDkeTIhmNPHpXoFykZQZC0+xBJrF
	yY+tpAZaHWfwErVP6VSw2D++MOt/lXg+Oji5H93epBUhinnF/Fn1JQ/9ueZ+JYlkkuEy2yPMji/
	GnDOWBvhlUKlG+TqPgEgW7w5vhUKBiXGtVLx8wvziGoY1JyJSE7iGztefIq763bhEWUwi/SIONw
	zQP7V35uhoU/tdfaX3pyx9z17GObj+u1LGAeh9A9oLkj/+YniagAHug==
X-Received: by 2002:a17:902:e74a:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b241a99166mr80322875ad.23.1774845863924;
        Sun, 29 Mar 2026 21:44:23 -0700 (PDT)
X-Received: by 2002:a17:902:e74a:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b241a99166mr80322645ad.23.1774845863429;
        Sun, 29 Mar 2026 21:44:23 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24266e487sm63551405ad.24.2026.03.29.21.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:44:23 -0700 (PDT)
Message-ID: <4659529c-c3af-43b1-a5e9-c65b968f098e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:14:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
 <i73fny3nxdljztry4qn3rotjtrjnlau7oxzjfj2bfsox42ylti@lllrvsc4eyum>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <i73fny3nxdljztry4qn3rotjtrjnlau7oxzjfj2bfsox42ylti@lllrvsc4eyum>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX6k0JAL/1r0hv
 FrMg2FTviJctUVJTByEuX6xNdPsJ0F+v2GNhhsqHgkvgazyECfL78D67F2RxS+9FVUt4VYKUAb7
 fgqkkzfks83JPKROFfGdkikpeYBRBWYgT03e5NOGFdwrvfMu9jYz2GqfmUfYoqL71iBua61CgaG
 aixPErhvG4De2+t4okEof3Yhi7oROwxD6bypwlEAovMXUQwF5zXCLT4H9g7SBXELE82p7poqlhT
 E1AF6D998ijK0KD68jHMlWbSOpKqT/6q/bhS29aCCXWIBSYjsqRmWxTo39JdF8Y2FMVqN5RWrEh
 REG9GZ3d762nTAIF/hU28jGYfQBS0FKC3ccTjaLL18VpSa5Ud6FZJV2oHnAU6RDe5UaiYwq6fqM
 u+aBB0l0kMPZy2L/JyEtQgd5VodhW2LHzsMmqn4CMdwiedI7LSCWFjCNrRB2k79rw+sJk8ODc5J
 3zbD5jP+Xj9dcHVI9Qg==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c9ffa8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jSZtOnyutIQV87HTN0sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: gYkIIX8uzYZchMQSGXBLVghhaisn24KB
X-Proofpoint-ORIG-GUID: gYkIIX8uzYZchMQSGXBLVghhaisn24KB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100656-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E4896355577
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/2026 2:24 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 06:43:22PM +0530, Viken Dadhaniya wrote:
>> Add the missing QSPI-to-memory interconnect path alongside the existing
>> configuration path. Without it, the interconnect framework cannot vote for
>> the bandwidth required by QSPI DMA data transfers.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 6079e67ea829..9a44bb3811a7 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -4312,9 +4312,10 @@ qspi: spi@88dc000 {
>>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>>  				 <&gcc GCC_QSPI_CORE_CLK>;
>>  			clock-names = "iface", "core";
>> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
>> -					&cnoc2 SLAVE_QSPI_0 0>;
>> -			interconnect-names = "qspi-config";
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QSPI_0 0>,
>> +					<&aggre1_noc MASTER_QSPI_0 0 &mc_virt SLAVE_EBI1 0>;
> 
> As you are touching thse lines, please also switch to correspodning
> QCOM_ICC_TAGs (and I'm not sure if those should be ALWAYS).

Sure, I will add it in v2.

> 
> 
>> +			interconnect-names = "qspi-config",
>> +					     "qspi-memory";
>>  			power-domains = <&rpmhpd SC7280_CX>;
>>  			operating-points-v2 = <&qspi_opp_table>;
>>  			status = "disabled";
>>
>> -- 
>> 2.34.1
>>
> 


