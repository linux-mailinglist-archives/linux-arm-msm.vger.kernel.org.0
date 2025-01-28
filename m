Return-Path: <linux-arm-msm+bounces-46361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7A2A208C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2821887F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 10:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874B919DF61;
	Tue, 28 Jan 2025 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OE0hkKWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535119D07B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060929; cv=none; b=VadsuGqS3KBiv/51GAuhERhUbIJb3NBZqWZdsqsqfaAJiQIJ6IBybP/XFGLGTFWHnpBO7GaFrVtPMY6fDy2hs0LcdHkyxdp8h3qgibxnuxP7Qjcj+cOmOGeBNBh6EeZ56+gOuBIevXMhSw1TjUbgguzQmxXYx4XiP2otHSrG8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060929; c=relaxed/simple;
	bh=TWZx+hdsqOJongWH9MAYuozp8hLdN8IXfVJokECRQtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wg2uASNjyBXwMIn9tzjhiTO2jwE7zJUQ+LieINm9qEArZ0p3nh30eyHQhfnVonD4y/NkGgFzt3WEBjaZn6eAZsi4sq7jqjLNZBpJUKYeCQVrxdqvWdrCoK/IdimrHO23N+P//D0aYlzanAnwT4jNxEjh2kQOZOfow1bRkdhvLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OE0hkKWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S8hVlK015015
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 10:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ca3kdQ944gXMOLUhcRLkn1E2Fbras4V85HTSRk08Y6o=; b=OE0hkKWlQnlrGuSL
	oMax9C4s8rAP9JvLlkIhiI17GTXnjeK+Mi/jFq6st1yDF9YOxGXKU94mp4TOY1uM
	ZR/6Rv3gNdbM8R5kD1tCegj9dphl+XOH980eNFw4cNgN7aFPbT3nxXdlUYWKHR+P
	w4qQHaVDihp0r/vhwCN75Hk7n7S4Qk2UDN77df5cCsOz44BQ8XACpejmGbN9xtXF
	pKkb9j1gY2RmQKL1IOh99Yo1MKVBqYIx2pdEi1BIoC6sVZUbBhr7HNXN5UW8JwqC
	Wkel5Oec12et3yLSMDHCcnc8RVKoSiy3k0Wl+aSICGGsV2xwn58VmfVhzb+8+Z5J
	POfY/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44euyq88rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 10:42:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7be6f20f0a4so80994085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 02:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060926; x=1738665726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ca3kdQ944gXMOLUhcRLkn1E2Fbras4V85HTSRk08Y6o=;
        b=qm9NEc7krPTabfCWSZ/LZ7jq9rScODVJA4NCf/U9NGUcn9ipY1z6lpUnDZqGGfPkte
         aBvhmDXD+R68BrbvwpVFQVGdgLuK+vsd2B82/Alj7fHKFucxHlDWFtk9UqMrFa398Xhw
         Tzz1VogdYQo6+3khvcp07DwtUTpXUodmQt//JM2Vn5rHcomlBYKE/mvNpF1fmxR3ImCt
         n42Qnna9RF4+tkTGEuLwym7MhXuj7DoXXWaMJz1+0IOnaQ5sf/TOoNCsPcbDWml2oi5y
         3I4ezon4B1yqnsGg2At24YVvYULTfT/KvfdnqMhqLvurDuXYLuV4+fYInAatVkR0t4o1
         +OXw==
X-Forwarded-Encrypted: i=1; AJvYcCVVb35yCw0W0es78SBRKpB+3YD5rj8MkICO7vHhS9wrG6Khz0N4+j00q0XkE+0yRxH791hSH+e+Ljziz1qp@vger.kernel.org
X-Gm-Message-State: AOJu0YyvszC/AwEgQ13TSeQ0n31P+BMz6kkvPJekLj0V2uksMJu0UAUx
	HlbWpzlWoFTZ+kDmtGqhLqZmo41r8tPjPZUOL8tUz3HcvSf0DNf7z59GwHi/Tn9D6YxYTJgwtIl
	uWtxn3tlFEsN29KQixmn247hfFK+b15pHdLmL30ZK0E4DbYOeLOEVnlFJIeyrqk0q
X-Gm-Gg: ASbGncvvlhhtmJMIZdBBDzkLjZ5znids8UWfHt+X4lhkKN2A/hnBDzS2utXBRFxHp1l
	1D5+agbLNwcZcO29i/+DOzTCuhx3HTnLDeLhza1qIL7uKs3DUMkVeFajtlMFhaNx/sdhZ+MejJ9
	55CCAxjoAQ6gaTm+CWG5lmiEDvE4+Nnhf+BaBUAFZ81o4mdUiz9Hhv+zvbUSuQ5pgR99CXZGmhr
	B5zkZlUQpJCSMuukBQd4hQtAMmSdcxO2sFh1pce0TXaUzr3HUplpILhrmNsN6eX1Oa6iLz1mL0V
	2Jp2CSFUmC78kMn0Eh5iSGPIA2xLxEyMulQHhe4CSD77NA5zO3O2VbMY6rs=
X-Received: by 2002:a05:620a:404f:b0:7b6:cf60:396e with SMTP id af79cd13be357-7be8b35e042mr1319128485a.12.1738060925699;
        Tue, 28 Jan 2025 02:42:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4l6gG9CG2cjmev4OStWIjZAgwyqC0chC8KCrNDsjvfA6SkAvv5euLdk0AlV1QlCp1ESF29A==
X-Received: by 2002:a05:620a:404f:b0:7b6:cf60:396e with SMTP id af79cd13be357-7be8b35e042mr1319126785a.12.1738060925338;
        Tue, 28 Jan 2025 02:42:05 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab682c0e7b3sm630982766b.83.2025.01.28.02.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 02:42:04 -0800 (PST)
Message-ID: <c0534cdf-7f8d-4db5-9da0-ed03b8d66779@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 11:42:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
To: Bjorn Andersson <andersson@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <Z5fJFRMHIvKoN4cE@linaro.org>
 <hn5lcdbdmvdntmufgvzju2xsvxwplxeoechzgtxgmqkcswooxc@6zuqbfyriqnc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <hn5lcdbdmvdntmufgvzju2xsvxwplxeoechzgtxgmqkcswooxc@6zuqbfyriqnc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e75vLO8xa7EpCKxSboxX2lIbFun-NzF-
X-Proofpoint-GUID: e75vLO8xa7EpCKxSboxX2lIbFun-NzF-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280083

On 27.01.2025 11:40 PM, Bjorn Andersson wrote:
> On Mon, Jan 27, 2025 at 06:57:41PM +0100, Stephan Gerhold wrote:
>> On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
> [..]
>>>  118 files changed, 8389 insertions(+), 670 deletions(-)
>>> ---
>>
>> This is quite a lot of code and new files for a temporary migration.
>> It's also difficult to test these changes fully, since there are
>> separate overlays for each SoC and sometimes even each board.
>>
>> Would it be easier to just duplicate the dwc3-qcom driver for now?
>> Making a copy of the current dwc3-qcom.c would be just 1000 lines of
>> extra code, compared to more than 7000 for the overlay approach.
>>
>> The copy (e.g. dwc3-qcom-legacy.c) would keep handling the old bindings
>> with the existing code (that is known to work to some extent). We can
>> then improve upon the main version without risk of breaking any old
>> DTBs. If we decide to drop support for the old DTBs at some point, we
>> can just drop dwc3-qcom-legacy.
>>
>> This approach is also not pretty, but I think the risk and effort would
>> be lower than making sure the overlay approach works on all the affected
>> targets.
>>
> 
> I like this suggestion.
> 
> It's much more isolated and we know the current state of the driver
> works with the current dtbs out there - so backwards compatibility would
> be handled. I also did end up having to use separate compatibles for the
> old and new binding/driver, so this should be quite clean - i.e.
> nicer than the overlay-based path...
> 
> The one drawback would be that devices that isn't updated to a new dtb
> would not gain the upcoming improved support for role switching, or any
> of the improvements in pm_runtime-support (as I assume we'd only care
> about the new driver). But I think that's worth the saving in
> complexity.

If a user explicitly decides not to update, there's only so much
we can do

Konrad

