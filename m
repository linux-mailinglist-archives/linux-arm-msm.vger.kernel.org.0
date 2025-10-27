Return-Path: <linux-arm-msm+bounces-78839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75947C0B961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 02:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 344284E869B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 01:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD07E24111D;
	Mon, 27 Oct 2025 01:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGo1ncHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8023BD17
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761527747; cv=none; b=B9+hPSE1CZMq/tDN0nc968k656Qai0ZY8TI5QYn2uy96LfHs8MTyGj30XJ9havpGxDW4lct6S+pbtgRkUpHZ4ZnWalOBppKObOCoVLIP4ZFyp+XnLRBA38ShhkyAVSpS6SqdO2oOHdttU49TqI2V3Nwwx1FwIVCo9Cjd4mWxsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761527747; c=relaxed/simple;
	bh=t93Yp8RmSB0G1hSO4EL81AtKN9KA+9xMA+XdWUMYetE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LY8OdYjUC59I/hutpVYNlbRAThQvUKDzto5J1LWWfQOrgmn0iyuca6For2CRAb5R8WPu+ohtHf+Xt3bNLV18rEgh1hEDch5AO3Gb4qYM6hGv2Ai7K6AcEt/1oCGTLKad3exguDuYgxpeVQ0Gj+/gnmlk7b+5QTgU62lNAlosssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGo1ncHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QLrenE859086
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q+7a7BdSUX1H4XYC5sftPvUND0oWh/62HBMHDzpCxI4=; b=iGo1ncHIQF3TKNPv
	+ru2TcdU/qQ8oHm/ajlDPxfKBc8QB9mWMKotQ1skrldzEVH+G6Mykk+HqSC6cQtp
	Kv4Mko9pN3cZduZ/jEWAQ18vkpWA2lVizoz9Hjs5fApu/DRRY5Lnsn1Xs7TFk/Uo
	DT89urDTRXH6CmBuvsLPgtPjRsrMoqi33/49LbWLhpy9EY6Xsy/cwSqYeYeH9P/H
	eu+KoYXltw0bLi9GrY9Z7+gfAYC44DgoHfsX74i5ZFBoQruwp9ErukByfsWRAKMe
	IHLws87FHva2+sTfSKgP1wto2sSZqOqwiyicsv4HzfqaTQBaxcUMg3NLrxYyd0X/
	7XMNIA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0pmqjsyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 01:15:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6cf50cbd2cso2857751a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 18:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527744; x=1762132544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+7a7BdSUX1H4XYC5sftPvUND0oWh/62HBMHDzpCxI4=;
        b=W1uYvFm/dPPMTJRs2AvXnLpU87J/p1krbasFaQfWFi4csa4B83hunrcq9KGe2Wy+Gv
         BppuSThZdm4Vw5fE0XGsjz0C2jXW2ONA/6Q7pwTmYBfxoOQESVRhnA27cTR9kF9n/Azs
         2Pgshg5eR0BfRkmbLtUoU9eoOutHH1yg9+gWCDCs65Y6PILIJQJHU9q9mtxh6pa8wW/I
         sXXLg8P3uLH6rcCJiPvqnFy0V08bzr2rm0aZHktNdQwi3hu/UW9cr+NzbdxCno/vLr+J
         wLokF/W2eS798n+smJz7SRPz58MNkIJKHq+Oev7eYw2/hRVvWShwXpnSk6uhWCX5FXmG
         NCFw==
X-Gm-Message-State: AOJu0Ywa70jU7CtbcainWAHCyQm/v/sVUztsTFLcprW1xlEunMGWVF+F
	l8e8qPxxF4tvctqZVFjVVVzAnQNnQQAw4i941ISa12igorWljzff0LCz43rgxhpjAJrhZW/TF8y
	VLIChquWldrxqy/M6yCPoI5SBKaGtmvxFiVdBlKDP3c8KTpLJzFXjq+9CcIACye0j7SJ4
X-Gm-Gg: ASbGnctNlVmuw6uNm4WMH0NlAgV3c95Zxrg3N13xsaVbgb53anLE137WxDdXdsKZGZa
	ks7LKJpEEHjFIH0+zJmj07VQJxx7GO/TFnzo1XrJNZbXI+Mk1OBUpzKcbpr4XSG5uBOKhE4+sRG
	RBPxQdHJWPrBlHL8zRAUNLDmvgOfCGZ/Kqe7OS3P1hSatCSPGtrHcfGLXX/2TcGwffDFdeNhROq
	KvGgCRbBRditvNRXLmRb/ElBGa3ucRF5yKjIdasJXme3trRI+cBEHkoHe9gy3GzU0vK/SCjkACr
	dCLN+e8KtzjXRSdOHOvAR6OVcqC83UfsRhB4Lks6v74mqRfviEdlEhMnd4XSroqYPIYCihZxA+a
	eDYmJFcwBrUaZl+XIVsNiagjPwCumky/SZKyba/wGits+TZyoDg6TvUxWLx2wLf7i
X-Received: by 2002:a05:6a20:918c:b0:334:9bbd:39c7 with SMTP id adf61e73a8af0-33deb36ec75mr12023896637.51.1761527743997;
        Sun, 26 Oct 2025 18:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvB8qqyzh0X9NyroUn58B+zjJ+gl/No1zjTrW0lEw1jH8sE1qhiGkm3tGhFUWui+5c86exCw==
X-Received: by 2002:a05:6a20:918c:b0:334:9bbd:39c7 with SMTP id adf61e73a8af0-33deb36ec75mr12023852637.51.1761527743538;
        Sun, 26 Oct 2025 18:15:43 -0700 (PDT)
Received: from [10.133.33.212] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm6220585b3a.1.2025.10.26.18.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:15:43 -0700 (PDT)
Message-ID: <bcaffc33-851c-4b73-add3-affe864414ed@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 09:15:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Enable CTCU device for QCS8300
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VxwiT7Wq5wN7ztpFRX4RozRmAdpbva2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAwOSBTYWx0ZWRfX9dlDfsZ+dtdw
 RZUXeQ6u4lXDXhehc2z8myZUPKa4bsyfbVKDvya8GjTRqJHzjS9Z7kBPYgJP6p41INmKZYwSxmf
 Fz7ZFvnXRpPii2HFJ9y4uA3faxtDEK0voJfGi7nmGH2XcJWX/60d998PX+4DsmR18+pydt+3l+J
 vbDi9kWIWLctz++clSgYtScmF8hqS6v4XJEwD5S2zVuKOXN1VQnJDzRxG/OXgMzGkh9cdnXERDr
 unRCUvJChFq5XT4i9wIZqxNMUAWKHgo0fkha4YCkCeXdLesazAuQ9R82vMMeDYsW+ncLLWNcodz
 G2nsk3ag5QeJVcgSmpoWmQjnvu5wcRNURnftYvWfdAS+Y1Rk8WKXAx3W+IxFPCCKbru3KS+mT+d
 LfpoGSVhyQJAi5Nvv7cO/PyBjuU3Hg==
X-Authority-Analysis: v=2.4 cv=Vf76/Vp9 c=1 sm=1 tr=0 ts=68fec7c0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fSwdLtKwHKkDrnzOdDIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: VxwiT7Wq5wN7ztpFRX4RozRmAdpbva2s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270009



On 10/13/2025 4:34 PM, Jie Gan wrote:
> Hi Suzuki, Mike, James, Rob
> 
> Can you please help to review the dt patches? The dt maintainer needs
> your comment before apply this patch series.
> 
> Thanks a lot
> 

Gentle reminder.

Thanks
Jie

> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.
> 
> Changes in V3:
> 1. rebased on tag next-20251010
> Link to V2 - https://lore.kernel.org/all/20250624095905.7609-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Add Krzysztof's R-B tag for dt-binding patch.
> 2. Add Konrad's Acked-by tag for dt patch.
> 3. Rebased on tag next-20250623.
> 4. Missed email addresses for coresight's maintainers in V1, loop them.
> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (2):
>        dt-bindings: arm: add CTCU device for QCS8300
>        arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> 
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |   9 +-
>   arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 153 +++++++++++++++++++++
>   2 files changed, 160 insertions(+), 2 deletions(-)
> ---
> base-commit: 2b763d4652393c90eaa771a5164502ec9dd965ae
> change-id: 20251013-enable-ctcu-for-qcs8300-ec83661e5acd
> 
> Best regards,


