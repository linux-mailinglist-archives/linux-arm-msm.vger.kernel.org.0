Return-Path: <linux-arm-msm+bounces-107481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G5nJ0DlBGohQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:55:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 095FE53AB6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DCC0301CC73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F75384CC8;
	Wed, 13 May 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UmtO8IxW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFur2RRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BF379C5F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705726; cv=none; b=qqE/ImiPlVDhIp+b2PKN/NpQwavCU/UvhUxafFNc5Q1n69NVU4o0C2jCNvIDj19ODIGm9MLGcAuJXZSyEvGlyRUF3iS0WWn2XE2j2p/uzTqMz+aIfJKMZzsHC1It+06PQQp7Hx501b51d/5BEDGoo7zy+ng3CeqXz9uRSElnE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705726; c=relaxed/simple;
	bh=r38NBoZ/RUD3MjH+uc5TLBPACf1H0U63GZ4TJbCspvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=revRZA8juPFtvhArwL/0Ads0tPh0yasTsrw75X93MVnBSMWuU6CZgHyH+zEYBINI5VySD0co9gSs3RCoHmOwyfrA2jl1QWHPVx9f5Wfz8laoOAnItI77XCu2EIHP3ICWzxzY39OTueZtTfy5OlqHu/dpLakptOMjhgRmQu6AuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UmtO8IxW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFur2RRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAsSX2524326
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrYm8QbjWl5AnEafqETu9LkNgXLIyRedrjSfKoLJgdE=; b=UmtO8IxWGZ3kLalY
	Pr6TcznHgFU8PGTs6pUnEbDz3iXgvLyQMyrkZFNs37FaainXyiwBYcy6Yq7ifY8+
	nuAAhoOuliqJazxh1c14/aB1PmeuWNPr1aqMnFM7N8mIsdFKJy23SARKiNWVAIdl
	jfRmZiIkwvqnwsK5wCPrCsPYY2sT+AIpkpwOxmxSlqQAkIyq2jxTuCs9Kc1hCizd
	6JvLpwSQxg68tD9J0yeeqE70nMH6p71HCPHutqVS7sMkFrgI62QiGo3tuHQUmpqd
	V4z+kZvtOvVOWqpksFYjynK4mdpySQ4grytiS6janWuvNy4aHrcZ7Ie5UIN5t463
	TmZXHg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjh53a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:55:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3684cb22502so4697406a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778705723; x=1779310523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rrYm8QbjWl5AnEafqETu9LkNgXLIyRedrjSfKoLJgdE=;
        b=AFur2RRkhpIfyyOwcGcJlZ3Xy1ydCfzc9FDEdelPz4pmcWDPzxbdw1JIPCawKCcQKk
         e3TkCaZBPZ1qgDamZffUEdXTaV5daxk6bGOijyGpQihLn4pqDU6ZorDJzG1yh5qPBIXg
         Wr374vcuI9juWlMVCtbe2bGvMxl+6xT2zzyVwe9OLvWa9iVotLGSNQAdAHfbsp1RypRt
         /kWRSvHxKPYRPmBCkLibkLftJ6fEOxkZQD/qwZKeFdxG7Pvrw3TfeVDokQBeSkxRHrIu
         9FZyUOLVKnvp5TW5VvKlZdLP+caP248vs3mD8xUY8VnxlEhh4a51PPHd7zWr3hMpd1hT
         gAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705723; x=1779310523;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrYm8QbjWl5AnEafqETu9LkNgXLIyRedrjSfKoLJgdE=;
        b=FiFzmkquZ6cAEGOy6eeq2N/HKLaY990KFbv5A6exM+fESGVkCeiOpcPDcEhT6AHxTG
         k2VS/FbChqLzwD+W+eB9xImC8tYK9woyci7+EeR9QbmJvNCtqbpG89m4d4Y1/TPfllL7
         DyFOn5L1GtsWtENgbFr96lHEG13KK1rIFJFsdIaS5/r+ESpOFoVZDqD3uQ/uvU6FXi2k
         6eVrn0ktqD4PZ+AN63zgdk5cJao9hUv8fwO3yZ15ZiVbK+15gGX96wdYXsaX6T2aH7+9
         /9rgWN6vl5S9fjqiA8wLqgtfFsTXkxyIQB3lTcPkvTFp7CbccB8RqeCNfhkD4rnKrY5V
         EczA==
X-Forwarded-Encrypted: i=1; AFNElJ96/eC8OLaECwSiBNryTcFh5oWBW+gcwzr+K2BdL4VJafrfgkfSWO5FDDqEfJHnIqoffZL4CBde0zZ6j1pu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NU/KhUVWwns3/KG+cczv6Edg4hU/y8zCynIweum+qk7jAxRw
	iHJCmzP9BemQz2QR3pXq4LNv5qegcx43V+eJjDrDu7REbmutRh3uPRMC/Usc3hMZI9TFeC8Gjel
	MFEM0Lr+zYiwlyYdKO2hNChpOwUNx7LWkChddj29qLb9qLmILTWhQ0W2rr9TTe3DyXVQ6
X-Gm-Gg: Acq92OEn5uItGOT5dU/EKx+LaE0/EiT4hp53zj4TxBZz34NcZMGy8bZDKCywlCp0nFE
	GP7ZjpfBTCAd2UX9PxWPjns5a+pJs11gHR14/yZ/2CDBvC//jvSzRN5ATBIP+CvARzeFG/vEekI
	9IBdYlJzic6FlPg9godvoW8zleMxMv6hcCSEIq/F3caBnzRHedfXeCHis9HUassfVGAKGsIWVMA
	AL7tTuVSs7Ip8X91v86gRVONrZoSNh7LgkYX7iqPkP0EDNxn0EBq+kxxF+d0E5oRfMChKR7NdiZ
	ZK2C3hC+8fLTQXMe+U4n7x8o+8bucradAVmGMDiANphcxFR4XmRes+nV5o0SP9Gu/Tt+K8OILaM
	64GTcZzzKe79GOY5Y1ThkX03+dZytZALgETq7maUUwbBxzffbhoN19Cs=
X-Received: by 2002:a17:90b:3ec1:b0:368:147b:536a with SMTP id 98e67ed59e1d1-368f3c151e3mr5189497a91.14.1778705722868;
        Wed, 13 May 2026 13:55:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec1:b0:368:147b:536a with SMTP id 98e67ed59e1d1-368f3c151e3mr5189471a91.14.1778705722385;
        Wed, 13 May 2026 13:55:22 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.229.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692da0fdf1sm192484a91.0.2026.05.13.13.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 13:55:22 -0700 (PDT)
Message-ID: <7cad2dd7-b401-4d1b-8f16-79458b563986@oss.qualcomm.com>
Date: Thu, 14 May 2026 02:25:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 2/7] dt-bindings: display/msm/gpu: Document A810
 GPU
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20260502-adreno-810-v5-0-bc9fd2bb788d@pm.me>
 <20260502-adreno-810-v5-2-bc9fd2bb788d@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260502-adreno-810-v5-2-bc9fd2bb788d@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o6VZC8cgg5GQ2oKy5IdM2UF0oqyuxjds
X-Proofpoint-ORIG-GUID: o6VZC8cgg5GQ2oKy5IdM2UF0oqyuxjds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwNiBTYWx0ZWRfX1lF4KEzdGp8l
 HyXuAzeKnHDt9b8UXKrZh8A0YSR5fKW/5dZHlrh+3VgLYoikHNz9KPU7lUQYn0lVWxYxbcdKaDk
 RDoTY2mxGN2hHEmBeC8novSzSliq+e4zsS+/8/LSBhoh/IoaICThlC0ZR+RYDVGuRfIQ+8Gx7c/
 6bRIlJ3HKYslKLCB4Wmx7K92LEyicqdIoz6VxWdJUTMlNaGr0WT5yPKn4zE3hXX0/LQRNV5/LHH
 cKNtzJAVuyt52JSoDVGW2O8TM+mLh0WU+L5/sKa1ee5casVMuECkAbHsVSV6DbnOx8R9zowAZbV
 AN2qSCEojHHwIvC8FQm+BGMjzupkfHpBC7Hy2jSYaIUB4scovaN5O812nkWETU8dycBpqrZ/Xb4
 fg8lU9Is+uJLqCgXRvynz35V7DX4mVSIzmvWFm7mryZjngos8/BUe+v0j2Rxr2Nq+9UERbnTFXa
 FTiEGAgmgs0K7p8jF3A==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04e53b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nm1BsBjGsf7C+PoY3QnOXg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M943YIVedLBdXAjs6fsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130206
X-Rspamd-Queue-Id: 095FE53AB6F
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
	FREEMAIL_CC(0.00)[fairphone.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	TAGGED_FROM(0.00)[bounces-107481-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/2/2026 1:37 PM, Alexander Koskovich wrote:
> Document the GPU compatible string used for the Adreno 810.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 04b2328903ca..1875a3b9f688 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -434,6 +434,7 @@ allOf:
>                - qcom,adreno-43050a01
>                - qcom,adreno-43050c01
>                - qcom,adreno-43051401
> +              - qcom,adreno-44010000

Please add contraints for reg list like here:
https://lore.kernel.org/lkml/20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com/

-Akhil.

>  
>      then: # Starting with A6xx, the clocks are usually defined in the GMU node
>        properties:
> 


