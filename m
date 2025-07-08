Return-Path: <linux-arm-msm+bounces-64006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A5AFC7AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F23F54A7F3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED252690D9;
	Tue,  8 Jul 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdVbT8xq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691B72610
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751968872; cv=none; b=mwq2m4fZpOQVVT3qJr/k7VhRoPU/cocHWZqnJc0GdlUQFjhGubxIazGM+hxmlljIT1oARJvZPEh5m7cOpqlt+nVKNnYPqsrwCsimp2CEDQRTtOOnwxArio7aH0C4r6E7zXW9zsW5CujRdhrnYo1oGnL/N/7AJIRlbg3l5+sDxk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751968872; c=relaxed/simple;
	bh=gJEle21HfeHRg/MyaaNCJjVlwd7x02N2SP3mJGzdmA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0i61XUlZBY6M4ZhKyJAXmaMNxDzoqOPwhvXVpifwpeK8+OuHL7RkC5BGS7bTkqozD1LInHTJxr1uMJzTVOOOI8dqOEZJLTsybhWPjueHykLv13BkKF4HeHsa2nCk2utuSDDSuEjGfXDRyPJDsEigdRPrtht+EelT4cmgo5THsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdVbT8xq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568720hC020657
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 10:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	483dfQ545JlIrRhF6KMFjkkyxIpCkMi//ibR/zkJguU=; b=bdVbT8xqpQH3m75O
	kynfN+zTI0/3Ha2t48Mhs3Ncra/8lFCR53hNi7IdS1EAhjKhsW/T/p218vJHufPZ
	jMMhmnbDq7Dqxt4JgHqNs9WdIodT75IACmOPPWn3xz1r9V+kDN6/5QsoL1JmpOPT
	y88lyIb0OZwB8In+apHaSGgokWOT8FmlMBqbQTxSImnyVI4B9iQTwlgyvb1FZcYm
	n2VKgz7M1No/U/ITNpdEBbYjgCmQYtVFlOKYgfFbt3VU59GlEak3ztVSDBXqeoQC
	2ThtpaF7sQw023226bPrj+vLkCyNk8uk3+eQHcEYgH62uayBDcD3yqLucXDBFAsM
	T+JBmw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97kyux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:01:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a9a8841a85so5167071cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 03:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751968868; x=1752573668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=483dfQ545JlIrRhF6KMFjkkyxIpCkMi//ibR/zkJguU=;
        b=hvQcfzGezah2rm7WY5tze2l6pEjQSRa4YflwrQT5zSsOk2WIzB6CcgGJw0bWK1mQtj
         S9EA2LXC8J1oZz5VdsFwxZog3t1VVyBmCgARnHHncBM//r33EaWkTkyfleuzsKwbkRia
         2vaU1qLB2odDzRNdZmBmXFz1oXms1Pzw8akfR9fYE/sw11B/ofEUao+omGLlp8Pv8JJi
         ZIRccPCmOxrqxjp3FNzfAsDXZVXGsw7+KxPA95wv3cBCfUPjXhxq2mAsWxU9wIEyY0jE
         HlM0zJK6GypRJYctxv/uVFQ/bhOxyx/l2jK7+yhH5NE1gL0X5ltmQcknxmVMd3WCvTU+
         0iBw==
X-Forwarded-Encrypted: i=1; AJvYcCUVuJIOeJKFvKcgMeqFG512FBEYpxihwX/ALPXFO8LJH379u294Pr/yjOgHT2yYu7Gf+hN/Tyt4Rz0QUBqE@vger.kernel.org
X-Gm-Message-State: AOJu0YwqD9Kp8ulSmF56WsOcCNPAPVxvyaa9yAapeJk5FuAymPgywc9W
	nnI2Qy+1XZIYiUVox0dqWUXwy3xpggSAC8ho8wcKooPpASdZzpZM/epv7FBLMTclSr3ukXi/mFT
	nTBG59ZUtgxC9gS8Ni9UGIIugYRb2NsDdg8IqMkEJG3+SIXBz6cs8d1TBe+S+w5PLGMV/
X-Gm-Gg: ASbGnctzi8Axgbf15Qd7GRd1QKWA9JuRcNR7triL5w5iZQeURSXsM7aCRbXJflXUbez
	Wl5WHX2MG/1jE2oJPVutrLkWSfrDXUlNpUVwl5D+MubqgM8pNhVFn4MOiRl+1YgokJgtiJUeIah
	kqZfgP0KPVTKKqVeiZNsny/IFmh7bTmp7N/OMqR6buOJZ+ExVADZuMDKbSmqYCWWdlOWlPRSkEx
	FWb4F+AOYkPsrgqanLd00Qi7iiIbsNdLJpR5l5u1B2EqwpPRh7xJRt+FG+8oNK/RySyVG8Vwsp4
	NSNriggYBpY6FPhT9RpfuyklvDVg9/S8UMQ8TingTVtYho2v9wiM7upvM+46Y37h19IEZDEz+oi
	2Its=
X-Received: by 2002:a05:622a:5792:b0:4a4:40e8:6e23 with SMTP id d75a77b69052e-4a9af1cdd94mr55938161cf.2.1751968867505;
        Tue, 08 Jul 2025 03:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZnC5Cdjb3gvmhNxFzfuEuiFwvA9CntFLERXntN3Kd6tNI1FJYzPO8V5RedGFE35zBoCMnEw==
X-Received: by 2002:a05:622a:5792:b0:4a4:40e8:6e23 with SMTP id d75a77b69052e-4a9af1cdd94mr55937961cf.2.1751968866897;
        Tue, 08 Jul 2025 03:01:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae411a5429esm634556866b.16.2025.07.08.03.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:01:00 -0700 (PDT)
Message-ID: <044bdfc9-85df-4f03-a4f8-8ef1717138dd@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 12:00:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: qcs615: Drop IPA interconnects
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
 <20250708-amiable-owl-of-enthusiasm-e75662@krzk-bin>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708-amiable-owl-of-enthusiasm-e75662@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686cec65 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mnq6psiAt-L2oik7x9cA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4MiBTYWx0ZWRfX9pNQDY8GUE7a
 n5I08N4b2Wg5AACgQ2aJ/bcGAEDJA5nTXDEYUxU9jdMVRUKJBFmHybfsjJGwXCAMxJFOkFP0Q8x
 gvxuSiVVkuBQFuTMsv5DTRs3wxpSOUP+AQmIpo/D3CwoX8thuVZ8+0qvJzLCWTZt88uasnbLXKv
 5D5I0v5VKJi8W0wjhxJPW/m/ngQearcfXcHR5XMVdkyWqnTkEHfZOW9Rrp27t3kx9ymCwfCI6vL
 tBnExBC0Q8Ti02XJSMzAldDdf5dgVu3qAbxd5/o6QwnrQBANZ6FnLmS0V0zWbdE1uJ0c6q0osVB
 iTiSuHsWEG/RNGv/alk9WGaOBwXKyZHVbgBa/UUcZK6hV6ioXdr2WBhOq8A8rbRQdWWpw/zvyb6
 +niLKmddgUh7YR05pJ8bxg4Mwg0yrx00APDefIWAqDho8xbvAfJ3XmoqMcMHR26sMbCTKzkx
X-Proofpoint-GUID: _s-ChpD4ah1yVo_kgyLCC5mnU1crrrUG
X-Proofpoint-ORIG-GUID: _s-ChpD4ah1yVo_kgyLCC5mnU1crrrUG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=894 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080082

On 7/8/25 10:51 AM, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 09:37:55PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> In the same spirit as e.g. Commit 6314184be391 ("arm64: dts: qcom:
>> sc8180x: Drop ipa-virt interconnect") drop the resources that should
>> be taken care of through the clk-rpmh driver.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ------
> 
> This is non-bisectable and breaks the users.

Of which there are clearly none, as can be seen by the node not
being referenced by any other one. I can add that to the commit
message.

This is actually as bisectable as it gets, since it goes out of
the way to satisfy both compilation and dt-bindings checks

> Should be the last patch,> not the first, with explicit notice that it must wait after the next
> merge window.

Patches to all three subsystems can go in independently to their
respective trees (except maybe icc bindings going in before dts
could spawn a dt-checker warning)

> Plus this affects all outside users, which also should be somehow
> explained. "Spirit" of some other commit does not apply here. These are
> different products, different users. It needs its own rationale and
> justification.

Yes and no, you're focusing on me referencing a different commit
while I included the same rationale it presents later in the
sentence.

Konrad

