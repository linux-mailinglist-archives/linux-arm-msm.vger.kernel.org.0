Return-Path: <linux-arm-msm+bounces-75071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D84B9EDD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96B564A05F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53352F5321;
	Thu, 25 Sep 2025 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjaQk7P/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8641D6AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758798577; cv=none; b=IO2z1ZWn2Gl4rgZ+lz90te9Qo4lpJl/yPWmdY0ZmKUxkV67LsKwy9TxSXyzzgjSaoqgDxZIdNXRS/aUt5vlKWL9eJ/Sde9Xl/gIeYW/8JpVLUtoffcz74LlQlAPmGsG3Ne5g16Jj9yynnkMbtdhfDp4ZKEo9IgpzB+FHRaqP+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758798577; c=relaxed/simple;
	bh=o0w1GjVwQtKKp2NQc8WIpZmZwonlDjTJQySGBM2xf0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWXhEN0odPqXa0qKKT4qVaf9Eq5QzciObkhAiJlSkyv+2SOotBBT5hBE9Ib+CK4hNZvLu5VkDPTg8eKS8g7+6nA/nHey6mkobZhAypN4NjBY44zBQY06Q5tCvwMRBDHLrRe3kjxcTs7+UKWBxtZkNJhOEeORJTqFeYr/1ceZMz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjaQk7P/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P93hZZ027919
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1MCSGjsMB0h6le6F1/XzmUDgIWqplxEauOTT+PDP2c=; b=KjaQk7P/O8uOYVp+
	5euhxmq2QNJ5VND2syvxJSJ4tWNE7wrrWuNFApVh1stoYnLio2fLzXpZk4XiWhcv
	OULupd+G7LcNKaZTJny26lkx8MiXsH2WqtBbjoVJym70KbjdNjXH46w9BKreC5Ve
	cJCRnIO9grt3gh5dWYsQeHGlK/fKWYnNwKKGObtnn1lwLAjaQ8dMcYjTCVjeHOKs
	KsOsm3JTduhVb1lPThxnkBQQHhYWiUvMj+lL4CS1A14NHn6gj9aVhoGJKXwaXpT8
	zmM72mY9WCCt3pmVw46CAJ3sVb9lJApw3J8VENRzj3qRpU25qRXjh9PaUDXbxk45
	mQrrAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp07fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 11:09:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-82b15c1dca8so33400085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 04:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758798574; x=1759403374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1MCSGjsMB0h6le6F1/XzmUDgIWqplxEauOTT+PDP2c=;
        b=AYT10iq6y5dx5GMZjp5X4g2rhwwf/YFmDbhDNiZhIoRc9DakAyEo0kMW3kCFNYwTDb
         fwoVKqtJP79uK6LD/X7ufhOYolgUwGOMYRYnjxGhpx/XLN3tCwUrFFGdy6ncG6x2f2Jt
         NjOClzLtUVggeuGBLKoyE+jsYi37OurlLl29UbZSS/yBOeFsnJgtXkPjybgW1GnMGNZ3
         zy7o+MyLsK0PrmbaoZLaCTTX49IRii9dFraIe701CQWeVTf6sezs+gVKvC+9ZXPAXhqS
         RXk2wKA1QcgbgjaGc/SQ5gRLoMWVQ9CpPyl4L/9FeDeuPyT/KBHq+xaftI2s5e/7o0Dp
         iNSQ==
X-Gm-Message-State: AOJu0YwDjN1csspGl9bcWKi3XOfHC8DV8cgx62HFxSuNsrriZl13+G5N
	A4UgbAUsYmDfV4h7KjUxEyYOAZbJDOK/KBd4IPYmslT/ipl5/rOhA88tNtHA11G5gpsIxtYIjUg
	siiK5ReWUGa2QOnc6+4+utYELnnAB+7LPwMETHaQ5ZVoFSP2CJNWD4S06PgxDS8GfFLlk
X-Gm-Gg: ASbGncu9lkRp18/5RXhzWv5KeLyUaL1Eg57iaiahFe7dvK2jW8to7Rd3LriMb7j0iQs
	4E20tsyXOCxZTFe0TQEqFUYtYNYDd/5QFUnTm0U89dva++3hQ1Y8PeWKh8ImipO2rbk98ZrbJc9
	9ThRYS2LdOBu1/7l6eWe8tgbkSzhFZYp4KQGqMtryEuNNV2EbhrJrNiuZlm9BqsC8n99PIYkBTZ
	9vNO3ZOKqxq8v0gUXjFpsDAmbyVGig19pFlYqWCuACYTWiuH5lEvc4Q+VeZwo/rVNeIUBTcFH2Y
	dIxQynXMmxMTCX/DldIze0p+Lm3i0zN2EAosmv0+ptt/d14g6rOlFp4xNj1qCbRevlObu5oGCzq
	V6jEw1ctGBogPL3sMpvGeNw==
X-Received: by 2002:ac8:5fca:0:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4da473524bcmr33527811cf.3.1758798574362;
        Thu, 25 Sep 2025 04:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7jli1zBEtFvmlXFlURWL9SpXADy7yTP8i5IQVq1uMTl48RyIBKvH5PvDY1w7lojOowXBzSg==
X-Received: by 2002:ac8:5fca:0:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4da473524bcmr33527421cf.3.1758798573979;
        Thu, 25 Sep 2025 04:09:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3af5721sm1018360a12.43.2025.09.25.04.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 04:09:33 -0700 (PDT)
Message-ID: <1053e541-4f35-4fc3-9f57-2e6cb9c61f9c@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 13:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] arm64: dts: qcom: glymur-crd: Add power supply and
 sideband signal for pcie5
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-20-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-20-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d522ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LDvWB-EhgdJigILL0XAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5SpJKvWawbklD12hXT1EikVPO0D9tPLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX874iRhO0n83n
 Ibc9sB7MeNBSnGVRAhjDbeEFyPFdq8NdbPmiYvpvFrkNiQIs2kPAk1lBrRHn1Jr7YbPPI/3tEVd
 Ei7VxGHjARv0XLwFkNQ1rvwXpNN/cjq66IFEz86rarfhE+SLIgf4ZhHmRQ5AZO0I2yKYXQKib2Q
 zEFpBUnsFVSqanQ5VGzSJ3D5kG1t8THZlrQc80oEUJIejCTZt2zWbaSgym1ci0cN/uInquwfKAd
 lHkLJWA5rlvA0rayFDxjBQFJlFs2vOACV8wnENs1LTiNtUCqBEi7Tj2FPqt8i+eqwib3zj0dNMt
 qsZyQaQoEswL59UW49UBRc6qCalg73PSO9VtKz2Atl86czs2CWz3XD7rXFCaJdfce/roOsnTSG6
 ySLuQ3zX
X-Proofpoint-GUID: 5SpJKvWawbklD12hXT1EikVPO0D9tPLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Add perst, wake and clkreq sideband signals and required regulators in
> PCIe5 controller and PHY device tree node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

