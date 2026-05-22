Return-Path: <linux-arm-msm+bounces-109210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gExnJjUiEGqjTwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:30:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B35B133D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 15582300C001
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B933A5437;
	Fri, 22 May 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AkfFc1Jf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TamwePaC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4B33C1B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442120; cv=none; b=F0v2BbjxA9UcM2J2gVhpC4Nqo0Ik6I2/oGJBYyTsg7S0DLfUFxDmJJI45dr4a3ouuGscutjYIXjhkftdg2BGEYkSfT2Uwy/TF81W9J22TzuITESYqFmoJ1jAG+NbbbGozfLvDxFNWL4KdLz1EWJTw2I/vhWUXrWA0itR460IAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442120; c=relaxed/simple;
	bh=lBQ7uT2pXaAgBr5WCjJ/6qyoPhAHcYzj9z3qb+CUDjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cp7zno1esu33Kqoj4GSokqjUNzg+C8GHPQqPUrefRjKeqozp1tLMuzob0nLo6psovtQI+wxUr2pXOzJeGbIEGcDZ5uRl5Vu80H/glrnI0VOeRQnXteA86A0vkp7D1bHwFUWGcaP/AonwEBKSS5N7dgUazvEm7QH/j1T9/8/sa60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkfFc1Jf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TamwePaC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M93saC1816063
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOpwbG5ilD10AxWa1l2Er2Zhjy5C62KFsf52M3F+W+k=; b=AkfFc1JfvYP6u2v3
	tbUl0pXRgriopNhoiwzsobwEmYwhxhGK71VR85z6bGkdH+fF6ebh7CdvtALjdNfr
	nYYX5Z79ByFJ0VqUdRFsIBJ/6Yd7ySS/r/cxcnY9JhwyoCAOOWfM4a1FyQH5g7hy
	c3UnIu5qm6sFFh2v2YwsdX76jWkcJF/Zm+6gsObmuzODZHNF1VsnxjoDJcrgPXC4
	B+PKlmfyXzWR6O0Umn0vTjTW+Q2/aTI/Y0wLGmlwvc5mN1NWJCkmG5NGsFSESaLN
	IlOMRsGMPr7lvdqi21bV8hZAiB2I4sXD7ZuIHb9lBKPr75fgelwGdMO+JEfJ6hQI
	L3sQmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm1aep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:28:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90fef17f6f5so183643885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442117; x=1780046917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOpwbG5ilD10AxWa1l2Er2Zhjy5C62KFsf52M3F+W+k=;
        b=TamwePaCIGRnJqRU6ZMpdDLvSC8y6rCYNWpr8xikXFeIzO5Wvf6jsuf5tskI5kksJH
         RCxXHCtgpXRPF9F37GXr7bo1QpiQRXdDdlAMlHdRZujrNu5+J3ueF47Bqu5cJGzTJEWn
         dFOxQzKdLqHpf0KIWWds3Jj5d8HZqqtPEngwbBoEinDZ5omFbe5zFhbhGxvHr7Pei6lZ
         HuuB4q+2SaNkMiMI3xwnKcABacZ0rz9c/p/T82msmqzBs2HAhfxoDGIH1ox/+4dRyr3P
         3macfEOwPrgXq9D8LnCVGsUqiwzFQLfDvZMuy2KnscI51b85f5Gdo8zMiibGzB3Cjimd
         ZK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442117; x=1780046917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOpwbG5ilD10AxWa1l2Er2Zhjy5C62KFsf52M3F+W+k=;
        b=aGezOJ386gbEMiyUGuUh8bfwxP+KE5CfDdbJD+dx4TSNnn9NrPuqAOq7uuHZkq+lbf
         /YGX43Hx/E1rwASG60aqbv0MydPTwRZgqpzu/oBe09xAK7rZng49Aqe5EukY0isBs6Oc
         K7t0Oogfx0yLjFl49oFb+kgxT1IAbLXDnaoWmmQ4Cb2F2HiqRzOKzxOw1kxJoUUAF/KF
         mrkQM7BcIMkszszBUnY4zH45IIXx+QV93PfQsa4shx4dO01j7ZOwfiUEZrvgLddxh2Nv
         Z8lDPYoVWdAi1lhj67Vbyzq3v/R6MGSeYbGZoKjMr5AbX6UaLIWheAQq0Nn97gQEBMcx
         XlOw==
X-Forwarded-Encrypted: i=1; AFNElJ9WEUtttsDjWpQBWHcBaNw3dsecTct9VNKTd3AleLAa3avIijoq3MpHGJGJncnyrfj95Ugg+ocGikTCNpd9@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0WFOInTBdiBFf1O9OP0LCS+0Aa4QWwM9qxMBSd5xZ8r57Psh
	CmLA2EQLAxiUi7lhWIVoUGoLJGmCOnlfSM/yYICSll1EDBv5TzQsnan3KAT/StlY7uzkzN40Qgz
	xR23PuU+qFqx4iD3vG8GNvfs6P9GJ72aMWRqQgQhJekW2f8Fj5q3YkaDwr1eeB1kwO2Rx
X-Gm-Gg: Acq92OH0dCy7iddIQnpK3KdugcFFibeBfQamJ38c4zf3TCgzuCfzVBGNlyElBXJ3hLk
	Q++RoY77/69zMKJ1a0bC4hgEEPXFGiIudyPT260yAWisny5KwYoIe5oT5KXJ/cTHBCAphdgc+FY
	F09dbmgNMtUV8Zw9KnODVFJBR7eolV8C1V2pYYfyVJiPKS8MOiHbWff+04hbhha/T5N7ytapcMg
	TMLswYSxXBIoMsbv2lCELEjbSRCEq68swbCwXG4j2r4KYvClq8xpUarMzpqu0LnqIeJyUhkYVal
	BVFHsY++adrah+8EtEyXIyWZgACaW1SVuMkOTygVdvQiwVEfMyjy+UkdhEsMYRL3yOkDyuUQ9ip
	0YiYN6NULXjoXF4wF7qbZ6LIV8GaG7BE2xdH4J9vTC2g/4g==
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr292562985a.4.1779442117051;
        Fri, 22 May 2026 02:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:8ee:a1d:bac6 with SMTP id af79cd13be357-914b49e9d14mr292561285a.4.1779442116624;
        Fri, 22 May 2026 02:28:36 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f50364sm473973a12.8.2026.05.22.02.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:28:34 -0700 (PDT)
Message-ID: <7e435e8c-ba0e-453a-b95c-450446dfc0ff@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:28:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for RA620
 bridge
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-4-graham.oconnor@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522060645.4399-4-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L3l_r9VNXIpAweQoXYBhc5v9trO93kU_
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a1021c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=wrdFt3MdCHdAHujQ4X4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX7PU0BeyU8Ast
 Daq57kRTQ7lS6LfaWKrWlzcoHeiIAmaGjYUdYJlb1aF+9kGcailEpnqfMG5Xs4f7XhKLQoBoQvC
 6MEBDxDATSOHI3OyJxIQEcStCGEYgyngclNiNBvW4gaOJdgpIUlU9TF6XFZ51p4lg1Lp8feF5Zu
 X8SWU0+GCIxwNbrT23GrCQRXOoYOSLvITvbvWcYpeFgaMQZoLU2zLIOQIWuDO9pe5sSv2NAupBy
 3IzHcmT1bOunUXIC10iLCm03oztP6jZLwP9Yy1xQdDjDs5/mpr+LZCMDG99p0noAeW0aXF3YpDX
 SzQE+ooXv6Z3WECP6RkrP8zUEeh7NiyWc0PTSLW+OcedV9KUiHh6pXJYC0/XeyXDaSgBLBpUR4q
 l3n4gtExkcMlTLXJxWwrzElUFgo26y9cW293F+iaX2axdRWlp6UhQSTYJNYYG2lfUkDd84edtfQ
 y1JVXBgw2lAdZdHYGqw==
X-Proofpoint-GUID: L3l_r9VNXIpAweQoXYBhc5v9trO93kU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220093
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109210-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 383B35B133D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 8:06 AM, Graham O'Connor wrote:
> The RA620 DP-to-HDMI bridge used on the Radxa Dragon Q6A does not
> acknowledge DP link training at voltage swing level 3. The bridge
> requests maximum voltage swing but never completes link training
> when the driver attempts level 3, causing HDMI output to fail.
> 
> Cap DP_TRAIN_LEVEL_MAX at 2 to match the behaviour of the vendor
> kernel, where link training completes successfully at level 2.
> This allows the RA620 bridge to establish a stable HDMI connection.
> 
> Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> index 76125e9c0..ff0d8e99d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -24,7 +24,7 @@ struct msm_dp_link_info {
>  	unsigned long capabilities;
>  };
>  
> -#define DP_TRAIN_LEVEL_MAX	3
> +#define DP_TRAIN_LEVEL_MAX	2

You're limiting this value for *all* devices featuring a Qualcomm
SoC with a DP controller. Instead, if this is really an issue that
results from the bridge's capabilities (which could potentially only
be a symptom, not the cause), this should be somehow limited to the
specific bridge itself

Konrad

