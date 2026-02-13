Return-Path: <linux-arm-msm+bounces-92743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Pr9CgfDjmlmEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:21:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 445471333DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 07:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F3F9300980B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 06:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD2226E6F2;
	Fri, 13 Feb 2026 06:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYhj5Q4S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUC9PLyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EB239E6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770963704; cv=none; b=n48bK3UcIRt80O3Kvq0fWsa4XLH53CeD9EUEx33A4nZi/dwmVpaQyw82Q0KXfg19TPgqD90/cviBF41pSXH6b5dDelk1PoPbyZoL4TR0zYy9inEsH50yzzAWtpjCrc9mFkews5tmRvyvvzePkr2KHA1TDQR0CAqFjOnJ02Dm8lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770963704; c=relaxed/simple;
	bh=QdH4O1A8pUU3ZzK+jSr8OFhJzuwTAf9sNHwTqyfdHjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXgsPO/Av+kbbfyCwxj1xWnha38gD/xZ9cCrNOCD45671B0T9oTa3jAB9jRHCpbAX+xgHOMmcEREvmQ6attDyx8SQgfVl5X+5hgn5lDftaJ3V3pswnP0xZwUI7c4SiSOdfTxWonT7qnJHqlWQVePojAB+pcyufdT4Xy4n1LB4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYhj5Q4S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUC9PLyH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D0Y6PB053301
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CbshBBilHLyCNF/Met/2kiZTR1AF1t09ooB2XufK8E4=; b=iYhj5Q4SlNTu7EAu
	V1Lkfaw6Fsl0314erPinzoHQVzYsOomZ7NUrQGAZUNlcJWn8av6LY7FlMapqpiq4
	FqgK39LG1AW8lCgmUf+ZS8fWqym2rPzHKgHCBtfcxf70FoKtUjTwtBDz5Df90cGh
	ZbDeqCCwGTz3FKsM8KECYGwfqp1IRBju6c/JFdnDABv8bDp6mAR7ike7iKyMClzr
	2dcMHRmZHrO5UnpZWhINfaouG5rHJIamTq+7vXkMEgy64G4X/J+iscf3c0sbRMoP
	+qI7NUdZ7ekc9sHecKYGGFym4hhGBmdtUPVBpsIY9X/v6s5HjDYCZfsPasoP5GAE
	3LsZhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9jgbanb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:21:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7d7b87977so9900405ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 22:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770963701; x=1771568501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbshBBilHLyCNF/Met/2kiZTR1AF1t09ooB2XufK8E4=;
        b=ZUC9PLyHu3/BZ3HmEmAojL90KN+AN85+0gT3PAYmUx4n/ty9OtzKIo0Q4WV7GEn8Pn
         Bg6Z+gmiYrBezmVSfNgS6ARxHmCX2nbKUvIugWvEdLj6zEoWMaxy8GgU7+ij5KozhmTk
         IS/d7ndBKWcBYgERhKvlVkJJAxVL6+lpxMiVEuRaA8LEaXqFPyzq+YtbTEoNqpguWG8R
         kFwTOTd7aaF9NTFotorWI/a7JEjvCemQRLdU2vATwETykTCgtKvlkWLRjh48iAfXNW28
         XAhkUOwysEz9X5ws02QMV6la6cMX8TA+YenkhBEDgIa4DstuhmNhV4BUMepRNdTfyEg6
         Nrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770963701; x=1771568501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbshBBilHLyCNF/Met/2kiZTR1AF1t09ooB2XufK8E4=;
        b=O2CYlEWI+yIkhC8GPYk1nVZyBXfM90OLk1LCR2FKBwnUsr/7Ph7v0AkiJJ9mYD2Onm
         zqM7U8IfncgYG066/gxl+FStsJXK5O3bqm6xprRxd0lfD7n80Rk4bJsFHSGdf46KFGV+
         ERDPKG0ALepm6aiIztvFzKqxJCEtbzM5i7sM448gXiKmnBkK6jENbIFLQUIPqECUiOiF
         GVk966VLQxFZGdxwR2EPJIL7LfljyRIxfrOP8/A6V2rwsAdN0kUdio+0kCK9vXAg28V7
         JCKazRelSlEs7me81iTcFOLVe/GrPfQVDp9x/G/K/Yxlsf9eaK6GZ2Py+zVdu/kyfISI
         wgUw==
X-Forwarded-Encrypted: i=1; AJvYcCUToMNKJkwvbN+z9Jae1AHN3HGjRV/Kqd56fiRGC6l8/TPPIF4PYKpyasZ3Em6U09TrHoKx+accoiYP7BTZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yycg/YN/YmNdiL8YJpEtDtZRcjUOSkqqlOzdOuOL8Z3drCMuFl+
	5JeIEF823PT13xNAVQM6LyyJQgKCIIKdGJt5qTOren0XmRm/O99D83fYlr98HWvxRVYn4ophYEw
	pBzlxzqRiny6/5QL4/7EcQODOaPKH4G+s8nAeSu+qC2J2gNZD36fUqslArLBu7bI/O5Lz
X-Gm-Gg: AZuq6aI1kZhisySPlfvMAEE4gVChxqBa9v2SxdLTkQ9O2SwXWkYo0Xbk/WP/6n9vezw
	LKIzL9QSrK7s4IsB3ixKTvXVxVXrQuCejXTp9Fa0B8+DMChm6ZQzq8BvDhSGe2HP1jk9jjQRk4P
	JOeXEefC8GQ2DpQZp9+l2NJqJMnl4rkK/pVXvw5Trwea9uQPoy6XxwSGD6j3w9kulevTn5thypA
	d7Mt0qVik5EiUpOka0xgEPO536PQkIUW4pJf2lOfK3Ov/l7/3CnBWiHX/ebc+u4Fn8tXuaHRydm
	EPL+/3YQoHdtAzVZ/OEhpvr/VW46Dkniu4RHQdzjYaVveS1XXlJNSu00miVhxoDxKGaSpP9fH25
	pBqivW8MimLROPG9pWQkHvguywNC6P+I1sKWjAO9PGIZsZP/VJX0PubR9Ow==
X-Received: by 2002:a17:903:3545:b0:29d:a26c:34b6 with SMTP id d9443c01a7336-2ab506145ffmr7602385ad.50.1770963700537;
        Thu, 12 Feb 2026 22:21:40 -0800 (PST)
X-Received: by 2002:a17:903:3545:b0:29d:a26c:34b6 with SMTP id d9443c01a7336-2ab506145ffmr7602065ad.50.1770963699961;
        Thu, 12 Feb 2026 22:21:39 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29848585sm71963005ad.2.2026.02.12.22.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:21:39 -0800 (PST)
Message-ID: <64597399-3c38-436a-8d7e-f05dcb5aced0@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:51:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <20260206-garrulous-lilac-porcupine-083b08@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260206-garrulous-lilac-porcupine-083b08@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0NyBTYWx0ZWRfX9uhhjaVB9nEf
 bXGt6ilkALN6OX2Lu2Chgi5C9SBvc71prAlaCwem5ZVrcUam+nOkM7g3qpRqzsJey/qUDMWIlWi
 Gsqsa7Ad6uJi72I6fMx07faYN127klfuJQVCQNpZgc9sDQf9B3YO+DVQxoC9nKBfTqxvffxAmlR
 Iw/8YdlKI7n8YSA2lJQV/JknzfJrScJMBWweksOfKeRQ5imop1eltVmYmDZvuLW0SvrWYGQf2vh
 V4Xfyem+0FFyFERO5ID9gqSkNmzpBv4Jpb1CWFnSeXedmIILbBV8kWIofEev2e7SAR0Jagx+pZO
 aLQu25L4sLrbuRh9jvLv1O5CFGfgLBR+vBttsighYE4k0ZtlbuuO0Bgx7xk0XFSx6Y6SUxtRpa3
 bJr0TOf20LZnqoBo1lXBCK3Hqa7VlHx+254EEKrl989PspMtNoOoIuHRotrCPXYtRlR84JghEey
 UPGGQrMnzfXflQ78+UQ==
X-Authority-Analysis: v=2.4 cv=ArzjHe9P c=1 sm=1 tr=0 ts=698ec2f5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=HmNDJNLBL1k4sQOxQ4sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 7n9hmi2ZVp3Fl0wXExlv09Q8rP-PehVD
X-Proofpoint-GUID: 7n9hmi2ZVp3Fl0wXExlv09Q8rP-PehVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92743-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 445471333DF
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/6/2026 1:42 PM, Krzysztof Kozlowski wrote:
> On Fri, Feb 06, 2026 at 02:44:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
>> +							      bcl->hwmon_name,
>> +							      bcl,
>> +							      &bcl_hwmon_chip_info,
>> +							      NULL);
>> +	if (IS_ERR(bcl->hwmon_dev)) {
>> +		dev_err(&pdev->dev, "Failed to register hwmon device: %ld\n",
>> +			PTR_ERR(bcl->hwmon_dev));
>> +		return PTR_ERR(bcl->hwmon_dev);
>> +	}
>> +
>> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
>> +		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id bcl_match[] = {
>> +	{
>> +		.compatible = "qcom,bcl-v1",
>> +		.data = &pm7250b_data,
> And that's the proof that your binding is just repeating downstream
> bollocks pattern. Something like "v1" does not exist if you even here
> claim this is not "v1", but pm7250.
ACK, I will update to pmic names
>
>> +	}, {
>> +		.compatible = "qcom,bcl-v2",
>> +		.data = &pm8350_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-bmx",
>> +		.data = &pm8550b_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-wb",
>> +		.data = &pmw5100_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v3-core",
>> +		.data = &pm8550_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-bmx",
>> +		.data = &pmih010_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-wb",
>> +		.data = &pmw6100_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-core",
>> +		.data = &pmh010_data,
>> +	}, {
>> +		.compatible = "qcom,bcl-v4-pmv010",
>> +		.data = &pmv010_data,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, bcl_match);
>> +
>> +static struct platform_driver bcl_driver = {
>> +	.probe	= bcl_probe,
>> +	.driver	= {
>> +		.name		= BCL_DRIVER_NAME,
> No, just use name here.
ACK
>
>> +		.of_match_table	= bcl_match,
>> +	},
>> +};
>> +
>> +MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
>> +MODULE_DESCRIPTION("QCOM BCL HWMON driver");
>> +module_platform_driver(bcl_driver);
>> +MODULE_LICENSE("GPL");
> ...
>
>> +
>> +/**
>> + * bcl_disable_irq - Generic helper to disable alarm irq
>> + * @alarm: BCL level alarm data
>> + */
>> +static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)
> Why do you write actual functions/code in the headers?
>
> Please follow standard C rules, which mean that the C unit contains code
> intended for execution. Headers are only for declarations.

ACK, I will move all codes from header to driver and remove header in 
next revision based on this and other's comment.

Thanks,

Manaf

>
>> +{
>> +	if (!alarm->irq_enabled)
>> +		return;
>> +	alarm->irq_enabled = false;
>> +	disable_irq_nosync(alarm->irq);
>> +	disable_irq_wake(alarm->irq);
>> +}
>> +
>> +#endif /* __QCOM_BCL_HWMON_H__ */
>>
>> -- 
>> 2.43.0
>>

