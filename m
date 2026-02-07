Return-Path: <linux-arm-msm+bounces-92116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGjzJQMEh2mpSwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:21:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB690105529
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Feb 2026 10:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FB9C301D30E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Feb 2026 09:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C56B30E0F9;
	Sat,  7 Feb 2026 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaDjW/p3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OOkBCEdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98162E92B3
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Feb 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770456048; cv=none; b=a66L/LkZ1hKlJhU6Ukfr1Q3HmDyMDLMQzqV/ComDMc0ESxK1ssHpeREUopXkBzl3o4s1lLGWFIHfHEuJtfrF0eXrxjOvILRSqN/hkoauke+RFjNkjONxc0zMvcremkGa+dmne3qMwjnEzQU1aviYgU2RaX0tSePJeK6tZvWyq8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770456048; c=relaxed/simple;
	bh=UVczy6s5g6EbpIDcuo/42yJiPGRmRjKtRgx5PR/v/7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpx1Ud+yQaI97zXSq7rMLG49ByuMOuEZ4zL4KvAscenfkNJA8Rf9Rt6uFIfPQjcholjc13zzI9xV6VeqNVo90vjgnMSOs/wqgx4MJSzD6vr5xEhrGrljSKguMO+sP1PoKH+1pjCTB0OvW0x+MamwLDj5KExrd+2RY1qa5/1JgTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaDjW/p3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OOkBCEdI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174NVpv1117841
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Feb 2026 09:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ffbcEd5MLHaa4otROJRqku3
	h2lNiUFKLWZu0Ot47HY=; b=EaDjW/p3eYjprvgdQldpsVEvUAZIGASIaf/vd01j
	0g9IcRI/nFqdlYPCJSOitRUtGDgU5EKuQ9VrxQEviL3wmBUYhYmhULz7j8kxAS5b
	l6vhAcfuI9dsY7qHZR2iFbG4cAPoeGKlcCk2sfoM9h/VDWVmfGWvn7s+b8tiMJDF
	XTCeze8ctPa7IpsaWyvQK2SJ37ea5Hwlway6XsM+u2M4J+HShk63ALh7KHGO7yeH
	7UZ1HcXh6aOzlN17dYT3fSj5O0OIqLV6e8rwFMkySIRWCW0nPsuovj3YzCOfOPSS
	cmHWjMQ4rymwTVjhDOSm2a5z7M8j3ToJY8vcPuPPU/qTtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamrdyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 09:20:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so719997685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 01:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770456046; x=1771060846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ffbcEd5MLHaa4otROJRqku3h2lNiUFKLWZu0Ot47HY=;
        b=OOkBCEdIE7AvV8ysbY3CaX0a4ksd/S44RiS/6lTpz03FAE5T8gNgv8+5hxXKnB5AcA
         IkgjGldKP3+wlstLfJ8DbBkHk8CWn4lMZ2b+DwE7dEIVn9vr33CdAVUjMOMMWUmQzFXY
         pg6+aSpiPWsvi/j+FH5piUE+BzLpYjlrbbcyuJcJv4RQyUJ99qLeQyf9SjVhrQHa03u2
         abIUr4kfz8HZuPPdBA0sejBZ2V4ZThkURnUx1UVl72CXiBQwZub7dAqgkc6cduXWCNy8
         J2/8G9MlJf23c3FBP3ivmN8Izg4jstxxwzIzMn8snpjiYH0FFRirSDcgfPEMJXJFBopF
         kzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770456046; x=1771060846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ffbcEd5MLHaa4otROJRqku3h2lNiUFKLWZu0Ot47HY=;
        b=rsI5YGs5fjFb+hpSQVipQoaJQ8DNzqcXEl4X/WXaTz1bxNJPsQRv88wrji7EJh53eU
         jZFgPC65rKEBUG+LITM2TlCWhuFqRwTo1znCJK3KqjpCOKnV5KYME8XYPqS4NvqLcY0f
         LLqs7eDH1C2DJtt51/4i1frX0vyDbgRay4MHWl4VTSYnf8ox3DOI/TrSbE7Zx2Whd4DR
         37WqLeJkuZxtjVSAP2t2zGAQUEq8RnNSwOeEX/8UbTd6VMxWV+aewwe5mNr3e0FaeAOw
         rG3gW/GBt9mE16pOfwKrN0qhiQlvD+qtG88B4lL7N5jNjxUnv+NbkiZc/6NO6h58jLIn
         PvEA==
X-Forwarded-Encrypted: i=1; AJvYcCVEwCeV4jnr9quyzIFl1CJajpoSoAQ+ybOYQXpopVUwmgeEfgEh88T0yMva7EN6oeTM5LAHN20jW517oHpk@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZZGewlBu1Rt42VjSDcLaUF2SFLIdhTQetLW+JMH/yGoQnAnx
	XKIy9HTZY9zteNgACMvWVvVUj8NpHSBUjB384GQtgW+as/jFoqHIR9LIeTS6ZfdWbl3kc5mN4NB
	RJMo83mohPEkadKiovk8o14/ZK6Xu07G/7KXIgdvKeUbkgxuSKqjD9YDL539lWgWqGlYK
X-Gm-Gg: AZuq6aKdIqGh46/PfoOudbq2XtmPYd5TeTcmiB6/58KO8VfTLt1Nyf5cLwtf/SYpFJp
	Tr5t3tbzoV7vpghjpkxab7o9OneOnNYsdbaXTIIiYKPZR2QlANsxA3jFFymamwUld87n+NYEPqy
	mmfsC6QVGiAiXnjSPK84GGXTKtl6G/OdiPaufmmQpfMcfA/OOmy3YQ+OLhR340HlQ4jZZK9DRk6
	v7okQPeSS+Vw2Qlow+mvhG+3Pg4k6SClcfETOtInp2HMj0cgGzItxE5D6UL7W4LJiRePFa0wOd0
	r4DsRx56ea96wZjKStphzvqYr6x59xp92V+PHUs3gr1d7JBy8MOStn0HmeDhpjq7msIz2qJX2Du
	2oDEhYO59DiRghQ4PS2R+M5LZfUP9iWRX7+vdfhuGsXN2qapR+63UjsOxqfDdqJpEkvl0Y96tlr
	QGQHi4Tuw+FsIaj4kSF0Dm8as=
X-Received: by 2002:a05:620a:4706:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8caee76cae8mr645825185a.34.1770456046071;
        Sat, 07 Feb 2026 01:20:46 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8caee76cae8mr645822685a.34.1770456045659;
        Sat, 07 Feb 2026 01:20:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cff6a5sm1206176e87.34.2026.02.07.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:20:43 -0800 (PST)
Date: Sat, 7 Feb 2026 11:20:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] ASoC: qcom: q6apm-lpass-dai: move graph start to
 trigger
Message-ID: <aqdmav22lml3tlh7wzu5fwjyavl7wu2lbgkwjvyt67fqsldwxd@soixble4klnr>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-9-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-9-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: IeYnW5mvOjngjnyLxVBtCwOG6_Y46cR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MiBTYWx0ZWRfX7M71tXO7zT/g
 diVoFNfCG81pFPnMiZBOcdd9W3/1IQZv1i6eOuEIkiugUm4TPPLAIgKwSVmnrp3QzlUE/DCf3Hl
 rnyYHEv/lRqmg29dWg5cU2EnB+FFyw6qtX2SV5C0v1hquim2tgQn2ARVjIDzDoG7PUUd6K/Gjqb
 iZHmX+L9D5IXfpA2WWktHUV2hxhPpvY07hAfzCq4ET3Eoi7Mvd3dSPCTgrwPud6IYKlDFDhh2cP
 j+MMsahaPh26/bskP3FIbcQtcOrJ2XU+AbHd8DBShY2Zuyif1RkSTBh+RXgDYOCcGKFlHkq+pq2
 JK/QA/FdMm1ZgNjcAZVnnnjdlHAykpuaRiP9cDEXkalMEu/I0POlsXqoTRiIZtNah8b8o0FTEIP
 y9T40oem2HKjdR/80r/QOlcPVLdqhns3w0Y2F/nYeD/nHAxBNI9yoSC94LsugKPYt/Kub8sYXDn
 ST7iUgNCgswnjcaGyrg==
X-Proofpoint-ORIG-GUID: IeYnW5mvOjngjnyLxVBtCwOG6_Y46cR6
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=698703ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=D19gQVrFAAAA:8
 a=EUspDBNiAAAA:8 a=DhTH6sICubyBQwtV0QAA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070072
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-92116-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB690105529
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:14:09PM -0500, Srinivas Kandagatla wrote:
> Start the graph at trigger callback. Staring the graph at prepare does
> not make sense as there is no data transfer at this point.
> Moving this to trigger will also helps fix some of the issues seen with
> pipewire and display port. This should also fix some of the Qualcomm DP codec
> issues discussed at https://lkml.org/lkml/2025/5/29/102

There is exactly one issue discussed there. Is it now fixed or not? If
it is, then you need a proper Fixes, Reported-by, Closes, etc. If it is
not, please drop it from the commit message.

> 
> CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 39 +++++++++++++++++--------
>  1 file changed, 27 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry

