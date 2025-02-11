Return-Path: <linux-arm-msm+bounces-47591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C3BA30D10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55FE21605C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF11220698;
	Tue, 11 Feb 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXNDTq8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5C1FAC4A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280899; cv=none; b=o+l/e4d27DwJMybg7lyR6uPi9mFJO64U7mlMfiDw+cz/r8gg9SG8okwMnNQOEfOCy5eD/i1DSuoJq27SPyPp/xkXuRLtmLIPopV38YVugT+xDzGz7QHE+TW1j4/i+Om50JGGs+crX4GChBCJKBiTn/7hKD9ffaEulezgHbeUyZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280899; c=relaxed/simple;
	bh=jDmOTyojiikoo0IfvxOxgpPziU5nD3zAgqiOBfyXwxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFC36KstnlhGoSiE4/c917od2IE2T4hw11mabbdnY9Y6vCYtgrkxolJHUp41nGqgv2NkmagMGNvqoQorSTJjFgVC75zCwqovuiz36mCIrFi5GsY5x4zHn9qq7PWZPUaG9nMpl3YPf5lltkEjeDjYTKB0E2ZJzTCGtqPVEvKxXQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXNDTq8S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8k1V6001652
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdqMkX2dIK2G48mSPcv21J8TMTmaplncAXlkvHMiqFc=; b=CXNDTq8S4z/ICNkV
	9BhjoeNMBsN4hKDX4h7bjR92q3iXRA8J6SJ7MsjBgw2nG1/MR56x1GnEz8T3FUUu
	81ildL0d6sLAzdTqlsSSWHwMd+RzVMBwweqMc9hHzHxvaPqKMauJKtRDzN/pIawL
	jrj30mYUYlZeNFVh2UvQB7JELLL1V5F+pI63DqqQ/miv2za64mblpgRklYid8GRP
	I+HPWX+FfQ7BH4/Ydzsyzd8yvmOxSKG2qIuW9arnLWb+nktX4MVthDAjs293YETi
	vZhfjs6lPDGBnMXmjrPDQJuY6gzzneeFtF3V5PaDwRUQn/OaFm9ip/UPejZd8YcX
	guBTcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxm6dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 13:34:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4718a18521fso4122701cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 05:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280896; x=1739885696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdqMkX2dIK2G48mSPcv21J8TMTmaplncAXlkvHMiqFc=;
        b=A1D2ccFAn0MEhFDDF5JhsCM017ls9lMrKkpHn6wTitLRjWPY7RbYzxzHiH6IC5xBL2
         FlRFJSyF6vzOqGS/chDv3V1NNWUllJaGb5zbvd4vNIBD+bBut+ZZeGoikRFeKreyKueO
         H2lcVueTt5YluLzNCmWJq32FwrlTAGK+wCHrUDnaQn5hE214rpFxhGnKDJL7Apeq0VMd
         IwU6rQDyAs1m8FS7XAvQmYwJBuHhIdhsV38ncsLRoSUtKk+1rLsz5xQZnLsIFzMLbvbh
         qNrZc3MazGkYt8h8TppK1jtqG4Zz2TzEqcEkUvBLT9MRt78TDLQ3QBXqGkQy8U9WW7mS
         U+ug==
X-Gm-Message-State: AOJu0YyrE7NR4dLJTCPXjT7qj6YBiCna5C6rVhIDDCqoX92JY1D2XL5e
	m4pZwDsGYvsSr6JpWjtgPdVuuCthB0BG85WbqssPrScc2aei+UCIYqlGfQ691hJkd8YF/ksWGeD
	xiu/nCGMX7Z/ohrenciJXq1x92a5yiQ3T8+ArP4DRCWRKjU5eClvaiI/WC5b1ptjI
X-Gm-Gg: ASbGnct7uoQOP9Qub3xq3jKytIyKQ62jqera0gb88tE1rPMitcplHLKeCJZv63Ptatd
	Ie4D0SaIhq5Y7/VcAqKClaAbgAPWUG74vEDkiKMSIrsmwdKe9jAlbxujvdbdyFPS3QXvhHVvzob
	OpmbkluCuuKMEIxZbgsM7v+u39CoYTfpeNB9fRZZAYM6RIE3tC3MobBt+Hom6JsusZ8Txvximk0
	usMLXv1IsYubn7XLFQI3MdjNDdwlPDvivV6VAMwUG9vwe2rpAivfatyBiqoilpT1wGu2zMXlVwI
	tk0/05lFMICfGrmOgt9mgHTmVH273sah7pGJ+q0PdRSuldUsLnf8+OR2FbY=
X-Received: by 2002:a05:622a:1cc4:b0:471:9813:11da with SMTP id d75a77b69052e-47198131362mr34622111cf.2.1739280896126;
        Tue, 11 Feb 2025 05:34:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4p3W/WqcNZ9kEltf2wq42jRqj2H0gTl/tRoIEU90x/Lb7PwVN+UzDtYa9Y78eR/nsuib4Bg==
X-Received: by 2002:a05:622a:1cc4:b0:471:9813:11da with SMTP id d75a77b69052e-47198131362mr34621961cf.2.1739280895804;
        Tue, 11 Feb 2025 05:34:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bca07294sm457847466b.68.2025.02.11.05.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:34:55 -0800 (PST)
Message-ID: <88e76385-c914-44a2-847b-09013cf4e752@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 14:34:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sm8650: harmonize all
 unregulated thermal trip points
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
 <20250203-topic-sm8650-thermal-cpu-idle-v4-3-65e35f307301@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250203-topic-sm8650-thermal-cpu-idle-v4-3-65e35f307301@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w6z8t11-kMaENSPiTLw3ce0LNNPmmSmB
X-Proofpoint-ORIG-GUID: w6z8t11-kMaENSPiTLw3ce0LNNPmmSmB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110089

On 3.02.2025 2:23 PM, Neil Armstrong wrote:
> While the CPUs thermal is handled by the LMH, and GPU has a passive
> cooldowm via the HLOS DCVS, all the other thermal blocks only have
> hot and critical and no passive/active trip points.
> 
> Passive or active thermal management for those blocks should
> be either defined if somehow we can express those in DT or
> in the board definition if there's an active cooling device
> available.
> 
> The tsens MAX_THRESHOLD is set to 120C on those platforms, so set
> the hot to 110C to leave a chance to HLOS to react and critical to
> 115C to avoid the monitor thermal shutdown.
> 
> In the case a passive or active cooling device would be
> available, the downstream reference implementation uses
> the 95C "tj" trip point, as we already use for the
> gpuss thermal blocks.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

