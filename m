Return-Path: <linux-arm-msm+bounces-77054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E08BD6A93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 00:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F80C4042CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 22:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4CF1FCF7C;
	Mon, 13 Oct 2025 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFZT0wOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CB238C2A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760395706; cv=none; b=REnQvFmGKZq9WtjhzuSz+RIneuDGX+OgrxiE2s2CNViz9ENAgOQvESQaNW1i1CXjpdNOP6UE96zkS5nVahmtr56cAnZGCXpu34gTyjKlxEWyBHr8iqcLOo0L4xIYRRnTCvly8bG9qGGGiDtoh3IHrmQ11dX+sWM4BWWPOy8bFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760395706; c=relaxed/simple;
	bh=EGjYs6mpo4oUBahOYl6sqLEZI7phhRQO09hcfcXnPeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoUtBD9jhfyzUVoWhiroWW28mq9fOlh8IxEqcdzr8PD/x2InMVMjOxNsrwUAf7Z4LsaqypyqzlxMZI+arMeRop2kly2FpWhyfz51x3hQ01++X73iB35AUce5++q2uryQ0MZF92XGpyeSJS9JiWiOVpY1CaGR52nYg1sUIuqVi9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFZT0wOZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDKW2020990
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzaxprL0hy54kueijR5k8+wCbR88Om596F6g5ZjXXGI=; b=DFZT0wOZtLdXfJ70
	oGrw2zRjnFe36NN69YxLD0jj8U2JkTYs5rpJsCZEN7kRSQDOe/iYn32SoIqD6nvA
	zU5pkZhgMPONgxxah0/8AiVqiwOnRd1FrvjglSH87M4Ievb9jpZVn6KiEFA4BFZh
	DNzGo1dPGI8WqhZ7+BbWgAGZfQjUnlz3Xl+8iFXxMnMppb1R0L5BummDeEfP3MEc
	1q7DWRvJuFSjEPpysx2ngyEi7th9EvD17K3W4RIBw5rMS+lzUDtHoGqEiUGYen3a
	oJEM7PM0jTAAzT2KkSdEL8zfylt/ycnuC42xFpkcyjLp3q9YDCKBnFo13CM1L6uN
	eatOPg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8xfqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:48:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb2b284e4so14317757a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 15:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760395702; x=1761000502;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzaxprL0hy54kueijR5k8+wCbR88Om596F6g5ZjXXGI=;
        b=fgNw6Ie5oaIKz2v/Y0P5vcb/GlPQxQi0a5w/puNHJhnjQisdJcQv0SrmDNvAzC9UYb
         f+ZP+VfG+BINxpvxySkCYYpp/nIOUvtC+3BCeTWLjKTz/0JGJtwPNsWw4wI6XgfFC6bb
         IOlyPoYvU+ouE4tWiReHMgSE1qTeZof45ixnMFrUbjp7yjE/kpqB65Jc0ievkcN9zqNT
         SUcRFgGVR2601F8JhOz1Xq3mQz7z2utjjKbDif4d2nAm1wyHGrPiVC61WXEARrLZPw6R
         mTwq6z45wGlBe+RbbL8a8krGyDtzOhjMH9noQ4CN/effnPMxoopaMJsgDGSNFMQfj7TE
         +Wvw==
X-Forwarded-Encrypted: i=1; AJvYcCWUrJo1AjP6sPMw1D5YuwSODAB3qW7X4LDwl0v/5e87r/vf5z3K6P3K3tUUiqhAr19sz7pjQ3d9aY6yZQM9@vger.kernel.org
X-Gm-Message-State: AOJu0YwLD7xXFutYcmY+2xAePHf6iCvk/05sDq4S0xTBFr7Jpx9vcf3V
	6aaGlkBC7A9eXb1duG2MX5hUJ0xLTwCkB2539EcBo88COuU9ehgNMFxcGqfzQ5VY8tppjUgmCkY
	m4wHyYSIqH88+4jfs7Wyy+sMTHuyU0Evam0cTY0G8vwmow20u/0tGPioYf4lcgmdlTqzX
X-Gm-Gg: ASbGnct/09RbAAyVOMws47/DoUdQWpgOuuS45/lU/wspEqbdF43JwHLjwVp5Obqw9bc
	dH/6ZHdRn4IqOefAgfHPj0JzcXvhQ4VOnzSdDkuehp0MhybhO1471xQ9AXyUBwjvlskGqnU+2nL
	2Cghfc5tyA0rfh89WeOUkiDIvXJD+waPdyPOHBhjONPCii2A7Z9+9rG3sCHD8cvWUZU12RtqQSJ
	5eZwGCNMq/r+neeAXtkGkIhQuGEt2WlXaAr9UOGgmZgIizgVo2c1G8jkJ9vXTZR8XuDz1r+XFsg
	F1MTvPZ7AxT8tkUYMhwGKTvqLHnIArRMOfUL/MC1QppoBtcSwtWN2GJnnG8dOIO/KgfZtlrZU7w
	ag+n2xdMTDKiWJFSq7bqtD6FzBv4=
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id 98e67ed59e1d1-33b50f85081mr30999004a91.0.1760395702285;
        Mon, 13 Oct 2025 15:48:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+bBCTiQKDvO0nij0dxpozGC5LIKm6Lol8ybZt6yT6NvS0+WdijGGHZT2qZ8pvIBc8MN+PIQ==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id 98e67ed59e1d1-33b50f85081mr30998982a91.0.1760395701899;
        Mon, 13 Oct 2025 15:48:21 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b62576614sm13291419a91.0.2025.10.13.15.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 15:48:21 -0700 (PDT)
Message-ID: <e9b0bedb-f5dd-486e-8b9e-43e754243eb6@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:48:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Include signal.h in qaic_control.c
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OUA_agrauBlYww1483tDsJEvxG_Rrg7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7DjEh+xvwhP3
 8wIitk1r4h6ZsFw7Z8HKO/zKfD1plYKfpQVASb0YYeTDtd7jVht14KwN38vVY2xo4Sz5epJcrmh
 sUAWCw+yykH2y8O7Ay2fOXKOtfBXQudMtqCkp2QEPC/S3OWDj4NW3/SoBLroSXXf4UTVUr68iCL
 S8MNpVtFlc5slqjWqKnGalc5JF5NAys5KRAEdl9H03cDhsDBHjrAX0rPbeHqfaRsNIjhK+oPems
 VNRfjNxkczVea2ZbiJEVWix8eT7zlaNRMcUyqB4zYGbcJHXH7OU0EMeMmBcYJk7q9i9Oew/f5cD
 qvCT0ULNH7xmt3+adRVYH4K3FdJMbhlGbLZCUHqIaBYf3gGa4qmFb1T2R8E72e5WSuRYG9Wsa8n
 Jy07FVo9suSealsnrjE/DgiKkglw+A==
X-Proofpoint-GUID: OUA_agrauBlYww1483tDsJEvxG_Rrg7L
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ed81b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2vv6iFeKVT2olVQFumUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/7/2025 8:45 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Include linux/sched/signal.h in qaic_control.c
> to avoid implicit inclusion of signal_pending().
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

