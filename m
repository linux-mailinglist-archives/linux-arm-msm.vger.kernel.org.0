Return-Path: <linux-arm-msm+bounces-107547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLucLLWRBWrfYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:11:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3FB53FA0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 11:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27816300A4CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 09:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B97330662;
	Thu, 14 May 2026 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cS/TiBom";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DibwPNbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C930FC1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749875; cv=none; b=uBTiqBZ7d5wTq58LOkaykv0BHEaz+gake+m8KDmyUn1CTSZ0mJzpSrN7jiCT+BO4/L3u2K/OM4xjExuGDMrroPkWYS0T6T4BuIWd7DD5WgySA4y3FeYfajHSNZm+j9E/KBosfjwGVWYV2PrXsdBHNQtlvsOVSR31p3sR5d6W7cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749875; c=relaxed/simple;
	bh=daa+1XvYSzE8eOwfhbectImkCDlzbI1HYNTaBEaId50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4p0IO3tm7bCo7FPcUiE11we9yB2s7JyeSQ4FHXPRhT0ud9NX1JlZn0KiUh5dg8+QNOU2x/qXoA3iDk6LdYsD8l4O1Zzk/P9lp4DEGKoMDM6HaPzH49A/UCcjJElCQ1mgTMUcmZEPMEmfwizC4cYCx9c7ZpiYfXWgHRCmOqSwZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cS/TiBom; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DibwPNbn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E68rTG1965743
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sOG4Pf5i797Nk7IZxKARPdtVNQssiq4kiFqW2LPT+A=; b=cS/TiBomZ8UTWeIv
	WqqhxZuIzZOCw4IjcpYdPZJnjv1rTZ9EaUkZuqOLl0o23iNNEYWw4HpI0A7NKpn5
	c2F7zHvOunZ6yST7ZgjNSOMBkwqx6Sa4KZ64g30+zbcugo3YrhuS6D3cKETBmD6t
	MV7yE+UJ+fkPMli6Woi8n93IWA14kvXSKKAIfJu3DQer3XxlCjChTsYdvmdSEhd+
	aOIuBhhhqUa2ZJeoM+eZMdDMuPdMOZdeHOLoOaEdMKcmmwquHocJ58RSDQTzO0Eg
	KOyO39X+zsAabXf2G4TbekvWGm30Z3Pqd/NdK8RYUUnmZ3W+swzgYFs9rk0zRaKZ
	9JdlTw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v88n5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 09:11:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso15716001cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778749872; x=1779354672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0sOG4Pf5i797Nk7IZxKARPdtVNQssiq4kiFqW2LPT+A=;
        b=DibwPNbnupuUJqkyGyVND5RfQ91rLmU5joU+MP2hbwcts9i15lEhvmKOJPgkWELRTU
         Hnv9+nHCFrjXsY2VHCcfrS3Q2VYPu3wYdGeo0CVYruUg9zmjWYlbk2mHOx79Dh6gYTsI
         2lh+a3RuWsxeBkC8hf04rxgQ0zN+GyuKuABfzjTd5KFziooVNFoJAWR0blZmsFDJn/bb
         5JLXBerOe32RJHFhwdP7mESsekfTIvJgK59rUht+UUtW2pFG3D/8aDpHMScI1qzVb8Ct
         vmj9KBeFsFACimem5ev4dJG8J+wbbpVV/x+9jG8ClLr3S8SXCr76io88mW90C+fjJqjL
         yKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749872; x=1779354672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sOG4Pf5i797Nk7IZxKARPdtVNQssiq4kiFqW2LPT+A=;
        b=bGtfl9FksFgQ6MgnYl7HG7cA+spqjA6HIZIOjEC5doWDhVsGvBuojr0QsUa3R/OzZb
         NVG3eg+2f2bKc/X4MsXpb8fB9rvfn8LAadWi19UjVedvncwR+iYQ7F3jBm8zbYq6jaB3
         TXWga+FTxiCCRk8Kj6QWxrWN7tGvmJwBlRAjnC90JZ3cuHpP9oXDMzERRLLhDbkpgC+B
         0TZuMK4SQeUIrO/bICZgXdFe4ezSm80/lri2IY57nG/vYoQrRPzBzjh9XgyXPDVDZfsT
         xtLQn8l4yjlUuig/6RsKrdbjTy2HlzkIv5u4bvtV8MZG01hI6NVRpjZJhWjNN/yQJSmn
         JHxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tHIU9bJ10yn6jWf5+hL6C3mnqMpa4FSur2707sAp6m9tA7dH5qcRHA94bhhVJYsuAgY3nAObVPTEAOsyD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr9RmtHMvfl2xrlRebeALHwVSb+O0ZdbIdr9fSYdDKfMiNlfU/
	J+HSrw9541TpkziHcCOMfftU4WCr3LdzuPJqDO3HLGNc+6zonWfF6cTabtfpQUZGxpuCy+3iOzi
	1VTWKOKuovIRD/83JwfTGvBfcT3JTplkWE5swyu+Ugn4fQTSFny5wMwZ8NfZ01A0DsRXY
X-Gm-Gg: Acq92OGmUHwf1LPIQGLIsuh1tNVa3DVu2X8cPjyySEQo93kU7JjPYxZ+sFnfV9+bEER
	L0yTWZtaZoeeYvAXj/ADj1T1kv6DrADO1Rpr3/zqRW5SQrzc5QpHjml9KjA9ekmkAGw4jenVeDA
	sv6M6rZIkqf0gJDwquKMtWDo8JGhv79qbPxFdGgxtS5cCvx0wlIZAt8CGgrG7ZhJS2MFv5++4cq
	0QPzZFL5NfoLqL5xtBozTaujVQcW1awRp0RvFhZLU+y8Cdg2/J0ihZm0Nc5Nq3ET6/jd34wuR3V
	OEYWvdWUeEBOPmdVdteEwLTg0fTfdCcADMywcr6fbZda39WCk2ZqKGprJee/8tbUgVYjNsc84kA
	URW2Re5E6Asq+sdhTs/pYlVqC5b4tQytU6zGF3qhFsrihuRpeE8C4S9/CjwuDQqBoUwdsXFxCtz
	tATsy3Qqe63CirNg==
X-Received: by 2002:a05:622a:5818:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-5162f447e81mr62623691cf.1.1778749872295;
        Thu, 14 May 2026 02:11:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5818:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-5162f447e81mr62623481cf.1.1778749871750;
        Thu, 14 May 2026 02:11:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187ecf7sm494479a12.30.2026.05.14.02.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 02:11:10 -0700 (PDT)
Message-ID: <048b1110-2de6-485e-995d-e328df69dcb2@oss.qualcomm.com>
Date: Thu, 14 May 2026 11:11:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmpd: Add Shikra RPM Power Domains
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
References: <20260429-add_rpmpd_shikra-v1-0-fdba28564380@oss.qualcomm.com>
 <20260429-add_rpmpd_shikra-v1-2-fdba28564380@oss.qualcomm.com>
 <e032c072-57b3-44b4-84a7-5aff062b9c00@oss.qualcomm.com>
 <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514084512.q5pzh226zdkuw53f@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MSBTYWx0ZWRfX1U8JGg51P9zS
 4VAVJMP0BwdnbZJ2wHcexXSRpWCvb+ZjpnODG6ZC+VV7LHXtEx8/Z9uofGxIyV552BeOlAkjyuA
 yDWME0o7PSyZ17G7wZof0NTkbRpsar4Pc+u9u+W1amhu3I3oFG+x6olU/A0cb09f1gKN479uExa
 RGuopjCOOj8+CGxoIO0bMWi/nZrltxDrd73W/moRZoVasecr0z1zhQWdSElChuMULt2eWP5drMh
 YxdCLYQYC1e9bFSWnsguQzZe8ZHUiGvsh1OUrk+ghKOz9eXcta4TgBxwUD+EYW6n8OJ550zjxjJ
 jJTsOnqYuPjAzz2leXjWnsy+xWzIQKk8HQ0C8sFShd7tDXYVLqp+r06C/WgYwLw2UTOaAKAzIYs
 VCcrTcFNanG3nn7cYvux4bqZDSrxtzo4GOr6nLk3Cx5rtMHnzbZ+BRi7IwrF1bAn2sAx/5lwLdU
 AN65FFj4e872Ht8UMKQ==
X-Proofpoint-GUID: r-7G1d2DFm16x5-jX1y0qAGSZJfGO65c
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a0591b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=psDV2xRu-4Ixecqm65UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: r-7G1d2DFm16x5-jX1y0qAGSZJfGO65c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140091
X-Rspamd-Queue-Id: 2D3FB53FA0B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107547-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 10:45 AM, Rakesh Kota wrote:
> On Tue, May 12, 2026 at 02:16:07PM +0200, Konrad Dybcio wrote:
>> On 4/29/26 4:09 PM, Rakesh Kota wrote:
>>> Add RPM Power Domains support for the Shikra platform.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  drivers/pmdomain/qcom/rpmpd.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>>> index 15a11ff282c3f86b1e86c6604d165e297620f6cf..6f751ee5a7833912d54d2bcfd5d85837ab7a97d3 100644
>>> --- a/drivers/pmdomain/qcom/rpmpd.c
>>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>>> @@ -863,6 +863,21 @@ static const struct rpmpd_desc sdm660_desc = {
>>>  	.max_state = RPM_SMD_LEVEL_TURBO,
>>>  };
>>>  
>>> +static struct rpmpd *shikra_rpmpds[] = {
>>> +	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
>>> +	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
>>> +	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
>>> +	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
>>> +	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
>>> +	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
>>> +};
>>
>> This is identical to sm6125_rpmpds. If you're sure the list is correct
>> and complete (no LPI domains etc.), you can drop this patch, and proceed
>> with just this change:
>>
> There is one difference — the max_state for Shikra is
> RPM_SMD_LEVEL_TURBO_NO_CPR, whereas sm6125 uses RPM_SMD_LEVEL_BINNING. 

You're right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

