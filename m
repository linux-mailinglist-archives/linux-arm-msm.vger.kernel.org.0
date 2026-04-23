Return-Path: <linux-arm-msm+bounces-104228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKSaNdTh6WmTmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:09:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE344F0E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3906300B585
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE123E2743;
	Thu, 23 Apr 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAlzlO22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4b9aATX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9D23EAB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935372; cv=none; b=H+Yn+0umQIJ8gRP+058r/XQdHm4g9MgHUJm0BOAN2BHnYHgO71bxRI5RxGw044GlvPjD9ytiG4gIOy9r7YUDZdlvRHysO8YzBdhCcDTAmAnab3KtwHSy3IHrQ2JicrYIDKGVTPPi3uen3yrjNLr77XQzXYt9uhvO0N2nY0iZZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935372; c=relaxed/simple;
	bh=c+zQ607ek0z0r5Iq+EEbFYzPCG3ECLJv9UZ5qo4VOXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQ41xsK8sast4fYZbOqbO7OmzWOHFGz4Ow0HfU7+kB6boTboy1SqWIJWkT76wUrSBIRnQLsOoKExiFPXSG3BOCuUro5hIdZEkL75LE0IwdRhYMWcqy+fGHbz3rBLtCBwQntbc5Eh+b9eZD8rKx1Zh8Qmjrd+SjWHP5AGoK4N0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAlzlO22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4b9aATX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uELx4177852
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VKUxyYhYoKUUhVjntxIRATeX3jIIRiyfX4vIVIvtVCI=; b=AAlzlO22d3DqYzTe
	0h8ABowdhqiXTFnhiJtqk0Mzo0V76pkr1cL89W3oRKFq+AfjDn2AI12mlIc+VrNy
	wyUbn1oAweZkxW2nPoGevLIkXokFg8QKpOn5gbpmHejC3zMp26xAHg5R3830jiz0
	EbFXQF+8qw/YoCEfglG1zyzFPQhRAAg1wtr8ctz21kdLtOmf9FkowSKcnJswDl4+
	SdrSkQ3XLNGF4Rikg9sg7j3WgHHdhp18gQcSZWnaqGlinduIbpr6E7b40l1Ey7LX
	FoprS2YNn7qbLtsIXftkEnw2Vs21sE9QpTdFMmCpoaUqO+tsVM7Kr3yYaZP19603
	Hn1ozg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h7b3qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:09:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ed279eedso43904365ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935368; x=1777540168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKUxyYhYoKUUhVjntxIRATeX3jIIRiyfX4vIVIvtVCI=;
        b=X4b9aATXP6WtOvVO2fznDaBFINHmgHk2zboAkohvf4DY9S0Azf4btFiEU5zXtbPMAO
         XVvdrlSIoL8kIejZ6PPPxPKP7ySZXaNC1FxZHauPtWcBb0Noej+ra3tvSDU9jVyTUCNr
         mT7EP0QoKyJybIQfA5FtU8pguUSf3soZVLIfcGOprjWkYY4NwgtV3Vh4FDZ9/MRyQoYz
         NczZYJMdHCKnLfkgAAag2hnw1Lzc+ywE4XXvbbsreYbxT1CcE4s7nuJJJV8Q1gEsNokj
         FTq/P6WVugE+EztsVUN3I5GBg+8cmAnjG5cGqBtDt/+HrpNs1+nMUpX9rUkEooSkRLqy
         6sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935368; x=1777540168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VKUxyYhYoKUUhVjntxIRATeX3jIIRiyfX4vIVIvtVCI=;
        b=DL8yFoh+VxpyjuG3JeNdgAMjJD3fWjQxukGEeZeyLJdOI3FjZXeh/gz3vGa9Kn10qK
         yWsvVdaaNADWnf/QaKmazePMuyAVpBjlw8cdLry3vlZecfbLKd+qb6c51pNGEEE7SBEv
         1QyUfDMEUQFAFcYqtPiMuVHBYZN2fJfab8mhNgTYbUbGCGPRi4LH1IerEfC1AUBNrlhs
         1s843Lwdbp0SfNmoiY90m8GfdIAy8RZmoqtxUL8jh7siPEZ9PeNfs9LDiCc3/ovsoj13
         004G+3JtQDjgNV/mcfH0QRe7BZJm6l3shtsVpe4mU62sNqC1Mp8A4gzwbN8KV2WGR+LG
         l8Vg==
X-Gm-Message-State: AOJu0YylUipCyhZmLlefXYiEC3po8+MXSkTVFJde3nP6cshNxdNOR7Vk
	A8wTdOJ3DQvVZODTjbgcTyuc4KWUk2psqeffZrhbnX1nQPT3AmhgZKt15YsaK9D5hPmmldBSv/4
	tLvVJscLmFJ7IE0N3xyyK10xuadIme7W1jn3Rrev+EIR8PW/nMDjvun2wmlCC8pEVc4tQ
X-Gm-Gg: AeBDievOqy2Q1eCkU07H8rTPCmcgpmr4fUMPLQqLCDn8oliLYdZ4EPEvd2h65vtCDpf
	chKOWSvBqoL/orjg06ncKcSWnc9ESdVSbLyj+/0acw+51MiZmGE5iGHivyt+Kv84HjyoEqRNRpi
	U1pp97kyA8GiV4BFv0E6mOwk8KlbzbO3DK6CM81U2nud5aeLIzMi6PApBiuQBhCUBdwHx376C0n
	M4WAk7T/vXDB2nKXyjiKx9YJHS3tV8k5kqAzflk/8yeybazbm68GNWVWPCpIxDEElsoKZs+Ex2f
	9ywUZZtnxyl53ttF6MmonzlbrQyqiULnaN3IR70asgEDdiSE/qOZkTgkx/l5unxQhm1YMwVgXCz
	x5AUots1sc03Ho7W+frIjkgAofgHCmaOoqUsvssmfsWwh8GC8KwYRJPMnjJV6
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b5f9f3b367mr292339825ad.29.1776935368306;
        Thu, 23 Apr 2026 02:09:28 -0700 (PDT)
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b5f9f3b367mr292339585ad.29.1776935367828;
        Thu, 23 Apr 2026 02:09:27 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4cc47sm193066335ad.82.2026.04.23.02.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:09:27 -0700 (PDT)
Message-ID: <6dd5924a-7ec2-4080-8666-b8f06d103563@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:39:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UOIr8sVTXQs1Z3ZE-GXLWCVezNydZeRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4OCBTYWx0ZWRfX6zeC6IymbfG5
 7mjXBihokTxmJqwRXmQGd0bEYVy7mKfMJq3bPR+KdrZWMi9Ln838RQSRIxj7MXn+EcGV/faXWKF
 Xcu3KnOWlR7OP8FWifz3uI09FoFmYWnEtj4zzcokEqTCgYdRd7PyfB79io5mTTYnDjhbxN7GANi
 PqvU8q+wt1TDuMDnD+Yb+yf1QGmahbRB7TVjZ096NzKbl4ltnFE6oOUk9AvydLGblAmhNX05z3g
 xGRoUbJ0UhyIIq9Z5/nxMfBtJjE8H7Nw8QFDR55pnDzHpasN9eo7Z7H27yDjdIeH6CBg+2Vp27K
 I9DBgJ3Ek1HgzhsY+gsTcYsKtoQ/m1YyWplZwJrNDN6EisQDVS4UYMVoBJ+wTEILP5m740SlV2Q
 7W1KYjpuhEFI5fQGa7QPeIwIgQX4kXoczatU+Y6jwt7knO82a/IlQWq1A/hXVgyX+2SIAZDnLwz
 z8HdmhPt7IgBaxHDsmQ==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9e1c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gv3PURsRAAAA:20 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=gFZs_BQnlhRWUWx4DtgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: UOIr8sVTXQs1Z3ZE-GXLWCVezNydZeRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230088
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,f6800000:email,mainlining.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104228-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37EE344F0E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22-04-2026 21:09, Nickolay Goppen wrote:
> Downstream [1] this region is marked as shared, reusable and dynamic so
> describe it that way.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
with fixes tag,

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..36b419dea153 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>  			no-map;
>  		};
>  
> -		adsp_mem: adsp-region@f6000000 {
> -			reg = <0x0 0xf6000000 0x0 0x800000>;
> -			no-map;
> +		adsp_mem: adsp-region {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +			reusable;
>  		};
>  
>  		qseecom_mem: qseecom-region@f6800000 {
> 


