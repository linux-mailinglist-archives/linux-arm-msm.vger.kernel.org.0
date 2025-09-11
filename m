Return-Path: <linux-arm-msm+bounces-73089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6BB52D43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A74B67A9FFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1A12EA147;
	Thu, 11 Sep 2025 09:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKhngs4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6641B87E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582962; cv=none; b=at/vLb587gR0RnzzyTcOceIMFDyFsaJJUW4OwO4OfMh8yjmGAlmZPFdQprF3Iqns2POTd8yU+lC5dPYk1QygwsB48O7qBZmNT9gN2kyTW2OU8EG0XwzQMd9UcVyuZSrFTDVhOOI2f3oHzB1xZwZHgmS1B4QGg/H0MLgBw+YW8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582962; c=relaxed/simple;
	bh=72blF+qsjxC5t/0c7KgH/gWL+JBncousN8DD8s0mg/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqQz2OpfcxrbzMycquhpNFp+ooOXzKhtxdU8fcu6LmHZ1NDhLcivFJ7IsxcQbUUg7RiGNXf9cCcFe2nAPt3PvSqx6EKkRZADqfOfkMtnl6nSV8mCdWN+2L+JH10yoANZHdfH25tndfcwp5Nh7Kzd9y9oWKwzMeZb7xAC/HVQvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKhngs4X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ir6Y031245
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+YAxQ7zSQqsEHhoPGUx9h78jqSyi82RuPNlGqFck0s=; b=jKhngs4XYL+O2ofb
	dN1aVO+nP81mxKybp4l9e5TfiTanboJpCqDtf2oGpd972JXiaYM1NJKnjcv5liTN
	he/5VtW5mLt1YDL/Dj/+2Nq8wA2OWTuxjE4eWgqdzWIkNKElkS9yRrMBGrQoNcmn
	NYLO5hKE5OfLwuQXfZzZMuTrCRTBJR/gfhaX3P6ENHKwbRZhDLjdVqFn6qxOD+rF
	WXbFet2F6I8TX0CIkY0z1vz+JcnBgjSpp1J+WMLS9lyC/nu96rrN5qXGTtcCrLED
	Y4TyqMRoD155UUylNuSZ6RLriWSfc2WIGr6UktIl2lRPUIYy8PH6FowKZiVbsPkK
	bTVRZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg6v5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:29:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b604c02383so2653601cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582959; x=1758187759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+YAxQ7zSQqsEHhoPGUx9h78jqSyi82RuPNlGqFck0s=;
        b=FufsJ/+31vtss9xDxuQ/xqAejBF/XZgOYymgGwag8/OWdf8nA/ctxlXn1PqLip7gFv
         DbqgmoEDKN5et2llDjKP0e8QAqUBUAH7FYBM7ebnn7XGit/lpxxbBuRdxA5ttvZjayEg
         tPjeLgD6hMV7zV9bStKCYy98Q5tdILEef+qO2O1T6K23FkAQQzP6o5SxgpkcWs9dMn3h
         tchm0FsPLS/hFSj0V6AzsPvVUPq7KTP8hT64OCx1r+NPMWV7H84Qqxv5j1WR24Y47oD5
         IGivqm4L7z3OynTqrDerwZ6dabPn++6opqUUcxkQGV/oPn2p2zdGXsDQHV//ot4OqlFO
         od7A==
X-Forwarded-Encrypted: i=1; AJvYcCUF7nNUmdNir7KoGaShSUh6+XmFMbh07BrEQDHdmFYIag3Z0CSCHuuOa8DTJzBwwRSp5CLGgzc0paZH+73R@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMhlEPWPNxVPz6CiC50bwSFcUxgkVk5x1Zr7AjjRrkAAikoYJ
	k+avXTGulErRWmxY+X0WefZDrad194/nZVSV5GyulcF4Qe2Am8Pi4OykTZlxTVIRxeLEDTIVrRh
	8/cd42jJWbUaVmHpGkNoaH0Uqrq989r3AycXM5H1W1a9LgGWLrDE717iYmUgzE52kGElL
X-Gm-Gg: ASbGncs2vYQB2+hmVv5/j+wYRRUscROskvYp9NVwMkfVsBEbajo15/r32io2/e1z/gC
	I2/9W0qTtcmkyizlWHxufxMccbxH2G67AfGZka1yiTswwHpOxyPvY45BpNTvsgIwDqjouZnOi9k
	Idzxx3DU5hJI6Iegzi8IXu33NbuX6+GrWeWx2/Z1rZfIn/W+yYMjRQrktXQtNKJu87BZncNFem4
	h8P/T2gfmljg9lm5e606qJSujqWnlQlrfBk0MGHnaLgu+PyBHVnRyXNxaCTw2uMs7OaIekwYmLg
	biuDj00d7ItzD5OKOsQZRG+Hvl8YMqa/zgJa0KvN6oDQDYqqC8V4hfTAwFMcu1Hf1lg9tgUS/d9
	VRaivBD13Cif3zvK/KiFh1w==
X-Received: by 2002:a05:622a:164b:b0:4b5:f27c:8617 with SMTP id d75a77b69052e-4b5f843fbdfmr136176891cf.9.1757582959387;
        Thu, 11 Sep 2025 02:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKi0OXJw+fb5DMhFJMlcJiDUG4pynx0/PF3ofCRLDUToHQyWaA2C/glaZeMv0uhFDnZzulvw==
X-Received: by 2002:a05:622a:164b:b0:4b5:f27c:8617 with SMTP id d75a77b69052e-4b5f843fbdfmr136176741cf.9.1757582958891;
        Thu, 11 Sep 2025 02:29:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd60csm90074966b.62.2025.09.11.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:29:18 -0700 (PDT)
Message-ID: <30c7a7c8-ac82-4032-84f5-4a470283635e@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:29:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LdS5WR78yJk08iJ-FyWlpZNxMZ1IKzwr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX0GwS9D5QTj8P
 712rBxVK874/m9tJKMQdqIdOyVIXAwHjnhvTcl/J1Jj8fZGQDRZpDS6+COiCL/bygweUe55hvqc
 P6ekcSHGz8y+62XuDKxSgW+w6KjW8hYQhQ27f9c2xOyJREZ+7r27TAZNRJbKWfhgiRq70Flv+c5
 JClKqwkgWkaVBupt6bmSCoOyeTKBV0inK6rMYm9Fi1LZlBEUGlNae3e0DeY0YAXFNo425MCobmV
 g0DuFVAWD4wXBBpFkFQcgseH182aaw6Fu51QSKmPx3ETyNRR5g+fhKoSYaREY4YdsBe+suaAod/
 BRuUnq2wa7XPI7pvHsr0HLA0TmX3oan8DWeXVKMfBXJi4xelktUFdlJN5kpFtsW/FQm2p9611M7
 Oe6gtBf4
X-Proofpoint-GUID: LdS5WR78yJk08iJ-FyWlpZNxMZ1IKzwr
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c29670 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8550 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

