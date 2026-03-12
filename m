Return-Path: <linux-arm-msm+bounces-97115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFC5ASkpsmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:47:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199E26C6A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67BE43013877
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB452C234E;
	Thu, 12 Mar 2026 02:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="os3qShQP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsDht023"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B23806D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283621; cv=none; b=kYcHyG70rLc1e34+eej+vQ5e7/PAMrOwB6ujdaI+k8Q7L7TVvCrjHzmP9SeawG/S9QBkaoUZiAavTCEce1jihPe7YKzonEBi0UJXRghGTqfQnK9uv8QDg6if2Syim4uR1oztesfE7Ycutah6xF8H+RZSXyvY6JKaV9bxG5TPK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283621; c=relaxed/simple;
	bh=muhjVxcsZV23G2vsaXhM6ZfnTnudhdZxEpKIvh3D5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6Kehxu/KuxzeiKNeLPRk0agWlBHObxNEXmsQGl38b2amtr45VF6Yuia+2J857zVy6O7jHc14vemQV1YMWFZ4tKMU9klaXOUslwWrj/Eji2C8kZUJsReiVF+s65Dn1jWt8sZcwNFlDvc+0MnhEvaNh5lx1CI5rGvkryxjyL7NRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=os3qShQP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsDht023; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMN2uY3137216
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c38zHwY0Losz+olyA3EAKAi0
	1k5oxItl4o3Z8kp0dZw=; b=os3qShQP1fk8+q5l21OGuBy8zpzr7XwarVtnQuc4
	DhBmLJuDttWTBNRRGiHsndalylUiAsEY/qUQU+Z2c/7QBWZQycwKA9LvDAwS1+tg
	bcQ7YaPzGNLTrz98a3gCQ4SG97Hy4ybRGZLosIJ0up7HkAcHdOXNbQzWgp0DGIeL
	6PZ6VMe5pU6zfu2fopBFj71Fjrgeby6MVILaPipb40RFs1qWzsQ0YUvBxzk1rsNt
	Itl6dYbazBbSQeWmwP81KhKtaSkRZK52txgH1aK1+aUnLCJUL8LnNMshjAhoq2p+
	l6o0Vsxo+V6w+TE8/2MDoN+IuLqtgYTVX3K//O0m1dh8qQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w8me9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:46:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5092efe29dcso40018271cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283618; x=1773888418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c38zHwY0Losz+olyA3EAKAi01k5oxItl4o3Z8kp0dZw=;
        b=IsDht023mHjWhdrqO7z7JdLQ+pcDOguN8ojVXHJfAud6Y5R+q7SYTvm3RFrfaTbuFc
         4SeE3AUaQLwV91yLvSx9l5oLfd0LmZtfGUAOCa1Rd08oRrsXAWpaMLTFwFgZmmi06Hsg
         eCM2oVpamzcpCEHWNexoZaO6s2Pkw8kY4Tul66T6v3halSfNC64Bo5fJEJmUJvfWN3gD
         STYqCQP3wMNsw2JJwH35LJlEF4iWxNGKyyQZ3VsnbTqYcol79xOxLnfwjt/scxt0cy7Y
         Ti5G+YZQUEaPUpQCPgZTDUgpdOkix3vQJogC/NgGiG1xpb3TqAHyfH7QF1TXrQTkmbuP
         eM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283618; x=1773888418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c38zHwY0Losz+olyA3EAKAi01k5oxItl4o3Z8kp0dZw=;
        b=aGexgBm2KjxB8LZ8HI4y1ib3fnsbtTT6R40g7ZgN9ClolRBQe/+FPG/hytkPCIiE0F
         8EJNqAvMF5GRrYl++4bGpYjk3fdB2Yrx/ichb0e9vWkRcfe+1dvmhtPqVoLk/88n/Gp+
         Z4l4vC+coTcp8FKQYyqZhaDiJd/UtaRLLowikvbLwFDWTBbPS4N+mhypeVszvqK2pYwx
         shipNSmGAl1aeRK/4oJKkrrAfgtlQ3dghJEnn9RC201G+dzFFX9I9nhkvSRPJZNDYJl9
         WdjTzTMUYRRt2UYUzleUgAGbXo/NLGejVo1sQyZhGngHbGHL0DCFPu7ENUZ1o8DTfhn0
         B2MA==
X-Forwarded-Encrypted: i=1; AJvYcCUBG5PuX09dEVzjzKqlU12qL5gA92BPDf8WfqcLRaS679IB1VVSX/LkWZj+GLLxBBQgHgelL1LiPaV4Vlb2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsl4U3RzCnyBLnAt/e5x31eAblq7SANFKRgKg3AqIy9CyWrzUh
	mHZUNXIzrJqBZerbiamz4czAsrWGzLc3IZ4Uz/QRsxqnR1loKYyKE4VZWpQsO0g19eibeCd4DJP
	rb4QAQuiVDhOAsgiQQhn3GICjNrN/34noWnnBgc6n/itbVEWUNk+3YJmNc2Fqbz9KBT7+
X-Gm-Gg: ATEYQzzDhsiP1DxS+IA8lmeuliIK8JX9sz98tl4ReskEH5QDpKZ/X5S0yIkldhH7u1i
	O1N7A8rjf1GTfNsEhrpRu8aabe0pS/wbg0+AGqVCm7iLT6sCGsmu+4KS47ClRh5UnEowipEtssa
	49tiOz7bbUxUkeG9I49odBFItvnot7s6/BSH9N6YlFdXCqTNKqcn4r0IUDSCJmZPmFPaYHPNjs1
	vJRq4QkOV+hmVN4uY0lS6L2stFBOebJBex04U0tRGtDQUfARAWZ0o2rUHsw2DAWFTTAuHRFk89Y
	p4Eh1XyEF76WtzEV0peWMC8S2LSK3LMIMBmTxB+67OP/2VEOdPULP+QN1T7LoxZUK3uBe+AZRxC
	+YmLb6ssnWK/5i/Q7nLCFV6Tf8gQ1sHSmUZhzyysA3gmkHATiqPWIhfcFlpXukBT4hQmuZxfq3W
	PFdDm7B/BRtZr8v7/IjLtEyUIspauFVJ2BLOQ=
X-Received: by 2002:ac8:7d94:0:b0:509:2382:8881 with SMTP id d75a77b69052e-5093a171accmr66141331cf.46.1773283618104;
        Wed, 11 Mar 2026 19:46:58 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:509:2382:8881 with SMTP id d75a77b69052e-5093a171accmr66141071cf.46.1773283617578;
        Wed, 11 Mar 2026 19:46:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636eb3bsm685835e87.83.2026.03.11.19.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:46:55 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:46:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 Disable MDSS
Message-ID: <t4uhjpxdvjxda4dxkoxktv6xlxg3xvzyslgerluu3t2dzxv33v@k46gvwv4uf22>
References: <20260311-beryllium-fb-v1-0-408a580d125e@ixit.cz>
 <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-beryllium-fb-v1-2-408a580d125e@ixit.cz>
X-Proofpoint-ORIG-GUID: NYs5SyCOqgivE0uvTyVK84j4Vlqjid4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMCBTYWx0ZWRfX+E5cHt5BcR8c
 8kNjIJ7O8kcxwOW8VbX+TDUqUmJ7zQ0ec37i62Zwtj0deBfG7mDZ5y2ri5IOJpc+F/u9+10tSjq
 DcK+MjIY137sPhitJypvjbze+camAdnHBtFuvlMQy968qyKm780S2GJ7fOXVT2iG2QP5vNHNVIM
 XeBvgQtd0RSzBrFYAHvF9jzqhfrC7zXPFf9e1Ih5LhmDBeWDd3bBPTBMmcBhQ19cAiCh7ptak/K
 r1KkHAH4dqfdK8/IfuYK9KI8fAlZbY1mPUFi9E5wPKc3pyiW7Nm7RfM4qbbLLD+146/J8MZ8KtK
 AQ4ekTmxNitnxCEVGjKcaO/S0paOHojQDebf7UDgyqq/Dq7i/41FSzqWDtkn51VR7hq5o1gjos1
 Al60sw6gZIwFNVbhqPdiMOem3mULRZxzitdpR8ai0+397o9xCg9NdIsEdZ8Vtbg0Fc9yhrXV80I
 EtCNBV3cCAKccMEojWw==
X-Authority-Analysis: v=2.4 cv=YucChoYX c=1 sm=1 tr=0 ts=69b22923 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=sfOm8-O8AAAA:8
 a=UflblNn4a4D0er6g2GkA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: NYs5SyCOqgivE0uvTyVK84j4Vlqjid4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120020
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,ixit.cz:email,0.0.0.1:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97115-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7199E26C6A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 07:44:30PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Currently the panel driver for tianma is broken.

How broken? Can it be fixed instead?

> Disable MDSS to prevent DRM taking over the framebuffer.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> index b58964cde8342..d1c7bccaab500 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> @@ -36,3 +36,13 @@ touchscreen@1 {
>  		touchscreen-size-y = <2246>;
>  	};
>  };
> +
> +&dispcc {
> +	/* Disable for now so simple-framebuffer continues working */
> +	status = "disabled";
> +};
> +
> +&mdss {
> +	/* Disable for now so simple-framebuffer continues working */
> +	status = "disabled";
> +};
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

