Return-Path: <linux-arm-msm+bounces-77959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B28BEFDB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08EC189D328
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 08:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053482E8B81;
	Mon, 20 Oct 2025 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gf2VOWhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614212AE70
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948069; cv=none; b=Jn5qdYgHn85lBDihSfobvJqblGL2HEqcbh8klENC6FiK9fSRyiFKRonB2RH9wUiMvZcgBzcf+pCz6Kngg1Bz2nnfmoyYWAlterSFJ2MVNogl+oEekr6TxzJmAKLiEh01UBRcrXAk6H0HAGl02xCikcQLMNPHpEPFNNtWHYduqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948069; c=relaxed/simple;
	bh=cs/xwuUJ3xSLb60nDjVj/RGExK63dRcpfrrA3rrfMX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFhw1Bsw3MOjGVaZOpFKe76SkiCAzQ73RQad+sKmIWDLrSXiOfegmIsRvHch+BFaV8Vr0IdddXk8BH5t+nuHAWdHITUxGgvhjWLhbycZxF9W/TWRS91f5wOr1WYQXAnujjKjrYDD4IEfByX6SSkP00G8oYcfnlslA9O9mS3Qibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gf2VOWhK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMaugh015332
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqErHmEw+q0Gb9LguQ9gJqRnV0oxz5k7O/UGJB1RlIQ=; b=Gf2VOWhKCdH1LMKb
	9l0Yyn6xFMW3W1lHdWbQ3AeeIsfo5zo199DqRLl+stxPOmwCJOYnrwV9L6z6Mqhq
	E+mB652cyDj/s5VjEzsHalsEwqQYEs7bJtwnWDsHkHDAJDKEgHBheuBOYuR7zkVN
	ZbyVSSb6/3LR2Y/mD+g0PULsaXtS8i0WIXA4oi1rV3PwKwsKpnV+6kuiuIj/9eiI
	Ll8+EwhEbUShIBW+ViBfAYsNYl468aRKFH02eyUVb2bFFIKbo7IYAnRg4t0iJK3u
	Rg9MV6ZHGek0UzbxkGR8d78d7en4ymOJs2Zv2M1KVpyw49/tujlnGFCpZbLDuteu
	xNgpmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343v2rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 08:14:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7811aa16c6bso655431b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 01:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948067; x=1761552867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cqErHmEw+q0Gb9LguQ9gJqRnV0oxz5k7O/UGJB1RlIQ=;
        b=nFbF7b2Doyx1+rez3cOlVXsvYD6A4+2lCQhwaLK31UDZ20FQwXzXzHqG1iC0sogA7b
         IH65MgIVYSMWecn817MoOgNGY6TJgC9V3kYa9WGddlO9jFYjsZ7V4MsKjYEMzdS0l89s
         kwUMtAw0r4mzd7EwcJCgI5ItUzi+AG0ssTIlsJmjzNSiJQ6c/5X3qgvQ1fogYnyQRYnT
         mmutUorp7X+tH415nV8AMSrIwsliFVDktuxCjXYNDnmHYvoC9a1Gu10Er70Q6meHGVVL
         DInVirKKD7UwbO8y2uCRz5t0MElon+WKcYA+dW/XioNNmW2ucX1dglu1CI+FUcefqKL0
         m+4g==
X-Gm-Message-State: AOJu0YxVca1cByEInnHDLSlIpSCdlPUKncOAM3LlEX2ADm9Wbo0s6Zfl
	i+cS/DZYFzc+mGN0p2FWvr2Roo3w3qf/PwvyYfIlSC2mccCmkkv32I9BdGbWjy9PBrDsuMSXoWk
	i6EFFStZR8ZmetqtxC2uvHXhvF9PNWUlYBMT2Q5doq98MYuCZAWs39xl09jCHcBNDhvyc
X-Gm-Gg: ASbGnctFXjlzqK3zuAPA6lJeYaKgYW9xsCu/4pcjR3EWUx6euzXYYavnDcXpXD6ezct
	DC8Vp7fTbNvOdUZDeXaVbDBTHEsFMRr+jMdfXJEj90NYUbbPdMOfbnVQuWm37aQHevRSOUEvN1P
	HBO0qInumrAKsQUcUoU7/Nd01vQl0ffcGx7IxjakkSQer4koDNDzMOsGoosyHp47WKTteCQqkNh
	b4uCPbIawuri0d8tNL3rD1bWXJisYPu3v3bSl/dzL1ymiu0F5HxPKNtoVmkvbOzg0Jb24a8owhC
	KIL1CbjZGYM5+hMRE4ZrRWJ+oYYbOY1rJMPZgJh3pIL9uFq2dV4TXfTsgc2aa1vQadReJL+Y9iw
	SaJEiPcpmPatdHqg5GNPVwXCWoKb3yBh8CcxASTXUsqrAnyTvWBIHU6K/efPwzSxQ9ZwMiw==
X-Received: by 2002:a05:6a00:3e17:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-7a21fe23a9cmr7338906b3a.0.1760948066773;
        Mon, 20 Oct 2025 01:14:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYG7VcpOs9/sXd8l28vPILUQQOWXIHteA2HclIXYOQtqaNMgzV91sC6BjxWGVMix8BHepUSw==
X-Received: by 2002:a05:6a00:3e17:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-7a21fe23a9cmr7338892b3a.0.1760948066367;
        Mon, 20 Oct 2025 01:14:26 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34b8bsm7573235b3a.22.2025.10.20.01.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 01:14:26 -0700 (PDT)
Message-ID: <eaca20a6-5aed-4870-b45f-e341d119db3a@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:14:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add DisplayPort and QMP USB3DP
 PHY for SM6150
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-2-aa2cb8470e9d@oss.qualcomm.com>
 <13d1491a-2c5a-467d-bd55-01c0603a4b81@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <13d1491a-2c5a-467d-bd55-01c0603a4b81@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JQdRlHW337tPYuEiym_7k5c8EW8WImBo
X-Proofpoint-ORIG-GUID: JQdRlHW337tPYuEiym_7k5c8EW8WImBo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX60OH45zWu96m
 1+9XOgi4DixccsoNYrDbfGPWXmGvSuv7hE6rvmgfgxUz0g/I3xluVuTlWWpvaGURKA75fPk0kVg
 i1Lm5M6crAJFW/dLoG8kkmFbnqRgBLA/S35KQyrRQjDevXVvu99yQdYwRrb4azTOuzjlwDL+GT8
 0NXCIZCsWg7+dkl8IJyzew24VcOokLdLK4TsVuY3zlhyTSlSm3MqSeLqTlOmqw6naPlxStHvT0K
 PQDw75Ts7KeTIgFaxpVycLsjj7dLL0ZoZ33EnW9igxON3efNy2Jt9EivQlGXmV6xmQeO6NQEmz/
 R69G3Ic2kqJGLPHPJGhztz5o1u4h344EU6I7AMBDQUuwNpbcbNwJgix28vK7JCbXE06swX9cU2Q
 J6Wzt5GADMOXMqozzCZlM2iNj2XYSQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f5ef63 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=teJiM7Ac5wN5jP0k6lIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023


On 10/20/2025 1:11 AM, Krzysztof Kozlowski wrote:
> On 15/10/2025 03:53, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Introduce DisplayPort controller node and associated QMP USB3-DP PHY
>> for SM6150 SoC. Add data-lanes property to the DP endpoint and update
>> clock assignments for proper DP integration.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 113 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 111 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> index 6128d8c48f9c0807ac488ddac3b2377678e8f8c3..36a536cef99a095938f3e18a9b5e7825308ca426 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>
> This is ordered, don't break it.


Ok, will update.


>
> Best regards,
> Krzysztof

