Return-Path: <linux-arm-msm+bounces-107362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJD0D9+ZBGqwLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:33:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A05B0536382
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 665C2332B18E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4631C43D4FA;
	Wed, 13 May 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5Zq0Lpm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJww5eYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F78427A10
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683227; cv=none; b=Gi1Jo3WKqHv8b4Bx4JKiDAstob9JBIjvSjJqr00a5DeqwgYwdkS3dhlXOwI0hVZSmX+8IKnc7gsyO9IMyLUDAT7SJJdu4n2T8/xTX8QGo28xpt0jI8kRFwsO9y0g9Yq7m1sEJYYKw1mH15F+iWQtjjhs6el16DvX+Wa3hZCCtEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683227; c=relaxed/simple;
	bh=z04beeOBkjbo+NXNq8ILTisFhx8QXe/In8jN3CAH4FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0bMnYoYmDtWS5JOZOBQDxerKOALUENHsYwbLZnU/mu+DrHZ9iDVulVpYonKHuqDAO3oJBA2Q6RqzsHK4doJGODAk2PuoQK8gS0NtoXAGEJb71UVDevyO1mSdbmmlHV81/II5Wmyz8Ul71Rc1wktcUJlOTPDvIfuKCmdK17knp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5Zq0Lpm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJww5eYu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVIeV3430126
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LBKKTtR6QoH/FPl/5VoMxUYmXrWkDhruEl8adQTp30c=; b=B5Zq0Lpm+w7Vrq/h
	C7vU0zySFGtlaA9c0oKN3U+A+p0GBJQgdxvRtbBP3fyOXDeGypSp7S3/mGwq2eft
	D1UmgQs1XH2GnoEbyxib29kNcEqE3Zhu/Hv81I21l/2r6oQ5kCElvPm5bPeMrSeU
	iE/TrsHXeCipDqUkXJ+JfOxhjxgstnsvSs5quXka7rMo8Q+bakjDqaAuC/tNSABq
	XsUqTj/xSx7SfgrrZwG+Jgto049B+nccQfKtDsh5ED+P1Jw3A5IH3FbxpSyDZy6k
	yBXVxUmOHfGHEqgPYCQUGsj+4YbKglHANUBJevdSr3lDqW6zPouMrn47DrFZTRlI
	VolViQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcgx38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:40:24 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-633dcda64cdso258738137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683224; x=1779288024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBKKTtR6QoH/FPl/5VoMxUYmXrWkDhruEl8adQTp30c=;
        b=BJww5eYuu43w11+UFmZ/8UQmO58mgoUdoQLmo2PtbaQcniAH+1s5eA9tlu17JuTxqw
         sj1woxnlAxjoPpB+olzvo/lz71ieS2nD8IGRFaCYWXU3Of5Be6+5wQEFjM3c3Xf1UWfL
         0/I8h6q5gS0TwbcbruIUYio0Vvmkmsp39zIYeEngRrh+N+xctSUrc58Br5rr+0ibcpGL
         dP3uKnJdeqrS6Vyj3bYbXkFMIepmxvZyRMwT1YDU5dVe+ofEG/9zC8AryOA2kEFUSOVl
         djEUysrrky9q3/2X8QQzFuLy9xEM7q+2pXhRdUZi1zhajR1fghR59BtFYz5kIN95MHQB
         IGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683224; x=1779288024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBKKTtR6QoH/FPl/5VoMxUYmXrWkDhruEl8adQTp30c=;
        b=qJKRVX4PpgsX6K6Mxj5hUQdL3XTpKn6zbUovE51LnCqZjvDfQU/kURtHm1E+LRyowW
         U97PPzxU0+jqK/H1ediXUT81oSS5ljXpyV5s0O4tqDR7wCA9G6VSOiwb04har7gl9N9m
         1cZM4k0mT3QSikRn2hviYXEHsQYKDCUDFH6L+DJ198G/IgIjZfiH5y4oZeQz4HLoPEY2
         PoTKzrPyr+uuLNl+mBF/cpldmlK1hALSr9z9RiNVqny41tHbtsoYJIqN8/zhAlpUagxd
         TfPisTEhL2h8bltjWix0xdSskZ+ZynSO6m0nQL0wLpS8fE8U08bk4nzU2uGZI7F8nLGH
         On6A==
X-Gm-Message-State: AOJu0YymmTrFLkCaI8aOdyejX2nTdbWy/h5kpkSHHYUW0rChSrhZLSrm
	E8x/bqTU22s/6LDIYvIUUSr1PKgv8REadWD0RYi0go6X4RUAE3Q1SSiLjpHS12BYjYzzZwbuJGw
	3Cxd/jTS/GkfaLOyPZxaIiakzlYyhNqicScYKJ1aLU34/KaD9AeDboSoACWozfXtKiu9e
X-Gm-Gg: Acq92OEYj1mqgqUYlD7PUpNBbNXtpljYRKmeo83eeD3Ruwxz3fSJ4JXjaWaBnPzcvPy
	GYAwkdr0Aky/laLP1KRQh0eKOwjIKyOffnHNlnxWlRDJw67z+5iRIIOpcy9YXzhLqPVOujeVCmD
	MxyEKznHI7nhJ9gBYbWUyMVVhxfVVEAFeJ1ljRVmLyNkPgiMsfhSwe+2B31AbgK/uf2W6TrAmrR
	6EJ242rX7dyucv9EJh2eoP2uyHseCeemxSPHpn6/BamhYohWIQskKlORWPShQkMcXIAe/MQ5P6S
	CRaPQB/tYZHjBqJ+fvB1Fnz05In/tlcv4mmGgiCOY1qQvEYDTcR7N7Za4v8xZ9fhgoRGTuV5SM1
	AtYeMRoXENOqeC+x67wwiJPKJEqIFO8uU0mpq9TJjoBU4c3A9/b8hHiEBx0yPqzWvuZzkuqp82r
	AYH78=
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr519296137.3.1778683224307;
        Wed, 13 May 2026 07:40:24 -0700 (PDT)
X-Received: by 2002:a05:6102:2255:b0:632:509b:e399 with SMTP id ada2fe7eead31-6377454e62emr519282137.3.1778683223691;
        Wed, 13 May 2026 07:40:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bccffbac588sm639743466b.6.2026.05.13.07.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:40:22 -0700 (PDT)
Message-ID: <c703ff93-3361-4a7a-a183-6679ee3d7530@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:40:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v2gOS9xPdbwx6wxP_7o-93EpNuBLDhvV
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a048d58 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=nO9I6zzPj4eGOE0Wvx0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MCBTYWx0ZWRfX2cz4B+6t2z9h
 jiaXAZ95iG/e/TynsOA4uAMyNoVU9aD4fOVcU3id8n5+2R2wsmMB/X6PYPNALRMdLcHCQi8GD+W
 /qkf/bYmqS3/lHuqDyiSo/IZsta3PRhEPOzjiPZHA46+zVr2zUQIlUK6dkuCLELvgsrofmNkR7n
 dOES+ENKP3V6u4fFxAQ6dtMVU3jS7V57VJKNVAjUzRIouQPWmm30nHeHQxu0rYRW1eh7Y8Qg2kX
 zj3KriHZ/VHTeofhKg5kKL3mLKjph8Jrz22q3prFwKkUBwSnpif7vPtY9wq1pXIVOnWoj0M1nkU
 a2RcZ+NOHRjEBnfIZxcTqKzgGCXHXd3QzHRVOkrIuKUY0Tj1zeIyDRSuQNOxvcGkm8LQTPkeIsk
 WJhT3KihcTSqDa6Hm4e3L8qizVdwylj2bHw6SPbKazb+F58BgI0PBS/YCqz9kAb5eGEmNYz5ATk
 3W8jRmiea9rJEt2nFSA==
X-Proofpoint-ORIG-GUID: v2gOS9xPdbwx6wxP_7o-93EpNuBLDhvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130150
X-Rspamd-Queue-Id: A05B0536382
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107362-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/13/26 12:55 PM, Viken Dadhaniya wrote:
> Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
> is connected via SPI18 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

