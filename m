Return-Path: <linux-arm-msm+bounces-114180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L4scIJJsOmrx8gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:22:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1387A6B6A99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:22:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QjyLGovS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G4D6AHLn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114180-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114180-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D19730776E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B623BE156;
	Tue, 23 Jun 2026 11:22:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEDA37C0FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:22:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213748; cv=none; b=i5jzO91AtWpEXZTr9VchRmYA8ilxQ0xE6A46J0gw7vERc0DCt77+B9oRavH2+SXQGlILcSe9nJ3dVkYxGJxTFvvGZgmjkmVC8IuV0/R3LQUD/0u1brnQND2G2vM8lkea3jBN+EE4TkS9zKswanf9A9qVJB6jng84FnZH8381G1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213748; c=relaxed/simple;
	bh=N9l5zfh+Dx9NXmodokz0Nl+RZxeBgcy1N8FWqTUhpuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0y1yViDcMvhI79L49UJpIugLChU8QZxZH/JEqeTbuuVhySLPSzJKPI/Humu2kGjIwVqdhVeoErTuSxop1Xz3LCrY+/X62TYnmFipyjgA5t4gsUd/rFUSpOjLIp0T2vfO2XsqKY7L/5Lep+YlK+vJ7nB8yNQHEwsOEPqRzF8NUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QjyLGovS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4D6AHLn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsPmc023201
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFYvKDt7UN0l5sBlS0a46MhiBKmTIx2FMhqjTWclfTE=; b=QjyLGovSu/+f9Oxj
	90jdC9ydivNZH22sK6nL+/nZm5Cdie66DB6HGNwoKDFK53TFvqWHBv8yaTb4CYsD
	g5z3VYuorUv/iQ7DIouCD5uUild/N41EhpX8of/lYG55TwD99I438nMupzoL8omO
	ZV4Yhgrup5vQROyJrKZ0Mo/Ax/FStUgAqu6cYEmdtSXFvoL4Q9uDb+2W8VSVNK2q
	xhsQj4Ps99B6FS3pw1QyY0lxjiNaVZGV87gEx2JGX8ZGuQyTCtnl+rg5d9vsXLkR
	FAOkPx5R93FCfcvMlsw0ZTnq4WNGgblqUBnC3X23RbZf2PA8qf8g3Qi3RMuzZg8F
	XDrjuA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs7ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:22:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37dc9b82e55so1118958a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213745; x=1782818545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFYvKDt7UN0l5sBlS0a46MhiBKmTIx2FMhqjTWclfTE=;
        b=G4D6AHLnYg7KT+vWNAYnvKhW9rkJGaW+hsGWcASGggjkS7MYwUt8EOnx1TuETnE34I
         a6w5hZMpsE6iEwCdbJYiK0uQNsX4Wo3/GUMWjCNq/3CvgWVewz5CUFtV5N9SKcyObxwH
         66cPr0ID+21+gFM83M56VN2ZxcCHndwQn/tDTdlrkiW9qCmVQldb5lhPcYLLJAn/RBZr
         blSpq6dI8hqA5myu6M7E84022Gwh00shUGuh2Ueny2aZ8gwAB7rVphgR9LalGu1eYRnM
         xH+Aegf1y7sGEjC7slZs7zgEeR7i06fT8CETI6P4etuTcI0OJgyblgS0wr6wXffrKwYZ
         ctoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213745; x=1782818545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFYvKDt7UN0l5sBlS0a46MhiBKmTIx2FMhqjTWclfTE=;
        b=Zz1uWsXqhXkWM2Jm9QjI0zEWDcW+xPVTUXcQrgUfxkQ8nbMQgRT83vKSenXn294Liv
         QO8U4xLInj2odmUaN95Xf4qP74+wTeuAUl4/6WMtJ5BLxJ7zvKyG0e+lqvEV0J5WMG4R
         rsyiuPTnlt9Q/3n0SYu5XMuJlC4E9DgaYBe/g2olFJ25MimKfhIpJeFz56pj+jbpGQU5
         8mKiKBVwIcMdw/Hfihrcli8sROEP9MJulTGoqwGJ5hcgO21k7CaoIoNqxWIaE07QqB5h
         811ip6LDFrr0Dpujfl90eBDuTdkbEE0o1lmiGOY/sV9w6nIwVOXSDUXoVFCoeXdAp7Vz
         N7GA==
X-Forwarded-Encrypted: i=1; AHgh+RpCNEReWsMQT+cL+huMds6ntNL3nZxCozS4An8p3uf+Ood/QskAgfdlzf3iz3l1Z/ZCsnRGA5oXgcWaKAMK@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYNVfmln7X5YMGy00RwW8+wiL9K7kq+1gZOMKzArGQxv4tHUq
	1bSWyqgbX850oB1cyoN3S6U6PTk1FzeDw8lMgYTWmJIzR728d2IkfoN8cLFwZi7JPH9KOYBwEtH
	e8lRIiV+w8tf6u/8jKwfuklduZni24o087jax4PjdwyLfutm30012UWvSrHd92cMwjIiA47xk+O
	Ev
X-Gm-Gg: AfdE7cmXDe8gGcDdisw0b3iBbjYEMH6UOMBadw3IYwD8SVQqQv78sAgHPB9P3EMGqmK
	s61BMyaXz9STl7v9ZMjkH0gpFm1vu3VHSE6NzjXBr1wlguoPJhdvn8aWi6Zwp4iE/DBxSUYqR+S
	f4R74h360CywsjITE49zvGXOPLpeKKRrT/SnSeim5kiaTOPEwLw/v6IizB9/MYrqkihRZmyf1NT
	ASNsVAZ/RiWU0CcbUNBFe9+3dg6EG3j3MJ2k8PH6oOORVc/o0zXVXN6hMbH5fQiSNe7uBVKEy6H
	QhSWM4+XBNIIbJ4eGniuTJGNFosESfUz2RS+t5YsLEoyEiyT0QrTElX9pI2tuu6RyXabtUhNkRK
	gmfHsKg3qeYN5HjjAKXnk6MJjR+HSM9/bsVEh5B3Pq2Ur4nr2gRXenEGOZLOuX/ibGeZP1cDX+g
	gPGMS+0i/7SzrsjYQaGSXJlwKAiDKc4A==
X-Received: by 2002:a17:90b:224d:b0:36d:cf58:b79 with SMTP id 98e67ed59e1d1-37d4e64c341mr13284968a91.19.1782213744572;
        Tue, 23 Jun 2026 04:22:24 -0700 (PDT)
X-Received: by 2002:a17:90b:224d:b0:36d:cf58:b79 with SMTP id 98e67ed59e1d1-37d4e64c341mr13284908a91.19.1782213744008;
        Tue, 23 Jun 2026 04:22:24 -0700 (PDT)
Received: from [10.190.200.172] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37dcd766898sm1100410a91.0.2026.06.23.04.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:22:23 -0700 (PDT)
Message-ID: <d52e10c2-8642-43e7-ad49-f246b05290e0@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:52:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260602-merge-duplicate-pmh0101-gpios-node-v2-1-251107b3d9fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a6c71 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PenRSrQLYnnCCcSRWQcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX8z2lEHcr4Ze7
 gTUE9uN/KsSsCCNCDfusheoyaTFeimfEoQD4nGT7ERPAy699i7j2Ow6NsWUOkzzkZnJmrvHBCfu
 4tFsqgJp9IGi7FKsupkg1cZ2JpiI4xo=
X-Proofpoint-ORIG-GUID: w0yER5xJFmJnFOTyNIrVNzz_J8NwmbCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MiBTYWx0ZWRfX7znDlk7pqvcg
 VC+ZgYeVcU0ILUGLtgNRczhZrpH8wbE4DZTIrzZLCXW3+rWSIHPKbRzf/D1fTf2/hmVVVYZMWkp
 jSuKRgXVX5KX8c7zNwjTF4QQtvVvlH+IaMNoKodRSGDbkm2oMZasANRt5Pce10HpL7o0vqyB6B9
 iF8JTME+2Bx4mmK20t9msUODLdJisXHJ4iwEAe2ooqSYHta6t+5dKhhEwrvG26r4jFrdtfI+kCz
 daIAt7YU16JTMhXl8iqzHefmDn+3mGy1+BqpZ7CYriu8AP4bUixB23YAnzR2a6EkOd13ZkfunpB
 35b7rrF4Zpz/mlbQGPcyoX4DbP+Vsnrw6MOsCoZV7841Orrw43WK8x2AG6iTAIkm/CIzI2nC1V+
 EjBkqMeJh/CH326SVjKc5q8Ni6a/+2w2PuGJfoEIIBrUk8FKFLHBmHYL1/62s2HK8q95kEZCFwS
 6zhaavcCUx5iRcBgKdw==
X-Proofpoint-GUID: w0yER5xJFmJnFOTyNIrVNzz_J8NwmbCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114180-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gopikrishna.garmidi@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1387A6B6A99

On 6/2/2026 3:18 PM, Gopikrishna Garmidi wrote:
> The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
> extension defines the nvme_reg_en pinctrl state for the NVMe regulator
> enable GPIO (gpio14), and the second adds key_vol_up_default for the
> volume-up key (gpio6).
> 
> Merge both pinctrl states into a single &pmh0101_gpios block to avoid
> the duplicate node extension.
> 
> No functional change intended.
> 
> Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Reorder nodes in alphabetical order
> - Link to v1: https://lore.kernel.org/r/20260526-merge-duplicate-pmh0101-gpios-node-v1-1-c4ab4983f8be@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e784b538f42e..782578a2c5ff 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -538,6 +538,13 @@ &pcie6_port0 {
>  };
>  
>  &pmh0101_gpios {
> +	key_vol_up_default: key-vol-up-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		output-disable;
> +		bias-pull-up;
> +	};
> +
>  	nvme_reg_en: nvme-reg-en-state {
>  		pins = "gpio14";
>  		function = "normal";
> @@ -553,15 +560,6 @@ nvme_sec_reg_en: nvme-reg-en-state {
>  	};
>  };
>  
> -&pmh0101_gpios {
> -	key_vol_up_default: key-vol-up-default-state {
> -		pins = "gpio6";
> -		function = "normal";
> -		output-disable;
> -		bias-pull-up;
> -	};
> -};
> -
>  &pmk8850_rtc {
>  	qcom,no-alarm;
>  };
> 
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485
> 
> Best regards,

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


