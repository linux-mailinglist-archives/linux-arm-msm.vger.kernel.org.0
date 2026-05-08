Return-Path: <linux-arm-msm+bounces-106677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL+pAk7T/Wl2jgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:13:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC914F62B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F1E0309267D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42A33DC4A3;
	Fri,  8 May 2026 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHZyhl9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Am52nWj7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3163DB652
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242159; cv=none; b=t8/Q/6UonrOLf9LZK1dhdRO9mNBFSYzqmtXvT5KesCU0AjJwhT5TRghN6pVm2sVKy1G0dOnFY+ygFgfiDC2jmUUa9C94KWuVivMNnsIcGJDPIMc2M5K9SgD8K98ybDnKUBH4KLz7U/BM56XC3i9nTyaipl64cPE/C0K3S0PSxtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242159; c=relaxed/simple;
	bh=9JXcMPi9klr0gVBugissvm3yubFoBeps+U+24lIoaAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOU9B9wSTQMcINeTG4p2gflHKCoOKxkOtMelziQ6aWCRHl/M+Y8ztpmP1qISI8V86w1yADmFIVTdV2K3ksSjKGi/tdxLdtexEB+BglBVovJag9/TSRqKKfRUnpPK5v/WZQF4NCUZAPbKE2JugOE/sp44sLDzGWW5/Sd0aAOS+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHZyhl9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Am52nWj7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489VxB62771502
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 12:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gQ+VgIMQeKAABKdVWfr6IhkQcf+KdfW+45aLUXYfA9A=; b=HHZyhl9k9V1/66Z/
	+u16+1ckFqBBewZtAvFfgJ/Qo+lS8caKdHT16uAp74x4ZPmmkZTUB2Ti5ORjEYB8
	R1ViM4LV42S9z4wTSm+rMnbtaq03QZY5giqnlekfvWr7ZBtX9VKSsyPob0zv2mqf
	j5KHIwJvAJuqXWh6+wQNI/y7Zxp8ZMH3a7ReMgjScgKNn+6BiUE4l3YntKUaJGWT
	Z1SpdZe7E8atwILSNuHoN3Te/5waRbKCgrMUtyhJ/XLw10UyUrgUa4dNGGFI3vNg
	OV/gJ3uncEIvXQws9TA/b4vbxtpwxV/SJ66GpRakgU3/9tUA6dyqqJmt/I5TfecR
	6AiuiA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kmh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 12:09:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95687296dbcso111846241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778242157; x=1778846957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQ+VgIMQeKAABKdVWfr6IhkQcf+KdfW+45aLUXYfA9A=;
        b=Am52nWj72AHyDboZXbsEwHqV2KHcs/szowvPzBlmV1KNa6aBWkArEzRe9uClbWhYNw
         bgJIKitggV28bCSgYHBx1EiqU5xguZGEI2r08HFLpedeuWe8MRvKIobZti2BIDkyRqnu
         /p79+75YpGvg7kEisxk82Hu2SGShCX1MAsp4g1vOf5thjOR+14leNMEmYyJ3c743O4oi
         3kkzDmS88isnHF/qIvDp6rz2ZTY9Ab6ayZyF1cvRshuik/czqXFuwHq30xltyZXTdbZx
         ahHEXpYQPAF81JwaYo8ivU2c064VCWMuxOyJzmGsSjVgCiLaesVpM4PBpxVFt+0TRQy9
         SC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778242157; x=1778846957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQ+VgIMQeKAABKdVWfr6IhkQcf+KdfW+45aLUXYfA9A=;
        b=AGDRckUc0rkHa9gmBvOKAwrsBg1otBcWrOJnD88yKv1qWdZ/VkuK4L+UJ95uSTv1hs
         BJXxqHsS2l+sG3UJw0tV2YF6oHSyZLJ6J9DqiUqMyA1M3p66zcty+YSc5tLmC9t1o8TP
         A7VRFhNFh3+/sM3plnotsplUVcPxfXieB5Huxps6uKNaYZ9hyC32AB75QkyTRVPP0l42
         AsVknjbGC3+ReLW4Ck7ULE5dLFceKFy6B3kn2C2eNc5e48hr6GOm8FKMnK200i0TmYL6
         8jLHjORSN0nHI3wow+qXOwlXmyJc3bK2hRHx8j42BBHs8NHdAnhxC10RbZxm1U3E7ZSU
         KDfg==
X-Forwarded-Encrypted: i=1; AFNElJ9elI6cH6Oi7wvWyoIYEmOJXbmO/lWujoWhq/lAf6uAvr/YOzOnZ/mFJ7GhQ+XZ44tr3xMnbNXIeglKgUJe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhr35/eKH4aZiVeKGADOUWyW5Skw/NF1SMBjfBHLmbKfMg/8QT
	O+FB/+lcMgIqQtaMAvztEa/yfarf7epBdiAAGPvTEOqLKiC0xYtAtj5CBtMcQo9uR38PikPg0Uq
	JV9fP6AbbJ6X3a563WcqCBayiagdGgMy+g1J9vPzY/Fa5M/GrPWCv2EP0CrwC0zDY1L7s
X-Gm-Gg: Acq92OFDqHbAXZJQcnZzmOBhzkMYw2vE0KQ6ZzqH/4RI9kNQsjLrwcdJk5e2LYr/Dxf
	qMNgiH5F3Frho2+1iLz+h38A2MvquuaoarXauNnrdolcy+pMR+c8EJEuTwR3Jq2mmkBGz9DeBG6
	PTLfeJsz4LVFXLt5/ZXMuvi+XKlAFf3JIP3ome7YnMrkE5g7rcoeN3R/XTk//5dTQV4YK+JP/W/
	H48lopSwcYw0WkFNe5DzvmyUmM9ObB0yj3nAWqIvZl8VmehOYjSHELb9vY8UnCgaylL1kyIkH8A
	XMq3rN/2s4lia30ec6Pkrj1t/Mds66UgrDyJ/2HxGAoT+CR7PScORrrLrGmEHwfyTCL5ao63aAY
	GoHdYY1P2pGxMQNvQmIgRq+Ls+ne/qumFhINF24RFAO9RNwRciXmXmR03h4N/6Jfy9RnJuHTK8K
	w3SD4=
X-Received: by 2002:a05:6102:3588:b0:61c:7453:af7c with SMTP id ada2fe7eead31-630fad3a524mr2727061137.4.1778242156654;
        Fri, 08 May 2026 05:09:16 -0700 (PDT)
X-Received: by 2002:a05:6102:3588:b0:61c:7453:af7c with SMTP id ada2fe7eead31-630fad3a524mr2727050137.4.1778242156271;
        Fri, 08 May 2026 05:09:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359ea4sm73498566b.50.2026.05.08.05.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 05:09:15 -0700 (PDT)
Message-ID: <000ababe-5f9d-400c-b7b0-380ff25e9fad@oss.qualcomm.com>
Date: Fri, 8 May 2026 14:09:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260508100700.772985-1-priyansh.jain@oss.qualcomm.com>
 <20260508100700.772985-2-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508100700.772985-2-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdd26d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6AAB0q3k6GC94sigMGcA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: BdTO3uJZgh09SlpGRpScrKNf2c72oK4W
X-Proofpoint-ORIG-GUID: BdTO3uJZgh09SlpGRpScrKNf2c72oK4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyNiBTYWx0ZWRfX3zSRJ63RZBUl
 xv6Lmwx7VdHCjtcP35XG1z3gdq3qBkwt03+ZXefBl+KzIhfy9alFPjPCJFbFH/PsySl+asbkqkA
 LFhY4kxiIM4n31pfMH89v1Rhb9juKu50MWceJ+aK2xi/c9HM9hV4do8ToGdPB7lDAeNnrqnV0GV
 imbgIyfmBGgVsSpJ0hBSbSNsdbz+G00N7lzZd25SAzOhkxkO36GfEL5IrBbXZxkL3g0GWJMXeSd
 kKKZYXyQvpN72HwpZHSVSnzcVi3Z/9CuTrywxuTMoZNqDz9UVmCjstwlEcTolrnsJ5sfb1//6nZ
 HxcFkLLu2iIyiKfSA8Cy4umhDGgObKXngzF1pD1d2GqpSPw+I2MgErQZPj5DvwbP5v4p1jIQbf9
 GU+DGT5Iv2yDb0y5KPcMvdUWc0S81GcdidS0RY+HX5UahNMzyXEoRVvAhqRn5YRa1HeBxvg/770
 6YPiFnUkn/nepLoDG9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080126
X-Rspamd-Queue-Id: 6BC914F62B1
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-106677-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 12:06 PM, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts observe a valid sample, a stable
> fallback value must be returned: if the first and second samples match,
> the second value is returned; otherwise, if the second and third
> samples match, the third value is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

[...]

>  struct tsens_features {
>  	unsigned int ver_major;
> @@ -522,6 +526,9 @@ struct tsens_features {
>  	unsigned int max_sensors;
>  	int trip_min_temp;
>  	int trip_max_temp;
> +	int valid_bit;
> +	int last_temp_mask;
> +	u32 last_temp_resolution;

You don't need this now that you aren't altering the regfield
definitions

Konrad

