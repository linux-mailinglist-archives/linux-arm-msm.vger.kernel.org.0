Return-Path: <linux-arm-msm+bounces-72703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF9B4A596
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87C51883087
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1878724EF76;
	Tue,  9 Sep 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SamWdDe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3E253B56
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407182; cv=none; b=CcyN5fsIinTeCKvkn4FagNXCA48lR0cbhwjeguK+CljxPbkUZO6gMj/MeYfVEIwNTfYtpiCbroHe4DjqtZ1FnZfCNcWrOO+apgcGFuYGoQybpiYektIccuU9nDuB9HOtzH0k++3R0HkcuywfLXuEIjsEU2d79hksKgu+9Uz0unE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407182; c=relaxed/simple;
	bh=CEpRgykXgmcUp1jg8eyRMU+1agl/A+ACDsCB9TJ+jLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tbi6onB9GbK6xrmN8kN8yyJsi3tC7f1rsZtiq8QP/Xnjz2qklunVcXJGe0Gv6Tm8BbCQZvbePeDiSwz+CjeDd3DdyiZvh/HaoRxf1cr/7zf5TC+ubQSHnj4uZ4NcZ23D6eGUuFdnLvOsxSiteukidakQgbI564Rg1I/OaJa6CTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SamWdDe4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SZg8021787
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDpymrykwq2D9vEJfSPg+EEbvFuEeU+GWf9UCfxacp4=; b=SamWdDe4fTtbgA9R
	SvvGuYQtNjyLflZYkoug3yceJxrIesUeSQEEtWJrQJpvjQfSWzSIBlPsD5h6IQXx
	0IrbpslAYVraUSdlu828cic2BkGX0/LrZpbvFAFQ1tcaVYm1F4x9fGNo1xxcCOZy
	BCc5vCmrgUgOCn0uVBtO4YWExFS9Zist3V6gRtOnX8paRmBWFV1ToqtlAM3opInu
	eO4xORvJRD+ZsGS0bDSiWfSbwTzRI5zlNamN17RzZyD0D7CHI1tSq+UARJ7qVmqV
	M7L6upjLJifW3ToswczWfx+DxFTyrCZSaCzUozoELgOFR6xrKT+K/I5P5GNxCyQV
	IS2jfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37v1ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:39:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32b5f6d5292so1529812a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407178; x=1758011978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TDpymrykwq2D9vEJfSPg+EEbvFuEeU+GWf9UCfxacp4=;
        b=npJOkoun4B2MdiCBysCs4vaHEO3e9ekF3l0qNG/30xcf7IouKSmjcn5WjhAE49NfBY
         CSvMBVMBGvp94IzHd4+SCOVH7yOjTcbgDJN3jbd5+acE9bVebvCGIafzp9b7sgR609xK
         S6tTZ7xqtCpte2yQhxdcNXw77T+vofEiwDc77iw5E92Bl+zxjiHPdGG2xmk1w+8qQ1o+
         VOZfsa3TMAkhVKYSmBJWvNRkzEzqInfKHl+EdXo6a054C0uEDGki5RChhCL7hs7nHnXy
         Xd72DyJa9uVg+XUFAgPfls8nQhRwwNiBVtIhDuUCrtorBKwiUpLtEFPXHjAchowHsAnA
         pyxg==
X-Forwarded-Encrypted: i=1; AJvYcCUk4eNuxO9fJgbxlijra0bYV6oI8YykasTUeT/i2lOTymgAqMU4Z4shZs/6cbzZ/g45VmGWFph1u/6vEOqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzJuFEPZ66X+vUOONRevxSpgLCFb1CTl89qQ9unXU+3csx/5T
	azciLdk2rJQQAs7zhDXBzijrdec6GBCCUe8JEk1fTQOEhp8tEwsOiMru2FvBwOPmnxf+BFlNUQI
	POU2T1VjCC4HnLQ/2YlFUx6TXsTDCLhJ5NCpewEcg1SNxUVr/NduhPyEtn2niIBKTxXx8
X-Gm-Gg: ASbGncu7WyhFPL2ZbIu0ihaSvlUB+ueakXL0OMHAesCL2puWWyZsjW+Hdt9mSKFlVvq
	BuWLz9zqbFji3FDTg3+Rpbp8MIaBhaT0uEbhgYhkfitjdKyWxRYfUlQxUHOGMfhIWae+d+MljD+
	iBKdtnj9EuAh0juTKAjTYy+ns4TdhpNAw0OrfmvfLRPlaqYYwf9dA9iuTGnnVxecDXIo0KE60Xw
	7Ml/iOwxE7i039weAVKj//WFQOoeX9n1mx6zpX9wxumXNpTli72I0iu99Q4bMHyDUDzyMiSkwj2
	qLwrzsnO1shr0nCIouqewOBwyuO+asI5ePiwi2zAwPzU/Ys+vjDK4HYRDY62USgA+EVyxG9xg3F
	MAvIGWS1PgDm7C+GkVoF5AaIwsk5bIQ==
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id 98e67ed59e1d1-32d43f91aadmr7805291a91.4.1757407178356;
        Tue, 09 Sep 2025 01:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QbVcmVO7aZqm/k5QXoWRXC9zn0nVpx+dXw+04HHeABOWQ0WWeFhtm+A8ZDuAd6zzUqgtWw==
X-Received: by 2002:a17:90b:4a92:b0:32b:87ef:5faa with SMTP id 98e67ed59e1d1-32d43f91aadmr7805263a91.4.1757407177787;
        Tue, 09 Sep 2025 01:39:37 -0700 (PDT)
Received: from [10.133.33.137] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57b227sm39403466a91.6.2025.09.09.01.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 01:39:37 -0700 (PDT)
Message-ID: <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 16:39:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0BtWkRFbRdbh8HyFN-dYMy4LQOteYllo
X-Proofpoint-GUID: 0BtWkRFbRdbh8HyFN-dYMy4LQOteYllo
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bfe7cb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tCOpKogST-nIjDDcSvwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX53/31XUaLpDx
 OPPcGcLBzYG87i4vsvdYZgf5Vfkfk0mj6i4p7ohB6RNbnI2cncNVgK95dLvMVbCnQ4TCWTirfFw
 4GVsvPtO3DlWkym8QbWxROI4HkrMSAHRtTKinDis0VW9eKOplgyxNR2ax8a4Byro2DyIslnx1XV
 NGNcwQ9JTsmVbbCkODA3WTebL66Mr8CJ8IxBZQ568R9uRmJvcahPNTb2zT1XLdtAyExwi/dC4OW
 78mnZkD45rDOcQUGFdv4QeNczMmhO/VdJsVqPZ65qVHhIuiEy1c5dOLUpHQOnL+KE19xE3uL/BT
 +O07f22Nbme4U3QjvYcQiqJUe/tgSbkjes6plbs9WpRFbGaR1jwi0kH4eeOLKZFpgTnUgoz4R3/
 Dy7mmbbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066


On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> While SM6150 currently shares the same configuration as SC7180,
>> its hardware capabilities differ. Explicitly listing it ensures clarity
>> and avoids potential issues if SC7180 support evolves in the future.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -27,6 +27,7 @@ properties:
>>            - qcom,sc8280xp-dp
>>            - qcom,sc8280xp-edp
>>            - qcom,sdm845-dp
>> +          - qcom,sm6150-dp
> The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
> into msm-next-lumag. Please rebase your patchset on top of it and
> resend. At this point I'm interested in DP bindings and DP driver
> patches, the PHY part can come up separately.
>
> As for the compatibilities, I think DP on SM6150 should be compatible
> with either DP on SDM845 or DP on SM8350. Please choose one which suits
> better.


Sure, I’ll split out the DP binding and controller compatible parts into a 
separate patch series.

SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
But I noticed SM8350 is still configured as SC7180 under dp_display in
msm-next-lumag’s top, so this change will mainly about the binding, right?


>>            - qcom,sm8350-dp
>>            - qcom,sm8650-dp
>>        - items:
>>
>> -- 
>> 2.34.1
>>

