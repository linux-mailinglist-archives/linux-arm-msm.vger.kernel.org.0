Return-Path: <linux-arm-msm+bounces-108834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLbxHBrfDWrb4QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:19:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E648591BA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03AB23002316
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D2C362136;
	Wed, 20 May 2026 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1mHQBYS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etOCAZK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDD9363C79
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293918; cv=none; b=M65AznnIQ+zry1Z826h9iEMP17k8tKNk/mvEl9Wqy6dnwDFiOyK2+66dAIj+OXNrP5fo5ttob0l0oWn3X+6QqfZ/SMC32X19PB1ffvBMoOxuwBvELikIWXMlc6FN7C2rmu9u8lHP8//UFDbs6mHie4nXyf4pn1Uw+Euu9pL8rJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293918; c=relaxed/simple;
	bh=WuqQgf394shb8dY1Y/yOPUDON0RVNRz9T9zXKgEbZso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tik35B/X5l8O22gux+Jz4yqCYdMUza976eBYaYbAe/Xv0ivB1C4apkwtlJtpQmSOsXEs33XSCJKFC87tPt3leG9JF8IZg+oS1FQ6OacasVYaQhzCgtD2mmtIWRqeoR7NDbyo+qopzCQ/cG+EhcdPtzZQpoO+SMgHJ/2u6EdZ81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1mHQBYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etOCAZK1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuQPS3680274
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OejxzjR5/OFaKWBu3QblcnyM
	paklV8SItWhiVJcgI0Y=; b=a1mHQBYSz8kbrIYxgAxhl0pjQLj+2BrnZtlkfbAG
	C5Q4SiBW1ZTB6VmA3qtX/2BKNCz2aZdBk8lyinsiYw91dVab9QPbg3qN39MH51hQ
	6FCj/t/bSr5quCUEslmHrNA+6HNfMCojthIhWAExt7jjqxL7/+TZCMGybqtvpiq8
	upxOJI4C2HqWaHBEQFlmMb1kI9RFcj/xul1vnBPuVRCk4Ptz8y3m4xuGuLJ891E7
	M8Vrtk1hTKuwCtheuhUZtuEGyz5sTotn0iCwhJX2GbyPAL2G0E+3G3N6Ii37ZWoA
	r/gyh/0G+VkFMazYHdVHV8Ocwhw26Wbc6Y0QnKF6+1mnyQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j0n7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:18:36 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57563cc7576so4484670e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779293915; x=1779898715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OejxzjR5/OFaKWBu3QblcnyMpaklV8SItWhiVJcgI0Y=;
        b=etOCAZK1IzuY+/K8FewKOADIL8I30Wx/gnT+gVMOwQBGVw8ICXiQ6M/EjvRk6CdVjC
         Wvsz+T7jr27xR/6/QUucrQQ/+usVtoPKmKyw8F99qiw4Q9hX50EJnqbC2RCIbbTLmUT+
         DgwCe1DL0e7393Zc9QpE586+GHRLFlX4Ngj+dI2okqVs1rCkB86j1yE3lb/l6LwOzmFa
         1kSrLByvhK8xD0wcECHoY7QHX8qQVIoIkQzO0acQyYt6Dt82mnKxw+P82hexFgawQAn+
         kwNoKz5cT6ZOF93QEa6v2aLOmCgJTQ9M0AHXFcBc+DHAsxjg7G/TFj7TqQeoKSuq46dG
         yEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779293915; x=1779898715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OejxzjR5/OFaKWBu3QblcnyMpaklV8SItWhiVJcgI0Y=;
        b=O1RpEFNaFRcDyYk/cR8ametI1rl8zlR+iNpiadoO9kEFH8MQr4mIpKrpn8Sc8icjAD
         MC5RNbiJaz7dOQ2n1ZK/uSt6Nt4PoR5+sn/Fz6v219VzoJSvmFPGVdiFEBjTopNoKctI
         wsd8squbdy9wK0+pKTO+PadMG3EKLGCiJ3pGcPSGcoX87Hxms8xrsZGRjZFVxUv2916A
         eskz1mJXmnWuo2z3ZSkvI2Ht8C2bKXwB6geANoponpDOfUyrya+HfaphfvUeaZSrCeLa
         aoXWwu7bdIDCFY+hA9nYsfuOKkg9z5x9SSdHuBa3I+6RoVfSMKFYS5jP3QCzChBt6R/l
         HRrg==
X-Forwarded-Encrypted: i=1; AFNElJ9fDD3J9o72c61c+Io/9QdDRtbC5Ct9T8yrmmAOKVOqQ8LaTu78Lf3lVC1SDFGDFUQGnlMtHGqpn4OXLIkl@vger.kernel.org
X-Gm-Message-State: AOJu0YxFSDNzYkAnbchiE1wsisyDjHpNassQwPKvOPwgP3FdUKF/Yvm5
	QkoABLQxLAlqyrf7eBRofCbXCxUKQZPrcUqwa+UGns6u2XqTFUygwb8pSgdt4qKE0Y6e3qqQhrr
	8yYyXwGulWmTg5mov7tc4d5DutI0on/rqx6MG5Eja9ZE5pYn1EyK3M/ipe74oCip04NSX6yHQAP
	MI
X-Gm-Gg: Acq92OEBA7AWcBfvEPjLDQcN8ygS79Ubz4Juy77RMPVj6SJsIkiDbIuDqUcTNGNhYZh
	HnVN2gzNeNrYNGmLdLkNesnrCeIZ0ZSuSdSfooUcTAUPbq3lpL/XMM3ZS0mPDRCcxP8ucHi0LSI
	UgqpaIN18OFpIAk02dgXjQ8SBex7s3leMgDMnTam1o5DOfv4TcHpdfXPBSntL8iDprZBuoUzBRU
	M2fRVe6J5gNIkYL0jsoqdte4CDCTrikgwB0fLSb1DtIrxHVpTHXFuyRRdr2gXxViNVKmSZIpiYb
	c86yx/5OxtaC7ZgdPMAVjv23dwIi/vf8o6mklayCjQ2FhMQErjPC86Gbv4nQP4U4HYz+0cBChB3
	7s0BI4oymE1McQmwr90PbtwfaOYwpv409fBhUmF3cXWxZlySbeAgeFcA7vjTFfpX7wew4FKyxSZ
	pUHtOLWcyHtTQQz1tjy52AwKCNsXyXwGAa7aOqIrancwPmqg==
X-Received: by 2002:a05:6122:4d06:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-5760c0943cfmr13017460e0c.14.1779293914754;
        Wed, 20 May 2026 09:18:34 -0700 (PDT)
X-Received: by 2002:a05:6122:4d06:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-5760c0943cfmr13017417e0c.14.1779293914261;
        Wed, 20 May 2026 09:18:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm5023245e87.24.2026.05.20.09.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:18:33 -0700 (PDT)
Date: Wed, 20 May 2026 19:18:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
Message-ID: <b7bzxkagiqj7aptuahpiwmvxdxitbwozgxgoijkhvi5uymqigb@scqo6uj2lzrq>
References: <20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com>
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ddedc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=UqCG9HQmAAAA:8
 a=ZZPoSoA1xvr9cSmOo8YA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: xSMI01tN1RZ7ZHLEdLyhL2OsqBrztADZ
X-Proofpoint-ORIG-GUID: xSMI01tN1RZ7ZHLEdLyhL2OsqBrztADZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OCBTYWx0ZWRfX7Q3Kx6KmugJ2
 II6cLsCoC8cXcFex+Qkl3yJo/uaPlV/ekWC9dZUrlMBCAomDnPXyicK9T+Mit5XFtlGSHGU5NVU
 iYG6NkTJNqkRk11UK/8NBvPezGs+dMpgG+/10PRFlxDQAZf9KDr1Bll6T0IoMgFlyVmUvMdorAz
 a7KCzWwEhosZ3EHq0LFXD86DdurvAmDl/9NVuwMTt4sUPE+7L0i43sGu2AXkdOTis9oGYSTHDKN
 2hq6CrD8l8NMvY8860jXtC5f7JKpip1RJQiSDOKop3gjQHHbpJdEOT1TYy7IFrqO4Jtn7MvFjMH
 2YuXXW037kU89GKeBp6BFiqQJrMYESPYy59cUpmhBtpq2s9GG/cJfF170sTwy7S9ZQUxZPXQ5pI
 r5qyAKodakmclg6YuYfb2VkIwOZxG3dJP215tT1z9wz26HrTTnhRjzKicb9tigdoXSPasdrc5fr
 LXw4IntdBji12QgGjew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200158
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108834-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1E648591BA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 09:56:06AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
> 
> The CMN PLL driver did not account for the ref clock divider which is 2
> for IPQ5018. Therefore, the computed rate was twice the actual output.
> 
> With the driver now accounting for the CMN PLL reference clock
> divider (commit: 88c543fff756), set the correct reference clock rate.
> 
> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

There should be no empty lines between tags.

> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

