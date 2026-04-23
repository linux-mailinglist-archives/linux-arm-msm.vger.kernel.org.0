Return-Path: <linux-arm-msm+bounces-104296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIw2BW4A6mkHrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9F451342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE0D43004DE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D88A3793B8;
	Thu, 23 Apr 2026 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pvLo8/Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpAjG6s2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE291364036
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943209; cv=none; b=QnB8EFqGdnjDqXicMzpE2++pZy1dSZuf3ui/bSSGLSjJq7B0d6CUT+eEtt4By2pYtNeuNmRobAusFtEAZWg5k7qrDJ9KJPIjR9KH0EGwlLZ10/qC3Ar8gHdxbZf5tdIxuICbyMnsBcD2U8ol2GHcwxPRUuDsMfWKi6TmY0okTUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943209; c=relaxed/simple;
	bh=GP9L8s3+6Dna8OPJunaRkww/VynNPAuD1ynp9SUd5jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dn5RBWgjomQd5shoKhLCdv9Yv85PMz0EutTzP5FEax8wQWmN+TCqOIkfdzb6ChotWkpdsBtUbvP4TgCnJR2YR7c9wxl9oU0bzmNrxoOx7dtqsYnpbvxwYvtOQvezNF3ETu/ez1TP77jVEvLzL1ddhMro8XsW0AI6JmM0c5nO194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pvLo8/Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpAjG6s2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uL2U987855
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eyjs36fm74EJZijLcHA0ssTPFQ4dZB0D3TOhVHv00JY=; b=pvLo8/Gd3m6MMxE9
	aLhoIUoAjJwWxJYyIdyrDqh/x+ivNhy+EKA8XoOtKhe6L2ZgGvP1Gpm1RDp4Ge6A
	2wzl6KJYJyrR8WrqRWkI4TTZ4aLTPZ4prthp658Qw7etp09gKHQxQc0nb6/3acLT
	VCl7k5jy2YRA/0Y4AGUr4piHI5BFqtSqIAlWOO8JPFMAuTwr33hx5wKKsDg2j/7W
	W9ssAH3K+jdiEA1TOJNtz2Uf1PlN79WJNo3k5YmQlr0PLXSgMCgvtUZexzH/m6fl
	5TbwtSJP/Lg76YXsfV9K8yOZwaMBQ+i7oxIiWnp3Zziz25O/zEnsU61mc5MHojF3
	sKl7/g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3myg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:20:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so17058406d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943207; x=1777548007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eyjs36fm74EJZijLcHA0ssTPFQ4dZB0D3TOhVHv00JY=;
        b=gpAjG6s2WlTXMzJHkGT/6JVVWAFUMMRzHKYfw/QUnXrMN5iGs66bubbNLncRZ4/OG0
         iWveFMtQiEf4QlVgyVm/SE1UL8gsCS9S6OtmXcckCYjlEg3YfHfpTy0UpadA/dG1/g37
         Wokg8gE5fQGa6Q5uZzQEor2ELQfvvpSRe6cFqVcxjQpDECt504WeZ8wHhQ1ME+yF5Vf7
         i1iilrUWCJlL5Vtj8LpbPGfUUc4c3LY0GfeoxmEP3NbLuhjFec7BKMCqgw6daCaDC0kd
         9LkHLnWCSgg3G/bDgHveNwVypsKyFBYoIJLdpx3lflbZjcX/QzPRo8GM+FCn7VBMbSs2
         E+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943207; x=1777548007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eyjs36fm74EJZijLcHA0ssTPFQ4dZB0D3TOhVHv00JY=;
        b=i0hYWwRl6sdiNemHxGMdg1rj9JPr+6eBX04vhsm8SSrrjk+GJWSW1kD6Zdngcw3gmQ
         CRK59UtT1kGmiKRbKzBHFXrGGRfVUn2r8+98K/jm73zbBXlDv8yZhrkwv7rXSc+Nd4wp
         GPB24ebsfsRkg8AoBMYzHJZIG/3ofdASPlm7Lf3n6RS8epdMbVktWdH/UtJAyspV60Je
         7JjQVgxLCrYY4qt8GVUHG3l7dR8O7qYND9qclMENGg6LygzFcK3qRvUKC7RhMafsUqwr
         hxn0429c/p5GsBx+GLF+pyWj7Uy0H/VrUbReO7D2iSv7fC24OI5YUNgbJVS3gRdyqAnx
         ibRQ==
X-Forwarded-Encrypted: i=1; AFNElJ86zkzbIIFR/NkLjumbTAnCvmXBVenp8e54L4WjZ4b3crFNFwt5wmsiWPBtlvYC/MAGBzzb4cYxJcJ/kDYo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0kflZYFu65MRH9/LIqm+nrzvcdP/H/THN4vSIQTS5qa2RkrqK
	9xBtcX+8qAgf6NMQuegUXdxcbzeyjs9Vljg55glyA8IwkHeVO+3o4m8H2hnrbb0nOrAq+bc9qxG
	PCVqXa7xnp/xdHrnEVjvooBMbP8pzsBD3LRJGplF/alVQam+p48pIdfXF7Qbea3b8Juoh
X-Gm-Gg: AeBDieso9Xi2xrsnXNhneBBd2yRDjJDMP1jhYMQtrKiGQ4TvK2+v8z/GZXXEZxPtOmb
	ds+ca7e4uQzl02jfohoTyL8NzZyBPw/fSSgxEk+dM8D592SUPCAFkBX5zUyBLsLsIcJTo4ATvhm
	ftel7lNan7Ix0T55hLJnIa7dXPbIt9Eb7hiSmv8WNB6BBu796Uf3C+fq4fuRuSbmhrZyo80ya2X
	dWeMoiafPdvmBPBDSeU+xh133GypL+yRhzX4hnJ1EOA6Vv8fF+uKVPnMe3Vo3fBRWS5IveLmbhG
	3T8CHMHDXPCR7eYewzny50LXK/K85u3cSEyS9kBR7jMb4DHxY5rE1Q6xwU+zKr+QyKPKuaZiZhD
	cV1iXIvxeKC9o6LsWMqXOSrZrahjS51ruWjc5QFQz5TZl1ez5V5UPMu8v7NR/i72UmGeUpdWmQN
	Qsg7uSdwGW+lQgIQ==
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr256855371cf.7.1776943207096;
        Thu, 23 Apr 2026 04:20:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:50d:9138:3322 with SMTP id d75a77b69052e-50e36c8e98amr256854981cf.7.1776943206696;
        Thu, 23 Apr 2026 04:20:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-678974e23adsm61612a12.13.2026.04.23.04.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:20:04 -0700 (PDT)
Message-ID: <8ca34203-68cd-4e5a-a4d7-de36c0c35f91@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:20:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
 <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea0067 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=X9vs7x0jcKjliShTIuoA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: UQiDbQDMh6cZkNAx3Vz5dAnFqVR5_GaA
X-Proofpoint-ORIG-GUID: UQiDbQDMh6cZkNAx3Vz5dAnFqVR5_GaA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMiBTYWx0ZWRfXymqKBjzhojoA
 q6BSCGgAgSP+8qhDwZlg16F9yMtCBern/4SncD3YRj64WLPdy8Mqq8SE74KBCxVq47oetlF1c+T
 1yc7ousT+DNfVRJWPASSe08Itvt++F+m2EbnXq0ik8c/ro7sVTEkVi2bcrqgvxUfBf2KgaP3zYe
 iEYyS8Pu/t0Vcc94G7IKwlDOZc1oh/Kw6ymP+0YUFTbQYt8/yhWfqG2UHqCd/18iAhhtnPfqkeT
 j6vGdWPT5kW47RWwHhnGR07unw2kovIQFTYXgTgsl3ZzvUqGrOstKxdu5Ro0B1WvJNMwDPuTxnY
 rZcdQCDpv1alIxxRf6BBb/djEJs29hB43ydAkJAEKtKIFjJFSD+agRaxbDzsFIbheC2nKaf5OL4
 ffP2vyvZSRpvQGeeewn6XOGb8wyGAR1BW/mHGkb1/4/VMU0tQPvPyvG8P761ESRqB0Ic9/DMdTK
 iLu9g+XUfAiA7Qnw/NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104296-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92D9F451342
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 6:41 AM, Viken Dadhaniya wrote:
> 
> 
> On 4/20/2026 10:14 PM, Mark Brown wrote:
>> On Mon, Apr 20, 2026 at 11:42:50AM +0530, Viken Dadhaniya wrote:
>>> The QSPI controller has two interconnect paths:
>>> 1. qspi-config: CPU to QSPI controller for register access
>>> 2. qspi-memory: QSPI controller to memory for DMA operations
>>
>>> @@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>>>  		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
>>>  				     "Failed to get cpu path\n");
>>>  
>>> +	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
>>> +	if (IS_ERR(ctrl->icc_path_mem))
>>> +		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
>>> +				     "Failed to get memory path\n");
>>> +
>>
>> Does this handle missing qspi-memory properly?  It's not conditional on
>> the compatible so it'll run even for existing devices.
> 
> All existing device trees have been updated to include this path,
> so there won't be any probe failures for existing devices.

The problem is, not all users of the new kernel also update the device
trees

Konrad

