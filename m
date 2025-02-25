Return-Path: <linux-arm-msm+bounces-49312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2075A440E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485713A8995
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93329269839;
	Tue, 25 Feb 2025 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtvwuQgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280D24EF92
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490248; cv=none; b=qIFNMP7YPBjrzlYGLczJnt5gMd2b4vHIyyxgiOJROZ38F2M1tE6HqRJtJshy2IszKHHdfbSc/C80ob/eAkWG2vdMd6YDg2gtv1K8tysY0zAKvlFjQNo622M6sxbNWMdlSrvSK4B4C57GghUbcYbrKH6+zC+iUZ0Yifps6rTaK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490248; c=relaxed/simple;
	bh=wuAI4vGUijPnTtk+36Nugk8Q7ab8WJXds5NIWN/WtzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8NdFuM+Jh8aUOgn2Tdq6Q1Xsac1N8JrEU4TLO9kTvT4YR5iQvwX4UShcEV5YLiO2AIncNy/LZGmv8RUQ4CwyENFTd1lHOwFgbCCY7sgICX97OzQHBfrFxgqkpj9zWu4yrXl1TKH4uXoYbHnvpnQ0Mu4UA8DNPAFnts/55RyWkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtvwuQgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8RiJJ020077
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bc2n7N6LrsSsfLdU3/CSzOVYKaVednS4e8P74t418mI=; b=WtvwuQgZGtD64t41
	mgEe4Tqxw7EW+UyAISwxO0LXyEOLQG5xtf+9F6+xkYBeY6idvcooff0a3abOENmt
	deyGZ+hdIInNWPx8bljVYuJnRx+kk6nn504F2cYtB48X60cxeo4XMOtZLA+Ttm1I
	R6JaLz84dpH4ANeZzgOdr4JSpWNQZj7XSsuJuQaFoavAQWx1przf6Er+h4v8Q5wK
	Sre9sEx0JwQN4t2S0Hmi1WgsvOOu/w+os5RYn0ZIoFz05jCJ5s54odgy1gN6uXXD
	UH2PkyYp0BiVCXwrpRIdxm2oOWqUhh0nuZMpmR5Xj0v78O6oTEm+sLeTNJ3pXu0p
	S76wjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2ruhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:30:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e65eae5a26so8616676d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 05:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490245; x=1741095045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc2n7N6LrsSsfLdU3/CSzOVYKaVednS4e8P74t418mI=;
        b=M8h8SYn7mJu8Ky3CJJCJBbazSvlrnmFYu1e88HP3eXfkgmRuLKWgaONHkWP9munMhL
         o+1r+r4Qyo6CsqrPRV9vDFBh0H1qjhZhtCTSVnU3IS3AwjjNkjjiUl9OI4eifdY0Wwn/
         cWaVHIcFfJAo3YjVnfZxb8GkX2ZVzkfhjAiFCPb/hn3savc4DgQseeprICJWDmeIrkAq
         tqMOhDGYPomunNtepJEWbYQo/xUfp1IfbwsFdNkGKfMhGzJO34/KdZjRnhzvQCVgmvjE
         jBnkRI8iihUzgEB1qgKXi3/6YoIdmiYGWyUTTboNiIefyoX4dtsbx9VVHPStjDOkVYgj
         orZw==
X-Gm-Message-State: AOJu0YzE4eSoX5wwO1He2wrJI+aEzs8J/M7kLtfb8DtSvqjDP2Ei+Hci
	sGGHYYF1SVaR/PuUwOYHnX2TvO0zYO0lQgEvIoSAeqFQLFOAPBiserZCzZGRn12DZhWlM/mEe+1
	UdwbdClf2ZIAkjVAcyLf7GOoKHPncLzi2xpEuOZkmSuI4qE3zV4u5o5CG0Dgpj+tC
X-Gm-Gg: ASbGnctzTmiqzGnWkL9v1HgFi5vGKCngl0Bu20rgQs5n7fHc+J2G2oAJ1xLEPAQ+uff
	7ZY0k26+4v6FC462JCHPi21tGSgT1ky9YwvpZ9sSd7LfHzN9evJwqNk+xlsTzUYVR4ip7qIJQUP
	SDFwD2gHQSnSlvkqwc/UlfJCI1RkWEyv9/lPIicM2zW8iGkwKrF8vGj1Ppeax7T2ska1r5HpdN1
	1IMMXwAeCdDipMB8yx5lEchyKWhH/2qa50LCG2/hTlFMAR1NwyXIIgwBdKWLGzwdIF/sHdms3ZA
	j9TMmI8K4L2HbX+hX8IUlxREXxEpwFaw2USSXzW9YLT6BpZx4tCyBJ/PntnFMjrfiXHwJA==
X-Received: by 2002:a05:6214:c4b:b0:6e4:3caf:c9aa with SMTP id 6a1803df08f44-6e6ae80129amr87622506d6.3.1740490244848;
        Tue, 25 Feb 2025 05:30:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlvs30Bcej2ehUoX5uYBPU/0u/U41vnUBagzU9ehas+iea8IpGY9brXOMrEMFxTREYhyjkBg==
X-Received: by 2002:a05:6214:c4b:b0:6e4:3caf:c9aa with SMTP id 6a1803df08f44-6e6ae80129amr87621916d6.3.1740490243814;
        Tue, 25 Feb 2025 05:30:43 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2054d7esm141970366b.136.2025.02.25.05.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:30:43 -0800 (PST)
Message-ID: <b81fb350-f680-4e50-8cab-89c93f733bfc@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 14:30:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sm8650: add OSM L3 node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250211-topic-sm8650-ddr-bw-scaling-v2-0-a0c950540e68@linaro.org>
 <20250211-topic-sm8650-ddr-bw-scaling-v2-1-a0c950540e68@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211-topic-sm8650-ddr-bw-scaling-v2-1-a0c950540e68@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DvIsuSd8kT_H9lp9qe0dJCa7b7VsIb-I
X-Proofpoint-GUID: DvIsuSd8kT_H9lp9qe0dJCa7b7VsIb-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=790 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250092

On 11.02.2025 1:56 PM, Neil Armstrong wrote:
> Add the OSC L3 Cache controller node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

