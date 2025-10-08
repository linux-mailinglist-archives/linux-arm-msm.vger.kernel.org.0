Return-Path: <linux-arm-msm+bounces-76400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE10BC4D20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B8A3AA444
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ABE246BB2;
	Wed,  8 Oct 2025 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OwWibGsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DC624677C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759926796; cv=none; b=akTxRs313NbwGuZT0bpXtmf9Ny5NWPg5UabcapJ1XsiuYu/mpoFnB/NQxWYsmPv7M3NtO3tFjtlpgCXOahILC876tvRYWGHqynFXgGh5r/ryAP4LH9T6P7aqPFFrV92VdvwZclJorQezVjqUjqXkioRn6FU4PSx/V5L0xfXxVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759926796; c=relaxed/simple;
	bh=//8t1NhDDv3aZbpcl1yQGBSqtJZBajxd+nNDjr8+aZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGIhBE4QpUStasYuTKVnlAJ39cvCunyee+qw39fcjPyPTsZduy0FXsHwMc+5ScTW13mqw7QdUzym4qaKwRkqLeEZyzFw/tMCmOyAK6aonxDMbLy0eb8Ixl07G5T7h0IOvqKoaarjZIZTAys+Mt3aE0t5lr5eZDwzZEEOSPK9bsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwWibGsX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PJg028805
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6wfZSf95CHgtI1KREXLOgXa2xinD3Ro5IOxdVOqt1o=; b=OwWibGsXastOCWwr
	cudCgCHYC3kFVxy/+gifKXtSuRoJA12pH6krQQ/9vpIXomveUt8DRhn4APEXzvLk
	/PjS8JG/Y9rHRb6Zo2AKnO3FStOc4wtM0hk0LkczeluGOkwKBc83qJ3F4OC0y1Sw
	1wZBz9HejLtzAyp72fBgzF3kbYFBH2BlLevmJgdfXH3KhIdU0K7+EUGkDr1ZlNro
	qgZXCpyGb3RenY1eURE67+op9heoga2pHXrtJkaBPj07IanynFy4Ofc0i9ILfbKU
	uJDL42//AcZJx77rVT7ISV9NAJbQSVnZurZSkzSSihW3XPF71TIaGRZ+DZvwejfo
	2XnlAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgtg45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:33:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-860fe46b4easo254785585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926793; x=1760531593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6wfZSf95CHgtI1KREXLOgXa2xinD3Ro5IOxdVOqt1o=;
        b=rqA03sFHjWBPm8BxpIFmPlOfAh+ZmrU5jjvj4e6uotmBEp3XpkMyJlM34q9U99P+Y4
         su26yw/Rz+Vvz7ubRpFdhk8TJl3fSKqSuq2PXbsidgsQiomnTsbmvanhRcIbCeXtR/4d
         UUZQq5z17rgAbxjM0h/PJOjD2R8/dbjnIuc4j70AVpIEvLBQZ/ebqXJlemlCpoPghvnb
         hWQMXNkh2LIc02voNjzhGDJ0ZC4qyt1sH9C2PxfmsUfcGLVsSpZbFAecyNH1wNo89jHg
         BQhaUJ+w3r9fUElCJO0EO/MeP39HprG+kxF8PsfKvbYJKCndGxVK7S27GsokK7RiDm5S
         /6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiNmBFwZOXOuErRDu7aF3Xvnx2njfojXdYNqz5bswF6ldb5Py/a1WqxIGN8h8gpiTz8WUa5nyOyJ0GcYRE@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZ3EkuBKB4X1lcUAWMF6dvQIqyxALtppPGNP3YBSLkO62+H8v
	H17a4+UumsRMjJtbgaCzPS8ZnPl8vvakS5jleT2JmufIYZTTlGxm2MUwM38eVG91WXt9BWKl634
	uk0kbkS3R5LXT5ZjEwsMW4RNORm8zvV1gynWYwTy+il8ZYuezd2sHEQSD/A4grpyl5qWU
X-Gm-Gg: ASbGnctQtjcl/cmOBgdK7d+jH1WIpl82FRfbiQYtfyH0NbgVMJAaxpUK2S7PsYa+IJ5
	XP+3Dtp+lad4l1vVRSx/cQNjGPU0s0Deq5H1pcBnM/2K+F30FJ8MYmZ2Ts7k7RQzRDSV8Egvqh0
	ODr8vLoupw4X/C5tb8nz1o6euzakaHBQLrLTKyg3vBfUpNXAy3iw+ezhZgxC57M3e4RONF5R9+5
	NPsd8rRJwcPflL47QyYNlySEzaS7zx4oeauBWdv2uOfc/POmFkFCmXKSVXJXeDYNrrDyYx6Pk1x
	ZFzIUIkCGH4lVCOuCA/1BOQl6sXWPs0rUO2GExcGAFS63RRRhbwyCgjr/jNKp/TN4bBpimqcHdY
	kaV5CzvF6iJVcDJDhTs2vNPxzLv4=
X-Received: by 2002:a05:620a:4456:b0:85e:429b:b5ae with SMTP id af79cd13be357-88354304602mr338462485a.12.1759926793231;
        Wed, 08 Oct 2025 05:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAq5uquGqZ+wqlPlamUADJJRHAYrFogaML2CeN1PWbZyjBahtgdInWklh6rUXYPttev4j0qQ==
X-Received: by 2002:a05:620a:4456:b0:85e:429b:b5ae with SMTP id af79cd13be357-88354304602mr338458985a.12.1759926792743;
        Wed, 08 Oct 2025 05:33:12 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b57f0asm1648527866b.77.2025.10.08.05.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 05:33:12 -0700 (PDT)
Message-ID: <24544f3e-f9c3-4650-a300-a786ef589be5@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:33:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: ipq5332: Enable QPIC SPI NAND
 support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20251008090413.458791-1-quic_mdalam@quicinc.com>
 <20251008090413.458791-8-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008090413.458791-8-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX+y89IwiJxPAw
 9+A6AqCIbyhZMhf5XIZhERH6dTmP+sWDe1RbdJ9/YfkHxQm0Q2c0N778ZHPE0Sc7gkM99AA7KE9
 ytDXudQ0igovFzdOnuDyOGw0WG61C/ErRgKm7m7Z/XnLiTmohwE69QrK6U983wwHA+66W4KMGeW
 gen5I28B+3hf2m5CEzpyT8wW1HWm+CRgNCn9CcEowJsPfu9SIhlJGp+SgdM9OZydzDv4Ydm0spu
 LahKiXtWRCzOg6lPJ4KGOdpRKVW3g+EkhaFrgpyCyrGSe2u7lIRipi5K2rL4xg76Y/4SaYrhPEq
 XqC936uOESClBNttl3lNou9QR+9bi57YqHCcHLBm0nvFP3ZCmhoYuPf7LnnRQBGK6zF9tuPh9T2
 sINIbtzLyqqtQ6YAJtOwbQ2wEY3Z9w==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e65a0a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Swz0U_bwno74A2bXjT8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -jrp02GietXnXWhkFxnA1XOIv33i7yAB
X-Proofpoint-ORIG-GUID: -jrp02GietXnXWhkFxnA1XOIv33i7yAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/8/25 11:04 AM, Md Sadre Alam wrote:
> Enable QPIC SPI NAND flash controller support on the IPQ5332 reference
> design platform.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

subject: ipq5332 -> ipq5332-rdp-common:

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

