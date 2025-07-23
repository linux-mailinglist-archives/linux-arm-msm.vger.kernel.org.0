Return-Path: <linux-arm-msm+bounces-66187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA07B0EB3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDA116C7516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA36272810;
	Wed, 23 Jul 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CI6cHYjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFEC272814
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254280; cv=none; b=Ob5MAyZD6SGq0dUIkKiMOGEFYtfd7ik+Cbnrv8Gelaidm0QLXiMFzQZOKKIyebQHVdpbs/R7X8GRuCIFxBhWsB3U/Cv86vM6DKHMPtAtR+c/x5NEwxA4kWkDvN+DLw+AGq1UdDqm52aHHDTawXyif0XH3QGZTQNm/zxMbnYWMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254280; c=relaxed/simple;
	bh=PoqcbJsGpwvHEHRaYv9tGRmPiuuf8WpUxuWrdAv1enk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tJe3E3t6e1HV8WV20qFq5+7ismk9N0D45NYQwLS9yCmfK4evJr7+5wKlcquuIssX515FG86KVLE9g/im4lmBkHVHgeE05KCsfxWwK9C1HLn0NQo92I9bs/tu3YawrU7nBmNURQXiD8Zeu1tKnImtP7r2YzQZ2ioXaAN05IjA7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CI6cHYjZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMO8TN027886
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vH6UcnPPc6AgAILCvjIhfjZbNXQE5ix/Quz8z4LXSmk=; b=CI6cHYjZrdwPRlfh
	Hz4bmDHKcCXUe3Q07LIjxYFPD6utjV/v+e35ELYDZ2r5EhLpAy/cslLbxRN3oQjz
	NVoHgVhAO15NIESgms+VvR/uDRVy7/N55cilfJ6W5n7aW80jVEUUNqMED0gZPUtt
	WtjZpWNbbizhhde/8/r02ROKsDRiEjymuDf11rwGFOFmtZObnLy5PNjd0MehumQT
	AQ/E7pfWW7PhRHu3Ke2wgrXAbJp9NdUaEUV7AQvr8SsgXE0KLdH4J82qcQlQZM27
	9j/n0vPGHsjW99AhV7mhYPp5TNcKueZY/jgPwZ3cSOcy6BFFplyxyDFCQ8V31t/7
	k3pq4Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s46sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 07:04:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23827190886so69216995ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 00:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254276; x=1753859076;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vH6UcnPPc6AgAILCvjIhfjZbNXQE5ix/Quz8z4LXSmk=;
        b=C40op4/VAjT5gN2nuiTggHfBXALvf0cz0+Bs7oWK+IRLe4KOfNUeVtcnjmlklsVZmx
         osGD1zJ/2W5ZiRPP0V1H9MN0xd9d9oY3t3reSualr3QwYvVIzEHKq9TgcM+BP+DpPWhK
         OdMyB4z/HxQREklwVN0Jtd/0nU/ESBOSug8iU5z0YNmMQpx7heuVYysgkYLcwqbI8PHh
         08B9948n6Xhj0bxT3NgASGot8mZ0d74wd8rlz9lTEZmrrPj7xcsSRscBm2fn+rC1EQfI
         +KhRTzD/JoSlxbXzzAebSIVrQ+L5v4p8j3/ia7HLf13AivrbaDms16kxslUMIQfsP/qk
         IpYg==
X-Gm-Message-State: AOJu0YwpE3BiO+gX4GXFQ8TOssfKPF9er+4+Y0XowBMt8TcFR6oWNc+v
	vqk1tf7XyCQ8uNACFdT7wOdh7WsLwMTnklsR7V3tEFERYVaBzBpiQfTkiPLu8u/a1SXmsUXmETB
	++LE+RCQku9OXQd9ZIwWV1W3k1+Rg4nuIQBzXL7kbjlMFYJkVTDRgO7CgwgAFqEZPCwzs
X-Gm-Gg: ASbGncv4sNlOOwnRiD0ShmCAy/J685fiJGxKZBzC24ZPzLOKQQxxTsQvJ7eWVvZ9cVq
	O/GHFN3H8z4Wze9BLnY5fesU790zY87U72eWfGjj3djUevr9WlS9/1AMWQFEyWjgxemtW7R4aG4
	7L454BMJIeUzFrcuowH9HWik4FkY70xa8TS1h7brFnietZgttJPgag+aP9ymBah3G4vn34K0cYD
	GEAy/tE1qMpzWkM5nAj/klNzpP9YZao6/z83Rj85BpL7hzUGYStI6NDvNpBI/teHodFf/Ydhwdo
	muEE6CctYSKEKKU3nedcJILW4JhrMWLZ1OJ/p/yytSUgl/bD66yytl43sCFHtEiIa47JoERQRmI
	SAMVOzFyE
X-Received: by 2002:a17:902:c943:b0:234:f580:9ed with SMTP id d9443c01a7336-23f98142a01mr31947075ad.21.1753254276240;
        Wed, 23 Jul 2025 00:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQQHnDxC0IpogQNmaCVUpDYUfW0d0gC9XQA8tMK1P98ASHk8Lii3GJrd0WTMJHT7IWRGOoZQ==
X-Received: by 2002:a17:902:c943:b0:234:f580:9ed with SMTP id d9443c01a7336-23f98142a01mr31946455ad.21.1753254275590;
        Wed, 23 Jul 2025 00:04:35 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e400esm89793775ad.47.2025.07.23.00.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:04:34 -0700 (PDT)
Message-ID: <64febbd6-abca-4ab2-abe9-93812bc115cb@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:34:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>
References: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
 <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
 <7d641576-7ec7-46f2-ad53-e0b8b36351d1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d641576-7ec7-46f2-ad53-e0b8b36351d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA1OCBTYWx0ZWRfX8ZQu7IStyZ5p
 TesXHA/FX10R98ewcIH+vrpsaB3DRMmC1ntPrCpSl+rMsX+TeAq1zENu7j8Ujb7q3koQJzO4BVH
 Xdq8hOK1d7dAqU+Nhk77NqBWnBtw/+rYNylmiBXf8it8W90fgYIF+0544Ulne5FJ4wc38yC0Jmb
 0l1sjdL+CWU3fQSlNL6yiLqfi3KeFls4csAKVqqqLWuDGsF2I8gdJgGJb3ArqR6X5P0YOSv1AQf
 qpiI8H2K303xHJRHQJ32qciy7OFqUFiz6bWEFAMwbX7L6wAYTpuiAEYgiEjRFZed1mxDvVbi+R2
 VDJv7+xoTFKFoa2iCjocpPIOloc91AWQnTQib/f0vt+Jr+SzQznyXKT7brVEtvr9ArOL0NiuoxL
 W7rp7O2+mmdvLXf+RWhAMyKyK+G9VFU3Ei9xcilpaKf49SzpF3vEDWPHE3V8EcBs9ElUwvlm
X-Proofpoint-ORIG-GUID: bjSPyPDBAQc91PezpgnXL1DT6EcgkXCp
X-Proofpoint-GUID: bjSPyPDBAQc91PezpgnXL1DT6EcgkXCp
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=68808985 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=YISUMjRIwNUwlFPiRe8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=492 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230058


On 6/25/2025 10:20 AM, Kathiravan Thirumoorthy wrote:
>
> On 6/24/2025 6:57 PM, Konrad Dybcio wrote:
>> On 6/24/25 12:36 PM, Kathiravan Thirumoorthy wrote:
>>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>>
>>> IPQ5424 supports both TZ and TF-A as secure software options and 
>>> various
>>> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
>>> location, but in the 256MB DDR configuration TF-A is loaded at a 
>>> different
>>> region.
>>>
>>> So, add the reserved memory node for TF-A and keep it disabled by 
>>> default.
>>> During bootup, U-Boot will detect which secure software is running and
>>> enable or disable the node accordingly.
>>>
>>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>> Signed-off-by: Kathiravan Thirumoorthy 
>>> <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> Can the said u-boot simply dynamically add the reservation then?
>
> Yeah it could have been done in U-Boot itself but it wasn't. 256MB DDR 
> configuration solution is already shipped out and the stock U-Boot 
> enable this node to avoid the random issues.


Konrad, Do you have any further comments on this?


>
>>
>> Konrad

