Return-Path: <linux-arm-msm+bounces-92807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMkbLgBUj2lqQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:40:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FB513847E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3CD93004F18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F8835FF53;
	Fri, 13 Feb 2026 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQCwN/9i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fVJNATfl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532D329E46
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000829; cv=none; b=HOMnteNrBvLvHXfI1+pTW65rrUsKBrEmtg+SCSHtXjjU6mczBCGj1braw8eMumBIqXhLYA4ud4Oi5LfuDoZe3An72lKVyr7P9+TsGBYmQSDJjuCEx8ykd7lfv1kbn1clhaOTajoO9VS6RF+mbsjCQDdrZ97kAa6e1uXE0PxmVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000829; c=relaxed/simple;
	bh=qDVvGh+76sTjCZiSzilUGG7sWVwCUrNKU5Wqi2dAdX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJJSE4N7HLDFdl39n08lbrP/LXuSP/P+ZCE5ierfFGXrxKbfFxVBidw4aoPMKwiFJ7J9orN3qwPZFeF8mDa8zhYDHVjg6WTUfT1T/5CJeoN5WBmp2+Q2cb/h/ku1gBkATb/Dq81rrYSydcvbBAmquSNCIz0UnubOy8/zW3XyHw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQCwN/9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fVJNATfl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DCAr9I1827970
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vsAMKhs6S1NPffJlhKX9y1rd
	VZ6mCP64HnStmjH9xaw=; b=eQCwN/9iMWyaHo1bbAbFoZ7fCRKvXrRt9ibC+peP
	xj3AVeTUKj0gDV4yENmKFGVZB+PLCGu/16AK6tVEoGOz+z28blU61dyN0LutJwxW
	duNaLi5opM3iLrAjf4DGvFc4hrbBkpDJyEdPtv8irxMM/wr6uzEc9q/MVKR+g0rB
	2MPEOVzb+7jqWaKFb8RohR9EmhYvi4pYiGqolzC7w48hi7Vyc7ohWSbUNesH8Yn5
	FHIdXPV8Vue+xQKkx2PBcrjQXgziOe81OrUU7IpeAraMzCuWjAh+GuFhMBh4zTag
	HyJeo/hqa84hzl08T2qQ8Xmmk00UPAvgFj6II7oSBcJ/1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9wg02fmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:40:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503810dba87so66267041cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771000827; x=1771605627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vsAMKhs6S1NPffJlhKX9y1rdVZ6mCP64HnStmjH9xaw=;
        b=fVJNATflzXjXq2PvvJ/A2/igqtWK5Lmt+CRlrTX+gAmcG7G0YS4ZGM+kC5xnK3xAUv
         WsLxq/yJ5JloQZwg5n35R0bfxH2K5ODmg0l2lDr3/Thpk9Bm4Mc37I/0zyp7R3FEnBpA
         D5PI/xM1YNXXWywyc4SCTxyHx/LVn1BYxbel3HDNuKm5XKx+Sd/xFi29Rr0L2Ai9voXh
         Joqy9zzZD7zefNvwGfix0ahID+dkkLgu79JquqUznrIiMfPBL59LzrAlexhSWBvZSzBF
         wv7/1sn/fiIkmNFZ4hNzXpgAv5peqPfqX9pxfg5Ua2fcXjYE5YvSqYa8Lk3/Ye37kcjX
         K0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000827; x=1771605627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsAMKhs6S1NPffJlhKX9y1rdVZ6mCP64HnStmjH9xaw=;
        b=exfC87i5TWm+5nsGvGJ8T+Q++6zKyt41wWEco7gd9XbaUFt2oHUPBV6D+wpz4Aqg+R
         fopv63uJM9dLQhtEzzV2smcYQWkJUndziVQNoh6prRuyjnw+GlICpOjXXSO1JzSZAwEA
         oevTBWn8F6oeHcXDgod/Ufp1yDGZDBryzZ7Bj8YYQ4x/bkFX6V26KTXJ6M7b37AbeNlb
         Ug4YUBGDfsrvm4PAB0AvVFcdFFhBq2xCH4NoLAbODVOTljhKT4ZGFWAsn5VrxCTe/SwD
         LEUgSODta8EeJ70PPJsEV6M92yv30Eh2XXSIUSDrpO32SZ+Fv2PAX+tR4dR4+N0X4Vn5
         qf9A==
X-Forwarded-Encrypted: i=1; AJvYcCUtuHqsc6ozjU6Xs3Ly1eA+1e3XWriBB70IB4nqvgAA8rz/TDqeMwFr//3MIds9Y6K+NhV5oB0Iv4kqeuTz@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXgz20pgHZgZamdbEoXHKItEmu/ijRRzAbh6XEXDzoYzFqOsQ
	C7s47JoVqfU7afnOz+HjRsuU5rOFRkPRUET51XlhLXq63jsM8+O+IX7Tnm9MLaLHHyUlnibj7rN
	AyvgU/cncZbIJssV9azjnnzBIfLrnYz+nI5WVM6xmjOQKzrnVldwFiausdMQhjMZxH2wS
X-Gm-Gg: AZuq6aJfBKXyy3gpeLdQIB4X7lsf7K9I7u3K8yu65bReeanqHLiO+Mh9cclGOoPPBvM
	CnU6/h7WGE28ks0Xkp8vLOKQbPiMjQoiSZUn5z/sA4vAENvk7EwkFNxzwZeVIrWbMx1KmuZittP
	kxvkjmgmo/3zw/zMwxsnK9zmLR2tY0tDtfV9vU1JSiavoBReylLmgnUaEfpvbvpq4HfjFi2UFwr
	35A+xJ1VoG7sB0CFPbaMtch/NeZ9TC1A/UYjgOXz96STInOrzoKfq4E5G/b8oTTpqKrZkiWsm18
	u1rdUPYxT90QkvAgW1OHSJnBHFx5mmUE/dBF+frA34s4rLc2mqA7Lwtxv4MQ69azPsteKz7qgb+
	D/sJUBwEJDSkGL3BvgDUkgm1PF4QycwW3tGj5ZVFPz8sgbSYBYiDvYZkqlut55P2h+MDYXBhOgG
	r7ve/jWsonzInbdDgnDkxo4bccy6mfdK7Uyvs=
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id af79cd13be357-8cb4c014765mr13391185a.57.1771000827151;
        Fri, 13 Feb 2026 08:40:27 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8c7:176b:ebbe with SMTP id af79cd13be357-8cb4c014765mr13387985a.57.1771000826679;
        Fri, 13 Feb 2026 08:40:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f562f8fsm1645806e87.5.2026.02.13.08.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:40:26 -0800 (PST)
Date: Fri, 13 Feb 2026 18:40:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
Message-ID: <tri52yrodjeaoayifuud2rof34du7r3jcp564axkns6ncn3syy@ccfmh54d2v4n>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <20260212-industrial-mezzanine-pcie-v3-1-1e152937a76a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-industrial-mezzanine-pcie-v3-1-1e152937a76a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEyOCBTYWx0ZWRfX85TDZH/9+q6u
 Gwuk8DsLuH6eJwVpL3PsnnlqM4T4gNru7uxnuxc9j858bTFUjcO5JmRz5UtLTUfve3wdPdNJaeR
 JLxXiIEFkUeaadJxxnLvLZPjbpqFLSuCi7Flr1odMc9z7OgUdRvt5jYpICfnXjWRvSHlmbD8KDK
 oJI/2CS+fZ8jvvxoessfSFp0KVFJn3+IxJ4XWbWTSLGow3pEUHz5/GUVbxhGyXezP8EkdiMKU4a
 KZ05ntkjiyBhbEGcemPiORimNMogE7efJzBxyWHuQ9X1qo7Nc47OCYBsZNCGveHicZNqpKEJd7B
 U5Zw/Fjc15HK1f5xq8RKJEQ54tXnRDhqLjNaa0WpAAsnWsaIsn+cbkdI+CRiiXM0r2uHDofPpp+
 4HzoYP11dgIYmuu6R6qlisViYxVvh+fxTPma8/N+spZGC03MozacBKABnwQV8caoRQJQU7n5EXz
 fxoXgFF3BsS+pU+VZiQ==
X-Proofpoint-ORIG-GUID: YaVOrRT-YceRGep_OqyNlwc9hhU_PQfH
X-Proofpoint-GUID: YaVOrRT-YceRGep_OqyNlwc9hhU_PQfH
X-Authority-Analysis: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=698f53fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qSWERiRezZrDuvaUYp0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92807-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59FB513847E
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 04:14:01PM +0530, Sushrut Shree Trivedi wrote:
> Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
> has three downstream ports.Two embedded Ethernet devices are present
> on one of the downstream ports. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, which
> are on by default and are added as fixed regulators. TC9563 can be
> configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 145 +++++++++++++++++++++
>  1 file changed, 145 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

