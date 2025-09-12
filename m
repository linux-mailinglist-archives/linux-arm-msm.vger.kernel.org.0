Return-Path: <linux-arm-msm+bounces-73323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4FB54C24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75DEE5A3658
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFB7314B91;
	Fri, 12 Sep 2025 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caipe07O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7A314A8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678082; cv=none; b=U1lMqXHOP591VGeCYKLOwzAEWxyOIbiUdk5owOtSvakVdy/zHiBAQ7ZDbs4vihioFfsudJ1NdNy+AfKCQ55YYKHFZGQ73KXRRS7UoYvD+7pRuRyRKAtVyy4llHMs5WWCzSsgvxcSEXwATdQ/mV/z34rUiovvBWeNANYgNtZEP9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678082; c=relaxed/simple;
	bh=ZK8/4aNLllz7uk+iaLyWsRe0awdZ9X8BIaYRhatobqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqasRoCuA1XrkHLBoPmBdHdXrPz7RwFNnKH3sdRS7mnLd2tbkgBC7dhcrIWjjxOhzyuG1IxNampJ1Iy05UAGauxrZhjhdntFiVJICC/GS09eX4umUS8auZH2WdwXmjYnWBm96JFFSAmkAyggsmRasK+C3sxACr2jxNWA/y2yODM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caipe07O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fN4f019947
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CL+lI9VYcTxc1ylzMUGhgewY3tUhb2X7dvXH5IYD2tM=; b=caipe07OT38c4Ooj
	i5GS6gjRDKPJxngB9qSRS3lGHGBzaJ23DY1OTTMbT9bFx42LgXJB1JMNi50SDOXX
	CYaUzwoqLP6lDS91llXVumAo+FErbCJnBbN81ZdvAYdvP0AAQY7u/PwnCXh6YYq2
	5zTjWuIP9tm9erikfJ2KkwjRRGCGYe4Kb8DDwy0M/DwY1qZNg+1NujGaHY57X94D
	PW9oukioENMcRLyAm0X4EXawsB+GZNqRKLfBojab1Wy/LTBYcI0rHX5PWXp8g8Zv
	CdhJNLcL0IsSP2ds/+7iSiRHYRtuFK7Ax80KpGgUPo3j5Pq95ANq5TAj+hHoInr1
	ZiK/tQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t387xx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:54:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b521f77d978so364144a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678079; x=1758282879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CL+lI9VYcTxc1ylzMUGhgewY3tUhb2X7dvXH5IYD2tM=;
        b=TlNC0dBup3AQOIpofpu/4ShYfQLLe8mv4k9RjwH4EbcC/CpHShXu+9lYSPhQ74qOUX
         rJ2wow8Qk8wRJDq9veB/4JtP+8XtR/S0I0P+1/O8eta2pYvdrV6dm5mNLKKBII/Pwh8l
         3Ui5IVGNc6BuMAZXnvTWzd7Uh9CWrxK8S2IavHHK//EjfSxSwWnY4NgkyhLPKTW6j2Nr
         tvkh4xEZy6QOehWqU9hClUpsdB+sGUfJ7RaqlkNL4A9FJzsCH9wEwPDv0/5Btu3ti1sd
         7pUNZwJ9PizOIsDVzNhQXD8SecVBOMt+P+3JzOGa2lmNJnqn3Wl5qZ0ukAWS+7+DwAwi
         n3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmYKVcFsNdtqRFAGV9WNoJAAMTe7QP/cZJRvy5AO8a15v+0K+S1CEbuOBuNKBZEVcXOiTgkMKIBHsz90BY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfac8TVlkFSvXU8XuNdBiYlh7a+GMeDXdBh/LyBJ4z5ORcMg5t
	jY8i1yay9ygqZOJEcIHpJaOIuyP9N1dPuwHOGARGo+doTXQlLF13IQ2c/tj4XaxwznUPf+7wA06
	Q/T3rsHS+QoG5uXhsBMIoRS/iRXx7GTBwLHhPCG3FQo1jCWUS2z5sozObJhMBLFUcrByC
X-Gm-Gg: ASbGnctlEXyY7MyIPh+BWl8hyKwVpF6rEQjPyVYQjl9TgfwbAgptOGKaMMJ3I1QOMYj
	1sP9RsaWS7bLSWd07Wok8SJWbjYB10jBHbUAU8/SANt94bpt+Kfnr7hbdMF5sKGIbej0k8GCPdj
	tZMZzgJS96WcOglvIBh8boaem3wKgwIEnxRXiUC7FPWtTI65IGEeuTrWRtgbjI9kmPZ7AuwTFFR
	HBS3CUaP54iYU+mRVI8kTKvJBKZXkp4V8OhAmf/XP41rdMaXw1bL3KwfPJGyzjg/scOIDwB9l8x
	iCZTwG7D6a7LX1BCR5N8AF+fdVtv8ELbwft7rMTx15OYXM0IGcIF+PKekpG1Dy5fdNnv+NT8CTP
	KP1+kPVN95Y1VKEdUtk9UGi0LuLGb2w==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id d2e1a72fcca58-776121ec346mr1687405b3a.4.1757678079344;
        Fri, 12 Sep 2025 04:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBzCCMI7c4SuCgUNoxpx0ryUhDrHgck7Ry4SOIXMr3U9+ASTVocgB9v5TDYgVMzzCnDhSBlA==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id d2e1a72fcca58-776121ec346mr1687392b3a.4.1757678078920;
        Fri, 12 Sep 2025 04:54:38 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a46b7asm5251168b3a.22.2025.09.12.04.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:54:38 -0700 (PDT)
Message-ID: <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:54:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JhyYN5gq-l3MK1QsVZpT64BFUyEEvPjJ
X-Proofpoint-GUID: JhyYN5gq-l3MK1QsVZpT64BFUyEEvPjJ
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c40a00 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1DKY8yufIZSdyzbmga8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX82mohCS+ikFZ
 oe2edjSZ0gMRlbY5YXmBfWt2TsoqVVmJaoNjM2Dhk96SiFsjv6ibaIvtxeuH8O0RpTg6ke+Ghlt
 Deuc71+cAWDP7O6Yn9f7RmP6AhNX9ZN3+1U83zZOK8pk8f4bUwsbAAVBR7WrddiaSWNvKHViUpn
 GicknNT4cb3I8o0vtcP7oUc4L1xKBb7DEQWaoFEyS//u+t6TUPZK8NPQMRaHX94hkcwT3yfHtzR
 JB7pz6zJ/EHLV8xKtZt/8i4ryFQEma82WQ00RUEQ0Bu36cTn5ygYX6k5wwK4yPfPgT+RrdQuhl4
 29kILHp9QHrPNE5y4aJ5ykW5NnABWAx7KR1QgmjMEI0XYWc1lVjU6zWekWUhfVNfUiFpV0ESND9
 VWftM4zs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066


On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>> potential issues if SM8350 support evolves in the future.
> The controller is exactly the same as the one present on SM8150. HBR3 is
> a property of the PHY.


Ok, will update commit msg.


>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -46,6 +46,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,sar2130p-dp
>> +              - qcom,sm6150-dp
>>                - qcom,sm7150-dp
>>                - qcom,sm8150-dp
>>                - qcom,sm8250-dp
>> @@ -261,6 +262,7 @@ allOf:
>>              enum:
>>                - qcom,sc8180x-dp
>>                - qcom,sdm845-dp
>> +              - qcom,sm6150-dp
>>                - qcom,sm8350-dp
>>                - qcom,sm8650-dp
>>      then:
>>
>> -- 
>> 2.34.1
>>

