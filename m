Return-Path: <linux-arm-msm+bounces-76252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57FBC231B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BD07420F24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE87B2E092E;
	Tue,  7 Oct 2025 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kzvsv10b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EAA2E8B6F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855871; cv=none; b=DAa8fbQCkHsJMqRCTRKaiW84MB+eAUgoljk+SJVJJPN1rMqAU1RHdbYse7x+QI0vIZuBxfxDA4vdE7I583dw6+/lrd/TxCI3lep63rrh2PeiLDuj+n3OwM40OVyHpPgx54hKniEVN+P9YwMPTlg8GFicCxOKUppJHwmOnmKIaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855871; c=relaxed/simple;
	bh=eATCG2xeZAw5iz6G6tAxXnREVA/4UwP4qeT8Nc+cf10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNgMgRi5byO6ev/ZiXV5P3SgOlGD19bQKwy0x13uisDSVVQSDTEpjDJ4iGVHcQpNg+N+cD1RTQQOP6uRnWxklbrE+d0+YU5lTg8K1bXP0NQPKUuSoxGXYftbHI2+qNIyfQtW980cEVEA40GCA+LOXBTEWkp1PenLwXFxPUenpxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kzvsv10b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETIed016456
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2q74mSrLLOh/c/D0ZogrVikAVBufS9gKuTHbKM6spo0=; b=Kzvsv10bO6liXqbB
	AoOnVDQSrqQW1mg6CglVcdvqyXoGAWqVggANm2UckBTV6hKkRTE4Txb5MjEsTAwo
	ZjfdtdrJJPQobXtApXavU/MUbW1yFKdM4wVd5d9O6VjaItN2l7uVeZHzQfwzusdC
	T3A1dWeH6xjKxmxMxN3kW/o1/kjs93iG1m0fwjub2J7I21xPpxJjwjztiiRZqlb/
	O89s/gqSjx0VyVeiJ5MwmZ3IojpWpeIDGt+u7TeDxbcFgfd8mDiqzyg+BAc9boUX
	7esq4sdZvstOaHjdXyhGlR4q/PAtwBSoIpVET6rb7YbjylCPC/hiuJ5ThIVUQkg4
	Bwakpg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6abnjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:51:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso10418902a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855865; x=1760460665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q74mSrLLOh/c/D0ZogrVikAVBufS9gKuTHbKM6spo0=;
        b=Pt1L0Hhcv6YURMrqfYcPx4GFfBKRt+U2SkCgdilzZPVE/TIklxB7EEQEeGa7+ccGLd
         A4+cOyKm8oA/pdRqaGIdWcnrbQtZue5k9qz/kJF6IiFl2/AKOZ35plXFzH+3XTLzfB5W
         cCT6d/25E7OVEQJrHEBR2vUVIN7gvcT5JaHswWFZjjFL6dV95zh32FAZAu8VCqT7xW5q
         1XcCSnkKVJECP0GAARcmmYjMxF2SIGY3uygWN5xV6/CxclE9aiMm5Uw0DH4m5Oix3wEW
         5anLNK4qHylzof8JFDbiyF1GLmG9WKEvlPXXYwT/Tzzg+ojrbrSMWgQB5NFbAHQ5NX3i
         c9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY8PTZMBptF/Hm2uHMozgL2LKK+ZCkcNMwK77T3xq3+K28U9Re3lap4vIkbgFFkzfoQB7SiTtdCKR917Wp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsnwh5piw+0YXO46YoWlodOricDAArpSgH/1UpMzvHcZ1aaKYr
	oaogeF9kjWPVv/qbFGtZSiiKh1nrOi1cAZGxJeSYQL5J5J90kM818IdSMWGD+88sUxteKpaVpqV
	FaCP580HruAbJDamKXpejvZzRfmUTvqjHir5H2n9dHjxPj1cyPvS4+Ys5sMqtfdocQ1SU
X-Gm-Gg: ASbGncvhytgXAVGQlaDyHl+98jO2l+T4LLlD+ryYuEjyRm9bniVFhidySBr161cP8dJ
	92w+yVrk+SJVKT7NSaB4yCXIRWPpCWXhSPsMVgTjxDJaJgK7oQrQf7czMPrAyS9NfO1//5PapSS
	Feb15lCB496AYYImpaDlum6NsEOk5qG1NtIuzvdwocF6ekMe7MHQ+U69NbSm73QV93aVz5AA1ER
	KkFfskBgy3o30r3SsdVGuWGH02VyMgvgr5vfEwFQNLEGOLmgT8tpl0NoRl1PwKdDiWLATuRVSE6
	TBF/B7nxnQqs260clc6c/4Slpdi7qxYVC21/mvV0kYuCRIRyUKpnIl8L3KZg7eZISdcs2d0CiHy
	hWJpOvcn7hIjBUOkS6qI=
X-Received: by 2002:a05:6a21:6d8b:b0:2b5:9c2:c596 with SMTP id adf61e73a8af0-32da80db37emr244341637.6.1759855865088;
        Tue, 07 Oct 2025 09:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Qk1pAcv0B7eg6TkHXi2dwkaUi1KqbTRCXSpXXXF2Arv1US5Hsfp1aDj9UByTjuCgrlqezw==
X-Received: by 2002:a05:6a21:6d8b:b0:2b5:9c2:c596 with SMTP id adf61e73a8af0-32da80db37emr244309637.6.1759855864634;
        Tue, 07 Oct 2025 09:51:04 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205341esm16118369b3a.42.2025.10.07.09.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 09:51:04 -0700 (PDT)
Message-ID: <5c0bd33c-f6d4-4db8-beea-cc797bc9ba5f@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 10:51:02 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e544f9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=LcUbNKWctW3TofkTIeQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: VMg6EiNhp7Upnx5ZqxeBEeMfpyJ9AoCF
X-Proofpoint-GUID: VMg6EiNhp7Upnx5ZqxeBEeMfpyJ9AoCF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX2INP6sfCVsNl
 8iAmup6WbACVUXH6J/BaVWBjuezc/DQLT5JCGHb9vc18wWHggThFCAIuS5x/EbVBPPlyQbHGdFc
 Ejz3UHD9Rf5J5l8GRyoCu1IrBnMcTcHj1bV6VUs8fHQguJSzdYoVtk2bhqlkFu142neM88QgzkR
 uYQA/pwKUo0Mfzq7AOpBWpAFkrFH6KyL9S4ef4o+vb15pavY9CAPAYLUtmuW4opKS+xyrOUAryJ
 8gm8IvQq5K4DWTKOto3jjjsFYrngkuo5KSf9KWIf5M2Wb/hjAIATRQj8GNPq35W1v2qZrFhSa4g
 LLGXVB9LgUUpJ99VvHlF03izkZyEJ9k5qYmENDNyNELjQV04vpTOVzmlL14ifW0jdAW8PZI9zDs
 tH1DLTcjt2fFaoTCDKgOCKbJeE4VFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121

On 10/7/2025 9:48 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

