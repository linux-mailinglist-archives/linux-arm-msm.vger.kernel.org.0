Return-Path: <linux-arm-msm+bounces-39090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A793F9D8599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 13:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1142894F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0181A4F21;
	Mon, 25 Nov 2024 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQ46rnD0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB5188015
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732538838; cv=none; b=Khfwj1E5D34aHi7AYy8g5Kf9kBQVSFUGMTslUpXR+/uedyrx2K4h6RnazJdS7+alNO1ivm/Y4qYu5tSuRHPxqzJfOOEEFFbgrffNxry9yyg+rnST2vAit4K2sCbz/XqMYsJ6tGeWtnIcUEskbaQ9B4VPCEaW4NTd1wAkRg18AFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732538838; c=relaxed/simple;
	bh=wDVlE+3a7Q0/blgX4dDF0Ww+r04zZ7/v7CBGXQwyzO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swDgDOlsjmvyJLeeWKEEJzeieB8v4ZJ1NTDAo96RrU3RCRq3zMrQ4X4gyl17gNsY1zFSr+ivOhTbR604VyxqZWrCIvo7Vt5pw0zaYBxxGFDXLgG0Ly/SsS/mT583lEnDqajZ7iYd8CL1ziPP7NkkveZpN8PviRgfKGPWHXVdhTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQ46rnD0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP6repL011427
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeeoZnPBXUwuagoh6GBKRIxYphnRKtHZMwhi8JnP0Bo=; b=KQ46rnD0BE1BpglA
	PXbvcmE2LBT9fkSgDXPHQnCNVdVkcuDa9uI4ea+NCjloIHX2gzldWIAbG8aYPo6g
	qoWzOqInIEa3EG482lZCBlj5bCGUvLzY8PM8G4bUichgOh5kHgPUzSeHZ5QHZTJ3
	02FV4Cg6/WjZOZsOQtLuvFdg8ZBjw7No1ou/iUxXyhLbpxIdbSFqGFi4bP61ko5/
	uLfaeFZpXVLR+YUqkyQqwftQs/SibBdZyPQX0wV6tMzSC1h7r+angXi0TetxuAxs
	RdM3d1qTuAHvd5QKs7JBPfKF6BdFUbHJDhGB3FrvE3RnapGvWyJvi3Qa8ziwXDk2
	/nW2Hg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434mcas2er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 12:47:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-460a7a53e1cso8472041cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 04:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732538834; x=1733143634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeeoZnPBXUwuagoh6GBKRIxYphnRKtHZMwhi8JnP0Bo=;
        b=DYX0tFncTE2+ks/ncLOG97//WQNGZdcoR8JxsQhsMVLzwtd7B5jDgW1OZ8+OQr7GUz
         gaJNi9JgGovf9KstTRiEysVJP0pOguquRBp0FedmnvBVwNArPXxY1S9HlxqpurpZLUxE
         tnae65pUHRbtP7VZ13x60+CmLA5W7gPwmbfMHgz+Jmztw6/rt0OuZ9iguU1UQIwJ7ogJ
         +GLg+5uEgOR18AwBIkBF0dn5EqnZPYdVmQ+XjgiSvtAQmN4Cb6rG8pPSooag5PzGqNhq
         D2KSo02OkgQajGX8CuyToTRf1MP4HOF8ln66sikSo2yVOahWUpVitzGE2EqgN7b1Vr25
         ghnQ==
X-Gm-Message-State: AOJu0Yw2AJZGwJymdqXcHqvHHXxGHJ3g/uM9h2RuY5MHHOt1LzoM8MoB
	dpLKcBu3byKVzzrTZDdVlHm0FAg93GxNdrvABloI7gVJZfR4+kPGjVglGhBqEIbZt2kOv67bLip
	yZDwgoJQOJIBOsYA972VIlTa6PmpwkwPnfQ2Ob7k+jF4SWm7Nl6OeyTAIUpFtqQkI
X-Gm-Gg: ASbGnct4mZFna6pRuXhFk/vyAqY/jQD53As6zvLQG3M6SpaDfC8ekZUS7TkYHGcC6hD
	Ot1yHyQnEP3rMc7b58A9FlQQL45xbcIxMJ+d22Ww22ITSug7ovoVrjF/iPo5wxDf65paJZV2Lt2
	OPHc8Sgarf5TKMBevilpzTNXqYOMqDjWLm5jPolPATrma0D/ErGerdV+8qSEEEtDg36Vohz8uyr
	xZBQwPy7QWvXDUGZiMoCi7BY8g6tjzlehXBZkApJmWR1YcchAjpB/RvsblIIB7eWC+NbvD23hdU
	1/4NWFXIixH4WCz8/oRFBmo4Tf9pCa0=
X-Received: by 2002:a05:622a:1a8c:b0:460:8f9e:c48e with SMTP id d75a77b69052e-466a160e606mr367151cf.5.1732538833716;
        Mon, 25 Nov 2024 04:47:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/w1GtAxnHY4s+IA+xiplqvA3f7+lUW2gwSCR0W7ECr8U4ppsyLgiI4IDuAcDWm+Gf2BpnTQ==
X-Received: by 2002:a05:622a:1a8c:b0:460:8f9e:c48e with SMTP id d75a77b69052e-466a160e606mr366941cf.5.1732538833276;
        Mon, 25 Nov 2024 04:47:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d401f64sm4069401a12.70.2024.11.25.04.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:47:12 -0800 (PST)
Message-ID: <421d43e0-6a6f-45ca-801c-908c66bff158@oss.qualcomm.com>
Date: Mon, 25 Nov 2024 13:47:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: qcs8300: Add watchdog node
To: Xin Liu <quic_liuxin@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        quic_jiegan@quicinc.com, quic_aiquny@quicinc.com,
        quic_tingweiz@quicinc.com
References: <20241125093503.1162412-1-quic_liuxin@quicinc.com>
 <20241125093503.1162412-3-quic_liuxin@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241125093503.1162412-3-quic_liuxin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NbBSNy9s2vFIwHuVsqUOkqYlkv6hB5Wt
X-Proofpoint-GUID: NbBSNy9s2vFIwHuVsqUOkqYlkv6hB5Wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=850
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250110

On 25.11.2024 10:35 AM, Xin Liu wrote:
> Add the watchdog node for QCS8300 SoC.
> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

