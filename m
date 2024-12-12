Return-Path: <linux-arm-msm+bounces-41840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F19EFBE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93CB016BCC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC8C1DA60F;
	Thu, 12 Dec 2024 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2WpEYE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929EA1D9592
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734029737; cv=none; b=gy27Yl1dT14uraTd2VCuiGktYDIjZjbHbfq4M8Lwact8mwBakHdmb+b99Pp2Y409RC5JWY/CX46x/Bd5/L0Y5IqpPmbDT8X+4oQ0pvpL7jCzKZ4lL8kzE5P2N3knnpFDGWLtG7PybDN4UFrxyZEp8n5bQ1t+AdTCDM+SurziCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734029737; c=relaxed/simple;
	bh=6Ykd4LXZc/kByKynylSQh3A2HAOdlX7jGwrQ/D7Gu/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP28WqYRK9+iW7ZdzbGKz10/GckpPUARCAnPqd1cPjBjGzi+8ku3HrePkvG9sN0R7PLgYI+UygmKekQkylUnkhNG/pYIPGAN2vafgsliN8TCEilDVeaJ6otYP4DI0sQxAY/zKv9m/1zR+MKUe0DEwl35CPh3yfnzMGGXfxFCYhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2WpEYE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCH1Cck032195
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zI72/iwp++JOMDiSSOOOuPR56P6EMEm6GaLozzp9c4A=; b=a2WpEYE0cl20+RAf
	UXqg25+GsO49TBrUKDH+nX8dRa7DGQTlPf0La7TqVs7JyH96aLu+jl+OOfmIZ3Ea
	nsanIhGMZYGORwwA+vf5BilmoXXabtttelPCuHMGX/osVsabHCwYTCko0S+8ono2
	oa4TSVow2l1kRK54HsDpFla5MIa9pBhjByzhlIFGMt2UEpznVDxQ0+g5SJEJaiID
	ujNpK02FrT64efJR9shiKIxnc6NGhZp60qatxwEJ+CAf7l7oFwTlY3paJ5K9ec84
	I6OBDFS12HrdUhYMuaLoPx3MGcle+Em82ZN8Y2djkEMGGHLw5uVhZHY42ifRHpJH
	JnRQTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfd766-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 18:55:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8a3cb9dbfso2191896d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 10:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734029733; x=1734634533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zI72/iwp++JOMDiSSOOOuPR56P6EMEm6GaLozzp9c4A=;
        b=fB0lIxWGhmD0e2/KwLnrsd/mqFGt6VBhP0cnLMnMzjp57J4XU2mK3a342cGX3krB3X
         VFoYQJFQzJM+T9GXo/aTmDd9Lh2MeHeoWXyprc+3RL5ucreu2Hj6eBHkYUKYd438hfff
         svQEmqSZ8CanbhaajWoxIDImvctFELArM81urQy0LSQGsei8KCBee6aIA3wsmJhuLJHT
         sWg0iC6loWgSUGdes8iC7KWgNV01qJpcEcFt2sgm4u3YBp5jcnc2n15Lb3bK2czMTDZU
         q7ldxXtgZ6UvFDCtIn5VpnuzSQUSjJNEMb37RymPhp/lx6VF0QmpGOazhcOtmTOiqI+1
         QFfQ==
X-Gm-Message-State: AOJu0YyfEfnNyIap8W0JMCTpWfHFSsj9Q/8jSFQSmlGnF5m/3bqfrWZD
	7bpkOmcdRS+DEwGWt77+hAwuWWgUYbtap+CHgfOGyF49daa9YEz8De1fkDzvfdhAOQOFmeEn83h
	ZLKLFecEMbgoQXhW49N2M8swKvHKlNXvH3Hvx5i6iZ7J7nb5IveYwTrzFljpvc8im
X-Gm-Gg: ASbGncvcsovpw9PdHQH7Sw6CI0U3X1BWgrVwSZPOpqPpXnRdayPuxa6mA55VEorzeFL
	S/PeDBMY3OJ5io7OUynIgAEtTMzO04Duz6e2U0WINZ2PyeWakpIMQCIpbcohBBBaTR+Aw0h0ufn
	JXWGE8v4VpamC2GnyZqDmQTiu4aUvTKHIJXIhQ9JBOk1D0Qk0kdFvB9Gu6PmMqLG96tSNpAsPyo
	KDj8n1vdmNkK7bLQtOFg+Xf3qW6qrw3py77bFiOxaXxEtwGjcuj8eCWp1osnMt8/rFcHlECzeWM
	9dhR9Kb+6PE/DvWf1pCbol8MPIQeXGcs55RzLA==
X-Received: by 2002:ac8:5d0b:0:b0:467:5462:4a14 with SMTP id d75a77b69052e-467a13bcb81mr9719121cf.0.1734029733539;
        Thu, 12 Dec 2024 10:55:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh+6GqlSEppTRVHfwFh6/LFI4/HjserV6YHyLGu2Tmb1xxtvWO18Oqsh69zRHwYho2dvwIyw==
X-Received: by 2002:ac8:5d0b:0:b0:467:5462:4a14 with SMTP id d75a77b69052e-467a13bcb81mr9718891cf.0.1734029733124;
        Thu, 12 Dec 2024 10:55:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa653a95e90sm836436566b.173.2024.12.12.10.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:55:32 -0800 (PST)
Message-ID: <5cbcb8a5-f39b-4416-8317-15d56f932915@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 19:55:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/19] arm64: dts: qcom: sm6350: Fix MPSS memory length
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
 <20241209-dts-qcom-cdsp-mpss-base-address-v2-16-d85a3bd5cced@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-16-d85a3bd5cced@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: caG1qDpSt2dgsmQ77Lph1FlBjtVRHxQv
X-Proofpoint-ORIG-GUID: caG1qDpSt2dgsmQ77Lph1FlBjtVRHxQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=911 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120136

On 9.12.2024 12:02 PM, Krzysztof Kozlowski wrote:
> The address space in MPSS/Modem PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x4040 was
> copied from older DTS, but it grew since then.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Cc: stable@vger.kernel.org
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

