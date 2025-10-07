Return-Path: <linux-arm-msm+bounces-76227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF6BC1E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0640E19A4A5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3F919E7F7;
	Tue,  7 Oct 2025 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyEcLNTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD1146585
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850117; cv=none; b=qYN9GIsPXmPTTHYryqfmXDbigUbdbwHDPXUxN/cYn10CSc0sVrWgb9MiTJqA6r7ibcvMmXJiKiDMWFn0awsNk1Qdh9oP1rdd1+bTyHkMa4b41HPTaJhPBEm57ot3jDlcHQ4FHnUq+H9oL2PDOlxAOugAHgtabxvsqkZyvsf8Sqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850117; c=relaxed/simple;
	bh=09eH8sxtNY+c+OWZLYjNXugC+4gLbnPtzGZ1pQuxBSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/0z5LY9n/RA11SIGRn1RwNu04FhkfE+IG/a3ShyRTJwB3IxrA1/iQkIVlb1ceD4q5wNOkJlBOryJe6UXcBNT1UwAKkuQjjRwjvYpKiVuXrzI4g7Q5cbM/1/TEL2XDxNzxJ0nmJOWcUu0YaWCwI0E+Av/NxciggOgZTBiVRL9S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyEcLNTH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETFXc020544
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAIkMXz0tNDmoCBjrAhuARcVZ/kd32yHfQHf7dX+8Ds=; b=WyEcLNTHzQtrCrNR
	/jyTwA8X9V8UplZbMwz4+1fJj5MPQwfpXW2EWyQn45SdQ/gddaqDGhXKd9MT974b
	3KT23ZHnpHTlsGM2nMG8xJgQjBtGukVInzwx3NOl/Gi5NhBfy/zsEw7IgirU2Cbc
	7pyI6WZVvN1F+P5L0+w6Xs5LkVgzKhRF8TzRubeXV0yg1DnjWRW3QTbG/teXqgwV
	InDzbISrIYHFLUwP/g5vIYb0I7JLosXKH9lFfmgxawRT7vxOTmnSdAJaVpTcjbVK
	ZuvjGtrErTQLTEz5YOyyREmBoVPqKJIU9jQgpDEJ5dBiunB3UeXZLXvOlsJCjF+/
	EEaHbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dytqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:15:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268149e1c28so24783825ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759850107; x=1760454907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAIkMXz0tNDmoCBjrAhuARcVZ/kd32yHfQHf7dX+8Ds=;
        b=neX2BubD/nZ5Ts4fOBNdjEAidfmMIWHqLl11bALJGuImKLLzP7+DQGk61rw+djKZ4/
         SqdxscACQRy6xVLVHPkTQlT9Zq/jx4TAdpijfb15qAGpq1tVSZCsHgjdU4tB7Isbh/IU
         K1xA5rne8lWyzvTTq17IZnC/yPZRYqSDxzW8hfDX+k+6YIwvxnF+xORCdfWeuyqfX2QB
         KGYnx0L993cnQesISsJ3zODP99YjkJKeG9w9kfxo5XPnPIuZmD7EDG70gv9raLAWdXGl
         JKfN8lJ+LlEJdd2fNaC+1MVH6c4kqKh22jv0dMBSoekh+FpzKNAGuWLDl4Rgdo5ikt/p
         Xt8w==
X-Forwarded-Encrypted: i=1; AJvYcCXm0RDnPH6O0EDXd8HJi6FJ52GD8NoSs3qZfJh8NBhTwq+J0iHaSicCbF2rSQyk78EMQB2V14KKNgA4UBk7@vger.kernel.org
X-Gm-Message-State: AOJu0Yze00agniIGRyojkqAnOWWAiiI1j3gkiTJEqLhq0EAMnAD4rKjQ
	nE3Twn1je81WUE2x1v9S/vrTcQ7Q0GoWNW8im9YoXQ5CL6/EF1RklQU3cK8NHlN7AABWVu+XDH1
	gPcNWJdeZwCH1eCxzFE88kmABsh+d+RBRIeVm9aErDqrM283TyEmC3XnsAX24Ox2/1eTX
X-Gm-Gg: ASbGncu3KQ6dY1NcJ1p/ZAxrEtQN673KJYBaj9jijMbiDIe4HdXQQkNh8rThh2gLw2e
	tA11LF4mvkDSSdAYvltNm4cE3hrMYw/7dtP9r1vXyXp5NvuGzUpUHpqjen+/Ri+BegyxHl+bN6m
	X3HfqrUSJ5jJTmUBR1otUmPMNwmf6hYIo6iGKxAIpOw5Gx1fBoTZpdfyZ4VaWy8eQn50oSJG/zA
	i3y3MhJIAH6s/1ziO/I4eN6DocZqWZlYrOyA7WPiqXGtoEq09VK2Ak3l2wX3l1H7bxLEGWlzmhu
	s2wQ6pefDzGgKx0cByCf9hKSODaitvpE7+lcH5eQJ1lxfK6M6evhXsAYZdn9qdE1X46dIiEGysr
	f592z3qo0cloFNrMRcfc=
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id d9443c01a7336-290272dfbb7mr1731725ad.49.1759850107025;
        Tue, 07 Oct 2025 08:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPqAih4wb7aA5h14uRu3iHi2SVpItnu6Q4K6o3HMbJEvzoe0GtD2go7KnfCkfhD2VmLGPqlA==
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id d9443c01a7336-290272dfbb7mr1731175ad.49.1759850106541;
        Tue, 07 Oct 2025 08:15:06 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28eb1520260sm89939275ad.19.2025.10.07.08.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:15:06 -0700 (PDT)
Message-ID: <0c6554b4-ab77-4e6d-b690-7cbbed982e85@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:15:04 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use kvcalloc() for slice requests allocation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007121845.337382-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e52e82 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=57TA5eHKvZbov0TpALUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qHcHQoe_FcyZQG49XLxsBsVJNHbN9lju
X-Proofpoint-ORIG-GUID: qHcHQoe_FcyZQG49XLxsBsVJNHbN9lju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX9qUbPrJI/sIU
 mh0GwKVvqUzfjebtWgyxaIJ9sfSNhKa7orejhrzq0ZdoSEfn+aaaRTIgmVs/FvF8yqI5zMecSW9
 c8pGkAp3yvDkOjPtnutZ9YzGrPJ+6yKfJBkpQOf6eWAUYA1R0QOXjKKWEuz8D33NpI2CAErEpOR
 Cfq6y4Siml2SGl8zbR84RHnTqy6gfej9Biln6qNTADql5OHMwvkPgqYbzRcQcTc/l1HUfbo/KjB
 q+QSsB3RNhttCaC8uTBaHbsdsQJRfBdqsVRzXj5fj7GU3rPoMRtuAbLmZfH5g9glMSoID16XW5p
 1Fd02ip+Gi177nPFJU1hwE/BHMaXa632K2+DFQ5ZjBUIrBtR9GcP+T6MdfW3CY+8Eu3Hm3Uo7ro
 WFCKi6ccUNRwT9mfHqRhYdmGKFpHUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

On 10/7/2025 6:18 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> When a BO is created, qaic will use the page allocator to request the
> memory chunks that the BO will be composed of in-memory. The number of
> chunks increases when memory is segmented. For example, a 16MB BO can
> be composed of four 4MB chunks or 4096 4KB chunks.
> 
> A BO is then sliced into a single or multiple slices to be transferred
> to the device on the DBC's xfer queue. For that to happen, the slice
> needs to encode its memory chunks into DBC requests and keep track of
> them in an array, which is allocated using kcalloc(). Knowing that the
> BO might be very fragmented, this array can grow so large that the
> allocation may fail to find contiguous memory for it.
> 
> Replace kcalloc() with kvcalloc() to allocate the DBC requests array
> for a slice.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

