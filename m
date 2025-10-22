Return-Path: <linux-arm-msm+bounces-78366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543FBFCE26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867E81A062B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E35B34C9BE;
	Wed, 22 Oct 2025 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILZvfWV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7D32BE03C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146913; cv=none; b=gXO95xBdfkj/5mlNGdeSgPLUBIskFMuZnD808qpGOsYvlwSEUhjo/93Y+F3crkif/q+cyM7ULefPN9GtGWvQ1RD7sVO4UEF5NB3zOFp9AcwWFBq6B0Dd5nFrSiSW6pfc7pvUmlPsev8NQij9ZOBBii8S4rfWuwc5Kt+pUMD3SZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146913; c=relaxed/simple;
	bh=LKg80GSsXajEimsbU2IImSWBv/62yWeZsCxzc4ocqVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AypxzAl4pONwQFBRPpPxmMIRzzMFN56GDNcXLgQtt5cowWC8yiL03esgjhCG56Noyoi2xSWg7OWmFhuRlOE2+nkocoH+w/XScnxe2cMkrl85FjLeY8MIgP+7dLiICKM9BgDeVaDy2dcwHp53Nf1NYjPmjn+SXfWIGUhq5gJIXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILZvfWV6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M8V4Jb004608
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kEkN3I7ez210KvWSzWyrOcOsuH0KwadB9yDxw0Xm8nE=; b=ILZvfWV6hSPfBB5J
	g2+JWRa5A3ucDW0n2H2/I/8ejYIUzQKN9LYqo6m/rEmw+chUvqXhMcY4/CdbfTGr
	sRT++teJ3xdavvz6u7hIdzFqOmiXRAFzbhewbT5CLz7yNZUGuZToZVTx2aD700bn
	pKHNPVLVCcCnwBw2lHbBDy679TTkT6bWKyZxZTTNZu9nGEhiZ//2Fc8WiOZWkL0I
	05/3zBBEnxjxatTOyk+UMsjM4sLQnZhKc0c/9E8mjvcYEef20Swqa6V0y4piTCLS
	EA71sOigZgcIpSvN6cppV7fEb95urk8T0saPXw2q4kJ7SvWztAQddwx6DEKK5WmK
	+kRTmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsar7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:28:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8a35e1923so3276051cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146908; x=1761751708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEkN3I7ez210KvWSzWyrOcOsuH0KwadB9yDxw0Xm8nE=;
        b=sqUDUq7vgO5tJqvhuDAgEwXnxHLzAWddqd3wMAzQjYJBk6+PFMgvDW+ZLSlMaZ6gOu
         TcJyoQ/VEsLX+/gywlgvCRuWjf2+D77RdMcAM5deF7ldaHIWSZBlNjFkMhAb/m34+f+g
         jDmEUkSbj7Sw3WTRk7NUlfx3HMLgdi4oveq16KIE1I1dxju8YzpYa94dAqMzVjCv1rAr
         pxe9JUvjwdoVE3N1XtGsrvX1hUg920zYSlnlGCkX72DFMAv2Qxk1A+8WdfVr1F97iLS3
         4c2gxY+SP+x080ZxanB/VcBSzNP9bYwvltDttgoN/pLurMTDveMJAd7k+AC1ETeHbdAT
         G7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/amfBTIUaUKxygIMYNGXZ1OJpMHKmF0EX5jX3ANbG4+/Sguy9ewZ+3erfwqj+joToaJJzByPDhKWNZZm/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hJvl5jywwvlu+KJsqWm0uxNSdeoHanpYkGpVFqH5Jktu1Cuj
	7w5AE3X4bFHOHbzzY+xX91LoXhNxS0sMA270cFYMs3l+QqYPIyN5bwZtg1ntQJA1mIqINLHL5vi
	PMk/IFbIJBMRlM2g/hT1o70tGhGxDL4crKa5SntKAgevL3Ky1eT/qg5hFJUB7Ulj0EIbx
X-Gm-Gg: ASbGncv3NPI5ZOXvFLkeGTSPIlqmCQjAA5Fh3HE9Gj8t7Arb/xgC6CWUwlXDE+knsXp
	9relv9U8Y78ipxCDz3yxKxYc12S83kfN2dWUOFhDnbKFOZ7LMJ7t+BO9ykYU/p1pqzmd0Wws1rj
	xDbceGRcc5WuqQNYtiVVXTaHK3pCvjUJref615KF3J+ZncgGOt3BvjHsZX3HEK0D6ppm0WefMb6
	Z2piMNJ5mEz9DK1P7oQNUv6Fs/oC0wH+rA7/34MlV8zTrtHcbwJHRHuTP68JmkzZMNEsC792eo9
	sy367iQaBRmco6gFcSZkKO+8xza3jFIJZsFcOn+xRjivribo6GMUzR3bvjLV52JqpM40QoqRqou
	qSH2WXYMm6SdvHFIBPF+fjMNPTQ2/LfLYapHV3LmHV21YPSvf1z32OW8B
X-Received: by 2002:ac8:5916:0:b0:4d7:e0ed:421f with SMTP id d75a77b69052e-4ea1167dbc0mr64496481cf.3.1761146907946;
        Wed, 22 Oct 2025 08:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIbfA/J7/7e/fTVE+4K3MaejRMmguF//6ihYzs52oLlv/Bgz24gIfsByl/uIBh4sKc+gqcHQ==
X-Received: by 2002:ac8:5916:0:b0:4d7:e0ed:421f with SMTP id d75a77b69052e-4ea1167dbc0mr64496241cf.3.1761146907534;
        Wed, 22 Oct 2025 08:28:27 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0365e1sm1371481666b.48.2025.10.22.08.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:28:27 -0700 (PDT)
Message-ID: <41481de2-12fd-49b5-b3bd-f3e44e78dcb3@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 17:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] spi: dt-bindings: spi-qpic-snand: Add IPQ5424
 compatible
To: Md Sadre Alam <quic_mdalam@quicinc.com>, Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, quic_varada@quicinc.com
References: <20251014110534.480518-1-quic_mdalam@quicinc.com>
 <20251014110534.480518-2-quic_mdalam@quicinc.com>
 <dd1e4289-5e36-4b24-9afd-f09569459a96@sirena.org.uk>
 <96ae7d38-4ce0-fa34-e6f0-6bb6e4ceaa28@quicinc.com>
 <0a743099-face-4cc1-91ef-098a748604b7@sirena.org.uk>
 <49eb9f15-fad9-4f8d-1463-04cd692bbe51@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49eb9f15-fad9-4f8d-1463-04cd692bbe51@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX9G8gnbLY8Oxz
 d1RVGUKklHihqcSsWYSNUf2CZ8mcNHiOC9K8ExHZZRJ4fvwp1yqamGZWP771H0pUEX9V7pECuJ9
 DPBRx/ZTzViLzDIiZO1IMaeHruYRvcIgOQAwy74vRrU+r7b3S6MTs14vwfO6w95YqgmLu1R0SGt
 EpQWUharHbRwwbACCWLLjhdS9E8atgWUBU4PIuEEwhP79RaBpv6WytFNS0Cgwv334jU7LZGtr5f
 j9Xx3Ei6pAFU8G2uvKQ7oT4+5bnXvGRrgC/VJOZEIgRpoCpH9PVDlw4RPv7Yw/7E2YXw18CsDL8
 0qP3gFt2F4MmU6Q98W9+ZCVa7t+cUvNJlWyIP4wngm5oUnDw8fJEmupDyiGgwvJSmyaBpHQJbKG
 ERuAziTowi9spkFp346vfOtlyJ39zg==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f8f81d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=WIUPFbzvC2a9H5sHzXkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: aDZUmH6G5VertNeWu9i_1ZBvsYXGWueD
X-Proofpoint-ORIG-GUID: aDZUmH6G5VertNeWu9i_1ZBvsYXGWueD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

On 10/22/25 5:20 PM, Md Sadre Alam wrote:
> Hi,
> 
> On 10/22/2025 4:12 PM, Mark Brown wrote:
>> On Wed, Oct 22, 2025 at 12:29:01PM +0530, Md Sadre Alam wrote:
>>> On 10/22/2025 12:39 AM, Mark Brown wrote:
>>>> On Tue, Oct 14, 2025 at 04:35:26PM +0530, Md Sadre Alam wrote:
>>>>> IPQ5424 contains the QPIC-SPI-NAND flash controller which is the same as
>>>>> the one found in IPQ9574. So let's document the IPQ5424 compatible and
>>>>> use IPQ9574 as the fallback.
>>
>>>> This doesn't apply against current code, please check and resend.
>>
>>> Thank you for the feedback. I’d appreciate a bit more clarity on what
>>> “doesn't apply against current code” refers to in this context. I’ve
>>> manually applied the patch against the latest mainline (torvalds/linux) and
>>> it applied cleanly without any conflicts. Please let me know if there’s a
>>> specific tree or integration point I should be checking against.
>>
>> I tried to apply it to the spi tree
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-6.19
> Thanks for letting me know — I’ll rebase the patch on the SPI tree (for-6.19) and resend it.

JFYI you can generally count on linux-next/master as a good base

Konrad

