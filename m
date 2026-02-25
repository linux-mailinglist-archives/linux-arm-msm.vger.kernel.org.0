Return-Path: <linux-arm-msm+bounces-94120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIuqNHD4nmm+YAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:26:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C2198064
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 490C9302B82D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DD33B8BB2;
	Wed, 25 Feb 2026 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlNLDDHM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PAUwjwYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45B17BB21
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025950; cv=none; b=gkXv4zzIf/of/WAcuf+1QV33rHTUqGGR3a0CSdsKADLhxsnNhifDCtxmYI+DQ8ZKiiM5y/OqBOagR9XeT0+8KJ/f2lHuUlgao7x13ot0MWzHw8GDxjDnzYKjv01nflkAGYzHs9hFv0ucx2ypB+6/Fh6H1P0861tCjmwALaO2Hhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025950; c=relaxed/simple;
	bh=QBnGQRhjPCgFqzWG1srroUfv1xQs2zaYDV82nxKh1sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3vnsWZoXPvakv4TElA9VTmkNYiRkjcMTOCpNQoSVVmx397MvRIW4RP8u799Bq79OWuo5iFgxZDVUaz0bqmxXTKS+gEypJTsuL4STwAjujAtOmEc14X/+8XdoLJs6W765AS35bmG70Jm5GcLaddhiD/yLibn1AP4e0Ff8ukKAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlNLDDHM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PAUwjwYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SMQG1025100
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dl070totApNxtzNfs2Ht2ITbl3V+CGxeE7SKwvt2uYU=; b=FlNLDDHMuGJUk4NU
	cPrhaHevuB3AZSH6Oweq10Ppn/ZaskuaGRetf0Ml0q9GlCgixCNfh/OzXuzJZSKI
	rOyeFuRozAzmI6ly4cBa6s0tQV3zFd5mqrCBZMl4hGXoomVY38crIlSYniPfFjTj
	XL4/VZWRqKcNOUne9yBSlBS2A18P+bFODs3/3zn1yqjtvUQ2tv3BZqo3zZPAGJed
	xjv4dx7ht6ssRxE3KLuwukH6IpULQA7EoACaXDw0EQZ+x6F1QEkr2z6pB+FAbBQw
	qqJJyI+1nMYVUZOYEMcUgEJpxIXT0pepvwnQoTVSvkkmhtIpNElzGwKN4ZzeATt7
	D+Bj1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chq57svyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 13:25:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70ea2f7d1bso437531a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 05:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772025947; x=1772630747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dl070totApNxtzNfs2Ht2ITbl3V+CGxeE7SKwvt2uYU=;
        b=PAUwjwYPIrewhgOc9sQJh4nzsJy4g+6T4oY0+QycBnOIXl4qT53xbspdZNlZxLbw3k
         aSkzWZN6jLnYw+yZc7wdGZBy9ABDj1ETL/tgMQSzCdF/Ds65f2papA0EX2SJwYOloHJJ
         Bi8rbb2jurgTu9m1B+cG4Hx9LiKDjHUj4lxKVyEnMJQys8Yf3N/LmhRW7EQvJP3BG4Rx
         G2yGxR6SScXmh/dxexJIkJ9CSz232jcGwHbTqw9yZaF6r5AsasJeSHU9039ZOrLlRurr
         RrFgIX9X0EmfyHil0BlevC4GS5zdxEROXo88LN+JS+a/Vgda4MsqsHSPkW+Drzbp6SU1
         QrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772025947; x=1772630747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl070totApNxtzNfs2Ht2ITbl3V+CGxeE7SKwvt2uYU=;
        b=IjRonyfzVouI/2PbEiQKnEXZ/vC4DyO3FnK/ZGjKJYCo5WMJQh9X1hGyM76Ed3b1jA
         quaHK3mbnl5Vd7rkaNcYbfWxCma4I0LeOnzDL2SlB13u92Ljj/2DGkMMGYXhCnDmc16Y
         2JyJNlWuQrqeZL1FQQVXDnVllmGvJlgMfi3CftNpkHeatmFY0dmQr6g5Z8G5F7frzuT1
         baPOaq8edxvSto1Fc2tQH0TbSEdPbhpoc+lGFsrwcX88q4nvB7Qd/4VsRV4Qr1e611NJ
         0yGEaH8WI+49CcBAn+1WLkJWexezdOdcDKsxS33Cpn5HrudkA7Nggrm5N6KMwQ7D3TRo
         9wOw==
X-Gm-Message-State: AOJu0YzP2rrpyUQUcLqb0bFsEMmiBmoRXood3CKUnv7VQDrjXrMfq8AT
	UiOK9X45UZSQ5hyY1nUyK+AMhBprQB9dCRmblQsH4RpMryHaOQZ/3iwid59fAenC0JilLdlmVml
	SRGSnVfNAMjmuRmk61f3u6S5ar5FULRcQKaJVkFy5H0gRTHm6e70KuEaM6aIbL6QEz1Bo
X-Gm-Gg: ATEYQzwPICceOZZxcP2ibgS/o6uSy7zU+qoSzcAyzrSFFX6b5HjTjzA/loJ13Cf8P9h
	q2mTabjE7DvRiKQOEdIqxaFNcXf4v7FxU53zXKg7qIisMjgTs8uJg7kp28QDbdvUTTNCEnUHDLj
	asQsfQG/S3oZYF18FCHPclqUk330Ky6HC7d3U3lQK1PDSrgGbjJU1VeSWn9HYWI+wKdec5UvW1m
	lp8TyHLswQoT46WIUBmu2TNQbZMjB8hPmC2adtUqKOwFfEYP4a/7oQve0aeBiGg0JhjoVepIQ99
	E1uQMPythPptknle9Mi5nbq4YgbrCByH7SgUp+IXjybhsi2f6QwyazH271OOKWM0QYSXhd43YvJ
	8x6ZoVz6vBUd2oag8vRPTo/5X35RBvZYuOuAw0IWn8Farpq+zLq7XrWxnStJOzgHt
X-Received: by 2002:a05:6a00:885:b0:81f:477d:58db with SMTP id d2e1a72fcca58-826daa0cddfmr16888222b3a.39.1772025947473;
        Wed, 25 Feb 2026 05:25:47 -0800 (PST)
X-Received: by 2002:a05:6a00:885:b0:81f:477d:58db with SMTP id d2e1a72fcca58-826daa0cddfmr16888200b3a.39.1772025946950;
        Wed, 25 Feb 2026 05:25:46 -0800 (PST)
Received: from [192.168.1.7] ([122.164.81.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8a1145sm13438814b3a.45.2026.02.25.05.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:25:46 -0800 (PST)
Message-ID: <b41d4998-5f7d-4d89-af80-a7a2d2a03021@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 18:55:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260225-wdt_reset_reason-v7-0-65d5b7e3e1eb@oss.qualcomm.com>
 <20260225-wdt_reset_reason-v7-4-65d5b7e3e1eb@oss.qualcomm.com>
 <1a28d203-e0ee-4c0d-a6ac-7f50ab26bdeb@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <1a28d203-e0ee-4c0d-a6ac-7f50ab26bdeb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=faOgCkQF c=1 sm=1 tr=0 ts=699ef85c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=mNPf3JdYh40LbGEelsvk6A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=wjWkyli7g8A6NY-DO1gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: rxTEaZUK9XkM01TUrBi51dw40RCnXmZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyOSBTYWx0ZWRfX9SHwZurk0d5C
 JQMWGbMPPy8Y8Mk71bUA32TlbGYHiTDFhPcGiso8Ok2tw7JadyXRj8DpENZRuLPO4xApz8JJrfD
 URfS07BXBvfMSQkzzqZsTFGXpg4II7oNQRcjmcMhEur8injcQ+Dt4ODto2W2B/w8ZrfdOYFca1F
 5V3U5fXDWNbjnP834/xdOCdZjLKPwMCMsL0mzyiTpjbg32yHJv4WibGNYT4NPQiwLLxG+Xr23X4
 NqRPuqzWUumsS2BXvNv1nc3FJaaXvZBjAdz3LWoGyOPRFnWSgcT7m0mUZzIHEOmePdXcDBerWEl
 9ODxauqaACtAav6ay9zJHRjFh9mKpACwZyAMiDZpQyhpsfg06b/MKJKdNA9rFv+FW6FVgSdsXFc
 sHi89xi31rNbc1rlyLU3W8qXGjiNZ6QiVl1rqcQlB+NWu1z7g3cSxq3kIvIFsgbScLcmDlBKuJ0
 nEPOTQXOTKGs39x/Yjw==
X-Proofpoint-GUID: rxTEaZUK9XkM01TUrBi51dw40RCnXmZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94120-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B9C2198064
X-Rspamd-Action: no action


On 2/25/2026 6:11 PM, Konrad Dybcio wrote:
> On 2/25/26 7:43 AM, Kathiravan Thirumoorthy wrote:
>> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
>> in the WDT_STS register is cleared. To identify if the system was
>> restarted due to WDT expiry, XBL update the information in the IMEM region.
>> Update the driver to read the restart reason from IMEM and populate the
>> bootstatus accordingly.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
>> 32
>>
>> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
>> function qcom_wdt_get_bootstatus() to read the restart reason from
>> IMEM.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
>> +				   u32 val)
>> +{
>> +	struct device_node *imem;
>> +	struct resource res;
>> +	void __iomem *addr;
>> +	int ret;
>> +
>> +	imem = of_parse_phandle(dev->of_node, "sram", 0);
>> +	if (!imem) {
>> +
>> +		/* Fallback to the existing check */
> Odd \n above
>
> 'existing' is imprecise, perhaps something like
>
> /* Read the EXPIRED_STATUS bit as a fallback */

Thanks, will update the comment as above in next spin.

>
> lg otherwise
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

