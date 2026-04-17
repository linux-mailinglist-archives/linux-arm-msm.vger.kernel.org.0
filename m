Return-Path: <linux-arm-msm+bounces-103539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD6AAoZA4mmB3wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:15:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C221B41BF0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 16:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21D9F3011F08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD803A63FE;
	Fri, 17 Apr 2026 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VChwwG/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8J/l9h1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977183A6B61
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435010; cv=none; b=nec8cHi/GtRg0pzhIBZdI6XDlF2fG54N7dhedCNwceFHK0W0YLp8e8afSYkFv/J+2inn/HOOPO5yin7OYSX/+83onrAY/jfL6/iMhm5DdML/wmHyr+WEN/g0nxDKJA09ufmnPYmHprDxj4utnAW0YeAkQ+wTFvfwc7C8tGkoXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435010; c=relaxed/simple;
	bh=uEuVoD/MvbmrZJAAU4WJMcdPvUB704Rh08cLOWHed1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZILaiCLu+BGO1t6866xZ3XdaNCeXVELAcQ38udhM4fmLmZL8szbAREXjCZwTkLi1VZxzz8Oboalxj5bvoFe/aKM/V7uOzZQuZlYdJtKE6jERTTViFHfq1okHJvYWJcN2Vbw9/wdW1xYM/nEvzrr5ymUeCwru2cep5nUprXdVPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VChwwG/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8J/l9h1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8M143667843
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=; b=VChwwG/2FWGSCTBx
	Q7wfayNUO7wd03dW3G1G6tSCl+MEf5YnVHCtR/kz8UyuBEVtTr9WrmI3EeRNczAZ
	OmaYCqXLhyvQWwBav1q19M8R/s4OxWOnqm6+GLU8SuSZLJkZr4FXrL1yML0HnxGx
	VchGyjEwRiuWnokUkdF0ltrTOej55GgXf0npFuzPZJu7/w5ihTM/1gaA4TMz6klo
	TlwDUmG5Ew8J6GIxhGrgniMaciwH7mF6awqNyw3DrH8PxJbLAnxb4sQrUe5vJWRo
	pcw/YVgteXrkVDQ1sYg7HNWObdotjL5Crg8tsYM1IbFsr1Zn1uQ91IvdfEi8mB/+
	fI8s3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkaxctgvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 14:10:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c726ddda8so910227c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776435008; x=1777039808; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=;
        b=G8J/l9h1MZwjgCNzpR3b1YwxmKIf9y3f8ny9AcXNr+DP9Q7JueIs9cnXgObJN9R4vW
         dADaw8qZo6KwXHeks9hRgk4TnLluavrCIhbvFHFfnAXfvKBGQUjN9UMhoPzTfribs9go
         wBCM2gb3gF7mz53PB2FrOmrjyp7s9s9up+Fto8Gbnr6SYqp5GKsNKdDNe+MK9sBjgPOJ
         Lxcv6GoltMLlQ2i8OCIqq+1QStQW2YXEZ6hKjQTdrGvhHhyN68kOiMNpeovHBNg7pUoL
         Htx7k0TmOxsFk2isT2GuGK90Jv6dOCivU8oOYs3Unad9qb0FLLw84+0jzUJuuHREbZdj
         Qy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435008; x=1777039808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0F2o4Dk3iiYwIY3r8uAaLKA55qkddrf0NWv552CW8U=;
        b=eIBUH2Guvk+IJ/YKfgzXPUxZVyyihZQ3BsrIFJj1UPcthD20s2CB7bvDmxhca7IVfy
         6btf5GCbNXhl0IySRYJXw+9tI5AE/GPISJWnhfUm9QGG1ZnU7IeBBXpFljNKbTOylCLP
         Ux2XtIbfQwZqErvDQAX5JEq4bmeP0WFAbFOh6XXp6EeasVtN2NTn8rOZynsj/KuBE9tN
         fITmBjuJy72w0NZy7QBGJbBarxqRFcQVMTkh2R7K7d2qRFN3p1m/fQWWWfMsXziIUH0R
         fZeSp/y9z/3v9XAFxPo/N6p5NQm9OCYdiMBMC20UjLgFrNabq5Poft/kvqAd3QdkhBF2
         OVYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FHLVW+kIFP0VrQJHKxuh9sdRjiFypwm5gO7vYqVMAfOgavOte1ez/T7Cg3SQL5oOsEbp49Z6uwKL+R4Fr@vger.kernel.org
X-Gm-Message-State: AOJu0YzWbc6+JE+XU1CQu4huZqIo8O0ijupu9BIPCmDf5Vb4tJE2Z3Ec
	hkJxSXfdXqvCydyl5eEN1VC9BUGwAGitXX8Yc+46LeWMYJoLP7bgFRpcyJUxZTq572fDnFnknIL
	hmO1GTYfek2M4Iv3bsaaXkinCFspUuLtddKzyOymRNc2PeOwdbhSKetwlKLrZX2h5jSsR
X-Gm-Gg: AeBDiev4onSH2aJCTnwSDcEwBwXJRU4qcm7ejddx1+5k0Qyxlh6GLZ4tNt0MgHL78uM
	SWCXQg9zPEgRolFhj4zGVKRrME/ATphWS4ZgRM+pZ8Vc4djnqTFvlIHYVAp5nFNUSgxHMvJf1YK
	bUR3n4xtLj0AR+23drdWpkZ7EZbeC5SEDMaTXQer8ybf3rVL6lkvK+d4ccaLQkYnN3C0/wgF9aO
	Ja/NHxe0nA7z6WzoUzUaXnlC6YMO8r5U49tvngGHKz/s6PI98GR6B/h7CTEwDk4X0DkNc6cf19j
	HjfADnFsA3sQyb+BziXGbjOwmWDjz7sfCH5gvNFGh2MG/tITPxkiwg1ctG/Gp3/+TBEQoZ82ZOX
	Iu2y4iaGU4x9Za50ywO4X1cQMFbrsWzTsrMFeHHmq+k5zZBmkSeXISxyjSldWlmOK8/CY2y+Zjv
	Q=
X-Received: by 2002:a05:7022:6728:b0:12a:6902:ddce with SMTP id a92af1059eb24-12c73f75d0cmr1432464c88.10.1776435007247;
        Fri, 17 Apr 2026 07:10:07 -0700 (PDT)
X-Received: by 2002:a05:7022:6728:b0:12a:6902:ddce with SMTP id a92af1059eb24-12c73f75d0cmr1432394c88.10.1776435006470;
        Fri, 17 Apr 2026 07:10:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm2243346c88.15.2026.04.17.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 07:10:06 -0700 (PDT)
Date: Fri, 17 Apr 2026 22:10:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: bibek.patro@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in
 ACTLR client match table
Message-ID: <aeI_OPSESxxz8WMR@QCOM-aGQu4IUr3Y>
References: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcqMa0KV c=1 sm=1 tr=0 ts=69e23f40 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pfcpBET5JRzwQ_8xOogA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0MiBTYWx0ZWRfX8BJLWkGgm0iP
 WtITIz+TEXJ2HyNSoNvOxDvwmNWctls3rdKBuYzlCFCOKslF7eS0GJ7aHNMsRcCI5HWBVy86Ucm
 YBjTxCvF/vIkNHCSJQoyrT5EHRIb9NDeaTOd6hAvBqaPD7bAB3hoC7t5/J71lv7pcGNDi2UaCIw
 WDgZ1dXYDfclbQlnF212VNN2NDJBr0Zxz6DLCVkUGRHZDqRB7VIeBhe4mT5LP2Z+tWkZlo+7HqI
 EFmcMV2YITqaSd1kTWr5ueLcdnrxSmhnLYEZOwa5B/dIUybPJ8tM9fa9qF5PEnKJM8DB1bnf1gy
 XPMHAF9QoI0dlKTNu4YAu6+3iXpNd+rwuLinoHLGSQElTsIiEpsaEimfGwUT5q4e5B2FZmZ9KD0
 VlpDE2QGjdW3ODk+g8Pdfl0hnP3RfXLF9g4NGE0XkqHmxHmZUDK3a674RyZ2LwoR6CKPdI6KM1q
 s9BKWY5IuckWAI6DuNw==
X-Proofpoint-GUID: Y9HW-i3r5v1iN-DIl9D7dxBWIvkwDzwS
X-Proofpoint-ORIG-GUID: Y9HW-i3r5v1iN-DIl9D7dxBWIvkwDzwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103539-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C221B41BF0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 06:38:25PM +0530, bibek.patro@oss.qualcomm.com wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
> the compatible string for applying ACTLR prefetch settings to FastRPC
> devices. However, "qcom,fastrpc" is the compatible string for the parent
> rpmsg channel node, which is not an IOMMU client — it carries no
> "iommus" property in the device tree and is never attached to an SMMU
> context bank.
> 
> The actual IOMMU clients are the compute context bank (CB) child nodes,
> which use the compatible string "qcom,fastrpc-compute-cb". These nodes
> carry the "iommus" property and are probed by fastrpc_cb_driver via
> fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
> each FastRPC session. The device tree structure is:
> 
>   fastrpc {
>       compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
>       ...
>       compute-cb@3 {
>           compatible = "qcom,fastrpc-compute-cb";
>           iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
>       };
>   };
> 
> Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
> device being attached to the SMMU context bank, the "qcom,fastrpc"
> entry was never matching any device. As a result, the ACTLR prefetch
> settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
> for FastRPC compute context banks.
> 
> Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
> in the match table so that the ACTLR settings are correctly applied
> to the compute CB devices that are the true IOMMU clients.
> 
> Assisted-by: Anthropic:claude-4-6-sonnet
> Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

