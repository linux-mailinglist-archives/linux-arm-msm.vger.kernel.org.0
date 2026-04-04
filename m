Return-Path: <linux-arm-msm+bounces-101810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GFwEo990WmHKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:07:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32E39C896
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C7083004DFD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F16346FC0;
	Sat,  4 Apr 2026 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AylsMA2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0fy9+c+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1D21B9F5
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336842; cv=none; b=T38bk3S6qsZTb+yyqs/pE3vVmeyB6jt7viDStmjnkbR3EO8bhPzdtuya9sBAQac138lbbTisO2tFcBMTdB63ZMDpr8UeWlLSWEtNb45wU03RDF+0fBFpcyTjIBe5VutIzL+cTA8VkLWYBYQWkqmqut/rg+xtK62zgG046nfBaEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336842; c=relaxed/simple;
	bh=/fVdgJAOJhQOWm5KcDg8M2GeSwxKX8nP6dbTETS7570=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc/qqYtEzSbrBzPKke6w4Tw03IQFCrLgBqq6LEhUvtBOwl7Wmg4IIEEqW6Pi5oA34EjEnmZCYaRTIDQksTcrsJbE1L9rorktHp+8iyshBoeX+DZQhekjK0J8Mkb6qSCRvkc1ig6qwOHEd9hIMkAAPWJDq+h9sggIX7gRi3ls+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AylsMA2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0fy9+c+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343QOP43673709
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UoNupHwgrjCi79COtfqRtJL5
	HBQmDyoBGF3robCpoBY=; b=AylsMA2esbq7Aa2buVhps8rOzDbT+wekroOth1d7
	4jdllW+5Kh57Y2e/ZqU1IKcFqk9YLGgi0qkuaoAvulnh9KnCRzaDM2D9OGyVoRUG
	2BfhQS5quc/zntDjDG1H8EXSDxOISlMG31+J6E9PwgY1olzjihGNFAb2/mMqEJ8H
	U2PgUj9PcEFmYa/WeQ2Jo27fnfY8LPrO/+K3wKs7HnTg6g/1qqlBVQ5Z8SCy2emd
	ZkWcqLiMhGKERS6HPbjZt8D93x2vPIeYaeuAYKwxYjgxIhCbZn5FVAvJZ1TEPrIr
	HDXStfk/xr51TnLPLwzGm42e8QtWWV86urCeswAMI24I8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqshevy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:07:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso73877481cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336839; x=1775941639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoNupHwgrjCi79COtfqRtJL5HBQmDyoBGF3robCpoBY=;
        b=Y0fy9+c+hRGzJi9yaJg52JkPNCIWGTWH0s6jOfc0j1pU4/X7x7+T6NtYCRJhLRItz7
         XzSQ0UaT4ZHjFskxq2E8nUgvLBiAa46N9Fzny+Ig400S9DRbyuMR3yoWOsRGPLT6Ff0R
         EjyN3DomrvchSChqqE7kA8zijsGaP0uzM/ilds8DKnAuozzoBvzdi1KgbPHAnSm9IKVy
         xITR+HY9V8aagCkzA3RPIXU1DK/nAb785z4fzM3CyntNJ0NI5UzWFLyGOPfaKl+nPJGm
         4GH9rFNTWE851TfkCKy0eKLIWkcBW9scnWBsRA2sG/gG+9SzmBDlbrUCiirGHbaSADoK
         3lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336839; x=1775941639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoNupHwgrjCi79COtfqRtJL5HBQmDyoBGF3robCpoBY=;
        b=OfEra1MAsMRVXYFrldylskp6FU9QIs05cIfpdpuM9n0unInqS3vFoBHC3xPPDXTeaA
         ve7iHNfDzOKpK0kbnztGWBWhLERwcctBX4f2gyGn68wCFxORV+nFgLGLAsJfGuJsdsm5
         YV9/c9drWHPA+Cz77F9C20PFrPl54eyUKpfrRB7XLT6tNnUNg/e+OhW66IH9hTouZeA6
         fNYpgtQfVAo+h5PTM1CVwq3hjx5FMSIyK2yTtG3lRTwUSUB50iRr4vN84CGnKIOS4aHJ
         Mk2kfQTOkho2EPcnGrH7PLh6dH8MlEMA4CCn5DB14IMn6xL+L4/d5OtLwAmjgD4gspJm
         0bkw==
X-Forwarded-Encrypted: i=1; AJvYcCUlaunAq6i/dMr4cvwtaNJzwjhj1Cv1MyUY0yPTyqGp1Etf+hc88c0cX+hhJMtFWqgCv+FyzK1VsWAZOESs@vger.kernel.org
X-Gm-Message-State: AOJu0YzZIGhhjF9bxmluFc67jVu5O8TFpJeCHWfJ6XSj3k+6USMGeSNr
	pVBi3Y9uhoruyef40kCTlUoOZJBoI76cGirSnK+jzhU9Yw1wee960ezyqPITChfLUPVtI/m8YJs
	P+m+r2GMnaWkKONRUqx1xf6Kz79IuUP7wfdwz8iGLXi6KnbgzffzlunWYOAGw6E+NCMrFVa7KLy
	Dx
X-Gm-Gg: AeBDiet7PZ3eF40S2fnoI/x8pFrcT4d/nGmTMwCPCXnT/vIZh+EEM5FeSICJeUSgiRm
	hwNrC1b6nVryvcD9vlUWseMvAEZi2Ex3obEElNnhxQLWwkxhuNA6kW2IUoH3Qwkv+MN7HiOCR8t
	OEl5cM8uXjC24ZFi5v4cNwLMU2h69UFf1bXjzVvU2CjGF8NDHIyMLNQfLoK8D//vprGM9zAoA+u
	wexGqAFjDHrCyluvEhlRo7hWi+QaYpm9ORLvH3oiswVj6X+Bf+GCczrx3GyUjUkATnGPu/AshL2
	3f6VJ5qd4y9VAkTzh+IUgywEMJFMayaOYUO9t3K7z3QghBtrSsVV4CBXtcFamig4I/8JWpgqZNk
	NKp7yPzF25/aDfWmSyR4FqPvA9jXrHZI/RRfFFv4TxgY3W//Ur7el6aaS2pqgD6u1YKYtUv9aoh
	xcyP2ZfmPw85XpbwqiEByCsEZWO2ARbur6HEs=
X-Received: by 2002:ac8:7d4a:0:b0:50b:ab9a:eaa2 with SMTP id d75a77b69052e-50d4fd46c5emr132187261cf.40.1775336839156;
        Sat, 04 Apr 2026 14:07:19 -0700 (PDT)
X-Received: by 2002:ac8:7d4a:0:b0:50b:ab9a:eaa2 with SMTP id d75a77b69052e-50d4fd46c5emr132186971cf.40.1775336838669;
        Sat, 04 Apr 2026 14:07:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5fbdsm2260486e87.43.2026.04.04.14.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:07:16 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:07:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8550: add PCIe MHI register
 regions and port labels
Message-ID: <sdr64ldaoitb7rj6a7eupmqrsh47wgir6nkbsnbsv6bpftiqyf@youdquby6sog>
References: <20260404-rb5gen2-dts-v1-0-895f8fc494fc@axon.com>
 <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-rb5gen2-dts-v1-1-895f8fc494fc@axon.com>
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d17d88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=h77gEMGJAAAA:8
 a=T-JG3vmuzL3lLc9ejwsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: hgCeRmDdhVXCWRSbQ3yjyCdKhvKxfnvV
X-Proofpoint-GUID: hgCeRmDdhVXCWRSbQ3yjyCdKhvKxfnvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX2lQSDFBaEoJT
 m9qNgPR3xQ1GnNo2m829xM63RD1W0fYqsL1j+X6slLPCibDiqiBw3jVdX0Tvr6CGXoHvmclmQw0
 hDRIwteq86MVz99So/BU++tez0RR4CuWa33HgWv1ajJuOOXwuZrsBJTYKCai3Pb4jT1J7oiq6gg
 Y0IuX3GXZ/t6onerJt6Swusrxvm6CKvCD9Co0im1A7xoAnu/z5WuSEhhJhnh5eQfuqB4CunYLij
 UZjSGAfx83Mq/HTjUwx9IcynyHtiABReo5n1Z9cnegu3rpGAf24j3juWKOhgxGfTdt7LXSmUCOZ
 3LZgOxNr+hIfrzQor5nypXzzEf3Z5izcHZGq/VlVOZnX0HIp9DyAUCH48iE0w29Fq8/OdrvvS/5
 pY09HtCyr9TgjJnGOaoJmv7bhz4KDgIHRhWJTm7OE9THQCzciJqy1pRlnHo/d3nd/v+RSYw+7J4
 43Ph9w28F+1MPhggqnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101810-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,1c08000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB32E39C896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:50:54AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> Add the MHI register regions to the pcie0 and pcie1 controller nodes
> so that the MHI bus layer can access controller registers directly.
> 
> Also add labels to the root port nodes (pcie0_port0, pcie1_port0) to
> allow board DTS files to reference them for adding endpoint devices
> to each pcie root port.

Two separate changes, please.

> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6f5e1cbb8887ee0bf9e39650dc4ff..d4caf4d00832d7f1e8f65bf2bc873cddadc42168 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1964,8 +1964,9 @@ pcie0: pcie@1c00000 {
>  			      <0 0x60000000 0 0xf1d>,
>  			      <0 0x60000f20 0 0xa8>,
>  			      <0 0x60001000 0 0x1000>,
> -			      <0 0x60100000 0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0 0x60100000 0 0x100000>,
> +				  <0 0x01C03000 0 0x1000>;

Lowercase the hex, align vertically.

> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
> @@ -2092,7 +2093,7 @@ opp-16000000-3 {
>  				};
>  			};
>  
> -			pcieport0: pcie@0 {
> +			pcie0_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> @@ -2138,8 +2139,9 @@ pcie1: pcie@1c08000 {
>  			      <0x0 0x40000000 0x0 0xf1d>,
>  			      <0x0 0x40000f20 0x0 0xa8>,
>  			      <0x0 0x40001000 0x0 0x1000>,
> -			      <0x0 0x40100000 0x0 0x100000>;
> -			reg-names = "parf", "dbi", "elbi", "atu", "config";
> +			      <0x0 0x40100000 0x0 0x100000>,
> +				  <0x0 0x01C0B000 0x0 0x1000>;
> +			reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> @@ -2288,7 +2290,7 @@ opp-32000000-4 {
>  				};
>  			};
>  
> -			pcie@0 {
> +			pcie1_port0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

