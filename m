Return-Path: <linux-arm-msm+bounces-74074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A86EBB84A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47A731C221E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 12:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE86304BDA;
	Thu, 18 Sep 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rtn7nfEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B313302769
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758199619; cv=none; b=hDOxruwXgsosYO+UAVkngBJX9TAXF5oAYHZacfp53r0tfsY7ppz5roRVKVb1jdu8MTrybWxrfNliKXx4Kv9k+bDfcw4KmN3QelGDNHELLKAe2ul7w1ppm+KSI1EDGugNnyc+SXzvI9YtuNKNLCjNtw0xgmdQnLrLlrf75N2FCbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758199619; c=relaxed/simple;
	bh=QcDU0S/gGtyrDJoonhlOJQKmYDHiNPBGxqw1d4DtiHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNgENB1xSmrUsHXSgA+uNdcyHFqaaOQc6072cyaDKkfo5tNcDAZVDJRZGzTMfhChozu6xvn+EDUBT8zNtq40sP8q1poYY8b1fldRRsGlj94NV5g8VNFv97mvsELg2XrLRoc6UL4E6+6R7Swn1nh5pbFy+Y1nNzZ5xkm5Ib9QSVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rtn7nfEp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I5f1iI022858
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQi6E6p9KLnZzlas4XjllmXc+yprtBYyqANSQeumeng=; b=Rtn7nfEpcgK1qY2v
	cgDmu2IVJTGkcyD6haMQgdNdKYiZ4OiXURc2a5BOfNAm67kRCYHsUgZ67lRIDFUP
	YvWmDhfFE5yBPLWzh3FtHByfwVKGHkP63RVaCOv0K7qwsj1l+6SibBWe5o1aw54f
	fqyOzLeuF5BtTopwtXMJRNlTsCSLtVKxFVx1IfOAF7NQn9Mz3V8safHrvI/LbQwb
	0+DsfzBRFP2/MUVapsfLzn51C/K0dl1E/g/0dEbDJVgMxHTkwiGwIT0+75TOwSDD
	rrFRDkwTQIcYIA5NUelBVuFBvG/vIZxuBCl0b+Togc/NJ91K/YNWD1DGJ1iB9oZo
	CSgCHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxxbfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 12:46:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b79d4154c9so4766981cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 05:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758199615; x=1758804415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQi6E6p9KLnZzlas4XjllmXc+yprtBYyqANSQeumeng=;
        b=Mx3R0WBq21w/U6ibtiUinrlkaxl8wIxjQPndczyznrO1woeWvoQ6DJSInw+JYgXu/1
         WmBqasYmmAPdxhSzaZtSHu6DBztbCs06m3pcdKCDF4cwm4hh8FxCwYwHcDxM8Xw2eFno
         YCq2c7xw0XNCSf1fZZklWcnOsjKcca9KMVIz6HhhCaDanokYDmzkXT7iV2V1G9uUEYlC
         EtTI9JUsjP+LwJbXwHZ9/2HbtqXBy6GCdKCs8utWxP9ZkkAF2ojTv60iyvKoaxk5/zG0
         D5+7LgSm1aBVegB2lBCY1mYMOxhkRUJ5cLq+NUpvNTmAu2uZwvw43auB5QgrYpq5uzAH
         r/hw==
X-Forwarded-Encrypted: i=1; AJvYcCWqEUY+kiyKcT3JOPm5Aq9XPxCfaWxxMVeubyJDWzkf/9R7PDt5HXgN4/RR8LPSi08eTsfYpcW0iX9ZHJdt@vger.kernel.org
X-Gm-Message-State: AOJu0YwPT7G2bQ35ejtpkYXgELPVw1tB/CIt8nrHW+MMoIAijoqG2kCB
	w/kWFXQYpLvG5F4Gtv34oLP8HzwXeHurnqkPQ8LCLOkFDEGlxgLWl+L2uwP3Y/62f2sXzJn4xoc
	CEqHnOp0fGPGUmMlqwItMSByrl+ypu30qzCvCN50Em/skLEBSUO5WnBlypj/01VnmQYvY
X-Gm-Gg: ASbGnct91ImhAh2mChPFyt9ylLu0FdhQ+KWG/qIPaFqVNZLar7t1BAp7u94L9nvCK23
	Q/AZE4t8VuX3AIb4Fw4V4QsczCnvtqHYpO9VHvBaUcglw3tugfOrxOwU4h9z+Vw0hxiFAX/Dy5p
	2gZnPmWB6zBnHahrwltu1vmQYsZPwnlkSzLO7x3FGj/OqDJ351aO2hc+I7scFBt8E/XqLacQ5Oz
	UGSnYxwK39hvXONjhYdlZrBSfi959Mhvpo96Ud44jxysNruqzYtsNGjkLSw3tKX8UjqGg474KWK
	hemuvX/hZ7Uf416TZp/bM0NYQctdVWRw2zcUGrI5rF1/xjEITz5B2eN/hBNZNsO88saiW/qYV1h
	FOPf1WF2CnD/LeISsDsjpUQ==
X-Received: by 2002:a05:622a:1a22:b0:4b4:9655:9343 with SMTP id d75a77b69052e-4ba671e4f25mr47443931cf.3.1758199615414;
        Thu, 18 Sep 2025 05:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgBR0C+dAzCLmJ+hmxln+f5FlQgcycTu/DhEnyDBQ0nAkbRMwAhB+7lqoqPXh2Ubt8pkL/kQ==
X-Received: by 2002:a05:622a:1a22:b0:4b4:9655:9343 with SMTP id d75a77b69052e-4ba671e4f25mr47443731cf.3.1758199614793;
        Thu, 18 Sep 2025 05:46:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa981284fsm1033537a12.14.2025.09.18.05.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:46:54 -0700 (PDT)
Message-ID: <3c42a3b0-b8b3-4c37-963a-e9cec2d3d025@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: ipq5424: Remove eMMC support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20250918094017.3844338-1-quic_mdalam@quicinc.com>
 <20250918094017.3844338-9-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250918094017.3844338-9-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9IU5xDWAl4qX
 yfEe/ryF9sLclco8o06DqU+cGqt3CCUOV85EYNEUZGS9+6OhVdT5Y4kcr2RPxjHB2/vmXDg+Mb1
 G/bvAK4PutAKxrxklHOoCJsPTSJmZPUzorzttiLp4F3Kb2nQaWqiDdOtjiATiRIDScqMlDvF5sj
 3OXHdrBPWUaqEwsEImha6jVklt90SZcIVsuY/+4rV2b9xuATQ6aP27KN9tvjQX9UX9Wuq5a6xKn
 hJxg0+4WOg9iIRsDijlINABFgwWkQbm/N8JxH5aZr/ll4xirAqTkAMvyAIEh9+spIwk78PN28s/
 9iYZdyrSfdCaI+zSdlpDpAz0i0hu6AV1o7MX77eHd4V7TXZ1V41ggoMBY9qTf0GUeWtL3+dhyyQ
 1b+SrbZ2
X-Proofpoint-ORIG-GUID: TmNvgtRnNwMvdNVjX7wBqwQo_mlH3bwN
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cbff40 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=be57XhxKj-X5Z9eHZJAA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TmNvgtRnNwMvdNVjX7wBqwQo_mlH3bwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/18/25 11:40 AM, Md Sadre Alam wrote:
> Remove eMMC support from the IPQ5424 RDP466 board configuration to
> resolve GPIO pin conflicts with SPI NAND interface.
> 
> The IPQ5424 RDP466 board is designed with NOR + NAND as the default boot
> mode configuration. The eMMC controller and SPI NAND controller share
> the same GPIO pins, creating a hardware conflict:
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

The subject should contain the board name, i.e.:

arm64: dts: qcom: ipq5424-rdp466: xxx

same for patch 9

Konrad

