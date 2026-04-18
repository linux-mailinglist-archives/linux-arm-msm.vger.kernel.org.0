Return-Path: <linux-arm-msm+bounces-103606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKShH9TF42l1KgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 19:56:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F149421E39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 19:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 910653008C2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D4230E85C;
	Sat, 18 Apr 2026 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9Ty8V24";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUcMrvUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF625771
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776534993; cv=none; b=jGSI7MX3VfgFqgPk5i5r6HqLwl3iAhytTHADW0SAWCCcYU+VLeqQ9qaJZChWrZJQvWsD3v9LEIk/bKJDlANvzNkaNIE7KGRjwhqTgBc4VUSz3sUKg6oWuQcNtTFBStXPzr1j7bcYmqxzyyfrvJR4ZKnPmIwmRu8SD69YhFmwHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776534993; c=relaxed/simple;
	bh=TdRKJoKJLH1ZyW36YbA49ThrdaeIzbteBKjTmgDjuGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0FFBqOxUCniKPav1ptBFN7Y8cIdCXKpaTLgngYYBQq/QavaYH0ZJvQgXcUSYyTl7C1pb92XQsDGiZ67iItbYV/5aMoXEF2XdRf2uHfvGfDMc9mHKKuoSaYyZ6dj4xwq+xoYZ8lWN9DW+Ns8YFziDfFflNMSWXWUQ/IAFDt4UDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9Ty8V24; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUcMrvUx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4U9OD1410414
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A202KZUjkcxwmNARdow+n/GA0VYSicUnftkZ2+5L+1Q=; b=n9Ty8V24jxN4vZOW
	ai2tJw4Z0yG5VoRlGD9HQ5HTR1AqwzbG8FBYIcVI9fRsCU33rL+Mp2kBj+7Aj7ry
	8vS5X/gYKbVs9Ut3RPL5XRj1TZc1aibSKJIx/kHBngWEbjeVNdAw8YgjICtiXn+M
	WQQtiLQKYjHJ/5L6vopc8q/V9e3blGdhGboE8UfThxBCiXM+kXSPzGjbtQzbdLIh
	Qgv+F9Mr76PzjLlkZs+nGJDWK5pKB6sV4gW0G4oEETLMlBTzW5SKbZ1ECUrE8qXz
	xCqH73nMCzc4xYj05QkcP1pIbBeGvuLmEot2qGoXvmyKAy6GdHD4o/pTPgbiUZ95
	oP+AUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qah7dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:56:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5aa81907so37863921cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 10:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776534990; x=1777139790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A202KZUjkcxwmNARdow+n/GA0VYSicUnftkZ2+5L+1Q=;
        b=SUcMrvUxIh1KTQIyQkGHGZScYRfoARZ7SZp7XQHyc1ISZGx+/FjmdpPQ44apRNqJnf
         IeQvpqxr8fNL/Fl0oqgLsdL9r3OoY4TPtYh5dcaxt2tjQZMzeC4Q8yQkTZrKJgvahue0
         tkr1ndcWaJ53eGw6juwrswxFyslEMSJPz2pO8PdKZGvjPR/lGfo0f/Hr+MJKS/4u/R/Q
         ehmdQLqIr0XQxpjQ4aYvKmoVBPGU6wzlcSn1Q7cTyK23z3rR7gOhzSJClI/ezLhJOk2F
         nDzhFuz+4KMfHVRcQBJQ7YMaQPuOe/pA9z5VbyJUIqEuW3bPby6dNLD2y3TIlf+xMlPy
         /2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776534990; x=1777139790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A202KZUjkcxwmNARdow+n/GA0VYSicUnftkZ2+5L+1Q=;
        b=jzA5sY6EHcwnEAxjxPwAz01nKGWaZCfK7l5qGFxB0rviFew/lqcc4h7lum9fokNVKa
         1EJ34sCFBr6n4xX64uZI+Lpc8GdLRwiIi2LdcCuKtcej6Xj54xbx94CWnBMqF3P3Gpko
         6rgZlP+mcWnDkahfk8kuJ/z1WiM7OeiE5j0yRM38u/oUQCWvh4MAvj27jQAiUorFuGrN
         R2auw5VBxjPeogChFHlnYvRUNxbJTf27wVzwHB1lr4kjAGhqy0mY+TuaSQdzdpmDMl6U
         7OrCcnwAY71bt2ATEbNXp6YdKzc26YzxiYroFvbU5g2XMDUWPAZyIfVMzRALYKhyyhWJ
         oWeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f3YbauGLN+m0F85mCR96HsPHOG/APd/YIk2DNjBc3B9RmXJ+0muuci8RHOAdZpIyPjv5wkBAzLiBa1iFI@vger.kernel.org
X-Gm-Message-State: AOJu0Yybv9i/fJl04sn18HHkjnWqVja0YYx7QKRtolOObhcbM030QAFL
	9bptxG3mhhreo7UhG933PcGG9uTfFbUBxJwhyu8q0yuwpWoqgxo17vtI24zWnOR6YC2c1Capawe
	6IrXqz/GuTX9GVrrtVsPy6xLkQxRa1Vlmq9IjfBk+yAJB7BnWuvaE2+GY0ZZsqJlz3x/e
X-Gm-Gg: AeBDievvJlZp7gcNbswuMmqKjRO2rsJpRFZ25zHM+1g6oLz/lN7RoVle7GcRAlzRz03
	LGWzBKK8yWlp+IYvq1oLcH4Ot9d94eI7NUB3loCmtwhuBjuw02W2P6Tx6YoY0MJFAHP8nJNzjs5
	TV6iKKSvhRkVSl+EIZ517QdSBl6WgnjdulBMYxjFPlRlvzKQWRRmIYGO5+5cqwub9v+d4ySdu+j
	XAM3/7wkIEOQNCqY2mrI9UC5pF1LkDlY/QfYD+jTMja3heRd0mUYG/3T29m7rNwgPT5T/vE9F2t
	ZcQqB6YMf+94opFIw70jmIt6x/8btGU0YA1hiMtXHWkoc8B26FfFGeGHw0cSZcSQea5K1ducbPw
	nxGwi00uC7nNSkh6M5p6UZMeXyU4/gtVOjCzGmzk/XwbVOkv4hdpkUULuyHJZKlWqaq1ca5vYrc
	5s9GIozVieaz2pr4ch4Z16I/ed9o0cggDN/13/FcXKYuy++Q==
X-Received: by 2002:a05:622a:1dcb:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50e36837466mr113732901cf.4.1776534990557;
        Sat, 18 Apr 2026 10:56:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcb:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50e36837466mr113732661cf.4.1776534990160;
        Sat, 18 Apr 2026 10:56:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a62sm1488772e87.56.2026.04.18.10.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 10:56:27 -0700 (PDT)
Date: Sat, 18 Apr 2026 20:56:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa-iot-evk: Update TSENS thermal
 zone
Message-ID: <xxouwrtrhgyf6y6xgpqev3cxomn72mty7kvuzh4tof3jnmfmnf@6deaf6mhhdpw>
References: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-purwa_high_tj-v1-1-b538f98d42da@oss.qualcomm.com>
X-Proofpoint-GUID: BCVk7B6ydKEXugQXqlEk0UN7YkSoNs0l
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e3c5cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=irIo0gwFZieol5Rq1NEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: BCVk7B6ydKEXugQXqlEk0UN7YkSoNs0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE3OSBTYWx0ZWRfX+AOM9ECoDTK+
 +AzRCxLBEh3HQ4JFuM4ZzK/P7DxUyF81/4KQJ+2PAhepJd3wKwKs/C2JxsYvySZ7MAz3JKCJbPS
 4RALBsxPOSKVPJYBiYtdDoF4rQlx665koXeKrIuknYPCiqBy71O61gMyGcWhy/rXhJtUPg/dH+y
 GImUrFdkwdWgWkzzKOATlU39HmlwkccmM4ntMx3H3aivqkWQPPf/86zfZIxGTTmokpRhy2aFTjF
 VCR/2zaoFrWhz1OC9leVvdWSFjdti7BIcA/+57CCvP2Cd3anuaMUoBbSe8TF6GNTULR9/1GGWEh
 wN4JGrSvRU09/EzpWg/4swfvZwOhiPZe9DWk4rcOusJ6j4VNF9SP+rSSXeqD40gxumaOqqxQPFZ
 JjHKnNlkPvEZumsETuDfv5nfKJLVjURAYiohIPDujeZaxsTA4l0DDqVZsSpr95SyE5IkyCYrbHW
 YTO2GsO+rO2JQJA2YEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180179
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
	TAGGED_FROM(0.00)[bounces-103606-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F149421E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 05:04:48PM +0530, Gaurav Kohli wrote:
> Purwa IOT boards support a different thermal junction temperature
> specification compared to the base Purwa platform due to package
> level differences.
> 
> Update the passive trip thresholds to 105°C to align with the higher
> temperature specification.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3..261d1e85651d 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts

Is it a property of the SKU used in the EVK or a property of the overall
form factor, cooling, etc.? In the former case it should go to
purwa-iot-som.dtsi.

-- 
With best wishes
Dmitry

