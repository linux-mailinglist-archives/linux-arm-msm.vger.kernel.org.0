Return-Path: <linux-arm-msm+bounces-112277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p69VLaOTKGreGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:28:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33566491C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 00:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=H2LdL2ZE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QrmGqjqN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112277-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112277-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1381C305AC93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 22:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C20A3FE348;
	Tue,  9 Jun 2026 22:28:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65A3F0763
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 22:28:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044128; cv=none; b=kT/XuLYwChuAA9sYY398gS4mCDK2mwzTZhxKJlOB9APWKUDEcs1frNv+w3Qqj5BJNu7aPHhcedo8o+dzqqNmRlTG0lZ4h5GTMaNKalJAqCmQdv7RoHZL3+egezN7HEw/JWoIsmjgjl5AcUzg8i3rtGDm/e1VfugYoYsfCPSVHxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044128; c=relaxed/simple;
	bh=PdWPXvVpu3sR7/V83pxTB3l/ajc8fSi5X/uX9gnVoG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdRABpST4ytpjkl6c/FklULo+ST3q4X60yU9fxfURJ6NcliiqVsdkTJBDxPdHuJU2PtJUApdNdL3pgjUIQ0M7TejMpVvj9Ws2SjQHobZrgcKUx7Ix+TFvsvY2lZnYaVQIuTN6xLL/ZEsA1Bs+51/uqSZeTL2zKHglqtDsO1+nl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2LdL2ZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrmGqjqN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659MFF7M3505544
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 22:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pMV9sIsCMro0CR/kIgUPICoo
	AQ0tUVgnwlz3eG3t/+k=; b=H2LdL2ZEzREmtRRrgWCWX0ru7fKaXBIo2WQpNBhS
	y6F4Qo0A0vd9XzXXfPuzGR7xIGIsQXMMx6FUq/N5HaodKLJXZdR2MXoNCxUWhmDa
	brFh65gQxHIGOr8RvxOV7JxZojRNUEJGcPeuK2flIUSWFd9qOqpE1vpOf3nS/Qa6
	JhiRKOxIkTzEiocST0L5J2DfahmkfHzDOAHzZEbeY7OO7jg+KZFt7QCMqh85jhhM
	x7dYeN0yupyzlC0M9L5se1CCayqll+Ws7cN2VzRREtiILbiDur6cSFeHmhN6pKp8
	PMjX0hpbryEnOEFJHIaXkOSxwaiwm9hERVlQDbQL0RTq5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgm2wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:28:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517d766e05aso22545161cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781044125; x=1781648925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMV9sIsCMro0CR/kIgUPICooAQ0tUVgnwlz3eG3t/+k=;
        b=QrmGqjqN0oF8hiD7CDBAKT9tUClvJ9CzfeIokU4a3uLlOdLTDYQ6D6QAvtvMrdYHup
         hOTHtpu3JHs8K1hZV04/UY/UZ/5NyojbpJc6j++oqjq53QSS9Q/YkoIL91sQvOCMLX7a
         wCR7rqPASaD/JEiPqlHl0DhoprFW23gT4YYW5PyKEApszE4isoEMnZOaSOvEcIkfwtWY
         +ZT82Tp7m72UsDVVgHHhYMkjje9dNs3RmAVXupEflcg3vrBMhHFTsHhQuNrf4r8CvU38
         i9uzl79bHg03FfKlRRaXebC0V1fX+YKKhdXrT4EFupPlHkVEtWAz6f4LNsmbCoFPseGg
         Fllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044125; x=1781648925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMV9sIsCMro0CR/kIgUPICooAQ0tUVgnwlz3eG3t/+k=;
        b=LGDrN17hMkRbx7nDnDvz1aFeFUE7SyTiJCPUP+nX1OBa022rJ9O403bWybNSRWlgIO
         nCV1YQ7kpVbTjXk/A6N/RSskE2aNPzWsAhYZr/KxY8drtl6/krw7JvTNHLrivk6O7Ex+
         E8XqqFXYc5r3DgzzxFcvWcUV8I8n0A3ouriZI1lelkAD6CyGxaVbWiuocuH5NVCiEQfm
         l3LxVGcftZMGj6t0FhalM92dAEpMxkTm7djNDUfatoUuH88C14VeHLoHbXfETm/6KhQU
         7tdkgvdaenzd+M5QHltgjaCOSDjVmjW6rd0qfh7tOlZ8FMZ8ogfpWTe9tpQ346Hd5xwb
         6RtA==
X-Forwarded-Encrypted: i=1; AFNElJ8qZRXF5FUJOG9uXan6/hOpFnh13Jo7vuCQcTWVcYkGLSUie1FD5hG3b3npeZE1Nd3npFEEAM/pp44+cyXM@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdWkT5h74mArNMKL5zUUS8fWFsw8tOYcd7e3IJCSeubbImM6a
	Ve7vXeDZINHRHZ8HfFloPHf5C8dR1CXyVM0CvE494CUBfAr+2QfiIgSQYPLxSTUn4t38T0SJ0n/
	o3X+poIvOLohdpC4zyU8pXwURb5oJV+Ppz1SGj75Zo8gNF3FmbZHwd0xoYJ6rA1LVQR7e
X-Gm-Gg: Acq92OEpZCcnNKj45y7v5XrB8hhI3Plxc9UiEHJesxXyn8wHn/vsfDV8hKBgLKfAdxO
	I5hUJWqhpb7QhtMBwJiLhb+NndXA/7XxexMU2pVgLE3Z8wOW8d/hnQnLsIatcWl1L9H10RnCS6i
	10kUZ+o+w1ZMTp5eog6/Lgo/SQZU+tJHktkMO+LMwTr56q+zEiN3ne+mfAYd7tGmIbmRGDQxf85
	Ct4n2zj+mTtb2WQXjzGSEh31BMM9sspY8mC4PD4LfIjxn+ODTk39jjP0j7FKlFgzl0LWV+RgJMT
	DSE2TATT6wBEabWDONGRwKmmHUr5KPC1qYHYrbHkKmw6HNaTup6DSEO9mVbqw3FTGNYPy8FhC1i
	uwYn+cQr0URH6E7r+kYZT+itiQQlymq/g/imuJ+5wUrnyxeBNxrLyptFVfx1VxLwWEKNimcJMuv
	DaugWXohRRJ2pnz68pakvfp2RE/nffPzI9iEhcjMdujkLRqQ==
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr238426661cf.39.1781044125376;
        Tue, 09 Jun 2026 15:28:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-51798882e6emr238426371cf.39.1781044124971;
        Tue, 09 Jun 2026 15:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm4879966e87.29.2026.06.09.15.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:28:43 -0700 (PDT)
Date: Wed, 10 Jun 2026 01:28:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: shikra: Add Iris video codec node
Message-ID: <o3zjmtmordfzeimgowakpsz7jit7q4wsxb3j64gmvgkvre5y37@ztafjbpwqavd>
References: <20260609-shikra_vpu-v1-0-3a32bb38b080@oss.qualcomm.com>
 <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-shikra_vpu-v1-2-3a32bb38b080@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIxMiBTYWx0ZWRfX+9Wr0AHxUHp8
 niL64k6k8JEgwAT1YSPNJGfooJTWpV6wJN5hXkOg2AON0luJXU4gyFUYSPOMl2emuOof9SWLd0x
 iayHjWt8ZYkBAooZ+97lU5T5PQ2RSPhHsAH7BZL5UCUOdpTZKgn/cS2zbg1RUkz1H/PrwJemZOI
 TloD8FCTyjSD2JLi+Zpd9LlUYjH6O5Ev/yx/oGzA3W0GnGPUoMZDUtk9vR2GbCAdbJ/dx87S8TA
 Qfyqqo8Vj1kIReR8GhYbL59urElenzpHj8NPsEfZbcDrDPZrw2chT/LKx/VCMpblzQDgjvvKVa4
 8+ybld2d7MLrN8KwcxR3tR+wIehzVSbvUHPfzh5QB8/2WnA1ecw5LAJUOxW1JEK//LarVt/DeMb
 S8i4ohLTZTCe08I5nISi5QVZSEeoGK/QVnN4S3MhKDxx25pxaQFEcYGVD172c8dpAXkhwGi4i/t
 Y6akQ40o95k1XTXRJAQ==
X-Proofpoint-ORIG-GUID: fJOmhdL4K05Pfb6VhGxYkfILIk1MSf2i
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a28939e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gZ9Hao4PvtIMPGLi9fIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fJOmhdL4K05Pfb6VhGxYkfILIk1MSf2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112277-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ztafjbpwqavd:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A33566491C

On Tue, Jun 09, 2026 at 09:45:41PM +0530, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 61 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

