Return-Path: <linux-arm-msm+bounces-68249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2CCB1FD86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 03:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15A4C18930A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 01:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B9C247282;
	Mon, 11 Aug 2025 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mR4D7wBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A9A2594;
	Mon, 11 Aug 2025 01:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754876469; cv=none; b=ZBdEjse7JIH3+NkglcUqUFQ33+JRoIvzR6XRzr+YoBT6D4iU3rSjQhXrrGiolVyISMkCvfJFJ2Eerp/pDGGB6Q0yCIB8SRQ8aIbEekpgjQJPZ28hv+ZDv/EUuhXnhUCvMLQQqm6bhZf0PdDn2vZBw9qerGBI+5+tpC52T3DrnHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754876469; c=relaxed/simple;
	bh=aMpmyLAGd6/kSMWu63UdAdn5Vqx2f8K7tTIAh5F/b18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CupHVeM6nC2FzjQYBtKUbE27TswCYqoU0iv+E7sFcr6Hpad9ufBMKu+Aj8/jekU4dfEXFdiM7tY13Uub+itlJ5dOy9ex64NIi1efTYVkizWA8JMvZ0d9hiitj3uKH0ZJd1a6vwKIfHqIJePH6mjKIX9H75pL4kmMrWpAerDwqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mR4D7wBl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AMrBkW005062;
	Mon, 11 Aug 2025 01:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4kYYVIaYgURJG/3uxhhJMNsIpqknhcEx5A1MCpcLO8=; b=mR4D7wBlxowuCNW7
	eEqN+qu6kpyBmqqYxjjThmYkjK+ZCEcoSrRBzo1K9LCH0uwN8/GMlnacXBqXDpzm
	9DKmuM03xDkggbrYXPx33LGXnG7zXHN2EUAshNgPSoNIC/zGNo7bqBCcgq2n3b+Q
	TF2mKoxdx4//VaUHfe176Io1cqEa0Vym4t7sGVZp6tOIhCfQslw3cx8aT42pBKc3
	jEfjdkxZ7gMdf5GvRaCU1t7q9lvEv3+QGk3ADTk7cEQDKXsaeM/CW23qP2dWFMLR
	J10P0jwMNHKT+5QrSuHuy5DTAeaBdHJg96mR+ntQaL7mgJScC8o4DqstFZG4xDDY
	T2BkaA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdutr64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 01:40:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57B1euEZ010928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 01:40:56 GMT
Received: from [10.239.31.29] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 10 Aug
 2025 18:40:54 -0700
Message-ID: <03578f03-4a3b-4845-a12e-b73726b19263@quicinc.com>
Date: Mon, 11 Aug 2025 09:40:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: sc7280: Add property for sc7280
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250701084905.872519-1-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <20250701084905.872519-1-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=68994a2a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=oWUfCfD53TM6jlLAMLIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4PAmbgrApusnxPkhskVhyc-kInvX2FPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX4iScQVks+c46
 shziv3m/4xAY+XOg6MiMX7207aMbVo2nIRoLHsIi+EU6WcrgoUOTvgndltxMLhi6SY7BdslK9cc
 wp6TQQB84WbmJNmgiuWB5dbt++p7lauD6gKWjiF0WMm+kBKCcBoypJVBIKCNYYZIkMfj3on0nD8
 9RcW6YdOwjsZVpXXpc/wuKI6NF7PvQbtHAFvJv2TIFxvQc8+UKzZn4398JAo1Odekx6XqvW1srL
 +nyUMpVa8XgoIeYvsiAvM/EQQCg152886S4UTKvk+C3IM3sBqk0XZ+oFgEIPGx0bMDTNqgt3B0m
 xtPc7RdvF5n5nyRiX3t3MX52SgTgLtMWlikY+lKnsFVx7ti1ve6Pf0doLKocCTC30wGszrF8rhk
 4vtc6Xu3
X-Proofpoint-GUID: 4PAmbgrApusnxPkhskVhyc-kInvX2FPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-10_06,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

在 7/1/2025 4:49 PM, Ling Xu 写道:
> This patch series add memory region, nsessions and dma-coherent property
> for sc7280.
> Patch [v3]: https://lore.kernel.org/linux-arm-msm/20250626092952.847393-1-quic_lxu5@quicinc.com/
> 
> Changes in v4:
>   - update commit message.
> Changes in v3:
>   - Dropped dma-coherent change.
>   - Modified indentation.
> Changes in v2:
>   - Added compatible.
> 
> Ling Xu (2):
>   arm64: dts: qcom: sc7280: Add memory region for audiopd
>   arm64: dts: qcom: sc7280: Add nsessions property for adsp
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Hi, this patch has been sent out for a long time, but it has not been reviewed yet.
Could you please kindly review this patch?
-- 
Thx and BRs,
Ling Xu


