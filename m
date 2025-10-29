Return-Path: <linux-arm-msm+bounces-79394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD2C19592
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA1F3A8936
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2783112B6;
	Wed, 29 Oct 2025 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCwb6lrj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqeFxpYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1631AF25
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729251; cv=none; b=MQim3o2iL0PhBcZuRXwtlQz7Td9+bxX1NdqljS07I3OMtIkQtGDeF2jtjNQq7Q3gs5GhQbyagreLGhXeZnD5K+6HUTtjenPRMCHIOse7KVuzPnaijOvnsQIHBhzZ4VJaicBc2RIedOm38DcWDHZJmuaLOnmw9z9vA1UrmPKeI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729251; c=relaxed/simple;
	bh=aUPFdpL33uES8kTlkAkCNzAAjB0JCnykVwWBibXh6+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHgvz5NXxx12VmA4Yb/RIBlOvAzKBw/powfyTo/7M8SJE9strJEuL2w27WOfOhyAmNp5Ha9c2gIcxg5+occ49Ua0HjSSfp9xjc+o2A6C3xgetcs/h5DqwUNa0PCdwxejuOs5ChI24PkKrsQgbFCpOvizd2kTKrk+14E/AmaZ8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCwb6lrj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqeFxpYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T93H9M4155563
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0KeIVlGq15MElBeP8pO+CyR7dQzEqnN82GDubcNW74=; b=PCwb6lrjAp82TKWt
	H7sHwkFxeWhxoFzpTJjhjHDzacnvukYjohz+s6EjnXEja1tPY/AG5KyzNf4Fuyma
	ptiqwkQfvXd77RU3MbEZ1UA3QBId8/QMiDDAfk5izyuiNX5e+IFbiwRiACosVuDt
	2vkCogNPy49GCyqz5qTV6H2U5LmYm+aQfhOOB/tqPzy8s+18li4TLVNL+bBi3d+d
	96IGLAztTcMZ0CdXm3Dd0inlWISTiEkDLO2RxHC9OiuIXbtRa1hhE9b/9S3BD4YI
	yQTJHbgAOhBNXyyOrPrrmc8brycbDMrcmrBg3Bm7UoTj27TlBN5hrOJygdtdWmWk
	A0i4tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0r16q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:14:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1c70f1faso30530536d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761729248; x=1762334048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0KeIVlGq15MElBeP8pO+CyR7dQzEqnN82GDubcNW74=;
        b=VqeFxpYaiW7jSZifvAKa9c8vb0vuXAI53eqBs4VcYCkmFxZgzWIsQY75PdHfmPuaRo
         VyvL1oLCDdkS9K5EuobpERX66GctODp5XH66FV6Pt/yPOteIOK/HSG5qeGUugJEYo7gX
         xKjG1rPVaN5PgyIiASOh6oDVOyMlk8vVKcDJxKbF2MeiHrvhsdVUpPBDFF8kZ70QhAEb
         YP7zCVaHAv8DSdTnRItMiSpP9Hvbw4m4IbfiICqTbbJ8ONcItqwksvK0T0N2eTDvEgky
         6LfeF+rrhFbNOO2sQXf+WgjaJFsOcgBaS5KhRn7K6zwCMuabtYhvgxVVMstzhd6BTTyI
         n5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729248; x=1762334048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0KeIVlGq15MElBeP8pO+CyR7dQzEqnN82GDubcNW74=;
        b=tOsDvfbGpk03rOG8a7MJBZOYKPOe6W80QXezEiXGU1pNdGsgbuGPwm8c5V9Wk/8or2
         S/nRQ9FG4iPGFjlG5vYe0PAkfV6vUb/O7rdF4RuopZ39cHl/S0LxjMfKX/bzndXaoAef
         2O8qcHMq8DXlOANSEfhrEychWFONZ4Ig78mM3OMS3ZoyNvrlYYuF6JXqK/vh6/ve7hqQ
         7M/0bNeCU0hzHS7QIGYHYKjIh4qwZRLLP1Z09/1py4gsuYxOtXv5W79P/aNMB4mBezZc
         afzalwB202HDlXWK8jQ6NjIWm2+6DbWOvD+e1qDQ2ElGCGje7HNyLmsR1whfSAexU6CL
         CCbQ==
X-Gm-Message-State: AOJu0YyRuYgNnfA8sgYDr7fqhrGqm7mopmofwWDhg/f6CBJ7pnPJQFKA
	hGuwGOjzqqCjcdBRrHd2NqlFgjlBITNxFWeJMUuyezUDud9yb9Xtn9XpyfyiFGh3FfyyQlXweVk
	CgKs2oYIRfnzJqKEufjRqFvup2yAhXf9QcCsH32RZHbdooYa56YcAPIIvVFcjjg7qdtlh
X-Gm-Gg: ASbGncvCWaGdJGYzxgt8Zl7aXVtZLLn817/MIVApokyvgqv+tYZfWz42G2P+6gg9emA
	kROGegN95Xq+XBTjnsThFdp2Dxi4Ps4SzQgb9KNswLA+v+KmPV+DeiOM5OLyZhmqVAvkV3wU6kt
	VViDPXxisaTal6dm6Z/u3iWPouqZx+xGdmrpDE5Uf8j8la+O3HOOKY8mQp0zVBNL9VoPMnjfA/7
	XYXyzOIWryi7Lfd0k045tyd1Qbt+SxnEoOGoAS6n3I9rQLE8NONJ9OCaxMOi6qzaDrWjl6UEgVz
	cChRS4TmU7tSeJBeYSvB4pWe40Mb+WNWSQ5gLz2t3RmzAxmt5IpN32zf/LqH/GovtOSNysHJoFs
	x/KYRuzSA1VbWwvpArjGt2mmDHVaROylmdB7SYi0bgui6MVBEvQ20HCiG
X-Received: by 2002:a05:6214:20a8:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-88009bc1287mr16767216d6.3.1761729248147;
        Wed, 29 Oct 2025 02:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFedfub9hPMXqka5Omkn6HWRz5eWUuH5SfzNJk+9Zb78dwYmTiFm8qVdmrVCzSFnA0a2DyWig==
X-Received: by 2002:a05:6214:20a8:b0:70d:e7e1:840f with SMTP id 6a1803df08f44-88009bc1287mr16767066d6.3.1761729247648;
        Wed, 29 Oct 2025 02:14:07 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85338663sm1360523266b.17.2025.10.29.02.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:14:07 -0700 (PDT)
Message-ID: <f062bc4f-828a-4a91-9257-1b1164f6df28@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:14:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: fix hwspinlock resource leak in probe
 error paths
To: Haotian Zhang <vulab@iscas.ac.cn>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251029022733.255-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251029022733.255-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=6901dae0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JRTpi7JZ6PypFw4hOZ4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: lyr6Pop5oq7ujAiqKrGDN8PuUiAK9Wws
X-Proofpoint-ORIG-GUID: lyr6Pop5oq7ujAiqKrGDN8PuUiAK9Wws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2OCBTYWx0ZWRfXzY+4yT95nCWs
 5E8xBPhTkzXkkc7uruKjTKBxzWI4wxDHhFk+TTe10DDRLJS+4NW7nzJ1Kjro3L7KQKaKrPVJC/E
 3ms3rzZ2oGXQmjisdUE1EMVdbYnk9IfduVR+PYG85iOlrKn7MHIvNDG/o56TSoF2RE1k27WRDKR
 YguikSo0UOKLSQESiv+Wr9vma7WXNVVQtnPau23AMAL3bFbXdx1daGCPNaYo5ut3Deb/9xoMD8o
 nS8y+YrecCrk4gHHV6j8YtU6ajMNul3nzxk4IaoX+nHw8A0Eu1jnQ0wSgMeX7g2HaMy4uRwpvF7
 MVVKxTX82+SfkSRJfvLVK/SIxahoFONkQDiICZlhaNksaNYjXjbSa7BvNIyyIJSBpHb61RNHpn6
 NII45sD0k4bK9F99pIWalZuSW7gT3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290068

On 10/29/25 3:27 AM, Haotian Zhang wrote:
> The hwspinlock acquired via hwspin_lock_request_specific() is not
> released on several error paths. This results in resource leakage
> when probe fails.
> 
> Switch to devm_hwspin_lock_request_specific() to automatically
> handle cleanup on probe failure. Remove the manual hwspin_lock_free()
> in qcom_smem_remove() as devm handles it automatically.
> 
> Fixes: 20bb6c9de1b7 ("soc: qcom: smem: map only partitions used by local HOST")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

