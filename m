Return-Path: <linux-arm-msm+bounces-75099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E0B9F501
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 14:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663B94A3FB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B3422AE7F;
	Thu, 25 Sep 2025 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTiAQQir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E651B532F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758804246; cv=none; b=pZAgvapvuN2jIz+z/iDU7qpmB7KfY3z4KCQ8M1BXmk5NwmSY1gewug7qjrAho0nSLfDE51LhF42meFpB4PynIorIhfakGn1UTWJcFkPKx15xsyFxMOtCtWuhGI6IvC2oaOta54rPcBrELd7+ZRtpFv76JJq28vBzBw4OFbh7Rf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758804246; c=relaxed/simple;
	bh=FDZQOCz16djFlBDx5G+q/SJZvR1Nd4tnacSZ3RZpF6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZreGTr0SnVP4nFbkhxQljr1WfTUsU6jOJgKoJv/hYdc9mtFVu1IMlL/MDisxmiiEIV/w8ffZyaaHQhJSpd6kL4Qi4V75qZAAQaA+0UJiUSCYvRupw0o/a2pNfU99gNU50vCParR82BUrdN0Gze8h9EOHX/cY8VAIIMq+pBDv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTiAQQir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9l5wQ029974
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1dwgELFlCnM0xIxl3rJVZougZALziWUncte4Klhh90=; b=ZTiAQQirl4hUHOrO
	ABNQSD+zst6QwW3Mx5Htc8nHBSCq2PE+UFQiVFgJQ6MvE19n1shtl3QsK6CwWlDz
	DGY0dNYq1GxRKV1Soz4p53iJGsRt0kmJmdeWvIGWmwmrCJuDjzEirwDpgjQNwsf7
	RZFLR8OUodHYoRJO5sIyHeoIjS6ZNUPhehjQaI6gCdBPldzsxu2BuUGlWyTqClOD
	zDjJgOWupElvQwst68F4g87Vk/Ycksl6CeEx4d6HuqAINQ4aVZeL9dw5NdbfqnQ+
	sJshWOPmtEi4YWGFfgCVWXz3fYNGqaV4V3X9iTQLhY6fLOWAQ6rCNYHMnauoMfEf
	hrTSxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fqyv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:44:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85696c12803so38435785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 05:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758804243; x=1759409043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1dwgELFlCnM0xIxl3rJVZougZALziWUncte4Klhh90=;
        b=SOYLeD4Ayu/GhsL5idAVFTqr7EiQYojU7ozowKNgOtFN5zC2NLURCiv7tivhXlxZev
         6QrIZdFGveIL0snCqMDoJWa2cq/dQrCIg1O2tGaBzEzCCisXTs3UAsfP2nnYAYahoyrU
         Aby9LOENhsCBjcoxqu3dBxA+75DNT6YJM5s6WhHOeCtcr1kZdEXjHijG6SNWHrrPXjsF
         ZwihbcTGpE979AEvfR+cnW7XwUPsgUmFHXlLALVg+np+8A87gH7K2EUdNENhNcBJaVZr
         vzFWCCw8z+LMPt/8wEtBsJNgNogzfyFONzhgBbYorWugxh96Dl5qVhZykuYtethA/B1X
         +h8Q==
X-Gm-Message-State: AOJu0YzX6gR6W6McP9JuQh4Qow4T/RPzYGoF/rRku4IA+hsQEmDJN8OL
	HpOf7BXlB7OLi2VJbTzg4ZGeJedHXJhdqP6AiE/mriIkrdKCDXMdpOEgLd2C+MdnK13HYrua7Cu
	jsmNZ4N7rKcqrhOaqR14j2x99gQxd3OVxeVDK1efL22IsnMWYrk6GFOluWnFFycrv9tI5
X-Gm-Gg: ASbGncse+xM3OOpcjcKqqrZcOi/4sJjsv5b0HLB9B5OKNfOUbVDvKvTCHWQ2KL1pP3v
	CCer075R2DyqhOAVMLUGDc416IPZOpLry8QzI6EOnkNw37MjlcPveO0EHGB3A70MpDjA35idjv9
	HQVlZlKWIY/2zSE8RWZ5tVmHJQnbjnTx3YQ1wmOf5VJVTlZA+93GyavZZr9GPMXRcBHC0CpZcct
	qo+vvwn0pg1hErplUAamHIT41MCfqY6mmBkLZ1VEv2l/bqxXSErmYCHVHijUQgiFTvD+J+ifBXt
	qg/8qvKMToUzkMxW+almjnBLuzcGXMIXl6I5x+6qOugEu0HBKzES8yt9vUrGYdNTI5xAP1vPSzU
	fycqD/QOrjcKjMmBTJ4N68g==
X-Received: by 2002:a05:620a:4888:b0:85a:dcb:a0fc with SMTP id af79cd13be357-85aea416316mr275179285a.13.1758804243439;
        Thu, 25 Sep 2025 05:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTirFLDo0M0Czkw5tWy8aR4EZDdLw5DUbB9F6HAhp2U1yQ+4dTFZ34JK/WVzP/W4uKPnDE5g==
X-Received: by 2002:a05:620a:4888:b0:85a:dcb:a0fc with SMTP id af79cd13be357-85aea416316mr275176485a.13.1758804242839;
        Thu, 25 Sep 2025 05:44:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9978bsm163475566b.95.2025.09.25.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:44:02 -0700 (PDT)
Message-ID: <eea3ad4e-d656-4ee4-b4fd-2414ea78669f@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:43:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: add the tlmm driver for Kaanapali
 platforms
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
 <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -RotlEP9CJDHTH5U7R0NtitsIgd4Ch9D
X-Proofpoint-GUID: -RotlEP9CJDHTH5U7R0NtitsIgd4Ch9D
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d53914 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=3KcoXW5xE102B6w2v2sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXyceqx5SjRQpp
 K0R/uUCsuPseAjvK3vfWPGlqHqkJxZ0B8Y5PR/iXd6YX2uLW6vvRMK5espBr6884Qg2qv8cKfLy
 7DDsc9532iz69NsvOGQuNZaNDX2osHhCNxngCnZJDyfYQak64fRRlSBxN2tCiJKAuHR7tcWjQOx
 uEDCfjQr9oSdwzCXgZzU1fQrhlgowEn/69uFyfnUBB0DnRp5KWZha6SYpjZr9Z5HFxgWv3P/0C5
 XSIY5OT9M7ppdKzJ0GqCJ+1PUcu4rI7QGttX5eruXGya27+bGHLxKo3G3ytZclchbDFXBI0UdwR
 Wna4wqQYX3q4Bpj6NF7yfr/zf/8gmTffiav5UjacSQbrXs8ErYVSAwNHaqcimFe46q7p0vugAmf
 QEWudZmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/25/25 1:16 AM, Jingyi Wang wrote:
> Add support for Kaanapali TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

