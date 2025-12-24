Return-Path: <linux-arm-msm+bounces-86467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961BCDB414
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AA023007889
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBD9328619;
	Wed, 24 Dec 2025 03:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCI5nfKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE15ezuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0C1328600
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546739; cv=none; b=stWrW/vQiwpJC5Dznw9WVr5pDHFz6a6IG6C6Lvy89/Z2mERFymzVbpj23TpjOXk6A6UMCqvm4p/Wfqsa5XepHiTT44aTNkr58YBF9r6ILDYCZlo0nlJUtikMavuf09mljXYTMaM41K1xdEFxKxC94G+iXTNW44fbWLt8s2NvO+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546739; c=relaxed/simple;
	bh=YogfM7E9Su7cm/a9YnyB49DqKML1dmzxlybb5sP0Zzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdtuRghLS9mPyjUCsfMbkwPK93It2U2mByIR6huz2Y80Qd+LVkPeQh6rsCyOGWOK+WarfyxRVzuKaN1rkeR/NrTqgGC4ci/JodpKnzufxheoFglZWUG7u+mCdhJpAkkwCuFnarsUfJSVReq+mXi6NdSIOwzlDL6dM+V4TzWNC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCI5nfKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE15ezuH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3AmLb913618
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mpuorEh3rn61RCVFKeiQgVrqrzAh38Os865pyepo1g=; b=NCI5nfKPxpL59E/2
	AnG8H9UrkCwDV7DeNKdilV8E8nEKmZJsdON1mR0XRQGbGbnvjbxj1wS95MS/VD9Y
	7RTXA5W0Zm/RcuY/ITCm0AyUkdfj9bGJIq4mvbcn8y9A8LbHnpf2+TclYw8Q64da
	w5ZA7BcbMYuI//pxOAZA4q0G4roiNAjM5Y+kFArlXxOLYnzQoycbGDi9Hc8psgAt
	GpGdyDOVDBgoVsyhdC/Rk5WunbBakxgLVRXkPIq7U1D82BHJMBY0Rr6In1sQU1oQ
	Z+Wa5acyR9OG+DaIFbbH+AXDGcm+Ne0U3TRzV0p4r45YLm7Mx3kXlAY+fffNwM1v
	Hj6lMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2hxax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:25:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1f42515ffso133705301cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546735; x=1767151535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3mpuorEh3rn61RCVFKeiQgVrqrzAh38Os865pyepo1g=;
        b=XE15ezuHe21nPbxKROlAJ71dttokmlc6wtmb5GbfMIt/hQpzlCeMxTrCB378Rjuxq4
         y8FwZEBcrjlSMzaso4lcx+SCWK4i1m28O9RAgIdQYQ1MVjR+L9p0USsDIhiNcCFfgrKP
         dOSq8tKTDWYoYmNUY3bx3J6ZNfGmv0ijRBH+wCaJRnWw1/EW5ZADa/hPiORVCqklVd0H
         HYv8/LxBk6+7pRW258kCGRwoiReZGyoVNyThs+3m614AsStZ3JKb04lZmGjz6nlgBKAP
         mN1mWjzzqI2pYKB6rmzaPOzlwjlkr7Y/ssnFK51obMjBdpSmJy/bUx9tVHRD2dc1SVl1
         IVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546735; x=1767151535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mpuorEh3rn61RCVFKeiQgVrqrzAh38Os865pyepo1g=;
        b=LTVIIp07FSv7yF5LV840ZKqWtjhYxj6krMQQFEwLnp1nCKLWGt91ot1J+yGU21vIC4
         bWZI3MUtJHmDPQKuWjtBObx0TwpvlsieS6ixbp7RMq4laxJgdCUm41ZA9wDVKPUM2YBo
         /jpqGh6nxptK35cLLQPvE7yWBrVEj1hFhgAt4fqJNndS8FrBUncc+W4rtopwZRM17qpf
         A2xRy923pI6eHzxxnJYtYYHr03dLNOlqgdSiFhvI83bK9GVesArhjp6qbep+ECnm+0hW
         ugSyLtBFoYqJXtUHvXdtMeoQ/RcdTQLVdsHqOJ/fNKBZpwUggdHIDtcgvUI6LEm7SlyQ
         pG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP06UG6U+36s7pxiKfN2D32LTiAVZdPirsV4x0MYuqFzm1iopmw007DGBdyWMhk951IuJREd63HojriJD8@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0F7tVrXRtw4996tdGFXhrO8lIzCqQy18i91ag4VG0AoWi8FR
	rUe/udRTi3gqR1z+4+NTXLXjArWS3mDHxGxZn5CZt022R9CR+j9/UKfJpD9OKuZXnDlrIXne31c
	PRJAdNrNYo+iKXgX8YViF1rUOejI34MWOWMFyYn2tUl7ViM9dEa6l56yl2qw9tdbtaYdb
X-Gm-Gg: AY/fxX6XWEjELiAEqbPz26hg44qn2aZWje62Mr5U6RyP6dJfK+oLu65X2IU/tg8pR3h
	NBitpdi+A/c09YZObPmofbrWoYpCEaJjZKenQiReX9r67UMN0z43F7rdOos9LRzbrvOdv+g8a9L
	Bc9e1H/n+eY3I2xdlndmsM/oJ0ZIczOmMU6yRvNdpSIqR5ADwRnjKCXepgTAG+Ij6hRgYeYLUER
	nxEdA/GJrwTt5MpFelGczMkVRdb60dpG1RZlVOr2SIfiwUawJ0SwkJDHoFily/4A948B3IjBulj
	0M8Vd8G8Ux4qvGs4tn/8AbxgBelujC8pJmdKR5cT+5J6Px01mWqFgyDFVodY7F/Y+BWfZQEy0Y9
	rWYiqAjcnArpPPi948FweCZJ+oWc0q2CITuPVejn1eVggpvoNaYGVZumUWbpr/p/gmllaohHDxw
	==
X-Received: by 2002:a05:622a:588e:b0:4ee:5aa:9c26 with SMTP id d75a77b69052e-4f4abd974e1mr274607191cf.55.1766546734767;
        Tue, 23 Dec 2025 19:25:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYVHOqF+RP6O7lF+Z99cznqTsmmDPFAIMPIM0kk0vUzFr6jmKrCTem3hCdVL5gRryFlEJYDQ==
X-Received: by 2002:a05:622a:588e:b0:4ee:5aa:9c26 with SMTP id d75a77b69052e-4f4abd974e1mr274607031cf.55.1766546734294;
        Tue, 23 Dec 2025 19:25:34 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62f59csm109924131cf.20.2025.12.23.19.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:25:33 -0800 (PST)
Message-ID: <40fb63b5-78cd-4c2b-b42d-5d9c3f8dfd15@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:25:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add sm6150 camss support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251223-cheerful-beetle-from-wonderland-c5334a@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20251223-cheerful-beetle-from-wonderland-c5334a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNSBTYWx0ZWRfXzUrYbVi7RUo7
 djRzpZJwbjkyz0lyc6RlCLV7jDUa1s38vJWmB56pUSNWwjCyl4mYeiUzVMw/v1yfMSdHC/8InId
 EqDwg4kNwyef+HipNRAaZB2Ae3GAx2RGXIkTAwMsZs9DDwm/f1Abrsoq79K0pUDFqulmD+DLazp
 WtO+j6tp4sCMZVGgwYj75QBH0vToWxSkqiXAPA/nAMDiIFjqLctZJqTBtFYq1QOExrxio+GdDeB
 5MJY6nKmYtlxUJPJqou/+Tt/Oxum6d3Ey+nR2BKY+rBrxK8QFBG7wTCsyBTN8cnp1PmSv8OhqeW
 zmiKdh/tNAO79s16eExoJLfCkGLPrUEgzcw6kwPMDQGX5KPT0lfaZtqbf34tfQuEPNGgfVayM38
 uUdEhHKwi8cD+RvD4X2vwyPQBTUFQm4nY299Z2EmzCL3KDxCOVX38ToY4WYwJ/EVOKig8IqPQA7
 6QeYq1ErLcgO9q4kuLg==
X-Proofpoint-GUID: 6coW8j2i-MS3TLXu-_HjV12zakBycFbm
X-Proofpoint-ORIG-GUID: 6coW8j2i-MS3TLXu-_HjV12zakBycFbm
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b5d2f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FrERxGTzyKkqrohmcvoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240025



On 12/23/2025 9:35 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 22, 2025 at 04:28:38PM +0800, Wenmeng Liu wrote:
>> SM6150 is a Qualcomm flagship SoC. This series adds support to
>> the CSIPHY, CSID, VFE/RDI interfaces in SM6150.
>>
>> The SM6150 platform provides:
>>   - 2 x VFE (version 170), each with 3 RDI
>>   - 1 x VFE Lite (version 170), each with 4 RDI
>>   - 2 x CSID (version 170)
>>   - 1 x CSID Lite (version 170)
>>   - 3 x CSIPHY (version 2.0.0)
>>   - 1 x BPS (Bayer Processing Segment)
>>   - 1 x ICP (Imaging Control Processor)
>>   - 1 x IPE (Image Postprocessing Engine)
>>   - 1 x JPEG Encoder/Decoder
>>   - 1 x LRME (Low Resolution Motion Estimation)
>>
>> Tested on Talos EVK board.
>>
>> Tested with following commands:
>> media-ctl -d /dev/media0 --reset
>> media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
>> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
>> media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
>> media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
>>
>> Changes in v2:
>> - Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
>> - Correct the order of the header files. - bob
>> - Add Csiphy id num, improve the resource name. - Vladimir
>> - Link to v1:
>>    https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/
> 
> So no changes done in response to what I asked?
> 
> Best regards,
> Krzysztof
> 

I referred to the comments you raised and the latest reviewed 
DT-binding, but since this was not explicitly mentioned in my previous 
patch, I did not include it in the change description.


Thanks,
Wenmeng


