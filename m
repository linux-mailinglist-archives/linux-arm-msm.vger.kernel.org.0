Return-Path: <linux-arm-msm+bounces-105944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB6DCYbM+Wn3EAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60CE4CBF21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 130A330041F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE301382373;
	Tue,  5 May 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LonEUX8P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlsUDXzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FCD37FF45
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978499; cv=none; b=YkYarbAvfveHlU9hlVNGNnaUzUrCF1oh0YMar7y93pQqyiTQWvfommT9F7HHMGgSfdwGOF2X3bKDoBTxXY9hyZTYy1ZNz1smHibaRI4DzjhgQ7qu89R6GEIpDDtvBJVltMlS+TkcVhxuAoPYZAKls7VGls8EE9eGgjwvyUxgsU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978499; c=relaxed/simple;
	bh=oB1kmq12me1ceMdWUlzQL5RkR4ozbRzxncGFdIDYvfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RM1f2DnlATqip6+EZ3D4tPDQ632Zm4GYNrWofVpYqGXNPgbN7kw/GZ1IhWypHm+scoSnmWs2368sI3UMQqNsWskSa2BNMyy6vhjkUUWqQ/Aumr2cV2qBzJPF4fG4Zk56ZqDWnIlWIUj2isj69Iwt5aMKr8BuM9xWa9x+HU13euo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LonEUX8P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlsUDXzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645A4GXx3740705
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=; b=LonEUX8PdHmVy31g
	PpKbFy34z17YixmgtWmlZ6ju6GB2GIr6vH+0n1SM+kdGszFThDY3rKZ8PnXlGjjC
	0NWS9FKQiqPh8vtJ0O8LnmRATVtHaExw6f2jq5XPXZLsUzs5XUglwzA1D70cvK/T
	vpHlhtNAsSXNZ+EVK1UNbG1Ed1fpuZeTofhF6jbdUTuHIVl1AXWh4OndYezl+gq3
	5GpfAsTD2u0CsRITDdjGfy0NBFg4tElCuruagKXxtPIT8MJ2p2OJ+FZEG9Nx7gjP
	211Nh1B/gj6sgVsGi2aL7eHESx0o6gZRpKzt0KVXzyQZbHnvYy6TyVYzbVPDqL2u
	qoJLfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyefq87uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:54:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3594620fe97so12150503a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777978496; x=1778583296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=;
        b=dlsUDXzCFIHtrdWjZ1LLAi+uFrLsHiM9k4wyKjA+5S2PmCPGxT/X2+Hvhw44+3mYYL
         NmCip7Ld2dcGNgaIYosGwkFwCidup8wWyJrxGSVi6/lMCGkV8g13RpO7N9iwSaRT5n0Z
         puM0Y3d4PyhMciZjmN66BN0HxDBupWKCbcyzGDxDA8vl4y/dU9iGUdrSQJ6WlqTgWu6i
         0zku2kmr7IpVLS8AhjtdBtDHI/wHXhuSaOZJ8TaOB5W97Fc73kmlymUTIL86VYwknSPl
         +HZdpKfSW6Wz+aWqrfLLXwYYtW7WygINSSJ6XECUrkzVG4RTsy4CyKYYVuCcIZrXdMR2
         wRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978496; x=1778583296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BLJdOTNMnvDK0QZqlb+2VB8xllUiDV37a14B7e6vkY=;
        b=jZbKfCg38WLt+2ksKJRIAxaWdnRDmoA4ix2Czt2NLhDV/CCy/+MraOwqGLMkhme2u5
         QeeodP024nlrsg77NgtxEInt9bNpUWojtHOw1CQCGnasyUwtHUcT1sAt29MKdx6cQrO1
         Grb0kw2HmrHDPOA77VDBbf312NY3WDE1g5mkxnimX3nV/xcS6cUBqlT0hfpa6f4vngO3
         exrrYZcZbYXlZhFEVSncg8u6G8OU/wJh4BSyiZuASBpylzU4JEJM7OFXdqeESYA5J5cl
         asOMbeQ6GX51fD+4+jiZDvZhSf/56kUL04+xjmuIuNTVvziQsj2NxqNoNUMSyqQqiQ6m
         i21Q==
X-Forwarded-Encrypted: i=1; AFNElJ+5jMkzC87M6isVhN4sd+FIEKbaINWNlYRKt4YXjzkYfaKtrr2vGHsk39IcfqyBj0z/VtmaDef8HdR6RHaD@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQvT0wXg61JRqUrs8+ZXR0ELWAhT+/Wlrqp9JabmdDjnwSdU3
	u+AdyQ2N3Z5IwWeSGp0V69xR/NqJXCaWeFKuoWUd2HjKD/Kmc30qn6T7ZXW31vALQvM4VQjjnUL
	21uyBltkogVeqdtBsihPeTYNnJpGznD/b9Qr8Dxg1i6ORKUyC/TrV4RFYhRjQGAO/xHs5
X-Gm-Gg: AeBDiet2RmvvnUclGJQFi7T5Rsgr7oMdlG7phgd5HH4x6vGVYH8i91gt/s3PC2NysI5
	WCDVrX3Z3eeiw1/E/R5on52CewoYKWAL4AaYldFYGyG3q6XRKNxl5Gq1sKsykxDUTbjmFv9DaEz
	AJ3rQP8L33jQpIU3KK1RY4o1QQ3aJWoxczbslSRHrbBnpYdSo6mD/ZJcQR25lzyhjGkAlpWkSw1
	+j6gXFwLsASE1JhdXcpkV9bO1D0O5K2Mx0Ov/A+JP7avhS54GkOZlZsmHvammL4vvFi8gZf6HFo
	ER6mIiADEzYjfywRMcdKQlQjVT4xENGvAvEJPcQHfT+JcMBpu8cP0VZaXU0mRL2jxmSS7xPn1yY
	KLDZyXI6ywrNyRj7RCH2gT2UZTHfM6wt4j4G1ZXy9AZmIkKNVR4Nlly5kpbEe3PweFdebICEbyW
	gjX0B1+n7Gtv8Y/9zAEnGc2t55HL1p+4FvghWGCkAShiDA3q0oMKA=
X-Received: by 2002:a17:90b:2b8b:b0:364:7467:53e5 with SMTP id 98e67ed59e1d1-3650cd866dbmr13459945a91.2.1777978496225;
        Tue, 05 May 2026 03:54:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8b:b0:364:7467:53e5 with SMTP id 98e67ed59e1d1-3650cd866dbmr13459935a91.2.1777978495755;
        Tue, 05 May 2026 03:54:55 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm137977745ad.78.2026.05.05.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 03:54:55 -0700 (PDT)
Message-ID: <96daa0ee-4cbb-4472-ab3a-19ee32b4758f@oss.qualcomm.com>
Date: Tue, 5 May 2026 16:24:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client
 table
To: Lokanadha M R <lokanadha.r@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMiBTYWx0ZWRfX6ENWuKSl0oj/
 kPZYxHBtGQwpAg5kdJV3O5hhS9Le7Nk2eumMVXQF0vfw3EzRpJgj8F+hnV+0XCIyd9rCuDTC24O
 BUztiaRWej5o+a+U1+2g9lYqMLjwHjtD7QcHk1FVrSvzWFZ5cWa6CmlOpqxpIsf2bnfN/0KC+xY
 H0qvEMpDYBpiHA5fpbqqakV/sdaqIOU3X7BHL3A+wa4ToaSCKCg2OTc6rrwyfXVUGemNk6U5+SL
 SB/un+DzjRkSGSlfls7k5fg0xR0S9WHPlVvHT/AeJkvSBpSh/bmqwSSd0hNru4ewVHO2IKAekg7
 rAdr5uwVoYImay9TOOLdsINeTTkI/+cipim60mubRLtXDUwABAGe1MOCVxYcB8lRj62k6L0ERpy
 7jAoSCa8YN5lKj68QN80i3DNo387TmLR9s1wj7GTuif7GHu3jw3rENYoTzYRMML7tiZrKh1q0CR
 WwDT1CuDdQyNml/W8wQ==
X-Proofpoint-ORIG-GUID: lOUt2wKyVY2ZzdZ_277mmOIwOUQWicy8
X-Proofpoint-GUID: lOUt2wKyVY2ZzdZ_277mmOIwOUQWicy8
X-Authority-Analysis: v=2.4 cv=edoNubEH c=1 sm=1 tr=0 ts=69f9cc81 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wtB1UJvddPmpPx-NcbYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050102
X-Rspamd-Queue-Id: B60CE4CBF21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105944-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/2026 3:13 PM, Lokanadha M R wrote:
> Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
> table to configure the SMMU-500 context bank for the display
> subsystem (MDSS) on the Glymur platform.
> 
> The settings disable the next-page prefetcher while keeping
> macro TLB caching enabled. Without this entry,
> qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
> device and leaves the context bank ACTLR at its reset value.
> 
> Signed-off-by: Lokanadha M R <lokanadha.r@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index edd41b5a3b6a..6df48499a4b2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>  	{ .compatible = "qcom,fastrpc",
>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> +	{ .compatible = "qcom,glymur-mdss",
> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
>  	{ .compatible = "qcom,qcm2290-mdss",
>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>  	{ .compatible = "qcom,sa8775p-mdss",
> 
> ---
> base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
> change-id: 20260428-add_glymur_mdss_compatible-44f5b2837498
> 
> Best regards,
> --  
> Lokanadha M R <lokanadha.r@oss.qualcomm.com>
> 
> 
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

