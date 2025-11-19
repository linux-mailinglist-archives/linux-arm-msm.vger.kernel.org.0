Return-Path: <linux-arm-msm+bounces-82405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACABC6C1E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 01:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id C87B82ABB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 00:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CEC1E8342;
	Wed, 19 Nov 2025 00:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRxyCUma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xuvjhxty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C91DDA24
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763511831; cv=none; b=gOpN2KxeaESbh18nfixWoZocEu/aCVfKOEa0K8ddohTWMdLaJbnr2If6rSVaMUj2xBl1ZRfrES0THbl0QxkwG8gQmDqhpzijuguYehj52B+NVjsnFtlkFf/ASZDA9mNacwfgeHGj9pRVZa1jXb8eNka8AvRonX+Hh3HQAITCClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763511831; c=relaxed/simple;
	bh=dbxQ+lWbQ/v0JEBh7WfaNiELJev7d2uNdEhFBncVoVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lczpfuzpw1I1nYlOo8HhOGmdwS0ZLENqrq1TNcKhy4XP6DYOpg6/iM0AY9EGnM8Vtwjn6cNFBhIA3HT1hn+mkx9As759yjq9TlHEnqhNTvEtB4kr3c8FKUWcV2x17E2sfWbFD6b6pKSYjYNRQTL1vlDfWZn39pfoKoQfV6R6tMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRxyCUma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xuvjhxty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGU8Fk2665108
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NACq7p7BFA2chMCrQGix5RxOQsKwaCoHfjgKRgQT/oY=; b=JRxyCUmalpMTaAH0
	jrNkcwN+/Jixc7420knIWiaHfFrreM/BoV3SuFELWZaUIpVTwJnD54uKq0Nk72IP
	WGKAhZejaOQBpam7xA4Gj/T+q0gOC6na8MdPK2vUQ+JoI3cL9cP8PybJaeu2whYy
	xWXybs8D7IYZnwVEB++TzUxOZF7YQAC38RMTZlM0PaneT7QecI7ycH1ASttGfpjh
	+Jy8nuRPnTf+teNpDlxonmokFatbCyxoNBaepM+EqXZQWWDRmAxzivZGI6kl4W9H
	R8e4g9qbHVETYmZTAQtNyi48NHPq63NkUYBIQEVLlXXgaCsaLgKqGfJqVDYBVxB4
	AKqOSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjkaa1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 00:23:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b99763210e5so5849218a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 16:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763511827; x=1764116627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NACq7p7BFA2chMCrQGix5RxOQsKwaCoHfjgKRgQT/oY=;
        b=XuvjhxtyrjKUIYyKReOESdyW0j7il6KELLMpz6CWYWko2BTbUCNRrIxDksNP9xo/6d
         LRJF4e7Zbyb9QQ5WuVYO95MFu3AwuT6/uhnbkE7qQQAd32cNac3/2NdAXLCiR1iA4Sld
         GiJMV4kAqpNFmVoOXI19FUP71s+0IurjF9wKlYelBRFL1kHOqSu0RTr8jM8NyaGdTrNy
         LEE/LQlHd4WCy7eWxvzkloeGXywnmd1xQadLSyTRt9jCbsXHX/z86oG6bSmpk6/V4v3c
         Y3g4RBlUrUodDcZKlKPS3GgTiPhgPH1p4sz+lqaxAasP56QpJj7f4KvU8kL42FQ+tPkY
         PNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763511827; x=1764116627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NACq7p7BFA2chMCrQGix5RxOQsKwaCoHfjgKRgQT/oY=;
        b=uMG55e0qzD0qoBOnik26Lnv9/FplFDftK7kpKUEej6bSCHv4ElGEbshXjkVKU23nZi
         BTxVnsNy1/GVfnupHyT7mFKCaG1ej9TWA8U7tGtv2N5UG3/2tA13DYBPTcQQQ5spDmwO
         yMLTiwOR19pbeMVWN7pdQnAT40VOLLV+XFmkGQzpZZ8P7qssj38GvMb6iVa60kJtacUY
         jzO3E9Pvvm0wXMXg1usnpcfvD6efyXl53K2/PcQgi2xEMaVa8VS48F/h0f4Z1WpjUFuI
         MR8St+I35BddQ+f0jfbw0EuPp+o+veWceRi4plAX7icc5BxyRP1DJ46zJnmrv/fcjGBy
         grhA==
X-Gm-Message-State: AOJu0YymQSWSbtsqENZk3k96tU4Gl1Zm6QJ1xxFmmPjEf1gh3thOpI8M
	SD6AgaeJpct0Xmhxz4q4X6Vg6CPuRF5EoAd3KYXQvGBLB6RMmW8alXyCTyXIe25l7InIC+g6MIF
	eMlmfWqNt6oNo56ponX/J7UP6IZ6HaOSorHuEQgyxG/MQJFzc57tQR+FjT/qe4m96LJBE
X-Gm-Gg: ASbGncsZLjAFavkCBnwI7KgUoxR18EMMXo7cXAbGT/LmN//u5Xl+Pob+L6bzPk9UNYF
	JPTiynEEOw4cjRCG2HnQnfqabHH54fkELa92AYSmS4BN1wUyQG6Am+NBcb9xGsFED9TFqQo2LA9
	0P66cXGITwgpbFy/p6VNZ8q9Z89bQ4dBztc6tCqw9Vo47Xc6P4VaTuBFNco2r1e00U/cluOpRAh
	/MEvUBsVWeydjzv0u9fRsc5uu3yrIdAA8hLK9MIw/R/Cd9GQzBGFIe622UeUWWyQxkOR5hH9FzA
	4aXJ91/upYUE1fpqNBa00WEDqHRjsHgU3iJ3vGwUlB/VqFFVttJAHhqywuCsf5bpIjFQ8E/rIb1
	uoAZNfl5cRBtYTLGxJI/K2yd/4rrA/mswI1BzHZTZ
X-Received: by 2002:a05:693c:248b:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2a4ab75ea03mr8177622eec.0.1763511827294;
        Tue, 18 Nov 2025 16:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY/LUvIaYspXXBZKdhgqXXbTL2b9p/z+6obt25kh74FGuJV/7c04bkuMplZXWKtSHgF7QJnw==
X-Received: by 2002:a05:693c:248b:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2a4ab75ea03mr8177609eec.0.1763511826697;
        Tue, 18 Nov 2025 16:23:46 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm48843525eec.5.2025.11.18.16.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:23:44 -0800 (PST)
Message-ID: <c2f30fc7-8123-4711-a45e-d02155590d22@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:23:42 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-4-1e6038785a8e@oss.qualcomm.com>
 <79097e86-1570-440d-b18c-43b143f9ab54@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <79097e86-1570-440d-b18c-43b143f9ab54@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YrhuN5IVDUai-35hVa8iGIWeJAIbnDIQ
X-Proofpoint-GUID: YrhuN5IVDUai-35hVa8iGIWeJAIbnDIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDAwMCBTYWx0ZWRfX2tQqZJBqcMW1
 GFP6nyZCq4xQvuBO2qN+k0pyT+hxtVASDbMQVC3aKVEmFc1vN+6eFkfPYuEiji2tnYBI20EvN/N
 Y4mXbV9fCMdqDfZV2iv13O5w+fAOJ01iBpCG8rdRdDRa7pUO51er9JFDrC+kumfXPl/ZvcywKMD
 O9vuHWUL8jtlc0E0cfT+6zfZRaQJTXQI9ZiTEOHzoaBJ/hjj7ta+AxSAzZj4/qW88YTW5zjiEw4
 dCTGmp20vCip5NdScUQf3oVXFFSfElQB/3ANwJdE1esFWB0eUjZ7oGREWke7Lg7qzRlCWvHnSOw
 irXwUKFTZamJtrXpUh7FJOV2krQ0oxIHcdPwm8/aWjpp+AwTtk/yK7bbj2+5R4rZK4JdtIU+45r
 W21cxk7cxa9IOfYnzBwszT2CA6B5cg==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691d0e14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5SxNaTsAWBRRj6OLVwAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190000


On 11/18/2025 1:43 AM, Bryan O'Donoghue wrote:
> On 14/11/2025 03:29, Hangxiang Ma wrote:
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + 
>> i)) {
>> +                /*
>> +                 * buf done and RUP IRQ have been moved to CSID from 
>> VFE.
>> +                 * Once CSID received buf done, need notify VFE of this
>> +                 * event and trigger VFE to handle buf done process.
>> +                 */
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +            }
>
> Somebody needs to have a conversation with the Si design people to 
> tell them to stop moving this functionality around... its completely 
> demented.
>
> ---
> bod
>
If this is different between any of the recent chip sets (which I am not 
aware of), we can discuss with the HW team and standardize. I will take 
an AI on this. Other than that, I believe there is no code change 
required here. Thanks.


