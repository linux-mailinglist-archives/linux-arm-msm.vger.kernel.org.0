Return-Path: <linux-arm-msm+bounces-99368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FzAFG2IwWn+TgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:37:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433F2FB638
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 19:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A076030EF000
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9643C942E;
	Mon, 23 Mar 2026 17:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaNL/OeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eLfW1Zjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A423C5DB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288541; cv=none; b=sp1XKClmJ0Ata0X6eqGKRD9avqRxbv7G3ki8VRRjUGWyEkYX8YHCgLS2tAsHTHhaseZ6qAdim81TaJDHyGwY1GW/fMb1/Wy2X/gbdtwR/18xotjOfznY1sPNE6AmXy8fq4m7m7WYZW/T0DaReIdePkcJtSOJm77d9o5gh3C9YLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288541; c=relaxed/simple;
	bh=J0OvGpC1raK6cri4IDVjajFKeyPNGWrCZpb1ISzOVsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHlqPtxw6zNt9stjbtsWlI+kjeaLlImAu3aZhMyBHR3vSg+yTZqzzDx048qNwMcwX8AvCbPyMXNuzbfth/FMFK/gyoNZFB4R98DE0bPMN+T44mYMR8G+g5R86XR9LKwvmzGBFw/+wECg2+DM1O1ypLUwU/iRxLCxqK7b1RnxZbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaNL/OeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eLfW1Zjc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqa8v1817600
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+/K3Ay6UwXU3b+2kgmj7HuQL43oNjZ4mR3zsbDc9Bw=; b=BaNL/OeMncP2SQ1j
	4oEPmOmV4KFJKU0uNZ8aUBhFwpE91EvqRjUhbDdz1JgX14DD03JrGpjKwZpjpBn8
	o33OCigheY9EzQLs/BzKwiyi5C2JyfRWSaZwwtaOWeX3pKtS1Qku64cobByn3+9b
	YwcPODlCjZbX3U2aPbo/dZNZoFnR0ihu54CTnL4Io8aKnvA8jbCcPUQvXd6v3spa
	mBqwWpAHCIS4evLnyXr4wj7RwBXkeYn6qisC3sHDX8JTgIksQbONQL7cVrc7Lmtf
	nFKSPMQYfzQk2foGVl78KlG9q0S4HtsB4kvlr2tx1nQhGytyI0zjeyIP67OVwdhm
	DFpxTw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8mfey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:55:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso2425316b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774288538; x=1774893338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+/K3Ay6UwXU3b+2kgmj7HuQL43oNjZ4mR3zsbDc9Bw=;
        b=eLfW1Zjcu1GuQaaz/ygP88OMVGqVx5/8jvGKKNd/z4ewBzg0lu62EyYVq4aT/i/LxC
         wIjcucAtolujktn0bCnW7pHR+z59Os+lO2NKlVP7vznjDoB9g6skdNWPIPz2fovOvm03
         cLwO/Ip7Kne2WLne/cuYwnlTCfb8VgQkqNch4mHWwePo17xfwVR8X/eYPK7fPgmC+mrb
         9AkCb0S2Suk1H5S59rPQJPyuvY3euEVSmVjEZH3YJac6cF37QpeVb9AYEuEa1KEC7AFp
         B3RwViH1z78McEwAqx+EsBWsd2FwlQJsQcfLxWDJ/x9gaXo9nuij1wdFzsiOIftIoGO5
         WDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288538; x=1774893338;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+/K3Ay6UwXU3b+2kgmj7HuQL43oNjZ4mR3zsbDc9Bw=;
        b=EVgoBE7oi5NIZ0IzBEQtCcQ+dKnYQ+G+tjUKvoZGjWN2+vcI0X6I94ImcAuRCYFuuu
         Oju55hjupY1yatl4Da4oYU+kI6p91ZttZePnZ4Wf+4brZcQCA7YagBk8Jf08T0iwkAX5
         D8ibyu1VcmS2u01NfrUifDk5jocnpyYNJCqxwr1SVtmUEvgMWPFhqQzi78kqMeKyl9bf
         XZGC8L8SCkOUpNoLnUFAqRtRvDJOTnbWWAe8kmQdWAZ6lhsp5MXbn/pymJ1FwJ3hNpOG
         S4bWCawIyhtiCtmQ7mv3bGBbHkr4XLeEWzQJcnG4W9kG1jHR+dIuODCzfHl4AkWVfASk
         h40g==
X-Gm-Message-State: AOJu0YxbEkQeCHqtpzhQKbgt6pKgZRgIh7J9CRvGhBnWVcJn3z/NGZ2G
	XmRKoIr5s/GXcp9Dl4X0fCoKK+XZGp/byqvbGRwIcKGZKPnmi6UuEn3w59WfJ/QkTyn2ax4k/zu
	VpoXqdNw3mH0Estcezar82UoEamD1P87XAGa3/NPKZmhwVxJYNgsX8mmDA3jZeCcACZq7
X-Gm-Gg: ATEYQzw8RFlngQ3zUpBp0E2EuMQY6wGHPYLvPQOwwCInJ2sfKUeDYQEBUonaKNJuIpd
	2+b9zJRc7viEBYCQ3GKHFODiQRH4PID3I9SgDhlUT6aqNPxJKyWcCMfMOe0hlqKwuV3+dwX4f0+
	EmO/JP1Ik8lgeMUQ524GD7DFK5mACrzW+8TJmMmmRll4tHc4Z+bN0E0UemxH4MkjiSFBTF9M13r
	dOKYAtCRpobRjFhVWey53VitDYPx3OourvOTalhR8/MU3n/37soiSSNEgJYsaq4pP1p+oo2KOJn
	UreqTRvGu5MZ8LEz4C8gnrftkJMmkMmPbmoVI9pPoUE42B9CTZX0leDXJugqD4/2nlV2imVzUCk
	RXuZhVhdF9TcNiM3rNT2JKFlkhFbJ+WtU8ya30EIFnwWJ38k=
X-Received: by 2002:a05:6a00:21d5:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82a8c233026mr10579451b3a.1.1774288537895;
        Mon, 23 Mar 2026 10:55:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d5:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82a8c233026mr10579426b3a.1.1774288537393;
        Mon, 23 Mar 2026 10:55:37 -0700 (PDT)
Received: from [192.168.1.12] ([106.222.230.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm11959100b3a.61.2026.03.23.10.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:55:37 -0700 (PDT)
Message-ID: <1862c582-0e7c-431b-a5da-684af2febc95@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 23:25:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Add missing aperture_lock init
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260323161603.1165108-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzMiBTYWx0ZWRfXw1Iz7oltnn9Z
 4Bp7fZ/Fgyf9ofWbQi6ZINROsNW89QDi+YhsQeXFuCANwCbfAHCl6kyRznJN0fP4GM60MSkmiE+
 He/7eLnOB0BTAyfX0JfqVSr4Y601ddncGp9GiVK4cG6qpybK+0Luv+QGPGcto5b1dpDBIcEk7KN
 Z3TutalQ4awyhWfp7bC9jey99J65i6VCjNSYJtla0Yjk1x/1qq+GrIk3FOVjBcBK0ESQpxIzSkU
 X6FDpx7qwXrYwXVku80sd+LRh1RittCrr8b33+aiIwvQcrtOdtWXCPOANONrq/99aBKC7tAMZey
 kS1WPzqsm7hjVE91LQ3itBNYJCUtlL+GpEADZ1RXQT5jnIJVwH4/X0loSOmY5lUITQfAS1S//Xw
 YEMc3aQD8a5K8c0oddwnAfXn39sBkzPsMypwz2YcrjxZBCI8XkYAVg1E+Ft72V1s7+Tu4DBO/0j
 Ukjlk5+R2lyeqzZh8nQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c17e9a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=WRfdsTvTEh9BIu3+I5rxZw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HBqI_kkDSLXZieHAmgUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6oFt0qiwBh6usiIauFuJ3t7KN2XGS_GQ
X-Proofpoint-GUID: 6oFt0qiwBh6usiIauFuJ3t7KN2XGS_GQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99368-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5433F2FB638
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/2026 9:46 PM, Rob Clark wrote:
> Looks like this was somehow missed when introducing gen8 support.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2129d230a92b..a00215b7bd1e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2656,6 +2656,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	gpu = &adreno_gpu->base;
>  
>  	mutex_init(&a6xx_gpu->gmu.lock);
> +	spin_lock_init(&a6xx_gpu->aperture_lock);
>  
>  	adreno_gpu->registers = NULL;
>  


