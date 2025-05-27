Return-Path: <linux-arm-msm+bounces-59637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E9AC5CF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 00:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07A709E7501
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F801F460B;
	Tue, 27 May 2025 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B61rgfbF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429B20A5D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748384529; cv=none; b=KAj0fa+bbAH+GQZHDw97Z1hQaunJsbcvT2M43orurH/9DK70Gx7+J29BxhkunZMsLGlIT7ZpeLxEznBZIaZSBDqsDc52jCet4h5SUE3C13qFwDIMl/OdjAYcGfF9A4IssV/20tsaozzML8aNpiEDVQ5hutWSNgqX5S8Q1B5OWpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748384529; c=relaxed/simple;
	bh=oWBAuylOevnG14A3o6B6U+zMilcjaHUpvqHHM3GDbSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgejMrYMkFmCV4x9Am82p3odDLFrrXQiLSxBGTvHF3HSAp2GwEUUkxsVn2opssWayn8iLqWE6imbHQi3nvAtFGyd/P35fJhhIazGpKScqCNnC95ZSci0s4W7ChWTivxDaCYZDGjeI+C+VYw3bhV05CpEq2cb6pL5+To1sTHKvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B61rgfbF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIHwf4000710
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 22:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	co4RwX7fyamGEB9Zn9Nbjwa2/IhbSm6IfT1PpDPhJZs=; b=B61rgfbF7Hxrv/HA
	U859kjzYiEU2h8YPkR74d73ZqKG36WRePqQKoyOQZwy+gkNs63KJLy9QiHf/TE0R
	2NgKKdLreoDJGbiUtY2QaSP+49ahCE6kBVxbk1mpom15XqxMBukMKh9DVYMxr4x/
	Gz0IyJZPgho44gSsK/PDGba4rdo9Ox0GUoraT8Vtz2JQTMyBQCJhbEewMrtusbL/
	pkDpQmvai8DFSjMFh10nuKlkByF5NAEKdKf/sBdnTl0RMY/LqoXArhLOtY+pmEhO
	tW2mqZoMEBf7WmfFTfyJnwkViWv5ZWvk/pQM/shUhXpgMXKuQwy5ytp0o/LSnfdc
	R8WgoA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g90bve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 22:22:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so631366d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 15:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384525; x=1748989325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=co4RwX7fyamGEB9Zn9Nbjwa2/IhbSm6IfT1PpDPhJZs=;
        b=Iwef4TBNgOXXYTZxNgznGxmrOe+KilHuhcWc+85kUQFP4CnOBiRa1bkVmUtQ9l07zw
         UanWcun6+sTCqW1gnMdhbT/RKEaT7+AsGnFJa9CZ+Jd+7ftynUFLCB1uuYkvad3wXDc6
         I/0Yc9boCbAXiCzCJFm4LQyfpcntFYtsJABHf7ks9i2gtDyonYKAzavNh/N2yMvDX+oL
         14JkGRSTTLFVEY9YMZ8QyAvQWOkdo2WJ00C0QeozFOODxKyT+WSekbb5sjABYvuhh1v3
         Ug6ZD+9Le0ekLKKTQxNkchkUlCAQX6Dhm/xbn/baNuiXhV3h/4cLLe/ziumQlaGFrfCN
         pJzg==
X-Forwarded-Encrypted: i=1; AJvYcCUgXmROFQTrKdufcmwwHFWP+TKhIHdLBREj9brA6bN3exYBxitqMowI0S8lp2Mr4ctEqKxcX9S9e315FjUR@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+d6YcIkE6RZSEp6wX89dFauVxNasDKb5ptelSAW9QDs+sKm6
	OSpgDhex64VtkQiegNVzGJNOTumZKXfa1xTvNY9B1WJWfiiXA/BzEjc5EptQ4nuGmcL6dFENEwH
	KQNmcAVSS4Rxf1bbORsv1NbR0HFj9p6YXMf3OPczMyAq9GsRVO8cKFeTtkC3K3EausZFA
X-Gm-Gg: ASbGncvNaAgeaSN5qQyBuMRqijgBy+mnqLd4Hgj0vfQGrXJRX1Thphf3pwjvCF2wLQG
	TQwqe+ogmWQefoz56X5YgfEdwItoWtGFYCvsnhBAP5SPNN7bHeMCf6CpXM/l+xVho41XnaGctBQ
	CiP7tjjSh4hy+pxZ+fPfzqHZ+mqEpYa7yxqI3Ztnx+iFFKiRD6R0EcWyF0jynMVcOxIMFkEr12d
	VAbqXNKzWVTi1CPsPCxXzFPWagFMqwn3B3cAyAlWGkPlSUcGv26lPE6A828F8k9FeNW+7GOenQs
	pRjUl0avpc7SJnrIB7yVqo+sSa0TBLLYXVtQ+7eYNoH83CitkTgDZN0KoXekQWX9tw==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr114438616d6.10.1748384525595;
        Tue, 27 May 2025 15:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPdM04AdWocnf2vMjTqsH3Hq3s8MdMYiX5o9329a/ATt3+6/aInv+e1DqCUlQfmpR8ii1oeQ==
X-Received: by 2002:a05:6214:21c2:b0:6f2:c9dd:353d with SMTP id 6a1803df08f44-6fa9d2baa17mr114438206d6.10.1748384524734;
        Tue, 27 May 2025 15:22:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f225f7asm18968066b.117.2025.05.27.15.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 15:22:04 -0700 (PDT)
Message-ID: <7f464eb7-469c-4350-a43a-3b99394ad689@oss.qualcomm.com>
Date: Wed, 28 May 2025 00:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] phy: qcom: qmp-combo: register a typec mux to
 change the QMPPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-5-f9a0763ec289@oss.qualcomm.com>
 <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <itmvwhcf37bmnpadcyc7kdt7wx3eljyjwyv64s24zwhbr2e45g@76uzcpjqzx22>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68363b0e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=L9oCjnS6bectiR9KkwQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: l6xxZ2NwuMJ6ditGIKiwxYs_rummrhHN
X-Proofpoint-GUID: l6xxZ2NwuMJ6ditGIKiwxYs_rummrhHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4OSBTYWx0ZWRfXznR+Th/0Afsq
 vPlTFuUdqqI9zgbd79+RTnknCq3c2N1h8OdW/Mz4bwN447CEehVxVCUVZG7o9OmtbKP/2Q++Lqg
 476H0GnyhW+2o/4KKwSbXCl9OyBq+haBLNtbXE8kHBj39TBT/6CJ16lxEZDFre1BgeLy7Zs1exy
 ETBZhvGcSyPNWSyCvsfKEh/0EAMRJhJuf2WIVMJIgbpiXSISKnwsPjDUmdG0gefasmfX3zSj7rp
 e3j4F3ACHHx3qhDqeOJTNPtvM2i6Y//aYbo4G16cbtmpYIAUd9Ur3SnATZjti5eR9DoaV3hT4yD
 ynzAemHUceyOPsGq61GMTGyOdJGK1xTHL4JEmfm/7ey5e6N19wgesvlQdkZsHRbsvS0okf9Slc9
 2qAj00zfZ7jEOQ/ZtUQzFcx+rWoY3V6HqOja2is2Hjxf0QCu+SGEGR6v7D2ZxuEbl+n/Z4j4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270189

On 5/27/25 11:55 PM, Dmitry Baryshkov wrote:
> On Tue, May 27, 2025 at 10:40:07PM +0200, Konrad Dybcio wrote:
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Register a typec mux in order to change the PHY mode on the Type-C
>> mux events depending on the mode and the svid when in Altmode setup.
>>
>> The DisplayPort phy should be left enabled if is still powered on
>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>> PHY is not powered off.
>>
>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>> will be set in between of USB-Only, Combo and DisplayPort Only so
>> this will leave enough time to the DRM DisplayPort controller to
>> turn of the DisplayPort PHY.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> [konrad: renaming, rewording, bug fixes]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +	} else {
>> +		/* Fall back to USB3+DP mode if we're not sure it's strictly USB3-only */
> 
> Why? if the SID is not DP, then there can't be a DP stream.
> 
>> +		if (state->mode == TYPEC_MODE_USB3 || state->mode == TYPEC_STATE_USB)
>> +			new_mode = QMPPHY_MODE_USB3_ONLY;
>> +		else
>> +			new_mode = QMPPHY_MODE_USB3DP;

To be honest I don't really know.. Neil chose to do that, but I don't
think there's a strict requirement.. Should we default to 4ln-USB3?

[...]

> Consider the following scenario: connect DP dongle, use modetest to
> setup DP stream, disconnect dongle, connect USB3 device. What would be
> the actual state of the PHY? Modetest is still running, so DP stream is
> not going to be shut down from the driver.
> 
> I think we might need a generic notifier from the PHY to the user,
> telling that the PHY is going away (or just that the PHY is changing the
> state). Then it would be usable by both the DP and USB drivers to let
> them know that they should toggle the state.


If modetest won't stop running even though there was a DP unplug
(and therefore presumably a destruction of the display), I don't
think things are designed very well

Konrad

