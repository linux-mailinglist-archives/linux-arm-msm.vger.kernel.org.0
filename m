Return-Path: <linux-arm-msm+bounces-101817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMBAIqGI0WmlKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:54:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9339CA9D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAB1D300916A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0375C359A8A;
	Sat,  4 Apr 2026 21:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcxmEIep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kadWVUfG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7F133E373
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339662; cv=none; b=NYqgnjNcmWZ6xR5/eXi1g4tLlUxKGo4x335NBkDt2MgTocseiFe0QVhCqaT7kd8WkI2kFTZh5MTLhjDRi5tgYJDJqEzP7wYn5V/XJafRt+ALfBtuKpLO1ZnKWmwTICjUpEdLPTQw7ePiKbiO7pr0uWgk1bDF8r5pVM1bmr6gAvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339662; c=relaxed/simple;
	bh=evln0NhJ1xHd3el+5uDUZSIcpVZ8Dljv3ROO79Qe2ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6pDT61p8ck0c49l8BXH6VhhFOHNZcjc4JKOsVlW3O3ewxgcvFkG7Epl3OK6jl4aFBixjFt/dVHC2QZIJdeEDwy9ujANvWHBpolw0CSVeJEu0wLS7uv2NcnD7iYGS9j3//e4kmVw3adXtCXp00QZ1lwTQHojeRX8sANxugIs+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcxmEIep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kadWVUfG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Hc99n1344722
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rOEvfNc4qdWIsYSVMwrzsHIkn3QsyFtvIWOlb+BY3U=; b=dcxmEIepDGYl22Gf
	9NVDtJPCtzn5YYLFa8113tnFm/1gDSjqC8dvUwE9u7oxwzW/db/JSXv2QvZGtAYA
	NXrZ9qtAyAPLmtUwvYV/QxhWOeTZ/d+acPzfAKDubroFHrLtRnQPqbY7VrXnJ0sh
	lF5ZMgrtpXe7oiSrK9ERE6CfEJlivf0qZVRoEYnaEajXsynXC/hJcDxJI3dlGqjz
	qp526FHXKMGUONupp/IJINPWVn1Ce0ZAlc5YCU7vuysPAdR2LlJqPqQzraXz0bD/
	TkNUVIlBjSmIWUAcCvd9TfD4y/F+XNWqQjpsnFjuInojE2zcf15xCofILvxCXXht
	nw1aQA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfhs6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:54:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094741c1c1so9821391cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339660; x=1775944460; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0rOEvfNc4qdWIsYSVMwrzsHIkn3QsyFtvIWOlb+BY3U=;
        b=kadWVUfGeY2q1y8pxzrvFLXbMi5yc4WAjjVfPhpaHv7I9JSuw6u0Wv3oeeiCNQ84m7
         f0+5YUI3IH9HCXv9cJH2u2ODYw8eP2tbCcrHRYjdgPQv22h+pSoB80yb0LLYegEB8HPC
         6wCRjJK89+x6cxcDJxuCkX4teSvdFiZXpfbG8xgcFUDykxmTKdrx0rve+tR05rH11Rkz
         YUcRZ17T0JzWei8k8OHev2vfa4Ucx43rveWR/Miz7IbSD0aJvfCo0yCKOFbXwAWdp8x+
         G4euTWn5XXaHNa8VQEL7RVdZTApbo32I1JyyEnO3JhSmo/qgU0jApxcAhd85+gYPlwzV
         vVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339660; x=1775944460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rOEvfNc4qdWIsYSVMwrzsHIkn3QsyFtvIWOlb+BY3U=;
        b=aXhrZFdjQUNgQThHu1f8+9XhwWJJyrqiX22DCn4077BrxHa8Kzv3MmF9dLFSiilFHI
         jbior1pTvhAJCNtXoptM6olNTWMr36hwqzCgc7xKAfMAKQxfhWzYplGZ6Ot+UzmTEp5M
         9+v3tzbx8WEdt/KJoOHy5e1cBE9er8mBw+2DW8ds0OTtXihqzclddMEfK94+nlXstKOv
         7LNN7FKv0SjoYoAfh17V/3jjNxbEMlWewh9ZCSsvTxI9RbNFOqzR2bbeKH7wA07J1VBr
         /F7bPBF3oQX5v2QKdcvE7wpqdyamswZiDQFzg3WJ3GP/gkMSdgMYI5uzKIq3KshDeNMq
         r5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXu/EiJWdhfYwCuGOsWfYce5nLjm8Zh8mlrVuVo8IocS0oVpmSnxTM7v2DzmffYf6wmZQPOX6Dv1sRg+HWE@vger.kernel.org
X-Gm-Message-State: AOJu0YxXiBBPTouKC7JWnDXq9xZ3+H+syYFZXR1AjVH6K8V88HdzqTPU
	dfztYMBQc8fIAQr45GSB0YR0e2Imzjyn3O57SGulAXCJm7PRHT+s7RoyDlQX5NJe21Q0889YFnr
	M/o22Fv0docnOfSrom6nhZSTUiPZtqTTLlEHfe9e+cojyoU1ASVEpoWa7knf8YmhOBeyxMOglYP
	lV
X-Gm-Gg: AeBDievPpSJd/MEL/4aDLZmHxvKoFIpm/9auAFrBzN6bXzkulU3p32mBk8uBZryJPsO
	+Tvi5fzoVBTOw633KBw3WCXrktteUiOvZoabh/iAMaNiiAfm5Ka4jh/r9NIIVs8txgnCr/7KnNm
	MaHdlO+80R2S3OgfiK6F6/9e6xcDFaHfrMJpZ/YsVyOoLKZmLm7hSwsFKVCiHfZCM3G51pgQ3yY
	DBSBaXEN6hCQ8cY//zYM2xryTruArbCfXc8vcwNs7lnpH3XN1UBCHiDP/fx5HBmAMDfDkAUmWeU
	o+Z8V2TGe5Vj2MQYDllk3Rj4tqIzaqszxd2oM4nHIj7Mg7/SQs2e5R+aeVQ6tnMDhaSfw0e1BJm
	h2YVmzSAFXS1fVe7JLAcb7mYE1jRJ56/Tos/mMk5Q3IGPDdN8lBAS6OUpBVP2QLCbBh9l5aaXti
	4JW814vyuQY6dyDMFx8XiyW+HMCrCWJ+AMAXo=
X-Received: by 2002:a05:622a:59ce:b0:50d:3eac:8466 with SMTP id d75a77b69052e-50d62bcc4d1mr104529041cf.30.1775339659961;
        Sat, 04 Apr 2026 14:54:19 -0700 (PDT)
X-Received: by 2002:a05:622a:59ce:b0:50d:3eac:8466 with SMTP id d75a77b69052e-50d62bcc4d1mr104528911cf.30.1775339659560;
        Sat, 04 Apr 2026 14:54:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217ba60sm20398151fa.38.2026.04.04.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:54:18 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:54:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
Message-ID: <56nhno4hnpw4vhuv66nctcwslfn3abxoqe2wrwr2ui4jkfqmf7@3rwdat2re2r3>
References: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOSBTYWx0ZWRfX4ZFL1cH8Z5kn
 eH0fNXE8ltu8su9MvBD7YJeTQLu+f01zzpqXSEFPAsEKvlcb0+spz6DV5OC5L+j4a0N8itBd+e0
 crYqNGTAZMoPu/ERYtiOqLXHH7dRhvO3JfDc16nnqVJpqjQc6erJp/4NGt8kqWxb8TNOEPm/Ksv
 0UTa3v0vqXIzwm7oO/2NENhZyOKLbpmSLElJ+2879egGcKfssUghyfWv2rYdAq5JddfFv5FmHg0
 SuAYwEdkLPpl/zqNaGqWSppsEJ9tcTBbwYX8DaEZVnCBWEGIwF4sI0KJSRV2uM59VmSRy1etBfs
 3LDyWLK2rjFAa5mMdY8XEBnE1bF6tI363k2ZOb1wPLE4bPSnl6V+3Bs4ilAjMO/vhMZjXJtgjGe
 0EbnIQWOCX0i/AhBoGcV1KxHrK6vtRJ31P534EkehXa8g+69ZC7+GmMnBxnGQEaQLIciqj6Jd7N
 6fTqZzW8B7CtGuy/c9g==
X-Proofpoint-ORIG-GUID: S1NAHrU1bjMJJtfudyIDUWDJLl1v2HiN
X-Proofpoint-GUID: S1NAHrU1bjMJJtfudyIDUWDJLl1v2HiN
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d1888d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FBG4kKiRHSUkxbZCjDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040209
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101817-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCF9339CA9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 12:10:34PM +0530, Viken Dadhaniya wrote:
> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
> The controller is connected via SPI3 and uses a 40 MHz oscillator.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

