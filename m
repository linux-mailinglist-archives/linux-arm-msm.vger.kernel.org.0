Return-Path: <linux-arm-msm+bounces-103249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Lz6KFxV32l1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:07:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF47402539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71F873044A45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D43308F05;
	Wed, 15 Apr 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5PadLOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LWBDldZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA530ACE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243686; cv=none; b=gm8Wb5FN5gr7SkcqdAaxDMWahjcTjBA5IkXAe/9uz7sNr2dFqI5ISI9Xz0hQum9AgsYC4V/UJD84+bBPxf1u3IGszp4G1XfabDMacm6l20ND7TJqlIIhAuvywX62I1Iq68RN8WWNHUj2zdE5IIxC3g7hd7/20FJ8CIyqnc28IYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243686; c=relaxed/simple;
	bh=7KpG4UWdwvqu8v/T88YZbQwzeTM3YOeeINseHlx/R2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t66vrEoJ380TM0auz9IaSRaszRy3SIA9b0aFGePGcPJOG6hXIj2FUa3xR86SAZM6QS0QTAnCQGZgYdRgl40mxa2nNUdJ8y4mTZKQzxZzrzV7Dy68Ub27HuimkW5kSeZFdGtf3dPcF4EKJPJV6twwXwKbqXDHRJK+GZx69cwMYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5PadLOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LWBDldZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F8a9cs2005577
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ily7UQnWme6LgkWcvBf2LTy57LIttXFhiZpYV11UMT0=; b=C5PadLOnmCLU1OGK
	wiHu9r4UzlUpR32Vhu7XyAqjSI5KJSrFvkVP0gLz2uY4BiGuRh8Q6OvZ8v8d2dfK
	ESJHHAga7/c098jyjqh0oeA0mxP2AxNWmQ7DAGpTHl3VAWEnOTL2Q+RHryXa25j1
	KdQFagRJVSADbWhZk1FmYzvkTRw3l5M/EPwjEndiOiee5KBSFbFbiNUe118OU+hY
	YrlvVbPlsE/0ySCB0uzs4zGLP6HgKb/yNdueW2WXSlUNSEqcMK2YTiOkiW85eHKA
	7t2lRAfZ+cAgPgKMxgNNNG7+KNAZsu4Xq2Fth0CSQyOf+aZeI0cEhfbhBJ8HM1rW
	nxkqGw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrsju0jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:01:24 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6110e7e82b8so175811137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776243683; x=1776848483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ily7UQnWme6LgkWcvBf2LTy57LIttXFhiZpYV11UMT0=;
        b=LWBDldZAnYbpSM1vS6qSelfQ2dc6jQ+Z3MKR6tjO87HeMclsyy6LdB7VGB5oO4lqCz
         wZeVHbn/CTtAtNu29bwUxVc3l+U6Ql2a1WLTO9nat047HAlgZpSXfg8LwC0yMB4ACznY
         CG7TwkZrxTG+8QTFRFaHQlBPpDRCgYLfH/bHom7yWY6bAFCCjgWkktrB98XeJK8jeVDg
         klP+V1dPhPA2iqeAOWP1+izW76lJfT0sONlS6kyqtogGa3bSfTEoQA4dUnEweQhBTgEC
         TF9I02qyToj0IoqMFQEN1AIj/YWD0ZX/JoSy02B9PuuwfrWyuKk302OtgRJ3lpAiHROK
         JT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243683; x=1776848483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ily7UQnWme6LgkWcvBf2LTy57LIttXFhiZpYV11UMT0=;
        b=RC4FUn4Aiw2V6rsjPoSNi6jb591knSAWXsgBlyd8vE5TWJNPKFIJoiwUXnRnv0bJt/
         sENB8jZ/q69PhnGvv4MDRMYbXqAD0GjBToTnod5BlAjzx1zIQ4Mo/ihufqQVHBAkgWS+
         SPR7Tf5tRFh/Odjr7zhRoZAgVURltK0OvvDhMz6SANigNWHDsMyUIerujOqNoQizBhxM
         54MTEiRYPId7UpKyGXdp18VFdGvP/nRUu+P+rxmnPyWm2uxJ9TivgVagsFHOK833MBN4
         0IWx4wiK0a1VTAQLlYl4bTOloe74EvcFjcJOGOmXVQXCDlz1goQlp4wFiChf45+bN13W
         edwQ==
X-Forwarded-Encrypted: i=1; AFNElJ97rkYM8jVduLPNPhSbU89t5ZqaLXowBhRudMBHN/4zodsjQQNk/7O+R+NqEn6yBpGWBJ8s3lOYmpzoSk2d@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSKsJpepC0qdBiQKF7nUT1UuqgeDoA9DQnB2E9esEq6WPeaPl
	676UxpAgoVEmD+hVUWYWOwwwfwX3fmFvDb/nPs9ounmVqDPo6aywtU4FilLjWTrMGIM6sIZM8QG
	Ekt0SOQWMYb1hvO4/d5BzSb5tQ3AnfN+TF6BRD6smFkPcc6Rdz+vFFKvyiKW5ACQcjGyh
X-Gm-Gg: AeBDietVWfmSMtZw421Q6CmKAlkuiPVPYe7cy9nTRdTZw2xzs0jCfw4k4Rv/LebyBSe
	hcnyymq2W6639adHcCfarvp7RqGo0yKASIN5RKvImOTEf2GHihGRscMTajYaAmJ0k89WpOU2txg
	ggTdgH8cT00zLteg/wuCM3LViD9tR7qqE4uG7rXFVleXH1uSBgnfUPiOZuO2eqqOtaTGaJGTcvx
	GUWs7ZKfmb4IJ6NE9mi1/f0fWX546Hvmg9uObkddUjvOKqPEQhkPkrNWNP+lov5Hxmm3vAQSRo1
	LWeGl2vtPYvPgh8dh3MMffbur08wgxa0B+OT+ybjHKH291jcfl+oQvCdlkTicdGPi1+iWWmehZr
	l0Uozz4fi9FAxxUS075sS05ivF3L/xxi97XFcnZ3tWTo2PfrzLMJrQj68gDYy0AGwhng8KUPYHp
	4Aj/tOdwunKC/8AQ==
X-Received: by 2002:a05:6102:114b:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-612b8128344mr154460137.5.1776243683385;
        Wed, 15 Apr 2026 02:01:23 -0700 (PDT)
X-Received: by 2002:a05:6102:114b:b0:5df:b52f:58ff with SMTP id ada2fe7eead31-612b8128344mr154448137.5.1776243682984;
        Wed, 15 Apr 2026 02:01:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c4e57sm35068366b.47.2026.04.15.02.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:01:22 -0700 (PDT)
Message-ID: <9c76480a-2586-41da-8dc9-37caf0ce9b7d@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916-panasonic-eluga-u2: add
 initial device tree
To: "Lin, Meng-Bo" <linmengbo06890@proton.me>, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260414184429.168612-1-linmengbo06890@proton.me>
 <20260414184429.168612-3-linmengbo06890@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414184429.168612-3-linmengbo06890@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKhPmHsR c=1 sm=1 tr=0 ts=69df53e4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sXHwpbxk8QKxrbsP2dYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: T3uvPLwR3W6-L6RJWFN8_tyFf40JIjUL
X-Proofpoint-GUID: T3uvPLwR3W6-L6RJWFN8_tyFf40JIjUL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MiBTYWx0ZWRfX4KQpuFxleg5m
 lY5kMq9m4mKB5Yz/zv2LavQ8MCsn+A2ohrHoXX1eg4KvsapX4hZag5PoyzN+QaLlerdpwOs7Uoi
 FvOBdVJ5c+miNRjckkYoOkxGyCxFu9liJwtgegGlFxU4IOfOnGM7wUCTgzzpF7s33bhZTDFIAlg
 561YV/DtGcnMfPsobENoOwOBE+r80QeETVLzSWIMhl3KTFRB71ZZdCBiGMlZybIDU4IRCYLJK2Y
 fberClZxWhr4LZjbVfRY/F9lPPTIPPsajwwkBzN4ODu2USNSbiPe9JP4a0n5oSI7tkzyZ/HzhyP
 jeGXx4n8CFwOXVHqmf+4L7y5pJiVHCCFXhDxoaU/xZ32j1BxSFYqeU0rWJMgdQ92d4xB4KG2UuQ
 9QDGtobdIb2zzuCVCChbOGwMpegtNUjF+yiYu9YXM8OqC1vxKlDZofD4QER3c6V7qp/0BJZdhBL
 MJfoyohlPeFcQLO/44w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103249-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DF47402539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 8:44 PM, Lin, Meng-Bo wrote:
> Panasonic ELUGA U2 is a phone using the MSM8916 SoC released in 2015.
> 
> Add a device tree for with initial support for:
> 
> - GPIO keys
> - GPIO LEDs
> - pm8916-vibrator
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART
> - Regulators
> 
> Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
> ---

[...]

> +&pm8916_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";

nit: let's uniformly keep a \n before 'status' across the file

with Dmitry's comment taken care of:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

