Return-Path: <linux-arm-msm+bounces-41983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51629F0AB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 616AD282FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68981DDC32;
	Fri, 13 Dec 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FHRzpVjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8A1DDA39
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734088737; cv=none; b=JMb1egiM+ldgOia18UvcAn/EX49aPgzzQBZsA7d09vpR7oOORMrI91DVIBHzQHluXb3rzDfxLC5sPqumvu3IC0uEVqsz4qGCfYYNFu0QQAmahM1K8NtCwt99U6qH7QOAx8i4fzl4PC2sSNPnOw6FcUn98rn9thG4FJ8o8TYHCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734088737; c=relaxed/simple;
	bh=auNuVg+Uq01zi1bIh+gO7UoyVpAIBt6Xmw3RIjeDju0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWgMxNi0ejT6fxsTUbuOg+eduIkOsAuaPyMDMzUwALVTnAlMC3esQh0lTqs5XJO5JVGjVxvwhRH6sJP1Xz0p23onYap4oVFFkCvkGZfYt54Q/ntxtijGQb7sP08BwP1dqom3OY09vt4Qf+nehGbt2onP2UqVIK7LYPhahB3bO5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FHRzpVjj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD2kt3n000477
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/TQKENLvmprGOW1/Wu3SkBKRJf47l5oWgnMdRrCuEI=; b=FHRzpVjjz7wcMkwZ
	W27T6yxjzvmsYuiPzmedpeP4fEPqXr6E8enQCfNUhY4r6nSV2kcTJr7RhBt/QpOf
	XPwzkq1E4DQzdNH68VWyfT66rjvG1ns0/bS729Gca1mYJ6TcrmovRQcUkCTYrhkp
	WYvZEWlTuDym7+K19apfTZoHxejNVlDKG2s7sZWJbE20KWTknV6R1NhoTVHmVDI6
	lQg1xzYmwvGlx9r8oM/b79Tb7ehQkCej9xGeeswx5NtAg1NCsf1uXTc+6yXJXqA0
	9uXJiWzyZCJSmtlzm6ChMHl7RP6S4M5ZHMT098GGtDJG855QmqCAcUjTM5sh0qsd
	TV6weQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes4mhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:18:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6db1009a608so2921966d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088734; x=1734693534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/TQKENLvmprGOW1/Wu3SkBKRJf47l5oWgnMdRrCuEI=;
        b=K/3Clkl0CCTwWzeN2bcMKHH5mMduydIgmAFI35wX/1r06F/aAg+AxVn/jxtLLIkmeA
         26Ufc4MqddYvFqp/2mQVmzUeQQ8ClDcyd0DzcDbqm8wpE3eHbTfP12k0fIG/I8wBbspS
         isr8Fombyxbyjx7lucANhSJvXbqoGz3D7ZDf6eosY8PzF/WrLm4iU/bXh7iQwynmdalG
         oNvBZ+Y3mm6OosKa78M+QLfz2HUy5jLZ30NqUTAdeKNgcnLN+8tFMXnNK3hczXk/ncy5
         5KxV+Td1FIHT9v3eibqFRP61MBbF1NeNSpclcui6lWj8xWpc5Y5yM2Ag1DkO2TrSwBms
         poyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVraW9pnNio0MjNEJW6qcA9WrTCWz/9f4m2SvOUxvhFClDftmAsUfRs7g8yylSD+osBSpTOsrMQ7A1fO75W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uu2xDgGtnanh47sAUFCzOSpjUx/L/ZfwoS1T/zY/UomMty+e
	Uqpeepm6s7uquST7Up9msH5xfbnF/r9cI4qaRlopmxbH0s32qx6ei59Tb4COsW6yxYixucoIQPm
	IqPH2/vlVdmFELXO9l9agQLOVsn6qyIOuZjHkU633RvfiwHG03X1m1+pZEISroc7u
X-Gm-Gg: ASbGncsmVusZYmgXJ//FGTSEeaOnZclk6G1PY2YFByZ9qdJhueSwdGvisH4I/qCxq1L
	K4c1x1zr/fotMqIKpuNnA+2IY72dCL4sO9UynMPc1qOxGCr03F3Y9MOeGQz/9orOpFgtNFnCqUr
	jCFRXYKXEHav6GUBbtmQins2lQtAj1kjT4H5j9FObYO9apQcgDO8ytAcPJNMC7Fj5XoxBTkxIiM
	DgSVKHJlHCDVvvrfUbQ9GZhrGAHgz+dIIHXbpw2pzqc+Oi60xA7qZGj9nSbu/Gi5riSZISivUXb
	kXJUpQ0Wt8Hqs6aw3hF5U2geXD2xCF7MRLTb
X-Received: by 2002:a05:620a:19a1:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7b6fbce2263mr128315085a.0.1734088734245;
        Fri, 13 Dec 2024 03:18:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBR+cUBdvb74XuOejNI9mYSykpjh49aeXCJst5j85GNfPlE4TY4ja3JXn/U1G43w2NwwSbUA==
X-Received: by 2002:a05:620a:19a1:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7b6fbce2263mr128313785a.0.1734088733880;
        Fri, 13 Dec 2024 03:18:53 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a48ab4sm11339660a12.27.2024.12.13.03.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:18:52 -0800 (PST)
Message-ID: <d397065d-80fb-467e-bf41-0f5aad882a15@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 12:18:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
 <20241206191900.2545069-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206191900.2545069-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _bxvE5SYxLgIjSM-eUdhuBlN0oIlkpYe
X-Proofpoint-ORIG-GUID: _bxvE5SYxLgIjSM-eUdhuBlN0oIlkpYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=808 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130078

On 6.12.2024 8:19 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

