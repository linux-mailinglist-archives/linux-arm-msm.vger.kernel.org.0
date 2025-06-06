Return-Path: <linux-arm-msm+bounces-60490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C90AD069E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 18:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BBA5189028F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 16:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FAD1A38F9;
	Fri,  6 Jun 2025 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6NAfD7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F91289E21
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227148; cv=none; b=qZD6LevqSlFcMyqGZXZVl7baI+VqZasESPeLalO+5OBZB6HA7T8gBBzbihjeCRySn954lUXlPSVlITkzOTFVw/1p/F6ZtESyUKIp/2bBhP05340+L+ftkyjVE5PDpn5wCL4HJ1nqi17EQ/Wn5jl6lAqupebWC4iBXDyIj6uyo38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227148; c=relaxed/simple;
	bh=wozkAC7vk/VZpJtnfcu1OgdcqSvjGXqIzopm48R0F94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OPbYdyMvCEBsaNDQnbk0FpI/NBU7RDPPVbauxCZTbjH1st64fP9csYdF2YzJ9lQUarVMBhFRXfPIJFTK2B8DqzzQEI5qWy5h7jxmf+z+wRQU/RPGCnrtgTxjGYiu4CwDZvUlXy4Gp/ajpxLuJSjBklN9k9SjTuwf8PgB7CxN6JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6NAfD7H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9HIc032566
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 16:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfn1QVQKiLHUIdJ2K7+OnM+Hl764UqzsTlMn1/g/KYQ=; b=S6NAfD7H6C9Upz4z
	RNcyE5eEnPxff/4v2v7cXL5+iiHXDLG5eumGcPeSMpXSJD/KYBm9jeoKzQ4YV5tS
	Qa1raFYpBD7IKF36d5fB1MMeyYZJgzc+UF2d1aILh7bLIXMc06hJj212cgnj4ujC
	53Xq+Ke2VEuaz1HNE4siV3/RTEVzbNBHee9M8/H4gSsCZPAcD3L4QW4VRsRVcBPJ
	tctFiUDTF/UtLxLf1j1ZcUSOJAxvuh14pCFbRqeXpsq0mR5Qb0+Fe746Yhk9Un5z
	qXAqgcremyD+LCUANLA9ND5eTBBMODF45wwCP7Vnzma+vV5EC1QkuAlllEZrw4wo
	zQ3K7g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8td79n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 16:25:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31220ecc586so2279491a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 09:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749227145; x=1749831945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfn1QVQKiLHUIdJ2K7+OnM+Hl764UqzsTlMn1/g/KYQ=;
        b=gOWjsVzC6a+qQp2KCrlGdkHt+xNp0M1tcVe2vutwwlk5B1P1nBXiYnJKVW+zvyWOLl
         pWg6IFrIxdCq/FyyZkxDQ3eiF+Ad6nn4ZK9+u7fgS6lpzGHlYfPfF1TWuYOqu9uj6seN
         gFCOXCxA+/HGyayOENVkS4XZANDm9E+I+alz6Ici+0m7xqXThtmKP0RhhjURKIltedAp
         pJrL0HHrb5eZRBc6znqNootc+fVz9yOSEaYhs6YP4XndHXud67aYHvPuYs9tFrodLBpw
         1IGcQm1XNL6blSIlaOuagoyqojqjL+Z/Tt44IHrBeTYaar2IByxcSROa+HW5UwpmZ6ft
         3Gcg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1J0mM7/EYtv3PIBZXdCcy+C2R3LHBN8ZNiSxbmnXBUgKrelBP5R7YcZIog+6Wr1MrJE9dIFp2e2ndcFt@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRXVtLebmYkkwawOQX3rUHtG3FX2i34/1RMhMjvHD/YzGNL2n
	cgNGCZFXtZtnrCtAQj9KSel4N57Kam3lVKkdzNdDvtTaca3Dw1qlnN0GTWQqfqkHcBL0mEHlZiA
	3SVVMu08nph+dtQVm3zXawQqXZdXZf9mBZgZc3vYKFr6G26UQ8IQiqxnoKg4nU5pDq36H
X-Gm-Gg: ASbGncsv4UfdMlhJBPorI41dc2yKAeWZTL72kjIL4JCv6BBO/3vSFHgc/zC5oyew1sq
	Gph//wc/5Ol4l1QozETnokUzk4hSiqYw19U9MgRT5rvELkShvrB63iKxKG3a91pIePwpW2Or+VN
	olnzOIe3FHo+mDAGGBlhnfAQjp2l/5o1ew30/6wnimUg3THA8UQ60eYzH3MuJ9TUfA4Z1JmE9aE
	EPfaMLG457xDNfn6wIUrKUBFsbIT/Kg4qU3zy5r3vTbSMO4l6BhNJ0dyhz6v7geIzKroJUOGGXb
	mCT+No6ZDdIxU2xViT5q6vnf5MjjaWAGoK5VAxseM/MmhwrpsloiyiY3On/WXA==
X-Received: by 2002:a17:90b:380b:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-31346b29b0emr5977875a91.11.1749227145023;
        Fri, 06 Jun 2025 09:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5/TnYlvyb4M14Pmzr8iKZ1ci5qsNHCWuKvIK0rgVK6v7M1LCvE2hfrlqwqQfHjtlm+gAmw==
X-Received: by 2002:a17:90b:380b:b0:311:ffe8:20ee with SMTP id 98e67ed59e1d1-31346b29b0emr5977844a91.11.1749227144596;
        Fri, 06 Jun 2025 09:25:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603504efasm14229585ad.221.2025.06.06.09.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 09:25:44 -0700 (PDT)
Message-ID: <577fc3b0-6e0e-48df-8f4c-7ac2e160080a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 10:25:43 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Carl Vanderlip <quic_carlv@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=68431689 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=-sWgwtkE3efGhls0agMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -2rNy8d_R9k2Q4i6M9hMIm8m9i3L5jUw
X-Proofpoint-GUID: -2rNy8d_R9k2Q4i6M9hMIm8m9i3L5jUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE0MyBTYWx0ZWRfX246S2pdHdaIn
 vTs81CeNV66dwON4Pgtx9yWclZul5ZD37wrbwwndEB6wZ3jJH5xDcUYOEE2nH0hfyzdnmEzavUi
 vJCvnn6VK5uyYi1tLY/MPO23kJg+s11g93Wc4CsVPq/y+PINpTcWZyOmL4vPGywj/c2jmz94MHg
 yKdp/LsTBNy+VquQSryMMLPy5sV44s0Xpr19lddsWZnyCcJdK/qC+6c/YMKecH1JIemLszbJod5
 Rq3yMbNI9LtbXcw3GI7IzH/kdP2rXlJBl0rV9i/UCBn5ECKkSX9Xzy6B9KSPCdDdUqC4FWh9/z/
 uKxjpu5QVpNWze9IhBGX6XioEkyBpPtxqkhxfvB8Tkdg4bNJVUoZJSAV8OECugYwMzfQhUbWell
 yDHYhtK1MsuTlTeywKOJm+ACWA9zLqqfsFdC5y16UFFMUdRx1kzD8jWkqsvSwVDHvcgIYd+q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=954 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060143

On 5/28/2025 3:13 AM, Simona Vetter wrote:
> Handles are per-file, not global, so this makes no sense. Plus it's
> set only after calling drm_gem_handle_create(), and drivers are not
> allowed to further intialize a bo after that function has published it
> already.
> 
> It is also entirely unused, which helps enormously with removing it
> :-)
> 
> Since we're still holding a reference to the bo nothing bad can
> happen, hence not cc: stable material.
> 
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>

Pushed to drm-misc-next

-Jeff

