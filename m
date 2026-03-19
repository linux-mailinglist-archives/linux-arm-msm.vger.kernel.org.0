Return-Path: <linux-arm-msm+bounces-98739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHavMkXpu2kKqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:17:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0472CB0A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 13:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A37053011118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E7D3CEBB6;
	Thu, 19 Mar 2026 12:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqZ9KWr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WnPSeQmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C43CF04C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922354; cv=none; b=dC0TLkzE7C/qd4wRF6vuyCFwjnRDWskK3A7uMwxsZSF44NZxwanizxvSEf43ZysHiQ36XErWvHAzy/iPlS1W0rlL4u9b+AGJyiHoNLayK0EkwKHniFfN83GGD5de/XKeM6ruEu5pjxoNQKYmvK9UjEQ+swNb1pef2tKaDmFG9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922354; c=relaxed/simple;
	bh=ZcFotvK6zFRTFvgHJFEwGyUdb9Rj4jlDYUE5B6Y+Q38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J88uwQXVm9RFOKI2c4A8tfsbzwUFaHxFCu7HKzVqDC1h8Qy1fPY2zVqOQm4zwzDdOcxQSoMhlsbeNjy+Tiv3kdEBgvXALQHbE7zE6UveQSn7sasID4m5T2gRAgRS1ZZFeLGFiR50fSpWf/+HbC2xvq3t+fpy85zhwLKqxs/cpu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqZ9KWr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WnPSeQmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wVU3368475
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	baWfbRXsKflr2jzBiIdSLJdaYlUjsJoV4djDyFz0xvc=; b=oqZ9KWr9O0AtQLX0
	04pGTc/SBzmAFyoxoqu+9KX/pTkGFoubvBplSyHIuEnf1jkpDP93C56F5IQlLjWr
	pZNtB/kRsYFu389J1J0+k/Pd++rm0cCjzJkUaxMSAqDTALbEFWIZZJoVsiJFaRDU
	Ll1yKRCmVsELA1b9CBeKuMmmf/5FkL3i1QzAQONPTvjzI4y99T9Z6vGBIRfDTk7N
	xBUP27Rpj0Sg/HJD6GRoaW89j1AwdPaiLhuq24oA+f+UphIZKiSwl2BRHxMexq8I
	W8AHd20S+Wk0K9UVx67GjFZTRf7bpugB7Lxk/vSE8ct2wlqlpfjPGcuzrWbPuH+v
	7XEwhA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00f9k2nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:12:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffc46c792cso203270137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 05:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773922351; x=1774527151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=baWfbRXsKflr2jzBiIdSLJdaYlUjsJoV4djDyFz0xvc=;
        b=WnPSeQmIfcHNSoHjmhHgraIvgCD54excR2eLTbdNU4SqY5heWBUWJCMRsCIMAGjFor
         uW9GYkmp/xFtpxy7c+tO8Xq2aeXCJdlNyYsPB1FBsO459ufj/StpZE7vsnl9RjHNB1v8
         J6KJEeRQpwr9wq8Osrsv8U0y27dVueegAWpwX6zI01GbeXcwkI9k4mIQ7eHMEjE9NxoY
         gCE1AQF+Z8u7Wg1IvV/um4fmsULNE6gUoIYj5Wij0yz7WoZSXgqxMsXMW7iwYFjFdclg
         b5S2EZhLTZiFbPjfmqgVKUOdMgKOrAqUt7WwnegxkmZTrRJZ+Z7I9CtRkThP0gsILl3t
         SNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922351; x=1774527151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baWfbRXsKflr2jzBiIdSLJdaYlUjsJoV4djDyFz0xvc=;
        b=O4XSBWa/upRQbyOy/Vj1BkcercFVajiTFZyBhjAfCaIuU7zlPJoCdqtWtGC1mxXa0V
         X5LLn2UNy52QVpqQ0GysIWKWtetcZ6OBI6ZoNQfxL2X6aPbMD1vjQOiIy9bHJY5Gt7kK
         WGRRSK+xH6UyHPAu1sWZbU72AKSvm23UCk9HYqNlZKkAT2WOVnuKj+iF9UBamKiKHvg8
         hyNtt6VCy0IuHv5nAJl9O3iHZ+G85On1SfQX1kxwMUNR2OpgxMMKmn/GaUHKVm9yyRaO
         c8l0xx2n6oi60II4AAAPKmo1GY1gSaubPznnoe9MnuncaemgwoIessigFGN2hPqTnQiu
         lWOw==
X-Forwarded-Encrypted: i=1; AJvYcCWQT2MRCHHIVbwtnTvmNm/nHge4YtPsBTAjqPb9fCvGslOoBxu7dZBgZLITTdQq6ztv9CKbhEB9jF7oUmdW@vger.kernel.org
X-Gm-Message-State: AOJu0YzK6kVu72Yr/ToUtn1UEoa7iBmFqZx3EoC8zUa6sj56E+9H3tXl
	xv1/SvbxJtlsTzBbYsEkHg4fKk7dS8sNvo+fFIZHdKHvF7Em4h1O0jOpD2ERsCOrV1k000wGdQf
	2doIxUNLRr291pioFQvlPBkwjnuZO3wgFGIEuM4WwOSxw2BkYVYkGg5dbxqbgl0hId6mB
X-Gm-Gg: ATEYQzwCJ5CNv1gh5DKcZ6hkQZ7vspPviVybBO8x1KAK1/qGCe2WDXe9Dp0l34j9B/0
	1CoUWMKn9NinE8+G3due0G8Is33+ZyaGwYk+7nVjv5/C6MimuXonkOY1RO4+Sea+e0VMVc7Zruo
	EnOZm67VdTrYXimQJ5Nadsis90z1oxlHY4atlmYE9YGen/LVPuIYMW3tLtfMmC/H0+BdQVLPuzt
	lq6KHoaS3kKq8o08uhHPNcN+M6FUdYYBhrCet4DFreMm1PYvAEwUgkJaQ3h8mgDDfxj8T6CwNhf
	YjOVeKz3CwZiQi4Pg7skJcRuEYo5ExZtvIdgW+RxpzvKhp6Rn7a1ONe2DFdt9OegPzjdeXKPwgy
	qPd5dhh7sCG/i4zHE2SdQ4Cr/BFG2m8EqQ2WItOa19Fp0EnZyqhsFs2AQNhghXEizMmKJQMUKZS
	AbKE0=
X-Received: by 2002:a05:6102:1682:b0:602:8894:b76d with SMTP id ada2fe7eead31-6028894c2e9mr809600137.4.1773922350442;
        Thu, 19 Mar 2026 05:12:30 -0700 (PDT)
X-Received: by 2002:a05:6102:1682:b0:602:8894:b76d with SMTP id ada2fe7eead31-6028894c2e9mr809583137.4.1773922349980;
        Thu, 19 Mar 2026 05:12:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17036a0sm432633866b.49.2026.03.19.05.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:12:29 -0700 (PDT)
Message-ID: <9e8e366c-c48e-46b3-8d72-cbcca1c48008@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/msm/dsi: Add support for RGB101010 pixel
 format
To: Alexander Koskovich <akoskovich@pm.me>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-dsi-rgb101010-support-v3-3-85b99df2d090@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NyBTYWx0ZWRfX14Vz7ODeFpAm
 OT4TWb0esiNR4h6SaRxrninx+W6uMZk5Kg+PSkXs98A5wMX6m4XWnyLNlppObIZ0U3LMxGCw1ju
 GqfeLOhsiOgYib8YCcjn5gvPexNDOFHB98Y7uyhoiQ3FNEc21PFF9R4I8NeKyASH8aK1ca9ga9t
 pZUgqq38bJkaBf+Az7Aobq0rfyyBSRbdarzCiME+oF5G4rZueNAMPeSTDlZWxn7GUeD2PU/Q4LZ
 4SLYgZGrhqZHUuNzj+eQpvs2iVwd2j2cqaZNfnqlwQfhjO7WQg9a+TR6ORRUmL3tHc6oNwSQvTQ
 bSSwICZS9q+ER1T6XH30XhM5PM6/Yvgt7wdAOYEpTnretPkAdTFcjEZZ9ohTkCcN1TQ08MIQE8K
 s0kwXE+D/p25ilO/DZpVU87l8vADcz1/oODlcSsdUAwy2pRCIP7cNqe71RsTWrrenIROXv4KEPa
 51SO/qHfTNJ5fti3JIw==
X-Proofpoint-GUID: bWwkUoEtXTECOPzvxDIrUW7e8KxbudHh
X-Proofpoint-ORIG-GUID: bWwkUoEtXTECOPzvxDIrUW7e8KxbudHh
X-Authority-Analysis: v=2.4 cv=MJttWcZl c=1 sm=1 tr=0 ts=69bbe82f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dHkJIz5KlUVh9OC2PNkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98739-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D0472CB0A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 12:57 PM, Alexander Koskovich wrote:
> Add video and command mode destination format mappings for RGB101010,
> and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
> the new format value.
> 
> Make sure this is guarded behind MSM_DSI_6G_VER >= V2.1.0 as anything
> older does not support this.
> 
> Required for 10 bit panels such as the BOE BF068MWM-TD0.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

