Return-Path: <linux-arm-msm+bounces-46231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18FA1D50D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 12:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44313164AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09F91FE467;
	Mon, 27 Jan 2025 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pyQ3DmcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136021FE47A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975579; cv=none; b=enIAWTI6LZOWl3qu62ZjO2LHGQGg1FaKwXa+yexhncmifOP9x/nyTKm8IffedgRm+/FbbxjR2se5LOqHyeTY/OSwsYAFenKmV0v5i9Xo/ZPXYU4k1HM3JsV2G3BeZ3xetDJDI13/Gm5WS1XpeWBWXAfn+fBTSW7yFZWPtCDwsEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975579; c=relaxed/simple;
	bh=nWH+iekn7GkXcLKxqEi35vMR591l7VPFOcdswndn04o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFrdzuAgJZQWIbxz3QKv/gQolLi5zm3tFukYS5pMrqAgr2nMjb8Qz16q43OqmbCoSeh2tFdOFI/Es21Kp/fEhO6GD3Hk0JLebPERqPQ/ZhdGv+3ZStow9+50S142ea0+PwAZM5bGx5qysTgiyii/Z8Si3OsWYuF5ysJe6cP7JTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pyQ3DmcB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R1bmX5030713
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hi9XeSmMUDXqVaHmXu4tsv7y6mk68YgQK0bsrMF+iyI=; b=pyQ3DmcBT8FzPZc6
	oUvxRpcYSCUv5CAehvqOXxyortEzGh3m3fQR8wWmKBDJAQcIgZ7V4cjz84h/h9Xd
	ADfyfK3DaTZnKnWfM3C1pXyosY6k6wWIPr0bJmdCNBkdp0ZHecDvPLDu9MRdM5C3
	rX9Jj1MYzShMxbF0Qp9EkJNYGGKywraaZO69Rrru6OmRdKy4VR0ofPHCftVtwyy2
	eath2WwPExPaInuVcNheTkxZT0t0D52T3WQ/zjmiacgkpUokgNopXd6rwouvSejS
	s7d86Q9fikP/j/BlAgiAsIi/eUQ4lNLBCavt8OPMFV/PB8AbM7/stTq7YQFeNFgC
	nAYC7Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dhu9hv0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:59:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46e4842dbd0so14204621cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975576; x=1738580376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hi9XeSmMUDXqVaHmXu4tsv7y6mk68YgQK0bsrMF+iyI=;
        b=SqrwjL548W4pHi2xFRG8ju1qgXIYJsSq2dUIocuT2OvuIh6xzRzahdRivqcTQrHe3a
         T2u09lEiHIFfx6kU75yzWXXWeCPjUYwke0mxebBRoxWccM9yL1M1zOhASsD+zgeOvKS8
         HLZLwhtCVSjaJA18C7WJCj+z6AkkNUIslYIDyykBLvW7BPis20VcVqoWZkgdpnTxC6wk
         74bR28MzfGFY+xLW2E1n5Sdf5DQ6EsS8WpUHsF9MnL52zYPLYpuzCQNxvNDMbma6k6UY
         D5x3ItJisBtrfuLxeAiB7Jh0XEa6ivMx2DUgurU4A1TA8oyxL8EL4Acv4oX6U/J+648z
         p13A==
X-Forwarded-Encrypted: i=1; AJvYcCXe5vNI1SAl4inP+MXXUCi6krFyuGTqJoU+0SZMqqFeFqAMPB8t6FvB7wvjVrCFLiC/9h6MGMVlHug69W9N@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxoZIAfVstWrBhQWko16ZmZUEAM1lkLox4JG45BQB30gupSUs
	FsPc3YCsvOI9S/NI2ZJFdbNHToewELSUIY0vnh3YHGcGka3z5d39IHafBHJe2bQXwr8sgGZvksO
	14BS1P08voPaQwIjstIpnN3+fScmHEvjGW97KFoA+WW1d92JfqUcneLSkLnOkdFzM
X-Gm-Gg: ASbGnctO3C+e4NlqfV5ztO5pcRiG7eSb1EMUrWNiKk8KMw7pshU4E6nFG8ubBqQQZDF
	EpoazAiIsQXGnJcFCOHq70PqLzS5KVwrgX7sLlcJ4KgdbAU2+0m4XmmT1l96gcSRAAlNGMvqm+m
	Cs8d+3JqcIGk1d4+LkRz4Sel0RtMYayd7rP+0Kt7dhzbHt+xtzsq2J+dyEIkcAwGakN3FYE4j1S
	UfZS/uO8g/FiVuYoVvyQyzuMFjkBYYYPfaY2YMB55XI07nGKosKkmNxpG4Hji+22yrU/xePaTzE
	Dbms7oHocqrPdenFsssQPhI7gnDl8U8ZxodepD93CI6mLwQkoYWsdgCGv4E=
X-Received: by 2002:ac8:7d13:0:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46e12a15fd7mr218924261cf.2.1737975575914;
        Mon, 27 Jan 2025 02:59:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBCS9L9ozzBbArn6w5TjI3xjX+UztookUyf3Hez57UlQAKPnFdDbeD+TstgcpSROj1ybiaAQ==
X-Received: by 2002:ac8:7d13:0:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46e12a15fd7mr218924211cf.2.1737975575510;
        Mon, 27 Jan 2025 02:59:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab26asm561293566b.111.2025.01.27.02.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:59:35 -0800 (PST)
Message-ID: <662396b8-fe56-4610-8868-09e57c062fff@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:59:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5332: Configure I2C APPS clock
 frequency
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250113003348.1459042-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113003348.1459042-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Bw29DyL7Qm07_RC89nGBggPRip0XbnbT
X-Proofpoint-ORIG-GUID: Bw29DyL7Qm07_RC89nGBggPRip0XbnbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270088

On 13.01.2025 1:33 AM, Manikanta Mylavarapu wrote:
> Set the I2C APPS clock frequency to 50MHz in accordance with the
> frequency plan.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

This should be done in the driver instead.

Since it already consumes a clock handle, you should be able to
simply sprinkle a clk_set_rate call somewhere in there

Konrad

