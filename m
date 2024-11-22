Return-Path: <linux-arm-msm+bounces-38829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3A39D5E93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14C51F2248B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353854500E;
	Fri, 22 Nov 2024 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTneeyND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B1187321
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732277361; cv=none; b=OZQPSOfQW8uZDLp6dMC/FR5BZqdyhAUWRY43mudnIjHRjzKPA0sfftNEmXxQYVwflKI4kcbmeAD/W+hGlQ4a/kq/ehiJCgi8u0uyusL5dOaDCzylYmJScRZ0OV9gKmE7qZw5Lgqdn0E7/4nFqpPyXPY9MOqKV4wCAf/5EPicPWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732277361; c=relaxed/simple;
	bh=f3I4gqxCEIx4XLDLokX5S8VXumoKTGDeUDBMTyPNel0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H4kWPXn8sC3JGYSgF4bDVtpY/ZPP4Xn60ZcxFMcFaVeYc0Gz8vhR85H803cBOM3e3Pa9f6YbdR+dDJZUO/2C0zFNDoAwOlwePwJ1c8FA3QGbyj6CbvwhPcvze3jVYaCQq5cViavK+gwY41x4Pu4Cdk4VuHHvDT4j/hAZfsqiGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTneeyND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMBC4TT019522
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgfQ5I0CQl8UfQ3flsk4bhkJPTEDMQpM6xgAt6l3YTk=; b=FTneeyNDQWEvHnxQ
	xz3fChARcBrFbrWPZBmXiIYv+ZWIzHoa7KjZD7bIG4sWL3ErgQbQEskXkUmCOJDn
	IMnKImaXWh+QBJNrycrxskgyl+zbFzAolx2N91lKSuzUehpOCRoy+ZtCmFSRN4DM
	86vbyv9vSNHTdSab4uhCPYmiSyDiWou+ry+/EZSehk8HhGGB5Bdm5cV2v30BFp1w
	M/t0QsvPJ4mBDl0dmdP2u/8MDc2BiBfLkL0tY0JUEj6b+bIOdGTx4sAriePn8wym
	7UulJlnP8sHvkLjOgnj3fxYsP7+wgcToPKwR+1Ib5ag/bGcx6Ki/r2GHZNe9oBuS
	a9FBFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2n3sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:09:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-460abcbba38so1996631cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 04:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732277357; x=1732882157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgfQ5I0CQl8UfQ3flsk4bhkJPTEDMQpM6xgAt6l3YTk=;
        b=ZpZWXfSwV3tnEDSfHD+bJ7qwA+MXb8f29UdOyU0JC7ESHr3uneKOQR0crCRNzOD4kK
         eGtP9uBHbbguXtSoAFbhIkSKzrJkLgsjT0Dz8AmyRNJgsQy27W971mYMA3Km9HHTklHH
         P97207vqSFWksErizV7a+fJnKTWHEuZlTgz6AM7K5UsLpC1E619El3RMXYz0Z52IyrBe
         V6NDI9AMfsxCHQi00zaYMoUc4TWb2tH1husSO4r1SRIllRGviPmjKNXYb9kOH8smY8mQ
         1WkvWNl9ZesSOQWPS/ZW2MNkkHfvM4VSug2PkoDmnCLUaGOuIeylKpbNXhTlIrDSjbom
         /UaA==
X-Forwarded-Encrypted: i=1; AJvYcCU/rB8WnlTSFSaalpejB2/ZpN/55DF3BVUDrOLjw98k/4R0xwP9HrfDvcaetHz8KTHlR4G5idWmu1yitZVb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnwg0jxl8Y8n62coVEY3n89nlpZpqJbdLROH2iK1mpYXK84xZF
	au857aa/F8dNoROmJvHzdnkFPEYPJJs3lDaBFrnVAi8JjhFAoWjrIeeYv1YpMOlK3vlMqZQ+F2S
	KE9SV9bzp6AaCFOn0IgZ2W3x+W91PFEA47GHLVbTNBR0WQlATqKwqWASytIL4XoHm
X-Gm-Gg: ASbGncvvea/rsEnR7GPzGWGmZqq2HMr61VBVyN5nWPSt0juQR99rK5heR3yDLHW8dsz
	ZDJ8aSCdw2Ju6m1qF9TXyxHRbxGcDxO2LR1dw9yqOUGm9lXixj7NqfZGhzAgObvRiVUrm6gkzvK
	OUuIXmnNKhS1jt07VqX69aj7UBXV0jJUILvofYHsIxnodq2IrH+fFYRnBV1vSKRwZv3A++/fUYW
	cOkSs6sT68sv+jnI836hrHrTCDpbxkkNN9rVfsFWXQD110ML0FunS2iCaN/rH1iU2Z+Q0S6w47J
	eBdLL8pde3rtF6fxk2LnQoeJPNUw8g==
X-Received: by 2002:a05:620a:4393:b0:7ae:64d1:d31 with SMTP id af79cd13be357-7b51451a49amr145613385a.6.1732277356796;
        Fri, 22 Nov 2024 04:09:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIvmb/Y1Kc36T84MfAddlUEPXu02tmNhvl1dBN2N1NQHDvFihw8x5CC9BRGYVlS2+hubr+Lg==
X-Received: by 2002:a05:620a:4393:b0:7ae:64d1:d31 with SMTP id af79cd13be357-7b51451a49amr145611585a.6.1732277356421;
        Fri, 22 Nov 2024 04:09:16 -0800 (PST)
Received: from [192.168.212.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5300e1sm91807966b.106.2024.11.22.04.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:09:15 -0800 (PST)
Message-ID: <7da6fa27-0967-4fd7-af75-0141fde79b3b@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241121051935.1055222-1-quic_varada@quicinc.com>
 <20241121051935.1055222-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241121051935.1055222-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -MX8iMdcONe8slrhxU1yZRoUEwbxyK_6
X-Proofpoint-ORIG-GUID: -MX8iMdcONe8slrhxU1yZRoUEwbxyK_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=927 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220103

On 21.11.2024 6:19 AM, Varadarajan Narayanan wrote:
> The 'broadcast' register space is present only in chipsets that
> have multiple instances of LLCC IP. Since IPQ5424 has only one
> instance, both the LLCC and LLCC_BROADCAST points to the same
> register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

