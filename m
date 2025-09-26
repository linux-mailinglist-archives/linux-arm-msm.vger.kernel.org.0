Return-Path: <linux-arm-msm+bounces-75297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF0BA3734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42A8B625613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 11:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892392F546D;
	Fri, 26 Sep 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uf1yVbey"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCD2F5462
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885080; cv=none; b=H1lbFA6ttzJvhkCYPvKNNmveYr+MB4vymiH3XPrtSGLY4rimsovqgdsJtClIeJi87gpkiquatWvrbXWkEs8LL3iTdZ0fyuVrPYC/LsskkdQ+cMGCCTiDFOkGf9whCzpOmy3pFyqiCXkkKOS3bRPE2WlDvLLy6L7CxS558Ph2hII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885080; c=relaxed/simple;
	bh=bd7ZArgSTg5qfKlLUuJm/pUJecTIN0Du5HvpI/TfbkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/ko8ucRCK7wstvQdXi5C+vqzyGGJvkBcQERg2HnzKC1pvxKKUsfnv2VF/KSYr/sAbkIr4hl5J9bwEfwsIr4AoSf8U9GF4DEGe7KpCUqs9nkkXSyQSdNroaKorkSr+YVXt0KMzQbKcGbiDam8+SOY1v8wVoEpuSJqcNhsePKsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uf1yVbey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8w16D021321
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcr2rWNKBvfZrpU/iwc0DmhTjy2JSdUVyzxuRzY6YNs=; b=Uf1yVbey8ngRiuVK
	aLs92R3ZGo8hOoMuxaAJSwEobWqi1Bc3XXX/EYAdXYWA3jsGuNfIMruBpJwkgWg0
	34GAQV9esXF+e1lqrohQXUQ14/J7vtwyQgzOWjMo0C8gUYTaEaq7oEKgexC6kjgM
	Lt1+tDaNH8ZGF/AZXNgDTsFTSDkygAsygk2KL1XG75r5p46T3flp4ziQ/HSXv+YJ
	uKGWWMwyKnjT2WHU50t2FZ0fqatKwQMPZqZzUthB+jxeD0HT4rNJe+1a1YeGab29
	bqjFHRdmaKS0J6BB+2PxNMbN0pAhGxgw1CccAjKyIf7alt2u7imEpRFYgYX0NMoU
	R2/vlQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qtmkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 11:11:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-850dfe24644so86763685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 04:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758885077; x=1759489877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcr2rWNKBvfZrpU/iwc0DmhTjy2JSdUVyzxuRzY6YNs=;
        b=LoZJHD/3yJ33G8cDdjEKsh178C+YYXv+PVuQeMhiPL5CZSLXtBY4uHNVMifVFWoBUV
         oWTEI1POhhv6TR/Hp1uhbNKCGXe60Va7KqMEZmhxlem7hxK4WFPythAjoTXtMVePKyT+
         FRpWmwNYPRSv/AzjeGHSPX3XcIkQOfgLq5brRwG1G7P/7EVN7Sdem06GC/QBxGK9/qEp
         7qwjl5W2J3HU9kkTEPStOjiC3urkNiSO6bm0cplvyOjRh8y1V9hXv3aTmBS01URJoCwg
         wAtcVwi0LFrzMe0IsrPGnPRtpFZxM6Kz1sSQcD9VBKRLOTfieiFrT0WnrIimTZ2c+11W
         hcRw==
X-Gm-Message-State: AOJu0YypjleR4NTuCaEZOkAwLWR7AOoL/GEwRC62JRBRVcMF/MFPSton
	VWzL1jpoONBWIh6ADippEtleATG3whvGFoD9hDZXLbv6RUOXE/NycL2shXD33KKaJgvRSCfNUs+
	K4LesS6KXJABtq1y5O74xh5T0huE0+r9uVteRbiZEsDBG0vn0gxW9ixtxv+j3PdNLs6WA
X-Gm-Gg: ASbGncuRINR/PX6FhvXHcby0JvkIGAJKPKL48MYMLpvjMQC+Iw5gljo58HUBV8Ly+Ed
	sZRkSDOt+scVlZScp5VLkiDyjj4McHyn3/0xlvNHiAwZNoKot6CBgOhM78ndsJoqOfvof6VnvSr
	zsb++pU97TDNWQvoOF804FmV9S+tgt1Rs9FZ/odeyWPS1vKVsz2akTZ4R1Krcl4wInbDtcMNanv
	tE9EwMFVPggbRVRmvNQE1Cw3y1GCAGVzeX3kbjwAs2QddhjVD9eD7O9Y1ZzY9fuDiphxJN8RDZ8
	NdBkmJId5LnscBzXOB99F/cOl/g0pL9c15Gas/d2kU2xV9O4frbTEXrLBLsDj53Ql/7Upv03d3O
	HKwUmp3tWBkfBUoQbf3tP1g==
X-Received: by 2002:a05:6214:2aaa:b0:78d:d2a3:e170 with SMTP id 6a1803df08f44-7fc417aeb77mr75977746d6.5.1758885076831;
        Fri, 26 Sep 2025 04:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUncsz0oUwgZKiYxfzRIDd0uKhIPnoKttRfCdalmtC0fYaRM319M9md1ZwC5GW5vK/9VMu9w==
X-Received: by 2002:a05:6214:2aaa:b0:78d:d2a3:e170 with SMTP id 6a1803df08f44-7fc417aeb77mr75977466d6.5.1758885076416;
        Fri, 26 Sep 2025 04:11:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae3080sm2768826a12.34.2025.09.26.04.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 04:11:15 -0700 (PDT)
Message-ID: <4fa73f32-c3b4-4dd2-941e-ec68eef0bfbf@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 13:11:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for
 vision mezzanine
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, dave.stevenson@raspberrypi.com,
        sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926073421.17408-4-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZC-_BVpGeycNB5h_euFjWPh__2jDbFAm
X-Proofpoint-ORIG-GUID: ZC-_BVpGeycNB5h_euFjWPh__2jDbFAm
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d674d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O5mpf8q3-rr5ASy-kiYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7+dtcP8Pge2f
 7+nXtKkFOSVRJ3/t7uu+d3OpzbrgkVTZXWzlAYdfJz8pcsw48/vwgvO9cYf0CwedBsAekLl6wjL
 a+Ug7ZvlIp2kj3jtVb9UCzLGvfijcwExbd/GUgnEoJ/bMnna3Qwi805WRwaByyNAGLiMXXPYhhF
 NqupfpMr7bgPdlvjqqefLMIeLx0ulMhFgMxFGY0TPo+DmRvX/D7+MzLS2AEyNfozCldVJdWPjG7
 fR3mXGVoYVtjvh3UXAH5ussPXfixdHCBhU2zcIHR+Ay2jh7xbYCYfx5MwXEFdVbCXWlOtdKFGJz
 ElHx6abiYIbcpsOReYI4/OQ3hWA9dBZXDbtITmDWLJUNI7bqfGRccYjUZqY0/ivyISkWAMfcldT
 6c1LbA6+2aLj7GkpS0Eri1xYWh1K0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 9:34 AM, Loic Poulain wrote:
> This initial version includes support for OV9282 camera sensor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

[...]

> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
> +	camera@60 {
> +		compatible = "ovti,ov9282";
> +		reg = <0x60>;
> +
> +		/* Note: Reset is active-low but ov9282 driver logic is inverted... */

The comment no longer applies

with it gone:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

