Return-Path: <linux-arm-msm+bounces-105692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FqZCMt0+Gk9vgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:28:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 855374BBB6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 12:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7627C301A3B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 10:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE0D3A4501;
	Mon,  4 May 2026 10:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATbPpfwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nn6Q+xz0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8536E347FC0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890304; cv=none; b=pAqeXRvs+7TBquebanxQ8V5SdZPKx04rRsJJjF0ZXviYwFim8FaDiKQbOB8BxjtNYHo1QDCbGfHOSItSFfcNrrYe3oasTbUxsIFAsb7i6uniov+yeBS+VC5YJytXzxx5w2U/dEE/sJFIHMZ8qdYdiyRi1/XPpONbguhWuEo5u2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890304; c=relaxed/simple;
	bh=G5UkDjvm4pGJkKxheq1dNGkApCWNOQfhfYsh7AP4tus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K56TFqeLlzC2CN3NAetKxxPa1qQ1liaAwmQLJ0+T+FfAulkufUtGM6ulkLagpohHH+SAKMkR8jtZNc+cmDTEPVG9cZkR6gsIVzl/Kl2JDhshmI+0SScxLj6x9JvEk4onIAtPC/NKXHJC2yrGRe5gnlCYVrzI0kwnGnTPxZKIoIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATbPpfwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nn6Q+xz0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fDYH3845811
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 10:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Qp2HIk/eByZ7E1zxRzJhLfk3lVphz+CVpO9GCAUHrU=; b=ATbPpfwv4+pYSEjf
	sjX06TgO62+XC7kzdsMEuLXrONGiVaPnR0yXxdR9UlUceSkSPNso4FNkvWGYXMDb
	sJRz7hjBwJqQpVXKcbpcP9AOhdBKt7DnwBQgQm4AWjhci+pyYTeGyvVaWpRuFKfy
	UCL7OQX/wDWv91N73YazpnUN7l6uHXO4w6o17zpOYoRdzbLJBScTDPnUtUrirkXx
	Y/0RxmUpdzj9hxxJfqa+SwofAVGGx2LZTALlDDFhjurlUZ2E+ZjjHwOSiYeONs65
	9ZdlP0yj7R/dtlqXG5zoHpaeB+8O/Zr5ts1kxSLbA3eqiaOyQZrhWVAMqaUWjk2o
	9aMJsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfdm3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:25:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eec753a7bdso140371185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777890300; x=1778495100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Qp2HIk/eByZ7E1zxRzJhLfk3lVphz+CVpO9GCAUHrU=;
        b=Nn6Q+xz0asMdrzL9amY/VOfiVzf4EOrpqoRG5LEpj5vmjJsO7Nq1PFG1Z2WwklW9+Q
         hj2iV5S7n220k2nKx4awa4T7jr85NuNrnwIZijq4l6ngBmDoPIvS7R7hen0qBS6abrF1
         8JpsTcZxFvgGLHm09xfzzEMFs08J9lt5ehebnwSJkACQFE/4IP0VrHO1+p1fn40U0NZS
         Beph4B/5dCcTu7gZFdLE84sU/QZutHrkXibgz4PkNkMlbyemh6n5ykmJtnGS+H7Rybsv
         jv2pf6zc3DcjC3sHP1GeLREsLIwmQdH0WpG4RyeUwZcaAxB+ajDoqxgxuQMH7Mh61ef7
         RM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777890300; x=1778495100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Qp2HIk/eByZ7E1zxRzJhLfk3lVphz+CVpO9GCAUHrU=;
        b=Wh+zhef21uEItBVbAr5HLKDlW6dNJibf5/p9URodfgNQWdMYzU9czOx/xJKD0CLcwp
         UHtKdHR8TpqJrW5xsEdIBnxADmL0qj4uhAJ1/Ah7182/w1r3F0Q3u7hHUe/YUdzbvzzJ
         NyxgE35BiFWja1zh6mGQNL2owZnJ7W5er3ecKnkt0iSNmP7UsG1w1ucp/AbKtEDxAT81
         uimfWxY2QRIMRB5GN3G9Wya/BhCzDIWIyFWY6e0qkT9HaW//xGhNtJZEvYUQFdFKfqqA
         OTmV44LMiJH8R5t61JPFlmv3ySG8KzCviO5xcmwbGasEI4w96nZ++2ntgHQxnvn14oZ/
         3W6w==
X-Gm-Message-State: AOJu0YzcKLyiL8xNK2mxnGtD38je+8IVKWMKT7aoBiZ4vOpRHea5YQKN
	3lEJsMc6A9MgUqryxR2LGJ3OERFZ9nVTzi4/kE7Yv+2DFcQo7dk0dgLLCAaDtFQb6QkcpQlUky+
	8EqWr2O3YL9FchHe02XHjVXzyWx9Ue9SL0oi2qWdBPdLwjKQVTlO6NyoX0qEvGHWYZIqX
X-Gm-Gg: AeBDietxED02T1xWmUZWKgRfx5Xlgd9fChzXy2nomCXnulIaviJ3rG+9DZlGjbkcQMl
	ZRKmW1hTKEIdxB5D+x3G/uVcX1pH7GK8lrffhCoNYhYdk67PreWc3wkwIuJouiIn8TsdtVQqx9/
	gy/31OUgP05I651UZn6Tg8w3b/LF0K3a2VNBIHJdCexlFSIQ3LtKl8UsFcVQIbqxCoLEgufj8Er
	12u5NZeyk97MsPVsbX5ChMg7iPSWUJQx2irk+WBsiw19lIkJdepPVpkwaOEkfyz/B/qeHd3rkeo
	5APYqlVhVZSIGD8s0PY8q2O9G117ym+bRT6dd41FnjeLnS2VD77JJZ/a9dxS5m6DHuZMhvYOLNe
	iCimEkdiDo9agDmRT/3ufG+ywdOKHaXLH+d2+p8XNA9orEEHeTe+tijgpJDbccc1ji+g1jPgDfI
	c0pHhCsklfq6NVhg==
X-Received: by 2002:a05:620a:1a18:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-8fd18f1e593mr885254985a.8.1777890299994;
        Mon, 04 May 2026 03:24:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a18:b0:8f8:6b36:fad3 with SMTP id af79cd13be357-8fd18f1e593mr885252285a.8.1777890299564;
        Mon, 04 May 2026 03:24:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b85e28ef8sm3210954a12.2.2026.05.04.03.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 03:24:58 -0700 (PDT)
Message-ID: <592fc8c8-7389-4450-804c-10b163dd6532@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:24:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Add support for Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-llcc-v1-2-d7006c899812@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y5u0XgLMFYeGg7S6FJbTMwLJt17uh9mF
X-Proofpoint-GUID: Y5u0XgLMFYeGg7S6FJbTMwLJt17uh9mF
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f873fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Mw8ZFISzJRBWggUDKekA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExMCBTYWx0ZWRfX2ChpA7swAJBZ
 bJz5AFV9IzbnZadLCV+Dl3NmFhyT4hg0cxR/m8LaApiE8S5CreevW+5jlV/zULOlzEMPhUVss9u
 trTuXFT9yI2u4SAyoSItdCHBk7yTkA57gRexQYAhTvEItWzHvXgDhlNOpPrpEjKyVvUNmqIqASK
 IqMJIv/JT8uOU8DxOy8he0sVqRt0z2RzQQkzi+AH3Qb6JBmrV2Y6E4GiomhVWoU2aiRqREUkWq5
 atFfaaiq8BCv8c7Flnm/gbGnImVqpwwFZC8NKLuXPx0JpUYa1uc1cQ8fsnr9Ui05U5YtXz+K96z
 Xqw+BRMebMODb1mAsJ4amwAYawUf4A+Iz3aOymsapdar8HGlDJVvbFZVn38pDtnT/XgX/5CN4FX
 gw3uFzGiDmzbn7pGF3iZSjwZWd7L3ahNPyfVwe10Aobvoh+rc8VqDhbOK6ULQpdnkvFN+lVqW4a
 5zvFr9skukP8TTtC7wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040110
X-Rspamd-Queue-Id: 855374BBB6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105692-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/4/26 12:00 PM, Abel Vesa wrote:
> Eliza uses a 4-region LLCC register layout made up of two per-bank base
> register regions together with the broadcast OR and AND regions.
> 
> Document that layout in the devicetree bindings.

:)

Otherwise, matches the docs

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


