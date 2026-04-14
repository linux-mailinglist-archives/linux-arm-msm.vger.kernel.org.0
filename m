Return-Path: <linux-arm-msm+bounces-103202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJhbL0SC3ml+FQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:07:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE943FD730
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0EB7301F4B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8B1248166;
	Tue, 14 Apr 2026 18:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WpHJlVeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kggTkXgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7E30EF64
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189870; cv=none; b=BDFCVEI54pgnfF5aFb8B9RA1oSrHfM9b4smgOn6m94lpTCJoeMmKNS0PrdWljqjgqiz/ayvLpktFBKPBykw+nhUJJFVDDGEvaCEJK4vRPtqm6cfBgQXL7VELO2ADWoej3Dw2FTiru61XHJVMCzVzSW8Wq8gVhA1BHszAOFBpuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189870; c=relaxed/simple;
	bh=+DmEO3agjpejWBg2mW/6CdIWQlSayhUmi914wcttxEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixWt5i266qkO/UIbpRXk63RkC/lf6lH41OwuchH2BlV+k++gjgdOSq/nGdxkA3Dt2UV6Je2FmZr6rYzwkcqfLm3jceGx/SjYgJs7FENSADsX4W901HImCpMsqhaj/cxxlB8BnZhQZhyQYnJu2tLeG2LrFAkE0pYKmPbAdyESTmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WpHJlVeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kggTkXgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHqSTq2071701
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oqpv8OSvuRbwulk9/BF5xMtF
	ktZ/FhaWStH1wxOvczQ=; b=WpHJlVeYm6dKBx6tro3TSplUtlwX3zCa67fLz2g5
	Gu43HuISgfpH6xH+shawK5RtzyzQjHL2TxqNvQ2SIJR4B3x3rM7rvQZ/ExBE2qrG
	MLfVr14Lr+1CVDJ/gyltVNCVRNhusk+GwH6Y+rdHG7zVXFLywrzVJQzN9OKSolHU
	hOooU8CSv6sssAkTQAuc4ABQhIdDD8yN5/nOzea/qrBrYuONrn8SqZ8wi14Xld9y
	Av1KmDgGUOheJIU11K/XKbre6ieEUxUJEobAlXR841kicrBb+KIo0LICqcm/evib
	dec5Sim4oMpTrfalNWcq0DKfUiGE6AT+ucde03NCVTgT7A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtc281ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:04:28 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6054a2563adso3923367137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189868; x=1776794668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oqpv8OSvuRbwulk9/BF5xMtFktZ/FhaWStH1wxOvczQ=;
        b=kggTkXghaRA/hU/5YroIjv1u2th8+YPDFkWx9NoIWvDjDvfSqVRKBs0ulFiZyHTUSP
         sNzCS5Oa9oeS/z7Ih2EnWLWPX7PSH97pX5bGB2V51JCrSuc6/fP+ndynjirPyekD8WmJ
         0hWS8qSAlx+TUrNFSNqJYgZU+1mMXQTx5Kd86y5T59i0zBaJggMDJE5ulax9fhdb0Djc
         clrNwiJ0JwI1ZxPTbZQlzX/P2RqgTethZIAtrU4PTweK+eIACJIUkho91T3GfiS9AgEA
         BArEAelNikohNnKWj7PWGawCGf4RHRUpE1W3DXSmEjMV0QtfiAcVG3xTtJG3T9SXk2Ou
         et3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189868; x=1776794668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqpv8OSvuRbwulk9/BF5xMtFktZ/FhaWStH1wxOvczQ=;
        b=O+lsjga0oHAGMKVJV865BtDaClH1SubYRwq4VhMFpZx0LcDhw+XsGOgNiQShX12zdj
         rlxkTo+uWAQvCqapIyxFk+7F/l50FV5sETtS2y9dPfNuAH3/K5xlElQG2V89kSyPqRAb
         RWaoJs712AHyiPPReAH+FaSu3mrjb4q6OzrckoKHErAGUiDok0eTz0fbDdVCeAoX0pVI
         COEhVTWTWUc4ajANx4ZgbxEGcJ8ANDm0DTkG04DqQxZCZaNhSfGEy/4BrU1uRDBeT3uc
         J05vBYucmzF3t/vhXL/p6QsSeFLMNmxXP0Rn6xZiTgSj1dlOfEAmWYcefqDK4iryPx17
         88aA==
X-Forwarded-Encrypted: i=1; AFNElJ9LzdSZbOQQ9mMaTHZkuiuT/nRh2x0yXRBNuztxRvUtUAL0ZpKVela6SIYayFWmseam8CoZIYVy11gyL97t@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDiohyQkjhwlUgCLuiUCISJ7gxzEdQMm9HBqwuhCWYELdGCdR
	Bu7+Gd1Vuw+dintmKZ70aeFNvR+ulVmmCWdzMx7QN2F2EBNhTmNdfl5UdUrMlPWsx3esdqRAa+P
	YhbY79PQHo0YI1v01ta11FAjr5na92VAeeYuR64SKYi7e7Oi3+u4k/GC1lS08PkA7kZ3j
X-Gm-Gg: AeBDiesVLLHC7X2EN/fCQa1eLjXjeDQv49JrkrOZqo3bhNBLIJ6qz0BmrJvhWlFJf/s
	QX/cf9ntUvK4nfv4DUcXg0u/NvV3WuycU6b+0ayptYelgwp8GKtMUfCMr05GzAF7AcQCo43mZeC
	e3vhcs6N0E+q9DgLiFcSEscXVEAYwpL5Xv0qalaveZKAtDxocQkg3G1DcR7dLiH+6dtX0Bt1NGW
	OoJP+lBsuQnlHiZv0U7B1ShtU63Fp4Qxh3Ft/lKdnyYyfdk1n81AKNtanyvqL9lEn38PGgoKk69
	4upIGNOlN22wfyQaa29NTHj6x1plbvRJut4KpB2837Y992wxpzhDW4gn6nhO9AcI86xcUT2Ns1X
	i/iGDW7w/+z0LbFLaTSMqHwS+7fz7N5n8qhJPg6ltf8WVsVVP2w5iWe5LCfjNMzG3Dtj6RellVx
	SWmlqNUFVvFqQMK85pn0XJlWQNUTlfASjCaZckepHvAVdx3Q==
X-Received: by 2002:a05:6102:d8e:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-60a00f4953amr8894965137.23.1776189867674;
        Tue, 14 Apr 2026 11:04:27 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-60a00f4953amr8894910137.23.1776189867232;
        Tue, 14 Apr 2026 11:04:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3ffd12014sm1258141e87.41.2026.04.14.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:04:26 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:04:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/35] irqchip/qcom-pdc: Tighten ioremap clamp to single
 DRV region size
Message-ID: <wvccqkr7mxhub4g2a3ngn7baonqo4k3ujpt3ceh6apz72lfajy@dewzwf7stl3b>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: alXN5ntSegdsQcSiL47qyKZHelWoBo_f
X-Proofpoint-GUID: alXN5ntSegdsQcSiL47qyKZHelWoBo_f
X-Authority-Analysis: v=2.4 cv=HpNG3UTS c=1 sm=1 tr=0 ts=69de81ac cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PDkayDdhMvzo2kSqcdMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OCBTYWx0ZWRfX/8Nr1woT9g0q
 KstqJOQ/1ggxWftMDxqgTLvX/l05NKbeyqYeR3gXy8/N2HDPLTMW1X2YLMMbabwR0pxjeR3bUa2
 uLT+5FST+FPYI0kx30BYawwWRkdZeHJQ/aTxj3aLZq6ljrgpH4/UdsxcBqwdtT/PG/clyHZxo/O
 UaHrpGv2JmNlk1qk+iqnvW+WQursFzyXDaPSrIcz2qURGUG6APoDj+Nt1ajngp2mCY7CkCFSUIh
 YQnsbM5GdNJ665+FGhdoD2LrblHhK2/8DgfW/VKhBQYCiJLh+FK00CnYDc12sPSH/aTHgO6hdn7
 VrvZpfsYQvuJdT9hUFIgpAsOX8wu9yN+voVv5nBvJPsWgpvyMIxB5sIl3gnE5+Uv7icAQQsOpxU
 iXDi6zAW4I31aRUppxGCof+jyGovaSMmiVBWXDj3lzxN3Yc9zUu5EAcwt3e0cpgP4wvxtHwnkiM
 mbvzAxv8bCYA8xnqw4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140168
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103202-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AE943FD730
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:40AM +0530, Mukesh Ojha wrote:
> The QCOM_PDC_SIZE constant (0x30000) was introduced to work around old
> sm8150 DTs that described a too-small PDC register region, causing the
> driver to silently expand the ioremap to cover three DRV regions. Now
> that the preceding DT fixes have corrected all platforms to describe only
> the APSS DRV region (0x10000), the oversized clamp is no longer needed.
> 
> Replace QCOM_PDC_SIZE with PDC_DRV_SIZE (0x10000) in the clamp so the
> minimum mapped size matches a single DRV region. The clamp and warning
> are intentionally kept to preserve backward compatibility with any old
> DTs that may still describe a smaller region.
> 
> While at it, rename PDC_DRV_OFFSET to PDC_DRV_SIZE since the constant
> represents the size of a DRV region and is used as both the ioremap
> minimum size and the offset to the previous DRV region.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

