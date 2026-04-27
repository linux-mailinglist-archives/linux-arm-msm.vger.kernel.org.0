Return-Path: <linux-arm-msm+bounces-104646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMpoMOEg72lv7QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:40:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC6D46F3E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 10:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4813027B7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 08:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3BB39B95C;
	Mon, 27 Apr 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fqwsc5x1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZ4U7nFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C37399015
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278897; cv=none; b=fnpEw1oDuxQGsJtnLzRrfNXlLIge7tguUi5wx7C+ZdsXZxwEZjRa/YR3qGpjT7y0ryrzfTX9+IyH2EuoVEcWim+/Vnld3r2+ZxWfjK4QrCM3CQUqUxysMQL3kVgHGmKhnKlO339M9NaX/4MDvfmo/PCAH8ldZ4RnSGCCgpRoE04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278897; c=relaxed/simple;
	bh=qjpOWTEBATWY+1ClpZB2F4dd9qTPzr/dSEUESfXn5l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tunKOzIo0S9Y25FMzhui9ZbGtl1XQf7ps0SLJkn/8EuHF9Pny86HBsSuiW//YflHFhTzaHt6dT8C7h0IbMHkVk46CKSh42YEAYe55YMsfAyopgQ99WDJ6MLArlG4Vs+NV85IIzYfc0uQRfB8BkUy2mi2d1v8X0Zm9nzYXj6ubUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fqwsc5x1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZ4U7nFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TH9s3682754
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:34:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8Vi0CxTuBDh51sr0243sMsVnC5pQihWTiyZH0CgvNA=; b=fqwsc5x1gFJEM86+
	xltHEEkJ8erTCbDnBPl2AxlP25Lnl60fqYXffN5ccLHWeg8p81EWrdgFvBxsEhYu
	TVyjx8pYGlkgyi6iuVD4CpivjPfpOgKce5zeXj92p2tmXcFQ4/1V+JcBENt/InPl
	0ptJ1lWnB2YBqxXkjQPfAn/eSlY7o+QRybKoDUCm9mip0/mDCoq7UkguQ6Mh1z86
	vMtOXmLEDQkua4ixJD32h0DfhB6fUdjQ6wsQ3acDlCF25OJwdO/ZiQVYh5gtCR+z
	QLP75Z3jF1G0wrG6T9LOua8mF6QK/oxUiZbVMIdpkI4ESgEQS1VYR+9Dm4XiW5Vj
	C0ZKYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnmr562s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 08:34:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e6ee9444so108000185ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777278895; x=1777883695; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8Vi0CxTuBDh51sr0243sMsVnC5pQihWTiyZH0CgvNA=;
        b=WZ4U7nFWbPiCumeYl8pBEWhFUHr2yxlv2GV6sQd1YriP7TYs42RTnhWAEl3dMTb2ww
         ZudIAiCXMHhDqx8A4+InNZUJ3RfKVxWtkoZh1oqoH0hqRCd0bEpuGNLBmNqt57PNrCfy
         RywsCVo3PEcMvZ/L7aAeRyvabNLba7R4/zTLFgeqAR6JlJHQQWTT+EmOE4P4qXK86y+I
         p49fJzcc5dkKpxQfFwaHA4Dzghd/+wVuJ2qtqiV06famHyPLI9xAJjyGIZHAttyDQ2uc
         b0sW6eCTbAFLJeTvDIbLeC/eooyNbCtBTIG1a077DisMgnJcajjy2ZmJEaa68R2wRBy0
         CO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777278895; x=1777883695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8Vi0CxTuBDh51sr0243sMsVnC5pQihWTiyZH0CgvNA=;
        b=ZdfNtEn2wjxBYrEwaMATIOsaksHXdeH9Qb3/kKucxIUYXB+0zQpZCGUGtym+XXVsk0
         nbTKCMv/2kvo20YQGw1+HbnAFHy2Eb4migjppShxuu552jIzggAbZ/+Ps4b1CzYUB7Gu
         GH2vrdFB0iJoZrPtQnsMBEESODSp6U5qHEBUFMbTLZYJSstZKFQJcIMgakO0uFjNzHFH
         wLaK5vwfUhvmpmsB1qAsE5QPi383EFGLHCwvZSNUsIrCZMu3udRhqYjOvsbqJEMtF81G
         oNPWYyl7bbNhb+AwldDxRHUvsesp0JcI5bN9iwpPfXUhoQK/qZ7/L2uVuAzA9rYfqs2C
         3LvA==
X-Forwarded-Encrypted: i=1; AFNElJ/5NxtEvzRfFQlsHzu7LnDMglisqC6JX36KFhYYDNBVRPwAfsRX16WnyMjj26FklFulYA2et9AF8zJMVpVY@vger.kernel.org
X-Gm-Message-State: AOJu0YyUt1+p+hJJwFXKl9vGiDkT6CTBE0WncDlzzPGN5DV5168wexHL
	G4fdNLo2wVl3V9qn3XEm5993t/vouvI5XDNGU2AxtaNDqOW2jZZPKYokANP5QU9pySYr8hvL+2f
	JMhFyBNH2KBeRn+hTRc+lfBG87RPJgTanMh8NK6piOrxkKjeToLgq1lLD3m6wN5BNgR6C
X-Gm-Gg: AeBDievnbgGNuj27YwhflCdNm+t0mdH8W8ivICB4rPcGeyHLZWWL4oddGVDpkfSZi3v
	Hx3VySmvLmrFsP9hYaFNNeVT7OHbMJYX+BBWVzQQ7pXXEBRG/+ezbIWs3iYBGdxIV2ip3N/HIny
	GWkdwwmARG+kbWrVShtsX2lYIv8lo8PezPBTc4Z07N3hqhGiaGrzDr8e04qBrcX5KoRJ9KwDhGT
	kKeC3qmsFi2uqXUD+HqBonkFYug4W7AoF+NVANk4hx7/p920LvqdRkHQfbSbO4ZW/THZt8DdH8O
	Rahq8vfldCYhkRfxw0gdPzdtK39Rr3VR0opnA/fhkR6N5HcTEiI0YDzpNm3k3lSs8SQhL8z2mjx
	3IRrz/GoKq4TJR+DB4Qn9aKUv8ZpzG7g3jiHVMt/9vz/WoP47T400XeBwIF+HNNo=
X-Received: by 2002:a17:903:3884:b0:2b0:c060:aab8 with SMTP id d9443c01a7336-2b5f9de53fbmr349372365ad.9.1777278894454;
        Mon, 27 Apr 2026 01:34:54 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2b0:c060:aab8 with SMTP id d9443c01a7336-2b5f9de53fbmr349372135ad.9.1777278893978;
        Mon, 27 Apr 2026 01:34:53 -0700 (PDT)
Received: from [10.217.222.83] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3casm376926205ad.17.2026.04.27.01.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 01:34:53 -0700 (PDT)
Message-ID: <e00eb12b-e8ad-4db3-b4f3-c8a81f6a081b@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:04:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: qcom: bam-dma: Add support for
 kaanapali BAM v2.0.0
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
 <20260424-knp_qce-v1-1-813e18f8f355@oss.qualcomm.com>
 <20260425-handsome-papaya-porcupine-d42df7@quoll>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260425-handsome-papaya-porcupine-d42df7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aqCCzyZV c=1 sm=1 tr=0 ts=69ef1faf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fbGrPKVLzK6cyc7TY9gA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rcOm74G1LtzN3xQNsjScfaBipal3eLw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA4OSBTYWx0ZWRfX6s4+4q943dAo
 8iohzDTjCHmEFkstcEACDf10azGd1HLmGUi3lzTibiVnsYoDdI8iaPO5+aJ73SJg8Cx4G4C6boa
 Kd25gYZ9fsh/dNhUarXo6xwKZhHAQHGHU5Rstf/fzwh0zbl/0tC/n9tbipM/qFAE3D9TFogtWb8
 8Ff1J2JST2hv8pXxdkBAFNe2x0YjdqAvGHKBfxBPlNPoKEqsZCieaYBlH7b3mEjhF6XFU7/12ZE
 m8NxpJyZYIGO5atlZm0kgLwAhfQX3ZrHliqke5L/oGpP0Swl6OBeewROxfvocdscQiQIh0weIr6
 Ae0rg3RAnsY5uTzAN1Ba0HyUWm0LV8vbqmf1IgrVckkuWInDFnQRUEJKNrfCzEzzpscL5/mtjzV
 TilE/bS8iye19cM4Q/YdLrv67sly//vMpjAR42OqSW0A+8YNVZFgczTNMK3hLSa7bH4aAyle7b+
 2YenOJ8tkMcAcmmreiw==
X-Proofpoint-ORIG-GUID: rcOm74G1LtzN3xQNsjScfaBipal3eLw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270089
X-Rspamd-Queue-Id: 1AC6D46F3E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104646-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 25-04-2026 15:53, Krzysztof Kozlowski wrote:
> On Fri, Apr 24, 2026 at 05:04:15PM +0530, Kuldeep Singh wrote:
>> Kaanapali support newer BAM v2.0.0 version.
>> Document the compatible string and update example along with it.
> 
> And why v2.0.0 is not compatible with v1.7.0? Or what is not compatible?

Kindly check patch 2/3 of series to understand register level 
differences in v1.7.0 to v2.0.0.

> 
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> index 6493a6968bb4..0923fb189ada 100644
>> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>> @@ -23,6 +23,8 @@ properties:
>>             - qcom,bam-v1.4.0
>>             # MSM8916, SDM630
>>             - qcom,bam-v1.7.0
>> +          # Kaanapali
>> +          - qcom,bam-v2.0.0
>>         - items:
>>             - enum:
>>                 # SDM845, SM6115, SM8150, SM8250 and QCM2290
>> @@ -118,4 +120,23 @@ examples:
>>           #dma-cells = <1>;
>>           qcom,ee = <0>;
>>       };
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
> 
> Drop the example, no need for difference in compatible.
The current example captures an old instance and doesn't give complete 
picture.
Example, doesn't specify iommus, qcom,controlled-remotely etc. whereas 
recent ones don't specify clocks and reg address/size cells are 2 not 1.

I believe current example doesn't give enough info and hence want to 
extend and highlight latest usage for either v1.7.4 or v2.0.0

Do you want me to have separate patch for this change if looks ok?

-- 
Regards
Kuldeep


