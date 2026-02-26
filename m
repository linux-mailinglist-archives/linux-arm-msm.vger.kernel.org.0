Return-Path: <linux-arm-msm+bounces-94250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOFVJDIPoGnbfQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:15:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD51A3384
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8499E3013DED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5082139E178;
	Thu, 26 Feb 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPFGORJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjHamfNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C5C39A803
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097327; cv=none; b=RpakLdN/bFCqAOb9eXbR+UIfvtIoXC5hPlmRWb8RG0lFlvWM8hFi7BMLyerwSPmI1k+Hl6YgYSUHShWhGt2DDL6DRZ2uBnUyQoruJ54Qlk9LZfo2GH9IX1uPFstwk6cE8/ZirKgUA2DZVnVESJQMzdSAZkWQEocYiaphzSUOJv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097327; c=relaxed/simple;
	bh=QlW5mac6XApHZfJPctnFhCmABhK3Hs1RwJL21IWHK6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OA6aAxGxiwRt2lHtF/94ZGoMfKoMYMJHtaG11FLyhUkjAgx1MXAtRTjYhPeGCWC0auoykMZJgXhrrQMEkqsiJieBKj8zrVQWLw9k42dxN/47kMULJ9VBmG7cnE8n0fpVeOS8T179SZPl4JJGRcaDoh5KIU6dvZ/U3wAyNkaZ9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPFGORJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjHamfNH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Uv5l3493276
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZPkSB83KryX1MJwmDnz55Mmxd+DrswTtGJyGY/cSfw0=; b=gPFGORJOofdOrAh0
	WYv5RFOR29P9KC/L+9KB6dbnjL3TS8mWScb1ZG2k/AO9xGTyXJK1N2cS9uE7+YpR
	9KvhF6ftp78kOOFZeFs5p3p8fVGXTZ16xPbA0TW6DCap2zzcLUyU+NhD3sRCo7UL
	CS/xUkrYTRLCNb1Brm9JdmGrJNHgSCfG4Wi7Wz2G2bFKxZaZq81HZT+A9geeQ2vs
	y7inRsvqR0GumDHWJinfBFEl4UU4sFcsTyXPNO7oO+RdNWFdvgjo9aespmLaoOFP
	8bCBt7ktEZ+XnT3cckmZzPCxM3wBn2ZxNuvpu7l43CwcFSX0Bcme0nemkYp85tGF
	dlGatw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj8bd9uye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:15:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae0d7f5c6bso1424805ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 01:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772097323; x=1772702123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPkSB83KryX1MJwmDnz55Mmxd+DrswTtGJyGY/cSfw0=;
        b=CjHamfNH67/P9pq1lmy+oUGcxwGnCsbmhp4YyQ5oVdOD1lDM1ToSxBeM3bYj5ygIpH
         zYhSS+DHvUHVvNfOstot9DjVtgImUSVAwpVN3659q7Oky7SY2rt16hq/LZO3g2Bwb45I
         jDjxzk9lQj2YxXGLjKLpfvqMZXNBJ0XVYJZsxpL0UoO4ng7LDwJjq8+F6cihgNvyeaTf
         XPhJLr8Urri4scA8jzO3ctfG0fNfJqU/kXdtsmfihGZLaamU30iJ2gG+lg9bc2VaMkne
         rtHhM0YoDtPVlKIdHrTh+Ljp42Z++3y/8rwZFn9KzfqZOCbEsTetscjE5OpAEXdKo3Zp
         FVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772097323; x=1772702123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPkSB83KryX1MJwmDnz55Mmxd+DrswTtGJyGY/cSfw0=;
        b=xHxbGGfmsmXaV+yUye+I9Outfy2DSQZunzjkrNYF5Gv3YYNGqwR9EH6sw95ktQWQBH
         BoC0plkq8dEtx1F0Ge4xckhawzlOdKoI1kP9CZ1ar4zMTA0T8in9hF6cQF2NtcJFHKkK
         k0OXtD2PyQQC08L/4moN4dKN9/FEQryPU+t8Nuw4SX2X5vrtkUZF61fxKQEQpFLh9jfy
         qOPzOGUfmrYSqBbQQx8QwWDIO8zJyRonpSWS6GPo75vhnhZRdcJglspJNRIp17NoSQ0v
         TLKY4c0qqZ016ti6D9ZPLs7qqZkhjQ5/rWJP0OhTO/6qLH3N1OQ9UYB0NA5fbUW123pu
         D9vg==
X-Gm-Message-State: AOJu0YzV+Z7dmyzBDq32dw2WdSeFBDKDq+0nspcer357wVTo99D3WLHY
	BAA6Qjk0O8DJbgm+dpBb75AOLS7p34x0py3iDGvgF0Gd+9YL7TTl/xMJUGTXBbB9NpjHg2bd6VW
	99kx8jyjSC7bDCncU2sI3+mRS0/yNGXUoXAjA9NBL5kYljjr0W9iRD7JoQFOLjuX6aU0YERZjNZ
	lx
X-Gm-Gg: ATEYQzzZweNFFDvV963M+6cwGVIynBGVPWe83HoTDhuj42Ud5CWp1tzTz1GAgI7wCzz
	KiI5djtKOMalKwW6EBjNiEZ3xgIu1eX6crtI/DdJ76ytvnpimnKZvvSkuh+O3xD46O+5D3iz8EQ
	VY6/eXk8zGDSi7iVwHJJfxy72fhFGFa6jG5YL1kbQx8D9yob5e5dJantKt+9zZxHfKJAaWvIT28
	pRWjMpxz7ZW2EPFrw6KbnJD0f7u1/71zgvKqVuR0xdY0UpBr9KDwqd2cTS9H2VyRnbunCBBgDCr
	eRzr4hTiIR0ffyRgxG4qUaNxETQesT9KZktdAic+tRxabTHkbCfFWK3mAqnv2WgGNWLohnzRl38
	RKgP5RR2uDCYJuyxwvN1YhwSsehq1qOjDpDjsar1GVFVO
X-Received: by 2002:a17:902:e746:b0:2a9:6281:6a4c with SMTP id d9443c01a7336-2ad742b63e4mr125171375ad.0.1772097322760;
        Thu, 26 Feb 2026 01:15:22 -0800 (PST)
X-Received: by 2002:a17:902:e746:b0:2a9:6281:6a4c with SMTP id d9443c01a7336-2ad742b63e4mr125171155ad.0.1772097322271;
        Thu, 26 Feb 2026 01:15:22 -0800 (PST)
Received: from [10.253.79.190] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa4fsm18661855ad.45.2026.02.26.01.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:15:21 -0800 (PST)
Message-ID: <c1355057-486d-4852-8fbd-f9916786de06@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 17:14:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
References: <20260225091700.286108-1-wei.deng@oss.qualcomm.com>
 <954f6a53-b597-47dd-926a-adb5a7513edb@oss.qualcomm.com>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <954f6a53-b597-47dd-926a-adb5a7513edb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FKQWBuos c=1 sm=1 tr=0 ts=69a00f2b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UB3C3iIAKtE6oQ4yFSQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1RfnmNBMgXeV5hKqAFZv2rZACR9dNu24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA4MyBTYWx0ZWRfX5nllDu8ofs1D
 CB/QvbIdV6+p3qkyaXQeG1RA7JZXjov5tvseYgmlNcza7DkjfCI7cfbUXzKM8+4nd2IhWLAeipy
 8JffdjTGIFgGPGq6pNVDjCuJIQSKJOR5rSZ39jpcdqYVTmv45mmnppPIiUjwL3zER7EJjGC438F
 zB4duv4SohLURnIs7NAebnOYFH1Sw/NEBKUzNYVh5MdHOBrqfyAfoL4uwAcUMpEcfwNO7EnLzl/
 qheVJg+xu1nX8vkwwKejUk3kXDmSy/H9L9MOCByo0axsgmw3FnR3qJCv/CQ3UrUsTurnpupuwbV
 THSIJos5otZ0RPO+qhmzO2A4V3349EXk9V0mkbmuz2VyzHbsIIe45Y1TEdvxVGjJ/GBp/TQUxl5
 1ze+FK7V8eggLSrdMj+ERK4X7YQkti/51fWaT17udgaUjvgC2tb0mgAcfAYzj0X2IzfHR4T1eex
 8y4zv7mRAUdYhgW1PGg==
X-Proofpoint-ORIG-GUID: 1RfnmNBMgXeV5hKqAFZv2rZACR9dNu24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94250-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34BD51A3384
X-Rspamd-Action: no action

Hi Konrad,


On 2/25/2026 8:27 PM, Konrad Dybcio wrote:
> On 2/25/26 10:17 AM, Wei Deng wrote:
>> Enable BT on qcs8300-ride by adding a BT device tree node.
>>
>> Since the platform uses the QCA6698 Bluetooth chip. While
>> the QCA6698 shares the same IP core as the WCN6855, it has
>> different RF components and RAM sizes, requiring new firmware
>> files. Use the firmware-name property to specify the NVM and
>> rampatch firmware to load.
>>
>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>> ---
>> This patch depends on:
>> - WLAN
>> https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/
>>
>> Changes in v3:
>> - Rebase patches
>> - Remove unintended 'output-low' from bt-en-state pinctrl
>> - Use prerequisite-message-id to replace prerequisite-patch-id (Konrad)
> 
> Only now did I realize you're the author of both patches!
> 
> Next time around, please keep them in the same series, for easier
> tracking (since they're very much related)

Just to clarify — are you referring to the below WLAN-related patch and this one? 
https://lore.kernel.org/all/20260122053624.4068718-1-wei.zhang@oss.qualcomm.com/ 
If so, they are authored by different people. This BT-related patch depend on it.

> 
> [...]
> 
> 
>> +&uart2 {
>> +	status = "okay";
>> +	bluetooth: bluetooth {
> 
> Ideally there'd be a newline separating the properties from the subnodes
> 

Thanks, I’ll add an empty line before the subnode as suggested.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
Best Regards,
Wei Deng


