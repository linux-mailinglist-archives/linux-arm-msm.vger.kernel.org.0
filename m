Return-Path: <linux-arm-msm+bounces-116896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7GtxDA2+S2oeZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:39:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EA71212F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:39:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hgx7C2tE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JyYhxoIe;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B12B0330B161
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB4437FF5C;
	Mon,  6 Jul 2026 14:24:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC93793B8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:24:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347869; cv=none; b=KtD3pe2tgKzFXFRUtF4AViHujdFflEPw6CadYmwwLCY73DMF536qukNUf1CQqPxxd8DNQW7xSFGbbWETeN8/F/g/fJ38vMaX+jMD6u8YsBAbaoj/HnPWyjKjzmGcJxit5G0TXGTe+lH3cYg5l7XJLZyefbGACyxw4PKLdf+zg78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347869; c=relaxed/simple;
	bh=RqKk5FotZtKC8C4ZhewaFiPzVOmJRvPjCEVbeomkK3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cobmmcAmkX3kqtosN4DfD9Trkh63/RB6UiN3wD/VC3mi0LJwP9ygFUKbuwm6rUV0xabu2/aypNn7RJGXsD/Ha3nRPcxtLZunjX2VTVhuigt5lBfnOgEW3oRiCQpT6ywzmrE6U9DOlzSlAkt86QzwjtrjWbET9b0/ILehLqTf13Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgx7C2tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyYhxoIe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE6Ug616440
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yXFv2mECvN+xZKWYVmzpDkFb
	Ja59AM6qd/7I+4lCZZw=; b=hgx7C2tEAY+nCJtHgG95o5yvkp5BfksiQo/5UGvR
	eXxcAXeRNHE2F5H22rtuZUVravngGe7Upt8L7nt0R+0WrPurhJ57Q72U2F6VRSJX
	LGdHiV9Kk0Lo7nbwkSpI/RrO4fTpocl6dELHgIFDfx9tZhKAaNqczQjVwNESPaH6
	zGRQFGnkqw9tUxlKaEbnwO7e6RBenFgKJMqh6xSe8rZmV/1h3hQakqLe39NrdqnB
	y91OtPgPCohzPYya63ivbGB0+GZPvnKMj4pAQ3z42e7U4aEKlZV2govQ3VpL5QHl
	sqoYMiADZmBje316Zd8Ha4iDtROsOPcxyZONcXPwM6xmCA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxss41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:24:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so1490333e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347865; x=1783952665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXFv2mECvN+xZKWYVmzpDkFbJa59AM6qd/7I+4lCZZw=;
        b=JyYhxoIeXxB+TWtdmfQnc8Omo7QoXssbUct5kbhoiC8TNpbqPKoMDzJf14bdUp2fiW
         CDPS5Dk7YGmnH8jyUd9PORc98kOPz2+n6iGlrxSJPe6aJVXbto8+LzjKM06gDcmcToSE
         4G03xWhVQ4sdHI3InS1A3Z2jVzmu16Z4dkfV3wT3dQJxa+IWxujAb+Wqcn7nmg7y9q1t
         29opzBclxb1tU/nsa6AWOQ2T7xUx7/imRySQhAqz9sCmyyO3Cxe2MWxc1Y/DWWgPqAAD
         S0HfHWq5CfLVdZ90yMEuzEjOKPb7PUC20ND46OJbWMn85bBu2CBOe44WFIv7coFuEYlf
         /J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347865; x=1783952665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXFv2mECvN+xZKWYVmzpDkFbJa59AM6qd/7I+4lCZZw=;
        b=gbZmVVCvX6AtSbc6isKb0GNHQpygqJfI7UelHA/xUi+qdEKGwBqBz2WfebN8AIeAMK
         Nsiza2ZfMp1CrRpGA2qQJioG1y0t6ceB0DxRFW9hfpvTOX/E7goqk+fEmcLwJdiE8RwK
         rrdjKZXvhTslmgY6Id8S8Hgx901yJMtEn37byicHItAbiuYrIUOkZtuAwz1s8ZkMZsyG
         1+CBMlEFnSDsZRZ6cX0YZwIke6rwNVkZ8MWW1Jtle+RTYHJHoEs34k85+OEM2h7B4JfX
         eZ/U0cAe47XVR2WK6kbtsJ0GQXbw7bfZmHVDM5CDqYlhNcjCqkNbgxT/yA7TMksFAI+c
         0Qdg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+jPNzs9iD30pj0jnA127tTwtyxmUYVZCiUorX6Mu1Tmu/b/0RoUqQw0Cb/PD9pjdI+FlGv3s5exqNX2S1@vger.kernel.org
X-Gm-Message-State: AOJu0YyK8cfxHIVXLs3GqW9+LgyeYZHN1nHu8eZJHTXtfycsck5ZDzfP
	KxSHjIpVcObpHiFnCDBpeqgrQUpeLGE9JAiVQjYNWZCl58UhKbaDkwhoni0hglqPbJg3iFuP1Xo
	hHnryWlp1RCsyQIE8pCUXFneA8M2ufpe8qyG9+1JIrF6XV+FvuZ53o/V91pDwJfzHh/6I
X-Gm-Gg: AfdE7cmAlNdAjyJnmvcgQklIO6f3YN5QqcMIIwAubEr2vFStMRzA6a1XzIQfPGsAf9I
	eiasDKEFZ6Klti6A+xiny42vR+Yqy/yQuUB+/+4ylI/j0b8FTrsAXIYergu1tLlYN5iyAWS9w5q
	bZtJMk6A3komHVeU7pDo7PBXcz/BTZJjlH38BE1Xt5XJJSsy759KZIF/ph5Jbh5cGWOL6R5Dvu1
	d4vJyxf4DWoUyew/LyNcnvyEenoXHeZOEFiRXbga9M29rXjPUgLeRofmSTGRcgQrK7/qzh2Vj7p
	YdZsanMVZ3uqzY9JZV+9FDn7gH2w/XNpHwVZYsTe/mRCpSQMhmVeocp+T75GzwemqnZgbx/tZ7L
	fTcCpvkr5XL568DHNL+yWc0aLTQm7rQoGU4uJDcWpL4BJVSpW+PTAEilgz+2XsAot7bhty17POb
	TGZlHsrqNQWXxQhsuSYK3oqKLL
X-Received: by 2002:a05:6122:4d05:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5be90743468mr454367e0c.6.1783347864967;
        Mon, 06 Jul 2026 07:24:24 -0700 (PDT)
X-Received: by 2002:a05:6122:4d05:b0:5a3:5938:6935 with SMTP id 71dfb90a1353d-5be90743468mr454346e0c.6.1783347864484;
        Mon, 06 Jul 2026 07:24:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1376ffesm2968872e87.24.2026.07.06.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:24:23 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:24:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <k7dizyxxj2gk2lyz3ru4ffuckbh4vfw2z4hkn72ygjqouundhm@gwgriymkpg6b>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
 <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-milos-iris-v3-3-8c1353530f24@pm.me>
X-Proofpoint-ORIG-GUID: 8fzPPeB3oFRrbqhBFU-o3X3bMjyxv7GX
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bba99 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_c_tBz_40JZhELx2ZhwA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX2qjiZmpyQnh1
 Hrmd6JNi8tXDLAbRcjexfubp4W2E8tKBfQkNx7odgGUDrKn1YrOA9q3Ebe03AMyrECuFN/wUKGD
 Mb4AryBzQqCxxXVoUpUwIP7+JFAEmHw=
X-Proofpoint-GUID: 8fzPPeB3oFRrbqhBFU-o3X3bMjyxv7GX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NiBTYWx0ZWRfX2RXobN5r7OT4
 VSmFDczPu+QKFLuwOggvCzxyQU0MKk85n8S+bZtbI+cXl6Y1Va/v486dkAn8GAKfylWCtsgIDHg
 PUN769+vw4O1okJ0kX0j0ebVwSW0DCYTL0Xz6jXx6gUMalBDq+U6rzP40NXIet9JIiw8tjhvGyv
 MZSzDriSczS9faiWG6StQqu+IMaHf2beYZP/cyiXLwzTx/kmmPo5ZzDHsZQOamInVwMd9MVmne2
 N0N47S6G5r0RWjxYrAd9x68b7ygNvsSadXojI0ppzrgGCkehzzCZCvb/4eaq/Yqr0eTkGF0qSLr
 T9rBFFC7fWNbHKgQ4pfDn1+IRvjtN0kAVZOqwDu1TAD3EaSrj3tRJRvU9zJvcNl13YpuMAwMD55
 5Lin/jfy0qXWiziEfnsCwdKoTswwpntmJYkzHomLlQ9kScZgiiGc1rKb5DYClwesa3Q2G/aQUwB
 ppTAZYZwZUcrRWy/vrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116896-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akoskovich@pm.me,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,pm.me:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 973EA71212F

On Sun, Jul 05, 2026 at 10:10:43AM +0000, Alexander Koskovich wrote:
> Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

