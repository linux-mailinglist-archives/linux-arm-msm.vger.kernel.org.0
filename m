Return-Path: <linux-arm-msm+bounces-87052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8235CEB444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01ABB303897D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1683F30FC31;
	Wed, 31 Dec 2025 04:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkwBUE7/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwdBfMHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB130FC19
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767157069; cv=none; b=l70yEaL4vUq5AeKZRFnaTQ0mOrehTBQ0GKtWLOabi8L2mPtDCEAW2gNLjOjT3EIRlJh1aRoxYTVCqGRPcFYyf8TOUPTN3NQdZ3xwC2x7RpNM1kcvRz3Z8L/ADOu9dOGiFeBt5JiN7nv62CKr9/3YKh4ppu6fdLvqljXnX/0GqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767157069; c=relaxed/simple;
	bh=11N6OQSNY0NxVICl7jq5B26SLD+8RpI05xpjBeX4ZA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYOgsGimcUmPVU0jNcHmdehpAjI/Om6SbufYR8mwBpmRbTM0BNJC7OEdetXgWKTjtIxZDu8iik008UxlilJGclE/JBlbNwmU95tkUq7xr4r/y7xZitWVx1tK5dfW9dByfSQc1+rr4lcdbFDAlEW32xculLxmQFBXvqFlThxQiZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkwBUE7/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwdBfMHN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV1Rbcw2674102
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQSxS2/0ehc5s3u7Quzvg5mR1THJreuz1hnz19f3oio=; b=CkwBUE7/Pv+MF65J
	zy9GbRmhNWAr0rQlgVE0atsSuxNp7QNySBupzf0tcRChIsLpUlh7cDPQN40di3Rv
	0YR9WI4NXk8ejojJQCJKR6SkMnBOtZmJvyy8hJN+1jwgsbiXxi1S507uoUNthhvd
	VKlyVj3snxXAfPS6OsVdfsxLNHK5l8X8tl3/bRFooNKv4A9CfUD1j3oO2e2o8LhD
	Np0gZB5zQPVu+emUxHo3Re+b1PSRINW0ROSYupWim1CQdS3UCEimhV3alUjV6Q+S
	mtoOqxzL3FO9bhcdqQJanEl+YWhSGbhgcjdyJdXEPvEJmRzoY9c+5cFeisA81SlX
	bkEcsw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc4fcu61f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:57:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so11936079b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 20:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767157066; x=1767761866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQSxS2/0ehc5s3u7Quzvg5mR1THJreuz1hnz19f3oio=;
        b=HwdBfMHNgOg9ltd3PjKl5PeMs8oPJvEQpLnJUqN4m5noebtujgyQlUzlsiPL9qJjas
         meiLJNexnwO2RwRPC+mdhCG7Q6ERgAJMas7P/esynV36f+xILSZUJZKE0M679U1W8nFx
         PvFGeYsX2r5o58w5uCSNkE8xE06KUBWmIfq1XlpPg7uJMqnrwnqwlWMWvw/hK+quBqv3
         9eptOBSSw8gqVZvr/ZILM8AKj9Ksq8YIl7hf8oYfcSqPmVOf8zmMd3xhVj84spb2q9YX
         dkpnLRce0KMwPOZq/uOx9DkITFIy65IBcwR7E1VL7JV/jVWUOWB5OW65YTZQ8Vc4WIyk
         RYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767157066; x=1767761866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQSxS2/0ehc5s3u7Quzvg5mR1THJreuz1hnz19f3oio=;
        b=aRiL3vR8+QzPqylTVqKjZvh5KteCFFv0WE/ZZLYJYfsGr2uCqfGwpA2K7ZQzWkVoyp
         VBmunlYj0P7Oz0y+LVqJ85Qi9L3KA8K5tJzf9w2KZ3w40K4QRIMbYFp7sAo32LibmXNp
         Y3QuVcuyNHp4b6OHe6mU4V+PM49cAL4qCzoWgxAd8Oyv4IoNC8Vf3Yh9gDtMaa9DBQc5
         7mNlxqCH6nYMTzJOlmXGQOdhFrNgwCHD2p8u95JQH5nSHMOIox3bSL3sGbedDqffQuL3
         WQPiOU+WdaqC6V85ik/42pg+vR4IWq5VHONqFnX2LCZDUCbdbcvQC7wBpTDE64T0ojkb
         TtFA==
X-Gm-Message-State: AOJu0YyLyIWIHhorSPBePCn9+TiXH31MxYXEVDbmTxDps1yq4TWhlO/7
	sRmaBc5qSldkjbJlcBzpnYLeaSmqLM92E9HvbWLY9RGwkqZMX99wsf4a+/tvdBnYQdTV3U+Iw+V
	59J9xgEBxBMp6yLtogGKlR6EyadaKWkNS7v2RJx2+ghsQfre9Hdznjx0PSI9ZFy9jdSyj
X-Gm-Gg: AY/fxX4gVSwsEgocFZi69vpbywF3h5XXUevbGoatF/QKe1bZhA0VxD45/S10WRGjne8
	Mp7Psxn58gFscmVpir6TNXH9brQLz3iO491raNqJxK6jfax++WTci4kcj0MaTPKVH9u0NlMgWm/
	6iw+S7+K4bYwNjugpXZAGs/wlzRcVXQcdCyMtyZ0v498Kn2IbIe1LA8vK97rsvY0sYPpRzSX0Bx
	gKfFrkA3mTGleBJi/hMNApEeoACQZVP23V3JJmITlnqfeEBV0Min3Ug2wRrMO72W+XlInS/lw/7
	1oeB9n2dr1WgRUOdM7QMR0wyGPBRi5e13mTqMsFcSVv4c/lIvmdL86+bnSgpnAG/5l3JPocb0g3
	EjfP7d0wceWapL73N7myXuKfumagHsN+Gv5qLyrp0
X-Received: by 2002:a05:6a20:e210:b0:366:14af:9bda with SMTP id adf61e73a8af0-376aa6eadd7mr30887183637.80.1767157065633;
        Tue, 30 Dec 2025 20:57:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAvdaLtynEVCgaHZvw4QTID0gtW8i8EGlr+lVjjbmIhEK3xWUmcfReZ38cA/yRJtjHo0R8EA==
X-Received: by 2002:a05:6a20:e210:b0:366:14af:9bda with SMTP id adf61e73a8af0-376aa6eadd7mr30887164637.80.1767157065180;
        Tue, 30 Dec 2025 20:57:45 -0800 (PST)
Received: from [192.168.29.239] ([49.37.133.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c7263a3sm28803816a12.32.2025.12.30.20.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 20:57:44 -0800 (PST)
Message-ID: <c0e654d8-bb4a-4d4e-9d67-3664e6ea0aca@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 10:27:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] dt-bindings: ufs: Document bindings for SA8255P
 UFS Host Controller
To: Krzysztof Kozlowski <krzk@kernel.org>, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210155033.229051-1-ram.dwivedi@oss.qualcomm.com>
 <20251210155033.229051-3-ram.dwivedi@oss.qualcomm.com>
 <3813487a-4618-4c14-9536-cc9f721b12d1@kernel.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
In-Reply-To: <3813487a-4618-4c14-9536-cc9f721b12d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ceb_PoJG7U9ahnjAXv0YkKR4rTJBPkG9
X-Proofpoint-ORIG-GUID: Ceb_PoJG7U9ahnjAXv0YkKR4rTJBPkG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAzOSBTYWx0ZWRfX349cUFE0BsKd
 C0YEQjf7MF44EWrziKieV9p4t2XIbmLZ/xOZN0jaM/ZBvWk3E7KMZlOBXnHj5W58dIFTFdN8eLd
 kBJm7T+IBWX22fg0G7ll5vpm8mTBI62X2WWU6EMWHezuabhoO2riO4mk08SKSf8Kin5E5YGQ591
 ncdshoTzvyYqcBN3hGcu6td+pX5+vEUNSLx1B4S3V2nPmjmXz0Fy+1pj+3XBEqjHrNJFHg2n5N8
 VIjMM9GL+6k88ZHk/Bt9uPGcMRt91mhuKVHw+EjZKg4m8gkBrXCtlpv/swdwVNGXCm4PgXbu7Uz
 yzLIGEuzTswegaYxHgWVhVnUYtvNyymf4moIF2MXeB/yC/3GEbmjOUJft4zz9xy4srW70JYFEVx
 8tkzv+0V0Qzyr4FnKXh1YGJmWSMdQTkQy33F94CQpRcVIELzUDayxC/iLQoIC0D6W72sj/psJil
 R4jJGT/hiulUxgxfwkw==
X-Authority-Analysis: v=2.4 cv=foHRpV4f c=1 sm=1 tr=0 ts=6954ad4a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=+/UKhaqxHMWBDOh8pPecxQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=2JRC5SQJVUo4JS4EESgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310039



On 11-Dec-25 12:04 PM, Krzysztof Kozlowski wrote:
> On 10/12/2025 16:50, Ram Kumar Dwivedi wrote:
>> +
>> +allOf:
>> +  - $ref: ufs-common.yaml
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> 
> Not much improved... Same comments. And if you repeat "we plan" or
> "something else is something else" than answer will be the same - that
> something else does not matter and we do not care about plans.
> 
> By useless disagreements you just postpone the acceptance of this
> patchset. Especially about such nits... patch could have been reviewed
> already :/

Hi Krzysztof,

I have changed it to single-cell addressing in latest patchset.

Thanks,
Ram.




> 
>> +
>> +        ufshc@1d84000 {
>> +            compatible = "qcom,sa8255p-ufshc";
>> +            reg = <0x0 0x01d84000 0x0 0x3000>;
> 
> 
> Best regards,
> Krzysztof


