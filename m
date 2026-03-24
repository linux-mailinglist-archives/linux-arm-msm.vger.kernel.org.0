Return-Path: <linux-arm-msm+bounces-99736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF+HIS38wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:03:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CBB31CA65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E66B312396B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22922459ED;
	Tue, 24 Mar 2026 20:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4+yvi0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNIUlDgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9172E06EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385856; cv=none; b=dohDzEu0hWuRhiss1+VtnnFLuZdbJa9tX+O+K3+LcCl7+QnvDyqZ71tMN0jb2JDSv3bWg1mHsBRh36KvPXD46uBfDaB0NLDT56n9LpMkLXXHtRHTmV4e1brqMLXLjMfhGOBv33Z2e2bxeMAk9kEXhHLELfyGgwEdRxD8Ct+V1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385856; c=relaxed/simple;
	bh=aVffKBe82Y2JDZLFV3d1zJCx0BR6sZKq3+fXXaPHqM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBR1lDAHkxs+NIY/KmvwUOkqCW7ze1/Nbv9wHtpTZJxqBDcC/Mych0A1LZQRySWFTi9g8WQh1Ny2ZRB8SCPsrs7UW2XsobTfxNrNr0enuaoQs2gvMMnD5aGvbzav+HJn9Nv0Wyl247mfhR+PmrboHs1k+WLQUeqPEmzCiBx3Xx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4+yvi0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNIUlDgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD79x3731512
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K3NdLMxVT8hyMSZgwFoPCL7F
	pdKCgNlTeb97WvwOgVA=; b=M4+yvi0Q2drUeVzdapFX38mgqhU3/ocdnfxXVUXi
	qdzarfXCt+M9P/a+l2So1aPiYU36A3FopVubUW5AvtQPkK59VzRMQFwguGwpfH0u
	Y17CE7kibCTseKGMdIJKFurb7eE+UX6PuUXKAEeyzTu9WGO9CTNmj3IzIJUuR02/
	PZdxeuegG3XSIaDbidB4iLycVROAN9B8RRgw/1Ed59HXuoPmyLBcsIbkhkKlhhzy
	0bxEzHty7JX84g2KSOZhsZ4WfhxPRGf+EAzht2FrXB6dhT9PiTNCZhCuX4lBUFht
	fmN2lVbOe8n8rdVx/0QguPePzINvrF659nP0hanfJcGvrQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qketsdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:57:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso15897371cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385854; x=1774990654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3NdLMxVT8hyMSZgwFoPCL7FpdKCgNlTeb97WvwOgVA=;
        b=JNIUlDgiiu8zNaJm/eiM2unDqQ9qS5uMBe1XEw7UCVRieTE7H8wVhsS5VB0CNKo6Qf
         AC+RH1NemKUxjOnKG99SDg40TuxcZaG5htwQOsc+IZQN4TG8kg8urmcuAP1GHtoBGnEl
         qaZuOyCinYFpd78fPIQdGLG1X3UR2iSvIWQCezCmrlr+MqdYckflSalF+xLGZVaXiIhP
         2xiGmnLrlJ/D0hrmjAb206BcAmOGjAFRo+taUANpvwi8pG2o15c0m4eG17wXT1DaOeyV
         OuDnhOU0R0z7skarLtkalgQKRPt1bEK15Or3doMF+rNwb2t8JloNRA37P8PWwMSWN1Wq
         aL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385854; x=1774990654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3NdLMxVT8hyMSZgwFoPCL7FpdKCgNlTeb97WvwOgVA=;
        b=YWDt85YNfbaNJPqtZdOI20vKoyu9OPWPnPoOCs3VmZnZ495tHiMYAAqJp9pG8frp/Q
         +wXBTVSjhkjiEiFIM8hKQGCxZCDThp1UYT7HdpNgBF895GJ3Poki68f0cmUX+I9Mb26W
         uFFv6U5x98adDaByXGXeQtA7eIGJXNjiEmDEzUd1ksY+nxJvUFk/fPd6Gpe0oogQtOLB
         8HwboBZgYFv190H+ZLdb0xOjaN86U7RfViOjvrVGmAtgYLhR4vi46oOtDQN0L5sPR0Qa
         2vtRgMqx5H0I8y05qHSj3mCXzOmXIDJySU32sNdJmEdI5abk4hKQhLlkYWJZ9En6J/f5
         hGCw==
X-Forwarded-Encrypted: i=1; AJvYcCWVUGVpujQe889BikPPDdxJ3v3lJnIGgdrWZ1Pl9zWy0vQvsbBofMsa8W5YL6OL1ECvan7kV5t7H0rgFNGJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxICXeHWzMFn9KA9sP8UsPAu2CXEM651MHxzbGT9KLnRlxGhcng
	sYXfnVP314ByXUqEl8WM9Niz4cBAWe0sfuWqyXHRvMhDQxusf8ITklZESwLlEcUL07qkDVhmz6o
	d7jN9egP863slfEJE+YxYSdyJYeMQFbHM8IMDDtZ787NPDCN1TZrZA+93kUj1pl9gZ25h
X-Gm-Gg: ATEYQzy4b3myVHS1UNOm6aAqz9+LC9T53BoHPHLuqk/Qqa91GhFxMcwIGeQ62b208Pg
	kWqjkjcARDquaLEO4w/9znK6FFmKBafS0wJXZfkSheQdhoO2M+fQMFsTO9a4dyhm9TTR3MqlByA
	ntqj9n059jX06pTzwjoMdrNzCk6wXmEakPtQfVElJkaqsJVFg58vV1+2sJ6KO+1JJnYetEqsoOe
	2LF5PgdjFQwCD6QwuCnxlqDkgikRyzPwWfIZpIAOPRtR3/StIKSEc6hr1YAB/9xXn3+sT4lIJC4
	E8ganDNXbUySU0ouXl0OkqTsyRg9YvAVCVQ56haNtLzpwHtP6SIzNK20uDvsEHRY+n1Qb5oskv3
	FE9DvdedpgVLK1vGdpxVxPWjA2KLCmWTExW0x+0OmtZIR5ppLMJqlphfENYoqTdByBEWnwX/Akl
	0AS9kL6EEYjjvlAVgrehCJUJum7SsFZjcjAPc=
X-Received: by 2002:a05:622a:aa13:20b0:506:a624:1939 with SMTP id d75a77b69052e-50b80e8a8f0mr14116781cf.51.1774385854018;
        Tue, 24 Mar 2026 13:57:34 -0700 (PDT)
X-Received: by 2002:a05:622a:aa13:20b0:506:a624:1939 with SMTP id d75a77b69052e-50b80e8a8f0mr14116521cf.51.1774385853569;
        Tue, 24 Mar 2026 13:57:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207476sm3402419e87.47.2026.03.24.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:57:32 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 03/15] arm64: dts: qcom: sdm845-lg-common: Enable qups
Message-ID: <ckq2s45fts6d4vreghu4h6i7bodjdxqfywv4xmeamdrkq3ucl6@fl4pjnczi6cn>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-3-29d70ca1651c@postmarketos.org>
X-Proofpoint-GUID: NMuDHXxAYRc5G9GXdxtIpwPz-Ky3nU9z
X-Proofpoint-ORIG-GUID: NMuDHXxAYRc5G9GXdxtIpwPz-Ky3nU9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MiBTYWx0ZWRfX5ZcUn5iDVivK
 pc0lWOHSHwNE5kNOWEtHnG37HH6khfiid9TJvDmHO99u7I+QFpQIHm1QeQdLpyBjhnfH+QhXjL0
 eAL01s3pjrPmUPEu8PkrA9RkVTwSkdNVnlK5Eitx3qWmRcCoFNkQy6MNGshLzgTr/GiXiR/dFzr
 qqJ9KDAOa61nFwQ4H+xXTvk6zGHeFpuR5e3knIRDuXiB7vClNsqr/CmhYURtm9FLdhH9JDSp9uY
 ucx4+10bgbU8VCGkKxvGQlO55V2i3cHFdPS765bENv5U37DkE6s7rHRg1TTwIs1tH4W9Q/CxMr4
 LqLyVgaZxboHjDeKvGBY9+yvj46bTcNbYbsohWFONpbcXFHoFvDYm+m/yL4zaWGJ3sBxDcN0qo9
 KAOsc7bfYDMw89+SWucYby0hKl4L69wuRE1/wje/Y5Kv9uHPIrnYKYpugBiG2jeYSWRJ3DQ5BLy
 +F4G1VKPEPjzcmHVWRQ==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2fabe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=wMieUAD5PgN2zKFp72wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240162
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99736-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,postmarketos.org:email,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15CBB31CA65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:06:33PM -0700, Paul Sajna wrote:
> Qualcomm serial communicators required for i2c, serial, and spi


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 87ac41ec2e46..eb8de8d01177 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -482,6 +482,14 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

