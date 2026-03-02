Return-Path: <linux-arm-msm+bounces-94813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGMQEq9TpWkR9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:09:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 313501D54A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 314653019C8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45D338D013;
	Mon,  2 Mar 2026 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ls3MwxnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mkd4unxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB038CFFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442532; cv=none; b=kQlxzqh2BEQEu7Lo82dG43BM3WDEl1Z+I5oahqe5ORkbzLlnC1lDZO7xNvZibX5UgKLepnUHvobg3Flxt96FM+5C57pSnGlOPk1Jt2jmilhHHUwieCj238TxF7k0O+XJCNGaE5tlydQZi1vrN/YpLSWiuaUX7slQxKolkiGt4RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442532; c=relaxed/simple;
	bh=m79/X+bzTpXZL9AiiyjJ6wo5Md/bncCfMY3V5a10w4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqIclxCxWaAwbatlTc5bG323lIOHqMlTsdEkJnj2eEslNWJg802acI8+Yrtk261oBkS6VGDGF4c6bDkcEoTjf9BNaZ6llK5b/05lSSsOBdFMP6+xUDCWBLcceFPupSshCgrGNeO96hMxEGmU9XWLpBneWruF9ZY02EBv9M38m9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ls3MwxnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mkd4unxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294nls1291543
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=; b=Ls3MwxnSvG7BIlnK
	IyfnLH5p9oe0dLepe1a+nqOGmpRu/4qG+sSO2gKmIHFKo06/ya1XPUOlwIW8eJLo
	2pI6ZrmU7TWboPLUzkOpLJrZS0MdecFq3rnqNKndUzd3HTHAzh2h05tEBXCHKNWw
	UUnXHYIFMOHVnoduZQXFCNyXoMdMckQOumOzGjKlJMap5hlsoeJjDo95nd5KKVrk
	MLS5arA2twyVRrIQrypnewUMTD/4e7RD6eerC/2c4QVVBBTiAfeeZg5qDvJoZUCv
	4ZHwYUF9OM8jLqjubqvJqSVdZEqjaym+yMXm0R4xenGrRwgqPN/2Bum3YHPUdqNR
	Hf4F2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7ku00j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:08:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2760260a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772442530; x=1773047330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
        b=Mkd4unxPOyqBHWMy79B1bFczJ4g94wd4bZ805Y58UJagH/ftf+BtQ0tMR9P0e6b4Ps
         Kwc541sTqAV1dCgFYiPgDGy+YBqAertfgQxztwsIdoKHZMmaawC3qzTuDAOLSOktqtsd
         ibqdeRS4Bc+wd8/XIoZmLc8uSgBgBnh16FaMzQofaBRrEyEqDjykralKwgzOOSnut9RL
         sa9oegtpkbyCQL8/5fNKpxecVzdVYnAa/+UPpqbc3BhCcHR1B/s3pHcTN348V7gkx0Zz
         XCrHKNijkl2hsI4l9Vrhpl51qVd+qPKucLIjG5m1zwCekSyfAewDO0gUfXT99A0piTpu
         SSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442530; x=1773047330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
        b=fEWD4pSI49uz4AIPnPcPa1eTeDesIkdbTnBxo8rDaWVxo4nY4o+vUaS0TWkNxb8sNN
         ktniaL7RTNGGxnTi7N2nPs3WH52zOPMO7jqOrw9kiq9JH0IcQGsTjLQF7oo3aysjyfar
         Y71UYPuCbGqyw9J/CVKepemBgvbaPrczqvTtmQ18xGzYfp656Oam7JBLkCoDx6l2is0s
         kvgQv8AEYkcBaa4iIBnY/ThPumOHxCIyvzHpwAc29HySN5NlchbTFO/aYP1AYU0cTAQY
         xGnr1Sd2frDb4U91Lh5MNzlleHO/b2ziJWACBlAuT9Ysxk8BTrYWuMexE0DPCawcyy3d
         EA8w==
X-Forwarded-Encrypted: i=1; AJvYcCV20v6/oDIdWPbF2+M1xyKAUXwe8AG+h7LVVrM+SkUKploOvoBH48xRfFPU+emb7uy4tImCfcvN6CkxjwbI@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZyr866VP8lV2ijLSqhMpnAgmL04R66nviVFKqGdUeJgFSFZk
	xMWENrxsXGHF0z+G647mAy5q4YgshH87uvpks2+Hs5sxVr9XGzPY/yandG8ZOfjzdbyUhetsoCJ
	vB5OHUVczotakYqfZYHr+O/rTCrkxYw5lD8lqawH0pceX6nfBrzpvBrqbM6mDay0EUUOa
X-Gm-Gg: ATEYQzyihZ+oCRpBhDPlIwdTKd18zTxK4zbK32GWEDePOmfqSWTXzWqsl2UaieKmo0W
	hwnrHl8E+5Vlw8MGxdI27EhmhHbiwWx8QeK8W2wGkCTKyYOso3/ZAFochT2rW1K+upm5tS8MA9j
	Ar8ild37EkAlA8vTwQ/FoMQkVpOnCYsl34/l44Wd6a6Qb5NX8SMHO24I3A7bSkZdf5y9+1GXX+B
	d5xN/XUqyguUMiEhqF2dhlHLEUrsCnCYUHACXtAceFPv1Ub3LsQrX7jANzEW48GU/tA9XCC+iAb
	kANIck1tbYqkOs1xMDTZ0Jrsnv/zg930oUwd8u6mf1VyEsnM846BQum3gTI3GYofbv3XjKNsA/+
	SfDJSmhj6l4RDq7nZQGPGQun/utMgWgPHP6jLrbRAiIlNeWcLHg==
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-8274d93af23mr10970987b3a.13.1772442529568;
        Mon, 02 Mar 2026 01:08:49 -0800 (PST)
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-8274d93af23mr10970955b3a.13.1772442529070;
        Mon, 02 Mar 2026 01:08:49 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff1c9esm13696576b3a.32.2026.03.02.01.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:08:48 -0800 (PST)
Message-ID: <a46bd6ea-ec33-431a-bcc2-1ade0b40c5ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:38:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
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
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69a553a2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ukUgU1k7PXLouMuqi7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Gh88ZX1M8tAp0ru3yCOzPX8uJ9NO9WrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX/sKm5S3cmxHg
 Jos3/RwAvs9YqwVwu0+WLL+7Jl9EBDXlP9DUulRECa3K9RbWOGwQjVp09DP0T/so2+Rvnv5+fiJ
 2/UGA33Xy6HZxRoiX1KqLRfnkmBsgGxecy2r22mEoAJycEh5MmZXOASYkrD7yg8NGnCmDoKPafi
 yEoq3F4+wFqjVfzSATyWPjfG4/7YldlUsYGZN7vWY/eBFoHfrq2n2662jNqdsPjfcnNsKI9ZSRR
 RPqinxpq0RONtBl+9LTcisYoPnNE5c5gMXnzDa1ctjbMLJQ0k1P08GoBZSQ4InSCRhic1ck4ysi
 hK0AYEJRSIulsTZe1P/vZpvyBYtHO0fbmqFNQtxKn+BunuzxrZuqpWdt0o2s+T6tH2vUfZUMdMb
 yLFHL5P734/BVwS7myB1XeRdW7t0fdc9Q8+x+YwCIVzwUlToATjcyU5LN+JE0lN0BJWpEg8wwf8
 QrYl6o3ngAaUUztQDyQ==
X-Proofpoint-ORIG-GUID: Gh88ZX1M8tAp0ru3yCOzPX8uJ9NO9WrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94813-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 313501D54A3
X-Rspamd-Action: no action



On 2/24/2026 2:35 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
> ...
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +       struct drm_qda_gem_mmap_offset *args = data;
>> +       struct drm_gem_object *gem_obj;
>> +       int ret;
>> +
>> +       gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +       if (IS_ERR(gem_obj))
>> +               return PTR_ERR(gem_obj);
>> +
>> +       ret = drm_gem_create_mmap_offset(gem_obj);
>> +       if (ret == 0)
>> +               args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +       drm_gem_object_put(gem_obj);
>> +       return ret;
> You should probably use drm_gem_dumb_map_offset() instead of open coding this.
>
> Otherwise you allow mmap() of imported objects which is not allowed at all.
Thanks for pointing this, Christian. I'll read more about this and fix as per your suggestion.
>
> Regards,
> Christian.


