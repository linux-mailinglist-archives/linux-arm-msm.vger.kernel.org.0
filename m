Return-Path: <linux-arm-msm+bounces-99228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELUKK7gywWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:31:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5842F1F30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14BAF3053CDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C744439EF2C;
	Mon, 23 Mar 2026 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BU+lu28d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKHgSkEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF139DBF6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268713; cv=none; b=UfaZaaQ1cogetnS6Xg+2fvgdrtaTNv0SbLWVopHPnnac9vldoHgXFfU27aw+uSwpNUkdzFwzb1H8KDaq1vTuiltl4Sc5aTcZ8LpK5cKT52lwwfxwaXAXdGZtgu5B2/FVIOzkCzJfOOEu8k+hbb/TOBdHri6ViQo4I4m9hvKf14c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268713; c=relaxed/simple;
	bh=oXai+42/8A8F8jdjgQxmIIDNAn116EPXzscwxWbFhmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poISoXyoiWEVwNwmEgnyLvgvpLCp/tivDNGl+HBVFl8NCVEiGsu253chPHPuY5C+YpwMXvSI+b4ecjtS20aUdSMpiLlVN5ai6ZBMrTK8vllOIw2Bl0ILaocwI0XLXEUR7pAdhI9+VC4Vlwt5XpPIDXZqXLZxLSiypYYW31mVxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BU+lu28d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKHgSkEE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADmW73539788
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=; b=BU+lu28d2SeS/6qW
	q60iEkc0Wbqc/09VVWtfNDGcXqfrFVTfSW1eKUc9eRZwSyfh8d4nsbG8VBcCrrzE
	sg2J4prP/M9AhVlgXJYwnopW2eDRHDk7BHDXJlgKuJnoKnB/LevBQyrdGOhnaPm6
	qEB5ItDiqDhdSxPNcyof2BKu6GdVNHsyWYS8PRtsHrpc1NcTH8HZFRdbKmKvJgRd
	vWvVqQmf5/9PhX2T3dseFOdwKnXtHSCm1B6VWQRyLtX2f8Z009qnnNOOxzmT+AIq
	VimyTBxPFl1gAKCPpOSlM38lt6u1kSyNST9DcVGPx9oM0k6bmSCwvvB/k0tJSTHc
	zGHHfA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30e3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:25:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50943e69b08so34381751cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268711; x=1774873511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=;
        b=NKHgSkEE2qvQAlIy/3DrBqd4FEc1getzp7525jJbbCzI4Kd2xbjMXalTRgErm9Du+/
         Io63D+x1vgSsm9LzDO+WuQFtDKhyrGxNklQg8yL+4HqOuQqhujokJk5wusuPF2HUVKHT
         WVH/zp+zv3yHpP0hwBwbZodLbbC0IhmFGlS3AAZDnWX6+OULFR4sX5FYCc/4AjE8ygs6
         bmSGGZTWexN4TKT9TyulfAQLDqQTTpyHOlvF0BHjcMqQOz5lFsWYEzVzMeV8Khxeqtz0
         Tdi6BWRXqviPpVGx/2j18dy6S+QnN+ocfIdMZq9eFBFTKHvvYvIB4pun+8wyxfdcFe2U
         mQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268711; x=1774873511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrAAXizoOHygHzB/TmZqVGfrawcHdiN8J7vTtvklL54=;
        b=InFk9jlhgXARjvFFbawL7ALivQawn9efGWtvEKUsgGvLNBnBeUMLmjhZvheH86sYBl
         2UJ+Svu08fWJPwuK0tuDM2Br1XJOMyZZPZI2DwoaT9v6JMd/rQmDYUi1pCMAkCWAJSL4
         av0KOf7NiGRMYpfmLNjRqBIvnj77bnagMFajY82BBv5gn+NE70mcfrSqkyEpL2zdZloC
         y8NuhuRot8hCEwxM5gHARLsbXw5XB9I6p1eSL5E93CMp0G+EhbgbRZdo+zItdf6Fo/GQ
         0IME4sEK/4E24B3TX6ewUQRxsaV4tIa8bcchGMF8cHPHTXer+WQXl2JxDKp3no6CVSKM
         nG4Q==
X-Gm-Message-State: AOJu0Yz+VGyhKuxYQOGKSKZUvka+d2m6aBvX3eFJblTRYrypN9lwOLWv
	dXGQ/NWC3l2HqJy4dzflvsUzB+v4c55REol580dOswoGkNFAmCHtjAyw+WhBoWR4vZvY5oTrXt6
	rDuqP2mDIX45BMvNKxV1tOGPpAfpNMJ33FaGHwa4y+GTCid7qvzEQAUl17OkORLhLaPAb
X-Gm-Gg: ATEYQzxq7ByP3cJNWw2NYxtc3mF7yQQt/HOzJ/F8pr+P5x+vfqSBxwGytfPLdXghe9A
	mwH51I5VkHNOK0XSGWqXh7Lngd9hdh2XV9mMbr11NOrm0CXWOOCiYERRjPesxbq3d60PksNnlln
	apF51L9P0Si+jaAl0LiGDiouv89h6IMGm8M0vcMHSxNBCyyL9IUTWJPd/ufTdJ8reyBX7vKdM1g
	FqydiwbjC+T2qLMcXkzqhFM4RpGiUE6hov1Fj2wCK0aNhK5h6PT5LnVTSIexe0cGNvAF/kcE8gm
	jOukjdqBNZccBJdojIiPkG+jUGQqVXl9U4j9IeT1jzOS4eThVRgY/qmQD3HF5Cw7wypG6vvJJ9v
	ZJQGJbhsChZrPiV1PbU0ZTy64qiGd9rlbS/4Skt3cZMeAIbaQ04y9pkDx8WP+evk63oBGB9/DqS
	lRrN0=
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr146050991cf.2.1774268710750;
        Mon, 23 Mar 2026 05:25:10 -0700 (PDT)
X-Received: by 2002:a05:622a:293:b0:509:2b5a:808 with SMTP id d75a77b69052e-50b373d3484mr146050711cf.2.1774268710253;
        Mon, 23 Mar 2026 05:25:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c140sm496780866b.63.2026.03.23.05.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:25:09 -0700 (PDT)
Message-ID: <96074093-b653-4024-bd09-efcd3d68927a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:25:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Ayushi Makhija <quic_amakhija@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c13127 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WnUHuuy95XYsLch6RvQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfXxR8VA0WQ82Gj
 Fo/E0PBzWGfYcuKQJ4SkNkZom/ahS3dQgl3/8Z/ndikU8m8j3oVNj9lMsDcPxhenEYRVJD+G52A
 FDqlYhFUs/uta1ANlcwOsOVfrCmB2O45lVKPt8WZo850aPqNdtMaTVoqgaWeJhEA5ehzhJs2Adq
 DskEbqa67NziB85JGhb3hI46L5Iw5KILijX/6s6lVNMdhm2c4kvPdQCkw8TdEJ6WpNdO1PpKORf
 r2ZXaJDzRibAz00KVMGOx/LGZp0/wuj7OV+3Suzn4RLAmIUlHYde0TLfr0VITun5wO60puMIP2q
 TK0R6MRm87vH4c6QffZJITO+dWjhzvTOFgJb+dOBHZfauqCgtwNXhjrONFxTEbGx4GYqb1qcHkK
 gupWRrVYWhMlW2R2xHbsiMfvj6oIxRwewfqPqEH0PGZFn8nPZIHIlR1Y+Aqnm0IRziPVrK7Q1MX
 Dl49vp+6/V0K3+ZbWZw==
X-Proofpoint-GUID: sRgDt-eeNm0qpFdpFy7kfuGSVrkq02wI
X-Proofpoint-ORIG-GUID: sRgDt-eeNm0qpFdpFy7kfuGSVrkq02wI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99228-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D5842F1F30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 11:22 AM, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

