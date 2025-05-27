Return-Path: <linux-arm-msm+bounces-59619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A84AC5BAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CDCB7A25C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315B9205AB2;
	Tue, 27 May 2025 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnfr5HV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1520B812
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379258; cv=none; b=AbxJCQ/D61mcibn/NqiDceQlcVHA0doF3v/WjkuhYgLirmuOUznLY7hcO8kyxDB1ik9ywli/5H3F/BzySHSW5WIm+ydwcN+gk24Pbeeo4LGHyqb57t/SU0YogEJGePaebI16z4FQcNkjOhW2xBrsmDl+9Z7X94XYjwOfvUJ890M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379258; c=relaxed/simple;
	bh=x8NuGzFOSErHZizOdXNvwT7+7fsWsegwkvk18Atp71g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHqVXOf0wS3ePhBSwsj5DTLwcUfjZSxMBc7NRbAhNndjuiYlkjUJ9XMNZ4hQiaKFwwkN3cGhh403YE/W1kl4ckFu84jPaKg1VsCCncQYo3c+aCCLnFbhh3OfAjtTIr3hzILNhQ7B5JkGCSzLi6H0r/Cb97KYRMtCkAuhC4my/bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnfr5HV4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBS1HX023008
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0MLzjuuVObqloiYcLgpMb9z9bl17fMINDWXVZxXoJGA=; b=hnfr5HV4p5f6kB27
	zMMPvQ+SM2fXgJPx9ZL0sfNCqCfx7/BqdpaU0WyhXFXTGSsc9Tp9QzwrxFHIOSLg
	l4Pxj5cQnjSXi5uVebfuz/hHFhKYa6i8zgVVzXxFs/1LRku4iFAEhIqgiRhC7fw5
	7cX73LATCmymNkmWK3YzkOWByW/6tMlNcOBpItRI4rGiQ3/mu/NiGXKFdlid1BbL
	3odRKH2n0X1Ai9ryDC788zNa3DMlwnhPKMF3Wm7O6J5zZhy5wA4yNngwQf2n6OAt
	fkoVVBBHke1yeBWRfvJvvSb+zgTdOyvJzLVgWYK1vPg8gka9kJo3kfzf7nwaAMUk
	Smi3Ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjr81x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:54:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7789335f7so22741885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379254; x=1748984054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MLzjuuVObqloiYcLgpMb9z9bl17fMINDWXVZxXoJGA=;
        b=KJz4TSS/E1xT7p/YKPzNJsptEKapuJf91bzJWdoF18HKerCQ2IHGENliaCz/ywuhGh
         B4KK3OeCMnR8HVdtx0BrYePSEbxgTE7MDwvdXUlIJihsQc6OkxShWk2EPU7e+Nj0WAKz
         FG3OMUjsSnp6DM4PyslD0yjlhd26wJ0mC1jfXuAReCiXZ1VKKlTQAvAVGg7CI9NyZStM
         6Ry1YlnQbHqvBkSVhkyod6XXXHEwEB5/TznLeGipd/jQ90ty0+6P3Piz0LWtIO4A0NiD
         3fC0hxLVQUsbGQq0W7lfEVsKOrNROioPTcTAi8849mOej/oyck+8Q9zky+U/QoQxEmtH
         KWTA==
X-Forwarded-Encrypted: i=1; AJvYcCXGCajSbhjLCMXHJx0pnmRk7xcUSvF1AS9P1iiWE/d6WhMM0zUNxy1R23oDg84Z9h76Ub0dFZIlipCAm0sT@vger.kernel.org
X-Gm-Message-State: AOJu0YwVaC1aYHIfcQtK5VJ8gns7Fee3RDhHHorwlYVGzQHaiwoZg2eJ
	4qUFEpAMp3Bt3uWsxyX0N+kxI6lyPYsK71QP8buJd/W/SniG6rqwkmn981p3NdNQN0XCgnFUqAb
	cpwdYKqg36OMKAS5/4AFO9fWXb4NVZwM8oN5F7i8GArQvh2kd9NWYagdjURMNBfmlOr+f
X-Gm-Gg: ASbGncuRUgCChQ+s1NAJ1A4wkYyWgpbRuOaWCFSAndVQa8kGvhdLCTnn3scMpkT8dAW
	lYulc5BpsEJsLzfZIRGvB8BYIo6roWjZ1167T7hUFHxzA5gYfNj+1UJgwFCUD8qyafIJu4CFe2/
	CVECn7TanvQzAYJxaM5mJ5/NVkIyHinjF4VVHvFLP8cRqwgAJ9a+tX8qQlBIDke5U+GP5Q+7x6f
	cvOrYtrYQ0X13dJiDrw/XA+INCTwTai0oPdoi0IsbFKcAL+eG/eZrgQRpfHxel6bDMUFCBZhC/s
	Tj4QHpEdx8m/3MspYweHSo1W/tIdCTtfKp535SagnwPvMyx4ryinzl7Y4sOLOwp8/A==
X-Received: by 2002:a05:620a:440d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7ceecbdfc9cmr770967085a.2.1748379254577;
        Tue, 27 May 2025 13:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzG8DcC9twuv8rHM2dj/oNwnD60Hpxn8j63dRlP2mWIaLz8ggRGfIMDRDyo0xryvLC/8IxuA==
X-Received: by 2002:a05:620a:440d:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7ceecbdfc9cmr770964985a.2.1748379254085;
        Tue, 27 May 2025 13:54:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532edeadfdsm25975e87.80.2025.05.27.13.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:54:13 -0700 (PDT)
Message-ID: <9b6de058-d3a5-4cf5-b91b-0593f7e32950@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:54:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Add Bluetooth support for qcs9075
 IQ-9075-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_jiaymao@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
References: <20250526054228.221095-1-quic_chejiang@quicinc.com>
 <ecn6rv7ase2h2q3qjseunu5unftgicynvvrshd23j6ctxzd43p@bge5fhiq3cps>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ecn6rv7ase2h2q3qjseunu5unftgicynvvrshd23j6ctxzd43p@bge5fhiq3cps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68362677 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=e1eoD7e-lMPM1RtsuzQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cJCWD0l9XGg3w2WwI3_adhF3Y1J6X6TN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NiBTYWx0ZWRfX5r/kX3BAimB3
 wJ34wddbwZK9rf1I4igrZsBFnythwy7+dWm03iijmkfoq/GJUjzInZAZpFqBGlbDnygdXHojLxm
 eSjUi/hRCl795gVakRTlcAyVajPnmG7xFaoT1JLrSkoBMeSDibMRdPyeb3uwf0ymBngNhs4Ybkf
 15ImB6k5mmccnRUm+cz186IfMghIRDFM4zGs3rr7AeMFIbndzp9MuA6rgzBwRP6KZ2T+9CoYxXE
 t6SFthsu0NIh4Z6kSXVHeQ4RvT9nI3PV4s064rhXJs2I7CiE+Dg0+WR5o2R2tJTOUt+q9HzCZ3a
 63Dks1/3NdvulOSSbsNp8SC68LNhB5EolEqWsRGjPDvfuLfJGmBzez7xe6LisUbtzwS6cMjpD9n
 9wYLWr3rqW1t8proSqgajRlrtiYr8X7Dv6FJRV/wogv48pEJFDn0BK5GpM2QZ5fzk4d4vUlY
X-Proofpoint-GUID: cJCWD0l9XGg3w2WwI3_adhF3Y1J6X6TN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270176

On 5/27/25 8:15 PM, Dmitry Baryshkov wrote:
> On Mon, May 26, 2025 at 01:42:28PM +0800, Cheng Jiang wrote:
>> Add Bluetooth support for qcs9075 IQ-9075-EVK
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 42 +++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> @@ -273,6 +300,21 @@ &uart10 {
>>  	status = "okay";
>>  };
>>  
>> +&uart17 {
>> +	pinctrl-0 = <&qup_uart17_default>;
>> +	pinctrl-names = "default";
>> +	qcom,load-firmware;
>> +	qcom,xfer-mode = <1>;
>> +	status = "okay";
>> +
>> +	/* HS UART Instance */
>> +	bluetooth: bluetooth {
>> +		compatible = "qcom,wcn6855-bt";
> 
> NAK, missing PMU supplies. This wasn't tested against schema. Please
> read internal docs on sending kernel patches before sending the next
> iteration.

Moreover, the above properties depend on an unmerged GENI fw loading
series

Konrad

