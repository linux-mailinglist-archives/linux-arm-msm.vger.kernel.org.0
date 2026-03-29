Return-Path: <linux-arm-msm+bounces-100636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAMtJWJsyWnqxwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:16:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47E353935
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 20:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A838030013A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 18:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC91381AED;
	Sun, 29 Mar 2026 18:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnnGnu8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp2mhHEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F43815DB
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774808157; cv=none; b=dAWLQGLvFq4lxD4EMYnYTVh9x7NT54pPg/lSENiMyqbuUWsbCZ+GmjlXPUeh4+HeoTGu4YPoWDMU7qqyvYVPJehlHpO5dpdl7zh5A52Qis9Ek7RjhIfGk5FTptAp9UeVXPa+Ra91wAmGr52FGLB6clgxPtzEedNl+Ma29uTBajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774808157; c=relaxed/simple;
	bh=y50ZCs8bU8JQGk7/n2N6NuoDk/aWdBuPYonIlgfj18s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRDpzD4nlaNzrZeaOnGBrtQldKsR2mtkPhpSlgjflcpFdYm8z/vK54pzJGOiquKSmqA2NW9jKHa8Fm5nkYx3I33ukmM074S5MVVDB6FWFxzppCw0XtahXN0A6qZGldkiE7DFp8AWaBq3FQZSvhLk/V2B5PXxS9tM9u8YUioOlxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnnGnu8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp2mhHEF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhaNW3931726
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bvGqX0pq5rUEz06cGfEkc0o4YS86YR3DLMVjyiAgZs=; b=KnnGnu8sdWUKWT9M
	t5qqlRNUtax5HpMqdxFWjcITggDsRPwiLwpNv1yk4NA6PMbT2U6/mR2iUBE0VdJB
	gpwfrVsn8flTQ4kPgpIrLC8lbp6MeqE230DRmg7N8rC5HFExDS3GvSP0kuq/Gbkn
	ERUs0JTLwJcY9yGtVq9z9c8fvt9ckpNOZPa+smf7GUGdpQEnvskroPCx0oXfs0Tx
	t0Rt+RSy8nG2zaDSCf/iq0xYAPZrjVoWV29csXD+oO5TMEhMoA8PwJ8LuGBZicZN
	3pmQtEdk6y8NaZZHq3xTMvyTrlddfGoAtYK7sTP2NYuVdV2lbMnjpreh0ChwkMjC
	Mgcbnw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdbqc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 18:15:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c1631e6189so13234424eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 11:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774808154; x=1775412954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3bvGqX0pq5rUEz06cGfEkc0o4YS86YR3DLMVjyiAgZs=;
        b=Bp2mhHEFIdCfhKm50N1WW0VDw2fbapeW2c4S6fLEsOCFPfxKmVwHwmlA5uAucROKt7
         GScCinytkyMCQy7VHN38p7eNPimm5QlUea9bPLr+GdVNnm3JlxflJghLOCXrCuL9IxqZ
         9tf1eu7IDawdXTplgY4/xLnc2iwoDmoYQ9ZiG4pEYic9NzT/rkzEe5OIk36grKiv0iM2
         u/s4BPkOqK2fdix/v/87P1YFddaT5WIoxBYwgWG/upxaLutfBQcGIoXaYjY8I+BjxDTb
         1XjlBg0dBHp9OrWLKesQfbLrViKD0evj3xcqepjKjhbh10xs1dZoX6QE6cUt9favauL9
         1smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774808154; x=1775412954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bvGqX0pq5rUEz06cGfEkc0o4YS86YR3DLMVjyiAgZs=;
        b=KG51DgPfinReQukWYBPz7RklsuRD21oEBgmxuLgJ88Ny09p6K2mtJudcwBKlKLGtIN
         nqrtR4BdVcvX5E2w/E3n/APiFOkZf7WeJO06icZFXIb+uryU5gijyj/zqX3/a3sYjQgf
         icPrBV9qGm+nIyBhE4yxcxTGIi3gsz37q10PTV0axxekQzLeNjwpYCj1AAW/mz5qYbKT
         UOQmdNmUkFWXhH+x6UnJ9WsdpJircEgke3Q9hPHnU8ERZNrNnJivnsDwgvX19kckai5K
         bJcw3amd58DjhciXt1K/02hAeG8+scoBkLnxSCFzlDmeZEJIV2DRgpp9sObqa7hSvvkj
         cyjg==
X-Forwarded-Encrypted: i=1; AJvYcCWJFHk0McLRvBsEIF3j+uMGpZR7MlDsrawy2EXYJ8X6gSJXCMYzofBrTQ/Cm43KG4N8qoVGZOE2HbvC5DWN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlya8lMosGxJ0JFXSU4IeF7PtJk25BFc1WYJbcZmnhNCcz15u
	jGi2L1CJW0dP1cgelXnRxXFruSZQOhHbuXTUC/PDFKjv4cUZ9d7vEJOo9iFqbjSLY7NNIjG+FcS
	nicEJgvDJGuCIqj7rJ57c/iI9ShHI54UECiXP+bYzCN+xpXHrBuMNDLuME5iG96oWE3XJ
X-Gm-Gg: ATEYQzydz7dKp3NDOkXioUdmFKOXA3A5XPOjcxh5WKI8RYWlLHQWefLhCTr/qBXdsPa
	5As0BQ6ALef9L5Hu8XCxQdgbGXS1AG1AsyyLgbQcF8XTLzBjEPjSvsnnLksHuta/m11fZCT8iyq
	b8j4yerWrHN9MCOYe3P310I1zokIzS9D8CmrA9FVunjOAFSXY7oXoO2miMHBn65Wm96pdiSpaMC
	8STgMy8lzERiKhdpQ3W/EuruvXcKA3jPiGXKO6ZS42P8XNCWkcQfuK6ZKMbDEbFtXvsK7Q0XGNE
	M8QD8PeXdAFgXL7BSvaL5T4yQ7g0V7Kvme+JibyL09zLyOi3RNnnC6LTY4ZC9FP+BlDhH6YENQE
	PdL1OH7qbjSEWO4e9iKp9+uX9bwegPU8eAK9upVSA1urT/5qm+qIHa931gw==
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr5237858eec.23.1774808154518;
        Sun, 29 Mar 2026 11:15:54 -0700 (PDT)
X-Received: by 2002:a05:7301:129b:b0:2c1:5b23:1752 with SMTP id 5a478bee46e88-2c185f5a3c7mr5237845eec.23.1774808154004;
        Sun, 29 Mar 2026 11:15:54 -0700 (PDT)
Received: from [192.168.1.3] ([122.177.244.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm5052425eec.5.2026.03.29.11.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 11:15:53 -0700 (PDT)
Message-ID: <eacea84c-ce3a-41eb-835c-7da55d130d88@oss.qualcomm.com>
Date: Sun, 29 Mar 2026 23:45:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-4-krishna.kurapati@oss.qualcomm.com>
 <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <qycxxxlt3koyt7snnwpkmpo2udskhad3l5vjpj3mpdi5qyoriy@akxv27lrpi3n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sbQsc3YLDstJXwZYuXBGXEw1kABc2Rju
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c96c5b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=0PkvaV8+DZ6AO/3G7kZGsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9EumiePKSsg7Rv69g3cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: sbQsc3YLDstJXwZYuXBGXEw1kABc2Rju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MiBTYWx0ZWRfX+IIj1YzDA5CJ
 FgTmWgbIr9/PDuUWhOufLuTjSvuTgqaF/z1GJGgEQW97mMbIC2glaFwQIW2qgWYDRwmdUltIyi/
 a6W7fTMoeRICLwEdTzHsoQWDq/jgr5hwtVvp3OhVQHMroVNCFJ4GRkcLRriZVKfTU6wB9b2IWNJ
 /S3jGai54wUYXk2JdRWnRQ1jv9AQsTovv6+SjV+AiPfpucsv/aU5zps9xpZ30TYWVQOKl0aV97c
 FIte8e81f9HrYDbIsM96vHFoiUnWtvpjDM3J4gq5yw/NVZd/H3A2CN0l/WFDVNaxP+bKUQJNXTi
 1o/wiWNoKMjjb6bjHSxIj7uhmPw+Fgh83SjmvMnkAfz6axDFgw1cy2320PcNs4yLFEce1qF4UMO
 oeslXZxOBUJSJMM6zuKIE8tVvwvKbgPWkaUa0EahQso9jzy66C18GDFxof5BbnGZU5W3Fi9WNaC
 9XfKnpG9pDVyMasmf+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100636-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E47E353935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/29/2026 11:37 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 29, 2026 at 11:22:49PM +0530, Krishna Kurapati wrote:
>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>>
>> Enable USB support on Kaanapali QRD variant. Enable USB controller in
>> device mode till glink node is added.
> 
> Why can't it be added as a part of this patchset?
> 

Hi Dmitry,

  SoCCP changes are not yet acked. Hence I wanted to get the base 
changes in.

Regards,
Krishna,

>>
>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> index 6a7eb7f4050a..1929ea273a4f 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> @@ -80,6 +80,11 @@ key-volume-up {
>>   			wakeup-source;
>>   		};
>>   	};
>> +
>> +	pmih0108_e1_eusb2_repeater {
>> +		vdd18-supply = <&vreg_l15b_1p8>;
>> +		vdd3-supply = <&vreg_l5b_3p1>;
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -821,3 +826,25 @@ &ufs_mem_phy {
>>   
>>   	status = "okay";
>>   };
>> +
>> +&usb {
>> +	dr_mode = "peripheral";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_hsphy {
>> +	vdd-supply = <&vreg_l4f_0p8>;
>> +	vdda12-supply = <&vreg_l1d_1p2>;
>> +
>> +	phys = <&pmih0108_e1_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_dp_qmpphy {
>> +	vdda-phy-supply = <&vreg_l1d_1p2>;
>> +	vdda-pll-supply = <&vreg_l4f_0p8>;
>> +
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1
>>
> 


