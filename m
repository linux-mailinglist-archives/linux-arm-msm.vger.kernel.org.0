Return-Path: <linux-arm-msm+bounces-58085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E5AB8B66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBBACA24083
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63686219A95;
	Thu, 15 May 2025 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P78DGP8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5C2219A86
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323777; cv=none; b=fTKScKF5QcWnEaHWxB2Q9qb3kiKQGlDiKn5fzYvPX4uOGX94wu6+lSw/Z9hmlBHSzjddR4i3N8+ijPtUQeLrw9HriTNgb13LqNEJbsO6aa0+2X+OBnPfCS0mAH4u1naDy0mpvCduSYgrbk2zj/MtXyYfoWuZaFl8zhE3sQ6sHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323777; c=relaxed/simple;
	bh=JVbvGVI7vr7SKk/Dz3SUZ0JXpDRQsX+JcZVvFlgYb5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4Y6JW3j+UEHx6MUKCvEHIs/aGQByoU2p8DREEulAqtU6U003lDqLS3kNK7n/6nNYKBfymwx3E1G5j29FshMJU05JY9vNqm/JX52C7JSSF833jXMkX3l14xAqESaD0IAzUNmEDk8EW6dbOhrTV0Gtk2Oau/fWUuOzTKs+vuZK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P78DGP8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFFcr031488
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XA2Ckgb1A92R72wK/xiF3TiinHUJne130PivAkUoja4=; b=P78DGP8hI4UwuJsM
	9/31wNhbDcv4OGgarg9AGfZR9+i6tbOYdRa3ANCne39ds6UHtjWdnZJVgjfwbC0j
	SPMXPa/iMqhhTGQiZrHYKHAlyfjOq+Bo7kRXu85gOgCSEibkA20rdmGJxaRNARVc
	u0o19mrWhUYdiovADs4v6PxDVIc6vzx8vRqgRAVs/73pft0FjqpnOdTk8DkYVxsT
	Y20dwHxi9urOnzI8hKTBm61SQBxg5j7fIqdfKQlDF98DlZ/rILjHa1i7DOv7D0XD
	ahlblFFtaBI0mr4ilXdNbxpHxLjwLb596XZMCY+/RNY1esLMonq1KcGTmxcHYJHV
	xcfq1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr6j2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so24930985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323774; x=1747928574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA2Ckgb1A92R72wK/xiF3TiinHUJne130PivAkUoja4=;
        b=N3xGzSOVNfrgDkln9Qxtpp67jps53z9Su2r9OOTgb0aouIOmPdw+/e17X3jzVQZ6cF
         zvcsbbyQy2aJtujRJNiaqzH8/DvUdPYjUAlWgFFysGxqriKFXlVyN+UqTk7Rfo9ZPDHY
         pPx1oL49Pqhk94Fh7cfRp0xB1Ex+RfkUNG3ZSj0CxgdejO6fRpi1/ssi94b+rcfuBUtt
         2DBTqaEi4I5KDz4fHBs2bs1bT2u8kwoxlDyEhAsLIO9D40I2a0TPb7YV4FIe67rTaJOQ
         3dObHv+OlmPIiURYTvZ3Gj7ieT4wugHYuk54AuHGATBwDRXnKIUTSqpmSyJ5Wk9Qb034
         g4aA==
X-Forwarded-Encrypted: i=1; AJvYcCVVJOWnbuzwhkyJyTY3X465U5yM1I6HhrzGp0h9F05jv/g1RvjhEpZf4hbNrA/M70ztTsOXXQrNWVB/tePT@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/UDSq6CJzzigoqMl7olhscsSRsGvdNgK9Yv2zKDWitz9mTRu
	qKzlqIZeJSKOrf69NX6D97qr+LsROFhgdFFNCsZTWLZD4Jj9HTudX2izRc9GVUpUE2WK+72Zude
	m9BdV2p736WWTYiw7RSBqBMexunDJxLJaaCxnXXmPADPTbbScnGXO4K+FOe5tCJp4
X-Gm-Gg: ASbGncuid+qh77+riIxxPqkx6vSSLF340MHaTrHcjHbcw9w40Y/7roMxesnXw9rhpPk
	iPwTIYILykJsOsefBY1Lg4Tw99kvhWeXMGNz58DEasvFCL750bh4zwkw3vfcTcx7uvU6YrkIrB5
	b86WyyBjMXFIP2prfTFhiBN6pRt1GBdFap4yggqe2vP1JWifmq8zLM5SU0pZQKHulOu9uLg9c7L
	dYl0vE8yx4uygphU23QpxmYJdNglomjVDqwyJNwQ42p6C2gC4fj24u4iirobkXi77dKoY0NIixz
	3Xc3IqOHOtZDcURBKVVXHb2cr/0h923sfNzHh9pAf5h9LtSxlqcMrCPcqpHFrQ16ag==
X-Received: by 2002:a05:620a:2811:b0:7c0:c024:d5 with SMTP id af79cd13be357-7cd287f8075mr543661285a.8.1747323773888;
        Thu, 15 May 2025 08:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT4fxs45M5zKmI/an/xseNIdZWlRHxwm3i9EJcr/D08ltlthN8UWO9YUVu81PT/6ZHnHRi4Q==
X-Received: by 2002:a05:620a:2811:b0:7c0:c024:d5 with SMTP id af79cd13be357-7cd287f8075mr543658585a.8.1747323773413;
        Thu, 15 May 2025 08:42:53 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm7074666b.6.2025.05.15.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:52 -0700 (PDT)
Message-ID: <7f167ba1-5367-49a2-8d00-08fe7a44a022@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-15-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oWl8yOJJjfY_8dKDAOBU4-3G_Hoq8CkR
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68260b7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fvWm4ETZ9MensVEMrR8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oWl8yOJJjfY_8dKDAOBU4-3G_Hoq8CkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX9CL60GDTfMws
 tyb1NBjUKzkog4Hp1nRTq5u3XQZoWzYr7Q/WQ0SzA33i70/5AwzXdPDSx41nghix1P7Fx8s90Ie
 k7yAq2O0qfwFCwIY1gEe1uD4I52T7CtDF9DhHJGuAbzgV1Dg1WuCg4HKbJZxNEOTiZsMPH/aoss
 U8OPgx6WJcY1RuhfqISwohcxlAm30V+JN73lcGiKpY4121GUIIKQyxqlM81CsXVkvVf62Fe45Hv
 N24IthdFyLAuh7XtHK7yYplN2sJ9rzofGkON4vEbUXQVEHyayldWacU7TE4zjPmIL5TZ0jOpM8h
 tIsIsKZ84S+TBxnArDbDU51XqWnh0k5SiP8DTSzJUM+1YA+4x9CHM/nAhn6vgKee6xILgy3cu1T
 Kum1JrugPLqYmZaZGqgYR4P5U+Xsp2wS+a/ilaZMv5lcxOdMs2uLTImVu9cD/I6m2ZRHSTEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=724
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
> node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

