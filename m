Return-Path: <linux-arm-msm+bounces-77060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F77BD6BF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A9824E0589
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DD6262FF8;
	Mon, 13 Oct 2025 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASZkRqzq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E891E9B37
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760398443; cv=none; b=YZsA8NzOe8G2BDiHjydrnWgZWAH6jJuxdoy1e0bAS150ty69XO/lPoUHt9GJNACIGhrVBDm4/9OjZcMtceSGaeJoea/wy7VfxXSkoYP6uGua0R1DFbvHrNrlGrwQkR0UYXhXNUnf7vooFeATUYpU3DNrcjljMXmM+UKgvTSlA3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760398443; c=relaxed/simple;
	bh=Nf74o4rVCIFmbYMQmgc+aMfC0/bLxr0oOh3oU9fi/vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTiaq+SzATUQXIw4izmp+1rj06VhMrr79iPv+LI206hVy6myZW7D3ceYGm+rW0SNw7VDTGc+vUgRWEEBdCo9rhkIUjjA+52ZEW0Hug0nRmYAx37E6JvL8dfi1yqCdpTgHeyJ0EPQiVX9HnHMzTiC4+Jo4QXgUk29rED7LYqU8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASZkRqzq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDAqG005682
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ns8DmaMxKM88jNPuqvXlj9sxBNI0TnXoXLNFqhX1m/g=; b=ASZkRqzqfoivc8wm
	DkHRpTpQwD/5O+9QDLMgSJSFty3gyHbR5XCWq3EwpsYbQhOX20WWjIET5ReZpvG7
	4O9tGR2AlFIBP2VIWrLSEcyLSnzGJTE9mNsYTregvhYB2U7cFSzqxMzBvkO6Sx+7
	/up3be3VRy8N4RtqMGX6UQAz7ZEbSFHsEJVNAVkVWIBa/JCRjEzMmrUJtbJmR1lm
	GPtpGVyzJ+H3ZlfWNyJa/zx34jTNz/1/YuEV58S1DMOe/9an0OdqLSvXnk2fbQY5
	40nb81bd5bUwLL3LFwSLxLbn2wm80fL3YRgblJPNg6K0OLWJY9ipmI6bhrasrHZ4
	h+PP6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa86ha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:34:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3324538ceb0so14256546a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760398439; x=1761003239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns8DmaMxKM88jNPuqvXlj9sxBNI0TnXoXLNFqhX1m/g=;
        b=Qe/D7zb9letNAJZWWuzHBSVYsdqdpvpjwhVOGZL+qcZM5nh3hFz+R0jHNEKMrSH6AB
         ln0wgPZEhPOgkbXvkS+mKndftd7ausXvE+v+GVPd3OjcU/oO8scNPsELCGrRuky6tUJH
         jUlwp66rsDzlCYjR8pzkaQnIwdLCc7W0RRDlYk9Ny1Lfo5ahmzazoZoTk2y6nwJ8ECLc
         B0Li9CpHzzX5kk31nrwnrru9tsaa8AeixhJiQlLPrC0rr9Wf2AHg0tWirx3+hv0HLV+g
         E0eHwdNjt9QDwrzGluZkRmfyE3uPhPexEAYBjBp0TNdlXSb0RpZKO60nEWkyHIl+5Njy
         ODww==
X-Forwarded-Encrypted: i=1; AJvYcCX6bETwUAiFjuUuQ0Y5IVhnpeWo6FmLVD1yf/Ut0g1cqeDQP1jRAzm3Loy7/gax12Mc0jVgqjZUncwvaZUW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlgqp0JVg1d+LhXeh9DtJ1n4i4sWhT++dfNkZFunK+pq8xxElK
	bQ4H75cl3lYiPNSBI8iizQMMzVX/3W6azYv3knixI70dgs8ZLz3Qvat3lKOfFqlgKUAKQW62lPi
	uHb59xOv7adUb19E8nPB+s5QzrEBy1oQOoNMUEjXKP9Jfq0uvOcLJi5DPaIuG7gPRZr0l
X-Gm-Gg: ASbGncuwdRzTh2xKK99IJtTqYQkTsoSjThkvHghyXAAbrJfsszsOWYY5Ahf0yPlQ90F
	wXbHNnEgLZhHVtBO8XTbsy+rou1JmC3IEtWDULK75hxvjJV4U5y9+UMEAwmn6bFQhrZ7mLOwJOl
	SLfpSl7/9emNfUa0x1QRXHXw+CTh98e3feE4dmMomOKatl93xG681bgJ5YW9TqZAWILMqaV5u3s
	we0tXHzul4StZIjv6kFq6H0NU3Ebs9SuEugegn+NZwd5lrsM2Axi2EMHSniAzU3wr3Wc13Oe/Cc
	RjKt5OnpphBTUCY7uaD6qKh9vGtntEETjeHfKiz8+kfOVhrUduh3qAzG0kcLYrq42Kne88IWR4H
	Geo2CbZ8uBim1gZhGJ/v+t49mZHs=
X-Received: by 2002:a17:90b:350f:b0:338:3d3c:3e03 with SMTP id 98e67ed59e1d1-33b513a1fd3mr35444425a91.35.1760398439222;
        Mon, 13 Oct 2025 16:33:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOG8Xmn6oBweYzW940qppsZEyZaNm919sf9o7zhUhkiZD8VS2+CVe/CUNRIwzVCDTFez10uw==
X-Received: by 2002:a17:90b:350f:b0:338:3d3c:3e03 with SMTP id 98e67ed59e1d1-33b513a1fd3mr35444405a91.35.1760398438792;
        Mon, 13 Oct 2025 16:33:58 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b12756sm13578133a91.25.2025.10.13.16.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:33:58 -0700 (PDT)
Message-ID: <cfe0db30-7669-4e99-a084-ff8aa06ff05d@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:33:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zx0_HQgm6H-Tfw-wdCZdkZHQYMuB03d4
X-Proofpoint-ORIG-GUID: Zx0_HQgm6H-Tfw-wdCZdkZHQYMuB03d4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX7yirnkmmZNfC
 sHs7GkeWzbU4StfNJhSMLlru62ztvRkeasf5I80E1fYlG4k8r39qqkGQjbiTFqwWz/BWc4UQvxs
 65coqFYIchbCNuOzyADbGKYoWRWURnaGCVGBzrWc7eDPZ+sUFKG44qudxOO03cjvXTYkhzKdvmd
 3Ma3JVdzgRVNS7+AHbSKSTKlAOPT+/y8FwrgsLaCuN4/iTACJ28K3ssiW7VJkJt28oZ6/MrQ/uS
 1fgDI6LBPdU4lL2qTFOsSAbE96xgaP3zAn8JQsuXoKZJAimWNFj4Ql0MDErLH+OR4APzeVU6il9
 j1ixH/So5K2FgW2oZ/vYVS2NAwBc+iAe/NVzYb5kDyV8SUvqRp6cOpghKncigZYbb7GLRtMpWX6
 eve14wg1H0mPCJO4Gm5Y7j6XoysUYQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ed8c68 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/7/2025 3:40 PM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.
> 
> Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

