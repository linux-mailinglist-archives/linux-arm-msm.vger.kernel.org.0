Return-Path: <linux-arm-msm+bounces-50218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB6A4E7BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FEBB179B34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFF12080F4;
	Tue,  4 Mar 2025 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYCxbjOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC822066DA
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106495; cv=none; b=kt/oH+3WmecE5AJvo7snE8MUHsb1A88/keFzhymb6rX7RvtDRmdFcdxGb1rwr3i3AOXpu1iKOdyo0SdUg3UGwl458FpVDvKwtTIdMUsYZtTYgM53+CFpinpzFSbD2fo9mgf00utbITeQT7p6AzoTnlgv6WIp0vvHkHe46im2szQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106495; c=relaxed/simple;
	bh=ffThSbYQesCsr5BdSh0lmlwxJuRduHy19rXFVPc7B+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9jKcDmJci9Uch8zb21XcXGk0QAc4Dmag2aUCBdBOxO79HpXB8v2x3naSSJhOxEHvUCmHDi4cILS/FvbeIZdoHegz2mJoC64UAkVdYBCzaa561hCfhNZ7Qbz+ekKm+t+/7sBrzbW/SA0X42QpxUZOLaJeBO8CbzForYlg+PdCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYCxbjOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524A9B78015492
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Mar 2025 16:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aweo2aVYPK68EM8Nsal2jdoc4Zn3ezHG6xAKnUyHqJU=; b=CYCxbjOtLrNjzUq6
	ZRHZL7OodaIbFoCVNd72utSpRZnzo16Y+klL9VIBMLbNc7fZpBOcvefuHjdEGYfl
	9NaxEvVFKLWFQIRzpmU6n+wd8fmDEC+BUvgmC0CqVQte2rFUHcx7oew/zWrDYUlN
	CHP995YgliwP4CVwpzrVXw0MnuW+y3B8zOrEFk2GzOBPn+v+ERszd/PlrlnZDRWg
	2e0Iqyq0WnJi169XuStO9wBKOnKcklTdWoDUPlF88b0uTNxmHpVuBOA2ITMKXG41
	n6gtkA+tx/m+TxLVqlCrXzbQJFAyJcKn9KTOATuF9DJzzCVHDPM4PZ3u6cvqvYZ/
	U56d+Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v2fmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 16:41:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e89902aaa5so11399256d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 08:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106491; x=1741711291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aweo2aVYPK68EM8Nsal2jdoc4Zn3ezHG6xAKnUyHqJU=;
        b=dbP75EGEqtjRBlcmK1QPazOzWpnEouvxquVIycJ3GDwBSV22z6+ChEPJMvnhyOaK9P
         B8i8206R4dnJldEf9DNdfxe/FpnFcalkq2hExZn48B6jxdU4tiUayDmhRFIfMYFEBzAw
         A2kR2MkBKn7P7LVWLXB3K5ATz+HHfnL5kc/gxfqD+WJGKQEw72/VI6mvzygAmVvUczmT
         S3eNeIcdnKoYKmYoUz5XJnKSleC2Y8zE83KncuZ0e/yCjJD2Dn0rU2C6WuoGGSna7Zmp
         nl07rDx4DTS4DXxsKJFl6UdBMySv9eakpiNkVpuP+xFMkR+5HTyeN04tAgitu9O6eYyt
         I5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVxOIPPwdwLFSQR1uI+cugJ9adIFy6B8Tr2Ee/uLfq/isTeyQN9BPBOHzUx40mnwLHHJTZrklpoRvTU6NiG@vger.kernel.org
X-Gm-Message-State: AOJu0YzEc9oESmVk1+joWf8DI0WAE0A+/m2x1qecGYQhJDPrfyZJAwkS
	xVoVJ+ZhjJvuAQunG2IZmmu1NApyn2qnnDiIpUTIU6LUpEI38fNtBA6l/4HCDeQOjjSjP+sp6cP
	ERk9dE6zq0+QHCmo3Cgw5Da2f6pBvBIkUF7Fs0wEdg2KcKmjlLJoyS8eCGblPXd6P
X-Gm-Gg: ASbGncsDUsHLqBn8UOSiFvu8XLKT19uVoVrSojbPIA9W3HKA8VkpTocA8Ypiged6iaR
	+ng1wxd579lvcKt0H3W4Y4tlqIR3w5GqQdYL40KtMPfUWqiL+kmsp8tAODA3XSGLmpg0kNrQQ8g
	X5PIC9uBHceet/NanL5ln0X5GMnTi5Z3nJ73sCFLRjOZFmhjR5FYSmC3jaqirLMWhSIJA2MChjE
	EVm8jlFfgNiE+yZSfsbROnkNPj9Pso4XJHVZCMDOfZfxlLi5YZIiGVllX4zINKH5gqfuHGXP/mF
	0RvkT+JV7ditRScAMLoGfC9hvjuzH/HPMHj2cRXfM08nDfO44Wj/NP1njalhlb6m7oyJvQ==
X-Received: by 2002:ad4:5f0a:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e8a0d05d81mr86128616d6.4.1741106491374;
        Tue, 04 Mar 2025 08:41:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Cz9Nh6swuZbgLPf/pRvOeYz9E1GRDU9wKVJ0wtg4BkA6pMrkakuUP21/Z1WqbGOiSQ7Lyw==
X-Received: by 2002:ad4:5f0a:0:b0:6d8:8283:445c with SMTP id 6a1803df08f44-6e8a0d05d81mr86128426d6.4.1741106491049;
        Tue, 04 Mar 2025 08:41:31 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c74c714sm975253166b.124.2025.03.04.08.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 08:41:30 -0800 (PST)
Message-ID: <d4d658a3-e276-4e0f-ae71-5efd077e8a12@oss.qualcomm.com>
Date: Tue, 4 Mar 2025 17:41:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
 <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
 <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <77475c23-c173-4512-b257-d7b01fa2054d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: af7ZsS8fraFjoMdtJgWH4ntUdJP11MFv
X-Proofpoint-ORIG-GUID: af7ZsS8fraFjoMdtJgWH4ntUdJP11MFv
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c72d3c cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=iUC3nf1AerQT-j-K12QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=832 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040134

On 4.03.2025 3:02 PM, Krzysztof Kozlowski wrote:
> On 04/03/2025 14:07, Bryan O'Donoghue wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> Add the required nodes to enable Venus on sc8280xp.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> 
> SoB and From do not match.

.mailmap breaks this

I previously worked around this by kicking the relevant entries from the
file, but that in turn broke base-commit in the cover letter

Konrad

