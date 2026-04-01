Return-Path: <linux-arm-msm+bounces-101330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOF6JX0DzWmSZQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:37:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F0F37997B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04CB930065DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DE23F8E03;
	Wed,  1 Apr 2026 11:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeLeKNmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyGGrMna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05053F87E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043216; cv=none; b=oq4N9ivwQ/dI605jy/DZuO6GK2JQ0jZEtyf1nSDgbycODobP+45+RLv9oRuOd7JACMS5+TIFZOqF7TrK1GxxQm0iuGMV+yYSvVFXdqHV2MfObwV4oA9dFqoXR568hCXAHN7TJ2/9mXzqHLgsBY48XtIKK1a+FoAgNndtSK8Nh2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043216; c=relaxed/simple;
	bh=ndhYHlqda5oAAuruTHIL0EWuEGC/DXdootE3bZQsaeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExJiH8A8tLmRorOtmzbe9ADwEA0yaw3oL2n4/zbRjPqP4JGC5AWKSpFp0nZnfagM1Jaag1OQADeZSTMSKrDJHxSecloXBM1KEQ+rKt0wAM4x6BibE9uAMWmSs+4K/nSuIbbc2tddxP85AltcfrXK11aFMSM7ZRj7/nMGRFD3zAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeLeKNmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyGGrMna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AJHkN1562623
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jXHMCZtX7PxRagNlvpa4IXFV
	bG++y7vSi5O2D8DYJPw=; b=BeLeKNmAR55lTJlndaAwjzWFgRBp6GldriCe+4AO
	sYyr0A5qlAw5WAcLdF4sx7CV51LhUU+jB/9jk45I3cjcwtxryVUHRW6vftSHaXQC
	ERFhXSo7VR3GmqPQynZwvCBnOhcAUZBwcLb6hS+vA+5C2UXIaNY7pXjHD+kQ3QKR
	YK5cnj0XXL/+YqmewaUysdozasHJXDXTxDaFnWgJ7DGrW5XftZRSSxmD513kDXkc
	jWl4K9NQLuFVuq0ZgS/JG+cacPo9SWj9/E81WVUpPbuSzM4PEhAYl8Di0uhIHHVy
	ifXcApiXjaansm4PQhQJzdqNz5ILn0KnTvy56Q2X9d26fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3skqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:33:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so94537511cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043213; x=1775648013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXHMCZtX7PxRagNlvpa4IXFVbG++y7vSi5O2D8DYJPw=;
        b=AyGGrMna+aesGUnXA6Ih4AHW9dS+eSjj7Ve4jZtuMBatoxkKn7JAhVlsVR2ybg2CJP
         sxVUVwd+NYkY8pksWx+lLNOMhYwQ2fajOy1k/k7l9VSMx8aRc0PxFwLErLZY3Z0mprc/
         zl/6oglNaFAopJY4Fnqqd3IxhoMGO5A9MfJXCzA1hPiFupKK6fdDEtUprL0M25pKWdpF
         bqNk85KYaEBbkp1iu+z3zByP9zPuTlLjQdBE2bw25NYMVtQDaBV2KepT2eNS/26JScMy
         +q7W8ALGzXbEXKXDfz9n6rh0g2hcRKseyO0S5qCrjCaKvkYTheXdE/PqRuGcYaw2pald
         2vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043213; x=1775648013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXHMCZtX7PxRagNlvpa4IXFVbG++y7vSi5O2D8DYJPw=;
        b=nbynhPlt3/JT7aZ9nsQbgGR6byzngzpRpou4Jo8aOS5UrS5QGsusnyMOntbvNvm0a9
         wBChIiXXY4gFGFh24NnUq++oH3IBUu7ZvhMfrLbTnmrZZVnSOZoWG5TSP0cSBiB5kCFP
         q3p7egOwrRgI2K5712LS/hlqM9Jlq20x3qbEfPvn23vxrD5HPPVv5sfavzHJiviQnWGI
         3F5fbpqcR/s6DCQhEiMuD2HjCL3p2XLszH1Ati6oZ7Z5GYGZDw1wv9POsjxqdT52mJ2H
         R1paD/CJpN82TTrMDacq7JdDUP6SNtIK7IkDOPC4Ykx7FZh8yws9/x8r069L5k7KkLQc
         lbhw==
X-Forwarded-Encrypted: i=1; AJvYcCXEg7nLiRaAkhnLAUzBPIAKoMeosD59TBwjc01D9XklHUNJAD1ekIUq+uRVQtrb1/30uOLORc+fiBscP0xd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KZsJEL8Rzm3+8SymeIHPxr7HKq13UpcNiKDEVVJgHRt82XY8
	bgh29TqM9H3LyI9vaE5WAIFEy96ltjJUIU+xWf+c5dZBr8OJSJ4+UPcxstxG26YpA5PrIVkbeB7
	q6FGtQdyxny9tXS25F/6cISe+/SlQbJIbp3lfJpl7z8KCdMTE2mbbOXxA5AYqx5U2dM/1lZYv7o
	0t
X-Gm-Gg: ATEYQzwAJSHDvgxPsl+2+cRrMzxE+7MIGDujYsjwnejXAGrKVTIBfek/gT+ZgOH60ql
	iD+Dwd9aP86x8ckqHfohjsER1v9S4lDOsfxzS3Sve/Pic7VBE7FWX8zgrolLUkx7FeydVrCW+zB
	6CTs7fdyEgXERvbdMCbAh+MaemweBimzOhElom+kq+z7gl3e/VUNnKVLxjoiuEyK15biXX8GxHu
	FwjDyMmCvmFAApQQ9kGb7NyPHeokaYoH0le2oUn7zfOWBDCLueTSyczj4M+s/mJwJc0XCnlhYgZ
	RlYN8VyR9/TJspkunakUOU0xVOiaR4HipsW3jbzY9k7sMMGhwTRSWKv0TUD4m2wNteqxrn2hdmt
	6RQCPzeFXJT7GYWlvWSpAPD2msBKy6uCXiyNa2JYmENOcwpjlx8IJnyKzKi+gJYfhjpEuN8L0z5
	Blgo6/dqoivF8fmWQievGuB/eymYZFB5f80uw=
X-Received: by 2002:ac8:7d41:0:b0:50b:409d:48b7 with SMTP id d75a77b69052e-50d3bcebe30mr43769301cf.44.1775043212941;
        Wed, 01 Apr 2026 04:33:32 -0700 (PDT)
X-Received: by 2002:ac8:7d41:0:b0:50b:409d:48b7 with SMTP id d75a77b69052e-50d3bcebe30mr43768911cf.44.1775043212493;
        Wed, 01 Apr 2026 04:33:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b14603d0sm3217033e87.83.2026.04.01.04.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:33:31 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:33:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
Message-ID: <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: jdfqOmY-vNr_P48_RjCpa6FwwneWMa0j
X-Proofpoint-ORIG-GUID: jdfqOmY-vNr_P48_RjCpa6FwwneWMa0j
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd028d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Zer8_0FavEUcD5cz1wAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfXxBttXfSPxMv9
 xhRSAm59SbPxuyh2nEe2dLdhMQXLnplUYSWS1Lf+fOWqSJ/T7e2sCRUDCGInWqnLPeOmM8MbkOG
 kz4jA9BzRIX7Poq5lz19WtFpcNALf8nnPXFqzW27AkbC9484NiAk51LMNL22gM7rcXzetKNHAHW
 OaIxuPn+YUY81mCr7ypkp+AaHUOiC0DBO03rECS4h9tG7mhLq/PLyxAfZMutKqxF+8wnlHL7YaG
 VQHkNNSjawuAmULzodSCoLOg7PURlTnLzmW3lXrv+NEeAiUuJiZ+7wNcZt6kURr/3ZpfPURACWS
 qcd7qPoMZE9EQotwfXLWy4pAS8meYsqM/hzRoJwh2sy9WThz9XKxVVqfPz8uZt3TcmxKAvdvBa1
 GcPdshUU4V/Q3hsRzvXgSKbaUCpjJr9rNR0GilW8FB9b3ebQe85tFxBgwu0RSEB93uioVd/Cirf
 gj/FHfe8GrgeZ4tBpSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101330-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81F0F37997B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
> compute clients open contexts concurrently, leading to -EBUSY failures.
> 
> Describe the compute context bank with qcom,nsessions = <5> so the
> driver can provision enough session slots for the compute-cb instance.

This is a software property, so it probably should not have been added
to the DT in the first place. Can we replace it with the driver code,
allocating more sessions to the last CB?

> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 6079e67ea829..5bd20909f9db 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -4465,6 +4465,7 @@ compute-cb@5 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <5>;
>  						iommus = <&apps_smmu 0x1805 0x0>;
> +						qcom,nsessions = <5>;
>  						dma-coherent;
>  					};
>  				};
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

