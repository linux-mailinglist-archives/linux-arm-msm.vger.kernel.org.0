Return-Path: <linux-arm-msm+bounces-77056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F16BD6B75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C375618A6ACA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86D6242D90;
	Mon, 13 Oct 2025 23:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTxATYvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0F02AD0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760397452; cv=none; b=Q8ExmFUwSM9fiefSD65OFjJjCDBVA26TThtezGXn2HS59mTd2blyvLp2Cpeb0MHXzXZnx2MgAEUpqbQjZ/8SLBaH8qdBlbL+Ejtsnam9pw6TL/8u7OCUlOaP1V/R7ARpTMJaa/oVLMfXOf07A2TjkUZBwm6kFn9gseKzJcu1W1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760397452; c=relaxed/simple;
	bh=OkPDchnD4YW6p9v6Vms3N10xFIEc9zUgVBA7q4/GJa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuRkqxBWd/bbn7DEUrPWomUcvmyTNyCih0Yv8BybndP96NscWjE1feIXDxIGVGQlEVHZ9LdKFMULj5dVLxneJUgmQVS6tDlzNQXrB9ZSh9udyKGGVNXUD0eLAnITA2m6b+MSKRl0z9e2srvPpgxTjqcCIquUUK/lq8S526QqSSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTxATYvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DIMMhb024038
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fANAh/oCQmMIJHnnE3c5GDiSvFKJ+afyqczK4Zc3Jww=; b=UTxATYvlZFP02FHk
	xAtf7+PX5wdXmmun+1nvmZc4xpEtBkgAjYABCufbb5QkAACt5P+6ih5KVXB31kag
	txIqfdMkP7dyhZw1RCn3XOG9AXquqz9viKH3ZKejjoH+z/DlXONcqV3dqeKTEG1P
	CgqwSHgQrLjUV6f2GGD/MVbFZhkowS4chf/lRGzKG2cs1Tq8Ve+hDzHIe4gMb/K1
	6P1a4gqMY7izfGfuCAMKf6jbHA6xivxHOt9eqhlWoffv0cq0qxQtbxWuRSMeTpVk
	xwsV6BRJ/y0b21guHHM9Wu4/EmuZXWZZXLDQHQ/WTYnCK78q+jFl/wF0rJxlnTiS
	rzT/DQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwgrdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:17:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28e8d1d9b13so89296345ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760397449; x=1761002249;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fANAh/oCQmMIJHnnE3c5GDiSvFKJ+afyqczK4Zc3Jww=;
        b=W5+PjO+eIwiZxr62mMUzVMlUILGfe6tpsDf6CCy/Fx30OwB9U7dld3jIliF1LEQL8I
         cw8Y/yCx1wzuCGN4StRQQAmXQrJup+ROXdB4OLx+khJk4aBx8jFcO9CNJv3MHiSvjhAH
         yQlbXUqQ5EK4DgnRdk0aeb//bjpu1Y+XGEFnO454FJBCPq3GMnx6JvrPTJztPGhH6vnk
         MA+ugus1LPNi7XjhvIk3RDatQga6aqKtHFhKmv9ziOa5y3uC7okOiy2yYF0u3hXKRlFg
         kpUy5F26B951ix27Rk+nKCPKBA2zn87OutPD30lqmvnH3gfKM+PjcmYi2D9ZPQtn0MUn
         jeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxZRm5N4Ab8gQjZ5v+ohZ9c06RSUWTrVgDMrQN5drp/PbtFjUl4ioVP7v56l25ViWMB/BZA8FOZxhINbk1@vger.kernel.org
X-Gm-Message-State: AOJu0YybisYYsE6v6NMYl2QLws5SJMofKI23K5PJZhfW7wAqppikrZWW
	yK0zK+Foky9bLbPNchjGGD6hY5WGEmcJKOAnG7eUbJACjwXNkW/VN3KZO3lqn490A4/2gaqiEdm
	KbKE3TfXjsKpzquiuVQKxz33u1pSNdSiKxegISdsJ8Rvc6pcz4T4PCQ6AigR/Fd1xm9HG
X-Gm-Gg: ASbGnctgCCu5HA+q+/K8FfOMegtnYN/8T/Vpt839oq2Sj1nvzGry21b/gf9qAQgk/7H
	iCbJZyMBZaJn9v8R7v3p3RZH9L8R1IgF2wONHoj4epDsMvANRwkEL5uk4i6BHC0pE92RWhfCGtl
	AwzqdEa/k3T6ie2DYBM972RwCPtrbnkglfJ6wmSPCfg2o88eZ0tTEOn5Rlmcx3A36FOnfxpbxB9
	8/np5c1bXPv7HbyrUCQWe+pCUHDxcYi7cK9pSD2wZwPtyOoj4Lsq7pfAJQSS0wotGNR5kgkKXwF
	fs21TFkhQJld5RfLqMrtxcuZcYh8gEA8z8GFdb6qHEkoCzlemqb8H7kUgvDUT/64UBXc7O12ZlK
	ROiYGxC1ZwaGar5gYp2Wj0a93XWA=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr272187615ad.44.1760397449268;
        Mon, 13 Oct 2025 16:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES92wJ9oCyKeHD34cwFqZlyfEmNR//y+xpMc9t9GBfg4bGarmxAG9L7XG5F6Bg/xgkNal0FQ==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr272187385ad.44.1760397448841;
        Mon, 13 Oct 2025 16:17:28 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b8aba949asm515921a91.4.2025.10.13.16.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:17:28 -0700 (PDT)
Message-ID: <a8c76986-bfe8-4fb7-ae56-d99bc3ae3187@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:17:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant retry_count = 0 statement
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007161148.422744-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxSkBucg4TW3r
 P/3RiUanEen65XIVHnl5+G9LA2al5WKrA8jEKIfPmwPYB9rfCcYZ0uh5NPvzSkFSRG2kNzNMYe2
 BXBfOzIo+nzVQiTXWAVngoM3gtdoTNGI1lwQsGcTxoNR9XUpxroAZYDF2EQ1a1f2gV4VWpneWwO
 8bm3nLoJi2Cr07ldkOktO7svhzV1qUWU3WghrO4ZdsZJ33cxfio6PDHAtXkEFa36cWxs/5ftdr0
 jAJnlq5UU11u1Wwp9WguIOFBCNxOBwu/J74Nl5EenxQ5b/6qzdM4EJ+viiJOOTSgxNHiIASS+E1
 TzIA0mXDNT3fdMIXzaDPpKxbZwWnPTK7IN0Km/LW47ni3J+VmotDbAio/V3yTv1d4KfCPqFX19M
 DbfEG4riH7wlMDm/ovvER1cRZg7QAg==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ed888a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mnYluDPEoM_Hn9eIMYsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Kt_FepiZ61ydM8PjV7Ol0ViQX80Xbnoe
X-Proofpoint-ORIG-GUID: Kt_FepiZ61ydM8PjV7Ol0ViQX80Xbnoe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On 10/7/2025 9:11 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> If msg_xfer() is called and the channel ring does not have enough room
> to accommodate the whole message, the function sleeps and tries again.
> It uses retry_count to keep track of the number of retrials done. This
> variable is not used after the space check succeeds. So, remove the
> retry_count = 0 statement used later in the function.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

