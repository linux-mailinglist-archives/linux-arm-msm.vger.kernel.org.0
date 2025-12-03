Return-Path: <linux-arm-msm+bounces-84212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15AC9ED66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC2B04E025D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7412F3626;
	Wed,  3 Dec 2025 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azXeYlNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKFDdlKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D440836D4FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764761137; cv=none; b=mz6LougDiFhlE39P92wNReAY8tSRrAmJna9tlQcW7YpftusZQAEOXxbqeKDcuGkzzondql+9Lx2zNFU8YU6bvlpKX9UM3lfI7SfMKn9EC/MTqKcl+XY8AHdScDJUms/MLol1TlWEksXXk23Izi7Zm0ZT559LUInKpsyvq3hG11Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764761137; c=relaxed/simple;
	bh=wLCFESleT3mEI8cKzr9T55oK4FyvroDXdtPXKrsA16Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFVQU5d1+d61eLgA5Gp4L/1OYnHCCcBXXUkYYu04z3tHWqM7DZF5MjxtXSnGILQZNLM8gqitjjYSChxj4q3rF4s90UWpzGRXFdU9CY8jEQIymob6SVSvJ3DiSdNjq4/Re4cOncjJCldTMmucAhP0MGSLYvHtXZQjKm0xNgUkVgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azXeYlNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKFDdlKI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3AuDSp386068
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnBs8xgaZI8/pV93gl0GGKO1Scw+YUhAr0Btx4ZPdWA=; b=azXeYlNl1H37BdXN
	WDijZVQZ7aPlJk1vpkp+rOqR+TqBMeo88CY97KEpXMYVYD9FAGIivzWaIj7d+F5A
	Voq7C4aUmft5Kx0TKaii8wZcRheW+aETcLKVjNVJYEUBmi1/9N9HJGEnLBxENfTT
	3PaHlJn+0WzTDRjQnpUPdwwziHVAYwobtJoHrSQQB2ceLaluYm9VrxKNieqYC1j+
	P0UPZ8bRlhojEwaQCRy3t6qDyIPz5QUfjhk7a1QV1hHASchJ6GtkJvtLrgBh8b2Y
	iH0q3lLVn2LNotePE2NgGO+sQjNdEQFzyIwIUotZ2+WMvu/Hc06ukGgz4uydjGHf
	+au5GA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at5db2srv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:25:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bdced916ad0so9846606a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764761134; x=1765365934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnBs8xgaZI8/pV93gl0GGKO1Scw+YUhAr0Btx4ZPdWA=;
        b=GKFDdlKIXJnSSKYYtIc+N6pPZW06dBlWcmD5WSx1h8KcTKeFC7w1YdBiLqi4jHX92e
         CFnOYsktR0B2/18XDj2/yipt4x5NoItw1TJ6QieSoBCjh/eByMDlOfbTvEDdFw7Atit9
         4GVC7IXKYCZNhOhFhuy+9dpo4+zK2LjPws5TxVNM9JGVzT/nQVNq83WEMs7HpUauLcrv
         170zyAuUvk7HXHllFme1zfboYZiggg4tRATNebJXEqVPlrOeI5/5oVInlwikMwfEAano
         XWCw9cmIBzaZlMUqS0X7kgV5pWAFJhQJ6l7BkrksBAaNHfMRklwO9ylXP5dZJYomnxSd
         +q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764761134; x=1765365934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnBs8xgaZI8/pV93gl0GGKO1Scw+YUhAr0Btx4ZPdWA=;
        b=E8IEBcER+R2FYQ7VyknwORcviIwPsTdkKg1mEBoWm9aCQSd5SWPUQmtheqPVfQvqtg
         ApJW28lGLmotOV0QvyhnmirKI1CrGAATgg6lNvrbm4CC00uPyHSuk2x6K6NKciIl2A4P
         Bew9Uxt+dTtAf/sAIJk+PbP15DKhErwfCNKHUk5mc8zWo1SVImFCKJSnu2UIGvS3Sr4z
         taNW4sdgG1LgaZUgZS9gcuqQ6n9ADR0pDddzliUgn7gzJcpqTDUN/so5byMB7mx86A9V
         1ybUVQvJIVL73E5W2DockZKevWopX9mw/F8/wVevSD710dkz5ZYU3AdCj5jIe7XfXLNu
         rclQ==
X-Gm-Message-State: AOJu0Yyl0opzXBbfcsJqXMv1Qij+5P29LzDLQhCa/Qd45nhPTozdCuCK
	iRVV+Gep8I28lzrWXXzW9tY5IfP+cwh72LWVNtLtRQbE5kXEhm5ohe5Uybj621YE5WSF5pjf/Y4
	t9CeeSNKqZoZbHt0LXxhumpUlVthzEpRUoagZ7/hpQAsAAZxAAmv5yqxY7WMgb0KGGCUR
X-Gm-Gg: ASbGnctl+aH9Hh+GoHrbFDAGwwMOy2h/k0oXzpJkq2wP5aexd3PT3AS8vKLzY/cj+SX
	6ZqjGkYQBfYWW1cEhbOAyPVbEbyP4tYE2b9Ut7cY2AUVkrwN2ZdWqiTx2flkVt41I6JaFhmR0Yj
	lgjiXUBu7LpOpTanPzycw5SpiEEyZ0dn3oLhNp3JYplfjTeZzMHWzwrOpjrBG5MEDU/Mgt9ViNj
	S6Tk46UpBX/4VNLXNQ3NTjaLFByKgPuRXPgfOqQX7MsivfkcWLxxdzGdUf/1t0MWjCg4wCTyT+u
	Azp7rCXkYxZ0poOrNyYaV/PTbuF5i7OkRCgOg424xMRoEx7RgJblsJNpU26iS8iNmSDiedgPzx3
	EuXGXFxwHMSXEDi6f3KWVhZP7wr0XeqZtTEsJ3+N10wHQfg==
X-Received: by 2002:a05:7301:b0a:b0:2a6:d0bd:4a07 with SMTP id 5a478bee46e88-2ab92e52960mr970671eec.18.1764761133597;
        Wed, 03 Dec 2025 03:25:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5V7ZXy9Y8/CV+ditSdoy+4q/BB9igg/hRdHJxnpEofPC3YDQwwxJk6gz2wtunaJHJ7ab1gw==
X-Received: by 2002:a05:7301:b0a:b0:2a6:d0bd:4a07 with SMTP id 5a478bee46e88-2ab92e52960mr970652eec.18.1764761133106;
        Wed, 03 Dec 2025 03:25:33 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm64456209eec.4.2025.12.03.03.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:25:32 -0800 (PST)
Message-ID: <4de408ba-c6ed-42ba-8f68-fa342ee670a4@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 16:55:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch
 detect param update
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
 <20251203083629.2395451-3-krishna.kurapati@oss.qualcomm.com>
 <fe15827d-c15c-4b4e-973e-3cc379714467@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <fe15827d-c15c-4b4e-973e-3cc379714467@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sXnxg979sC3dH9PGSteC_bmVttUS8xm5
X-Proofpoint-GUID: sXnxg979sC3dH9PGSteC_bmVttUS8xm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MSBTYWx0ZWRfX+JrBJpu/eF0x
 DPM6AYQ3G3b2TB1Do+u7WpYVy1GA7RIMVMRqOO+0DM6nuu5Xq19MbZKyTtvY05M/ttRR7A+mpL6
 KegE/XpjOoUTwbgc96xh8Li3G9GmMIsQAxOFDXHcNgYRmle+cqoal0PIHrMOqCs9e9zam/J30mo
 WPvG5XFE56CT10Uli0lat+Z7Q2VpmfHY/zob7M0NoNwF2acRNUuQE5os0/RVyQGYOOo5PVnuI73
 6zz9CWsC8hPgpW4TUlhD0YanCWdiTovrVX0XACO5UTT8Rvoz9fcthTt7RT3AFJQnwc9bfvwXMo5
 mKsksNqgRBmnJDQ6m3RTETc8BkDxqPeziGeUHampU/I4eQeyKX6aF2T8En+2OuXFRczbUK8HCkn
 6C0lp0Kcc8iOhOHoOF+EslyIXWjUqA==
X-Authority-Analysis: v=2.4 cv=VoMuwu2n c=1 sm=1 tr=0 ts=69301e2e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZzE7xM72-ti_z1JB6dEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030091



On 12/3/2025 4:45 PM, Konrad Dybcio wrote:
> On 12/3/25 9:36 AM, Krishna Kurapati wrote:
>> Add support for overriding Squelch Detect parameter.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>   struct eusb2_repeater_init_tbl_reg {
>>   	unsigned int reg;
>>   	unsigned int value;
>> @@ -120,7 +131,9 @@ static int eusb2_repeater_init(struct phy *phy)
>>   	struct regmap *regmap = rptr->regmap;
>>   	u32 base = rptr->base;
>>   	u32 poll_val;
>> +	s32 dt_val;
>>   	int ret;
>> +	int i;
>>   	u8 val;
>>   
>>   	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
>> @@ -147,6 +160,14 @@ static int eusb2_repeater_init(struct phy *phy)
>>   	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
>>   		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
>>   
>> +	if (!of_property_read_s32(np, "qcom,squelch-detector-bp", &dt_val)) {
>> +		for (i = 0; i < 8; i++) {
>> +			if (squelch_detector[i] == dt_val)
>> +				val = i;
>> +		}
>> +		regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, val);
> 
> 
> How about:
> 
> if (!of_property..) {
> 	for (i = 0; i < ARRAY_SIZE(squelch_detector); i++) {
> 		if (squelch_detector[i] == dt_val) {
> 			regmap_write()
> 			break;
> 		}
> 	}
> }
> 
> We could also validate the value (if none found but property present, error
> out), but the dt checker already lists all the available values so that may
> not be necessary
> 

Thanks for the review Konrad.

Will make changes accordingly.

Regards,
Krishna,

