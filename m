Return-Path: <linux-arm-msm+bounces-94300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPYtCGVRoGnriAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:57:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 831921A71C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36AF7315D50B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 13:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9256F399009;
	Thu, 26 Feb 2026 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7Uchech";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dyc09knd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4637AA71
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113816; cv=none; b=PnvJQ0Ut2YtERViM9MRD69ugjnd+UZvzvxsXNE79PsUhhnmQwOOjd5ZSKQgJsMgD9nMfNwRstGs+CQoIlKGPKusH8DV/Qgxj6i6wsyQcyRUkup5/E63VQJoz2eEd3Fd3q5/dMWd9XAMsS0lmnEGcKGI9Gt4PNuWNiRZD2CjuEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113816; c=relaxed/simple;
	bh=z5NZor0z0YEDs/FkKKI4jhB+YbXqvgaa9KMB5wnnxf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klMd6dizOUdTnZLFAL4RhFDnihJde3u3ZSAWIQM1IPzc5Wd83lYmWJfgRh+09pG5KUuLLUw2AwGez8bVtsdO6a+ZUY9VwZnu4+WDt5UtcnN9gs6nP+dIhG6kjQZwi+4+U/7rEV3ox3Vhn3yQSU0pHwFDYyD7AnGr9dzLaR2d3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7Uchech; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dyc09knd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL4UF3747743
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXHcCUAahDk7OE7ASgZB/CF3kj1ncUhrWTqj6TsjORc=; b=c7UchechqG6CD1NM
	wjEMwQlmON5wotQhMhxrT2jKGHwqAWeWazIRbMY4Nz2Hkwjwj4YhxDGWLDWxjLbD
	T28WrWdnAlpZP8V4RvcgbhkZCnYp0klDXmhbllZ8C2q/nrj9sZkEZUFYf0Cl+Nk0
	s9NXVTs4ctvye0E/YiF9cWFxtrHtfgAsMbgbLmtqtcS6EatypXMYnwuf/g4k87F8
	vDc7ps6PMw2qFBajYZFsHl9l4+2KlxgUrkXdHpB2WbBzDRv6THo7O5+awkGSTHJU
	bWmu0/ErKc09mEt62PVCB+IDHL8wlUxJqtqmfeDGyKExlG8BeM6tNACay2ZINkpp
	OXDCVQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj559kbp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 13:50:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899b88b0ec7so7815996d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 05:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772113814; x=1772718614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXHcCUAahDk7OE7ASgZB/CF3kj1ncUhrWTqj6TsjORc=;
        b=Dyc09kndAXzNy8WVDUqJfXF0IorVIN1hvpeAxODE7Xf45FDLSt70rXsdZqZeTAAf5p
         2M+yYcCFahDLDEvQ2p3hAKBtiYBdDeihlARSIzxSkgKlMewItwyKMMPMSMH/Qeikp59Z
         82Cf6O8HNDrc0kRSFFmD4xR8uUdctw2mw2JRbzCSjsomLUwZS+ssVXsLKfpjmplhnEVG
         Jq3VKzE/Ah/3FdBciUhiAoW7DYJlzWBdjTSdNfMKrVi8z+zDEnCa7JXrvWu1heO5areU
         4h7mkjXBqgvjnpKZrHxewe/V8T0pnZ2eBkrdOEsFQKltea+C7DHRL+nBCDpA5ffULhm+
         PR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113814; x=1772718614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXHcCUAahDk7OE7ASgZB/CF3kj1ncUhrWTqj6TsjORc=;
        b=ZMJowy7PF69VTb1bvuA9IR/X3o94CJDR/BpNxluuxIv+WjbXHOJfAnxa44zw4HfQco
         oJYIw/R9TKU57MzY2GB2g/0kbUEhUYL8LTWIXgAk9oYzEEenc9jM/NKdaa9HKpIhfRhq
         67HBt0J5g0TJDLe0SZGhOigujLlpdu1pg46klnew1ROq8IH0DqpAG/oY/YyJ2LJngIe4
         VoA2z9FssvxTakLiAAWOaVxqX0YmOAEXvMLsst8c/dLS4yp/JYKxM8GpjGbb/A+VsIvu
         up1GuNxxBXXOcRz67W0zyuihsayfmecsFrKjd+c+r2PfZH5ukiLAOT0r/0+xfWN8ivGU
         ocEA==
X-Forwarded-Encrypted: i=1; AJvYcCWST4ETUPfLWuUmqH+LJSvG7u+jq+w8Ngzmg24cONrPCfY+9NandKVsAaoLza3xoSYdr5fRYG0xP4TYTblU@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSpbiiLRrWQMxSly85So5D8AwA3xQ4CeGn/gu4QjKZznSSAVU
	MbAP7V/gopzUmFVpxyVsH6SZ4hG11FEATJzSCzV3S+ymw3i042woZHjcSpdLHvAiRcmZSdlDsrX
	PQFX8f49JGWf8u6BRHnGMhDMBRiLthjItsgacxirzm6DKgwXJjVIuQVjEum7rZ+j5KLXO
X-Gm-Gg: ATEYQzzh1LQKLcEB4hHAmZEN5ccv5XJ97tzxBv2pSxdz4CFWB9ABhi6Nwfy3ZBah1vY
	DLZvciLve1UZ6vB+ZjadwY1AgPM9+CeBSh6E1xgRHFFlFglDnwUTT9C1HXokW87UwWr8/cdPiB9
	N1c1r9tE45GAb5vKlh3oTf+AIGxXc/EfAaib9Ky2S7+MjavZ4Gsp3LU7TUwivqt7PJy0SZ7sGgb
	HBFzPjOBxvP+w7IsCYeI1ZT/aCmTqBsltUhR+4U+hEVI55b/Kiy359cJlmUlOSFkbYIjfnCqH2L
	Iuo1inYS293K1eVetVQrmr35NIUFd59gPItXUkJnr/Jz3KSdow7XvPCpciWrpSX0a23pBkrVLRg
	MecyVVi9EUgqANFlSIkD6SFaMvPM9zXimMTSk0SR+ltPpcFLtYg7yOKPHCyZfqq6oN2m9XgsIt1
	WnbQE=
X-Received: by 2002:a05:620a:4544:b0:8cb:3df5:4b70 with SMTP id af79cd13be357-8cb8ca1a960mr1997991385a.2.1772113813497;
        Thu, 26 Feb 2026 05:50:13 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:8cb:3df5:4b70 with SMTP id af79cd13be357-8cb8ca1a960mr1997988185a.2.1772113812984;
        Thu, 26 Feb 2026 05:50:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec4426sm58256666b.56.2026.02.26.05.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:50:12 -0800 (PST)
Message-ID: <1aa1bf9a-ee4c-40a6-bcd0-cd3866415663@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 14:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Populate media hw_revision from CAMSS
 resources
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260226100444.857406-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GPhCbV9F9MWtsUnUMuo_SyoF6r4P0If5
X-Proofpoint-GUID: GPhCbV9F9MWtsUnUMuo_SyoF6r4P0If5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEyNCBTYWx0ZWRfX5Yj60+Il9RUG
 qrK297WxLOSsHRhfyM75pFRbPHn4I9T7kujqYarmQgDu0+wD3uO7k6IW7zK4RPnKiDmIE5x8HQP
 sWW6FkMaGCTda4FCqnRzQ98B7mO7qOKG4EURtKX4bXuElz5J88GscTyaLPf4B+aGaUWYbrR3QgX
 OY2Fnr1vBGV2F09Tu2RT3S9+I2yb+fezZ1AARh6ls3/gGZm0vhzJn1Jt3UR8IYWw+aBXrKbnFn9
 +dPt6QOgQqvOGlZgQ86TRzSSXlWrdd2YXrUCkMgH68xMAaALfk9nRZQQJgEhPZgU3aa9ZXb2zFI
 tBKhCPFupTeeuBmqLA0G/QfYiOs3NM7Y4rdwF57z9r/YLJ/Jejkv90It3MBhZovqCrn8fAdmZ/6
 0BF/Qh5BygL3zYirYGPUJ+/lY8v7QbN5u5Bc8xOgu+wSfLCjlL5f3qN0B+xLb6ZfhBqmpZ8J8+V
 Q9Hj8ZQsSLFxyC7sQMQ==
X-Authority-Analysis: v=2.4 cv=TcybdBQh c=1 sm=1 tr=0 ts=69a04f96 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NFWZTZiHARg0oMLVeFAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94300-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 831921A71C2
X-Rspamd-Action: no action

On 2/26/26 11:04 AM, Loic Poulain wrote:
> Set media_dev.hw_revision using the CAMSS resource version so that
> user space can query the hardware revision through the media
> controller. This can help identify the exact platform variant and
> adapt behavior accordingly, for example, allowing libcamera to apply
> quirks or enable features that cannot be discovered through standard
> V4L2 or media-controller APIs.
> 
> Reported media info on Agatti/CM2290:
> Media Driver Info:
>         Driver name      : qcom-camss
>         Model            : Qualcomm Camera Subsystem
>         Serial           :
>         Bus info         : platform:5c11000.camss
>         Media version    : 6.19.0
>         Hardware revision: 0x00000001 (1)
>         Driver version   : 6.19.0
> 
> Note that this may imply that the camss_version enum should become part
> of UAPI.

Wouldn't it make more sense to populate this field with the revision
of the hardware?

I see that CPAS_TOP has a TITAN_VERSION register for the newer chips,
while pre-Titan platforms have a version register at CAMSS_BASE+0x0

Konrad

