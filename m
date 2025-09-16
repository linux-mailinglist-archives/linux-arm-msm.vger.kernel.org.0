Return-Path: <linux-arm-msm+bounces-73699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9EB594D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 13:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B3921727B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 11:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B122D322E;
	Tue, 16 Sep 2025 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERQxo6t2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05C2D1905
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021101; cv=none; b=dYg9MCmRZzSeG2iGzPggvbhMFqZMYuOvwe6QmkifgmuF2gTnHM7LgbcecXNHwh8S45Pjy7SNHQH1zfmfCY/CViUczbMhPnnaaDFOn3MI1sVMDwtLiVJCM7m/mN1XOrJesdrQQKEg7H0/Z1ciYqwBHJZCUTUmTzCLV/QKe7Tl2+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021101; c=relaxed/simple;
	bh=275oPonI9MjWeJkyrUhmar7DMWxX8YBm5z0LrGXMLuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2ywa08F3YkIJKPEhsLEfhTwDVgtSd7E35hWiVvQ9EEbkvl2tmAhYePdjsCSUEthq6NW6hJBP5RRarWpQLN9UL34bR38HsTDbtzi4TpY/zkzp/IhUv5LVG6dK6ox88DLXAuA6NWV7lvSGwlGmeZfmpccYkpWVxJB6Sp0a0mKP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERQxo6t2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAVL4F010525
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=; b=ERQxo6t2OMvGWd2C
	Np11Rzcvp7p8epeQb2kAN3KDNiQcU+WtMF0pYiEIoeUJQWR4eZDHsqLroLzKitqy
	8Jtu7m3399Fq6HXoUXvQi4SiaeFTVVedoI2BpFn0tjCKlwOePfX0LUmAqDdx5knp
	k03qlq+oClSrMoogIUnKYu7ElFtG3C342E7xw2vGbdKKB3OQ3MU9AZBR1Xtev5eB
	v7Nfg1Nf6WPlYxrtNGr5cWETshzlMsM8yHDcVQLJzQWjbqiecuXVUPiBuqlg4SPG
	0A0Vw/ls/BkS4I15igj39/q9rXLNxBNOcqNHMOdsp8avn2vB6hVHIIHAY6gB+32G
	e429/A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snrecv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 11:11:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f92a6936so14509341cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 04:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758021098; x=1758625898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=;
        b=raL2DJYVXQKIcwzif5uNbb7s/9Q6yzPl5Jr4aZSXRHTV4QcfVm+USo4oS4zNQ66dOn
         +lqwEgf0JOiGD3My4RfomluVw+y9+NZT+hAr6sYxcOGJb6B+iJVmkGUNSjgRTor5Wbz7
         XW8cyM/JXIuAarQsXLC5ZyfZIont0rgPBn0WnAYhmp9cj1X3weLgihI+SF1LeZhydiVj
         SXAWFJUok7nTNqLdNNSzQzdT6C7YxF0OqDRb4W9KiovcFHAJWNdAneppYZjja5gOFg6q
         IUz4vTUPfV29wq0EsYeabz0mLQHYheXpaAXdGScst8tmRzBjLAPflbHaB8C7sqYofTsK
         8ePw==
X-Forwarded-Encrypted: i=1; AJvYcCUZnh9GP3QpMW6DzQLydGufUSrfA6rmVCtwOQzKFsZDyofE6EFJC/xmlWmsZH3iL9UrFotLRvm+9GJ/FvqX@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhQTkq9tM/YHFLBUsrHsOJqbd+KeM6BAD9gIZrstlx3xDaaUy
	5BB0xGFHObUdActPGOMufc776MyyJWfxNv1B2sSaG3EvYIdq5Q3X1Edm91oeIn7LPIa80i/57RH
	ZpY9bKxlRKJP+X0NrnsQoul9M5s0W4YIFQq4gZf4ls0SICTEoNN4HaFggYMuH5Lr4Jqnd
X-Gm-Gg: ASbGncsc04qO1StXXuPHhzWjHQ2soQqV+e9r1BidOHes3gvyFAgVFSCrpoBsI3r1FmW
	MqLxbjxe96vuwykt5JaCGqUxoy9jiDLEQHlkoqAdZDVjKNFmvkyQ40yQDG0hnyroL6BlkV1nP9y
	RYm8iqJ7dw9+oEDwAxCIkwk4GG4htI6fahvne2+OmAZg4udoP/dWp0qWSiiS8cWPzfMBpMVRQyI
	kRU3b+kJNFu6qyTHeuZs2hOoJ1zXeDA4Up/CkCL925QaIPySfOL/MHTv2yUfhNONlgGJyObPep6
	LseuYPd80mJR+VM/yyOsjuoAYQzl2GZ0ud4rvC2kZZCP/f5X0oeNeiXKZj6Dx+No5UXj2fGhjbv
	e2gFyLU4OF+26UZcbMjvCng==
X-Received: by 2002:ac8:5902:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b77d1158c7mr127005591cf.8.1758021097882;
        Tue, 16 Sep 2025 04:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnXuilj96k6BuqcLnJZYaYn30Rx4rGcsXCSnzBEldqk8rQYINLpEqXJPXep1f3KK1X9KhUTw==
X-Received: by 2002:ac8:5902:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b77d1158c7mr127005221cf.8.1758021097349;
        Tue, 16 Sep 2025 04:11:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f416db508sm3834982a12.32.2025.09.16.04.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:11:36 -0700 (PDT)
Message-ID: <49d6c554-e6ed-4c86-8946-be2cdba659d0@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 13:11:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: vladimir.zapolskiy@linaro.org, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
 <20250916024858.GA3574831-robh@kernel.org>
 <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c945eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=-IwCPt7gIHNx5Q8nY1kA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WW6f3MYH0hUhHjGX6tvjFkENNIumR_xE
X-Proofpoint-GUID: WW6f3MYH0hUhHjGX6tvjFkENNIumR_xE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX/Sr0wK80K7XC
 PmZSwvaoVlguNjfwZEi+vbUK8LOsey0RhLaPOiMgXCfO6sIPKris3Apg5ozbdIEr99icLkJUgkl
 +opSVRxZu4wUxeQSOqpsrbgn/ZglCxdv69E/YVsp6IyLwYuDzZiwyx67NqiRMrFvd4zxdTjLUYE
 tE+PhLYuXfzndi7RY0a3HC44l9IVBn/hoX68pRnZy1VKK3TQWtQKkLjTsIMXc5ZrYGomONKnT9/
 e0dDbrzALqNVuw2FLcGLNiGrnVD/gJaK/COPLyPBwCZvcWXEk1DeBTgza9T9gtLKlHSWJYaaUHX
 WnkzuMXjP6wFXOvQ3clYmWb4wk12PN6QuXDnT9QTTOFfED6F3/IUnBnhfUbVvOg6gNjrewKRfMO
 TokrTqcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On 9/16/25 1:07 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 16-09-2025 08:18, Rob Herring wrote:
>> On Fri, Sep 12, 2025 at 07:41:32PM +0530, Vikram Sharma wrote:
>>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>>
>>> Add device tree bindings for the CCI controller on the
>>> Qualcomm QCS8300 SoC.
>>> Introduce the "qcom,qcs8300-cci" compatible string.
>> Wrap commit messages at 72 chars. And explain how it's the same or 
>> different from existing SoCs in the commit message. Don't explain the 
>> diff. We can read that ourselves.
>>
> 
> SA8775P(Lemans) has 4 CCIs, while QCS8300 (Monaco) has 3 CCI, with the 
> only difference being the GPIOs used for SDA/SCL pins.
> 
> Currently, the CCI driver probe happens through the "qcom,msm8996-cci" 
> compatible string. Could we use the existing SA8775P compatible string
> "qcom,sa8775p-cci" or we should remove it? 
> 
> Please advise on the preferred approach for upstream compliance.

Try:

"""
The three instances of CCI found on the QCS8300 are functionally
the same as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible, with a common fallback.
"""

Konrad

