Return-Path: <linux-arm-msm+bounces-105115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOI5NdCn8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:40:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381C48FD1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6755F306400C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98BC33F8B4;
	Wed, 29 Apr 2026 06:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5XP7k6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itV31c6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CC33F5A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444698; cv=none; b=MTphsdXImDD9nWn29uVy7zvTGhRaQbj88CXk7zkv45q1BVSKhMGTVQcY8X9UfnaDKQUUtanC/PYAnUvcuFp6Y+cI/qOwoXQEY1YaqTRPkcfIB6ZoW5UClRXZFRiim3GI+3Ge6UyvPg1BgvGIyKHKiYTZSQAvTGr7agiigOkNIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444698; c=relaxed/simple;
	bh=XhmXxHf6t9X/qq4rm1vOj8m15iNiJswZAQYxVRMNVsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfaaTv9fl9fvxb9CUKeNyx9X2UcuU3OYmY5IVWKPA8LcAdY+h2hy08j0IPi+3KiykyO+B8wKvWjN6DaAfoR1UNWyxJT9LoIFjMwCl3H5APbLo97He4OcQPBvIeP9kF54Dm08yzEgBUIv1RH8igasytgVKeuXLzPJYGUDQL1L43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5XP7k6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itV31c6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3XfMI019540
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5AyjVCMFNf9lYbonwqaMSJNI
	FMhd4UQ+yRvFcbIuSqI=; b=G5XP7k6Ea4Q2PX49nngybUtMP+RdBOJ2H8qXHnQ4
	RaZpHb8fgBFTzucSvCCdCivwHfICDmypRsi03z/xeDnazyTNi2PvfJTz4q88JA3J
	qd9ZV+ZAuLxDXWSC8rhRpPlNwuxPpfjUPotuFNU2i21hU3llcLLy+/PM82qMQbPY
	c0ueXDvLKqMtE49Ff/rbziVHUzXpiUeT4pZyhbs5wCQdz/eA8YjlZp5XDFbyfdt5
	2a5uSPBaFM5zGTqROnoQT7HRZIZl9i4sT7T0OwNhdKqL6OFiPCFP+Gon9lVIXxmt
	WzxwrYTkulbkp99UKr8+3thjMzWpoiyh731+0J0a3EJE/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeaar5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:38:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf0245b0so79176401cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444696; x=1778049496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AyjVCMFNf9lYbonwqaMSJNIFMhd4UQ+yRvFcbIuSqI=;
        b=itV31c6YxZtgOzHFivHoIbQvIey/dVuGge5kjGNmoCn5Ikk/Se9q7GErkm+4NbBx2A
         Z1HsoG4aJSRIRndKsviscKJzj3d5HcdfD59+E9jtyS4iZHGeLBL9t8woewlJSI1RQsZB
         2RMLAXnf8HVSCs874/arNn9f01hU5hkESnZRdGZTe1MNWVAV3teVf1oagioCo6X6WJ5D
         qB33qks552M9lqJk2BWNb7LoUIpGpNI99UOSX4YyAa9/qKArJQMDvKV6z4xBkj4odmAM
         sYK6cWEw0/shupDFut2KfBLGmXhqK4K8/dGZ0+Mj5r9L0OkGVq1bPSMBQ0wH1AknbhKd
         NxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444696; x=1778049496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AyjVCMFNf9lYbonwqaMSJNIFMhd4UQ+yRvFcbIuSqI=;
        b=AON0jXZB4VcoadGspMJB4EyA6Gn8S+GFPq9OV3g2zsTgjdk1EnRZe/9zBy2AlaZLoG
         vU1gm2SSRUUzZN71uPq8mYQn8QNPJ1lcFxhY50V2CmqJG2kCQqLHuDqk4L2sepMsUdBd
         bAK/Lt+nhxndN+8sjYrplpAwKFF7/HNCKhkp1CuIbEh0HnmnMC/EbxBN4s9HdDfD25Tc
         GfMkRfbJQxb4nwna8ni3znOw3VvuPqf1suarMPgFFO4M38D4x5odycnnYMoIfQ5YpqUy
         SV7TR2B/lWzPzt2NxyJPyRewhXk3KNkhLI9e/0yVzJJRh43gRhAFxzWGF1li/DIJmLrx
         I/Ow==
X-Forwarded-Encrypted: i=1; AFNElJ+7Yn+JL2tbcFCfOKDw71y8FPaNjUXSzhnGsHHoQNoSPOIiFFM0mbTys7q3NiulOr2J/wh7I3gltYMsYj0I@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cg0xBQxXiuFghD0gw8MMWBinnHJbl34BDeuNvloySkGjFAa8
	qjA79Wff1Oid0vTs20F0pQzt9AwLzw7NjOEYvabTcjLqYYhH/DHXvJcbwVqOPxcwW5hVb6BmaoA
	rTNDU+6BsHQripcgAU8Zga9xb0APWPYyX8dMCpgwdmA+qT5rpeUfyrhYeZbplAC92en9t
X-Gm-Gg: AeBDiesRH7loJcrNjTmGwzehsTmxfuZqs7GKRaPw/mZp3iz8wdSh+OBK22BI2+p547F
	6jKawwXcnswJTsrCOnhsj1hWzgbm9mRljbClGCamOl8fh/ICLV3omhE9TPSbvMClcObmcx4aTiT
	4Ev60DToglPlsFcMImEIlq5VhUyDbSciAuwg5t9sRV7io1OCtWFOIz9ALpeK9nigKsPvlJ6Ce0B
	3rrLVhhzqABA17/nVWC2qXgSp3HDu7aV7wmwyrHxm1tVkQvrhhFA1i47+CDwRBNo4P9etdbEWo6
	AV0GIiqKbcGa+Mu5zGvsM2jtqzCpD5FbLw8VLHcJCluxFr3alIJvA1o+LMI5n/WwY1ElwzjRZqW
	TqxtWTkL0ziEmIP7HRg2cLQV4BWXwLh4KZhJbg5ziCEHpTVA=
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr85875261cf.21.1777444695862;
        Tue, 28 Apr 2026 23:38:15 -0700 (PDT)
X-Received: by 2002:ac8:5912:0:b0:50f:b003:59d0 with SMTP id d75a77b69052e-5100e12587amr85875011cf.21.1777444695415;
        Tue, 28 Apr 2026 23:38:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm3327821f8f.20.2026.04.28.23.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:38:14 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:38:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <f7xiboo5wtygvrfbb3uvijebvn7cdd7vj3awzq7vrxqzj6lv2v@7idpzmlscuo7>
References: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1a758 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sKc_6r9Q3NEXqvRLBRoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2MyBTYWx0ZWRfXzDLSM5clsG/A
 vxuN+QyBl9FWT/wQBSKPVUUiVJJZMJmDYJxC00kiUege/F8a++5/tUM+KvzegZVnrLEpkeumdpR
 bzg+6VyzClqBw9yLvSmEIrCocouPMPnExeA+Ef39nZcWQuQcj2rXP6CyJTYq2dQk0avH0hIR/OO
 gGEZkyk3xr8fvpVYG1jIxRbC4GCJBqOFu9zTV7H5kdUqwjf9UTZmg6NKcmFit3XMJCg4wEBuPXK
 xd3D1ZOCDWnjbmMRsj1Sm7rs5cj17ma8F/ZGnZVW39IeEj6x2DL49LlgpZuHJ+xpI2tDYlo1WSd
 ctAapiXeMrxoeUfDqOz80Zo1UYdlKs9mzVXPcec9/Ite1RT7Yretf7gLbgHgxpjgh3wVeO4hwy/
 e5rmyOGwlO4rSplhxw+sCvQECxFkF9XxgHWL9reiBTzSX/D41+xhY8ZJs7J/MFubqM809ZgdpQ5
 PZ46VwL+FADqebyOh/g==
X-Proofpoint-GUID: Du2o82Mt2L83CXRv0k3lhts442b7IvAP
X-Proofpoint-ORIG-GUID: Du2o82Mt2L83CXRv0k3lhts442b7IvAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290063
X-Rspamd-Queue-Id: 6381C48FD1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105115-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 26-04-29 01:27:12, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop the bit 0x4000 from the PSCI suspend
> value to make C630 work in stable way. The bit was found by
> expertimenting with the cluster idle PSCI value. Most likely it results
> in the less deep sleep and more energy beign spent in the suspend state,
> but it's better than the non-stable system behaviour.
> 
> Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

