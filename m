Return-Path: <linux-arm-msm+bounces-107779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH8gAeT4BmpoqAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A954D922
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62B2831BEC58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623EA3D1AA0;
	Fri, 15 May 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gl4Jxtr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nj9i8G4i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6B3D0C11
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840697; cv=none; b=j6Xw9WaFCZVPhvVpV8ORWtKHLs0kWf8YhaawYvx0MxuAonQ1p4Y+0DbEb7s3ByX/FBqDIV67kBzusAEBiKNm6Pn2OT+EpviDHPpyeOBH75ORi5U36yTYccpoFZJEI6HwD8psUKXG9GxhTwMyhXeuzWB5bbpWUqFhRBeHXnzAfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840697; c=relaxed/simple;
	bh=mvPinM/tJfxm+rmtDR2dA6pZP2MRjfXid39J0izyZb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoA/E/V1SB7TwYz/CLDp0xaf6yArTxC9zn/w7/vP9t6rHKhXdLTfPPkWZe86W9PrNEzYkitXSrn0WDCbt165yf6Dr2ygmtB0xOjj3381tT+0YrEqCTjXBt5tALZHllwWClwqCt7EyFgIC831IXmLbCeZCMx65fuheuEK1hY/0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gl4Jxtr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nj9i8G4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5Ueuj3795545
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xpt5WSbFp/AI9TGMZc5Fn3Wa
	uUNLzeYaoqSqN1ldUj0=; b=Gl4Jxtr6THbDhk0GkwCs/cA1T6ZBL/U0XFNZU/59
	GiQoq46MVjWHu3oqE/QeIXTwCBDJ1X9XlYgj87MtlGPCKJ3KqaCTx99E5URHvxRl
	v5bXBil1TomMyFxqKYNfsRnkS+6PiVk8ynN1mWnlEPDO/XpZkUA0e8p7803qA9Y6
	HBVIAvXgJY0KJcIG8089YndMFoIDrJcTKwWhKaum1LwG5Sm/dxU/WNLLs4hPaByf
	CO0E9rbuqN7dWcsRZCwCvGItOqYdzFIWzCF0uofaeGIdzk1DLqedqrm4aX2UCUkF
	P59Mx9owC63TMiJYOjhvFNIOMKwhI2/FNVMSx1SUPyyKhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stsde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:24:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso191690861cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840694; x=1779445494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpt5WSbFp/AI9TGMZc5Fn3WauUNLzeYaoqSqN1ldUj0=;
        b=Nj9i8G4i9oor+fFw9GIZ+N7cv7UKySrQwM7aNRWctfNNkdTULmP9T6TZdC/eynkcEX
         cFLX1gus94MakHHN6F30C59aqhdnhD3dFwSlvEl9nf5cVFx29ioXGLxVZjOijNlET+AC
         qf2Vyrey09HzR4iJDQp7ou9R0ZMwSsVOzVOYJwocMHf7BDGebKYGyW7QY3BWXWq5ScKy
         HWoZiaZXdb7q9ye1/WFcqfijPbOgTr9H5d17iAm94qOk4DmU45OdzY7E0LYmvi9AG3Vm
         8ZK/HsfkkLGKiKrY61ND35VjJRW/bwlHOz14gFgJIZ+DhIVAb2aKY2sooni0Tep4XkkT
         xe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840694; x=1779445494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpt5WSbFp/AI9TGMZc5Fn3WauUNLzeYaoqSqN1ldUj0=;
        b=BwOyoO6Why3Apn3PPQ93w/YVcOjx4KtdzETQ787IoztVAoT3CxAG63PDhB/jJLPetb
         klW/63RGbMgoXDB6XPqwx/Z2cXFOYP/zHVL5CU3vPf7NVQtVcvg2eYMXJIN+GALffvjv
         T14A0YQZQHb8csFtJCMjRgh7qaj3APlYaGp1pdYLeX84iog6DU3wJlOm3zBsbFecRfnY
         K8Xo/PF+rRzqTQJd63d8byTtUQyNUv0ZMSTkT9+I85j++i0lfJTonx8cn4+NJD5huxmz
         lEcnALuqsULAzUlEBRBXsywR84tQp3XzJushluNjAsFOyA+9cCGC8qEyBbrffb2R02sB
         AB5A==
X-Forwarded-Encrypted: i=1; AFNElJ8l2Gr+0FwxZZfXbkcZKqhT5vw+tyLJenoasatS2GGoLPQQPwpKCVAWmy0C0RlSBeeQ+flJlHdRuMdSxxx2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxujpd9tBAS0bDxlkDmnu9ybTVwJ8bj3xm+gTfvi00fMdl4c3vb
	dEDz2VVR/KMkxlrR/K0EC50+QvyRi7pdNs893r2ndUWrCvSqu4pmsSczGL/vtdrJliHiAa3FnKu
	gzemznCXYjzXb3DpML/p01/BXZ75ouoi28E/beVOXGz4yMn5JKwQQ3M1UpQ06GrA4kV6c
X-Gm-Gg: Acq92OEHAoIbOvzO8H+5w3S4d4u9/CXaUI38yNp0QQBQIkZQXlh6WI6TdN80ZCrwAut
	kMs/IorWzlz+Pm8u5rN8HC1fQGgQFAqWAWWyk13Z+aEMwdX/GD16wIvswyL8uv71eGk7QlRJHcO
	cLdWtElTSnWiW1QtoX4krHZgRKjebfm2UQbzz77kj3lbfTAnToCJpIdx+CXk4k3qZYdbL7ZqQF8
	v/L6wPkPS18wMHDFt7FiuYXuUAx4NrhWJizh7V0LbVxxzs0mxEoujMCaX8JkjH838bPgCVWM9th
	Vq45aSmv+v38/vD+Yb4D2o51M8c/Xjxo9vEDch2mn9XK5QIuBfq/AwGlXLEmsC17wASve5Lhat5
	vLX7n9s2B7i6viR+N0fgO+vLKg+pKdnxma7wVdUyCTBIxm3mX4gZ3kAQ888MypS0XUWHGQoJ71G
	FlPOevk4H2a2tHGVwLgWrqqgR3IP1GyTc+lKY=
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr43185801cf.3.1778840694139;
        Fri, 15 May 2026 03:24:54 -0700 (PDT)
X-Received: by 2002:a05:622a:90a:b0:50b:4337:179a with SMTP id d75a77b69052e-5165a011bffmr43185541cf.3.1778840693695;
        Fri, 15 May 2026 03:24:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8dc7afsm14585621fa.14.2026.05.15.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:24:52 -0700 (PDT)
Date: Fri, 15 May 2026 13:24:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
Message-ID: <biphbzvvy55qz6rnqpw77taxczeuitmkrodepyfosnoxafvsxb@swme7xerynlz>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
 <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54abb8a1-e894-44cf-87d0-2341660b7ae1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX8HFHtV9UI/nQ
 ZASSaBcbxcKk1d2ubKb5LRG6xrSxIS9or6v48VlqNQ6OkJ1NxqV66pts/U3U4mYcL2JCK7gk/it
 ZFd/TDgrZhrZAla2C/L4ZFxilfuyRdveVKFmacwY7R7ydZd6QjnyHU3ipW97mTvhJjdJ+oj41f+
 uWzf/yQv5FTPnFQK4vhteSxCJ015KwmXPgIQhSyLLAePnpdQyKZ4wgmyWe9wyYM3eQNabscL2L/
 DtV1jEDv6NDqU27jnXLpEln7GNiPx0ukdjElrYodYDSykWRq2ZmWL50BdLiPGyc2uHbwS2v6hL4
 KxGWOQJaAQdjTtsob2CJa/f2+pB76ueFzleh1gykiDQCls5kXc0ypaH98B5jCNoxzbsY46Dr1Ys
 5zAAXKdWW4QU44R1uNyQwnds4knL8jNFUvLwLfp7wxADr3py1hUoAasQ5k8m2+Iujzdi7KlmYbV
 5ldSogjztsoTaPEH/nA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06f476 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=JLCR6Gb03Lu4_UV5QcsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nsjSm7zzdWtg-cwlBlfvJXgYMj4avyej
X-Proofpoint-ORIG-GUID: nsjSm7zzdWtg-cwlBlfvJXgYMj4avyej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150104
X-Rspamd-Queue-Id: A05A954D922
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107779-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:15:39AM +0200, Konrad Dybcio wrote:
> On 5/13/26 3:47 PM, Dmitry Baryshkov wrote:
> > On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
> >>
> >> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
> >>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
> >>>> The current clock and power domain enum names are too generic. Rename
> >>>> them with a vcodec prefix to make the names more meaningful and to easily
> >>>> accommodate vcodec1 enums for the secondary core for glymur platform.
> >>>>
> >>>> No functional changes intended.
> >>>>
> >>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>> ---
> 
> [...]
> 
> >>>>  	IRIS_CTRL_FREERUN_CLK,
> >>>> -	IRIS_HW_FREERUN_CLK,
> >>>> +	IRIS_VCODEC_FREERUN_CLK,
> >>> Can we at least group them too?
> >>>
> >>>>  	IRIS_BSE_HW_CLK,
> >>> Is BSE a core or a codec clock?
> > 
> > Unanswered
> 
> Is it the same BSE that requires a new clock on Purwa?
> 
> https://lore.kernel.org/linux-arm-msm/20260507-enable_iris_on_purwa-v6-2-48da505e23bf@oss.qualcomm.com/

Yes. But not that BSE question is simply an attempt to find a better
approach for naming the clocks.

-- 
With best wishes
Dmitry

