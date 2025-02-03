Return-Path: <linux-arm-msm+bounces-46758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F57A25B6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADD641888530
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EF5205E0C;
	Mon,  3 Feb 2025 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FrQQsG/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC92063E4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590734; cv=none; b=sWyReJA5DCkHJWO2gTckjGJbfNF+eU+DNuF6zcJXFloYsl96FrIo1tFOAxLxSKzvSDq4AjJhvnPsH2S0K0f3njSZlbWg/vX/bHR/sdNgmd1Eg6ARe7d16zwC84oFYlnL9kJ/hN+zc6Caf2QwXoPDZhnwIsxrcoYnQzRDu8SonIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590734; c=relaxed/simple;
	bh=0DrWhNzMf72SyAS5mlgolmfKR43YKw+/djS366mUj3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVi44e8IarZABRZrQutI10GQ4a9TEDxyL1ElLiSuC1JoNl9ffGRf9er+2U3OiYyBKxBoR7ctu+lePkO79VJBF7lbQFwJ6vDyk1uT7KcpwKGRRNokFeg7U8WtcJTz8JPkpV9m00pIBgTqn+s8bL4Fih0WbYk2wXzZNX/vVSqIk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FrQQsG/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BUPFB003806
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=; b=FrQQsG/izShyy9H9
	1UTtnmuTDFZtS8bqaCaxbx3HQPCRNeZ5KMcOAMKF+tpJWNfTyFLTuX/lDRPiqxjo
	iWjdCjXeSi12T9ZrDkHatJznA3miLC8aKRFYF5SRCe6HzRuPAu4wq6dJx+m9kT1F
	OD3ISQ8GWUFwenWUSjZTLI4mTtdbx5yXefbt0dq2qsl5PyeaYMmt1qcvC1xa1GsE
	01c29dcq0uHpPbtu1eC+cTUmuK/K2EyLkLb/uIjC3M6NUKlbFAnaw2whVDxBasOB
	m3aCPRq0pbxrKKeR6ah3xjhXe29PCzj8WIBTb6/Bdw+y6qOLsTBJ/HrSe34TfAo8
	Twgb5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jw03ggb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:52:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-468f80bc8fdso2666481cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590731; x=1739195531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=;
        b=evMk4kjfviotxUwSEG/gbVQGW9w4++tA7GufGixwO2lqpy0zuwmP6mNEfOTkd0ZZPM
         wsdeEULrXuTSD0P6Wmssv+ibnOTaKgoGzzcDo1/BcXyKego2Nj+yv0bQEIecXMTJosM7
         axUCmXCJUCz2Rt4nt+Insv1ThjJbN2BlG6ctvQbDKud+oWrkRPye7Yd/Sg9nzlVFhckI
         dgF2FP+u1nJKWhDdg7WBVWELmJbycKCiKIb15+fUpDhz5asN2BXwrxHdDCp5qcoAUhsF
         HpLjxI46tZYsT8Y4zZ2yAfZ49I33paAyvrDUeItXaw3hk7BCxcc9vUbznXpLgxHfli0B
         fC+A==
X-Forwarded-Encrypted: i=1; AJvYcCU2/al/CPjP6KknjylWHra/j9JjpGAnb6KBGeKlDXXbOoWSDIVg2jWdpmIPVLmWzl1Um4PIv8BRKMjF17IZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxecSahVB24eIF7f35hJSdroh31BSl72GP1eIlp54hazDTzAn3a
	qldmHLPo4z8RL0EZNG+o9CJ4gImReGXXz8Dk5slEjXs17bA7oRwNC4lLHQwd4TsT/ivTPofnqnw
	JCE2kv9KMc0CGeqTWnWfgO97oiJV8Y0nZ7Yux0v5WeJHjC9omp+yRladhYysejgT9
X-Gm-Gg: ASbGncs43TB8AhMMwFfzBmQn/yjSDTRJU8Ig+KI9BPkV7HA9lbO5shm1VY5tPj3mnn7
	zn6BlnIFXYgs5LE8bZV1lSWRYoYbkr3TWBIuT8AKhYuGRYbu8OZuK4iDbhdjRDdVjJkVA/vwEkg
	W+/jd5/v/RFxCqVxT3YppjzSDWofrWGCBeiXkhIKva3rayabNxwRyuQZspGeMXM1qqtFXqfcQiV
	8LXmMlHj8UTQLRUBFqnR845tGHRTk3E46sXLMduotxtXypx8bCnZNLMuhLocs+ABZqNQRNrAdUE
	XR+5wXv2SvOYnRUQ0JrJ1lC/cr1eJ+agk0z7Qimxg5NUxPG66ap2ECkkjus=
X-Received: by 2002:a05:620a:254b:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7bffcd0a31bmr1196151285a.8.1738590730964;
        Mon, 03 Feb 2025 05:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt9A1Ywm1nPEK63UqBS+e6UYwlx6nzIpdhoFy2TYlNeJUUhk8BGO1TQBd333vNW/v3P8zaqw==
X-Received: by 2002:a05:620a:254b:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7bffcd0a31bmr1196142185a.8.1738590729156;
        Mon, 03 Feb 2025 05:52:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724aa0a8sm7559984a12.55.2025.02.03.05.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:52:08 -0800 (PST)
Message-ID: <21b4813e-b5c1-40d7-b536-3fe65a53affe@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YeVvghRAZJ48djXYFvksbMCtuHy2LptL
X-Proofpoint-ORIG-GUID: YeVvghRAZJ48djXYFvksbMCtuHy2LptL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=731 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030102

On 21.01.2025 8:54 AM, Yijie Yang wrote:
> Enable the ethernet node, add the phy node and pinctrl for ethernet. This
> change is necessary to support ethernet functionality on this board.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

