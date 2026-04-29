Return-Path: <linux-arm-msm+bounces-105225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHgPAYoR8mmlngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C69495683
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 16:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E222D3024942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB47C2DEA90;
	Wed, 29 Apr 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzklY3pE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqvqhyyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8102EAD1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471499; cv=none; b=qYHK6c9Dz8bUEgSJO5KKe8m4diGAaNT0/xo6T1dUXOKbKeahgap2dnh8tu3CgwZES05YnEO1dgh+TDjNFf3BPryKcznxMXQWZi/sRgjTO33AXkHBiwZpLdro6PmLKsm8SH3x/TSFWDpv1GVuXb6w+P8tyzHLeuCaUK9d12zmiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471499; c=relaxed/simple;
	bh=S6wX+gTzPAvcCMKGMzHVKpxGRSVZp3HgiObGvUJwvgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dh8ulp+kN599x6zW77AicF510uRb3KJ3WtN6QWYB9rnFcjhrvxZ1bn01W+a5K3V85d4gtmFdDk6Skt4j/ahWVXmLa/KVuJwNz91yV/PljBobhICiZDu1sH0wBjlmQ07yc8mGCNBXHKFEGXZW4G1VzQatvPIRsIdHDMTWGqF2SSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzklY3pE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqvqhyyz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pmYY901572
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5geFPuppNEw0Na2cpguNPJGL
	4nGh1NRsp1YB6ryaOE8=; b=UzklY3pEYefS+bOkeBxtQUZQD+IPj7gXWaOzbRS4
	WSH7uI1wuHaUtu4VHRYIMvEaC8Ce0Evo+1qCEfaXCuS5ZjOepwbErwHPT64k34un
	SbcLc4hz3Yyoroyb3gjlgim9TtWDtoikFNBW9OgPOx+e2y7su/Kq1/tXmPTWiAYZ
	LKsObFeI2pSfqRgSI6in7sI2towKK+tr48YfWNyZERAuT1Y+/k7VL9nPYI2Rm+MG
	rnEcZGfao2k8+8039tDSPeRRbTv/tEPjbLqp4NrDRL4nlwgeOh464GwL7tyN7NnV
	qY55lUizS1cK2Jl9wXKawsarLCHU2ioQmRBhk/Lcn91pGA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9j0bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 14:04:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7ada7b25f0so3965370a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471497; x=1778076297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=;
        b=OqvqhyyzhU04Ko9ryYHrEnQ8Z7+0PUmnKAj2kURoZH33eCbYTmiWvchFka77Wgrilb
         UIouHcS6aEM/PC/PXWLZnvRJWy2rBjumtOVmY671+wVsy1lZ5a9IPhFxCVJOdV9eqJ/M
         XNOebnfjcjDOk1kztfoz8FK1iWHlkCnFc9g+iVR7Q0JJeJkB8F+524rIE//JVRFk91Na
         VZR2mMbrc4KjSQZ600GIKcO6TS3vVDZ0CBp6oK+4jbJlXTRE7kVhdIyMtLngExXbkDTS
         uCI1rx6RZ5EGbSFNi3mh2STu0Cj+dWH7TA1u5JKEbmNvjGy+0UtEe4petkLFQDaleIqF
         S/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471497; x=1778076297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=;
        b=fJrQkw+P2sRMWVwkJGPeyxgiVV4Q02ZEm6aaaawzcK5skcePXhI0WxoygMKRgDTJRR
         Xu2L9fVXck2dXVk2ivVatyPqTKa03ancz+K0HdMor13NVUpZiKkNJfhb5RUT7rQIbKwz
         9H9flrXcuqxv3qTUy+iy9G2x7y8AXmCb5GZ1jxomFsDyrUtDJKF13zykzeH3JKwmnWZD
         3en54TUjR2a5dCIZaNdmUbBqcIMJYaBFK2WhRk1Mak1d8nj5zUd07h498akJx+4deEBu
         gpZ8KknSxvtuuJ1ZrbkHS/km8FPi35xREft4tDqmwM/q6nxvpis6vVGrxu8/mlVMyYyI
         HEjw==
X-Forwarded-Encrypted: i=1; AFNElJ+WGYSAto+0ZQmIuTcVvZUMdtpi5lNKKwlEIu0+FBAlHLWKJG9/BVYJM9sKCylKxh1DMilnsp8OB7GJCiy2@vger.kernel.org
X-Gm-Message-State: AOJu0YywhNyLScyanKT9HOfAc3GlNQtr1vA5wXmU/UYVbrmPYx9JauVC
	+YcnAD35iC7+cfNUJ8hK2Ga79HVHFBZVPyCzbLjZrVL7GMIibuZyIalWCSs+u9KDJd71/M58nPR
	GNz0lhlKEvAbl7XS8dbsynGpsh648H/b24xxlRUYxwxtg9I0kKyJq6BShbix7H3JiAajJ
X-Gm-Gg: AeBDievPBVEedTsEU6u47moOsoNQ2/AHjIyTyYq0D6XQyj1x+QripOTL9Wk5oNPDMNS
	r++dOWrDWVcwYFFdzJyt2TjoEj3AsYXPDWSy6bUav4FHTCotxlAX3PvPQ5wXg+j9EcNB4p7VdfE
	H/XqeNFN61pPx/05dyl4uxGIswEl4B8kTtIMHXRi7sl0HNSITF2IZTMvXwmztbyi45PZRqaRWSU
	EijdLnjqf0ey14oHzcX4QlVMn27QeZt7m3Z9bOqQ/um0Zw7aXGbnELjEKqIlaJCfFsLjlhEDWqB
	LepKIifAnCLrk0zdP82ktW5jP+3wGSMJji+dYNwu0FjVWmlFd2YE1FobKt2XOUmfQHk+ssk+VxH
	1yYI77aFvR+rNtm30KR2qfhGdktnV8dkH2XQdTH3Gwy+I8aw3y+yE+HBMhaM=
X-Received: by 2002:a05:6a21:33a1:b0:3a0:cc67:396 with SMTP id adf61e73a8af0-3a39c2722a6mr9041359637.28.1777471496902;
        Wed, 29 Apr 2026 07:04:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a1:b0:3a0:cc67:396 with SMTP id adf61e73a8af0-3a39c2722a6mr9041274637.28.1777471496127;
        Wed, 29 Apr 2026 07:04:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506af1sm2270618a12.25.2026.04.29.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:04:55 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:34:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 14/15] firmware: qcom_scm: Remove SCM PAS wrappers
Message-ID: <20260429140440.ov7x75bikyvs7w5y@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-15-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-15-sumit.garg@kernel.org>
X-Proofpoint-GUID: PGFnZile6GxDMF2kAc5YMoGbAps-nqRF
X-Proofpoint-ORIG-GUID: PGFnZile6GxDMF2kAc5YMoGbAps-nqRF
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f21009 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n1VOVlC_Xzu4QXtT9DgA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX2JhCymYXCRBc
 fz5BGonmVB0agtxKpLPKqPdRBDlYTaIJXaCmHv7uoghU5q6XRlptSZck+BR9RvC2WJr3nNFAM3G
 pcy/TSZEWsYUyPvDyNprpZI+aVdTb358VDix/Rk6BRY5dXHi7v6f00ekCFaiOhojN1cSoYZ/Jzp
 EDKbXh/SYtph7B5HRC0joW4rPGc3SWQnOxeXmePWz1L+/RpZTLDu3qgaxVmb6J2FrlIOTEIRJSd
 DywjJ/92a6znK3WC0dB8hcYTawicktrI+88NCcZsARbY3G4qdES1jxbxE4A3625GV8qv9KXVLBa
 YrfsYm8+XNCSDq9Y1vtWcSk2sbFpWm2cKJUL2ZmTu2j2k4BLHJEEd3gP1UeBLgiwo5/iLqaxvO5
 1IL+T9JpfgzdLryfxvKa7o8O5PfKPDwIbAe6Lr1hZGgIaFnvQeZLZ/riu7p2FxbvK69+R/qYpW+
 VTUgrizq/3SehWhGoJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142
X-Rspamd-Queue-Id: 82C69495683
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105225-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 03:26:02PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Now since all the Qcom SCM client drivers have been migrated over to
> generic PAS TZ service, let's drop the exported SCM PAS wrappers.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha

