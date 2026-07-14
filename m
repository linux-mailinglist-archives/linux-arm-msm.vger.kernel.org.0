Return-Path: <linux-arm-msm+bounces-119008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OY1DH0EXVmogzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:02:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F35753AD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:02:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CSyC2zMi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bHSn5hfS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119008-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119008-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF76830254AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8E5378814;
	Tue, 14 Jul 2026 11:02:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE453769EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:02:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026943; cv=none; b=B4dBeo6mFXeDD5n3l5BUo4kCBZaX+d+sUe7oEuL78EUnObSZof//YCmpvKQdzeoRB2SZK1yxL8Nl26bpgFvlq4UBEU/nqoga4ioqpSdD8PQ0hmRatR+T42Qqk97olEeTtgJQYO8YgSfDejaqglDHjF5SvQpykzENeYde5OlaQ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026943; c=relaxed/simple;
	bh=DIrf8INolW2F+2EY2FY68YkfAk3E+jLt+E+lPX19R2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV0mXh3PTYzIEN6xBNyXxhiiTwN5OJ+yAbP3qqgtbTy7ag0kXAD1AD2J1HDlpJL/zsPZV/on3C0dtu+waHBJupD4qxKMv1Ayyo/nvaHW39gNIv1jSlsHMBV6kMweqwKfX80+ff18LF0zqMSX9zo6qmb76E8ZSV3gEtWtl7JYVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSyC2zMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHSn5hfS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E7YIkW4101750
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHur+87qTBpynYHDCoKBSnYC4fMssFH8+0I5cbzDkyY=; b=CSyC2zMi/fwOjGTJ
	ZwKQpPTFVGdu+pFwS5jc4yP0BxGMGZ/0qH2JvsfSE+QUQmXzXCcqMYwWlA6+ynYJ
	+TBphJjAE4qjbrKUaCd9le5Fjg0MCXHlB0lx4SsYtgOEMN3xY1Mh47YJOmnFc/Rp
	y+8qx6NuAkdTvuCNFGVVnQLhPSkJw3WTulqVHigbIHa/Mo+HvIeN5CvVMdcbzAwn
	/UnqicUX5TRxTGZoBBkyfS/XzaXewSUjynm7aTaCYJIMsDJ9UzfqaWX/RYBJBvdU
	EUDc0zVqoPAGD6kz4uDeRIgKWgNEqVJ6K04+xp4eeGXwveEnmAj2q2LXKsno9OWM
	sFjkCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudgrfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 11:02:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84885a4fcabso1199746b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784026939; x=1784631739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHur+87qTBpynYHDCoKBSnYC4fMssFH8+0I5cbzDkyY=;
        b=bHSn5hfSg4i9jlExicx5MR/kCXhrBQkmYbOYMCxfms2LDBfeWKZOrLtfTyGsprOE6V
         fV9ydds6VqnnXVIp0AoI6TTUpEvgPdcg2H5EFE53EBtkKpUv76dpa0sfU20LEamhB7ER
         7k58RYQHaNUxvBGaUE7lHxcAWYBlLTQTgksM9rZbJopMMofrKhyKJRKn+y6h5n+MQimT
         4tl27GAP6aWt62nxkWeJLy/PXDqvblLtiHkz7ytJ3jplgO/8rK2FMIWZRoYrxvkZdeEF
         l1XG2uOAMtRM4u0vAjxnXNwEpbeCS9tyYs7fmGYUUBmyPhcQuZfivoQOUE2v5U8yUEDD
         zfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784026939; x=1784631739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHur+87qTBpynYHDCoKBSnYC4fMssFH8+0I5cbzDkyY=;
        b=ipgfFdkw92c6dfuclXqgG3RgdthN+oXYI7jpCAIJ8j47cZ+r67NIfqpJ/xyhXH7pau
         ldFupuHIwQFlb5KId9B8yWMyb08v4AVx18WHo9QCAd1rs6w50rtRs8R+2oJ11Mc1HSTs
         EWbXGG9iDAhz+EAdzWt09bzy/PGu1mIeJwg6zvY0k7mWMuBeinbUJH43ULNp8JvsRi0j
         tLYmNcHN6pS4SBlrWGqYyMdjz4dW0yxsMy0Y30ni/QaVWy6/fvQ5K/WdnvWoF4nJjSCi
         oVfwloRPN8eBqI1w26Ne5ITVIS3vQwbhY+awFv05wj6BlKb2zO7lKT3uhStX+cx7ZVnW
         TFww==
X-Gm-Message-State: AOJu0YyF0XrCcflaFsg28nlaRnJJARzcRmmi4fxeURR8s0pTZBgBxrYT
	Eb99YiSRh/fDa/KEWNiYshddmw8PDM3SD1IpgKf6quYGbYLwbc87xFeQW1LZrrZaHWTfQQ8FXnz
	w9ppXNkRSPQiUt/kc4GnGGdbtRC3+5WlaycQ1npwdpN4j+YHah9a8vQxSQ8je/01uXy08
X-Gm-Gg: AfdE7ck7R+SxT7aUol7+XGdWyBnc7wEp0amGAd8rpekfrXYtOc1V5jOOJK6QZFFDGOZ
	OGSu+wZRLGrJk4sDKpb/lBT/BB8qiP7KI0hITvUb/iN0wP1ZvzgA4TPp0TCqQDx0urZjeMv29X8
	I+bPT2+yP7j90oW8SvckxBAV5NX2yA7/cXDJ4JIdgEPA+Q4DQiizVbenWjAVYgjnJ5t0lfoybF4
	FU1CCNEHdBkuz6sOM7WplKpSccxsHvuDCgRvirVwmyrG82Op7bMA8RfUuD+rXB3xVAwR8mZMTHG
	JuMkPj83TYrAAMIgLzcAkl6IDnWnTyINVaNjpy3aqLBD5RQHgm1yvatUO18AGbb+p8CIq5Y4Htt
	0AdOzWKRwqP3LIe0Z/+Ze2uwNxPbeUCGC+q95s329
X-Received: by 2002:a05:6a00:4605:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-848895db193mr11759166b3a.9.1784026938886;
        Tue, 14 Jul 2026 04:02:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:4605:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-848895db193mr11759105b3a.9.1784026938182;
        Tue, 14 Jul 2026 04:02:18 -0700 (PDT)
Received: from [10.92.162.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2389e8sm1310411b3a.8.2026.07.14.04.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:02:17 -0700 (PDT)
Message-ID: <c8229f48-4c48-426c-b461-eb3421b6699b@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:32:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260706-spmi-mbg-driver-v2-0-f883ff1d8719@oss.qualcomm.com>
 <20260706-spmi-mbg-driver-v2-2-f883ff1d8719@oss.qualcomm.com>
 <67b7d76b-f13f-4dee-9b99-d7a8215da504@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
In-Reply-To: <67b7d76b-f13f-4dee-9b99-d7a8215da504@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TayGgFlfrPCMD2TIKTHK7DuV-YGBSNZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNCBTYWx0ZWRfX0ic3Ke/eotNV
 Xj4SfRSBpWz1uD2XCx4tKfxRdmLm68MsjyWswd2mjPU86DhFhJoRiJBYQoJW5qrdHm+akSGuqEk
 48sVWG1vLInX8FFKsEAUJ9DpFnijx7QoMTh38WNBhglgrYUlDujLojUv30aBDFj5HaK2FISXU59
 iCA6ebN7dUPrnj0sL/5X7NnK6sKcXixI9EPo4BCWsE+gOEtv7uI/9v/YFOqoTeSGCOmBLWUmtcA
 x8877XFX/llOlXzkRZn1puA8bUzt5hYu1SxHC1j11+3JPXwi4mWPLSws5q3D6vPmqDEDAcAyJO0
 HbV3sWC8RqT8VZ1psn1SBTbtTaDav5jQ94t2Rrqchweaz2t+Nzw8TAhTDZQW60HcbPK27FKxMdr
 t9I+6VpRx40qOcwxy7KNJcYjtMiyLUPVUQHTW3TjspUilEfK9om0emcFiNk0ZuV3lAxclmJKgII
 ZdXux8h21aVqUbk3CCQ==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a56173c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=cn55kr1cJAZV1iIenBkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNCBTYWx0ZWRfX+P0+wJj0IVDZ
 TeIRGlKZMk7fYB2tcOT2Kq4DdVMmgbDs/F6Wpkhr2gQwaFoys5i5nGK+roWYHktk0ONCF5L5V0x
 kIoBN1FPyOvp1PV+y8PunKAdy3rWiJA=
X-Proofpoint-ORIG-GUID: TayGgFlfrPCMD2TIKTHK7DuV-YGBSNZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119008-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,intel.com,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:sboyd@kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_skakitap@quicinc.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3F35753AD5



On 7/10/2026 8:44 PM, Daniel Lezcano wrote:
> 
> Hi Sachin,
> 
> On 7/6/26 10:14, Sachin Gupta wrote:
>> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>
>> Add driver for the Qualcomm MBG thermal monitoring device. It monitors
>> the
> 
> MBG ?
> 

MBG here stands for Master Bandgap will update more info in the next
patch.

>> die temperature, and when there is a level 1 upper threshold
>> violation, it
>> receives an interrupt over spmi. The driver reads the fault status
>> register and notifies thermal accordingly.
> 
> You are describing how works the thermal framework. Please explain how
> works the hardware so we can understand the submitted driver.
> 
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> Co-developed-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
>> ---
>>   drivers/thermal/qcom/Kconfig            |  11 ++
>>   drivers/thermal/qcom/Makefile           |   1 +
>>   drivers/thermal/qcom/qcom-spmi-mbg-tm.c | 256 ++++++++++++++++++++++
>> ++++++++++
>>   3 files changed, 268 insertions(+)
>>
>> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
>> index a6bb01082ec6..f2fc24a3096f 100644
>> --- a/drivers/thermal/qcom/Kconfig
>> +++ b/drivers/thermal/qcom/Kconfig
>> @@ -21,6 +21,17 @@ config QCOM_SPMI_ADC_TM5
>>         Thermal client sets threshold temperature for both warm and
>> cool and
>>         gets updated when a threshold is reached.
>>   +config QCOM_SPMI_MBG_TM
>> +    tristate "Qualcomm SPMI PMIC MBG Temperature monitor"
>> +    depends on QCOM_SPMI_ADC5_GEN3
>> +    select REGMAP_SPMI
>> +    help
>> +      This enables a thermal driver for the MBG thermal monitoring
>> device.
>> +      It shows up in sysfs as a thermal sensor with single trip point.
>> +      It notifies the thermal framework when this trip is violated. The
>> +      temperature reported by the thermal sensor reflects the real
>> +      time die temperature through ADC channel.
> 
> Explain the hardware, all sensors are showing up in sysfs and notify the
> thermal framework about thermal events
> 

Sure will update in next patch.

>>   config QCOM_SPMI_TEMP_ALARM
>>       tristate "Qualcomm SPMI PMIC Temperature Alarm"
>>       depends on OF && SPMI && IIO
>> diff --git a/drivers/thermal/qcom/Makefile b/drivers/thermal/qcom/
>> Makefile
>> index 0fa2512042e7..1bec2746b98d 100644
>> --- a/drivers/thermal/qcom/Makefile
>> +++ b/drivers/thermal/qcom/Makefile
>> @@ -4,5 +4,6 @@ obj-$(CONFIG_QCOM_TSENS)    += qcom_tsens.o
>>   qcom_tsens-y            += tsens.o tsens-v2.o tsens-v1.o tsens-v0_1.o \
>>                      tsens-8960.o
>>   obj-$(CONFIG_QCOM_SPMI_ADC_TM5)    += qcom-spmi-adc-tm5.o
>> +obj-$(CONFIG_QCOM_SPMI_MBG_TM) += qcom-spmi-mbg-tm.o
>>   obj-$(CONFIG_QCOM_SPMI_TEMP_ALARM)    += qcom-spmi-temp-alarm.o
>>   obj-$(CONFIG_QCOM_LMH)        += lmh.o
>> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/
>> thermal/qcom/qcom-spmi-mbg-tm.c
>> new file mode 100644
>> index 000000000000..fa2f10002253
>> --- /dev/null
> 
> [ ... ]
> 
>> +static const struct mbg_map_table map_table[] = {
>> +    { -60000, 4337, 1967 },
>> +    { -40000, 4731, 1964 },
>> +    { -20000, 5124, 1957 },
>> +    { 0,      5515, 1949 },
>> +    { 20000,  5905, 1940 },
>> +    { 40000,  6293, 1930 },
>> +    { 60000,  6679, 1921 },
>> +    { 80000,  7064, 1910 },
>> +    { 100000, 7446, 1896 },
>> +    { 120000, 7825, 1878 },
>> +    { 140000, 8201, 1859 },
>> +};
>> +
>> +static int mbg_tm_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +    struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
>> +    int ret, milli_celsius;
>> +
>> +    scoped_guard(mutex, &chip->lock) {
>> +        if (chip->last_thres_crossed) {
>> +            dev_dbg(chip->dev, "last_temp: %d\n", chip->last_temp);
>> +            chip->last_thres_crossed = false;
>> +            *temp = chip->last_temp;
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    ret = iio_read_channel_processed(chip->adc, &milli_celsius);
>> +    if (ret < 0) {
>> +        dev_err(chip->dev, "Failed to read iio channel with %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    *temp = milli_celsius;
>> +
>> +    return 0;
>> +}
>> +
>> +static int temp_to_vtemp_mv(int temp)
>> +{
>> +    int idx, vtemp, tc = 0, t0 = 0, vtemp0 = 0;
>> +
>> +    for (idx = 0; idx < ARRAY_SIZE(map_table); idx++)
>> +        if (temp >= map_table[idx].min_temp &&
>> +            temp < (map_table[idx].min_temp + 20000)) {
>> +            tc = map_table[idx].tc;
>> +            t0 = map_table[idx].min_temp;
>> +            vtemp0 = map_table[idx].vtemp0;
>> +            break;
>> +        }
>> +
>> +    /*
>> +     * Formula to calculate vtemp(mV) from a given temp
>> +     * vtemp = (temp - minT) * tc + vtemp0
>> +     * tc, t0 and vtemp0 values are mentioned in the map_table array.
>> +     */
>> +    vtemp = ((temp - t0) * tc + vtemp0 * 100000) / 1000000;
>> +
>> +    /* step size is 8mV */
>> +    return abs(vtemp - MBG_TEMP_DEFAULT_TEMP_MV) / MBG_TEMP_STEP_MV;
>> +}
>> +
>> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int
>> low_temp,
>> +                int temp)
>> +{
>> +    struct mbg_tm_chip *chip = thermal_zone_device_priv(tz);
>> +    int ret = 0;
>> +
>> +    guard(mutex)(&chip->lock);
>> +
>> +    /* The HW has a limitation that the trip set must be above 25C */
>> +    if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
>> +        ret = regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
>> +                   temp_to_vtemp_mv(temp));
>> +        if (ret < 0)
>> +            return ret;
>> +
>> +        ret = regmap_set_bits(chip->map, chip->base +
>> MBG_TEMP_MON2_MISC_CFG,
>> +                      MON2_UP_THRESH_EN);
>> +        if (ret < 0)
>> +            return ret;
>> +    } else {
>> +        dev_err(chip->dev, "Set trip b/w 25C and 160C\n");
>> +        ret = regmap_clear_bits(chip->map, chip->base +
>> MBG_TEMP_MON2_MISC_CFG,
>> +                    MON2_UP_THRESH_EN);
>> +        return -ERANGE;
>> +    }
>> +
>> +    /*
>> +     * Configure the last_temp one degree higher, to ensure the
>> +     * violated temp is returned to thermal framework when it reads
>> +     * temperature for the first time after the violation happens.
>> +     * This is needed to account for the inaccuracy in the conversion
>> +     * formula used which leads to the thermal framework setting back
>> +     * the same thresholds in case the temperature it reads does not
>> +     * show violation.
>> +     */
>> +    chip->last_temp = temp + MBG_TEMP_CONSTANT;
> 
> It is because it is inaccurate or the temperature decreased a bit after
> the interrupt fired ?
>

It is because temperature measurement in the threshold setting in MBG
peripheral is inaccurate as compared to the PMIC die temp channel whose
temperature is read in get_temp().
>> +    return ret;
>> +}
>> +
>> +static const struct thermal_zone_device_ops mbg_tm_ops = {
>> +    .get_temp = mbg_tm_get_temp,
>> +    .set_trips = mbg_tm_set_trip_temp,
>> +};
>> +
>> +static irqreturn_t mbg_tm_isr(int irq, void *data)
>> +{
>> +    struct mbg_tm_chip *chip = data;
>> +    int ret, val;
>> +
>> +    scoped_guard(mutex, &chip->lock) {
>> +        ret = regmap_read(chip->map, chip->base +
>> MBG_TEMP_MON2_FAULT_STATUS, &val);
>> +        if (ret < 0)
>> +            return IRQ_HANDLED;
>> +        if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR)
>> +            chip->last_thres_crossed = true;
>> +    }
>> +
>> +    if (FIELD_GET(MON_FAULT_STATUS_MASK, val) == MON_FAULT_LVL1_UPR) {
>> +        dev_dbg(chip->dev, "Notifying Thermal, fault status=%d\n", val);
>> +        thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);
>> +    } else {
>> +        dev_dbg(chip->dev, "Lvl1 upper threshold not violated,
>> ignoring interrupt\n");
> 
> What does it mean ? Spurious interrupt ?
> 

There are multiple hardware reasons for this irq can get triggered but
in software at present we are supporting interrupt handling only for
LVL1_UPR threshold.

Thanks,
Sachin

>> +    }
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int mbg_tm_probe(struct platform_device *pdev)
>> +{
>> +    struct mbg_tm_chip *chip;
>> +    struct device_node *node = pdev->dev.of_node;
>> +    u32 res;
>> +    int ret;
>> +
>> +    chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
>> +    if (!chip)
>> +        return -ENOMEM;
>> +
>> +    chip->dev = &pdev->dev;
>> +
>> +    mutex_init(&chip->lock);
>> +
>> +    chip->map = dev_get_regmap(pdev->dev.parent, NULL);
>> +    if (!chip->map)
>> +        return -ENXIO;
>> +
>> +    ret = device_property_read_u32(chip->dev, "reg", &res);
>> +    if (ret < 0)
>> +        return dev_err_probe(chip->dev, ret, "Couldn't read reg
>> property\n");
>> +
>> +    chip->base = res;
>> +
>> +    chip->irq = platform_get_irq(pdev, 0);
>> +    if (chip->irq < 0)
>> +        return dev_err_probe(chip->dev, chip->irq, "Failed to get
>> irq\n");
>> +
>> +    chip->adc = devm_iio_channel_get(&pdev->dev, "thermal");
>> +    if (IS_ERR(chip->adc))
>> +        return dev_err_probe(chip->dev, PTR_ERR(chip->adc), "Failed
>> to get adc channel\n");
>> +
>> +    chip->tz_dev = devm_thermal_of_zone_register(chip->dev, 0, chip,
>> &mbg_tm_ops);
>> +    if (IS_ERR(chip->tz_dev))
>> +        return dev_err_probe(chip->dev, PTR_ERR(chip->tz_dev),
>> +                     "Failed to register sensor\n");
>> +
>> +    return devm_request_threaded_irq(&pdev->dev, chip->irq, NULL,
>> mbg_tm_isr, IRQF_ONESHOT,
>> +                     node->name, chip);
>> +}
>> +
>> +static const struct of_device_id mbg_tm_match_table[] = {
>> +    { .compatible = "qcom,pm8775-mbg-tm" },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, mbg_tm_match_table);
>> +
>> +static struct platform_driver mbg_tm_driver = {
>> +    .driver = {
>> +        .name = "qcom-spmi-mbg-tm",
>> +        .of_match_table = mbg_tm_match_table,
>> +    },
>> +    .probe = mbg_tm_probe,
>> +};
>> +module_platform_driver(mbg_tm_driver);
>> +
>> +MODULE_DESCRIPTION("PMIC MBG Temperature monitor driver");
>> +MODULE_LICENSE("GPL");
>>
> 

