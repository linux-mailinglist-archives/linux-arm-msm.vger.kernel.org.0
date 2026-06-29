Return-Path: <linux-arm-msm+bounces-114882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B3QEG14sQmpK1QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:27:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B9B6D77CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:27:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hoUzKdaR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kNkvPAeR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114882-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114882-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62F130022AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD033E1204;
	Mon, 29 Jun 2026 08:27:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D43F0AB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721623; cv=none; b=t0c5u/V2+mWJtCC/g3G+zCdmZ96YGbZaMeUJ9mg5d/gvtJDQnuz/dHGokGgASh6yMrHj9Hj4Uz771bli1KMzayC8Ztz+HZyKxwhIcyOHzx4hOc4tdwxo/zlxtpCd/1pP9wQ7xxtC7puTRIEt0ZGX4jx85DJQdwQWaDC2OMDGMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721623; c=relaxed/simple;
	bh=/FQMZ8PTl30qhjjreoBbFa/jRq7gSWz9M4S5QD2OzHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t88tzD+VgUcMyTp1BiatU5kMeZeiQCusLb0uoOESkenMQRTwZ+7NSFI2tz+FomgecjmsMpK9U+tZui71hQmsy4DNHjn1x4fLwJ58J9MiOaLNiG5TMxfvh3k+OxPAQ+/PEm9TtCMYQfgg3ZUz1/KqHK9prXV9zWtWnqNxQ+bCHEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hoUzKdaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNkvPAeR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r5df2076419
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=; b=hoUzKdaRD6FMyLd3
	M5ZZ7fE2hT71BQnuEBDeEaG0wry1c4ziwOnRI03A1/0HaRBbae4JBdkruniNK4eM
	YLWBgWuu9FGXsY19/IHzIF2R9gL55gtYRpookPDcGH7wv7c8DW+L2TZzSPiF7qiX
	NdY7GjyrMqAKPeDk9t/aT5fqvvs9yJ4s3mySlviZSDES7fD/xwNdGxJjCisYQEqD
	bn1drDvr+fUVtdncoR748FGxgqx+wJJ+HBVCfrzFJUCdCxPz4KX954BLwIomO13U
	Jmh+MWCKIptoD8hg0G0NujT87IEYDxsZ2swI2jUGBzJM84LpqJGlb036j7JljI0K
	kYrPaA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gd5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:26:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0c6ea10e8so878216d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721617; x=1783326417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=;
        b=kNkvPAeRV+7HKdbXvRHMIvdr5vkkExwPnkDLkeZyzvOsPrcFc4NxUGPqUWAPvlITqq
         FBWn9Fp4nBjEfjyArdAHufnYhHfiNyHVC8Wva6kj6tgJuhbgW7do0/bvMIul22XgdprQ
         vqPNyDBRfrbWfBY1dyTcdYgNZH9hBSxkNY0dJmnOX+PZnI2uGAzbI1pvMsHL1NQQhT+0
         CjNqU03soUClUxgiSmduK9eTpQ1RbIYz3zDydXJDZMzEpnjNia2N2yVTYqTrsGTiQpsN
         JkgD5QTUOmSgKyslJXCvwVNEKP+vThuFOt6Upiv9DFKPXRllT88ojoEpQHGQiBUr+oHm
         TmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721617; x=1783326417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8ug/TssIPJ7efv2D8UanZxQcJDn+5rN972tF6NNCZs=;
        b=SELYa3VJH/3qSVV23vvSkg5N/4VSK9uOnMnn3WgARy0UdocYy7yDXeRlYeM7pe96lI
         pU+LAoruSv2Za0vBjUlLt+gnR/Vgh/hkkgDJisv8uPLnCZokjBX+ewCNMNNCXAHJ1oLE
         XKadUOs3nkgShsVSwNt+GiYRuXpZ8dcHHj4GyupTuhxSLd5WsOdTh651kTOH6EKtV4Je
         O2uHgDRTMkFhuTefvHgtw0qyQt+aF/UvtqQAJawBKXvn/PSsAuN39OqSm14ZG+u6sOKK
         ZhFfgGyvPpn7fjAMqbFhcM6oVRyMR6dyMVUrWH2D2/9Lyc9+XVSqZipgLitn93xq7CnK
         ypBw==
X-Forwarded-Encrypted: i=1; AFNElJ+u2+aJiuVL8HW3sdiQ+K5HZPMCJ74o3T6jhAC4LGBr5pfP1QLWWzULDfqfJwXEhY4ytzBhSF7OpBaD1JGY@vger.kernel.org
X-Gm-Message-State: AOJu0YxDR4pHJbgToN/vCc6P0VbWzpp//eU5SGZ4nRv0pHSiGKyEu2ej
	KvH3E96xHZcuJsCovCOIscwNP9mWJp8HO+4D3Muf0+SCoA7+BpgYQzNd/DydN5LVDv9V9u8e/MX
	oQwcHeBoVGOM43NYmr7s9IDM46lyl5wmFs4hznAY9dYYvZFY1Rt8DsKHlDeqNUWp7EOZi
X-Gm-Gg: AfdE7cl5mGIBbeWxbkUmjUAMptHdLffTFucHFN3wM+E9nxm1ifpCl6NtsVDOjULOEKq
	jEQmZ80bftKiHIOZ57y1WNjZ8ag4Xnl1/ScHQqoC+kRhTQvvDXAqezx9cXWD6xgMUZ9xPFt4MvG
	W2aFIPhjNXssXKD+fFsBNXBzg65LFhpJo6ZGyqg7EplXFlS0gsMeTRIKUnTRCxNH5uyQcEVGdJL
	5n8yPhqkbwuL1oxY8o9h3UJnLOieay6qxyX9JI/JUXHLWeWr5wKopMg2fyw5SNEXNhSpKofvWtX
	Go3FPdb3s2/EzGsxc7NBqtRyUawoLGEVqMp9MIL/MD+3jfPWt7IpmwAmpPIFGIWHPzD+ZD2Qv1h
	2Njz/jkC4JUfjG5b0gs+ZhzGT6LxJarteCoM=
X-Received: by 2002:a05:622a:50d:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51a8c9c830fmr85187041cf.11.1782721616944;
        Mon, 29 Jun 2026 01:26:56 -0700 (PDT)
X-Received: by 2002:a05:622a:50d:b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-51a8c9c830fmr85186741cf.11.1782721616546;
        Mon, 29 Jun 2026 01:26:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124e79af45sm234316866b.25.2026.06.29.01.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:26:55 -0700 (PDT)
Message-ID: <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:26:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus> <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfX/1LKjuek7X96
 gGIRjpl7jkUOfKCh7yQXbqq4bQ4tWB8OkaRIVTHSRRBoIrtW91UskhnMhI42WZRn2blSkKqrQIn
 uvTc2izoc2WUXBfxCef252MZIHZjRnA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NiBTYWx0ZWRfX8F4weLgEswPN
 Bee8d+8+ywQ+xRybe6HZ3veb/PmnpfESilaCSkzsfesLpEP+VuQf92SI0DctV2YGzqUYeqz43jk
 I6/mK/WofVo66HWOTuydW+/SuLaVwoKgR67j/vg5ZBAxB59MXcFjIGQdydBq93rHjyE8ykxgFiF
 jPyk9+bWg+ETZlsUnnjJ8q1Y5PUIJYyXZeuBqK70M9S35H4LK10DO3DLif0shU+xSosRQod3Xyt
 AaiHoOemRvpYGwcuuGU03Tt+axFxQEEdzFzW7Ky8oJXEINuEebQ0k7WZ9b2B3PvziimFHXLNZDF
 L7pIf54lIFn3OcRXogmKC3gR9M0ptxsWRVtxoVqWYvsokQUzHcoBLvna3ZOvJt0RRWSbVwDtROo
 bwbJ0njJepXxui4vOIYcnr4FHAWeG9PMX5sQEfGkBaMLmdllMY6yLHB2CO6bd2+pZovSn2/a/g+
 GHh9fLti1l86fHcYhXQ==
X-Proofpoint-ORIG-GUID: fxFoms_0q9CyU-UQ4-TO-JdfSkwIVOOD
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a422c52 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zEmzfJwlJ8pfclmQ7WMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fxFoms_0q9CyU-UQ4-TO-JdfSkwIVOOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290066
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
	TAGGED_FROM(0.00)[bounces-114882-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:sre@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1B9B6D77CF

On 6/28/26 4:02 PM, Guenter Roeck wrote:
> On 6/28/26 06:50, Sebastian Reichel wrote:
>> Hi,
>>
>> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>>> the hwmon subsystem.
>>>
>>> The driver now registers a hwmon device providing access to six EC
>>> temperature sensors corresponding to the SoC, keyboard area, base
>>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>>> are exported to allow user space to identify each measurement.
>>>
>>> Additionally, expose the system fan speed by reading the fan RPM
>>> registers from the embedded controller.
>>>
>>> This allows standard monitoring tools such as lm-sensors to report
>>> platform temperatures and fan speed.
>>>
>>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>>> ---
>>
>> I gave this a try and for me the fan data is always 65535 (i.e. -1):
>>
>> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
>> t14s_ec
>> 65535
>>
>> This is with the fan running:
>>
>> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
>> fan-controller
>> 2564
>>
> 
> Not really my concern, but those names really add zero value,
> and I would argue that they do not "allow user space to identify
> each measurement".
> 
> Also, do you really have 66 hwmon devices on those systems ?
> Seems unusual.

There's a couple dozen thermal sensors on the SoC and each one is
registered with a thermal zone, plus a couple here and there for
other onboard peripherals (PMICs and whatnot)

Konrad

