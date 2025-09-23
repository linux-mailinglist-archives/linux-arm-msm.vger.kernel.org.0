Return-Path: <linux-arm-msm+bounces-74546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D33B97A19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 23:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF48D4C45FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 21:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF56930CB20;
	Tue, 23 Sep 2025 21:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBMX5KkT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF6252900
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758664282; cv=none; b=jWrPED9mY+HJf7a5jxb6kxAfYnFU0OwE/rAV60t+AHqbfPUONwfZ1WwTeCqVpZqP40JTG7o08LOMBeBk2b3UoO/2G3cZfA6SK5Wl2s+VA9tYxbmxALiDKWYw+3yLp0pQVF1mfb7jVPjU1LDK0VQKWBIdcHMphTZ9RsX7wcVz0B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758664282; c=relaxed/simple;
	bh=Phi3PYB3KOmm3zJUanSEv1JY6ERzYhkvkqz9KTEqZ1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ykrrg/Qsg3h5cPH1yQIquqNpLmVJVJUIaU0brctrlm1KAGgKeEvSlU5uDiT/xZrhlpjiP7HpxXhdz8hWhvz2oT2GHfJp+bWTy8dfisnNSxLQQI+r7uPe8B0fatJy75PpRXibSoVOL2Kzk54NvMLWoLAaHvXZx+smIrVLBmzWrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBMX5KkT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEqVqW015996
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 21:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiAQHIOrW59pXHLJaujV2OHhsUSTiYkKFOKLz/FR/mI=; b=iBMX5KkTaqhWAkUg
	BRxtHF1eehWCLziLrqUynIjhqx6oYcX+abOt75b4L/d6rVjzpOHm9AeA5SvMKuyB
	PYRbcQvR3Lxuy9O54ATDejhjK7CMOh4hv7/SnP6VU8RF5Tg+2OfHhoKGOqZyyYt+
	yFackzvt5dgAIt2CB8tS6HrXmyNr/jyS+9fbXVl8CMQ+1PmtCcWmujNkibu6v+fH
	/FIAc/2hxyu0r7EhpRirzxzUSLfjLTyCkLvyyOCCKDSFUTQOxSgWR1mXYjyR6SGe
	wT5jMYkmxu01p91Cscci0WUT4hEBJHYnr8sa+vbBVyBIQyI+Z1WoxuFAdHhlAhQA
	8+kl0Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpduax5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 21:51:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e4aeb8a58so3694678b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 14:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758664279; x=1759269079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiAQHIOrW59pXHLJaujV2OHhsUSTiYkKFOKLz/FR/mI=;
        b=I0e9Ayv9HNR075rGjuIMs1BxQWeR+TDHTZuUSNVZbfxzVU2Lr14AHPNQAcYSuw16G1
         QxNHew1oyZGPL0BB+a/eyXyQIxHrT1zJkJKuiFCLY5EeiRzk44SQUylY9E+rMdpF1362
         st+WOS4jO81Q9hGNZFBI0m+Z7GB7C7h49GpRfS3JUIZ4TYoXHIX77suBOIElgNziHv43
         zSXvG+TjVtW3geTIuxfiSJnrIqT/fuG7/Im9cCAnr18h4VyZeJY4HJXEByO+cQnvouy2
         IdKy54ZohmDThnmhiBagMAhOyy3oXcbOeP8e/QBXHDNTcJlPFwkOtxZGo+dXXkD/FDIk
         VLEw==
X-Forwarded-Encrypted: i=1; AJvYcCWSQ8iAX33WuMW3zLfz83xVOBQ0uAjdw26RFYz7EFUyE9qE4YXxq98ZxLchSHKDFG0ZZHejramuJT5Cv905@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0p5mCPMZs3qqTkpBO1bCV+Rb+68b9Be7XF3SHITc9c03AIUBI
	O+xVc27TYI90E/tbY2RCap+NjL8HPwy74T55wNIdAB5KvyX+m6Wz6NPB14OvhAK/AZ+n0G1Qmw5
	CAeVWqdWavRXpIp8EfycVOHCjVUTbhVUQm7EiMexKFzQKLQaCFTaFSP8wODI5RQW4+qLh
X-Gm-Gg: ASbGncsdvX890Y2NZWfRR9sLyWbka59y0Lil0VJ/o4lAJsj439xI8RK3gph8D34qXmD
	zQtesBW8Y8zhlCT4XUWyH/MVBcaPjF2grRNlqGX+wPXb4vrH3s/eBhtLouFJoNRtOrwGGNKhwDn
	amIFJXDpiojr8PisFxVvWPC7DOZW4dMc3Np00O2ZRHx4ouEEF0joaxNfDweed4OYaSkU94hskux
	WAo6gEGc5hV0NmBwNBxd4lTcnww3mmHyR69BQLq4cZXeG9BN6j1EXna9ByQWrop4QF2ZZwVncz7
	N9KdrI18O9v4kDwkc7KEI5OaqV7iN8TiIpGL5y7omU1VwPb2R8fIBqBeZfHlYKSBMvEtKVOvXKP
	TkWfQTQ==
X-Received: by 2002:a05:6a20:258b:b0:249:d3d:a50b with SMTP id adf61e73a8af0-2cff4209b23mr5529427637.59.1758664279131;
        Tue, 23 Sep 2025 14:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq5Th0MTaZw84UMrVLMwE0MdUEOMsSuPcioOUVzMEkQngd4fbtEd7mUZH6sG5VPITkCIAgJw==
X-Received: by 2002:a05:6a20:258b:b0:249:d3d:a50b with SMTP id adf61e73a8af0-2cff4209b23mr5529405637.59.1758664278734;
        Tue, 23 Sep 2025 14:51:18 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55396db81fsm9565146a12.19.2025.09.23.14.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 14:51:18 -0700 (PDT)
Message-ID: <1b51550f-90db-2ead-0ec5-93ce786ffdff@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 14:51:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
 <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
 <aNJL1YEXx6IabTos@hovoldconsulting.com>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <aNJL1YEXx6IabTos@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MHbTmao7sy_YcHsbWTEvMYput6R7OaqU
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d31658 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=A-OFauQzm6gaq6ZTC9UA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: MHbTmao7sy_YcHsbWTEvMYput6R7OaqU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX0sAKi/vi6YSU
 822VaOo4NRm9VPyax5qZmdnER9JlF+3mjw6WznBCKq7PyhAp49/VtSqAklxMeYvaAf6UTj01tPt
 0OfXiBcmAhKpLuQ2iL30oQty840ipefvf3tuWzvb3iUduyjOx1TXlFCBKX1gwYr8NPspgnbe9Oz
 +l9qX0TPWYvQfU6Zb6qkjZn0CnS0JlsdbfIcWBlDAk8tDMoeUrkp9DY+ok/PdZo0qU1JDdmp/B6
 AIe6/O0ZJn/uFUM+8d9v4CR5tKbYrVculshVJngLz/cAYMAceNSsGDS8Env5QsUfyREQeQLIuc9
 BnODfst32hWLihkh+AsZ/tJrIfl0wMkiw1Z4pob1bzxyuH4yl77++HfSX4Jft1TxkVRoYhCoyGA
 W5HqOPzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_06,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020



On 9/23/2025 12:27 AM, Johan Hovold wrote:
> On Mon, Sep 22, 2025 at 06:00:04PM -0700, Wesley Cheng wrote:
>>
>>
>> On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
>>>> The Glymur USB subsystem contains a multiport controller, which utilizes
>>
>>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>>> @@ -16,6 +16,7 @@ description:
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>> +      - qcom,glymur-qmp-usb3-uni-phy
> 
> Odd indentation?
> 
>>>>          - qcom,ipq5424-qmp-usb3-phy
>>>>          - qcom,ipq6018-qmp-usb3-phy
>>>>          - qcom,ipq8074-qmp-usb3-phy
>>>> @@ -62,6 +63,8 @@ properties:
>>>>    
>>>>      vdda-pll-supply: true
>>>>    
>>>> +  refgen-supply: true
>>>
>>> You've added it, but it's not referenced as required. Why is it so?
> 
>> The refgen clock isn't always required on each and every platform unlike
>> the .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only
>> really depends on how the refclk/CXO network is built for that
>> particular chipset.  The refgen ensures that we're properly voting for
>> the supply that is powering our CXO buffer.
> 
> I thought we discussed this before and concluded that this is not an
> accurate description of the hardware (even if you now call this supply
> refgen instead of qref):
Hi Johan,

refgen and qrefs are different things.  I will try to clarify as much as 
I can from the discussion you linked below.  (based on my understanding 
of the reference clock network)  The refgen is the main supply that 
controls the reference clock (CXO) into a specific branch.  Within each 
of these branches there are clock repeaters that are supplied by QREFs, 
and is basically the supply to the clkref switch controlled by the TCSR 
registers.

The way some of the tech blocks are connected, the QREFs/refgen may 
share the same regulator as some of the PHY's core supply.  Some may not 
even have QREFs at all.  One example is the QMP PHY that is associated 
to the primary controller on Glymur.  It has a refgen regulator, but no 
QREFs, hence we only need to vote the refgen accordingly.

I don't know if that helps you understand it a bit more to convince you 
of the new regulator addition.  If anything we may need to add an 
explicit QREF supply also :).

Thanks
Wesley Cheng
> 
> 	https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
> 
> Given your description above this still looks wrong (at least after a
> quick look).
> 
> Johan

