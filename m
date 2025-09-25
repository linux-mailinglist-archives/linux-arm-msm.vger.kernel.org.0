Return-Path: <linux-arm-msm+bounces-75174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F30BA11F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F3DC2A822F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B095631B827;
	Thu, 25 Sep 2025 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSCSFT3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D023D7D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758827405; cv=none; b=B5L3L/9Iz75zKh09eD4gIyic5OG6r/cVGCdXtKYCcOyMlaXxgUFAmowtwg/zQr8zu2o/Y5k+XiRReTFJ2lh/kEQzItNgwEFwRoTFBR7D7ZJ/BFL7p7I7PrsbN/3xkkyknGXYuTU0mfARFnYW894S7ZGHPgL5yd9hRX80xbSLxPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758827405; c=relaxed/simple;
	bh=33QVb+NuxOAlvLexUpybIeM5jklhLL3UPh2hDq/dvyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbZXrT+tKEYX0sbOWjsMapCLlMX7q3E+AMQ6qRXOHPnx7i0/jM6gDyKSwmgB252jIlTjWq554eruUX3Jz/fFhf6+SqZccAOalFmkAMAskpT9U+O/q0BT9gSLH645WiRDQLywOPazDDSjyoM6sj5nxQWzJXrRkRXGm3zhQHYdMSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSCSFT3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPciB023329
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aq1TCW4NK+CnzHfz+6d/b4lI4bzihUEnE7N3vMMCLGI=; b=lSCSFT3y59o31pwW
	TFj6XKZVYaPYzpCcNid128RrCMIfeO+Xzn23FzOdnKkmBmMSwUbBvxTmh0nSlU4s
	8htiGqDN24BTjL5cESPckh+9wGyvxz+BN1D+3pOm8lNkdkJC7F89AcQWKaorMS89
	pzdDvasYNZX9+uWowYpKuhzwqGVrYqeN//4v4oIV+HXRJhnKGk8OGIEbC0uSDbEX
	UYfM0bvlVbs8n7JD5m8T9J66GQsNwDKOBu/Em1KqESA9nN11xumnBpg/1y7KGhU8
	RccnqOIqGaQEmnPu0g+Jcqpwc2GAdDfSNlaCbPPHs7+9Gnr7MMsS6d5rX19KOtzd
	VfUfeA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qr3fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 19:10:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b55443b4114so957016a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 12:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758827402; x=1759432202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aq1TCW4NK+CnzHfz+6d/b4lI4bzihUEnE7N3vMMCLGI=;
        b=mGfA36P06VmgZBSwxME+HzH/mCxhLl4dOecyUNHuIk7OgGXOJP8HalY6eawXNYwnK4
         HAJ7jdbmuNrWeRr5fyU0jeHfaPed5/FKkUb65iEprf0d5kWG8fF10pnkA9awrPg5nMDg
         HIrmKHH1fkSq2Gxo/p0vq7oBq054JSg3VU4OYFSpCl+xRIifeTz9ctZii5aOpG1FmrZQ
         N+kWqiiYb7Q8gKjGO+YZbJymHnbUhQ0B9XQrtc7zWMJLUUdT8J3VU+K/GDZGLMYyebvv
         urITZg6GhTNhjBGDR+JuanLSLUqtNC5hBo6BQvoIcmvfKe/vCIv8nEHzAsUHdBEFUMYu
         8r5w==
X-Forwarded-Encrypted: i=1; AJvYcCWrhW8ztkmKlnV64iFn4UF5u88HhAF8stEwe2C8sPuxVs4bE7oF6sjik2jVtNCVVE1ZYV5114/lOAn28+9r@vger.kernel.org
X-Gm-Message-State: AOJu0YwqNKKjSqn8Y1U4HrFz8O1tGolkW3d+qx+WBApCf2U+plvJKs9B
	pTVH9xrgmpgEoN5rpzb67SE1/32IQlcbmdZezax/yoBiTdlZdR43wPhxPCaZR+wIX2LERBmCPg3
	oIL20IaFO841aPmxBJPUeW8fyImDLLRi+fm5SO3pAhuWVkKm07844S/I623fVVVMbpCj+
X-Gm-Gg: ASbGncsEx705JwqrhVL4qtEPKxQaT7Vg5pyRDS/bY+6NuDxhZvKvEykX0FOeQlW0gNk
	S5/PaxS6X8y5wfSeOdAyMYG3t1FGMxGJNlDVwGa0EZFygf9ivZN6oO4tlcISNXB9RhfPAVKEWJQ
	PH0U5Lq0hrvh22yaBTIsieWXKsuj8kpXic8zpsTh5a7ATagwP27l5H0CfX2D0o3A7vWTf88Tbwj
	0At2tZO1FzWBVWOoDy03rxQDXuW5uEW2RmlhUqXAoxy2Umv2kCi2chmqqbwX4/6dEHihOhdDbhv
	nOduO2EedPa8hvFw+YlzFDKvzrS7sOBmVavmPwILw4KtJHazCmiFoJ/KIha2k/bvwGi8gsY6Soc
	=
X-Received: by 2002:a17:903:3503:b0:272:d27d:48e1 with SMTP id d9443c01a7336-27ed4adb725mr51666895ad.57.1758827402378;
        Thu, 25 Sep 2025 12:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsdikHslccjzEdRvkqdX7DzQqj39+zjdTyWCwDH4G4Cf76Ibq1t4sN3SiZloNNOu/uTbBqYQ==
X-Received: by 2002:a17:903:3503:b0:272:d27d:48e1 with SMTP id d9443c01a7336-27ed4adb725mr51666635ad.57.1758827401958;
        Thu, 25 Sep 2025 12:10:01 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d310csm32368545ad.10.2025.09.25.12.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 12:10:01 -0700 (PDT)
Message-ID: <0ec617c8-d22c-f37d-b66d-3a562310982b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 00:39:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-1-e323c0b3c0cd@oss.qualcomm.com>
 <vqzon3svfqvk3poz76jm5x5gf4rd6vkygegonafcprmkejt4aq@5kwlwytg3ulk>
 <1af0d19e-30e0-1260-877c-5d6027c3d297@oss.qualcomm.com>
 <888e0d4a-ee44-4b09-8dba-2e0b282c205c@oss.qualcomm.com>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <888e0d4a-ee44-4b09-8dba-2e0b282c205c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OVeR70NZQD8-d945Pgdk13HS5Fflj-z7
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5938b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=AkZwv1uTgJSVxlfcUQlFCg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_tU7aAVo7FkOKzdvdu8A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX9ODTr5vv9kyP
 ndwEVQ70wmTAt5v4ANXaUUa1rEyU0wrFxuj+8X01oc6HJRc/DQfnOXBVMhUj4k/61CbCn2Hat3p
 n7YM0VEcK3Yetb9yVeYInXlxQrOKNoPg5CUzXboDZ6biAIPcTeKI1HQqoxFXk+92OljLIDmOC8W
 mqNYgFDkmz0JePK2KC7I4tMGSEgzv0WtqK9P8yJ+NFNvCvkARZ53N+i5n2vfSLRZjxISYK8NPO5
 QLi/cA1EnbJsYpI/zaZyMOXt4fG5gMwkFLR1dm1Rto0No4dfpAg9aBwWK5zaq4DuvMoO+cx/j8O
 8C5WkSWVietwUOi11Aerlg6JCCFA4eHtHaK3GDaBmqjBKW7XowajqXTita/J9Lh7CE3mKw/Mbp3
 yesjTK/jIf7ip3/ZC6lI60Hx/90pHw==
X-Proofpoint-GUID: OVeR70NZQD8-d945Pgdk13HS5Fflj-z7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171


On 9/25/2025 2:29 PM, Konrad Dybcio wrote:
> On 9/25/25 9:57 AM, Vikash Garodia wrote:
>>
>> On 9/25/2025 8:36 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 04:44:39AM +0530, Vikash Garodia wrote:
>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>> compared to previous generation, iris3x, it has,
>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>   (bse and vpp).
>>>> - additional power domain for apv codec.
>>>> - power domains for individual pipes (VPPx).
>>>> - different clocks and reset lines.
>>>>
>>>> There are variants of this hardware, where only a single VPP pipe would
>>>> be functional (VPP0), and APV may not be present. In such case, the
>>>> hardware can be enabled without those 2 related power doamins, and
>>>> corresponding clocks. This explains the min entries for power domains
>>>> and clocks.
>>>> Iommus include all the different stream-ids which can be possibly
>>>> generated by vpu4 video hardware in both secure and non secure
>>>> execution mode.
>>>>
>>>> This patch depends on following patches
>>>> https://lore.kernel.org/all/20250924-knp-interconnect-v1-1-4c822a72141c@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/20250924-knp-clk-v1-3-29b02b818782@oss.qualcomm.com/
>>>
>>> This doesn't belong to the commit message. But you also can drop this
>>> dependency alltogether. Could you please do it?
>>
>> Sure, i see below works good w.r.t schema and dtb checker. Please review and
>> confirm.
> 
> lgtm, you can also drop the interconnect header (i think you don't
> need any rpmhpd additions so it can stay - potayto/potahto)
> 

interconnect can be removed as well.

Regards,
Vikash

