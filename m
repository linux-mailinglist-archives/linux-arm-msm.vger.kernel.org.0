Return-Path: <linux-arm-msm+bounces-94087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IXzEMLenml9XgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:36:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1878196974
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64552304033C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242F2362156;
	Wed, 25 Feb 2026 11:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orQZRn+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5ucqyx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A33E3624A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772019180; cv=none; b=HjEaIfCrSC8uEBB/LxYwb9DgZ9TYZ77drZ8U43MukYO6XdDEcvOciuarepMAeAIHDEH8ZRX0/PO1aJLyG9sptjReKacePu10YgAo5FP6iqh0VflOqgs6NmjMFrmtDg0o6ai3tpLQuOBx48xt5RNbE7LpRRMnv7pD6iNbTZwLHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772019180; c=relaxed/simple;
	bh=MrzYgklSxc2LcuGgrrLs1xzkDjl3QZRjC8M+rs5lUu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRqWhcSqazmkGy/PwFyp7AfxtYScl7TzMoI22NUeWBcAgKxPck2hANq/onSRQYs1ZKGGo3RGP9aramMUeeqGt+RuNq7ntBe4dwkyxiOEE+tbAoUccaOVqYrPHK9O9G5c/cXtyovw5SPAPL0ZacR5JVGMrf5N69CiACWJGIXmB+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orQZRn+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5ucqyx+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SqDj229725
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=; b=orQZRn+M47pKGt7H
	9x7/xb77psfK+0qyoRrFHjWKTrNNc5uARyxnWkOC3tzAGQIrzGVwptTdZexmo/Hr
	regQRM0vFIO6/gi064Su2+7ku+mBwb1EwgcgBw16+7nZkt5Bl/bYjCnSXiUSEXm5
	76nDNku++x176wF06VwV3iYuiPYTGfPBVnJ/YoC+1WFXVMp///eQKeZ3GthB5HzD
	g3T4ueSAT+n56RMzag0RWFINKTjb+wkenpVhvdDWrgp6tv6NJjjmlNrYnCsqdMAS
	ybuxOb4ItBvZN5lM7ogRs0Cibyr5AlFERlWAzo+4w7MXZ4l+8VzRxih4rCs4UZBq
	Iq35og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37u2nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:32:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70c91c8b0so591932185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 03:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772019174; x=1772623974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=;
        b=H5ucqyx+49bcnpO+FBoWyHGTuvlEsAe/b9Ztx5gKlygaJVaX4BvteOf7xazIDw2IL5
         NsHLtnRV7oKfv7BB9FR2PXtXVzR2Z6Z7D7WoIM1pmi3WMEOZLJzvE56RVoZu7fR+Uwyx
         lunlRj4bI4rvbC4AfG7f3WYhIpPp8ty7y7XnTb9QAQmwKmgU7tSnARqaIbkqR1oGmEP/
         W3V7U4EeSXEYmyGgr3qX51c8qNzak/+Sj9XDaESuaxU9RjzrZg/MEaQDPxxpv8RR9u4l
         S84MNhF64Rbu0sdTDYstbkOCQMS4tdURm0hEWFKovuoXkuWJIITeeCSyZwNC8B2Z1T1f
         DpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019174; x=1772623974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UwhFgmW+9RAf0H62dLr8IYTJ0+P3nnry065u5Hn37Q=;
        b=QjZKdgjic5V2zhLU0LkBGC2+BFKXhHDu8UR+q8QbZIQ+OE9e+i/EdCmFoZqwARctLL
         eiwKgG6kf9StpMF/amDBQ1l/0PiZGKpqnoS5zDHrY86OyVNAeWdGeTKajMOgHWXQswAe
         +z85uOoWnzMLcUUIbYlG8UxZf570lqSyW4wR4O5dSqyp0s1WiUx0xueVddlucLG8Mm3m
         AGWMrlIEX7OMbvxbYgDtEa8OdPftiEskxJGCKEmEkk1jtIBfMyJsI/UhMTHiBiVa94sm
         Cd486h/c+JmaH32Q8C+zgXha2bgQj0+2QCKDbwHu61FXwBLR5gZI2uoVcTwuIltJ+Gpe
         sAKQ==
X-Gm-Message-State: AOJu0YwSB68Aoa2R157RMgv6ZlGL7v/1Tdx0iPBZiIyrsP+DZjF0LyE5
	wuE153W9OkCFB3hUGlnF81nTLi/Oiw8Tka0iqBelHk0SpbXmwDKLKkfjGSHq5kOVhJ6Ha6t0P6P
	pyqtVuiaInN/wAIOFqdZcEb+uIDert8ZUmCSiKlSvhqRZMadxCQDzPRUK+rCYj7b4lesQ
X-Gm-Gg: ATEYQzx2gSbd9P1ETe5sbt5lpuV/N7c2be7yEB5JzCp4XR0ZOLNLnUyV18+SWVKULus
	Jf5Dp/cpabiMl0UK+4FBsceqPcbWeqRogEhFIcMCG/b8bCkAi5SvsF9LUn4NkIYIiWvi3vZvb0q
	yMK88b3/upJ5BNqljOPPFQC8Zy0wF1Dljo2hKAy7EpCKG3bzrjpTyvybptbujlcRG6vMn/NvlAR
	FDCoz1w+3H2zt4Jn50tTVvan+utXbPONUig30666u5+/9OKoJOuy5eB53cciWPEqjnMYOxLQ3Kc
	MgqcU3JID9cv8owAJjFRlcoc861tEJwEGQ/p2ESz119scAuDVV3kHlyp9QMSqq8HCyI+QomO3oR
	7qWSg6kDg3BT5abBHwxsKeb+gCL/GwztrnxZEFJ406ZOJuXcQLjb4ukoiGJcRmN60zaVCTTCuFX
	8ECe4=
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb8c9f491fmr1434474185a.1.1772019173965;
        Wed, 25 Feb 2026 03:32:53 -0800 (PST)
X-Received: by 2002:a05:620a:4011:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb8c9f491fmr1434471185a.1.1772019173484;
        Wed, 25 Feb 2026 03:32:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084c60b91sm513928066b.14.2026.02.25.03.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:32:52 -0800 (PST)
Message-ID: <aab51596-465e-4af2-9a12-48b64160f77b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:32:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix the bogus protect error on X2-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699edde6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mSm37ElbHMQ3LlSfNvEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExMiBTYWx0ZWRfX3RZJCHIvIQDI
 EHeYnXWE6KVd1rBtalcz02o8FzAJ62XgTgF0pl8e5l8z4MZbRNIj0+Hf7XzLliiDOdY7QvmpVNM
 6tnOfdzUlpdrYa3MmLsOhQoB6ffQEg+O0e3dGTeCi4MlNe3A/8wzcz6g3gQzH3H3TxKk+5k8w48
 V+rTh5WyVaqYMjmjWuZOKktTpAkPiitORt0SiCbQ7oxiD0cye+lJop9AFTHCKDR1I3393bMuseq
 Y+lo3ocYFlWngwzcUk/7tcazbcIGVkVuArsRmLEXE1I9VEWI/vGr2qh5hOsUU/HYu2v62GYOMGk
 Td6tPNgdo5IXi5ggkcUUdmWQexO4pRZpqv7rdDdxF1GrDcp4Am1GxPqp0N6Tgz+mdx+X/ipG3iY
 +qUqp/DzY7D9gaQUsC/Wl9gbo1SRoTj9K6WYHZ/MQLtzCHR4V6cnoWh44A6W0tO6QMFqWR4ta0O
 L50fZilSsDA/vvxYvkw==
X-Proofpoint-ORIG-GUID: WOSTQntryv4JjqCtUfBWBZAUtKG16ahf
X-Proofpoint-GUID: WOSTQntryv4JjqCtUfBWBZAUtKG16ahf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1878196974
X-Rspamd-Action: no action

On 2/25/26 8:41 AM, Akhil P Oommen wrote:
> Update the X2-85 gpu's register protect count configuration with the
> correct count_max value to avoid blocking the entire MMIO region from the
> UMD.
> 
> Protect configurations are a bit complicated on A8xx. There are 2 set of
> protect registers with different counts: Global and Pipe-specific. The
> last-span-unbound feature is available only on the Pipe-specific protect
> registers. Due to this, we cannot use the BUILD_BUG sanity check for A8x
> protect configurations, so remove the A840 entry from there.
> 
> Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

