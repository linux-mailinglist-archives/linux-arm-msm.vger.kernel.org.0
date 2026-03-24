Return-Path: <linux-arm-msm+bounces-99605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OtxDnlmwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:24:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5FF306677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 209CB303FAD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C870F3DD51E;
	Tue, 24 Mar 2026 10:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeQqaI2y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEhCbgdR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E533AB28F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347233; cv=none; b=BYQRMN6H8v1aU8AayTxVwgikw2hLsNmp2+Abf0npDKaDqkiX7bwKtbAiERUpGd0ALH/7dyazQrweKcOoQujFbFE1uq+HSj5o0T8/TkBttUV4sLxxan0s6sb2v847y1e1gcnkB6PfDWLJNmGefJA6+VYJ+BjXhvA+WFjGLcjzYeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347233; c=relaxed/simple;
	bh=oZQF5zkmi/jYghxQhGl6dRp9MvI1QQwb/XVLSRsXzoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJYVGPnc9LsvEmnK0DMqhUTJ5CDmT4nWh4RbcWPWV6Cls8ptlkrv4DS7xXLK9yP40Y7XeqMSxx77wJAmyazk4EubbwhkDOZLGu/yGvTEs0iwonw/0qnAoyXYGMKEsBOL+rCuNzSGKNg/LFDehSilZExg2kMnyPYCYYJL3gJS2JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeQqaI2y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEhCbgdR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9j4O63904064
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pF5Yvft9OWQEMcww/FMusyd7xCYp7Y1/Nvsmv+Coe/0=; b=UeQqaI2y1Zd337qL
	QuVcHXzz9P0SMm00hLDKPksIxo9rRO+1lBcb1dyX90oaJlQaR5gLciok6t4kSP3M
	bK+ZOMCCG6Bv77b/Lp/ob/H2t4hVXVXcAHQnLyyHInOj4GmeeiyfqbsBnE8q+nZs
	UvrJypLjy4/xK3LghAqbQs6tdhEz6mrVuCe/TruaOpnWEsh/CVmLLPej1UOtgReD
	YI2mozRSFxRPGFE3X+2+U27gIV1Ss5hZPIDeoyU3cHAMJcTIXefg0NlSVpJa4CId
	eaSDz9d741EuyiqV8g05AkgCJMTEqlxilpWlhLia7zSh+egHFnj+WI95vQzVVn9c
	G21qSw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0hcfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:13:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a01982dc5so49911406d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774347229; x=1774952029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pF5Yvft9OWQEMcww/FMusyd7xCYp7Y1/Nvsmv+Coe/0=;
        b=OEhCbgdRgX8GgtBLmUHmIuPBsNG/RXntF4SDOsqmZJ9+TUyWuo6nnynIuAZLatQNHW
         nm9lt4N2ZlTF7zL+AAHR9H5CIroIozEqwVcL65XKDito59TQUqaMO5QpB6lY6RzCekor
         8VFaLBSBvsJUzlBpdzGTboF5sHAq1K/QvS9Asz4+ZP7KrMU7Nj052hknrOyvro92b4TG
         OF5E8bROl14Ik43VoMYVoYrWjoZwjn4P6T1njpE5BwwBH3UCaTQu1B8CDqeeJlLTDT2N
         oY2hRFvAyTGvUIsOPfXH9d1ZnPSSZZbQWGHub3WoWgkfmJXblfLJrFO5R9VNX6rdk+fJ
         TT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347229; x=1774952029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pF5Yvft9OWQEMcww/FMusyd7xCYp7Y1/Nvsmv+Coe/0=;
        b=jSUayjH14gu+zj8AeEAJH2UzMcyYQvXRz4dbcpVzoR5Q4ac6SgI9QcokxW/mSYEa1O
         vZJqTx4SL6pBKh19mor3UK8CE133bfrTdkiHNL2ZG/Z4vkIsk75NgnDvkL8YbaVDyQfe
         E2JteNTl8nlxvjZTBKJy/cCxFIea7Nxptt+N9GMW+ySDyDxx+z661zGVOkEY2qz6npts
         RSgztyMCjFvcl5jfF6xIrvi/h2kn/tp7NPIQTv6LfhDYRpeUZRFwjJ3VpGXAaP+/QOrT
         NQfN2AleZC827ejQJeo8ALK5Aixh9+IZ0XTs6qAmu5VWN78UIrvHXfJFZOsJNZZPsNii
         KoyQ==
X-Gm-Message-State: AOJu0YzmwMliO6wo4WTsvdpnyrlJYgcolFW+Hgaa5SVPttH7LhBEg1FU
	JOPTCsStIciT0oQUGA1rh+7jZb/dS2ker0HVE5DA3T1qzaxPvDOdih3kpcLcqi22PROMNkHbvhL
	HYEZ3BrkoZqcH1c/p1YPA6RKxzEqK9YEkBYSPKjPVHYvSAE+N1GHqUjyqmF7HvIfJB0Bm
X-Gm-Gg: ATEYQzz5kk6WukqKwwQ7kWxiRxBk5MeB5eiSv8qXVkKVxwSgoMM23e16rffZfRcnok6
	lIpNGkRfe6qw2/PN3G5l9nEjyrwKcCtt2zrwju2krTU5sv1p7rSgqXybW8CEG0wossd8SmIoaKI
	GS2dJWkfQH11XARwWdf7bOQQSZqRgK2KMUFfyxd1UGZXosGVv7vBOAtZpXHZlcXBB+3tRnlunWB
	gpcOSXWu2qdAF/BZgWB14tndqoQCxGd+Sq8mu9/szg8Z0K6+H3e5Z35ROtr2FEp0zC+SOZ2KEUv
	WiYGbJ1OVOEmbbvhg0lZbEkFqCYnqMDLGtgRPa3vMjo9T3qk6dYY6uUc83S9y1rELBSx+sCtCOr
	1KkgK8RC30hliFN2BCxyJHXvTdjqmkT8t//HMetIx5GdFbnFW/YDYWm1TxQMj9lRizKhPTgESuF
	/mfog=
X-Received: by 2002:a05:6214:62d:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89c859d79f3mr191654266d6.1.1774347228574;
        Tue, 24 Mar 2026 03:13:48 -0700 (PDT)
X-Received: by 2002:a05:6214:62d:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89c859d79f3mr191654006d6.1.1774347228179;
        Tue, 24 Mar 2026 03:13:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387084asm619569266b.53.2026.03.24.03.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:13:46 -0700 (PDT)
Message-ID: <54b03221-d21b-4582-b0b9-d2384480356b@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:13:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] drm/msm/a8xx: Implement IFPC support for A840
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-13-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-13-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SdkPZDh70NijnvL7p0x8bgGRn9l1VuxA
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c263dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4f25mLXvg3xlTH-B0vkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: SdkPZDh70NijnvL7p0x8bgGRn9l1VuxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4MSBTYWx0ZWRfXwWWQoA35cdzh
 8Qa27aayXdOnuk12w2FsOA8gk+jQ+j3OKgnNpG4lY6JqBmtNTVUonU45g+8v5BuOAe/iFsEkrgx
 eRAQlp1ZnAOLs6B2fQJLzKtJ9D6RfNtODEjGZPVFXLv9LrL+exk73C7bIznoAJEfLaX8mb+8iWq
 a/bbY9rGdP3O1kpPBXYcc1e08d/0/Ki+pPqbY1NMyqGG9WWPTZXs+ApV3bs30ta9TZ1O+5+CI6p
 4mGVDuD+vcAzKJS7tBYHb+AkqK5nTVydfMSnzCAJxG9Io7dziB3cXv6W04KWsrTdueYr1fmkiq5
 nNymg87w3md2BvN87N3z8TJjuT7TrKlvcMSW3f4o45zji+k82cH2u5nn+iWyc5QiTeQrllqAG6U
 BpVLXMmWREItd0QGvE0vKDobU7+uucQ0oJHuCVw28o9nW3OhsdeY9ANU8+wN66Q/me2RLGChcsO
 al6NjYv5cT9lcG7hRnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99605-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B5FF306677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> Implement pwrup reglist support and add the necessary register
> configurations to enable IFPC support on A840
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_DDE_BV; pipe_id++) {
> +		for (i = 0; i < dyn_pwrup_reglist->count; i++) {
> +			if ((dyn_pwrup_reglist->regs[i].pipe & BIT(pipe_id)) == 0)

that's a nitty pet peeve, but I'd check for if (!(...)) instead

[...]

> +				continue;
> +			*dest++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe_id);
> +			*dest++ = dyn_pwrup_reglist->regs[i].offset;
> +			*dest++ = a8xx_read_pipe_slice(gpu,
> +						       pipe_id,
> +						       a8xx_get_first_slice(a6xx_gpu),

Only the first slice?

[...]

> +	/* Lo address */
> +	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
> +	/* Hi address */
> +	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
> +
> +	/* Enable dyn pwrup list with triplets (offset, value, pipe) */
> +	OUT_RING(ring, BIT(31));

I believe you need to patch OUT_PKT7() with the updated cmd count

Konrad

