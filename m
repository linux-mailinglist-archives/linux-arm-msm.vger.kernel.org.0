Return-Path: <linux-arm-msm+bounces-100903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBO3LsDeymmgAwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:36:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 21148360FE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 22:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A48F301A391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1DF395257;
	Mon, 30 Mar 2026 20:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFQtz7Wk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cbt23ogc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2433D4E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902926; cv=none; b=VUFPo0Slryg0biRiirWKMBbXYeMtBDmHwZCrp9NVntOcw8A878WvAgNBka4P9B7bMlqXmP18NAKJC+VlXRQH3aUNzkekEdYRU+1eTFmUC7ScLpOfBuSZJqcq+NP3KuzQk6j1ZxKXKmMjToz1rBqy8COBmXkA+CCsfy+76Xt8V74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902926; c=relaxed/simple;
	bh=gKLNLO5qTwMLQplC+CxHMLRDyR4jwxDZFz3zd4efbIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kv4c2JG91o4HbQXOBM48OlBReYni5NzeQ3zdFlRedsIs4ZMUitJ2n9G62/FziYYGFiFc1uYcu+bpTaGvGm60CKhPGDbz6GWWZ5A/6qDgi/tEBiePrtRa1GqdZHTaLZjKQgk7RUcIZx+TMk0tG3jt6RCN/E3tbJAv5fW82SzVxGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFQtz7Wk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cbt23ogc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UIWNJx703510
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guwChP2JB35bD8Tpnpli7YeuFlRkULCvUEGMKOMKsVA=; b=KFQtz7WkbEiQU/8S
	LtbpQRQGaQlm2GEgzn2tD7D9xZ5IhSLgzMKJVxZdenO198h2NFV0cVzSMYG4CaHK
	RfCbUaBNyIrH2y8KW330mSnQyM4koj7wp4hjEvY5WlO2Z06/tkt82ysym7qouNbT
	AtI6SSsaDfFd4a80TItFaus+sZnQzR1NDabwZmgPZ9bQYjno6aLCBmHb9gBJmc4i
	JomMviOOp29Y16GMX2hqSz04EcFhaW7fzd6E3xePz8nPVdsGOv7FjIsfZWbdjm1G
	G4L6O4u5urXbJ47qgNm3IFMXqFfDuccJH+e2g9bwPWFvgcu0J4rL/zY8umgdE71b
	ipPcgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansuw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 20:35:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso14682432a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774902921; x=1775507721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guwChP2JB35bD8Tpnpli7YeuFlRkULCvUEGMKOMKsVA=;
        b=Cbt23ogcAfTfKlEqzqOL6yDcgxPhZMcRnvhuCITCqA5lmuX0VRD/Vu08gKLxeLci3L
         sB9MCCdhCUy/ZtEYL2+47Lds2VGx1z1UpVl5zU0vOul3OiiT04EP3mCYwuWWwUjOMK+c
         L+v+6TSASFl/Sv0U3M/vdIIHg4PJ77VSqfvty8KEPmHbQJ+zERBbLT6izrCDJEuPwSM4
         JB1yuLN+2ZwKBqksbXLU0ltBh4S6aNPfLkgyTbVmnSsPm7V7pBtCcnysbDsbA36i0agU
         awjtae7ldCZdkrdNPQ0PIfUNF41bXUVmlLxg5wFaeBP2lgg5DTB7yByQiqpeLElvANmH
         4C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902921; x=1775507721;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guwChP2JB35bD8Tpnpli7YeuFlRkULCvUEGMKOMKsVA=;
        b=CpMkNHUjrsBUZGDiXPM7c+4K+Ha5ulNiE5vMM4KptDlpn92pdm7CjfsFwyzRwhRn8G
         nPle0MsLQmlrs6VjFAKldwlEcOc6AoxlbB9RTohzd9EZ9ZJFnNA+k5ZKgCM5Hq/4uFt5
         2r50d9a8VsylI9kB1bZNOgivI74AXzy3v8IM4wHZ/1PxzYp2muzWhcEK490Ikjkt1+L/
         AZHKdPFcAL9bONZKkSSTSqWf08FGXw/NolZYj8yVPhAciBbzznBheauFxG7zKSc2xWme
         Ae6nijWeOy+/0HNS+O+yOtlRkXx6nIM1D6tMncP9vGIulqGixKgxhpK45ocqGRCruH2o
         e7sg==
X-Gm-Message-State: AOJu0YzdilPBsnm1//9UaXfBdG3yINSuI0cAZmkFnbvm8Q/QWss52Hc1
	H3MLMhXiTSAZnoSOOVxzPqPMlFf56dB59twKt9QNgn+9JgTI+uRWK0y6UrWdAn3qexfH44bgoHh
	oHJ/rnjIOrOkDMkGNh+GRP8rAHHrsBbC3K6UlQcnGJD+3ofIJhPuIdYYIYa5T0zo2LcKt
X-Gm-Gg: ATEYQzz2vwgCw7p/qIz79kBZirLrHxdialRvx361Ug9O3h3QJF1YnTIozvI55c5iH/U
	i4+d9De4VpZi0gaX+OzEIMCZNQKnRbyEy2PQX86qVVu9eCc0gKBO6LIQMwXDPPBpqhqKuiwAAXa
	RDvft9HHBmP8k+W+I2RHeXjy/iLqwfnBlnctZr+JP4FuG40efH6zH7qzF9ZcFEve8s2qeUBTy+u
	5FdMpM13ohIuy3NGYdPPHRAXJw5KHLyEMrfywRY+ogZ3cPwhWeIX6fhsyGT7XGMHPQW0RoV/7P4
	8Up3wYMqolWbf1M/b4B+7/v5fwiLdZRjBIIJJn+qv9kzEEXITGMTyr+gZCHPfqH8LX/B8LURzWy
	YDG7qiq/T0gYw5VQY61S+EZ7g/xjhI1clgpUcbW20xVzD
X-Received: by 2002:a17:90b:1c0c:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-35da90d5e92mr4756117a91.23.1774902921506;
        Mon, 30 Mar 2026 13:35:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0c:b0:35d:a90d:580e with SMTP id 98e67ed59e1d1-35da90d5e92mr4756071a91.23.1774902920918;
        Mon, 30 Mar 2026 13:35:20 -0700 (PDT)
Received: from [10.91.121.222] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d94d289f5sm11589377a91.5.2026.03.30.13.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 13:35:20 -0700 (PDT)
Message-ID: <141b1d82-2377-41f7-89cb-3e8d9eec340a@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 02:05:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] drm/msm/a8xx: Add SKU table for A840
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
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
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-11-2b53c38d2101@oss.qualcomm.com>
 <0c26faa2-f5f8-4d77-a69e-5e18dc5b6e80@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0c26faa2-f5f8-4d77-a69e-5e18dc5b6e80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: spGZt0PxMwlztZqd4HTuSSks5K40edZU
X-Proofpoint-ORIG-GUID: spGZt0PxMwlztZqd4HTuSSks5K40edZU
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cade8a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=40SSLCJdwG_cxfYP5poA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE3MiBTYWx0ZWRfXzGevfcRkrMMF
 6G+yd25LeZvId9Pf9zgb9U8cGu9aeiPiQ5U+CI8gnv6GWvh+fQq3j8fJPhGv8BmvaJyn/wSIgQ4
 u9qyImaIw5FyvbNdwmDUwMSca28e9p1JplC8GPusXZUAvszUBa590vBiO5pyie6seIN0QrMSzx9
 1ofG3Z1pzaOiovLMu3RF8H079VeZPb25MkA06Ag9gHTHcP2dd0NpGlnNHHn7hH7Kvrf1IbJn1ez
 Z5D3SCjtBD5CrOloBEhi2G2KTFxG5Rs3nJgMDHC/SeCPssO17jVT8u9On9R3iQuzb+avlwjiLxz
 wa/dHKwag1/D6B67q6mrJVxr4297rN1OG8Kxa8xgfbwociRlPgYNiAiRjmQzVnUhqpWr5Oqud5W
 mriPemYqdLl/z0K0OoRUx5jOjuEG+eMuZfyMeanumcQd1d1d7VL2A9cG4kyju4ISn/mADC/oW57
 MMeb+WzkT9FGQSxtUlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300172
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 21148360FE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/2026 4:44 PM, Konrad Dybcio wrote:
> On 3/27/26 1:14 AM, Akhil P Oommen wrote:
>> Add the SKU table in the catalog for A840 GPU. This data helps to pick
>> the correct bin from the OPP table based on the speed_bin fuse value.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 38561f26837e..f6b9792531a6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1954,6 +1954,12 @@ static const struct adreno_info a8xx_gpus[] = {
>>  			},
>>  		},
>>  		.preempt_record_size = 19708 * SZ_1K,
>> +		.speedbins = ADRENO_SPEEDBINS(
>> +			{ 0,   0 },
>> +			{ 273, 1 },
>> +			{ 252, 2 },
>> +			{ 221, 3 },
> 
> FWIW downstream maps it like this
> 
> 221 -> 0
> 252 -> 1
> 273 -> 2
> default -> 3
> 
> although it's of course just between the kernel and the DT

Right. It doesn't matter as long as the DT is aligned with this mapping.

-Akhil.


> 
> Konrad


