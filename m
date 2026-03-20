Return-Path: <linux-arm-msm+bounces-98875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FLTNj6zvGn32AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:38:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BB2D52FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 03:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C92C73046013
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 02:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84232C0F6D;
	Fri, 20 Mar 2026 02:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8qSAc0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxKpDHNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152827FB05
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 02:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773974246; cv=none; b=E3rfYXLh0fBWHpNv8bVYegWaTcM/iPqUSgpRZI0I8a7oFNuJ6o/2LoCWtgYTQWn+9YnO4fFi7r2TLOMg35CeAMcxFnTgq4F3mK8EbjGEXaPnJjcwoUdx7fwDHDqok8uZGSCpzAlh/OYq3aZMOxkHHQnum2kQd+AqJa8nV3/+CSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773974246; c=relaxed/simple;
	bh=BuUgA9lW24zsYX+ZK5MhuSqCfAo5lPsYNL1bm5o1ay4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjEBl4qEl+CB16yRkvwz1c22k+lai2Bq7NaPkh45YViV7PS4iIJvzxR4sGYJdCxv4mz42hNSR7AKJ2e1mCCmiyj7BvTKWOfexcXnzItzhdj1ArSRLfQVcmEMKmsGUEb0Xa8JRqwpT7VI4jk+FJr5Dp/SCH0wRjmWTVpSwPVlSS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8qSAc0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxKpDHNs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XiIN1525568
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 02:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eSwxVaWWN7w3RbP3BZlLRNL2
	DeGxx77qIU1s07YJPf0=; b=b8qSAc0rwG9o1NGWRKVGVLZSeI8+W01yVg7gkjmG
	j9FI83OPncuYE3Ue36f0PdI0gXQ/1oWPzWQ5g5wlJRS6FfepMwQdNbvTrlgytPtd
	5+oA+4OY/oddsybKPIg9dd5LfmPrgfehP3c5QAYxghvQKahBlBYR3I3u+mdjujPJ
	ZSn+knoPCA5t6h9u7BzNDMG50w4IRqBZAu0BDTX0+2Axwtlvaf7jNi+WqI/n2qFq
	6/nKqGEEBsV0na8YFIM1+MVCsdhdf5ZWMIoG+oCf3EvCK87qp8RO/MlYmT/tQm6C
	uvPyUOUe9Mr5lq0BXXJZQ7iEWOp6+x83c9V5hHkc/R8JHw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt922c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 02:37:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b274f94f8so95440361cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773974242; x=1774579042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSwxVaWWN7w3RbP3BZlLRNL2DeGxx77qIU1s07YJPf0=;
        b=FxKpDHNs/Qq5ecH53PCEbf2UxSTT8U5MXJeMeuo8tATVPk5RjAPgntx6JsmJGG+j6D
         TXyw4aGLJLC5+VJBfL8ARP9tIFQRRmPMmB3cx2q0dLn479mVaFhshypCfkogFwaTa9Mw
         t+6jF77lRz6ALq40o5s8H6T7HEYIQ3HgpF8Cz3XCDgsOQE2vsrzOrs+aQ5DfgY6d3B4q
         By07iWx9g7Gd8QUBaXKGXS8UWTczGLSctsiMFHtgX7t/V3f+ubZTjhbAZpuw+G6sBFho
         xhM1N4szm6D2w+zBYRhWbwzVSdLFWbVQKv/bZLYjN8dXjjsYlXtHGcWCm5+nA6KRZU6I
         qBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773974242; x=1774579042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSwxVaWWN7w3RbP3BZlLRNL2DeGxx77qIU1s07YJPf0=;
        b=W/cakf7f9UgeDgmGhcrSXrZEtgUf2oekLpxLadmUTKKV/sJhAbAerVkPB5J1dggIjm
         VAnMbBuSNx2jrJwbkiBn+l/4llBpAbwRCScR5hSMXXXlhKn+3oX/WWqjZYzmLYIUkdnE
         j1SUTjCUoORYWbd8Dl0qZgd2XqZh354Cpb4BbxYZm6EaP2S/pJr6f91pwQA5odQ+EiC6
         c1+9TwmcQ0pMlMHmjePXC7WGr6pvDz9dSzPYmTOIpZ5CuXu+uLzvmEEXwZFI6atnNs3u
         4NCyymiX1C9yxNKdTRpzQAk5nfTvhq7aTHbO3CrAoE60SOmNodZ3Iec9M4NhtP8mphCg
         eNTw==
X-Forwarded-Encrypted: i=1; AJvYcCWJh1nm07YWvWdkw+Xt1ewktYXMTxs43yJQ8vIrpYOaClWzgv1/AvhkF/yK+tbLiHgkmmYU1dFhZUGY0CfT@vger.kernel.org
X-Gm-Message-State: AOJu0YzH0tMYdNCuidDEZJVgcFlGdNRzjDqaivmArjK9tTkoN5u70Dpq
	ar8xsYxxfNEO32PA2Caf3sUWiEH0Sq4pZ5G8ar0hGtgESjpv9yANbVuzD3PzftEhTlJbnO+0wds
	vufW6Oyw8E7Xs8CMHVbVl0lfdKntoM1LA9DMmJ1b+Vl7sWoCXBx75vdMi08vnlYTV85wY
X-Gm-Gg: ATEYQzxE5l++E/KbbVgZWkyZh9iqQ/IrcB161FPrQQecQ8HOKfmKzaDiqKAqpmFDBTq
	FT8ylWRinluuURQGByrlq36dS3Dnl28E1mPUaR39kj9Si7X68AvolmctBcZmbzyCaq85V6Jp6vU
	smFjbdfSMOr1nOzCiUI/L8HmbLYs4XGBDPv4aGhPm1fP6XptB2i/zdXMbE1iFyOnYHKSnVH224D
	pFoajbXOFXZtBAM0G94tFni2R3WE7L3m3MlT1gPWv7xyQgg3jxCaV6G6ySgEV9FouopuDAqDGQK
	ZBx72NDSSZbtfNeALcUMGJsQBDpPBq1LeUNx+Jy3SuIVs0EuibklISY2GbMCKnA5kF85JyoGO5J
	w0M9NuWUu/XJzoRcuDEdj5ZWRZ5wXq5eHn4G59rH9c63GNHeblxBn5NwZYY1MsdaWvox5bLwOUH
	YgpA3F0QpkINP6T6n11lBxWmrF7Tj5H95lG34=
X-Received: by 2002:a05:622a:8c10:b0:50b:3db0:fd56 with SMTP id d75a77b69052e-50b3db0ff8dmr1011101cf.21.1773974242310;
        Thu, 19 Mar 2026 19:37:22 -0700 (PDT)
X-Received: by 2002:a05:622a:8c10:b0:50b:3db0:fd56 with SMTP id d75a77b69052e-50b3db0ff8dmr1010731cf.21.1773974241824;
        Thu, 19 Mar 2026 19:37:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ac69fsm269047e87.32.2026.03.19.19.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 19:37:19 -0700 (PDT)
Date: Fri, 20 Mar 2026 04:37:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Message-ID: <cnmqoyoezopwtkwzonfr2o3gphj67kozo4s663vcppsaoicuk4@d766vka7lv74>
References: <20260318124100.212992-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260318124100.212992-4-gopikrishna.garmidi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318124100.212992-4-gopikrishna.garmidi@oss.qualcomm.com>
X-Proofpoint-GUID: bQ6eY4S3DP_ztqLHIRB9WW7bXzkvSusH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAxOCBTYWx0ZWRfX0iK1UY2FsbF4
 Eh+5bK5NMJH0gZH8mRQhYc0LDJy8v+ecoaPY5kNlC36YSjeJodrkfINPHRyU6D+alnpmy2SqBGW
 fAfdRACeT5hnjSryEBBOivNskC1KoDcgZKpGGA9R7B5lyn6dWQBsx0IWyCLtHSKrkasiYvoCdh4
 kczWRrnJ9SgV8ywxsaF/l3w5bYskUenEURrr2z62p2fCy3a2Wd51kXl3gmuPEOasx0NadL0NqX0
 U1w/YoSnZq4nlgYFIhNPS7k/wePDQKvu0dYaJV/ljLZtTP56MMMH/onLJGeRu3OiC1E9HtirM7i
 hI7dfG6ALZh35M5OBwtVx3YNVraBUJYci9j0xoeGUhPsMy4gm+bDyq09DnK6Cg+MsqEkasaidhT
 Zmb7JVrDeepoLApiAKNKxjETOljn1m+ZAgi95jSQHnyCKvu+OADbxSKWi2DGZK66ks4J4RmYXn+
 IlFKmWYUVuc4AgNZh1g==
X-Proofpoint-ORIG-GUID: bQ6eY4S3DP_ztqLHIRB9WW7bXzkvSusH
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bcb2e3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aq7etJ6Tl0OgfxPxJiIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200018
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98875-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 849BB2D52FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 05:41:00AM -0700, Gopikrishna Garmidi wrote:
> Introduce support for the Mahua SoC and the CRD based on it. Some of
> the notable differences are the absent CPU cluster, interconnect, TLMM,
> thermal zones and adjusted PCIe west clocks. Everything else should
> work as-is.
> 
> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi         |   2 +-
>  arch/arm64/boot/dts/qcom/mahua-crd.dts       |  21 ++
>  arch/arm64/boot/dts/qcom/mahua.dtsi          | 299 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |   2 +-
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   4 +-
>  6 files changed, 325 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi

> +&thermal_zones {
> +	/delete-node/ aoss-6-thermal;
> +	/delete-node/ aoss-7-thermal;
> +	/delete-node/ cpu-2-0-0-thermal;
> +	/delete-node/ cpu-2-0-1-thermal;
> +	/delete-node/ cpu-2-1-0-thermal;
> +	/delete-node/ cpu-2-1-1-thermal;
> +	/delete-node/ cpu-2-2-0-thermal;
> +	/delete-node/ cpu-2-2-1-thermal;
> +	/delete-node/ cpu-2-3-0-thermal;
> +	/delete-node/ cpu-2-3-1-thermal;
> +	/delete-node/ cpu-2-4-0-thermal;
> +	/delete-node/ cpu-2-4-1-thermal;
> +	/delete-node/ cpu-2-5-0-thermal;
> +	/delete-node/ cpu-2-5-1-thermal;
> +	/delete-node/ cpullc-2-0-thermal;
> +	/delete-node/ cpuillc-2-1-thermal;
> +	/delete-node/ ddr-2-thermal;
> +	/delete-node/ gpu-3-0-thermal;
> +	/delete-node/ gpu-3-1-thermal;
> +	/delete-node/ gpu-3-2-thermal;
> +	/delete-node/ qmx-2-0-thermal;
> +	/delete-node/ qmx-2-1-thermal;
> +	/delete-node/ qmx-2-2-thermal;
> +	/delete-node/ qmx-2-3-thermal;
> +	/delete-node/ qmx-2-4-thermal;
> +	/delete-node/ video-1-thermal;
> +
> +	ddr-1-thermal {
> +		thermal-sensors = <&tsens1 7>;
> +	};

As a second thought, patching the nodes using node names is frowned
upon. I've implemented the similar change for Hamoa/Purwa pair, but I
ended up defining thermal_foo labels for all affected (removed or
patched) nodes and then patching them using that label.

Would it make sense to implement a similar change here?

> +

[...]

> +	gpuss-1-thermal {
> +		thermal-sensors = <&tsens5 11>;
> +	};
> +
> +	gpuss-2-thermal {

These nodes can remain as is, they are new.

> +		thermal-sensors = <&tsens5 12>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +
> +			gpuss-2-critical {
> +				temperature = <115000>;
> +				hysteresis = <1000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +
> +	gpuss-3-thermal {
> +		thermal-sensors = <&tsens5 13>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +
> +			gpuss-3-critical {
> +				temperature = <115000>;
> +				hysteresis = <1000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +
> +	gpuss-4-thermal {
> +		thermal-sensors = <&tsens5 14>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;
> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +
> +			gpuss-4-critical {
> +				temperature = <115000>;
> +				hysteresis = <1000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +};
> +
> +&tsens4 {
> +	#qcom,sensors = <11>;
> +};
> +
> +&tsens5 {
> +	#qcom,sensors = <15>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/qcom/pmcx0102.dtsi b/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
> index c3ccd2b75609..db2da9ef4f01 100644
> --- a/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmcx0102.dtsi
> @@ -46,7 +46,7 @@ trip1 {
>  			};
>  		};
>  
> -		pmcx0102-d0-thermal {
> +		pmcx0102_d0_thermal: pmcx0102-d0-thermal {

Here and futher: please drop unused labels.

>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&pmcx0102_d_e0_temp_alarm>;
>  
> diff --git a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
> index d89cceda53a3..7a1e5f355c17 100644
> --- a/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
> @@ -8,7 +8,7 @@
>  
>  /{
>  	thermal_zones {
> -		pmh0104-i0-thermal {
> +		pmh0104_i0_thermal: pmh0104-i0-thermal {
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;
>  
> @@ -27,7 +27,7 @@ trip1 {
>  			};
>  		};
>  
> -		pmh0104-j0-thermal {
> +		pmh0104_j0_thermal: pmh0104-j0-thermal {
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&pmh0104_j_e0_temp_alarm>;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

