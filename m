Return-Path: <linux-arm-msm+bounces-97328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HAsLLy4s2nbaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:11:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9C27E943
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 503153047401
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8AC365A07;
	Fri, 13 Mar 2026 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JptdMm7z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhaE5oMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890EF364035
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385696; cv=none; b=oM0lOI2BeUO2DZvY9ZwM0mYgQ2c0P16i8v/0j+Sd6OZAPBrLAkAgqfKUmA59Bmk1MwD40hxt5i/w+XqeVEFGZGpdK5eduJnfMiTzcgDK8Mu5724qEJijj9KX/2SYExNiEd1SQtJYgss9EzD+akjWczJGP/BOLGqpMUIeCN1fFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385696; c=relaxed/simple;
	bh=HvJaazv1XcKV/l0L0yljDf61dGUaUJebcW4wYBKEeXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8j/n4fqy4EB7qIn7KsyqzQHw8y2s0qMrnOWnz62YME9jrfF+UGcBc+tEjvw8upTh3T9KzpdoTlFJYwPcMr8BLmHLUfF9AsVH5eVMfS4mmNY4slL3DRTaSSy7RMHij05ZSgcJ9xnPsntxfXNkCYLvqT3peGvEBI1NoGISpV2QCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JptdMm7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhaE5oMK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdjx1574564
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T836YK3pUIQ2FwXv9V4cJcvHpdt09Drk+iUU3wSflMc=; b=JptdMm7zxT5/0lhn
	FT7bneTGo2AEVkdh0F4P5661lHKuzqRrh6WQ/uKfDWPwy0XyUNZj1584u1TgPdhG
	s2DkuRAl2vWFmSKqCznc0olmmOI2qgQHrn4e6R5fs2lcfqjS+tFRBVAV+xrvlGgT
	H4zoXTVK1M9rmyv3VVTmmenGUsJmNunCQHdRVIVQ0ksEdViUQjsa/SOjjA/0xdk1
	IZv/WlzPDqddoNNMOzmVA7E4SDWSClm5zJ+7kQ1JS2SDgWUKnQJjXrFRpqyMcxQL
	xdeqg1rid30ML0wK7wcYR8Gheqmk4uvDPF1VG9e/95TUsxAZJNfWRoU1xjkSKTL3
	sGVu6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53mwes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:08:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7381a95fffso1157434a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385691; x=1773990491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T836YK3pUIQ2FwXv9V4cJcvHpdt09Drk+iUU3wSflMc=;
        b=XhaE5oMKpdJ2ciitV6/jrJk0+sbKMDJqAw021T10QEdvWKZYMtciYVEgzVn3yIvPNs
         Gjya+l+B3+VUQMOK8hvtOgsbaL7LV69X77sb1wm+v5b/SuU95J5O/ORbP13x2Nae58Gi
         yCaNSQFA6qA/xbryak3iZITq1LX3LDDw/vGDXFugPEtepkAtbnvifbvCRlEvUa7mfJTf
         LhG+4RNXrEwCy/GQDVATyje9n7CZos4uaAmY/unB9svyZxrW0gCKMsxQP3sw3NeX6HlU
         El+NwwCc2Mw18qeWkUQLCdwY4ncwus5l/SeAWt8M1+1HhMVOtBwTYAscuSS1l2FpF43S
         0wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385691; x=1773990491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T836YK3pUIQ2FwXv9V4cJcvHpdt09Drk+iUU3wSflMc=;
        b=Pa5csNuV5v18daWNoQxwqCzFY4LYcJWtattfPNFabXbr8rX4vz/s3I6t+rS6spfBg2
         NeYd2Bvfgzjxxjw26+vrS2U4k0oRnfX/I2olkoFG2MV4XlGGHsYKVz0rLYB9/yZ7aApv
         mtb+9u3P2K9Ge1g1ztmitNi+yxzQoYEn8z8aTAhfF7u5wtESpCWwutCmJS7af+wCnzvq
         4HyI+9hHq+DKk8GYG1mJU+Wq2P278t9XS6T/a463mB7f7uPqNvKTBgdlBHsKN+yY+PDF
         bA3pFCsqLI0nIhIVeza943dB2ipWWmxBIg/hSM7XCpl+1dhDoHv6PpFPMSP1y1/ytIit
         s21A==
X-Forwarded-Encrypted: i=1; AJvYcCU1tjAYuO4mCd6GBpy0XeAJd564v3eBwch6NNrHcvTXf8a19maamIjICaBnvhBoVj7QVT+kVKshIhnHGjCL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBGUiun+MdhIIIOqcq/Ajgt+IMkuMPoZeSRhUfAr+m78ojt9Fc
	ts/hQApHZEI15FFoSBA+jjal/hhEO7PYYTPBVbJcoGRmo9VG1AeB/tTW1NGPrlpKvEnignNi3Cn
	MEkyTbMBKZDoJHYA/8RlSorvotuAvqhLIB7716pt0ZY1hj1YwE0S8KDDaeEVmlkoFlEkt
X-Gm-Gg: ATEYQzwcklHex/2aFBLbaXzm8LZ3b3F9eXhOr6BOfrrbbWxZky2q98Feo/Mn4fUF//r
	vTsJ+jiUebgeKN81ItQOD96Aeg8VRNL2YxuQDQONEssIMgaQ0LeKTLZO+hUijTZ9pQCjcmJSHXi
	ZoAnlLzem/hoL1szl8lzqsRLefr/o7Tl1SIOQUcio0XvUKGwk1CfcgxnPQq4ZrBfAbV4kwCH124
	LWvjZuY9cq2BcBPPERMFglO4p6OJGUe8HCMFZAldOERpypjbZojKpHL9T7YHPV6eBwH7Hwp1ac4
	QrxclOiIvCU0VrfC2uZiM3bFNDjEPpy0PDWcYGXrX8YOcO22n4RWMVH8eXnCdzt157wMo/z6OLp
	e4r2JPCNuNBIENrYIir83DOPe0yImCqrkHh8jppkrkbp59tONFEs0tJFr8g==
X-Received: by 2002:a05:6a00:21d4:b0:829:9cf1:642a with SMTP id d2e1a72fcca58-82a19911780mr1836685b3a.47.1773385691407;
        Fri, 13 Mar 2026 00:08:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d4:b0:829:9cf1:642a with SMTP id d2e1a72fcca58-82a19911780mr1836652b3a.47.1773385690789;
        Fri, 13 Mar 2026 00:08:10 -0700 (PDT)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a1e72cf33sm960207b3a.37.2026.03.13.00.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:08:10 -0700 (PDT)
Message-ID: <ca27e82a-beda-489d-979f-f99c778c97ff@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-4-gopikrishna.garmidi@oss.qualcomm.com>
 <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3b7dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=q5pbYkwBJr7ivJQeOZAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfX7qnutAhyO2zf
 JE/ZHgoYSgMmeSqCWl6Hd0lbWYbhSRXL/Vfd0JAIWv6OkT15Iknd94PmlOosyPZ6egufs/7iukL
 HUK2KHNUIhejtdx6yxbZc7SpHaRzBq0ICygGoKfd9nMkiX3EL+GOZ8j1yCpcjpQxpHUOTBIMbtk
 dxp282EWQOTamcAv4QGZwrl8SV6/cJJtkPI1OgM2Zz4yBXjxMd/bUa1LtoOF6FChQCYK+d8FFm3
 L4Sqzl8LfLwp5JL3wi97XXTyCTAore5KI5i/OcgE3Akpw23Z8js5xv3NlLVmiTSt2GGYe7Vs27u
 nS5TDprD0B9bKgCKLH84MFVcgieqKS77LMHUWLdEFyDmRyYXZvXkkKnyLBH2x1TttoEMA24KgWR
 NGKFvjuhQf0AJK4dsDc/ciq3rud5I6jrQCd2Sam5rKFfYln4A0pq7stAosTGndCzBcX1skyjehh
 +Ovz6Plt3zP+X7zKjqQ==
X-Proofpoint-GUID: _ovKzxtP8kUzPF09TSzg4D_PPb8vichg
X-Proofpoint-ORIG-GUID: _ovKzxtP8kUzPF09TSzg4D_PPb8vichg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-97328-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53F9C27E943
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,


On 3/12/2026 8:32 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 10:49:47PM -0700, Gopikrishna Garmidi wrote:
>> Introduce support for the Mahua SoC and the CRD based on it. Some of
>> the notable differences are the absent CPU cluster, interconnect, TLMM,
>> thermal zones and adjusted PCIe west clocks. Everything else should
>> work as-is.
>>
>> Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile            |    1 +
>>   arch/arm64/boot/dts/qcom/glymur.dtsi         |    2 +-
>>   arch/arm64/boot/dts/qcom/mahua-crd.dts       |   21 +
>>   arch/arm64/boot/dts/qcom/mahua.dtsi          | 1040 ++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |    2 +-
>>   arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |    4 +-
>>   6 files changed, 1066 insertions(+), 4 deletions(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
>>
>> +
>> +&tsens4 {
>> +	#qcom,sensors = <13>;
> 
> This matches the value in glymur.dtsi

my bad, it is supposed to be 11 for mahua. It is taken care in below 
thermal zone list. Will update in next revision.
> 
>> +};
>> +
>> +&tsens5 {
>> +	#qcom,sensors = <15>;
> 
> This one is indeed different.
> 
>> +};
>> +
>> +/ {
>> +	thermal_zones: thermal-zones {
> 
> You've completely rewritten thermal zones. Can we patch them instead?
> The difference would be more obvious this way.

Out of the 69 sensors in Mahua, around 27 sensors show discrepancies 
when compared with Glymur. These differences are not limited to sensor 
ID updates alone; due to changes in sensor mapping, some nodes trip and 
cooling binding require node-level updates.
Additionally, approximately 23 thermal zone sensor nodes need to be 
deleted individually, since Glymur has a total of 92 sensors.
Considering this, would it be better to delete the entire set of thermal 
zones and reconfigure them specifically for Mahua to improve clarity and 
maintainability? I noticed that Purwa followed a similar approach.

Thanks,
Manaf

> 
> 


