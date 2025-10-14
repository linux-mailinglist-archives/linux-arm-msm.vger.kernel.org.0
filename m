Return-Path: <linux-arm-msm+bounces-77128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAA1BD8703
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A2894E1E94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB70270ED2;
	Tue, 14 Oct 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBTLhYiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B818C31
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760434264; cv=none; b=XRXZWvJUW/2VpbeY0Hxrm43NDLaiZn4iU6tid0J0mVnitZXJ22EPWANdSzYPkLsmCsB4kCZvlVDVELZK6mv44KD0ZCyNpiAjsK2oMYD7FMGAKrMMGLDouQSVNRj2wf9EG4q5DAgktuWYCNgBqbs6f3J5NOfWESX5rHBCdCa1z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760434264; c=relaxed/simple;
	bh=vEcNDQBWVve4pED0SSI+pK4Wz6MIFUxUaJOPOR2Js7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbptI745+i8uDYBehTVfkwe7LeK4Jsv4+KKNap1wKE+nUF3wDkPdPH9npdQzyzKyQcgoAi4X8DZE3V2laI8fuzbGuAf48z9MaWFfIpaRVXN2Kth55pF15It3KPAb8NeFOZDJRyxZpgVX5SnyNG60PG5JEg6npXTYPyIaZ3B/1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBTLhYiX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Iuv001502
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwVihZd/2iWoLKh+aG/GWvUZ17cfyK3TQmRX3H96tos=; b=PBTLhYiXWAM6/TVS
	2c7pLVWvFwQdQFLJc4npJYRm+ilzD0axObBksB7cENkqOf1CQPhGpWtDlZiI5X2t
	t90RcLSLl1hdLYbYOkZKGn4VPUhv7Ia/z5ejs14M8ICqSKx1b6jrR7BU16fEvtQx
	Oyv0RHV9DcMiILuIs9WOwbLpIo/0RVkPW6SgQY90vv2ZP5vPCoj9dg5xfyeGWrut
	1d2TV+eDVa9movwvsvbFbOt0oPPiwHEH5jQA04/wEWyh++QObHNBKVZelazAO/qg
	t7OdrWyac0D2SCSL4xRzXZxNg2M96sKpbvkP008xbF2u/kZ4LokajIgEZ3qYVs0H
	/LFnfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa87xnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:31:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8247c6738edso26804046d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760434261; x=1761039061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwVihZd/2iWoLKh+aG/GWvUZ17cfyK3TQmRX3H96tos=;
        b=b9WB9ZtnKolrDTy7DHHoPkZqbtngUEOpaf1ihpt537odvR+FWmoywBYZTIIEZt8qTa
         90xhxrZXVLTiJeKGppafPC+xrjC//mvaC9Et5IndzlHHUzmbvSQxPKwdKyroVjqrmVBU
         +NxWUweVEaGNjFoUD9jomHEIvd+MEHTc19XKpf1f5ZXQ+gHXlUMNy2gqpTkJbVLS1avY
         mvu8XS+z4Q0FHBQTUo2/KXUwDWLav6z86PJfAjLNS9wMD8+IsSwMrL6HhB+NnFFBtLf+
         q0yEaLJNFsXPo5bH62p8KcncoP3s9TZ/6SYBkmuXAqSQckkMRc/3XzfjLJLHJg5OIbaY
         3POA==
X-Gm-Message-State: AOJu0YyawrvSPeqgJp/VnaVhFyA/KXuDawfg3ty78yIURI8S70iuzaK2
	97HAUXJ94m61nCLSCSenKFyMQwYoIbCqn3lsVLf6liNEAigEQDTkuuKNtYbgetsJ5ageWSeZfOp
	uujbZgsBLeOmwTgYkuDCAafJf1mr8CX3zI95+xyccaWPV/mxAJfiJZIU1xL5p/7csmY5G
X-Gm-Gg: ASbGncuwHtl4/E3Kycx6fIWWeh9RGkgiYCauyJF3Rq8tg84SWs8FrlmKaip3FR1XVXU
	AoeBy0fKEkHVAMxEB7kFbt2nONwBiMNoFSlMeswFInDmNSF3+f6Ph6+43OzfT6snDjASpDtUEG8
	r5/0B6Q5YH66IgouengSCnMmyBLlGlL9WW3GyDG8R4+ICD6aaTPvCbYP3q1CymJxJwl/MvOwnbe
	G7oZ8NaluolQS/I1fzil1K41uede1kMO2t3K5fMSBVJs2RaFmli976VkhqmG3VqPVggj3+p2g9T
	Sozd5M9G9a8kOKQJQ/bjdeROAaPTv8ABxoel+FAEnl3tiNCrG8+xrXFc33OK+cC2cI/xDhNwQW9
	m3pB3G3ku4hAobcYxgF1J4Q==
X-Received: by 2002:a05:6214:4102:b0:773:84c1:396 with SMTP id 6a1803df08f44-87b20ff9b56mr227829076d6.1.1760434261598;
        Tue, 14 Oct 2025 02:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl3KAIznNTpy4D/RymiqPy5IHzi3DP+VRMfli8rFMYCBBw3Vk/qI+qF6NtAwDHFqtlwZaUqQ==
X-Received: by 2002:a05:6214:4102:b0:773:84c1:396 with SMTP id 6a1803df08f44-87b20ff9b56mr227828876d6.1.1760434261162;
        Tue, 14 Oct 2025 02:31:01 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63bdfec82ebsm136980a12.24.2025.10.14.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:31:00 -0700 (PDT)
Message-ID: <2af5b96f-eb24-4a37-8f5d-a6911e256a9a@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:30:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add Kaanapali compatible
To: prasad.kumpatla@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20251014-knp-pdmapper-v2-v2-1-ba44422ac503@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-knp-pdmapper-v2-v2-1-ba44422ac503@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ExRwVWILZj83ZG2XDbbzW_ATjzSVKxIk
X-Proofpoint-ORIG-GUID: ExRwVWILZj83ZG2XDbbzW_ATjzSVKxIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX4m5KrxFvjtSe
 DfXZdE+4WUzTpV8a6tPzDM+4YCx1NjqyeYgyAP41zyb+4Ku8gcjZA0rmDsz/5fSr+1uqwqtoLoO
 FuFH5JfosHanHaJkzMvIosKNqDKr6eoFQ42TUGGXYq0Nr22m0tXNlUdm7GtLy3Vrxy6ykG//7cD
 Yp3yO4IAMCaY/UDv7nBLs4YFjDLWV6TfU0A7LujeUiUhMTNWSmOoCj2IoxuCNXCxlyAkQxwls40
 G1qINOuedJIrjgdST6sWATctPdmFkk1rD9PGIlIc0QL8whmlGAgHgUthVqda3cwXIgB13bq8t0Y
 ZHy5NnNAp5vaAqAkqO5cDt6gKPcUQqUxyqmxZhbgtePDpSOPsEwXnVC9D6ey3No7KneA7BvCJ6C
 rEHJcwv54q0MU5P5aK9vw1Ylb5bJXw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee1856 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5CMVg1e2JDiE4ByGS8wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/14/25 11:27 AM, Prasad Kumpatla via B4 Relay wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add support for the Qualcomm Kaanapali SoC to the protection
> domain mapper. Kaanapali shares the same protection domain
> configuration as SM8550, except charger_pd as it move to SoCCP.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add separate pd domain data for Kaanapali SoC.
> - Link to v1: https://lore.kernel.org/r/20250924-knp-pdmapper-v1-1-fcf44bae377a@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

