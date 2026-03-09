Return-Path: <linux-arm-msm+bounces-96140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I1TJnlwrmlPEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:02:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004F234A12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 08:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D39DF304F5EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913AA3603D3;
	Mon,  9 Mar 2026 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5QfXdgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq9lh9yR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D719C175A9D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039582; cv=none; b=gHQrUMjsPEV+B0N3B1I6uiulxkbQUT50HSb/F0GdmuaGPFnFp8/Tky1Wzq7pRu7mt9gtONnvd/LffIdZ4Ofd4V+JoVVGMgC47uMZL52mcaSPJqXC0cXVcP3XRLfosotZ7HIqTmDz+8MJTjMvcJd/5Ct2G2i8tLxOKaQj27RGaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039582; c=relaxed/simple;
	bh=FvVlZ/Lcen9SEsi9VK8j2x4eoHrMDtIyP/b5GXbxpaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aL2Nm1K0tXDaCCu+WQtksgBbf/tLZbeuLWYcJIJc3D+92Sg8vpWTf1s5h4XugVKHzyXnPiahrbxn/MKwpwW/1fm2wN8OW2paDVyzFU1o4NIaUO1jpzSJ5R+BfUEWCwT+oAl4rvfS93dABdM+PdMia2OLlcvmLRC/JFA5D8aLRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5QfXdgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jq9lh9yR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6294fDNI1588111
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=; b=i5QfXdgAcg/AgJni
	irNAv/e8dbLAEbvQsR2oIvr8dzvfhC4LlOP5b0CUTzKKvbHMVURDzdsbElcrqk37
	leb3d0XeO+wsZvb4WSyXwVHqYmgLUGuVSXsvUTqfbQsQxrYL5qOoI96G9Sd/6BFb
	1d4IM7k4Cfc0ikPSe8fnxEOzpXFI03B8f3fSK43H3iiPAKvy4sACg/wvTt55A7pt
	3u4Q3kGPEbgcz57stZVWCbucXmDT9odK4Bnl2AN2bzeNenaT0oCZyvSZ9ylxkB+z
	FvwsrcIZS9B9tZgDXowO674ls3TgjKtQRQ7IwMCSo/bnwHIlVK8Ay+idNqfBPxnM
	xRMw6g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy8c5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:59:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae47b3adacso74663215ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039578; x=1773644378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=;
        b=Jq9lh9yRemESfvXKxWWFUEpDQSyTjzbvSe6DiCoT+37aI7+RW4RHgXJ12Yyf5czfPI
         R16qDwGnD7Cfk+6FbNwLZQt6WwwrJqv6IBoXJwME5BKO3dCbx8dXCkas8Yr3qzPgUHZ+
         Uqfc9FMHpIxEOZ4t/riHqHxuxLMakzIChi81da5+ZDHo5WQzH0Ge4QTxwmJtbckgJ2gI
         rv4Al/4F1NvpUhkNDC90LRwtrnsA2LD96g+ky8nK/M0n4zCjnuTunc8NRga7JauAKyGr
         zZ1QtEJ02o6f/Wugmg2B1OGSDGQ0atQ/r1jaSv5Mt0ZgluUK1grh8eSwrs+mBA4fOuuL
         FttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039578; x=1773644378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=;
        b=FKQ+OhHfUmPtS9cg+uyhZqwPF59OnJhUU3lCHSTr2XbSbnia6kA/adz7yLyQKtGSwS
         j2RHUDSij94GAWqDFxduicswA/KHO+2jsueqnqwQa00hhHTkXmzZuluBunG0zFWO2E3M
         cUnptLyJpUDbb6xvniEWHgUXkZYlBLW4LEp67sVe8r/oN4i9No9ntRjSXwU3WyS3K/+Q
         i25j77JkRqoJZ43y3qRUN69GC9B9MtvH1QMwt5iin3qiZGO7aIZrag7P/o+Q615ax+vd
         X7ggaSJtWH0DWeCMgRWsChzbB+Ufaysi9OszgezUmZFlqhCtADUVVLVGvPQCJUQayuBY
         r8kA==
X-Forwarded-Encrypted: i=1; AJvYcCXdqH4ZP+GlhgpphIsZ97i2tZoVU+HZB/7iAPthj1ShFW159J11AvvKRNYTCAPB10cPZdlwvRZM/F9HkbYA@vger.kernel.org
X-Gm-Message-State: AOJu0YyLb/Cjq3xGvX0X/LVmRQZOy0lbJrud2aXcYCINOTuKxCvvLg0F
	FAJyWJS7jaxFvI0EvyjH62JxSVxWQLlGGmTzhbjLGZhefXSbJ7vB2rmagyKmU551rmWS+FqA/ok
	vL5BoszYq0wJIK2ovXgEQWY79P/NHSW/czh3Kt5nZ+M1iAA+FjnFY+VxAUkqSkB903ATR
X-Gm-Gg: ATEYQzyF09eQ0EJDK0x0TSqkjjf/nLsCu20AEGaRo1QAyVNVn59Z+22Ty/4FmtjTblM
	qLLNXP2V490IJp58RlJuwCUATqxM7WvUTXkt5gw33qfs52udhnSL/GKl6uT1E74CJ4syipoPFWF
	fdkcW3RzlRF3J44dE8VYG1puyisQm8afgGQditbMi+Ca/1ItwyIwzVXWCFFAKyqmZwcMUuIAbQ4
	zzJBlLO5/E2AjdBet682n64WBNs/EErCklI+y0Y9WsEd1cocEwpNE8bOvHZWAFQKUNl7ZuxwY12
	OzXuHbtOT4tFZPlJZOllVGsjaF8apLm684XdyYLoWlYp0HbQ0SS1mJRcu6EPJ5jsskpXqSBF+kk
	ZfOxYUqqD94MjIBDYZEy3OcBy8e1TqyVwc7bAn/01aqXLcHtCKg==
X-Received: by 2002:a17:902:f651:b0:2ae:61bb:4255 with SMTP id d9443c01a7336-2ae82418927mr109317775ad.11.1773039578328;
        Sun, 08 Mar 2026 23:59:38 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2ae:61bb:4255 with SMTP id d9443c01a7336-2ae82418927mr109317495ad.11.1773039577848;
        Sun, 08 Mar 2026 23:59:37 -0700 (PDT)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e5c167sm99741945ad.1.2026.03.08.23.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:59:37 -0700 (PDT)
Message-ID: <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:29:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
 <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MyBTYWx0ZWRfX3qN5piMLysdH
 +7VFl8UdzFqIJY50FJ5aIdhquQ5PnvLtUlKM0aBzoduA55Zy/G/uI3prVvwwqY2iYjERr1nBSri
 GZaLFLpcg6gRzG+vtzRgQIXQj6Gr0YNAgWc6ux3CKxSg6rWnv4ABKXQlvpaJWBtxziKlidfkmfa
 ggcp3A/nZF8mOc88C2AfgieoiU4Irl7ik2L1PmVDwgPE0F5Ta3zN0qBKGRupAPXeivfzP8doZ4x
 lesWEsteCj6IvZdJ3oBvzBeN/m8K902kwBTr/WoqoOnkB5vtBdrMFVIaZrtVwiQLdgBfZIKr+Bc
 /L4+5HR5Kxmrt0nxzQoOk031YSjKtNYOP+nKRczcVftX43ecU/DinS0++k6ZDXDOymUtzEKVS/g
 FKjp1efAKGoHZp/J9IGfS15YYnljTelqAEzogPGgURuXjNm+vx1T37JxIgNFYAaAzw5PpOuz+Ux
 /N1dzyjZtLo+0a/yKcw==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69ae6fdb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_EeEMxcBAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YM0dgK5nqTTLF_VjvEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hEXApUvvFPhbwkkII1ovA2yLwbphPXl9
X-Proofpoint-GUID: hEXApUvvFPhbwkkII1ovA2yLwbphPXl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090063
X-Rspamd-Queue-Id: 5004F234A12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96140-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/24/2026 2:42 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
>> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
>> it with the existing per-process memory manager and IOMMU device model.
>>
>> The implementation extends qda_gem_obj to represent imported dma-bufs,
>> including dma_buf references, attachment state, scatter-gather tables
>> and an imported DMA address used for DSP-facing book-keeping. The
>> qda_gem_prime_import() path handles reimports of buffers originally
>> exported by QDA as well as imports of external dma-bufs, attaching them
>> to the assigned IOMMU device
> That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?
dma_buf_attach* to comute-cb iommu devices are critical for DSPs to access the buffer.
This is needed if the buffer is exported by anyone other than QDA(say system heap). If this is not
the correct way, what should be the right way here? On the current fastrpc driver also,
the DMABUF is getting attached with iommu device[1] due to the same requirement.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n779
>
>> and mapping them through the memory manager
>> for DSP access. The GEM free path is updated to unmap and detach
>> imported buffers while preserving the existing behaviour for locally
>> allocated memory.
>>
>> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
>> which records the calling drm_file in a driver-private import context
>> before invoking the core DRM helpers. The GEM import callback retrieves
>> this context to ensure that an IOMMU device is assigned to the process
>> and that imported buffers follow the same per-process IOMMU selection
>> rules as natively allocated GEM objects.
>>
>> This patch prepares the driver for interoperable buffer sharing between
>> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
>> lifetime handling consistent with the existing GEM allocation flow.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ...
>
>> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>>                 qda_err(NULL, "Invalid GEM object size\n");
>>                 return -EINVAL;
>>         }
>> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>> -               return -EINVAL;
>> -       }
>> -       if (!qda_gem_obj->iommu_dev->dev) {
>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>> -               return -EINVAL;
>> -       }
>> -       if (!qda_gem_obj->virt) {
>> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
>> -               return -EINVAL;
>> -       }
>> -       if (qda_gem_obj->dma_addr == 0) {
>> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
>> -               return -EINVAL;
>> +       if (qda_gem_obj->is_imported) {
> Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!
>
> Userspace needs to mmap() them through the exporter.
>
> If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.
>
> ...
Okay, the requirement is slightly different here. Any buffer which is not allocated using the
QDA GEM interface needs to be attached to the iommu device for that particular process to
enable DSP for the access. I should not call it `mmap` instead it should be called importing the
buffer to a particular iommu context bank. With this definition, is it fine to keep it this way? Or
should the dma_buf_attach* calls be moved to some other place?
>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>> +                                          struct qda_gem_obj *gem_obj,
>> +                                          struct qda_iommu_device *iommu_dev)
>> +{
>> +       struct scatterlist *sg;
>> +       dma_addr_t dma_addr;
>> +       int ret = 0;
>> +
>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       gem_obj->iommu_dev = iommu_dev;
>> +
>> +       sg = gem_obj->sgt->sgl;
>> +       if (sg) {
>> +               dma_addr = sg_dma_address(sg);
>> +               dma_addr += ((u64)iommu_dev->sid << 32);
>> +
>> +               gem_obj->imported_dma_addr = dma_addr;
> Well that looks like you are only using the first DMA address from the imported sgt. What about the others?
I might have a proper appach for this now, will update in the next spin.
>
> Regards,
> Christian.


