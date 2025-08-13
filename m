Return-Path: <linux-arm-msm+bounces-68982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E7B24934
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 14:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E69B556088E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFEB2F6571;
	Wed, 13 Aug 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gg9+ssvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273192EA46D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086997; cv=none; b=ansn1k1ooeDn8MdmUJgZYuVCR89c2x4jwGBZEaLxMDsXgywUHIG3dF8ba7zz1jDUdnT2LCt472IatrjPalf1CzkvjkSYyP38C6HvT5Ue5/kI8XPTRvRvkK7x1V1fjUYdqxI9iv2rs3At1YllXeEW2uu2JeoaH1Dlt67p0cWT+Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086997; c=relaxed/simple;
	bh=m/WznaXUGhuabfIHeviZG1YVniNSCGD1sgKRQRpDdGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRUXEahGugmu0GXqDZcSKq+N5NdRcwca5CHHCyCb7mUE9xIraXg6BF/1ly2ZL6qTTOonz8EfCIbJnuvrwySJxH2RSW3C9O7I1ULK0RNNuI8XSqqMuqg1igljv4N6hnTWt9CQXbYXEfwuETY/zIqsfP1tX7eIcR50f7+fCf/otx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gg9+ssvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLbZe011070
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	psYFNtuDqahC04xkfR7SJEBA99hgf4unI++fgcrpz3E=; b=gg9+ssvlTsvev9Pv
	3F7pGrGmezzHVy3/n9PlAE33ji77Wrs2Wtk3sarmqZfJ4/uGJ1eb+frZaGeSxsRy
	dEBE/AYFkK7MqSh1Z/l+ijyw+8BgtURn4MFUQlbmrNvWFsSCOThpVzmouQet96tx
	6ACNERA1YQQqa2d4HODR0o1DZIqYcDUrJBdQbERe4FQL4JYYzYKx6SU1WfSEanf3
	GVTCCTfI26wXd9tqG6naRqHf2lIBXKPH7YB50j1W0GZxiOca642cACCWgjjlPHy4
	GtJPxW5xFvZa8EieLOT6nmuq56q2kI6PaJZ2DUfSrbUMsZu/E/X5Po5Qs1oy6u4F
	33Te5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbevfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 12:09:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b805068so14924401cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086994; x=1755691794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psYFNtuDqahC04xkfR7SJEBA99hgf4unI++fgcrpz3E=;
        b=DXA37Q9oUSpOGRl2XYTI6Dy2W/7negVDwOoHO2NSpb8eBl2YwzenokipOX5H8VKObA
         w4SfBcEo2U3xsUI5karye4X2upvVUeorTVHPZ4sog2hVCKRb3p+WdOZXbeH12mAwKu4X
         DFr9ikXPHZ1or/EArgpkTektpCNI+O2KGEs+mI88M0V8x/i7qUPR8TmAb/BfAHYgUO6O
         LNOpA5MfESjrQXtNWHkoSuGqqNW6z5bWaVx76ltYE/asqwiq44h2TrthavP4UY8h+8zT
         dXBTNiPWLqTCN/khA843R/h2kTov30021BawLfFEhZ+/VYRdOXr7aCln/iqCGHwWmIlD
         EQfA==
X-Forwarded-Encrypted: i=1; AJvYcCU/a0vfYIRZmsm6DHimDPHaeOEIXLpipERhoUAaYnrkDxUDyd4/gG+uPL66aP21w3c5F6OS7GWNcatOtXuz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4rZhmfiUfL0T70Pp1/nTHUcII1YFR9YO0KX0W0ilXOIt4fje
	Vp2DqS/F/FgZ1xoz9/Z1CV4SZqWRcAtoCzZPbsWHh7009SFm5N9Dlre3SPNxLIi9EWniYi0/XUq
	vlpOzV0Uormhxt6qM6O+d2BDXwSiNmg6oMddcL7J6CWuXc6hXgwLv/rHMZ0VcTXdNCa89
X-Gm-Gg: ASbGncurKO6R4L7Ovnl4FiiSzp00vIQUHbtCpBqlISw6BP1FegZX8P9PGrTfWkbm4KM
	opjcK7y59fyAl+VM4JAGQ1nYjCALLVLzCPqYvBrMuJVRmtBvbgW8olR5tWCF1TLQ8raZkpgmUFj
	ZK/w0Hf21qtCPpWd+TnsSP/pWSxsgsGydPNV2wgPZbeJ4NCDz267FueV4eIN9IwqiJeVfq/1d51
	voEYaboElLXEeKWmzevKSB3VSNI+j2Fw14hcxysW/1LUWMk209wTcv9Lq1POaYqbH4F7i83zwnu
	LMr1sT/i5rOk1VzqFKTA2Pcww+PmhCtkv+PXf4vAzx1dPTK9S+hv/dbpoxqJrLnDf1BDRueqqbt
	nRWY9Azgtg6OI4JVkpw==
X-Received: by 2002:a05:622a:1103:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0fc4ab333mr16608421cf.0.1755086993792;
        Wed, 13 Aug 2025 05:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiI87elj9RoCIsminvTx3/fiw69IXoVr3fAfA90qa00UcNNobX3kI5ozBR7Y0OFrUSdqLEeg==
X-Received: by 2002:a05:622a:1103:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0fc4ab333mr16608041cf.0.1755086993180;
        Wed, 13 Aug 2025 05:09:53 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a219ecfsm2374415866b.94.2025.08.13.05.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:09:52 -0700 (PDT)
Message-ID: <b9fbee18-729f-483a-bdaa-51766a07ca46@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 14:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-romulus: Describe PCIe
 power supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250812-topic-romulus_wifi_pci-v1-0-2adbed1b1f1d@oss.qualcomm.com>
 <20250812-topic-romulus_wifi_pci-v1-1-2adbed1b1f1d@oss.qualcomm.com>
 <aJthkXa8BZMoW3CQ@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aJthkXa8BZMoW3CQ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c8093 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=3iqLFfv8AAAA:8 a=EUspDBNiAAAA:8
 a=J5sCG4akjCC_sdNGsZ8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=DXGsuw0cLJ7uQz9nXHMC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2i8F+RVOpOvW
 qHkmFO9ehAeO6YWT0XsuQpxkAuBgCGJQTjyuTPjS+vTyQjyZEl/5sBmr+gYp+IUPihZq+pc4Ntz
 E4igNwxlzc9kdTDrCjF+mgeeLnhVJ+wo9WUH9F5ayeI9X3XTUGM3nmzFi/DEQg2q0REFpmM29Sm
 QGB2PmsVClYY9OroUnNDXPDfsPLQstSQd/43iOW10/MrtYqTsKV92WGLYg1ZwIXV4tNbNL1xEG5
 wt8RbPifBlaU31BU6H/hdUASTvzjIvEywWg3uCYC/5lRZXbF69URD0Xpw2hVK23cn5nz2CbNLs7
 RkbrdY8jP/E/8de8zy+R2UFYOVUZmHAWgtqAcYwcoEGc5SbDkcrYkq3jPEq3tHwXpHX7ulzshmQ
 ptdGCCzB
X-Proofpoint-ORIG-GUID: 8rcqGimtkRay1FkfBh1yCZv3GeevrQMY
X-Proofpoint-GUID: 8rcqGimtkRay1FkfBh1yCZv3GeevrQMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On 8/12/25 5:45 PM, Stephan Gerhold wrote:
> On Tue, Aug 12, 2025 at 03:47:23PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Describe the power plumbing to allow fully suspending the slot and the
>> connected SD controller.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Are you sure these supplies really exist on the board? E.g. on the
> x1e001de-devkit, Windows toggles all these GPIOs, but there doesn't seem
> to be anything connected to two of them, the 12V supply is simply always
> on.

Unfortunately, I have no schematics for this board..

I did reverse the polarity (and removed enable-active-high from the vreg
node) to no effect.. so it may be that they're actually unnecessary, i.e.
so is this patch

> 
> Even more importantly, for a laptop I would expect they use some part
> that doesn't need a beefy 12V supply. I don't have the datasheet for
> RTS5261, but e.g. in [1] this chip is explicitly advertised with 3.3V
> power.
> 
> I guess it's hard to be sure without schematics and it surely doesn't
> hurt to toggle these GPIOs like on Windows, but perhaps a comment that
> some of these likely don't exist would be good ...
> 
> [1]: https://www.sdcard.org/cms/wp-content/uploads/2023/06/SDA_computex2023_Realtek.pdf
> 
>> ---

[...]

>> +	sde7_main_reg_en: sde7-main-reg-en-state {
>> +		pins = "gpio6";
>> +		function = "normal";
>> +	};
>> +
>> +	sde7_aux_reg_en: sde7-aux-reg-en-state {
>> +		pins = "gpio8";
>> +		function = "normal";
>> +	};
>>  };
> 
> I think you should either do a full configuration (include power-source
> and everything else essential as well) or omit this entirely, because
> like this you will need the proper configuration from the boot firmware
> anyway.

'function' alone is really important on PMIC GPIOs, fwiw

Konrad

