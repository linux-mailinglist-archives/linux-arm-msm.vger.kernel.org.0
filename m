Return-Path: <linux-arm-msm+bounces-95649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHTsLcKSqWkqAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:27:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 679032135CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3D803068FB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EFF3A8725;
	Thu,  5 Mar 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGi4ReWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jqk0Xz4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520643A7821
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720576; cv=none; b=JCP093Kp+2rZ4Pf2MSXMt/zIm39xzL6vhVOgB+HPWFOi6Va/5Yo/SqY21hDTEySY3qUTE0Ib642fR96zCS0Z0wNAKnW9jqFlwd1LaX0/rzF8eBOlaPxVmHrzY7HWfPK6LWHKDdAVQooK/9DSnQpalWiExNX0jPJoM8vGnZEcw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720576; c=relaxed/simple;
	bh=N9xgla8las7B6JyuOjCSxbpaUx+LgHC/nPl4af6FJR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4kGVs97ScuMK02oFG8e6eyhWhLKfbcUjFWQiVh8curt+hhuQl73D3kFv0V4rOaA5tlo4oe+McNTLN8Z3l1kUlcoJqLvb3affO57NO/UEMr92HnLIyIQvAc9YnUXc2ncqzGhZJSeaQ8wawEGz69hKfR2uRLeKTUshMyhT81SVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGi4ReWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jqk0Xz4H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AVQMA2399709
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W7tzBPO2MLMD5MTI/R7F7RNh
	cK1aqMT3GjK7fkZDhWc=; b=eGi4ReWefLNMPp4uzhH+j9W/JG+ma5MkjeZS2bzb
	RI/CqUnBNFG/uL3d/KI9clpujNRZ2kGW9nSVv3okcig5W1oY+OYYHnUcyBbsxUPU
	C7ykapH+HjxgdQtHE+tc6S5dwsXnVyB8DdgbgGt8Eb8eeqtSQ4fmrNr1nknAdB1M
	b1lTseNmMhqplApmLnUb28uLePmAQ9p5AOMwrnYi9WA+EMIEczpPwStxFsDfYBk1
	jv+pNMmGpFyAIEH4yguQgliFolaxAN9c3AdUToAl3O9TSEyvCSsqrKDaGCjZ5q3J
	DGDQQn4IZ4T5CaFceCijWuHvt+O7GgRVppSl7AwrQfRR9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dgn4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 14:22:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso788985085a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772720574; x=1773325374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W7tzBPO2MLMD5MTI/R7F7RNhcK1aqMT3GjK7fkZDhWc=;
        b=Jqk0Xz4Hoy60zfXPr1XHRqMfseybYzGW5cZ9JxotpdOxJ6rT0Otk2e/F3mGqwWxEK4
         CPf5rOsHwosQMUDEfqrVUrM9WWSunDnDokC6Mz6Z3dNRyavMP7ITqSPVb8fc5D5PoZFZ
         j2WDnizMfJ7H0GtBOZZ3AlUia+mTw/Frlm4EoCVudjhltXBaA61DbZXPobZfSe7SaSlB
         +nA5/C6yy7PRonZIy7wXmxcHXvyMMvzVovbOT4RyHTuPW6IRUpNk4TNjpAHd9hkRVGnt
         Mgjb4xNr5yrU4t0RHmOLGaOEuMtImIytfgC3S0awonHh9nzOHFbOdabDLd5VwrTFyvKn
         tQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720574; x=1773325374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7tzBPO2MLMD5MTI/R7F7RNhcK1aqMT3GjK7fkZDhWc=;
        b=Kg9fHiAHxRZ8KprVKlVOY/BgliAwfsFlaECuX52TnYwVmk94qeBJ+N91pqxNC565UJ
         41XsBIy3ObFFQYZGspZI//uQG2Ms89bK7JG++vxk9wPd3OkiW0M9FG5LJwqQGs6mim8H
         X5s9yaiGLkYceipyQqESKKf5jEg5lQykjSIt347Q5jGO0j86iHDfrQ8owA1/QQQnrQid
         vY6IdhklWhbDo54KknkQlKVfYZRDnipvZ/I7axTuYFkNvsmZq5eyh7hY9olOz44Lwepn
         6p2+Y8M6YEJCWwL7wog630mbCf7zIMl88DrhMvlFye79TS/5Fr8j7h8qfrDLCoIr0dNa
         V8lA==
X-Forwarded-Encrypted: i=1; AJvYcCWnB2eGVmmbnVBiwo6TQQLqgCvtOMKTNVt+nxyGvwdATggGj89gfRZ0PmHnNfzkNR8kv0OPZ6+hGCQDc5bW@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb279soVn6SFHkJ4FtKcCwdN31hIi1ZO7PICaI6HOd91enPDxN
	bO0djJPqTEupIBDdiWdu3KoJQmm7CAbgFm1eYlMdz5GJaYHx2Ox4M06mhfkM7ADpRKCJPszb5Fl
	WIijPcGZ54p3FZpmUTrd9mgFB1Su+dTY1j7oHrXoJb1ioenNkR/D4CCJzMjnUkeKGwB0J
X-Gm-Gg: ATEYQzx0UAWhC/GSgWCLSI+61XDoWKXCksFU/Chxxgz1S6qL5JfM+4G6LzbKiE5KDBC
	B1yZ8m4Czf0GqHiz/NMGs7+cbONmq4XTb08PPoJzbw5BmKE384jP9zdMnAECJs0PQP6kLyEVbXZ
	Q6Epygs82enAcHRXOR3ozWe1Gaz5lBMmW1YqWVn019d93BAGGqHUJvXfZRT6nouPd7eiwjl37ol
	mSkxUg5MJYVriFDpNSmMY47G30e456G7WFaigK3fj3IAvdNrv6wWBWImmlMJ3ldSkMY6uY1oizx
	txKJpo2GcemxHr/Qa4BX12F8pb1FHKGbimeQV4Xfj3edLVda9z862JHSHU06Foxb1Z96qLBhObx
	jmFdyzKteacSep8EMZ1X0zxaAJ8SDWwF8O84j7iKmbcHCAHnyZn+MEEPG4BPBFuqhzqkhwkSZLf
	vrc3qvN+QqUWvYWhg7SNgZrecjp30x5LfCcaU=
X-Received: by 2002:a05:620a:1a10:b0:8c5:32b7:210e with SMTP id af79cd13be357-8cd5afc7e0cmr604155785a.82.1772720573644;
        Thu, 05 Mar 2026 06:22:53 -0800 (PST)
X-Received: by 2002:a05:620a:1a10:b0:8c5:32b7:210e with SMTP id af79cd13be357-8cd5afc7e0cmr604151685a.82.1772720573084;
        Thu, 05 Mar 2026 06:22:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1325b7441sm463530e87.22.2026.03.05.06.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:22:52 -0800 (PST)
Date: Thu, 5 Mar 2026 16:22:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for
 PCIe1
Message-ID: <ote55bpqiqkzthr5toyopbcaipevtyyq2ve2fkrsyxbmrtlbhu@gifadu5rxul7>
References: <20260305-industrial-mezzanine-pcie-v4-0-1f2c9d1344d7@oss.qualcomm.com>
 <20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-industrial-mezzanine-pcie-v4-2-1f2c9d1344d7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tSMEVw-RJ3Ywpp8gEAHgKSiJ5pVuIHZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNCBTYWx0ZWRfXy6P85fFsTtPm
 9b43F1SNhDQDyY3/MrpYRXIw6YLQnBsV2cTDNFvXIucjTIwBNmnq2NxgPp5gJUGAbHiW8+Zw++x
 ucab6XsHvF+HDE/H/4OqdWdrk0SFgq5aTwjkFP4TuIsf2ITctd0W+lebCotktYGYbJW2KSKv9b9
 Ykx7dvZifKC2xwYv4uk6muMQHTh6PDfPnACIJrtU+LTAxrq+juOEKXkHHTENcBUfugzE5PWT6jx
 dSg4AT2ItcoHS1EAySjx4eU4s7n6XDVDTKn89C5m1up/nlKXYR+nvbdYkzOJpD8II0uwt8Sxdmg
 FfVa0Te1WOyb2AYulAXeXfuvYhSSdHQqnRlStCkqglbGqip9TsSlK+eEitrWi79VKeT36odONwT
 M2ofIhEUu6NRMxfWIyXY5uVso1Ljd+yUuox0hpOLFebx1lVmgeAUaoSPfPRrKW8cWftJv6FLsQ3
 H1WiX7ILR+ZLgUowoAQ==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a991be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0eh1lDOh_YGwDaDwIBMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: tSMEVw-RJ3Ywpp8gEAHgKSiJ5pVuIHZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050114
X-Rspamd-Queue-Id: 679032135CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95649-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 07:09:32PM +0530, Sushrut Shree Trivedi wrote:
> Add a node for the second TC9563 PCIe switch on PCIe1, which is connected
> in cascade to the first TC9563 switch via the former's downstream port.
> 
> Two embedded Ethernet devices are present on one of the downstream
> ports of this second switch as well. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> The second TC9563 is powered up via the same LDO regulators as the first
> one, and these can be controlled via two GPIOs, which are already present
> as fixed regulators. This TC9563 can also be configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 102 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   2 +-
>  2 files changed, 103 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

