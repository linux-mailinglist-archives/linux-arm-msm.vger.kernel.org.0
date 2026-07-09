Return-Path: <linux-arm-msm+bounces-117987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YXtdDkWcT2oXlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:04:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFD7315C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:04:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qw7ua+O+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="CA1/HDe3";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117987-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117987-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE1E5304494A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DF525B0B7;
	Thu,  9 Jul 2026 13:03:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A242405E1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:03:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602221; cv=none; b=N4FvcOzzyWC1dIlLhM4qoy2pSqOmjpUwJo+EUSYsmfoeC8nujjYY6QN1+ATEX24j0MAsM+eMjyzXVQYAYl4DIFRj3ERS/SIav/9t/TqrZ5O/BslmtQz6gSQOJvzwwOQALdtJ7+o2uRw1N+LwNidEa6q60Ie5cwQBXTwDrlqo81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602221; c=relaxed/simple;
	bh=WnckAIHlaTmAFvP6s1AxpeWPyK4BmV81YD7bCW8Qmuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPScdIyXsvdRhla3O7rD6q+yFSjEyTdb8zPZXhCTeLg0w7lWUc9B+F0IQ0nAp18D22MOwW+DsKM8HL3OA5ysFXagQxFN38FU5i58NNYJPSAy4iid3ZWaEqQ8xhsqeUYxnmAfCtsUQ4FqowYDJkvYJltK5UDWF6UT+UQjPPO/Nlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw7ua+O+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CA1/HDe3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNJ1N1667669
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6hes+AyfmlrE00EiSFN67s5z
	YH/93a114Q8pXjrH7gY=; b=Qw7ua+O+UB3grvP+67fYmPnISpR8ncdbPMkGqkdF
	QUdqZDCzWKWoWeJAaby3Gic0piPCsP7cOB9cIOgyxDkGeUwzQpCfviJntm3IuQmg
	wl1dSOx0btaMqZylZOY2UUCqWqs8fqPXoR8CTQXOXUh8St1qncbKPK3eR2IYP0MG
	HoDBmROOcjC9JUoALmWQixEL/EvVUkZu2zNJAzZoxjHgcyfcN7qNLfsHHkA+pgRh
	T8nO5tB2ggpTK4khhUnQtHQvGGxzoqacwv38pvFcb0WCANIVXL+jtsAZqYcd5JHO
	RbXDD5KeNC5sltWs5VJwQ+Ez1AfyuE7DWsV5hE5QBUrwkQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6kv3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:03:37 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a3856a293fso295538eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602217; x=1784207017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hes+AyfmlrE00EiSFN67s5zYH/93a114Q8pXjrH7gY=;
        b=CA1/HDe3EXjLiJcAiu/7vAnnkuk3CZIzsmTjCWhcyqJbb7lQGDtTFIPrpACtu+jFYF
         ONb/p/8RaEE2vFmNIGYWbnwmAUuM2TBNsMAxxlx3pxgS66VV1+835HFSoazn/aFPUOvS
         Cd6tGALYdr1mpDqd9Vft8FT4If4NKSWh0ANWixkeIv8wUp7H4G2sHyHlxo+skCNKzWay
         1XjXABCVwKoHoB4exBhttLiaqRBCWxlVrBu6YV4dwxXOMPH7hpltCRBmc4jl9DO/bR/A
         Va9SO15kPGCuaJN5p5dJJKmj0ZX6kBKW+FMUVPErUL+TzZOCT+qZXmdATXbkH3YqzJO9
         R5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602217; x=1784207017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hes+AyfmlrE00EiSFN67s5zYH/93a114Q8pXjrH7gY=;
        b=if8HTmpwpCv6SvNdP7BUCqgOMGteB6oPh3OM4XhgnSo2ieGE5joSGDieuxvixA5In6
         Pi3n8qI3Vi4u/xHmPFVHyzrA61FAdXZq2F7tJnAtEriAPtZ/4TYdEBwxI5XepUbLZZ6r
         RnRx32Fqswb5orBibZcFcQ3rnKrU8zeca+DwWWCWOBR6oXmS05Ftf1ea6BQyEMuesg+W
         xyQNyQa262gByiamD4DHPFQQjCRLB7FqOxBrHNGOiSx5PwxEsjOh+SIar8TYsZldapX8
         0JFgAWduLmJS5blgJsXVJ4aZ0LKKJT2V5sGFmt3QZPBvEhQCeXxKVFU+hzjsUHFEsztJ
         xpog==
X-Forwarded-Encrypted: i=1; AFNElJ/4SY9k4D3G4uhW51DNGJav+I7pyxVZ/0jzrhE2AlAFJIjVijj9fkXSa1rySoC5hwLTu+cHWNZMPbKGx4Rt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lOA8Oxmfl1IF53eUVdjWHR58T/pnNE0RonfNo2zWYwaCP1KY
	NltJwa+ay81MShajka8LbypjhTlHpj3UUcOMtbogFKsB4plnfbgDE7DnOa6Ep93yJU0HHhcFgM5
	gNyHAB+8KNc6dfCx3YgojDHeMmKE0AdKyDaM63iJ66MQVl6a1zpS2wGk2RVOBrmjPiTqo
X-Gm-Gg: AfdE7cljVweXdXXYQwoQxghQAWTG/rZSVB6VHWss0ZnGm2TB2eOyfX7Ou3h8Vcqf0TD
	zwr39JhcysWxJVqk56G1pqrN5lia1GkZr8nvQLL73R2hLWivmCCimJ8acV0wRcctVTWz1UoIVab
	bhUUDNRWiaGixzjrtz+Jcmw5TGZr2uvhR7RcSETxli+UneB19O0c/C32z9hz4gRsOJ1L3jXhKGQ
	OGNeA8zEfPAhu82v8Ntyd1I56a9VJP8CO61+ucFTLFuTdc85AV2CbrcbrqJTcu5vJswq1vlFjhR
	VwJDYJqimytmpWjT5+XyZxPfBd0OBE/E/wLUUYNuBqEwfRffhpCq7Cn82CHDmSCsBa7091v9A2G
	D2bzIMERql1e7x3moDvA3fUj4m95tCrPv+SEkZFeOHgieH5WppFnBVeWX4if6uzwV44wqaI/2EL
	OOy4DEGdFkE1Au1kpuXWKMOPCE
X-Received: by 2002:a05:6820:2d42:b0:6a1:7644:772f with SMTP id 006d021491bc7-6a36da2e65fmr5613939eaf.63.1783602217187;
        Thu, 09 Jul 2026 06:03:37 -0700 (PDT)
X-Received: by 2002:a05:6820:2d42:b0:6a1:7644:772f with SMTP id 006d021491bc7-6a36da2e65fmr5613861eaf.63.1783602216506;
        Thu, 09 Jul 2026 06:03:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180ddsm3055701fa.3.2026.07.09.06.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:03:35 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:03:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX/CPPpnfeVedW
 BqOY4vVUR02rbG5mHKwN44hDG1LpbwAqa1YUA0PxZ4opWeeEaiRcs8zg2/+gusb9S1bu7dW0/BR
 Un8PT5GfD1KOZK3HjQjIob8Z4TOTqqU=
X-Proofpoint-GUID: -h7USxUJlMVyavCqD_X0HwjAYKVFdgWs
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f9c29 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=KY5bm7jO3qav85b11RkA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: -h7USxUJlMVyavCqD_X0HwjAYKVFdgWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX/+eniJXfgwKa
 cjv0Gwvvys/rZlolNV0EGZzOfFUyAlFs5u2o1rlk83pQvMGXwsb3D1X8/CuVst0qOrFvK4UcG4S
 PBudf/Uspg9NzA3c+hTlu6EgkWxV5stwopGt8siPqC7lmRmD7Hq/+wAx7BOGU6SIrAu3GNNv3Wn
 DA1v7qeqMpFKUzjpXAXPQJzSL0/uExwfSaYHq3oyxF01Hg7F/mUJMKvPCk9leFlhVE04dpiynMd
 2SYufAL/QA8lo8qbcfQetEAzrZQmnZOG7ZiIudl+Utrjr2p2R4e6h7mfx1u/cPsV2KuCNM0+zh2
 g7v0F1Eo/aUK0TGJD1qKoA8Iz9mSPtjLhpTuRc8q+hbwy/BNIfbN0YjP3MipmVnQHmv88roumLA
 5QAGp7ntlQk48alSKdO2uJATC24+/0VyKBhJThRjt9NKLxiTDmQyYyuMG3VlyThsAuQQCR1ESvJ
 qESV0r7wJn46cKCHXHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117987-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,gitlab.freedesktop.org:url,dydqcmawo5g2:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99EFD7315C0

On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
> The Iris VPU has separate streams with different IOVA constraints. The
> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> pixel stream can use the full IOVA space.
> Using a single set of IOMMU entries for the Iris node does not describe
> these per-stream limits and can allow accesses outside the supported
> range, which may lead to device crashes. One such issue was reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Add non-pixel and pixel child nodes, move each stream ID to its
> corresponding child node, and add a reserved IOVA range for the
> non-pixel stream.
> 
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		iris_resv: reservation-iris {
> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> +		};
>  	};
>  
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
> @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names = "bus";
>  
> -			iommus = <&apps_smmu 0x1940 0>,
> -				 <&apps_smmu 0x1947 0>;
>  			dma-coherent;
>  
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +
>  			/*
>  			 * IRIS firmware is signed by vendors, only
>  			 * enable on boards where the proper signed firmware
> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			 */
>  			status = "disabled";
>  
> +			iris_non_pixel: non-pixel {
> +				iommus = <&apps_smmu 0x1940 0x0>;
> +				memory-region = <&iris_resv>;
> +			};
> +
> +			iris_pixel: pixel {

Unused label. Also, shouldn't you specify the IOMMU region for this one
too?

> +				iommus = <&apps_smmu 0x1947 0x0>;
> +			};
> +
>  			iris_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

