Return-Path: <linux-arm-msm+bounces-117638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIQLCURPTmpDKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:23:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84606726C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:23:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DyDsjExs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J8OljxJt;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117638-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117638-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1957D300828F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E13C32B12A;
	Wed,  8 Jul 2026 13:22:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DC832B137
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:22:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516965; cv=none; b=NOixbWPFMyBoqKXmTGX66ejOBnrDjDL8TieE262p4JjCv24BWfcldO1ec/CDBOUooWTHr6y2Q+2D4dqJPIvhQh8K3oOgOKv24r2uaoZLVhG8x5o/EP/F5/cmzg0i2ITH/dllWSxnjbPCIWKchu5Q/Tz7hd+oKS+vFnZiYGq5bhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516965; c=relaxed/simple;
	bh=ae2MNSIMqAaSSXwecTZylqC0qS6/V2QGOXxmoclr/6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4OR6qRBGE36XjeRgOQFv62Ivlie0KTZGUi8tAOwY1wClmxdkFS0Quhh3qWXqskpnZUFB0o0zc29Ij/dRoa8gFA6NQ6c/KUMAl5EMmsGTr2aPR5qnTwD3rIwfZgkb/q/16iReoq4Bv1pe/JCnp9loEJcNDd45nPUxM2umDp8HnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyDsjExs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8OljxJt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C43Ux2752166
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 13:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0BRE8p336WpW44FCc/nZ7bMg
	3LmDUeTyJgzMvG1SbVU=; b=DyDsjExsyxp/jvYYrS33Px3eoFUhkMknepstX533
	C9/vUKNVvs4Tc1plK9YD3s761n2ToqpsKYpuJ7MU2kybSxBRP9bMTSvEyrsEGG7s
	QiREpVhp8sDX6oyInTeMsz/CcRmGccQIQoFPAlXDSEHzE1ZUDnwaxHWIfTApz8Z0
	uePkPFJ5UXh0GHKmp8C0iMpcgOXDkBLDKenw2oelhZF4F2TWRsZQs2GgXo7dVtc4
	5ocDC/AquJglitI2x6CAKfsbdBcUMFfjG28OsOkAd/gwXLnAs+7pfPOnikUtD148
	hXswxA2YA/B477Cw0UsijzL97VbB8OiKQIPQWJy0MjY7mQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstkt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 13:22:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e80385dbso60178137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516962; x=1784121762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BRE8p336WpW44FCc/nZ7bMg3LmDUeTyJgzMvG1SbVU=;
        b=J8OljxJtmiFCqUZyyeyEV166AiYS+e/7cD4ZVmQrIgPJdPrnBWVRZFiOQkVpfEyVzU
         /D3VP05hjfHnIp4sn0PP7nciMDx5jUlg7pn/6+iT69XTu/TglRf3EPdwB+TBxIubBa7Q
         fUmb0OOBygVpy16izXxyEvalUFuD4b+mBfn2vm0KxKFqtZxrMkhxCfT+zHzIkxL184aF
         fYarDSJkFFeZ+ob2EI0goFvkkh/IP9tlPlyzc63/ADvztxM2HBxSmLQE97hKH14+GAeh
         GVYb1dco8k+Oju0KPZs8isZinCxPkH6i0zl8wrc3b3GC4hpvWTyrlY2EVqnFlr2cglmR
         5ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516962; x=1784121762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BRE8p336WpW44FCc/nZ7bMg3LmDUeTyJgzMvG1SbVU=;
        b=Axlu1TGxa7K1/m8ybUWGEFoB/awSqY1UU1p4W+fQmMgIP17pcabi/nCMqprC/LZm8e
         gKXINrRvQEJvPUy4lqqk74sg1dHKEqQY2Yd8R9B338M0YbfQgTdLdAhTw2QOaTNnfT5d
         REp5/0Ugh+th06BEQHukioB6OE5vvyCgaNWWfT6V7YthV3fhQLNJLn3avL3MlJANiAin
         N0ycouTaZTG6RdnntRjwydF4vbgOdJRoJXmj5nBJ5yO5ZHHuoezRSJGKlbRO9vT8fgfD
         t3E/aIPzuj4GKMJWduGX3d/sV+RYa7dl+sWc4NBfjrJOLaSLIB5RUjWPb6aU4c2ZuaYQ
         V17Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaQ8v/EZ90n/FI4YcoSjOD1WIRLB7blbR4VjPiGUfUzODUEpE2JrArIZZKJ+BhO/Ln/jWgS3d4Ca6ITKiv@vger.kernel.org
X-Gm-Message-State: AOJu0YzthwtEi+gyWxrZraZsEIYxLaK5Ge87fVvYc7QxVFZzRLMsjNGT
	DmGm2ICMgOn1fu1oJ/o/sv59aRdNNtMCHHBVrVYIY6xA1JMqNUAkRxUUQG6hvb6p3e8Bh7KMX/+
	A0fGRYNhwpJiCM/HedqE+kbnFQOMt1zsCWshrKRqfmb73kppCGZhYSHyZWCQf1flF3rmv
X-Gm-Gg: AfdE7ck/iB1KT8ZZ6MA/YrBocCy1LSxaymKWG3UZ5YUZ7fCnB+W5T2+NNRm+WckoOpo
	sWEfGXVpfp8KkjJuWc5kD3uvJH++PglDye9vwiHAZDVLSPiV0Q75xpmKoqTNWbK7MDXIXne3y9V
	sbuhAnAksoMt6L/gsPomZvYjac2htbmkmQAOJcEtb+AMTS+uze3WeMlvbeP2jg/jIWs91oJX1Pd
	A7DHFffAU3OR2txH8nIQsqj7T/iwraLNLQUYN3Kx3C6uTxsMBMa8CiP8ImTA8oVONxb6tXxbpvW
	BXK6L4q6JHjRe9izYbYYmxD4U1kOSsAQJMPRxOLW+OkZGdH0U8m8MXwQPlSUPLxAxHf1Nm0JTqL
	Od2S/eu/oSgMRBZK8MrutMpOCSt1ftaA4/3HDF+WHp0dbhQrwkeWbzVpp0zhhjCbnIDSPTaMvVa
	8vAMv+JzmsVjWEU6fPApxMsxhc
X-Received: by 2002:a05:6102:1622:b0:739:d787:be8 with SMTP id ada2fe7eead31-744dffa30e1mr1127767137.9.1783516961974;
        Wed, 08 Jul 2026 06:22:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1622:b0:739:d787:be8 with SMTP id ada2fe7eead31-744dffa30e1mr1127753137.9.1783516961459;
        Wed, 08 Jul 2026 06:22:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c5c11sm4522013e87.77.2026.07.08.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:22:40 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:22:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
Message-ID: <dcsmckzwoeuvhx23xks5piydzdi22t34nnubrp6ix3ubxmzqnx@of2tksetosit>
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e4f22 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iH0RECKdEw8CTonVGlIA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfX3HGzaa90eOfC
 8BIetaosFeZQasUvokLjzq3RO6PqMnjVT87ExhHO+jySuAIozKxyuqRO6pyDQOlYUo9dAleUAZt
 Mw+cJ0WmECITwfM+wFHSxVuJc/VoDTtFe3sqM0rvS82+lDE/2RWQ/bqGfz86lHz/J9hD+MiwZdV
 z4y9Jn0AP+gAl6M88oghgQYpkx5mvD4Ey4MHus2p4RBTMcSdHI5+dAOrS7CqZxFLMAWkwIFCRoz
 TtqcKZ2q/zB+5RQKdKxaatEnewmlNr4muEEG1LMfoPjXnZILeToSi7tibVq6ATaOjPYusHlX7Y5
 lyx3mVoIAca45mdf6e6I3aXxGQiyN6lL8YMU5fVaJcnO6iHIUSZwDtV4SD70US0CLhmhpKafNlF
 Xasz40zM9h1OS53G8KjIcL3XcdPuoeE3YwEDk3U5ATuHvxDqOKgp/ughRCPL+e1uWyoGLEVCAuV
 EezsqwtQwWoxxIvZ8mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMCBTYWx0ZWRfXwFXTVDOJLbZv
 FI/WHPNOMPCqKS4Cz+1CBg2W7W8rb3hbP1NtruAQ5NQ/MQHM8s1lntN5jO1bjCceqDo8n4tPkid
 6NHXlAS+D7su3/QsMdgxyojVR/akGKg=
X-Proofpoint-GUID: sFI1pDYDzQDXu4kUGAu-43qAXzd0D8Zk
X-Proofpoint-ORIG-GUID: sFI1pDYDzQDXu4kUGAu-43qAXzd0D8Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117638-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84606726C3E

On Wed, Jul 08, 2026 at 03:29:23PM +0300, Abel Vesa wrote:
> Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> with the corresponding OPP tables.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> The bindings are updated here:
> https://lore.kernel.org/all/20260708-bindings-llcc-bwmon-eliza-v1-1-3c7dbcbae87a@oss.qualcomm.com/
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 96 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

