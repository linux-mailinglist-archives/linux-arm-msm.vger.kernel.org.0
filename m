Return-Path: <linux-arm-msm+bounces-100467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fa2AA0PsxmkuQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:44:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C83D34B3A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65528303FFF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF1C391504;
	Fri, 27 Mar 2026 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqXlApiS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeX1k+AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0EF37E2EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643188; cv=none; b=OANiI8vQV/ZNklwG+3cchItXIADRTmFkpMAdiDI75wc/8Yl5k999uJf3lSx/FYP5JYol2DDrlfF2i8vmQGjrtH946euH8cVmXKVGDwsUOL13JwvM+MuiGrY95rVCARxpM3ekAjA+VwcQFQ17VtBh6+Yf38Z3df3Z4DO/Q5xOvc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643188; c=relaxed/simple;
	bh=mqrGOK3bV4+Mv816ostwLS/F3TkK5+y/o3ikizkYu1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7jTwcbWcegB/uRZvbXNmbU5YXrGT/d0IE6CuWWPya8vPrH+e1jXAmO1PjMLrpLHphwJEzqX8cilfGXU9hBM2IX7f8dc6QILHPsqMuMnGs7Tw1qcFNgPr/98Ec0nN8dWXdEs+8bBrIWYPRnuvF9mispRQxgnXBu5k/7ZH/AoQz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqXlApiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeX1k+AI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2PUA4030455
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/5yZyJwUuEfqme71Zell/ZV6ddYXqCBeg+PUgKv5SY=; b=RqXlApiSNP0TL7CV
	BnwzBy2nF+SsSJjYWhr9awB9TiyL0UT6GacKh4WL5NYFAZcIGx+zIQHHF5PSgTUB
	uWsWyZxTI2GVClnciCU9CQAQ18DkcySmcMF87GDWqWlKbPJAyDVmTgeRncayO0aV
	RJZvsLFb4KP6PXTwQ/DisTT3hHyP9Ge5JDi/Qd6XXP4S38O80HYXL1RHADenopmr
	w4iLcfFqzEn0eDHdjq7AvsrmK4apQ/MZJvmER/k1ZE4Y5iWmR+lwLeg9xQruMapT
	Zc2i536hQIPR5OC2G3v2RyII7qSC7KlCD5q35JAyTBZKKUWeeVzsJkz1ABkwu221
	DWD2+Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b12jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 20:26:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso116527121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774643185; x=1775247985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/5yZyJwUuEfqme71Zell/ZV6ddYXqCBeg+PUgKv5SY=;
        b=XeX1k+AIxP1VFIk9GkmV5z8d0g+xR7itHnkWBRu/JxXdKDFPZYGlUUAllhELXUHzE7
         ZQpYs9vzK1hicJWMIaXSLY4qdjuQLA2Vxqh35TKp5QWfZZzVKW26qGCh1u5p+gBbBO8v
         lroM9qoid59dvFy9Vv/h03qgRYrSACfiK+sq4RzAveAiEs18JX0cic57/FPNhXcIILIH
         IgseshUg4ZU5vSUxEvYWfO+c0NmxFODBJCbLR/6ufIeb3NuhCNxYJcQ8bgSUqin8Oj/n
         k8LmKHjlv6ytZn0Pvw04+0iy5PZROBmVhVMWQXyQ0bKfRrcTVwPuYoSqh68h8NAwrSSK
         yE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643185; x=1775247985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/5yZyJwUuEfqme71Zell/ZV6ddYXqCBeg+PUgKv5SY=;
        b=eJW6KTsWMb5eG0wtVkJJDQpk5GzZbYxBawmZaGFojxSzpX+jAR4wGB3j1p0edyV43q
         Ef9uNuHtwNvJWYPzKC6hcNIVWC2fvOgxLsnzDqWkY7R1lpwzFAQpyut3AM52nnbvQKy+
         BnbycGp14E9F0p2tOS3RSAtOM6KVMgEVhqoZL5RDELThKLazW9+I+p5w0+ge0L8U/tkW
         Q5yHEeesZJf1P0a+HXhTlZ98SuuqC+VOl1BWR2lVUjlhSx/AIh9nSagYSNuF+XoAE9wl
         SDaVlrq9jJ3LzLPhEgG76wpW+MDmT78OiftwmfuZkjVmYJcWCVxZ+jQLXdoDr8CIudKL
         H3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjOuWgI+UnPZTo2Frinj/lOiEuAk6oYJo1fi1QYXtoevu2lmMVHBlFZUnizxR1UqAc1ZD64ZenGFZ28wz2@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQMV0fjbPiryOxp7RNGrX60NE2Y3O8YL45fvrgDDqFVLkJsUS
	IaI+T7VKZFJPaLh47Re1Owo2vQCZDlh3Gk0vXQStHwp0BgsR67VfCk5dYOc6pe7OWv6zwwWtSg1
	HXMuaov8hqaYIDQmw05D9gFGeTYbIaol/zelsg0Hx/nhd5q8TZPLWp7AxypnSyC/X3Ixl
X-Gm-Gg: ATEYQzyuGFyA9XU49XuyQbIxsmPNbR/6IzS0aMY+P8s3sLrrVB+nK0vRJmWva0GJfvK
	2zKmTw3DVoneXPIvmgVCbc/h+PK9c/QkMaK1CtYiFXpCbmqE08ZktIwGKkLrSK6SMbFexmJFX1T
	m6HhsF4AxjjhY6wIySbLeoGl5u/qvRR9COMoMW1BL8ncjMEFfAq+AT7s9nubjGqWx/EYAh0s+V+
	oTdFxsepIga5Ouce8VaT/BAqe/y7m17Yn8OOEFym8dyCrnQS8aHOA575T2zCSVWgdiHUakRTzlJ
	zMqihb/EaO6peiyMwRutZ2y6Xs2E2T3uw60nLpEPm0nsLa5KebuA0vQNcAi+kCIPtSDeogP3at4
	12+ac4y16uy7bo1zpWpTc3ly3O5O83w5AcqJdJAzYSPGIlvKInfBf4NJwYFOKOLx6YJu7gBTcSi
	kNm6FKlQVFSLc9sYN1H9SW7konLNJo9E1JBjk=
X-Received: by 2002:a05:622a:610:b0:509:f1e:41fb with SMTP id d75a77b69052e-50b9938d03emr83047301cf.6.1774643185461;
        Fri, 27 Mar 2026 13:26:25 -0700 (PDT)
X-Received: by 2002:a05:622a:610:b0:509:f1e:41fb with SMTP id d75a77b69052e-50b9938d03emr83046951cf.6.1774643185005;
        Fri, 27 Mar 2026 13:26:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd035sm9785e87.18.2026.03.27.13.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:26:23 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:26:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
Message-ID: <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
X-Proofpoint-GUID: ZAZcPOdcJCOr25qlU1q-0r4Ku6ZBsGmj
X-Proofpoint-ORIG-GUID: ZAZcPOdcJCOr25qlU1q-0r4Ku6ZBsGmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MyBTYWx0ZWRfXw1BgQkYaFtUl
 7BsyNY1u1CV3j6hE6sRbeJ6FSXQevH6c7O604cya0D1QZRdLLvQEX3hTCpl7Kci66zZP2UnpkxF
 7lJJW3SCJLbuLU+jxM2g35KE73mtf56CowJrT4f0K2vCLuKJLBPflNUefvdmt5v6kBqi/XX2mbM
 whO5FAfN20yWGuGgyXW6WO66gY5n3ZcXC0RtKlMnyT18lyxuVcs2r5nBe4U+HQMnc7F5Rp58QHs
 YS5uB8LRFkeDG9RxJFRl0dh3UqcxhVnJ76eM9vMHBGDmz+ffV4r5IUopKSFHeUvM08Y7kEtBjYK
 vBC+p/NUot8MNP/0QxPXbdPKNHUg8I3f08vmYnr1M+BXKTEGY7drHnFwqLaX0utjkF+6oxtcq/n
 O6T/ylToX0fb9c/L4dWEqONr5/lb7r5LuBukpx+ODYSU3lWyetZLYrxz1Qv3D16n/fwMCZMlE4A
 T5LsffrTtdnkgGxXaPA==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6e7f2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=OuZLqq7tAAAA:8
 a=YuNYBjh_N-KKOh4gLCEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270143
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100467-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C83D34B3A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnabás Czémán wrote:
> Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
> is using mss-supply as a regulator usually it is pm8953_s1.
> Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
> as a pm domain.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
>  include/dt-bindings/power/qcom-rpmpd.h               | 20 +++++++++++++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8174ceeab572..659936d6a46e 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -48,6 +48,7 @@ properties:
>            - qcom,sc7280-rpmhpd
>            - qcom,sc8180x-rpmhpd
>            - qcom,sc8280xp-rpmhpd
> +          - qcom,sdm632-rpmpd
>            - qcom,sdm660-rpmpd
>            - qcom,sdm670-rpmhpd
>            - qcom,sdm845-rpmhpd
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 4371ac941f29..2d82434b993c 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -84,13 +84,11 @@
>  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
>  
>  /* MSM8953 Power Domain Indexes */
> -#define MSM8953_VDDMD		0
> -#define MSM8953_VDDMD_AO	1
> -#define MSM8953_VDDCX		2
> -#define MSM8953_VDDCX_AO	3
> -#define MSM8953_VDDCX_VFL	4
> -#define MSM8953_VDDMX		5
> -#define MSM8953_VDDMX_AO	6
> +#define MSM8953_VDDCX		RPMPD_VDDCX
> +#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
> +#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
> +#define MSM8953_VDDMX		RPMPD_VDDMX
> +#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO

Well, no. This is an ABI break. It will make previous DT to stop from
working. You can drop unused indices, but you can not change the values
used by the existing domains.

>  
>  /* MSM8974 Power Domain Indexes */
>  #define MSM8974_VDDCX		0
> @@ -156,6 +154,14 @@
>  #define QCS404_LPIMX		5
>  #define QCS404_LPIMX_VFL	6
>  
> +/* SDM632 Power Domain Indexes */
> +#define SDM632_VDDMD		0
> +#define SDM632_VDDCX		1
> +#define SDM632_VDDCX_AO		2
> +#define SDM632_VDDCX_VFL	3
> +#define SDM632_VDDMX		4
> +#define SDM632_VDDMX_AO		5

Please use RPMHPD_* instead of introducing new entries.

> +
>  /* SDM660 Power Domains */
>  #define SDM660_VDDCX		RPMPD_VDDCX
>  #define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

