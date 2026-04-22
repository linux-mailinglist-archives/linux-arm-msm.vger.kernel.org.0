Return-Path: <linux-arm-msm+bounces-104157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDT0G6D66GnLSQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:43:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F0B448D01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89F523001CD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F1037C92D;
	Wed, 22 Apr 2026 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vbi3je/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6IGgJas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D612E5B2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876014; cv=none; b=mhk11PyaZUOWsoBmy1s0F/ftuo2dJRQwcVrQM9tHBdZXXIOHTL0yL8au3M/zNHDAaHl+8pJz0v32kslRQo2jvIFSiNT8As6DORTjNtyyG6MQBSvNwes/HhjS42+qIbvV3hyjqszQQ/iGByUheGSTXjdb6rVzspzM2Eo8gLk1N1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876014; c=relaxed/simple;
	bh=YXJtKGT9Po1zPsuXzdPrZJ06a1ryVi64lXm61DZLnOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ooWS9HpUCxoGCYMOQx8yDrQ8i2YdEcMrC4cYW5XLlGy10fwK2dSMwt19FAWBDZ/FzgzabRWPwaKIiAs1MBE3j4GPRpIEgjsjqqZ9Rqq/EwCt+oxW39hIZ/WuQn8ONuETPEY9E83fAFoeLgucBFCXcvBCeSIzXsafTyfvtyhdDoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vbi3je/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6IGgJas; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGA0Wv3173279
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BocpQQQnoL1JLtuDV8x1jEBZoyxugL2chYUL6mfG0KE=; b=Vbi3je/lMJ+yD720
	YHy4+8hsMyaaHbR3DEC3rhpVYuW4l57SI0Sj1d2xOi6peH6WnVjBVjOaIq7nXW0K
	YEAjEOSozg5TvG1i0SvnjrhZtlKHvR0SiU71MNeEEp5Gcw9HbUkhARV4v0abUxMn
	w0KXXGq1x6bWVwMktLRbhccOh1DamTnsx9upAuqHPi+yTnlro2OghSLhywaJrIZC
	G9tALMguuBNQbXBi4JzpYHWPdIOH18PLhvFUDhv6/mWy5QFeDMdjSL4ZC0moQi3e
	5KDqrsJQBJK8L/JKtxko+jruhr3yLSkF8XC49ITcXAZXirItRZQ/eOiqb61OPY0N
	lAhSzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m303kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:40:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso167863785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776876010; x=1777480810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BocpQQQnoL1JLtuDV8x1jEBZoyxugL2chYUL6mfG0KE=;
        b=T6IGgJasP24kMudUS+n9ckHJK7ml11/2Y0W789cZZ3pRv73jfkTs3/3R3Ym+IM3n9x
         85UAt2aDQKYIS0HROqYAW2hINybbVo0Ch9O6FYr0Efm1PVbxV+v35CW6mI8KBk6Hmu47
         sNgs9ztNCpo84Afk5gWyVDutlDSnk91zZk1nleoQQvrHint9CREEiC/nCVR/INBi0F/E
         mdRboO3PQu4vWgKpCcXLxezt0eFaRfpUyuInybS/YbqTZqueXtBRKeoQVAAoMJfeM851
         +HwIdtIzGvSj1ntBDYZEvCbRL7fiSu6QADMkNciRwehtgSsY4g7b4/kaJlc9Zyq19mFb
         itpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776876010; x=1777480810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BocpQQQnoL1JLtuDV8x1jEBZoyxugL2chYUL6mfG0KE=;
        b=spYkk/ABucDrGKkf8d2muhzw1h7mF6FCyypvhYGgesXIdP2SUDe+bSMkHo8EJLODuW
         rad+BjxlVT3tfXew9o6+t38tnXw36SFVC4+gN0LX6/8X7HxJS/MpvQUKfxypWW1B25oS
         Mx+0hMHRqvxW9YVzaSGHQtcs2Mc3pgptxGq8RRADk1FcEil5urjdy7frwSzy54lWBpkI
         aVLSHOa039loZ3VIvg3FLslgZ+i79mGR7p103f6KbmqZ/ka+jQy8CEvZ8e+Qf1TET3pc
         qgWXT6eNTVEmFQAA+076YLmQ+eriEl4IpH+hOzf/UPodza+Ob/HYMqz1pojlmmmkGFxq
         4bqg==
X-Forwarded-Encrypted: i=1; AFNElJ+V39/Dp2uJ8mXZiXzuj2HvnYxrqcrbfMzOjq8BVbqU5KwrY1MzV+4ipVykEky4h3y19dgYdISKA4WTUYwT@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4M3BAIjVmx/AHfzHvgH8k1hwX2ohqL/XTDm8ulyZAmtyrO46
	+u8HHhDi8uAO5atsEt+epp32ME7+k+BHM5qaKAT8Atd+buxfKBYnDnB662E8zXD26yOBjJnAivk
	EjBJMoRJ24UKAl5F52lC6j2LQpXKi88EBm4dF/lNUIyWCxlHT3KIHbBX4e5J/a+uiwa1m
X-Gm-Gg: AeBDievmZtsZ5Z4M0dIp+j9KXpGnQLfUdRdHSOpl44x2q6dBfS5bbeZ71kMqbLi9s3p
	dTtZOtY7ObYW8AkUHXrNRgwOwWI4BIUEkYk4I/iJ+Som49F+hoTVlIxvamhlZ8INN5PYH8zIXaN
	sP8CM89yYXZbfFGSdYBoU0thi+I7+UQLlxdWuopEiSXhDOoGcsK/AJat0Xiji9f+Apq6DJeZkTn
	leDS5UV+kdBoPTCK9ia9DH8A76vqdMq8e3QPDD+ko315sSPZTNGvAcH+bpy4V6aDeMaN6n8qYZw
	mexqLhWuq2GPo1lJaBhu2qXE0RMCYcpRkWZjZxrB+RxJ6nID//mkV0O91VFaQKav1EWhi28aBSV
	tyXmuFNbxpIv3P2GmRkG6LHmNfXcIw3cQnNk6yg2M2RTUOc4RF03gcuwBxElxoCM87NdR30cPGN
	Gdy7b+gYRGFo9E8Q==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr234484181cf.0.1776876009805;
        Wed, 22 Apr 2026 09:40:09 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr234483721cf.0.1776876009338;
        Wed, 22 Apr 2026 09:40:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm557433666b.37.2026.04.22.09.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 09:40:08 -0700 (PDT)
Message-ID: <d31f9669-c2b8-4943-ba5a-d38b5230da8d@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add flag for sending all DSC slices
 in one packet
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
 <9vOWCBGQu4kqkzUaF1cAimiRnCHzd7NAjB98ZcmVygN9kNr7G2H-UzhkQfyiDlaj7G6wxWqKlGvAprsMtVE-P2erdkutRN7LuO1GQBOSzH8=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9vOWCBGQu4kqkzUaF1cAimiRnCHzd7NAjB98ZcmVygN9kNr7G2H-UzhkQfyiDlaj7G6wxWqKlGvAprsMtVE-P2erdkutRN7LuO1GQBOSzH8=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -UAyyVpICKojzwcS_9JbUG2JN1P00rW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE2MSBTYWx0ZWRfXy4ElnUz4oplK
 98lfoctA2QqZhVSv+Ss0Qya5BiMImNA2xQwucKbYQkDWxoqgjxJrs3VW1INai6C2IQqDTpQTMIc
 RVjDpH6QVNyvdE/ZklVUIBuv68FJCBpmnr+YdCKT6z6Yz16Qz6yCSh2kHvTy5YZvHkI/dEP7M4o
 88Ck0Mg8EI8ubt3P3sn0TTuQrnI4Focf9Px+R8Xw6sAmndb5Zr7Xm9aFgpdnSKz0YA15MBPqQfw
 uC+vextOMQ0+atWkrpVnFg7xAR7x46tbsLxvwIQrJrD3U0+WAIuO28bysp1e5cdQhhlo021IW8M
 oc8+ZEbr1meb3ClzYq/CzpLr1NF4+rfHaFKo2LD0iSmvpBTbsligu8BWt014MyDWn2pcRLZrpfE
 KJozHQ6iAVWirM6XYyqWOtOSSxNz/FRWKYJUsNaXwdqNntG7KWlWkxosrqeySGuiSjz0+G0z3Gm
 2mW/AjGGvgjk2JRv4+w==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e8f9ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nFR1E6h3X-GUGZrjxzwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -UAyyVpICKojzwcS_9JbUG2JN1P00rW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220161
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52F0B448D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 5:15 PM, Alexander Koskovich wrote:
> On Wednesday, March 18th, 2026 at 5:58 AM, Alexander Koskovich <akoskovich@pm.me> wrote:
> 
>> The MIPI DSI v1.3 spec defines two modes for transporting compressed
>> pixel data: one slice per packet or multiple slice widths in a single
>> packet (Section 8.8.24 Figure 40).
>>
>> Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
>> set to indicate that all DSC slices for a line should be packed into a
>> single packet. When unset should default to 1 slice per packet.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>> ---
>>  include/drm/drm_mipi_dsi.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> index 3aba7b380c8d..d3ad8c5d3ebe 100644
>> --- a/include/drm/drm_mipi_dsi.h
>> +++ b/include/drm/drm_mipi_dsi.h
>> @@ -138,6 +138,8 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>>  #define MIPI_DSI_MODE_LPM		BIT(11)
>>  /* transmit data ending at the same time for all lanes within one hsync */
>>  #define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
>> +/* pack all DSC slices for a line into a single packet */
>> +#define MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT	BIT(13)
>>
>>  enum mipi_dsi_pixel_format {
>>  	MIPI_DSI_FMT_RGB888,
>>
>> --
>> 2.53.0
>>
> 
> If there are no objections, could this be merged?

Certainly not in the merge window - patches will usually be picked up after
-rc1 drops.

Konrad

