Return-Path: <linux-arm-msm+bounces-84713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06087CAE2E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 22:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1B95300A9EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 21:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119F71E5B64;
	Mon,  8 Dec 2025 21:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPvu0I/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsHHh333"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FCF169AD2
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 21:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765227793; cv=none; b=ASkKxEOaQcC9qzb6RV+HkuS23hAtYq0/2/IHFW7VBrHJJE9cH/3e+O8gmtJbmx/G4pRgScQgbXpeBX0fr6jEXkLq1T0hz4Dqt7UPtJx2aCIVdyeD+MJsauerekCv1X2KXIXI+a930/SzL7KMSoc/yldWhkO5BMy2oEm12RHnP4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765227793; c=relaxed/simple;
	bh=M50YPCi1zz5JyV41NvIqBkDQ1nKv4YEJGAXl98wk7A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7qd/lB0qsk26tJ1P68dmpe1hOH5I12j2zi7P1GN/oNSYyF+yqOzg8MdeRz/G663K1b5gknfVbbcBZgHMxqB7cquQvhzD4r0FvUp+zLnf1GFtuOI0Y/wtNv27nhrfSQO9Vr58sa/+b5He64sjX51JR2jHXX8PQ/1Y4Te5DAVt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPvu0I/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsHHh333; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8HLPII1224535
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 21:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwXU4yEkS5GKD6FWOwlvuTVQTw1siF03sQUIknd3y7o=; b=EPvu0I/U5hPRkEyc
	Yr1HmliDK6SE4UhoTCFQhrX7kBdWvcvySMTlwj/Sw9uDlZvhM+Vu5Xwu1dlzB9SW
	OUZ3COW+MTMYNwum/cP+5Cj7JPl/h1QxNv4ZdwzZgRQlRJGk8wDGDYv6jaBO/CYN
	7znAKZrbLlS/4WXU/U9MXnuEO//8zFlIhUUJrXFZQW3jh4q9bjoDOfj9qUrrPlvQ
	Iwi9tYJrmimP4RSs5CGmen6tHJG0IHQN8wUW7DY18ColhgwKMigIFAS/41QFkOoi
	lp31po2Sq73qM5mv4rAzxh/ynh/N69xoYB7jE2YSzu1nnIRB5Ls3wBdLFqtBvwCr
	qvOi6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax30c8j8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 21:03:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bdced916ad0so4475846a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 13:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765227790; x=1765832590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RwXU4yEkS5GKD6FWOwlvuTVQTw1siF03sQUIknd3y7o=;
        b=WsHHh333sZHWi6yvuuqr90IfJL6N88nvErv4F+++Ck5YJd6asj6LYt355UDSU8r7Jb
         NNO+n488dapIGnAKGKaLduTFnjBwmf2JXBpVfm0OKcz07BYdWSZ1xU96WGpjLibKiRE2
         xm9byGMgVHB4kiJfDFTzdwsrFCzcSRG44tfZeWhSsEh1VLOX0vBonktvDlUGiuoOpk4m
         QDasd5AbvvrdfeM9djWWBBGJqeiR7mj/9vysFaogEecvlecuws/yluXadOIIOAQaLs5k
         ytGvIwDB+dSUWqHDzzz8eCIYOTMZZeMjsxqdM5kn15m6h08u/0BuxQPNUp8HDl5h7WbJ
         7+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765227790; x=1765832590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RwXU4yEkS5GKD6FWOwlvuTVQTw1siF03sQUIknd3y7o=;
        b=pR4jJ5KpvUK+cTJzmGT77+GXxGW2tjnFl9g3LRzAjf+B/W/IeG6oDshWDs6JpL7B27
         bSyOwkQnSEnI5ztYVr/GSZP4ZXt6aBMrjtT7dWEdbfw9qCI3qv0fwO5nU2/gzPAjpsGR
         i//09rYhQj8zvs0TI16FFrWllfH7q6+ljdAJO0YYzDNp8oMTzqDZkLJC7rSI3KXPaDLf
         1JVJL/+OaUT5RPhIisPeBR+kOULKDMZOz0g80VqG39YPe+pq3LkCaol0jVxB1B/azDh9
         KabbKcz6KelJTD4hA+sZNruq1woXulzHCsmKVt4VzOKeDL3smAyqHmgX2oCyxSzFC4FQ
         vDHw==
X-Forwarded-Encrypted: i=1; AJvYcCWNmYBXLY9f67c/QE4HlkgQsBe9ItFb9ViSNLlVTCBcWdySPYWGIe+kkR30Ov+yntE2jQ1PEp0Buhmfji95@vger.kernel.org
X-Gm-Message-State: AOJu0YxUUcv2fU1UHzw3V/GbSGYqAECfxqHVQzpXR9tFEROsAbK36Ckd
	sLve/x+mR9PByEUUxAZlKawTChHrEl4AFry+1ElWTuOC3xsk2T5MC/F7Duc29xPOMXLMMVm5h6q
	iUnxlQMJMgou1uTrROnGXvA5dKFmxgzidG9uGc9D9BrB/bIv1uvaxLjDGiJ7nZZKAUsef
X-Gm-Gg: ASbGncsOgfZ21bIZiUAfUbbQZWi/VvOhOwzKNvTEXfDT7k6bbaefrIzN/UvIz29iowE
	XGJGMgk6VHpXP4cxt9T/ZDPj/+gZchKrrxg4Fu3/IO7KUiMpsjzGyAbePbnGzwRNGgyWB4xX9Re
	3yjHYXTKcA70gBtUrgcxSBPv8IKbRYaWBmd5WjrdxTv//sgCqicT/R6cXDDQZNiT8hb8F9cqU2/
	ewhWhdvwa/A5i5dconIBMI0m22g5WpU6xUydm6b/TqgZiVysZlXpgguEjoB/tO0se2C/apRiVKS
	0U/Re7whBzG7AV1TuBgAy1+pR+NOCgC2d9diG12+r0aS73xoptUogVBM0y5Opk+v16hkdg585BQ
	mLtcXe6AjZ4CkHlMbzLAb+1v37L9yXzJ4RSNtPyr4IMh4o+195r8ouzL1foHlKMg5pQ==
X-Received: by 2002:a05:7301:140a:b0:2a4:3593:6459 with SMTP id 5a478bee46e88-2abc713ea04mr5771208eec.9.1765227789453;
        Mon, 08 Dec 2025 13:03:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN1LdEcW/YLLvxDBKJ/l2/Lyj31m2mxmL4gDtQGuQFuf5uGzERDWxMd6xhnIhCeNeevDqypA==
X-Received: by 2002:a05:7301:140a:b0:2a4:3593:6459 with SMTP id 5a478bee46e88-2abc713ea04mr5771173eec.9.1765227788816;
        Mon, 08 Dec 2025 13:03:08 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm59454493eec.1.2025.12.08.13.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 13:03:08 -0800 (PST)
Message-ID: <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 13:03:06 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YX9d1U9flZyd_ZIgNRODq_mrFvpvbthl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDE3OCBTYWx0ZWRfXwz4N1V1DJccz
 vOcIPJBLG0oIYqmJ/6UCBPG1lY3EDrNLDoAleFJo142cepaUMkL1QZ7l+5dy/DcG01jUi4Jztou
 hNM14Z0neg9CUMhsTWa58biN6lUKzrNOxWCP/i6l+Snddd+UFacxbE7rfITU8k9cJgmnzCwur9Q
 bTje1JuNbjdF4vNORBSUpjsKRSOnAXKbXWjbSsENG022VUV1zeMaL5ZzUIYxdUwxm6JCDxuWLmh
 Vtd6FFUMN3J5HTePpFCHfSE6uiqJ8yVJ9S255hrKnzB4ll3+URYkgU/43OtjuWMz3y3Ng8QSkZf
 CuQBbVfwfX93Wgh3L6yc1/WqX8KheEWod4SwNQMjGDVRq5nOJw4eEWtk9Xy1T+faGH9Ghw86XgV
 vU3+V0K0jkkS/fpOhVOSVdiPzMVJHA==
X-Authority-Analysis: v=2.4 cv=F99at6hN c=1 sm=1 tr=0 ts=69373d0e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MBzK6yPb57EjR2ONl-4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YX9d1U9flZyd_ZIgNRODq_mrFvpvbthl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080178


On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 08, 2025 at 04:39:47AM -0800, Hangxiang Ma wrote:
>> Add bindings for qcom,kaanapali-camss to support the Camera Subsystem
>> (CAMSS) on the Qualcomm Kaanapali platform.
>>
>> The Kaanapali platform provides:
>>
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSIPHY
>> - 2 x ICP
>> - 1 x IPE
>> - 2 x JPEG DMA & Downscaler
>> - 2 x JPEG Encoder
>> - 1 x OFE
>> - 5 x RT CDM
>> - 3 x TPG
> Please describe the acronyms.
Ack.
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 646 +++++++++++++++++++++
>>   1 file changed, 646 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..3b54620e14c6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,646 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  Kaanapali camera subsystem includes submodules such as CSIPHY (CSI Physical layer)
>> +  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
>> +
>> +  The subsystem also integrates a set of real-time image processing engines and their
>> +  associated configuration modules, as well as non-real-time engines.
>> +
>> +  Additionally, it encompasses a test pattern generator (TPG) submodule.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    items:
>> +      - description: Registers for CSID 0
>> +      - description: Registers for CSID 1
>> +      - description: Registers for CSID 2
>> +      - description: Registers for CSID Lite 0
>> +      - description: Registers for CSID Lite 1
>> +      - description: Registers for CSIPHY 0
>> +      - description: Registers for CSIPHY 1
>> +      - description: Registers for CSIPHY 2
>> +      - description: Registers for CSIPHY 3
>> +      - description: Registers for CSIPHY 4
>> +      - description: Registers for CSIPHY 5
>> +      - description: Registers for VFE (Video Front End) 0
>> +      - description: Registers for VFE 1
>> +      - description: Registers for VFE 2
>> +      - description: Registers for VFE Lite 0
>> +      - description: Registers for VFE Lite 1
>> +      - description: Registers for ICP (Imaging Control Processor) 0
>> +      - description: Registers for ICP 0 SYS
>> +      - description: Registers for ICP 1
>> +      - description: Registers for ICP 1 SYS
>> +      - description: Registers for IPE (Image Processing Engine)
>> +      - description: Registers for JPEG DMA & Downscaler
>> +      - description: Registers for JPEG Encoder
>> +      - description: Registers for OFE (Offline Front End)
>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>> +      - description: Registers for RT CDM 1
>> +      - description: Registers for RT CDM 2
>> +      - description: Registers for RT CDM 3
>> +      - description: Registers for RT CDM 4
>> +      - description: Registers for TPG 0
>> +      - description: Registers for TPG 1
>> +      - description: Registers for TPG 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +      - const: icp0
>> +      - const: icp0_sys
>> +      - const: icp1
>> +      - const: icp1_sys
>> +      - const: ipe
>> +      - const: jpeg_dma
>> +      - const: jpeg_enc
>> +      - const: ofe
>> +      - const: rt_cdm0
>> +      - const: rt_cdm1
>> +      - const: rt_cdm2
>> +      - const: rt_cdm3
>> +      - const: rt_cdm4
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>> +
>> +  clocks:
>> +    maxItems: 60
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: camnoc_rt_vfe0
>> +      - const: camnoc_rt_vfe1
>> +      - const: camnoc_rt_vfe2
>> +      - const: camnoc_rt_vfe_lite
>> +      - const: cpas_ahb
>> +      - const: cpas_fast_ahb
>> +      - const: csid
>> +      - const: csid_csiphy_rx
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: gcc_axi_hf
> This clock (and gcc_axi_sf below) still have the gcc_ prefix and GCC name. Why?
> It was pointed out in the previous review: clock names should be
> describing their purpose, not their source.
Hi Dmitry, let me add a bit more detail on this clock. As confirmed by 
the HW team, the logic that runs based on this clock is still inside the 
CAMNOC_PDX, just that it is on the CX / MMNOC domain side. Do you think 
"axi_hf_cx" and "axi_sf_cx" makes sense?
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: qdss_debug_xo
>> +      - const: camnoc_ipe_nps
>> +      - const: camnoc_ofe
>> +      - const: gcc_axi_sf
>> +      - const: icp0
>> +      - const: icp0_ahb
>> +      - const: icp1
>> +      - const: icp1_ahb
>> +      - const: ipe_nps
>> +      - const: ipe_nps_ahb
>> +      - const: ipe_nps_fast_ahb
>> +      - const: ipe_pps
>> +      - const: ipe_pps_fast_ahb
>> +      - const: jpeg
>> +      - const: ofe_ahb
>> +      - const: ofe_anchor
>> +      - const: ofe_anchor_fast_ahb
>> +      - const: ofe_hdr
>> +      - const: ofe_hdr_fast_ahb
>> +      - const: ofe_main
>> +      - const: ofe_main_fast_ahb
>> +      - const: vfe0_bayer
>> +      - const: vfe0_bayer_fast_ahb
>> +      - const: vfe1_bayer
>> +      - const: vfe1_bayer_fast_ahb
>> +      - const: vfe2_bayer
>> +      - const: vfe2_bayer_fast_ahb
>> +
>> +  interrupts:
>> +    maxItems: 30
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +      - const: camnoc_nrt
>> +      - const: camnoc_rt
>> +      - const: icp0
>> +      - const: icp1
>> +      - const: jpeg_dma
>> +      - const: jpeg_enc
>> +      - const: rt_cdm0
>> +      - const: rt_cdm1
>> +      - const: rt_cdm2
>> +      - const: rt_cdm3
>> +      - const: rt_cdm4
>> +      - const: tpg0
>> +      - const: tpg1
>> +      - const: tpg2
>> +
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +      - const: sf_icp_mnoc
>> +      - const: sf_mnoc
> You know... Failure to look around is a sin. What are the names of
> interconnects used by other devices? What do they actually describe?
>
> This is an absolute NAK.

Please feel free to correct me here but, a couple things.

1. This is consistent with 
Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?

2. If you are referring to some other targets that use, "cam_" prefix, 
we may not need that , isn't it? If we look at these interconnects from 
camera side, as you advised for other things like this?

>
>> +
>> +  iommus:
>> +    items:
>> +      - description: VFE non-protected stream
>> +      - description: ICP0 shared stream
>> +      - description: ICP1 shared stream
>> +      - description: IPE CDM non-protected stream
>> +      - description: IPE non-protected stream
>> +      - description: JPEG non-protected stream
>> +      - description: OFE CDM non-protected stream
>> +      - description: OFE non-protected stream
>> +      - description: VFE / VFE Lite CDM non-protected stream
> This will map all IOMMUs to the same domain. Are you sure that this is
> what we want? Or do we wait for iommu-maps to be fixed?

