Return-Path: <linux-arm-msm+bounces-110336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGEoCFwpGmrQ1wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 02:03:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86960A037
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 02:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8333038C4D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 00:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55B013B58A;
	Sat, 30 May 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPjJSPV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy0bG9mz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F31FC8
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 00:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780099273; cv=none; b=bnFwzyJOdTreUw+ITweJFLnyS6Zlm+r149rYbNw2uFJUbeDQcI+wO2AJBdgNRRzHm5KWIBcUoYsrDal/AOxU5cWKsj+aOW7d5Rb/c+0kOoHt3dKWRU8/yM1zXBssHW3fwytFl6XFTSaXAZk/ycQY0cnZJtwT+1SYhqZY1JI/vXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780099273; c=relaxed/simple;
	bh=UagpOC7gFmND7+vIy3Ut00Mk3Or7YtH3/4V9U4a1Erg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yapy+q3rWRSSZiUVHMvWghrxHg6ACNUCTk1xBHxZxB8CKATNK7CdHV0SH6DF4x2GbNcd2WD7CAoJ03YXMTQ0/kqFTklfYOoNal0F7vAfpqz2K1aUQWCNzMV10KziYfTm9D2H8ZEJ8EOHS2jBgsNc4XkqcunqlznSsP/pnnbXNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPjJSPV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy0bG9mz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TIQWlS876855
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 00:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=; b=SPjJSPV+ZNlrAoQn
	ZHxh7mmtcvDOm1MYocHyO1ZEIhJMunDrcUhCqbHQLdAuI1BDF0Ql+/oIxZZmLhic
	FMywCJ1j1ahva4KoZ/rxXJd9C6M2ukZJnKaGcjwlFY+lmggD1+zjUQEK3OhXBnik
	Vgp86RjtLCvAfK3PMeDe9To2Pd3DVU4F8TpzWHeU1v6zbLRjefpWtPbnu7PZrNLc
	wMOA8NTRrBZ1eYh0tygVzbxKYMzbVKSKu++zKen9u+LT9KSbwllVS6868krliWEj
	GtjURwWxPyZUkGTvu1MFVmLMZSMfK1LE8CERJZbpk0eeMIlgTqk3HlXB9YAQJI7T
	8R/e3g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efg3416sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 00:01:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8613efbso2917448eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780099271; x=1780704071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=Wy0bG9mzXOYCqILthtqhkhKNc1QB6BrGvSUkx4MpHB8fFzVuGdctHIw2GdWXc/R2ma
         OlrY8EhTSZrTOXB5NVQscaNIgSghBapzdEHDSaEhAxt/hmMtz5WOnObZh2nFS87s7eoM
         lbcn3nH+/jusp0Sp9Tq7f5EmNMN1HOZRPhi/BZoopbKK2Er7VJqJUvqPUeNGt/8CtEo4
         I8MwsMRX2rvHx2HFvaorKTA8/6YDwGJJeLsKe93gZXnU/6P3ey+3Yx2WFyO/ewLEuBS+
         4JE8E+IYprm9hy53EZx6uys+ZUd0krBJA1MMcYPed6JOnlluiN/9bJrVAWpS7/OmYdt1
         BIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780099271; x=1780704071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpywO6SkDOjlP3BMRqeWEdeabYg7GdsoNqQc655h+qs=;
        b=raajqRYMuFJi9feIJwhIOr51u9LuTNSpuqe7+Th578tIWqlcL75lwdSTsdqz7wgVYj
         ZeOh10hoS5F7VOo2FOWsyxTbh46ABabOZvDUiEyIEzIzoBjr/2BPYVDIiZ8l5K9W4F1t
         ca2Z0XUPYW2GisQpTYbxLEFZgZGwmhaW+56LOIgP3vGiMeutKVP8/WwW/70iUOi1eD9n
         EFHlxkh9gu68YAn4It1a9T8rRoVEGKoDwLHG55VG+IuHb2swggxrBu5IZeeZtL9YBJyC
         q+3Hkb/kJ/gnmnFPgTCulffWNvRbRPeiL40gW2+F/lZmzu8Q/W3GZqBY7zztc4hWsUk0
         E7og==
X-Forwarded-Encrypted: i=1; AFNElJ9ZlQGibCIlowRt6OHifxEBkAja6uY0w9yohnE3tDiPG7Gl/KtYjWX6Xd93WkcTJvFFZ8cRIgcwt4wQCHrH@vger.kernel.org
X-Gm-Message-State: AOJu0YwmWSDYky9wHZB+X/zmSSUkVoQL4u8BrNWpibZ0Cuv98wkiO3UQ
	F0nj23ys6UySmtMtTGkfk7N6ZowBdeEtezxF9ZK1lsj3FM/XcTRbLJF6nRrFkAo5fgPKtGT6DWA
	yoPli4Hs3pNwXY9yemP1DOTugoPoa3VHY4j7xkgYZtfVaoikUBH5VC132CpXRiPJGkB/Q
X-Gm-Gg: Acq92OEs4qDw+hcwFnzuz/vNIAGG8Qjx5zFj9GnT7RVMJu/+5t2Vsjg7JAfRPYHny7Z
	qF1XbDm37wJ06NvD/8Sg/ZcPu1yYsE5LdUfTrzq68V8AT9BU/tPEciJX/mHNkMgeZgrqAaY4hq0
	lzZFlnuwvBrr5EE2Km5KvfYcddr07GCYZDprvKO2SijNLT/LxefhF/xc5OMKVyoyQTih5HWwf38
	UhLLKDWvIQAmGq23Ik3Q4pdgtqS0B0vJLfhafX8yWF7Qnkne2YSVD3vKZNtiWeRfRVt5N7RdrRo
	OFzY9PVL3R/Ow010mz0d/0kKAimjR5EKFBxzERoNiLPPlbY6gz6RKSBeY1T9Orl9CRSYkRQaSLR
	u3q+n2YU8UfRab8gDrm4Emz7iEo+iLSHEaDwOI5E52kcf44vTWU/s29kY80/VoQVGJYgkbvezHM
	mOl36YpdkduCPTmT7Zg6SXF65j
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962716eec.30.1780099271390;
        Fri, 29 May 2026 17:01:11 -0700 (PDT)
X-Received: by 2002:a05:7300:5729:b0:2ed:e14:e954 with SMTP id 5a478bee46e88-304fa6dccefmr962652eec.30.1780099270745;
        Fri, 29 May 2026 17:01:10 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5d5385sm2693818eec.28.2026.05.29.17.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 17:01:09 -0700 (PDT)
Message-ID: <4bf20c0b-f153-44cc-ab83-cd0251dabaff@oss.qualcomm.com>
Date: Fri, 29 May 2026 17:01:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] bus: mhi: Drop controller runtime PM callback
 indirection
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Loic Poulain
 <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260522-mhi_runtimepm-v2-0-fbebf41a82bb@oss.qualcomm.com>
 <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260522-mhi_runtimepm-v2-2-fbebf41a82bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uQgZPPD7GuA8NBpqzpRIGuka1xwBtvKk
X-Authority-Analysis: v=2.4 cv=EOI2FVZC c=1 sm=1 tr=0 ts=6a1a28c8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q7cftjHEbLmqyJcuSDAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: uQgZPPD7GuA8NBpqzpRIGuka1xwBtvKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDIzOSBTYWx0ZWRfX10RfwDBYYf5H
 rCAbrbSOZvinF0qF72P6SsGUuc9PsdFkXQ22U9oNtS6bfMz/MPka02yKeZPO57JZwBt0T4w7fr2
 NVen/bl9eePdzXKmO7t5fWNolM/x+mXqyOBbXQayP0XlYZtYWXu0NYIsKg8mBVoyNLHihwhMQdy
 PEq77bYePcFUMTZdKi0/IKmAsDQk1599lckMMtlBitIAsZm0ELTM3FurqDNb1sDlf7FoggIChlu
 BgUj2xLGb4UwHxsGIn3MfqMzbzXQmR4xkS8UN7RpXzKmKNbYDqyIXQZsGDJv/WiYMg88VjEU83t
 jWeHBUYCGxpGArGqiGK3t/LEdjcsUtAvRFv19JzfL9y/FmYAtIxZIsmuzBfJqXBlxqRV/MXPLSC
 wqsPyeEJaL2+5icn7Vuz4wIFNaj1pUry8ltwZW2+qJUs7ONji2ABz3VZWTg194P4XKeDPSEYQsu
 WyBGtaYJ17CVBZGEl3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290239
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110336-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F86960A037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/2026 3:00 AM, Krishna Chaitanya Chundru wrote:
> The MHI controller interface exposes runtime_get and runtime_put callbacks
> to abstract runtime PM handling from the MHI core. This indirection is
> unnecessary since the MHI core can directly use the generic pm_runtime_*
> APIs, and the existing implementations are either no-ops or trivial
> wrappers around those same APIs.
> 
> Remove the runtime_get and runtime_put function pointers from struct
> mhi_controller and update all users in the MHI host stack to call the
> standard runtime PM helpers directly.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

>  drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
>  drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


