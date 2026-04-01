Return-Path: <linux-arm-msm+bounces-101241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCf6EvrAzGkWWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:53:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0925375706
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A40C130607BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E03C26C3BD;
	Wed,  1 Apr 2026 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtixfgY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqxmhQdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7B2BE642
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775026022; cv=none; b=awKunFGzJoKwLCBakL3H5RvVXCaU7VenA9VjtpfZcZvMfLWFazUD3H7JR3ij6X0MTBdVxMo7Uts6tS7ht/7fxMFX40GtfjzzUo7R+0kn4AxPHTGfJBC1rFjPyPIGU3OJOYDUu+auNC26oNuK7/IGmUQnb6dtvAxKZeUuwKr3ePc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775026022; c=relaxed/simple;
	bh=P1Vi36bvCmjPWJK6e+u23vMAOxZq0PlpJk/jmUJBD88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxsuYCfUczNIcO75yIvyIYqKf46eVs1WKpPYQhWzeYVCnpZa/Gy37UXSM9Ao+gDPI7n104fuZuj5qa/cpTRCHiGuBcqt7PrIj6diPjQXJlxwuOiqBsztmr7aaug4rekPe1tW2IbJeTzWYeiUslAwJC80rtGQ3/8zsp4jicxInfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtixfgY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqxmhQdp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6316fFuc3103832
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cU0JO6nNSOem63nZNguZOl6oCNzTQPmTCHcJjz8fqX4=; b=RtixfgY/wlQgXq6k
	KsAxx0Q5BkoJmN61F4mnOV1RdliN8JmZRcqrKCv3wWc7TPpu0JqZ00VsCQC/Cy68
	hUV00OJTQqlBuKoatc9H55/somYQ8dEPUyiwZGj8MqKfgclx8MIP3ItBapqiFgGP
	Z0rI3KeFON7zZMP4mx08edE8V0xFZj1aES0V3i/UgiV+bHjupAKL1RbMw42Hmmor
	2AvNu+uvr/ZzYRLI5w8ShwM+ae5dphtAOfLpYQN1t5R07W75pn8QAoW4DoDKrlfF
	1GpboJws/hJNfz+68dK7Rqq/TyluOw3bzoNG723GYoJY755gXMumfID4XUQhqT7B
	B+lU5g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js22x4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:47:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76ab2f392fso1214452a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775026019; x=1775630819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cU0JO6nNSOem63nZNguZOl6oCNzTQPmTCHcJjz8fqX4=;
        b=VqxmhQdp68uXhm2HslsP0vv8KgxuffZ0P3AxBMvpUUrPVXhrEac372M36ULKaXCL00
         HlSgaKE/BjMJ2UXcu91mJZ5PwoiE78jUagkUjKhGjOgCekXcpQiCeevRmwte0PEQsJ+q
         we8QTteqTIkD6vyLpput2UEg6o3ltpDU6gky/N+k22NRY+LbDc8sLd0DiW97D/K8BaOQ
         KNanlhGwSIBAUqf5MEtoIKpy8CVMOdTmjYZb/WCbyg2tLkre6eVXBiponn23wFEsZ42k
         W+d7baoiBuf5qcqXpHcCf5xvFRxT0jnZIUz3z2jTZM9e+OgWfaaIYWtixl/TI74vkWYr
         Lb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775026019; x=1775630819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cU0JO6nNSOem63nZNguZOl6oCNzTQPmTCHcJjz8fqX4=;
        b=G9P9HgYGbmeIGTPpizQhZNYBeU7J+ZP+sB2WDyfDddoXHU7eZOpZDLRWArmj5LH1L8
         48yC8q8daOT1NP7OmJd98lNhu9KD9w7xoMp7+D243MMxUV3m3FAWKwELar6diDBCXo60
         bqvNKHzA6/+z6Psu/YDZc99Rn2yE93lToNlzZ6LTGNCQcxcS6xAEM8J1fVYQJFWwWqN3
         YaLeTLXhc2U2xJ3b19JjcIWNJ3Zs3ToWmB24doMNu/Hoi2j0215A2lhCuGfsWZRPe0qE
         5rxWTfCT4mgvxrqQz/PuM4MXZgIUPuPfuqT2J4DnkUe1jLkEF+gasnTshQMg/DChr3lL
         92jw==
X-Forwarded-Encrypted: i=1; AJvYcCUxdR9KOqu/aaLg8LrYEdszEYFyDV+sMMdoD99kyHmhZaxYb1eyYaltMzv/q+qeI3uLYgPqk8qF7z436eeZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSloPMjn3JoEU+uvVE4H8LYdmdF/iOSKhx0RUN9HZPD7RJKAtc
	qF7QB7YniIs/wf8UYnszTbjurkwCozAXGe/KyH2zadLW0aH6nXWBOkauiJyaFgq5Tlq1oVyo0r5
	4ZsrZJ2NyqUPMRaZOw46GVGWglcsoYv/d1cpxvozYJ/PnDbFsFLLHNAdi4ptg5TbwYthm
X-Gm-Gg: ATEYQzyVPv5nwAxsiVAegkdJSbyJuSC3m066Z9ikeYt5mea2CYRuulnzDC56Y0e4AxH
	PzN2LdSkB/GBXAcmYYBQrtGZ8GUtJL9ip8yZPKNdEi+GGi9pd0JmMvbejLxaUu2t6zN4n3PYDQ0
	tn/aV7wcf5P6r0bOVI3vN8dLE35EnS+P8Ql6KWVPzEYQYE34vem0n93Kdi1BR52ELnmuijdNQiW
	bkTDwlEOqtSxXwgqXxMji9WVNp6msK1B7XR1xIdhmJGBEYF7LtDRgpis5SHYzjEaTGDvuzMyx08
	+ilf/Q81qR0qmBiGa/wFa+Uk0bSMZW6ILK214Vsc9sRoIoVkj8sfvBZVWxOfTlIOKB14hki/rIQ
	uAsi/PivAwT18zUXjZZz7Umy1aTMpMPBPwWaWSfKEYBN2MW1XJfIllGUVvhP2wfT28jdnNrm9X7
	1z5z3SwF+8HAnvxf9dWQ==
X-Received: by 2002:a05:6a20:3d10:b0:39b:e789:7d06 with SMTP id adf61e73a8af0-39ef774e39amr2521053637.51.1775026019384;
        Tue, 31 Mar 2026 23:46:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d10:b0:39b:e789:7d06 with SMTP id adf61e73a8af0-39ef774e39amr2521006637.51.1775026018900;
        Tue, 31 Mar 2026 23:46:58 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76917db770sm10549869a12.32.2026.03.31.23.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 23:46:58 -0700 (PDT)
Message-ID: <49dae108-ad9d-4931-a10e-810de5766790@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 14:46:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in
 mainlink control
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
 <ahgabnh7e2zszqjakexr4755orihk6afvqlyw3lvcffyvr5muw@hmy6kf3ociku>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ahgabnh7e2zszqjakexr4755orihk6afvqlyw3lvcffyvr5muw@hmy6kf3ociku>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LYVAgru32jxQ7iPhJXi-lnX0fGnAqdyo
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccbf64 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0OcOfTFRHD3XvKAs1WQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1OCBTYWx0ZWRfXx2w7BCzrmaio
 bTbbeIxi/9S3e84gtvoLfXz5pE7qdTfHzWk1L8f6O/ydpnyDZKW0omkSXhwajGYwApR36t0zW9M
 g1RhBhuv6kHapDWhRwWJ+KplML5OaBOdFm8IaaxbOS7KNaZ/hD061KdNucLpsS/pWLWbk01gz/K
 1hYRv31QoNLi6UkAvH3gTShx/f5ks+2AQqBEFOofauEgXdBhMREWwgCFJLaMQ74HFOHXyZ0RobH
 b6LRUZlHYFFsHcV1wjDeD0pqO8JcZtzfi55Kigv5rucBxZDhaWfBJUpkvTZ/WxE2tN0Cv2V9Uot
 blDirvddvSfEfLbe+2D9DOApBTP3yoWIKYZeS4MbjdscjLHVROp31B4yqV2oltgRTwq8LkYKiMn
 xA5C8oULfqX0Vkd9VzvQ369qgjDPApqRv8hBrQpmVGb4TJ1o3EU1EMEQWgb/kurpBAryxtwbxct
 bsDdC2NU9oOe52i4UTg==
X-Proofpoint-GUID: LYVAgru32jxQ7iPhJXi-lnX0fGnAqdyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010058
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101241-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0925375706
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 8/26/2025 5:24 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:04PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add support to program the MST enable bit in the mainlink control
>> register when an MST session is active or being disabled.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -128,6 +128,7 @@
>>   #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
>>   #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
>>   #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
>> +#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)
> 
> Why are there two bits?
> 
Bit 8 enables MST, and bit 26 was set to select the required ECF endianness.

27:26	ECF_MODE		MST ECF Endianness

                                   0x0: [63:56], [55:48], ... [7:0]

                                   0x1: [7:0], [15:8], ... [63:56]

                                   0x2: [56:63], [48:55], ... [0:7]

                                   0x3: [0:7], [8:15], ... [56:63]

8	MST_EN		Multi Stream Enable
>>   
>>   #define REG_DP_STATE_CTRL			(0x00000004)
>>   #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
>>
>> -- 
>> 2.34.1
>>
> 


