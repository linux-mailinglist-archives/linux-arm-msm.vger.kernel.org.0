Return-Path: <linux-arm-msm+bounces-72182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2755B44DC5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C03F3B17E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 06:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0ED285CB9;
	Fri,  5 Sep 2025 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pd31JRqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9A02848B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757052020; cv=none; b=pIPqa0gJuwzhhFWfsWmGYBy/vvjYneMQt+rmiljWi9Cvuz6mgA+oeeqtsPgnS8B3YRlCVp15iVCEHTBDfFwOwPKFxT5inB6ceS1nJk+U76F/PSNNkVDS7Fy/lek/PeGNjdYMEkkerKh2XSMVd/r4eOvNatBOI8YQCj7KzZ0d1N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757052020; c=relaxed/simple;
	bh=AFb+9QCqjGbJ/1m/HKU4siOLrQoCZ646eOELHAiI0rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZWAzgXpRtuRk95eOzNa5Hy34pz2sCTSARqAPfJ2QOK93HDubrnwAhniEqqTtWq7oTm3MJvF+MrZeQgVc6rA3x7V6+tgc+Kb6XA0Iqra2tHFbZa0f9K1Z6Gs6QenbtjjqEQj2cEdmeZCtERCT8jyKcS9SHYpGcCQ9neK1m+P2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pd31JRqV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JKWSY024707
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 06:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3wvqQmO4VlXSkPHtA+kQ1G3ijV/kY/N6LPpzZ6ALdc=; b=Pd31JRqVJVL455fW
	iIxfXyF8FHxyLPsYD50i5INO954E8+4E8CgDJvSkSUPXRi4n4BONKqIgl4QGd943
	03MyVmB4xG87yWf20teujpwDINGn/TATUWK+azJkm33sQQGnre5qjBG3S78wEZPG
	G0NwL7FqJPkAl9lLDLr95cvmAtu53e6W07/hFeXDwJM+LBwdxyEcT9HqH4FVxoxR
	KOH4tiV0MYfrtHtnGk5viR/duYta8IJN04n9kHVoFt7AkHkhjaEIWbB2iuUnP6Aj
	HJRIDVRVBMzGOFvX75adZRmrGIBiuKiHlzhWXypWO96+myK2HGUXBC3CeoKJdZPB
	roipUw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fsuur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 06:00:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b2336e513so29532865ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 23:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757052012; x=1757656812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3wvqQmO4VlXSkPHtA+kQ1G3ijV/kY/N6LPpzZ6ALdc=;
        b=SVvJ6ekMY7ODzz8l8Kp/ODyhMotxOBUyeKW9SafFEKHqpJQoFT1GHbJ7qJknoafbOO
         3ZUQdYO3rzxbriIuRTV6XB/0L4RmLWmgijb/gmB1q386lwnrnlCCbU3L7oleyNvnCpqT
         toz7K7Jm+Pw2m//eecV1tWKVIL2mfOhIu3V+chR3aGwO9ZmG1lZfxKHTPdc+8z1TZL8d
         UiA8Q03hvRo3MxY2BVEu0ekqohBDTh9bns0pqeTZ0/N+9BXEyWb6qBTgmfqU7KL6G7kt
         b7gCjR8tmDlpGGS+R3OmgCBY719pEFV8nEjIBR3DUG4vgqjekT+PSLJxw7l6qpL3dhLC
         CbGg==
X-Forwarded-Encrypted: i=1; AJvYcCW8oTljNdCsefkpzGOupIZr1qd/AVTkr2uMn6RqY5N7Ox1B+kYDSQJq5vHTnZrdaLpVaSJluYeQvqGOXhwz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/huD9plwL4jEdpCpMh3N/SvUUFRtKetn3dCJoxtns5TolpJVi
	GE5hpTpcepXnhZiLAZzZ5e4b1ui8yjlRVnI/C8yJisQD063RXhl3ElrXIYkh83w6Q2sI3zOPuyp
	+DgtefkLLE9SAoNUoRubwMOeneeSZfVde9Hvygci6+EuChQruiTFUOfhwiV8PJxaisbZS
X-Gm-Gg: ASbGnctHAiQFfwY4R8acx2q+t/ZvRxNJyWjpzmTujOlNPVDVT2Lbfqf8ZWJJoCeoUwg
	1tmajFKa/qEeHBj651vEANCvbfTrFN/JjvKF95D+B/u7OaYFGjEQCcjimcIzzFZ1LMU0DBobjkC
	qfc7+6VdbQ5BC9ZXGhQ45aus9tU/oihmbnYeOwH2SF0IZmlWUk0t3WLzVJRY0H2SMl2Zsj1TIbQ
	rfns2nGoRBSq8HGgMEe/aKQRpdhFiMUEmioluBctN1dTY9NrTvsBEOCV0jyypsO4Ban2i8ZDlJH
	V/zYON4AXmTFOqahVGLWYsCS1UM6qbPgB9r0MHHJmmvsjl4UCGgV/758zBiKQw71mtgGgR68XCh
	I3jwvWtQdnXgEYAOXwf5z0QhS9hK58eA3
X-Received: by 2002:a17:902:ce8e:b0:24a:d582:fbaa with SMTP id d9443c01a7336-24ad582ff65mr218517395ad.12.1757052011484;
        Thu, 04 Sep 2025 23:00:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/cHmFw51D0GHNL0K6FHmxYOYqdRzziDWguo5c6iA+8dTLIn0jYMYcaSVHHWMsKF7j5DIKqg==
X-Received: by 2002:a17:902:ce8e:b0:24a:d582:fbaa with SMTP id d9443c01a7336-24ad582ff65mr218516805ad.12.1757052010969;
        Thu, 04 Sep 2025 23:00:10 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cbe170977sm37426225ad.42.2025.09.04.23.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:00:10 -0700 (PDT)
Message-ID: <d8a885b5-3054-4dff-aa64-5ba194be4cc2@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:00:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-hamoa_initial-v9-0-d73213fa7542@oss.qualcomm.com>
 <20250904-hamoa_initial-v9-2-d73213fa7542@oss.qualcomm.com>
 <2o2ypmxo6wbohrb5edkj27ueqpgbqhsnqu4ofzfubtfwg7vyri@mdsu4ca63fr5>
 <wturd73lfutj4njzrmatzli356cfyehbtr45fjcttmbo2pieu5@he3fnsqzumfv>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <wturd73lfutj4njzrmatzli356cfyehbtr45fjcttmbo2pieu5@he3fnsqzumfv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXzi8v6EIyvbWT
 2cIoHTF0V6yMWUYpK43zRZRRLtPM24Jz4PViQ9qyWGdE2Yu7oXONj/1WV9KVWFnTSydZQF7UjYD
 duH03jQIkpJ0C0Uy15RzIPjo8bQuJ63MrH/PD78Y55kI0OnRvJmZZ1fwP6cUGnhgMSdfrgV6Vit
 vcLqFIQwjBCwx8khLojoad9k2aoOPHYo/WO6N4gZDoSEsaEi+QP1hlJpS3IL32aw39TW69wlHXd
 r9igVLqUAHoE93KDd8agRhB3wl8ioZ46pi1acW9YhA88vAa2N4ocuzVOLAReGEIsACLHM2vIp3r
 UQpNt1UUHzxAcpp/gyLe22YznrUa0oh5H7WuIYb1xEKq3RJXPKdBOeOScmzGLEdkViZ8iW1BQFo
 OcdQAPjM
X-Proofpoint-ORIG-GUID: XHwAdo3NCKC26boA9Rp4K8RvzyMx2tDJ
X-Proofpoint-GUID: XHwAdo3NCKC26boA9Rp4K8RvzyMx2tDJ
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba7c71 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=5pxm4SLHXydbrukv4qEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038



On 2025-09-04 21:58, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 04:52:26PM +0300, Dmitry Baryshkov wrote:
>> On Thu, Sep 04, 2025 at 03:48:33PM +0800, Yijie Yang wrote:
>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>> components optimized for IoT applications. It is designed to be mounted on
>>> carrier boards, enabling the development of complete embedded systems.
>>>
>>> This change enables the following components:
>>
>> Documentation/process/submitting-patches.rst, "[This patch] makes xyzzy
>> do frot".
>>
>>> - Regulators on the SOM
>>> - Reserved memory regions
>>> - PCIe6a and its PHY
>>> - PCIe4 and its PHY
>>> - USB0 through USB6 and their PHYs
>>> - ADSP, CDSP
>>> - WLAN, Bluetooth (M.2 interface)
>>
>> No, you don't. WiFi and BT are not present on the SoM.

Will update.

>>
>>>
>>> Written in collaboration with Yingying Tang (PCIe4 and WLAN)
>>> <quic_yintang@quicinc.com>.
>>
>> Co-developed-by, Signed-off-by.
> 
> After checking old thread, you can ignore this comment.
> 

-- 
Best Regards,
Yijie


