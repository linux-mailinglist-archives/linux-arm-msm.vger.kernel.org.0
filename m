Return-Path: <linux-arm-msm+bounces-113129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EfxjChW9L2rMFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:51:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA45684BD9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:51:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="A/L7l04q";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fVab7t8j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E9803041B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE4A3C13FC;
	Mon, 15 Jun 2026 08:47:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710863C3789
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:47:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513244; cv=none; b=sIDQwbAX3p2mVPfMoW+Wzp1iqYdWYroT77SXFNFha4FjM7hyb3tmds1uKnvOsevQ9uNqqU0lIg7bzGwcy6pTAYhXUGTlpflHYUSn6X1U5DHJsm+8ug7gxRoyZYqB58AULISZHFv1ZNUqa3mzzWDcZL3yhVFwefMHBOAXeYVUZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513244; c=relaxed/simple;
	bh=agCeSqwSBC2MMkFH5Foz9W5dWQ3T/K0DMGdXiRnsmgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt1J10a738uMWUeTIC5qv7qtEX2i/Zu0Sv+M5r+VgV3g97s9OCS+zi59Qt6dp4iYgk5mGudFoAhWIVBGYifdFAJvKoO74S0IvoAi2qFxUzzac1XBmsNs+C5Nn8H0JSs2pdW8c6bfp3+hQI7JwozUg73+caP3gYt7lpFLtm2Pkj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/L7l04q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVab7t8j; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IvQo3332583
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdQz1b15fvVu+nGad87JsVN4bifqNqTlT1TALXLaWMI=; b=A/L7l04q06VnUsSS
	7fbT250j4NRZbzkSAHdTKoOvqCWWLB+Rm72im3e2CJmPfh6A0jNVEb+P4NJjFFIF
	TUgjByUM6gL6weuo5exipo6OXMhXHpayonykmb136o/iDCEI78acUvqkkQlUDpeK
	6oh4R+gTHnEOERpMgpfRbhnJyid/uBtJe72Yq0QO2EKfVhxpbL3YCD582crUfrSl
	U277hUmHxXtdQy1bfg5BivTOO+40Kp7iKszD06S+/HJqwXKB9oM4gafNirRkQ4Da
	zaYQZ5Y90yPL1xI3sYUsHa+qPOTL4d8zjZe4KIlm01H0iOrKxRqqfH3+gDp8hU1V
	h2ZSKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16j8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:47:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf30576aa3so21691585ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513242; x=1782118042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XdQz1b15fvVu+nGad87JsVN4bifqNqTlT1TALXLaWMI=;
        b=fVab7t8j5m4htGU81FNmJY2iHK6BsIG6VJWdlwD0p2xaWXt6/SALhFZglMSBBEPtTF
         OZ6bgWi68K1R6L3F2gVSF5oBRn6PR9a7Epe4GvMRMQuYMPgIb52PK36neR4dAmAR/qTb
         5e+NyaVzuL3CEz4eZB73NmxY5lHeJ03FcWQkDBOIPrDlaup1XS4W1QF/do9+sWKMkSqC
         5b88PSe+iS862z52J2bwe9pwq+5VlkVSrqt5BLNTBJWKo1KiWKnkx1uP008hLtyppiiq
         MBnEub5g0muCcSN6TDFynjQy8Nqj9oO51P1IeIb+2vzQDhpL95SvQ7+zseeLtUTg5yr9
         2sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513242; x=1782118042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdQz1b15fvVu+nGad87JsVN4bifqNqTlT1TALXLaWMI=;
        b=tGDiBbfoA+GCYgwrJIKJ265CISfGakAzbS9wfIz1zloa4w57YO92nwDYvwPjq18r0f
         1LBzQMbK5ughylRk2G/agnvcz8n+j8mwe1PASUZxuNvj96qI0UuGPUZvalwX3pPdMSVa
         x0GzNzdjzScGt4CaAV6/tmmVYmjTJarDdxNcBxOdUzS0iI18XsV2z7V/ajwo+O0NAMBD
         L4+GaXEC3DPa8eHiGVLjRgdU/WndYWtBxwo+VgMjYRbjxSuKlmjYmy4JkrHKGGBtQz9K
         84Mzmz0DXv7vtGHUzY3hBJ1XQ80pO9wZIu5b/knXQwfixYP6s/nCbVjxKseWPwz7RyKd
         tnmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UvKhGrOeT0C/8HtTEiWEUog5tn5Ffgz8oJZqhg0zX335KeTS6T4wIOw4DGNgJdlLLxqNPeYcxkBr04kRy@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLnS+27zZvkM4mqaFATpNJGPD7hIVceOjR6EKThM9tVwAM2eB
	MtzdB6u5/1OoiSOKOacuPRgR7fn2dr/nWEwKDVFRdtWkJD8CU8/Bm5ZjAtxk3OGHrt738feY/+E
	aCT8WGQAgALMp1Q3CmnW6jqtYFwcf8PpaRcwfhRufa5RCADJfBVsbpIPgmUdgFboG1vl2
X-Gm-Gg: Acq92OFz8wtfrFpGsv5eqNAd1tnAimO7dp9GAzAMTVY4gH/NYo2U7Fw7NhYhxafOSL1
	lx82BoduzTiySwqKkQFyb4Omk6+pjBe9kGjXppM6oGmeL1+TA2eveLr62MddM6RFamtBxDP1Apu
	ML2S75UbXTjzPtpKGkZtkDccZkhMfV8LHhRns+LbBAANeq4J1bygn1I0XnZyALrHTERRo/W/NP0
	J+iOs1PMFlcwlWX5fIilrVBFbdRufK4Y4zoHmmwgkLYhvOsnwY4Wwcx25fsENgmwFtwSGbXbB2B
	k+bSFiX+jCJFSAOFN2BGEztVaivSabi9z2Xc10eI9TtsXoIf/DdrDyTcT9pf32oO3ZB1qtlpFtN
	BRwHpjTufUrDp1L4deZgSCl/v/gKjmzGDbV/Z9IF+3RvxnEFVjgvIwo/39Q/aYSSJHalMo/KB4W
	DDBDZTDBMzGW4Xn7NzHA==
X-Received: by 2002:a05:6a21:3cc2:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3b78409e4c0mr14916131637.45.1781513241951;
        Mon, 15 Jun 2026 01:47:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:3cc2:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3b78409e4c0mr14916108637.45.1781513241514;
        Mon, 15 Jun 2026 01:47:21 -0700 (PDT)
Received: from [10.133.33.122] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5ccafsm8502219a12.2.2026.06.15.01.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:47:21 -0700 (PDT)
Message-ID: <df14ba01-7f60-4d4f-b3f2-b74c9db98c97@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:47:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/39] drm/msm/dp: Mark the SST bridge disconnected
 when mst is active
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-28-b20518dea8de@oss.qualcomm.com>
 <ge2bgx7rn4vcyptf4cd7hnodnycrg7gdjceqq5zdncmdmmnjlu@2cuu3lcotxeb>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ge2bgx7rn4vcyptf4cd7hnodnycrg7gdjceqq5zdncmdmmnjlu@2cuu3lcotxeb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jzqr25taKjmdRXSJdmxKno4qa7MPytSg
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fbc1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qtCM4fGR6xh4bEnU-0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX0t5/YyxmXfhm
 qXOj0kKV3F6Hq7rI1wT0VlAP+BXufdMa6Ydizd1vPDDitKks76291X/SFbddLZs/9HyIjkwK+C+
 Yg/XzPQ/ckU0gfC2wBTRO2eW9Gt7X9Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX7wRHMFvzAvG0
 HmGMMKuKF4jmRtlmiFbvxAC92iTFkZKeg/e+K6YCKYs79sz6MS8QmBQuPBXYAMZbGUuHskSmwQ3
 n0Llsq8V00uIa8BHjaGgkxGXBQTcuFis4kUxxZqFXVTkyyCFtbCesbpgdhAbqX526k4WKsZRpaV
 QP32cgL6++f2xZNFf+Qy+rjepAM8BVNSEjCENvHPdK6mwVdb2FDqf7gB/pA4Dip6qCj0cb7eEmM
 GqwZPFl5dh88RzhkpLPxzzv9QZ4DYOjRjJooNGI4A5yXvcAsQOkmelEC0Caga3Z3pZO6FllXdkz
 LVC9e1QD8/wg55tUYvPCbD3pXsiftOGW2oPC7OB0/EQVVMMPgk6V7BG7Z33tgSrOjrjP646D+Qr
 pQGSrnQarcnwGQ2r41vE0TDTZyc3RwvsZlR/N8TB3D1sVSEMNoWD/fjuNFZ7eiRu7Gb2c6IzZOq
 guoxTmtUZQMrp8gDhhw==
X-Proofpoint-ORIG-GUID: Jzqr25taKjmdRXSJdmxKno4qa7MPytSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113129-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,quicinc.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DA45684BD9



On 4/12/2026 8:11 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 10, 2026 at 05:34:03PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> The bridge detect function is only applicable for SST. In MST mode,
>> connector detection is handled by MST bridges. This patch skips
>> detection for the SST bridge when MST is active.
> 
> "This patch"
> 
Sorry, I missed that earlier. I’ve fixed it in this version.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
> 


