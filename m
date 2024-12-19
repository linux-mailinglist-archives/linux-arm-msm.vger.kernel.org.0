Return-Path: <linux-arm-msm+bounces-42829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0FC9F83B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCB261884B00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE801A3BDE;
	Thu, 19 Dec 2024 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyKeAmlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ED01AA1CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734634733; cv=none; b=Wi+8ci3/54R7EDyYf87aRWTBacTggsie6kGer429c+F62wAVfloqFPMfzYxieYnnU+3091yKb8bGrVlfuSkdjtAtNOnSvCanu0B8kXqa6jYjHaMt68cuz01DU7e77KPKY+gGpare9trhYZKUb0erMy/IVo2CSglZ7My6EvnTSVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734634733; c=relaxed/simple;
	bh=0GQQ6CACXbWGQJ++Plf1YtRSCnxExvybjK/rxYnKCFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcbMK1Y9JA9LZE3MRBfxucuPw18CDBbr+bA/0dXtvE3p0JDcyQu64yeR/dV8IC3SsT/iRQQswNf6tpCNGGNiI/BjiO48WFXD0Z3T+F9XsLAT48pn2JZy5uu+TBJMjI57x8E5+xk/VAVX5CtFwvXdZp5A2M2sHCKaXVgW4RBNqhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyKeAmlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBkNnV017892
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CeTwC/yZ+byFCmOG5oa941ooEpUZJLOqYQHnKzSMCZM=; b=WyKeAmlFpbg83cdb
	kMrSFqIG9q2S+nZHaFQAoBNlJdrh53aIoDv7OeDxE08ryVV+6gVBODDixmH3JXhP
	z4EOTybPEqVUdom5Z0emLHOs1AlmmCS4uY73VV+J5nvXQT/Fyxn/vS5Xxq3Kce5T
	W/iHAGSeAWORNsZlPdUiHWCxwzN5NE27T9gyAoP7eR/iW13lMhczYT0fdoW8nirK
	BAudjd5kpVNZ1GWlLPMIcqUnpK7HPbN85TGio4+MAiElwD05IVpkyUXyonZHX6/l
	ePJKsbXEUg/6sXq8vxAwyvFP86myWCC/ugWgk+dqS4xPVskJ63NLxr9CN6Tj55g6
	B53g0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjw815h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:58:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4679fb949e8so2688521cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 10:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734634730; x=1735239530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeTwC/yZ+byFCmOG5oa941ooEpUZJLOqYQHnKzSMCZM=;
        b=j+9PZa/Pnw4RF1y45wr/D2PdrVCjYGb5wEufVYISehWerOYa7GTNfZXj55UAonrKWs
         JI9hfX2AC3ykzh82TvAEyb2LUfFg9GKp1IA1jfDKpfESgSVFzB73aJYKYmuQzzFanS0z
         egXWNaKa5Eb9giPOgrE9SLnH1JBGsJTHm+cqzGP21zyABGActW4fvV+ytss0teqpg8X7
         2Q7FQ1iOYkV2Lr8AgbOJgArzObhhZOrouuRgGwuBAZjmwzQ6VIC5wuLjthwB1aAL9zHU
         L+tK5bZ//fAVJ20DutI1q4JIzEQ25RT6vUS2jSeRU5kO+Ude7xtbR9/7iiLENgen5anh
         Vt0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXf2nrxppN4ynLta4FjHbeD0JY/Ibi9I7V1SEH5sNtvCxlimwvwWWxLZjPS3pMT0uzLYlMTGTVDm/CrViQD@vger.kernel.org
X-Gm-Message-State: AOJu0YzMlI+pV7bCOSfZhT+x/Tkzzkl9aw/rLXuApvIg9NadWqF1Sbgr
	lE9YGABAqP6zIbUqNsUC/DYozw/W3myQ5E/oxH3QIcrpoBuomHa9NHW9xypIqodsgs5ygDv7h9G
	LDRZ6tEcYgDLbc3I5j5rZI3ahD4uFUI0kR4pdfSk2zuUFTtMAuzUT2ItCtBfPI316
X-Gm-Gg: ASbGnctjgVjXkSRTXoeoI5UwBoqkPOZkjhMwmRc0ZThNIdqwwHA9BawSZwpUuhO/gri
	4DjzyYu9wAojVzvCV92GN+M00LdTqlIzBI1J1fNp//APs7jJ0HyF5yQPPsS7JDUw4Gy08GJmm3h
	jOF/iPqx7WKBh+XT2gBhBBsTj69awXxx9LzQl5XjO9rqO6Ze2UYh148oMvKt4Z1lMDBWLq6uZCs
	S/+3Jdb8zvePmD/nPWiUHS7EG2xNYNig9VytF36j+aNjjiEEV7gpiOt/kbaZtkn/zKNt1ri0adO
	U0srGSVQgs5pBDhddKFb5Vk7BRZ+/fEHorE=
X-Received: by 2002:a05:622a:1997:b0:460:fe2a:2311 with SMTP id d75a77b69052e-46a4a8e82bemr546431cf.7.1734634729642;
        Thu, 19 Dec 2024 10:58:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkOiVVcHs8GB4G7ciIt0btcTggpyNfnTV2c5jvju0guowfsBxw2cvY0jBoGwjhwGmfbGkhzQ==
X-Received: by 2002:a05:622a:1997:b0:460:fe2a:2311 with SMTP id d75a77b69052e-46a4a8e82bemr546311cf.7.1734634729321;
        Thu, 19 Dec 2024 10:58:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06542fsm92339766b.176.2024.12.19.10.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:58:48 -0800 (PST)
Message-ID: <9593d71b-c6cb-418e-a956-45da276f9e23@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 19:58:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: correct gpio-ranges for QCS8300
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-6-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241219-correct_gpio_ranges-v2-6-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bs9hGxVOqZILOFWGmfMu4pHLnb6x1Pzy
X-Proofpoint-ORIG-GUID: bs9hGxVOqZILOFWGmfMu4pHLnb6x1Pzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=810
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190150

On 19.12.2024 8:59 AM, Lijuan Gao wrote:
> Correct the gpio-ranges for the QCS8300 TLMM pin controller to include
> GPIOs 0-132 and the UFS_RESET pin for primary UFS memory reset.
> 
> Fixes: 7be190e4bdd2 ("arm64: dts: qcom: add QCS8300 platform")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

