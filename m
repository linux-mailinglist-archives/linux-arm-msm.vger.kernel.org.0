Return-Path: <linux-arm-msm+bounces-92935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGd3MmgGk2nF0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:58:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FED1432FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 039113005D37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890293081C2;
	Mon, 16 Feb 2026 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+4CbngY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPZ9G7Fi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7C308F23
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243106; cv=none; b=LlZCNKUW7+u+8OdypONwYttQ3jaiWHJI4+xMhzVod85h2CWmcwH3+L/bVSXzq8NT9XIMeCCMq8xUl0NJ61PfF+ESN2XZtqfUCiZmFNuCwUjTdcUAg4tqiRdQ82PvDUG1dVX615rVyZNEyWPHPBM/UJ2lYhzJPa1ozHk5BKEedtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243106; c=relaxed/simple;
	bh=2OooSvG2whJSKkJTdjoPy7tsSXo0UE5qO+6648XFTYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSCgV9p9oknbEhUJI307b9oWHyPvyLnXxnAaGLHy8H3JpsGoYSDT9jT9YOCntHL+pUb2CnVaO/WeAB9rjJt0/cCwkhgWG0bymwLYGhqhm87i1q6u0tZOgzHgcXiX69LLXeUNx+s9qxj39jTt58FtYNjRr5ByNeMwotsvdw+qcuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+4CbngY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPZ9G7Fi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GBeIZI2339506
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zi/BecWdHdYC4B4fsf+bAG0aGUqnDmYPyCY0bfoOq8U=; b=N+4CbngYHHA3XlVK
	ODgsg96iYBsO0hDps5dKFyfHSUHNZVVHMepyQmjFIWzPcU63fZaLB4gvY8kKcPyo
	YNMlY0Q3qGxEc54xuMxnUTjkE/FHKPE1TeqOiKlWf+m9Ur3qb2pZjpD37mZkPj7c
	k9ZkLRwdoIilCDvEf1XwlH6bOUmSyi7tkgjwlilQxlWxa+iPXnYk4NiwvWPP8DCW
	p0hddbCGmDkdyVEnWIL/MHxHmpMloQX11UPt5UpkUS0z5v0lyko2pUzsZuBvl/zp
	gYWBshQwqWDUIANMHn75gtPEm1BxoVGlIU/d7Ovx87UJ0VU9y8uvO4DyZEuhba+H
	TlDraw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc4nvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:58:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50fb0abdso176384085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771243103; x=1771847903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zi/BecWdHdYC4B4fsf+bAG0aGUqnDmYPyCY0bfoOq8U=;
        b=gPZ9G7FiF10QcDH1ZuJQjrXc1ZsnYZNvWNVzcb4QSAzifYvto1MchpUX1TbDUvNxE3
         rpvZj6oR/3gEt3ichj4XUyo5LggeOa2szCa+c8pERU8atVQU5ELsDg+EoEt7XQj3D9/W
         KLqXyUfidfGCE856tE6l30h178cnMMW/ydcD7Bl70S6FPm1rDsIZDB3imeTGRpKy5FWJ
         +qIObozfrOAzUpxhGIrm4zhGWQbl+jZ+bunXxB/LsXmvm8v7UeHUNHeKa80eHw+sIJpE
         spyAvjSl5rih3K7FgPzZiY05zEzmE2a3GNVYne7gwZXuju2ALZoB9adiHUX2rFs0KC8J
         55+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771243103; x=1771847903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zi/BecWdHdYC4B4fsf+bAG0aGUqnDmYPyCY0bfoOq8U=;
        b=c045CVoK2R/wzMD88nCeeAhH2DEF3RJH4/w4vGajs9cMTTpuICR8XWOu4It9BkvVDB
         IVrBBhdwzar92u4xF0UayHtGpL/PX/0NUpiHZskkSSHutr+/96w0ZoeBCieE8kMN3wz9
         PSTuQ8eIr7D5HdIWNq5RJQt8otwjKLei5E9oAoCFga0UNV4MX/pfqJQRRoQp0mJbBkRb
         3WM+M9a1lRJV2nYAO59YwMrDIjU6rAe0XASUOiLj+2RDYbyZ7TLKflZ0olLKIhy14dPk
         6DuODEdzOFE9y2AgqhyvSHYveSqTrm3jQHOuxTLplXj4p4OFeGPqDfoZDe22Mdjx4ZhI
         8XLA==
X-Forwarded-Encrypted: i=1; AJvYcCWHH/0mmNz/VEkouWX/Jrq7zgc/LUiyyUS+NT0ua2wLS4iz0H8ZV5cv0v4rJ7OU48yMpz3CVRwJjGMSfyge@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5XadYl412MGqyvVSs+4GhBdR5OhETRZNP+WVSZ3YI0g8QFuBx
	FCXEBdCyMmWey0i7e9mciQ+xAXXMUsAmyDXCiNE8oqbVlEeh4/iMQQzTNHPji8yZ6nmt9laBPLa
	EJ49CjwEmKGAShOt2SMm5MaM4yFLEaQH52Hd4RMzWMcrxyJXSkRp5YvG7viDfZ87hxWa7
X-Gm-Gg: AZuq6aLwvC9lsOYX3fnwQ3J7RFH9DUnrDaJxyfPD2Qis8HI1vkqmGEg3RPRGjUpWleR
	lOFtJWOrzbhpKnk4rgKNJBWq7yURSRsZyjQ9wD04rxvZDpNXb1QeFSLv1r9A+bVI7fzWU3xTjDP
	pP6vqzXehlnfd42O8R/PqPMuLEx/WXZ5JjHgfUYcvykvMgjaCc/t7GztsYPuF3alq/YoyFod+GX
	urRNiTpDaYzfuv3Ig/Lf0X480XYaQWpacV+8vyon+iEKUaxaA4gikzcV7XYroan0wSRgZEFkAiB
	KmN1eWZe6ObSwmiYSuwd/Zfavh1xEJD5k8vWN49wZdtOK6Ms1Yhv5T32HkZMBpNpMAeYi4fi45V
	iIWgz1Drbv6uhgQRVI0dYvovtWd4pQii5yX3hx2bSzhlCr877KrIsLW7MreBiwipM2/xNywdJdy
	7VU6g=
X-Received: by 2002:a05:620a:7006:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb408e956dmr1044830285a.9.1771243103479;
        Mon, 16 Feb 2026 03:58:23 -0800 (PST)
X-Received: by 2002:a05:620a:7006:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cb408e956dmr1044828285a.9.1771243102986;
        Mon, 16 Feb 2026 03:58:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766554bsm250799166b.46.2026.02.16.03.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:58:21 -0800 (PST)
Message-ID: <83ae42ae-233d-49b2-a4e9-43ad879cbe39@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:58:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
To: Richard Acayan <mailingradian@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
 <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
 <aYvNX718diaXDsBy@rdacayan>
 <f1fc24ad-054f-4731-b982-4c579abf46c1@oss.qualcomm.com>
 <aY4br1BX9InqWUd6@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aY4br1BX9InqWUd6@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=69930660 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=-X_Uy8J1N6Iodyj9KHAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WxZqv2zmTxLXuHPqnrkDvx7EC5xFnYk1
X-Proofpoint-GUID: WxZqv2zmTxLXuHPqnrkDvx7EC5xFnYk1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMCBTYWx0ZWRfX0MRShh6LrE7O
 I6MILdKsNrlkeoL2dGtULOxUZzHkouvUGniM/454ANp6S1bEBHagyDzSfN4081M3lOZRqIWw+hL
 YI9NzSLGU4jsTr6JG5G3IpDnxSMepcl2K/aWbOD0bq/O6y4Zyw9o4arXN3/shll/LkpkR+yQZuX
 p8PChTvoX1MFEIs9XHov/VO8Woo+a28lagGhN/83kytylsmNYqvkgeMlcod/my6AxPE12TK/QOT
 wdQUCNgQur3PkiCGgIgRjqiP56rTmh+0/RyWFVp7GcYxu3Z92554i7RQ305QJbgIgyAhzJu7izG
 bX2GHBrdHp3vlbxx5C5cZWqecOiiFcwIckRYCnTYvwSstobZxSdXFGXIbwwLvEDfF/z9jwWYLeT
 FlCHS4A1M0udSE33CKLB47FYDuwLKX5w4iWELiuceTgYt/7ol0ylzZ9Knsx/2YtIExT6aH0lllV
 XWcmtArhgRmkkMGs5gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160100
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
	TAGGED_FROM(0.00)[bounces-92935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,0.0.13.72:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69FED1432FF
X-Rspamd-Action: no action

On 2/12/26 7:27 PM, Richard Acayan wrote:
> On Thu, Feb 12, 2026 at 01:15:04PM +0100, Konrad Dybcio wrote:
>> On 2/11/26 1:29 AM, Richard Acayan wrote:
>>> On Tue, Feb 10, 2026 at 10:59:20AM +0100, Konrad Dybcio wrote:
>>>> On 2/10/26 3:18 AM, Richard Acayan wrote:
>>> (snip)
>>>>> +		pm660_adc_tm: adc-tm@3400 {
>>>>> +			compatible = "qcom,spmi-adc-tm-hc";
>>>>> +			reg = <0x3400>;
>>>>> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
>>>>> +			#thermal-sensor-cells = <1>;
>>>>> +			#address-cells = <1>;
>>>>> +			#size-cells = <0>;
>>>>> +			status = "disabled";
>>>>
>>>> Can we enable it by default?
>>>
>>> No, the thermal monitor fails to probe if it doesn't have any channels:
>>>
>>> 	[   17.728926] qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: error -EINVAL: get dt data failed
>>> 	[   17.728945] qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: probe with driver qcom-spmi-adc-tm5 failed with error -22
>>>
>>> Triggered by https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/thermal/qcom/qcom-spmi-adc-tm5.c?h=next-20260209#n945
>>
>> You can define the following ones in the common dt:
>>
>> REF_GND
> 
> Is there any (likely passive, if any) cooling device that should be
> activated when this goes above or below a certain reading?

I don't think so

> 
>> 1.25VREF
>> VREF_VADC
>> VPH_PWR
>> VCOIN
>> DIE_TEMP
> 
> Maybe this temperature can be included, but I don't see any other
> PMIC devicetree that has this channel ready-to-go.

This channel is internally connected and handled by temp_alarm, I think
describing it via the ADC just lets one peek into the raw values

Konrad

> 
>> ANA_IN

