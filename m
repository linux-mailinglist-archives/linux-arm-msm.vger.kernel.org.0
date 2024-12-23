Return-Path: <linux-arm-msm+bounces-43121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8D9FADC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38F441883924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85C919DF98;
	Mon, 23 Dec 2024 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hj0x/k01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9A19CC21
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734953874; cv=none; b=pF/jJ8OdgpxTWiC/FJou1yW0tXieI8XWw7wF74BuOgZED2wz2GxEf9XVU13TcqiFBj2MoD6b6YSTwPt7gOhlCITYSaNClJ7BlYmWHrNVKKINgzlFm5SE4fdaQpDAiRvDDSleZMALIasb5NIHCnsneb6OIEyq+NEk+/qKAHXofDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734953874; c=relaxed/simple;
	bh=wUjPXxAsWNUWqccLWJuFOMSjEM1ez/Hb+5rIbn5YFbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHWz7z1K13pTPdS3tn/0yorj322b+5F9gHbkl3kqW8bHfE7IZdHBQWg0wc82IHFTZw8sBULhJ/0Z5QJHYys9MSKAVZ/+YqtCDyiJ2G+BVQ/YRHYdfWDeUQR3APbO3hfqOaKsKYFUFvtYkVmvGXPKzwhQItYTzp68KYkRHjycq2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj0x/k01; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9P1bk008140
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxBwnZdyh0+oIX2CZcOkzfj/L38PK1tR2KNoyu7vIgA=; b=hj0x/k01KvAQ9z5h
	Si0R0I4pRaVesF8/zDfSwU7szpm/avXesU7StxdUVi+xyOuRoG4EreHn3HddGqML
	5MHoZLKruRk6BfaP9+E3V7IYwE36NjYbERQCdCtCdfCCEed/6BaX7UxCKJwFMUVn
	zQtzVlp3L3B7V6M5LUeMGLliXnyMI8vuhb+JNceCjId7jI3TIPM5x8S4hxDKBMiO
	9QGm0xHpXiwpG3JEP2vMRDnn1Y6akLsZo5c4OesHoJ3n3q9gUhePR2V0bzTiyjQt
	sEDYnnlkt7G5HwF+Th9hkbCPTSg+UoPyjoU999IXdvRuticEhEZnQN33m8LbVB8O
	qWMWCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nnrsrufe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:37:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6fec2de27so65898285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734953814; x=1735558614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxBwnZdyh0+oIX2CZcOkzfj/L38PK1tR2KNoyu7vIgA=;
        b=Dm9l4l3S1x2WINOq+Q3z2he1FYjpMz7KfCyB9w2v29KQkZt2ljtrJ1e5ZqX0ssaTSf
         YMdtEUzfWZmgMHlPk04Xyf2AvxfplKSgZDjLNxhGxfSR8f8mduGtHBQ5y6txBWmfNnvE
         LlUBa6hjo1sfir+ECNmwu37Mr9pPiEJKg1Tz8NJq/z2b24e1YgiJqMIeGrXQhzy+dXTQ
         0lMsVjx4qqokNGh97jclhA56bOwFFcvFsieY/tgCSjqm43859TCZGQ9btxnR/7v4E7vi
         UqB/73IG3/pbh62kv7HQc8bvUEGBag4dVOpcyDleYc2+Sn1Fx6sVRBl/i4uQFqh6AopQ
         YzEQ==
X-Gm-Message-State: AOJu0YxGtDXMg3t79MlDVQGW44F9jmWkm9QaDzh+evH5VNt8MfUsILOZ
	nzJb3cMK+TbobMnwMRA73AMjVeuN6r2jsEA/b0675R4JCf+9FXkEQ2GSA59tnRWnrOi9Ym2jLxt
	361/ME/jxGYvQt1T3vUVm/Km8rRgiLbh4h0zFqWIy1jPotMnzAAOhMaR9Qk04p5D8
X-Gm-Gg: ASbGncsC2CUWUYpxKBTYfWQPa8OoeJa8nwZ+5eYwT6SBF0dSVOUxJ+72DqP5BAvi+Af
	9iE2sdnd7kClvwJD3qotHd0cqR6/VU5SHu3l7FXleM7+qnPl7p8jzvRPzUgw/jYXStWAqiWQYeX
	ehqodJxZhSzDoGnVrCKL+SK4MiAOtcaHV+FDncrCsymsM8I+hkQCOPOB9bxmm/Y32Z9egrts7Zf
	DnIqG2gsbk9VGBl67fw5zxNsY0Xgc6DAsJL0zu0dqyGt5JkQFudOEIbYXll3sQD1b7ibx74L4tl
	gj43rE45YPIFaJGZqzxFpKLbN+LPPax2qaE=
X-Received: by 2002:a05:620a:1911:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7b9ba7b0a79mr760623785a.12.1734953813775;
        Mon, 23 Dec 2024 03:36:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtL1xYU4q5iFeeT8egnMEG6BfPX15L+zymBOyU7oucET9/Hf+ap7FsaWk6YB8aHkpe/bKmYw==
X-Received: by 2002:a05:620a:1911:b0:7b6:dc4f:8874 with SMTP id af79cd13be357-7b9ba7b0a79mr760622385a.12.1734953813408;
        Mon, 23 Dec 2024 03:36:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaee340665asm50505166b.187.2024.12.23.03.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 03:36:52 -0800 (PST)
Message-ID: <93ff7098-a77a-48a1-a14e-de23940bc763@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 12:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, quic_mrana@quicinc.com,
        quic_vbadigan@quicinc.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20241223-preset_v2-v3-0-a339f475caf5@oss.qualcomm.com>
 <20241223-preset_v2-v3-1-a339f475caf5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241223-preset_v2-v3-1-a339f475caf5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zPPf2xFwK4PUlsuTwfyfRtovKA7ye3S5
X-Proofpoint-ORIG-GUID: zPPf2xFwK4PUlsuTwfyfRtovKA7ye3S5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=592 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412230104

On 23.12.2024 7:51 AM, Krishna Chaitanya Chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Does this also apply to PCIe3?

Konrad

