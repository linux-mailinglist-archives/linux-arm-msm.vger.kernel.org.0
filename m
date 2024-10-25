Return-Path: <linux-arm-msm+bounces-35976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7007F9B1201
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 23:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08A21B2187D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1621D4328;
	Fri, 25 Oct 2024 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBJrvLIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE07217F4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 21:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729893192; cv=none; b=dfxzMtdM//HrYvZc1yuI+rQkrqCFWcJB34iIWiKoT2p7uxVyHoy3l9zPeRlLf1rkNhi9uMyYfMPwzDNR+EE0FUJtliwWicEGG8xIq8F9vvYjJ+MTDgsqFl8VoAmJQNb8zZix6/exCk8E6igeueJjV9GSEphRKHbp6R+MqSj/LRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729893192; c=relaxed/simple;
	bh=6GeOWhrjGYCL982yNJxHpDEKNaEsIOQVVRx6HDGXoy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bFZX+RNdYKwsY4rjFB1RUnRb/5/LKzAQWOTZEkZyxz/sGJeDFE+qrE2bmekrqIFp3/P2T+/iQQbnNtZFUXFC2Tns/xQ64EE9rGiLFLzzWVobpvzSQbESPEV/tlh78qckprHZrJWcDxg9wRdjpFcBvTwruT4ZTTP2R1nQKTwjT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBJrvLIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PAEEWH029449
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 21:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GeOWhrjGYCL982yNJxHpDEKNaEsIOQVVRx6HDGXoy8=; b=LBJrvLIPQTOZFtHh
	4hNeIqNAHQljwDqMckAz+j9xzXbFhzs6+Ak+hcga1GzDYihTW6GgQZVwkywHM7M+
	nDn/cPRGIxm5/yWo1T3AmOwPxiGeChnR40h94NiVlRIjqPyD/icXniRsRCuaJXQO
	a4nwrOIqHJYH/DQyK8U4km7EEkqfYwC6A8x9F1ZH5U8cK34waeduC1Q5wAxR126E
	vtZ+r4vTsVnf0c+V09jyS68THiCzNyr3GCSbE32509KGdbTltxuL9iwleH3IlZkX
	NjRsSuiP1zeKt0wmSCsjiGcq1uDn07RsJoid/pejxkNaL7RkS+6HXwPuEiQd+Q3X
	/UWiIA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wadty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 21:53:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe993f230so7696226d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 14:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729893188; x=1730497988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GeOWhrjGYCL982yNJxHpDEKNaEsIOQVVRx6HDGXoy8=;
        b=Biq6JAQT8knM1q/ftV/y/jNxNJQMQwLsHxGo0M0Qlt0zlOYtKgK0KowiQLBVJvlr+O
         CKMjSvBpNPDEjfIedBY/7rY/oFXjQQdpMjvmgqneLrULo74m8g5qAcRUzlCqUQiw39ok
         b0r1ZYv31bAxgFRWqR0lLKVcKZwLyjGNyUpJGV5cib78koaJmU3SssHLT2tpwnIpkvni
         ixTeD2XTQI8348MpgLo/mtQK8K19QbJYK1OW32CHfAnzjTti9BGVLM7+gjTa0PIPbY5U
         ujvkCgObGDOCo3H8Tkkyl7uH7dfwQbqeoygTYyuZqGYp7RgGQ2JolDM9NYjYfTLkpjB5
         mwZA==
X-Forwarded-Encrypted: i=1; AJvYcCWJsgYPtwquaIruAb/gKLcJeJ8xyMSzoYhi1FqLn0ThxrreukgNL0uh/HOhPwj9grZGb+Xvl3Gas7hqyx3I@vger.kernel.org
X-Gm-Message-State: AOJu0YxAshcCv/HuktT8WD3feSzPMR+O4qfYlxj3dA3fwetYKkmtxpvT
	2cTryZKdWRds/i24X4F0F5d6cSUWOx0HVLCDETB9qFK6WX/XL4GvFyET0W5nuchbuQK13nmeO42
	Ta43IA4iJ7cbYaUEe+y+vrumE7t8RM1UOS/ZhyQ9sgnSRHh/F/PQ6N02geptzy78N
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id 6a1803df08f44-6d185885e9fmr6384146d6.10.1729893188121;
        Fri, 25 Oct 2024 14:53:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEslwHHx6dighOzv1/9OBtgqY0Tn3FagIVg8QIn1ToYUExPrzN5qxZ9a8b/HkXDPpIXqYsBHA==
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id 6a1803df08f44-6d185885e9fmr6384016d6.10.1729893187795;
        Fri, 25 Oct 2024 14:53:07 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f29744esm110069366b.130.2024.10.25.14.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 14:53:07 -0700 (PDT)
Message-ID: <2cf6ca44-3a7c-4561-91db-5493414d61ec@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 23:53:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8550: correct MDSS interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        stable@kernel.org
References: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
 <20241008-fix-sm8x50-mdp-icc-v1-1-77ffd361b8de@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241008-fix-sm8x50-mdp-icc-v1-1-77ffd361b8de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e4kykH62xu_qbnU93eJd2wF3xOxd4STs
X-Proofpoint-GUID: e4kykH62xu_qbnU93eJd2wF3xOxd4STs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=746
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250169

On 8.10.2024 1:36 AM, Dmitry Baryshkov wrote:
> SM8550 lists two interconnects for the display subsystem, mdp0-mem
> (between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
> The second interconnect is a misuse. mdpN-mem paths should be used for
> several outboud MDP interconnects rather than the path between LLCC and
> memory. This kind of misuse can result in bandwidth underflows, possibly
> degradating picture quality as the required memory bandwidth is divided

degrading

> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).

I think it's just for power savings, but maybe Abhinav would know
better

Konrad

