Return-Path: <linux-arm-msm+bounces-37599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B99C56DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FA05B38FA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031152309A7;
	Tue, 12 Nov 2024 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VsRK3XQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443322309A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411627; cv=none; b=Nh/fyHY+o6ThXkS4FkZddAHEz2pRwsKqHYZcU8nGjdaYsZeQs64+cmcrckS/KgIee4/cxmHpxB89SM8CjfLKnHTT66teUSXywBoJltjK6j5WhMxAi4GSCNZMSrJ8vV2SucPcL2yUGcPISyGCc5HcvkcqPPUBsuKpWD1ZKulz5uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411627; c=relaxed/simple;
	bh=KxaQhaDuZiAyO6Feg3AC41pZiyIORCjAtHsmV3pJyWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLkV+ZerKQt0N5VR/T3tryZtrtMsdznYefqF5K2+IUarbK4C+6O4gFIf0o0vxPZbfbCv6Km2wBqlwRsEYAyE8CdYM3o0QH9u1E5tZBf72GdB1TCFqqokWVLAZqSFU3cDo6k//KKBzl+FuHSgSHIpuIxB0rv4CSPBK2evZAo/Bto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VsRK3XQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC2dnp2017404
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xo17J3nDmfhZSPKvOJosq8WjCwZmWfKsAtAkpMIoxoA=; b=VsRK3XQZoV3Qaxiz
	Q9lfio8zrj/8ir8uVGeIy+9rCcl2W7l264kN3FxJf+bDfbyZatkh/DgR6iPzl/mA
	qDUoek0Vy8qgSXiEdLklqVMIM3lkYjXecWGQrr/5of+ZB070m34IHzccIUG0al4R
	br4KpqToeuNee0FG05dThIKR/xrVPkNA/HKfhSSLuvmwCPCa3qHg1IN/T+QHYU4J
	/S7emzsiISOcxwrDeLV0YPsNxtQLE2UnC1UVZ2aoHQdBTThmtpg0NNoWHMbxAHde
	nmwdLx8ureSYELUj90pEoln59UKyMZ/5yT2XllBseirFztBQdGcmWX0WrHb0AUm9
	Wt48eg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syax754k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 11:40:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-460b5727217so986091cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 03:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731411624; x=1732016424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xo17J3nDmfhZSPKvOJosq8WjCwZmWfKsAtAkpMIoxoA=;
        b=Ix39U4al+BKIKTEASQ9RadQv/fsX6PFdn22xbyjzcmuSRyrqqK4AdaLpE+S2aDQ+Tc
         TaGabwlsf47TswPj9Qnuom5sPosCo/wwBV4gZ0IZokPxmqxwS3ZJ1A+s0I616sHMdNfF
         rraAymA007zNNmNc5Pg2VMEcDf/IHA6Xk7Ga67sOPWdrhsyjIEoat5QYna8nOBNWAlt0
         9ZIosFX43Zy1Wym0UvPkPrd+XOf1Av1yZssELXcVKVvQVpimdTN5gm4cdn5pKe2+122G
         MvLZVIQZACFE0pcDjPw82N/bC/+gtLll0AK5dA0cSBbLoF8y2l3gRzwcoHTdFWC90ps2
         J+mg==
X-Forwarded-Encrypted: i=1; AJvYcCUcZd7ow8dqkIVizok2L8j4i2BP9NIOo82OKQhzuD2qaBstrX2vlZdiRJ5k8npfQ46M7AR8IiZUe6H5VV9z@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvNB9vp8n/nCMsrpFjyBmRhfdQBTfGEbT6D8uANcrZeNer0DJ
	UZ++NQ6LqRQuAThxF4TvauHvdr3zqqevS/e1Rw8aVlMn4huOgV3++5dNirzaihKkixQFc8EztZZ
	rH8Pcz+L+KS3Zo2GTPLT8LqPbdVmiSCDMXmTdEXZixwiYDibfbeyVESR7hfY+mOE3
X-Received: by 2002:a05:620a:f06:b0:7a9:a6a7:dc32 with SMTP id af79cd13be357-7b331d892damr941127285a.4.1731411624422;
        Tue, 12 Nov 2024 03:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRxOKaLcHVl74+g0IUT+tVyhgvDU6Q9oLj6ryY0QEQY0OtrUF/lw6oAaYZepr4lAutVgAMww==
X-Received: by 2002:a05:620a:f06:b0:7a9:a6a7:dc32 with SMTP id af79cd13be357-7b331d892damr941125085a.4.1731411624095;
        Tue, 12 Nov 2024 03:40:24 -0800 (PST)
Received: from [192.168.123.190] (public-gprs527294.centertel.pl. [31.61.178.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2eb28sm703671666b.197.2024.11.12.03.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 03:40:23 -0800 (PST)
Message-ID: <2d5a586f-3e46-45cd-a4ef-324f5a94a331@oss.qualcomm.com>
Date: Tue, 12 Nov 2024 12:40:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] pinctrl: qcom: add sm4250 lpi pinctrl
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240612-sm4250-lpi-v4-0-a0342e47e21b@linaro.org>
 <CACRpkdZyupZmV+e=L0KR8ospH9P=wdUrMFvBnGXyfhLhW3-=PQ@mail.gmail.com>
 <65d76651-1956-412f-911a-046f0303a16a@kernel.org>
 <28ad9f30-7465-47cc-b514-41750a4c41ca@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28ad9f30-7465-47cc-b514-41750a4c41ca@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JQyi2xxsxynAcn-_Dkv9bsYXfN3picdm
X-Proofpoint-GUID: JQyi2xxsxynAcn-_Dkv9bsYXfN3picdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=772
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120094



On 26-Jun-24 17:18, Srinivas Kandagatla wrote:
> 
> 
> On 26/06/2024 16:07, Konrad Dybcio wrote:
>>
>>
>> On 26.06.2024 12:04 PM, Linus Walleij wrote:
>>> On Sat, Jun 22, 2024 at 6:49 PM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>
>>>> Add support for sm4250 lpi pinctrl.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>
>>> No major protests against v4 so patches applied!
>>
>> This was never sent to me..
>>
> seems like b4 auto-to-cc does not pick up your email ids from MAINTAINERS.
> 
>> We already have a driver for this SoC. 4250 and 6115 are the same
> No, these are not same,  here are some differences.
> - muxes for I2S mclk differ.
> - soundwire muxes are different
> - Slew rate offsets are different.
> 
> I have verified this before sending this new driver out.

I can't find anything to support what you're saying here

Konrad

