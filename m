Return-Path: <linux-arm-msm+bounces-83244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC7C84D39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 12:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21133A3458
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5916F3164B8;
	Tue, 25 Nov 2025 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dd4r46v6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5eUpsCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7FA314A89
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071716; cv=none; b=RlqqhUTj0oInp76hnU4tT3FWRnoBdYU5scczUy7409qR0WnD8v4CweWnjAZexQEJj4je51zWeCDuZLHB8nj3ft1AXiZf7YLUQGnWSqffCCpbVDREz8xBStvLPt3A4Ccw5RoVaPv8D5E7dmgpx8msOaPKTcwC+psfFLW3dWr+yeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071716; c=relaxed/simple;
	bh=X2w1pXQ3wOzpfm1MtQf0FRlR0OJ/ZV9nu9MlkeuxN/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLwQK5gmyyTOFNDBOSthQ+6zeM1YkqKuwsCUOLPtO5Dp1MprxjiDrTsSNr9usRjLjw5v/yzB0QMRRiIxV/N9o9UFWV52T4OXahSWGYefwPYmITadglqCjZojb9pRfzvvGo/9Ubg0+zMO569Iq+RI7oVCSRovrdNUZS0HgtSAs38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dd4r46v6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5eUpsCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9bbKe1232185
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EX3lIhyX2gZOrDpJ/jkVZ6OVS54BZtKT4oQmNI7ZHCM=; b=dd4r46v6M9a1+F4Z
	j+RJdQEbvyK9jzcxr4Tvh0Xkw9Vo/BRV0RVhlcVYSLIiwRq/UX0zdF22ruJXMQkX
	kEhAXX72jqp2Gu4ipwE3MlSXuOgecrPTTxtrleIesJbytRpQPcwVs39db52C6HtX
	0dvjv73Nu2Vxwr5rGHxqyBws22DhtXq/B6oa8mzqGh7kEoG/VJ8Y6qVc14yds3OJ
	8xiBVFWjERXgxEXSbZu86dGIrK/mGdIrxZTEsbypJu9962/ZgZi+omr6u8S8kB+5
	MSjUo1mqHygejlRt9gnX9/9YhRbaS0uWJ16LfL/VYSTxHpjrVW8CadE+Rfq8gxna
	PPiDYQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an0xyj1g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 11:55:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso6032498a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 03:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764071713; x=1764676513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EX3lIhyX2gZOrDpJ/jkVZ6OVS54BZtKT4oQmNI7ZHCM=;
        b=Q5eUpsCRukI9R0FB+wl1faH+LhJ8GdAlR1uh5uy8iMFWBT1yKjjjDhiJxDc+katunM
         FSzAkP6UztlvZCUuU1c+r8Y9tLc6gpFSeMUmQlOS6Hr51ALl3F551MbU7L2Wr/t+xCZ2
         hR/768dX2wJdhCIh5bvoiyhZ7JUyHxeSX9+oupxO72MqyvnMyvCEw5klS23ayw0yLuwK
         yXZalIWLJmjjmAnrEL7iuAmdIQ8/YXUpy4Gyvds7JMQhNq1iot3ZfXralY6nfhAcBhV7
         mpRPjqj18Q5rppayBlAzmQtiirv1WHC/KD9/CwjZBtPJL2Vv+7KJc9qRV7GAQzEAKG8/
         f4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764071713; x=1764676513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX3lIhyX2gZOrDpJ/jkVZ6OVS54BZtKT4oQmNI7ZHCM=;
        b=Jwboozbigrv4YiEiIubdzY/NfbuArUEc09r/xk7g6/OFGzr9xZjycsMm939reAxEVi
         se30GK2VA9wDNgZeM+VlGf0SYT1a40qU0Wfnhx8ZgTJefkUAZ2YoAwZwDI/rLzK5pHlQ
         EDJfoZFJcJ4b+v5p1s2/S8QpwhA6wmrOSIU/EyZ7tEeCw7ytXSyGXEZkmaNHlAlZHHZj
         dARCeMFh7wZ0O9eT4TOya864eL20FZWBALYYYhyL7WvufcOY1HG6DrkUNzg35JjEg/UE
         NGvfF9VookbLoGUjZgNrd/87nBNkk/6/zJs8vVznB0xK73gFHGcI1fKr5EYd3XIbeuYd
         Q7rg==
X-Gm-Message-State: AOJu0YyQX2RXZeZrWif8xMErKZHE6burj/m/MSBn/g9JY35LmsvLG6o4
	RqLvchDgQPfbbH46mZrOJ6goKeNqC/nm7vDcNJrrhnPmspOyWQ/MiVMpBzW+TDlypj4in3EMdcx
	93on3k3+zLG73dFB5q+4y9lK+Yp3M60NFvpBQicSAZCLyElFivLKL2gxndZguGKyz63i0
X-Gm-Gg: ASbGncsaRkiloBeACoX+yCxQXEJi0AHL+ZKBGg8EFB2V/Ng9nmi2KZp0m9/FDEYNrol
	FAwoctJa0BWQsKU0Pd38rdkS+BBhUWYhTKl4BK+n2EstfRgzA22uNxAO6XGAO//I1rd6Zl9wmNp
	aEx7VqLl0zimM4csJ1dGzjDBQlE+jT2yW1YZTZz1BtEHG/0dzE1ynkwnIjM/DJefh8UPV7od/Ja
	KErJt/Y7BGoOYEIZAjbbYLtumGSJt3gM8kp7bvui/Do//xz69sljC53lWTHY2mHrdf743aJYYVf
	TnxrqRz6a58JUgH0CHRPmo0PXHepD6J9HO1qRm8scVEMSDeOjIqH2D1f0+nwid4s7f7gx3LYLOf
	VL17rZ3aUdxJJIWBPzL4/ppziwHmioPlhnIGoz7DJJuU=
X-Received: by 2002:a05:701b:2707:b0:11b:9386:825b with SMTP id a92af1059eb24-11c9d87a6aamr7594703c88.48.1764071712851;
        Tue, 25 Nov 2025 03:55:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw45oA/mvsdXvi+gN7JovbQ9EKlD/rSIN6KTkzXnRfByxmIe8IJTVaxi3+3rUvsNuxw3H7DA==
X-Received: by 2002:a05:701b:2707:b0:11b:9386:825b with SMTP id a92af1059eb24-11c9d87a6aamr7594675c88.48.1764071712236;
        Tue, 25 Nov 2025 03:55:12 -0800 (PST)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11cc631c236sm9969445c88.7.2025.11.25.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 03:55:11 -0800 (PST)
Message-ID: <ea7b151d-7b32-4ebd-b3e0-3fe4b62f702d@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 17:24:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
References: <20251125110420.2192971-1-krishna.kurapati@oss.qualcomm.com>
 <117f95a4-5f31-4372-a2e2-a0a969dc3d5e@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <117f95a4-5f31-4372-a2e2-a0a969dc3d5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+bUAYsP c=1 sm=1 tr=0 ts=69259921 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FfFesAWzzNiW6piU_54A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA5NyBTYWx0ZWRfX7dv5gXEQu7sv
 VMnWPL3x1Op64P/W39Mpd4w5tF6wue9Juxgs/3UhXy/cMjZW1DNV75S6WE97mXgg/FLXM1YnlCg
 4u4DpXeJdGZkHTW5B1iWv/EbZSpt1y/KEpbZCMYhbIS3pzNou9kFqUlRUe+ivqsaxyzAk0rDDf5
 pkxcB8QgJsfUF/Kg13VODNg7OQo4v97KloyULSyH6hQbDRniD8uIld8aErZ4MVyPxEvo8D+kS8I
 +G+ZfjgmGkjBeAxH2VRmyez7SMON2NnPp2X2ZUIcSHL2cY0e/TQ1xTPqQjWIHbJyBEIzhTjaOOO
 MdzV3dCxVfcIIi2GwFQxctbhohwGxkIW2aZmBDPoc+FQcw80tqkVKCigPtYEQCazVYZ7kwZ4Qcy
 r7ng35WApk9IKuMnp66h0pw8t+Q60w==
X-Proofpoint-ORIG-GUID: zDeVEkcPFaz0ptyapa6sIQU9PqrTEuF6
X-Proofpoint-GUID: zDeVEkcPFaz0ptyapa6sIQU9PqrTEuF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250097



On 11/25/2025 5:09 PM, Konrad Dybcio wrote:
> On 11/25/25 12:04 PM, Krishna Kurapati wrote:
>> Enable OTG support for primary USB controller on EVK Platform. Add
>> HD3SS3220 Type-C port controller present between Type-C port and SoC
>> that provides role switch notifications to controller.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -4026,7 +4026,27 @@ usb_0: usb@a600000 {
>>   			snps,dis-u1-entry-quirk;
>>   			snps,dis-u2-entry-quirk;
>>   
>> +			usb-role-switch;
>>   			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					usb3_0_hs_ep: endpoint {
> 
> The patch looks good, but I'm a little puzzled why the endpoints of 'usb_0' are
> named 'usb3_0'.. This will make the DTs look like:
> 
> &usb_0 {
> 	// foo
> };
> 
> &usb_1 {
> 	// foo
> };
> 
> // usb_0 children
> &usb3_0_hs_ep {
> 	// foo
> };
> 
> 
> &usb3_0_ss_ep {
> 	// foo
> };
> 
> // usb_1 children
> &usb3_1_hs_ep {
> 	// foo
> };
> 
> &usb3_1_ss_ep {
> 	// foo
> };
> 

Shall I rename them to "usb_0_dwc3_hs" and "usb_0_dwc3_ss" ?

Regards,
Krishna,

