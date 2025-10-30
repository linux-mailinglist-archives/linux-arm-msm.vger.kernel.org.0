Return-Path: <linux-arm-msm+bounces-79735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDCC21819
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7AD3A4605
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F27226D00;
	Thu, 30 Oct 2025 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p52pO8aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwhDwyAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A189299AB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845487; cv=none; b=JMnmHfCt+MbOWuGJpI8ChvSBo3F/pZqYFdEBz/+V3zctzcTWK5RMaM0uwr9IbX4cTicAvtYewSXhkQDnhXKnOA3pzaHDtT9kcJX3NKh994PJNZjSdd6pT227ichonPbRCZAPdM8zyDjmr+cWc5R1xgBbvdkTeSZuNDBezGHE3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845487; c=relaxed/simple;
	bh=aSNDWw8R9Xkwsg5JfyGl922rACjW4smDfuOBIJcUvKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDSYXuC00fZGaXSBkwqlFzvmyaPbAr+/HStEpeP22UoXGF2bfDUYa6S0j0jys9TBkZ0XWNbIMH9HhNBR8Oc2tCaFiAevLCnP9OiAuagEQ+8HH1BUkX6YLNBAb4JWZZHSq5OeXIfoMDpjOORSMFSMeuHA/EL57fPMPFCBQeTsQHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p52pO8aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwhDwyAL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UD7kvv2622985
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nujCbf3WQqhKbt53E3sLeaRTPd2xv13fga/Jte9oXQU=; b=p52pO8aMorVtk3l4
	YppCuFe0ySoi/Mx6GfzAOXa1We9NCsSEi+MP2Yxaw3XQ/38AUwYhegxknbepe45H
	r1m1RJzzWxbCrxSQE8OtgCn158W78GyfFtUAhAh6RU0KFogp+FrRWmt9cS0QOo+p
	LsVpc1NWWdfsJCHpOsmFWCRVS4yhI13Mlkm6sMVA3M4alUsY8xjq/o73E/ztMBYP
	jB9eWEBAG3CVKKSA761Ny9xee8OOFblPUMmIlUPmwLJqjgAoGCDFxehas3bdRtKY
	C4hRcgyJrnmnLvvkSuzo0R2s6v8j9g6ZHkJjnkOcax1o2/rtUuODIYs5gykjRtvZ
	FPucGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a41fxj4v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:31:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baf262850so1565962a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761845483; x=1762450283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nujCbf3WQqhKbt53E3sLeaRTPd2xv13fga/Jte9oXQU=;
        b=WwhDwyALmNzWJV4gNpny6vR+3xzLylaA/zmSDITA89PDrLVJsSnRs5y6yQhCRnzFO3
         JgrgQ9QlIjs/erBwoP+hVkhFrg0CsnFyXx9FZlNKlkJWKWd0qAHLEIViR/D8/G8ePp9v
         iljfUNmuYkTrbDPfO2ygxqLXNc6B9aHSVSdD1amyxRb/jp/xlUy77LLgvQyCsfOcunO5
         GQ21E0s1ZzZ1Zj9ZADRBOivL2E5MjahCuim+ouq+zfgrs6ZBiYREXsAFaYa0z6y4pn8t
         UK+dw0ee7pq+bZyqG7ms9E2T/MFs/b2UcEXRQvwLrTr4U9xb3cYAQRQ+/9QZJXh5p+Wy
         hKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761845483; x=1762450283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nujCbf3WQqhKbt53E3sLeaRTPd2xv13fga/Jte9oXQU=;
        b=D2IZe3JhjlTAFdTKCuXsrOvoqnT2A7OG2ckGBicIu5Yd6Avp5BYpOLjAh1jhxOOvS+
         7iQZZONffzIPFrJrwsu5VMXabSQ2ZeX+9dD/pgZ0LaRT4dcLSj3InbjnJ1jnoVRr/rVz
         0sxl03JG6SqalzyqKb9E7AWFvEOjnpGHYl7ZBUkAktWxQU0sZqzSe6g8aXsVnvNRc5+7
         jyHfsAn72sD+2PlbcBOOgUE3Xn91VttbIofQjPtcnn1W/9S5kTYwD+iXlkSoj+9/iZb2
         jWY80h4OXqMt+Gok3Z3ZsZhZHSPL8gX5DxaooqWz2YLfriw+BDJW6lCi87bJtDx6YLWV
         o3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVxH/Za0WBhHot1+3tWS0nssCFnEDYb4A8s2Xt3xmVmnZxC29XVTc9S+cQlUhRJ4qlKowmH8hX7pQRSJVdz@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwNEQXHb+gp+Uxj8ZoJ3RpxKUeAPIn4HVfirUwmtt3+urN/DE
	u6GmN0R2GN0fhiSzPhwfdCiYOBFqdD6SmWKnROHHxhRgHZcYV1k1uVynkhPPeVYS1LPsTZDmAnC
	So0DbuODWX6yBoNwB3ihIK8WPX2U+znCMWujSpopImPKxW15M4kcV0bFaLs0631AytuBP
X-Gm-Gg: ASbGnctCckgbDIKCJB3Y4t0j8C4NN+wIVQBW7XSghAOp+JdvFVnuG5cenL0gRvGtlbY
	Pchy10DbTO6wwe9VQih+nnuQh5rKpneH1gH2NgU3A1sZ1oAZJDEAF2lM6oOn9pCAtj2vA3kaWKV
	JVrCRMVdH+Y6C/NZ8jV8ZudCzNQlKD6Y5/arVgO9TJKVeYtfqk9J4gZHnYydKw3szPKR5A448Rx
	FdwzoK7aZMRPyzgqYw/kMTM7iIzDD+SwmobTaHEKCbS8JeJ1zO0xokEc8mksd7IxNOwJPbw5+3f
	mgfxdJTAQ9xZ6r+X3qFP/XbvXSpkw1fMmPLE5q8EMjfzQ/gYcngLbUQUZHGi3CnjhBt+gUyPzuU
	gSva7AW94JMSbknNJkfODC5+7UK0OJIQ7X0aoW9gCrMQGLp7tEC3K
X-Received: by 2002:a17:903:2452:b0:290:bd15:24a8 with SMTP id d9443c01a7336-2951a35eb20mr6721305ad.11.1761845483291;
        Thu, 30 Oct 2025 10:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatVCcKHulN/NnmmX3C3gpBJYSCtJ3Tdrf10lbnR2DdP8nhX5ZB8Z0iJkrQ6GlsbPGKAtxNw==
X-Received: by 2002:a17:903:2452:b0:290:bd15:24a8 with SMTP id d9443c01a7336-2951a35eb20mr6720705ad.11.1761845482698;
        Thu, 30 Oct 2025 10:31:22 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf423esm191733165ad.19.2025.10.30.10.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 10:31:22 -0700 (PDT)
Message-ID: <a26a29e2-c686-4976-928b-0696e34c2c01@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:31:20 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix typos in the documentation for qaic
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dImKBwDXEolGpBq0WKVetzvkiV5v5h4m
X-Authority-Analysis: v=2.4 cv=UJrQ3Sfy c=1 sm=1 tr=0 ts=6903a0ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_LXf31rqrPtJYysunv4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dImKBwDXEolGpBq0WKVetzvkiV5v5h4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0NCBTYWx0ZWRfXxGUPso4P4UAW
 SWAqChH1hcMUOGIqpcDZk/92V3gCQ1pocbnPzL8jGlvTwEi0VaE/plSWgAGJCZ4Y1zaumk/syWu
 B0WmWbGW4Vqkx2xd1T7SPMEkUErOkfRIxlOdp0wk7bnzfWJuWf9MCo0TKddpeoh7k2CUI5pVXvv
 gzs9R3wVQMX829Ciqy2QwS7vXwOXauas9XgBsv0CtpB4f0gBgO30VghJUcbF32muVoANHGf4Pm9
 c072Dfze3ZD7WkJFVcVwLoRhCrYYpckIhpPREkka8ebyVCcN2+cB9pyQ7yCYx0K1mOZqFqcJ5WY
 Ic4GwE5aBiaEH0S8RB0a33yuYdZd9cOAKgLZLksQE+WDiBv2qdaxjcZebbbotQruy/UD9gLBKIR
 7bFDNKZPDZZ/tEbbl0LhVL80/OMzgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300144

On 10/24/2025 10:57 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Fix typos in qaic.rst file.
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

