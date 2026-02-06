Return-Path: <linux-arm-msm+bounces-92031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDCdGT/bhWnfHQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:14:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1226BFD868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 13:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E7893003D1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 12:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D6D3A1E94;
	Fri,  6 Feb 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5PPhM5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZR2S+/qv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD4309F1F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380092; cv=none; b=X6ZO1wg2DBJvmTqXx2BdUeEyTrKF6uN14+Xu+XNSR/sCJej8i/h04s5xSlS20ZIMmgQLw78v/eXZplnN7HpOQXiAfLCtqFiyJrIko/48XU7y9TCsg6t+Vugmwyrq0O3c2FSKzVoal3Y//cTN8Vh/0d2BwBlscQOkorrLkr3P2ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380092; c=relaxed/simple;
	bh=AqV5qcxeN8nQB9BUdUK/3PkLkX9oXR7yAFtflZmPmME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtx2IyCm4FSXsJ+eHLjgsMBwxsIycAehiv1hfqOf0XdbKzXVAiqji2Hrb4zXria7HCyYLNtNZlXz+VM1WLNFighnT4pWelWmAMly1TKPl0t2Xb1umgwuHgSDiGvXY0oHp+r5mfrIiKtNIdMtRpDIgW7t3R0KzZc6VKrOschfrj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5PPhM5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR2S+/qv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168Iq181419630
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 12:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPsIZdUzqZugc9bxzUFqlSOc
	mpfL/VqW262y20s60Yk=; b=G5PPhM5yxnk5ggIdHn+b2UKd8gV/TPCp3A+WJKRI
	YjKUL7HTqz2LYKeyJiZiSsFHsFozV3RXMwCCdJHhyPA3xBjumGJ3Ae8qPudI1oSj
	NEIcP2jqt8z1Zxj6/vS2M/WALGzhIRdCrvXcl//zs06KueNMQ48Kd4Nrnr9KawB1
	p5lvvnGcy56IdEI9ewzALanC24zAfyrW/U+qvoiaEDpRmS1a0Siz5MMT+ku76phn
	etuv8i7DUl7eUYn8iQj+AsNdYdxZHTkcxKE/4eHzrYjBbHDbTS6dQF9QvdSBhgMe
	Z/OwHIDnT9bOqtmwsEr0RV/Dyj8N+FcSFyHxKBhiCMRfbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a9b7m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 12:14:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so238932085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 04:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770380090; x=1770984890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPsIZdUzqZugc9bxzUFqlSOcmpfL/VqW262y20s60Yk=;
        b=ZR2S+/qvYaStNaMlPWMUKkoFbWlZl4FC24p9W+lTmtmaZpoknj1x328Ji9Wjvvp9eL
         smMsOU3iRzkYxM4O3zklM38X4ohEebxN1f9DEcmUkOy3EslrLe8RZHj6ZPO3vJIyhdUx
         DPAfdJkWjY/b6OFUJf2SQGdspt/MCaE6Jfyq6A44CJ698bf3EaDex0ezV4ZDipP3L94w
         GDaN6UGOxljNnE1/GY92b5X8A6d8Rs31n++O5PbckZJJ4YMOemY2EjNz+EmdwHn3HdXC
         gGfdReqwkhEDZzFOt+dGsf2BxbARMa0bLiqlxieZU21hBgqU6OVtse/GbYWm1DScx3BY
         4Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380090; x=1770984890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPsIZdUzqZugc9bxzUFqlSOcmpfL/VqW262y20s60Yk=;
        b=UD/hqMuA6ZF5mQROHfgROG/VEH/8qtkubTD0mvLLm5Pdd/B2Kr3AQwDan4s3mRwcQm
         ODNNAlXJZODlQ/lVCynXiDOSUg3hTQdxJMujZUqGmNLjZoAxd3XFYW6xwoDid0orqe21
         5Kr1akNpFPepKbkHhMw+9zT0j4Sc+LPOrYMyXlHnKQW36+R5urOsbezmhC7JMN6/4MCZ
         N3k9YKErmi0toDK+wrSA4chTEuzEO8Qgr4tc324UAVO5c51yBqKzzUR9XFahr1gFLJg5
         79L6qH8/k2JIJD1GLyp8RlpztA0A/8syZUmCUhzsUY9lU+1F3yuWGfb7PPgbp6+DLOzM
         bGcg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6zOhZ9V0c7bJqEAY5Gs2UIKZxQw1ae0palxXgKn8zvik1p24u4YExlhhMRw/4SiZl05owEjLWCZBnJOw@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTBS4I90mjUgPr+s9jrQE8MFWl2HBbuqoIc/Nm851OqKVpaZn
	eLCLX0pzdgWJ1Nej9+EyyseLlGl3Z03ZaUbb0JdRA7kZ9mn3CfSIRLS29vF/PoIp9Aq5qbSImb5
	8hwF3gDbVJm55AZ4UbPAzzTY15u0cMJxqdQmPOi8HWhfLFxxhAOItJbaHuq4P5m5tbQc8
X-Gm-Gg: AZuq6aKnv2AILcgKoq3jHcBf+E6n0cuNq6YN3wN3aNJoL752usQsgQEbuTlZgceFpY7
	FypbddukaQUVJGAbHJFUvpssn/okCIkrCtfuKZbdYLzNxtRUO6RTBPBpMaka7Yu9SAIfvaw29JL
	xFmJmMrnwaykXO4ZKoDGPygUTZx3bVRPSxNOOHChm6McZTu+aa6y85jBsbthRSqq9rVzSPUG05v
	8EAomRwyfEzv/D9NYq116YqrFc9EaBmMmjJj9znHfJlnQuiYJzK/gci4hnBhvlCrvxaORciWbie
	adTCvMVw3XhYL5mzhjpWMNvDh56Tjds5S3Py7MoG3WsCCmZklPe4b2JcGz00PcGx9dRoIbdMPn+
	7v0oEgeasUMtdT5ZTmlM0Flrlhs2B3u4tO3t3HJU1RLGPEQs/OZ5/IAtuJDWBxUHMauDMFL4WvS
	QhtacYWp4OGdQYk4CuNzNitao=
X-Received: by 2002:a05:620a:4407:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8caf09633cdmr329175285a.57.1770380090143;
        Fri, 06 Feb 2026 04:14:50 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8b9:cf85:40a0 with SMTP id af79cd13be357-8caf09633cdmr329171485a.57.1770380089653;
        Fri, 06 Feb 2026 04:14:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6256a32sm4659921fa.19.2026.02.06.04.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:14:49 -0800 (PST)
Date: Fri, 6 Feb 2026 14:14:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary
 USB controller
Message-ID: <helfsilh2qi56laxsounbxlp5zn5yq3eqkrodgsgtzxevwokqz@usepksge5gz3>
References: <20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com>
 <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206104642.1038381-3-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-GUID: GFLquHx1lNpMN2M0qzdxMpgkPJGb8Hkq
X-Proofpoint-ORIG-GUID: GFLquHx1lNpMN2M0qzdxMpgkPJGb8Hkq
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=6985db3a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=cXx1XxQZ0LH0QdJvNiAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA4NSBTYWx0ZWRfX9mArfObqCLWk
 a+y+ReCqQ2uPNAb2bp06FjCO4xED9XbPX9G/fYcDdAnpNIUjIzwKu0uB7BAX27/cPYn1amRozAw
 94eLchctFk5GLXfLSNktE1zn3IzVHEgNNcwLbZ85hPz2/MGQvFaftaXMKJDtwxvlHsoZi3osMkg
 RuFrQlYR05xcJCyPqwufDHIwbJNaL/j9CdjLNnK7I4knu/W4tH9oPO3YlSK2c7n5q7HhuDAnGp7
 H4NEUlxfDmLMcME797c2Sm/HbenrUaxAmPYh7wcRybv6tNnF1S1keq1VEjQUGo33oTxL2w+EyTF
 jxIbUPEVYTgvKf3u8fcaz6lShCMfUhfkD/nTyMVoimX0g+G0EislpaslGzWVYuTZQKfHImjc+IC
 8pI0B4jXT7M3cmFR7uEYm5vrgOTNCGctRfXYu1o+L5rlKPiPSeIYhgnBuVvEmNDpzI+KqtcI8KZ
 fugyPaYyamsWW2xI2lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060085
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-92031-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,1f40000:email,a400000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1226BFD868
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 04:16:42PM +0530, Swati Agarwal wrote:
> Enable the tertiary usb controller connected to micro usb port in OTG mode
> on Lemans EVK platform.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 53 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 808827b83553..2710927c9172 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
>  			snps,dis-u1-entry-quirk;
>  			snps,dis-u2-entry-quirk;
>  
> +			usb-role-switch;
>  			status = "disabled";
> +
> +			port {
> +				usb_2_dwc3_hs: endpoint {
> +				};

Is it USB-2 only? If not, please define both ports.

> +			};
> +
>  		};
>  
>  		tcsr_mutex: hwlock@1f40000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

