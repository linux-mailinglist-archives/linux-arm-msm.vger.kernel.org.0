Return-Path: <linux-arm-msm+bounces-103339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK3MORiZ4GlMkAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:08:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF540B557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 060323070F02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A23F38AC93;
	Thu, 16 Apr 2026 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnIoaaH1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvTOUjgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889937FF73
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776326717; cv=none; b=SahY1AlXY9057xxhnlNAof4EQz6NQ+3hXvWvbN5iH5DVwztGaH4oEAdhrIu38myYyWqSER3v126z0OI4tlFa4CsMJMrkboAJ0N5TKXQ69iV3amWSoQaCtPEil8THO4mtKME8LAWWX8fu+avL0SwjLMGkIScnncZ8i5ddhCg84Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776326717; c=relaxed/simple;
	bh=UZL/zCE6+/u3ab90CsKtCMl4Rwb7URTwxgsJn5z6K+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgsdH/4CIZDQRAXfEN+kSZDCcCiBzb51GQQbWGYH+HPhyidhpQzrwhj7Fs/NcdfrjL4f7O/JyYCQtINz/0AurC4bWlDYrNaEx6xtYZa9wrC5cyXl4ulEsO5IqVf5Id9kExo8LdKXlE3lgi93u4LSQg4EV8/98/rHaI80i4zj30I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnIoaaH1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvTOUjgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6PNnD2653859
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vsv+5uYPXR/z5cAiq4qqdE014WDN3zi1/WrUZMit+uI=; b=bnIoaaH1pfUvwoAq
	D1UMEXl8wWCa4ialu/BKrQDTaN7Bf4AbUD6WCvo3IDCiX/YuvkEpERpSE9fWhVsd
	U8BSZpQKsn3AgfZ+fHDIyvNyiEYH3S+bGDfuiZceGa7LAaO3qrqCd4BfVqvZ3s3f
	IaGuf4wgM3ZhDn/vTQ1uOV9hVeH3KD5IrUbRwkOXM1mHjk8NF4trGoFKGV8YsLt0
	SfV2zDev9N//U7ULs8ichbT17aS+46k7d7NWCGMFNp3QPO7LyRE/lCONKJ1UEvUa
	2L9OICrhExByGJLVAalBdi3/bu9/W67+21yBUPOYNAiYsY7M1k/4KJWpss86/C9P
	DWH7fw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtfugae5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:05:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2e91add2aso49246725ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776326714; x=1776931514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vsv+5uYPXR/z5cAiq4qqdE014WDN3zi1/WrUZMit+uI=;
        b=jvTOUjgBLuHydT+kih8HJxlex7yhGWbtuiZbeBTZ4Juo+Z1X+tKDK7nxzhFqPc66dd
         5NvYURNVZIVr9OZznDIJdo+bD0ArBT/w7uzBerABmxznJ4tZdWqkcuD7d2IGDNmi/xqs
         6YP9TzTW1ZlKxfSD/H9TKwFAlwRFLuzFLbocNRRLZ1pnWzrhHZ9T+lMfRRJ+nHOlniQx
         MDe83r2dncabyC9footTp6g8OC4HePqXHgjtoDoF4tnFEmYl/DwHwu0/L3hLKrOxwCaG
         z3/oxrotemLOdAG879c8cLcYySFI5J6fr0+e4eAuIF9NI3OKSE7DIwfAepjD4ji6B3Xz
         lXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776326714; x=1776931514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vsv+5uYPXR/z5cAiq4qqdE014WDN3zi1/WrUZMit+uI=;
        b=rVs9MmyL60GWuLqg6CqCtS8dCEAuw3wM6JllsXMI2af365Sn5hgf/Hunv4frvS2uv4
         Ezmq7Dr2YGsW6PAUeVvp+lbIQ6gtbbpn0tqRyWIi0J7azP0QuChwYf/xpGxLCc/bUWiC
         3o3sczIbiMiOkYy/WAYaU03v3o80dkpDFKYAYvORICE0kTBpTLDMMMVc2fr126/8VCbH
         4O3lChvwqqzvODBD/2LLBzBsu4EqITu2CNzZs5Fj6AJu9KUNZfsiil1NTjwsKFOWMtOQ
         MFPiSAclClwuDtiBBxT3MVWt4O84ctVuBd+L8m8+A1CExYTswnmvPws/ROskzhViKm+B
         n4eQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8qs+yj6Rwm8al2sjVqa/lkevOhwcOUqSVmEY9ubHCKZcpN0wJcGUW+4y1uSldZr2hnYH6/N6/BghNAD+o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3x1q0Umari/mZckPMxu6e0M65tTv22MOvyCGMOPnngXQKjQdA
	2zqJpCofbBMs1ZfNpTTF8L45/zbJST3N5r/odW73oRFdDjGwpYmra/TVbt1UTugmWBkBPvEBP7R
	5SUURuxYyZ6FzgMqXb1DdY6ErkhNW8P7gGQysYiKVEghdLi6ssQSaCoT/AJBI1PxnaPx8
X-Gm-Gg: AeBDiespz+0myR3XJ9JmyXUpuYj5UdMN0h+BLk+LObBuxoA5YwD2o8G6N5sb5+PDuef
	A08r8ZNZQt3M94FaMxuKD38KuX9vDNUnhUku1g2BVbaWNALq5phRJpMTQwTwdzzTgj61X6SB0n8
	/ylyPcXc8qUXkKCwFQhTYF/F2b43Xs7vQN/Vbbvi+h/kx7DUkmvAdLlpQTwo6W3GQv6BwVo+v/S
	R/jVjLPPI1CaeFJ5egeIT/XoIcBC5cYUZPzS2mo8ukcuIdOVtH5Q2ke6/x60mnibfYSDkNhVgAb
	0AlmidhlUGR+qCmfs09mgO+Ua26hgCPPZpm1ROinbohd4PGdWIagKFwQ2OLcFDmn/D0aVmmQmCc
	njcDcldFIZ1gyGgUqEFKX7wVuD/3ZnQcJjDYZI7xYE187QzSspjU=
X-Received: by 2002:a17:903:27c5:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b2d593e9a0mr160961745ad.11.1776326713645;
        Thu, 16 Apr 2026 01:05:13 -0700 (PDT)
X-Received: by 2002:a17:903:27c5:b0:2ae:8253:1452 with SMTP id d9443c01a7336-2b2d593e9a0mr160961145ad.11.1776326713007;
        Thu, 16 Apr 2026 01:05:13 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4780efa9fsm43693665ad.12.2026.04.16.01.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:05:12 -0700 (PDT)
Message-ID: <12d683aa-44c2-4e2d-8459-78ba9f2ab61e@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 13:35:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 4/4] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
References: <20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com>
 <20260130115421.2197892-5-jishnu.prakash@oss.qualcomm.com>
 <addDTiI8MB2b_AzJ@mai.linaro.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <addDTiI8MB2b_AzJ@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JBLfVI7kO6ZXrwBkOCjb8YcTV25JDc4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NSBTYWx0ZWRfX2VUnXoSNUrKI
 ytDs2o5D1wAnnnLyK1HJvKNrQuA96rkXMVtnptkpGTu6Qs+1Ncl6nwpiVIwpm0Q/BZwC5nWiiRE
 oED1G3c4U6Yd8tCNJHKYGnCw0VhaFq9spSFcO3abxn5o2Zfjrr+UZDl4olZ9zsVoSYLqRrIcGCY
 zX/4zwzq5G1UhzOcH3022DhMH3cuZtY62sVtEO+8SWtxm2Ac4XYuR8FKsfGVqh3uMHrB/JXzVng
 FeTyryZ4xjq/uemDA4MEx43dxM11YiHjcpL9+KIOuMkvSfs6ofdgVm1Nd96zDqUvlxYfxKhNbwb
 70U6Emy2D/PMqJa6PHOXorKZ1YINK/ttTesASb0jjJa4tvHJFuWezKDhH8hHlQg+sIaFAkSMVlv
 J4wjvNN3U3AEVwt4FdUnh6+8CbNBt4+QngA0PAn4FWNSjPh/1haKAOK2YyrkcjMAGdagCZu2TOa
 EekcRt7BhL6HJPPo7Vw==
X-Proofpoint-GUID: JBLfVI7kO6ZXrwBkOCjb8YcTV25JDc4H
X-Authority-Analysis: v=2.4 cv=KrF9H2WN c=1 sm=1 tr=0 ts=69e0983a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UIyr7bPPjXOt8B0KRnkA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160075
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103339-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com,intel.com,arm.com,vger.kernel.org,chromium.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FEF540B557
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Daniel,

On 4/9/2026 11:42 AM, Daniel Lezcano wrote:
> On Fri, Jan 30, 2026 at 05:24:21PM +0530, Jishnu Prakash wrote:
>> Add support for ADC_TM part of PMIC5 Gen3.
>>
>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>> drivers, used to support thermal trip points.
>>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

...

>> +
>> +static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>> +	int ret, sdam_num;
>> +	u8 tm_status[2];
>> +	u8 status, val;
>> +
>> +	sdam_num = get_sdam_from_irq(adc_tm5, irq);
>> +	if (sdam_num < 0) {
>> +		dev_err(adc_tm5->dev, "adc irq %d not associated with an sdam\n",
>> +			irq);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
>> +			     &status, sizeof(status));
>> +	if (ret) {
>> +		dev_err(adc_tm5->dev, "adc read status1 failed with %d\n", ret);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
>> +		dev_err_ratelimited(adc_tm5->dev,
>> +				    "Unexpected conversion fault, status:%#x\n",
>> +				    status);
>> +		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
>> +		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
>> +				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
>> +			     tm_status, sizeof(tm_status));
>> +	if (ret) {
>> +		dev_err(adc_tm5->dev, "adc read TM status failed with %d\n", ret);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	if (tm_status[0] || tm_status[1])
>> +		schedule_work(&adc_tm5->tm_handler_work);
>> +
>> +	dev_dbg(adc_tm5->dev, "Interrupt status:%#x, high:%#x, low:%#x\n",
>> +		status, tm_status[0], tm_status[1]);
>> +
>> +	return IRQ_HANDLED;
> 
> This ISR routine should be revisited:
> 
>  - no error message inside

I'll drop all the error messages, but does that also include the debug print at the end?
In addition, the print for conversion fault is ratelimited and may be useful as it
indicates a possible HW issue, can I keep that?

> 
>  - use a shared interrupt to split what is handled by the ADC and the
>     TM drivers

I'll make the required updates in the main ADC driver and this driver to share the first
SDAM's interrupt.

> 
>  - do not return IRQ_HANDLED in case of error (cf. irqreturn.h doc)
> 

I'll replace IRQ_HANDLED with IRQ_NONE at places where errors are returned.
But in the case of conversion fault, I think returning IRQ_HANDLED may be
more appropriate because we do handle it by clearing the status, to
allow subsequent conversion requests to be sent. 

What do you think, is this fine?

>  - do not use a dedicated workqueue but the threaded mechanism of the irq
> 

I'll make this change.

>> +}
>> +
>> +static int adc5_gen3_tm_status_check(struct adc_tm5_gen3_chip *adc_tm5,
>> +				     int sdam_index, u8 *tm_status, u8 *buf)
>> +{
>> +	int ret;
>> +
>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
>> +			     tm_status, 2);
>> +	if (ret) {
>> +		dev_err(adc_tm5->dev, "adc read TM status failed with %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS_CLR,
>> +				     tm_status, 2);
>> +	if (ret) {
>> +		dev_err(adc_tm5->dev, "adc status clear conv_req failed with %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_CH_DATA0(0),
>> +			     buf, 16);
>> +	if (ret)
>> +		dev_err(adc_tm5->dev, "adc read data failed with %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static void tm_handler_work(struct work_struct *work)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = container_of(work, struct adc_tm5_gen3_chip,
>> +							 tm_handler_work);
>> +	int sdam_index = -1;
>> +	u8 tm_status[2] = { };
>> +	u8 buf[16] = { };
>> +
>> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
>> +		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
>> +		int offset = chan_prop->tm_chan_index;
>> +		bool upper_set, lower_set;
>> +		int ret, temp;
>> +		u16 code;
>> +
>> +		scoped_guard(adc5_gen3, adc_tm5) {
>> +			if (chan_prop->sdam_index != sdam_index) {
>> +				sdam_index = chan_prop->sdam_index;
>> +				ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
>> +								tm_status, buf);
>> +				if (ret)
>> +					return;
>> +			}
>> +
>> +			upper_set = ((tm_status[0] & BIT(offset)) && chan_prop->high_thr_en);
>> +			lower_set = ((tm_status[1] & BIT(offset)) && chan_prop->low_thr_en);
>> +		}
>> +
>> +		if (!(upper_set || lower_set))
>> +			continue;
>> +
>> +		code = get_unaligned_le16(&buf[2 * offset]);
>> +		dev_dbg(adc_tm5->dev, "ADC_TM threshold code:%#x\n", code);
> 
> Please avoid debug traces when possible
> 
>> +		ret = adc5_gen3_therm_code_to_temp(adc_tm5->dev,
>> +						   &chan_prop->common_props,
>> +						   code, &temp);
>> +		if (ret) {
>> +			dev_err(adc_tm5->dev,
>> +				"Invalid temperature reading, ret = %d, code=%#x\n",
>> +				ret, code);
> 
> And avoid error traces in the runtime path

Will drop the above prints here and in other similar places if any.

> 
>> +			continue;
>> +		}
>> +
>> +		chan_prop->last_temp = temp;
>> +		chan_prop->last_temp_set = true;
>> +		thermal_zone_device_update(chan_prop->tzd, THERMAL_TRIP_VIOLATED);
>> +	}
>> +}
>> +
>> +static int adc_tm5_gen3_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
>> +	struct adc_tm5_gen3_chip *adc_tm5;
>> +
>> +	if (!prop || !prop->chip)
>> +		return -EINVAL;
>> +
>> +	adc_tm5 = prop->chip;
>> +
>> +	if (prop->last_temp_set) {
>> +		pr_debug("last_temp: %d\n", prop->last_temp);
>> +		prop->last_temp_set = false;
>> +		*temp = prop->last_temp;
>> +		return 0;
>> +	}
> 
> Why do you need to do that?
> 
> The temperature should reflect the current situation even if the
> reading was triggered by a thermal trip violation.
> 

This logic is needed to handle a corner case issue we have seen earlier.
In this case, the ADC_TM threshold violation interrupt gets triggered ,
but when get_temp() is subsequently called by the thermal framework, the
temperature has fluctuated and the value read now lies within the thresholds,
so the thresholds do not get updated by the thermal framework and the violation
interrupts get repeated several times, until there is a get_temp() call
which returns a temperature outside the threshold range.

In order to avoid this issue, when the interrupt handler runs, we find the actual
temperature read in ADC_TM that led to threshold violation by reading the ADC_TM
data registers and we cache it and return it when get_temp() is called in the flow
of thermal_zone_device_update(). Any subsequent calls to get_temp() would
return the actual channel temperature at the time.

This is only done to avoid delaying thermal mitigation due to temperature
fluctuations. Do you think this needs to be changed?


>> +
>> +	return adc5_gen3_get_scaled_reading(adc_tm5->dev, &prop->common_props,
>> +					    temp);
>> +}
>> +
>> +static int adc_tm5_gen3_disable_channel(struct adc_tm5_gen3_channel_props *prop)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
>> +	int ret;
>> +	u8 val;
>> +
>> +	prop->high_thr_en = false;
>> +	prop->low_thr_en = false;
>> +
>> +	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val = BIT(prop->tm_chan_index);
>> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
>> +			      ADC5_GEN3_TM_HIGH_STS_CLR, &val, sizeof(val));
>> +	if (ret)
>> +		return ret;
>> +
>> +	val = MEAS_INT_DISABLE;
>> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
>> +			      ADC5_GEN3_TIMER_SEL, &val, sizeof(val));
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* To indicate there is an actual conversion request */
>> +	val = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
>> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
>> +			      ADC5_GEN3_PERPH_CH, &val, sizeof(val));
>> +	if (ret)
>> +		return ret;
>> +
>> +	val = ADC5_GEN3_CONV_REQ_REQ;
>> +	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
>> +			       ADC5_GEN3_CONV_REQ, &val, sizeof(val));
>> +}
>> +
>> +#define ADC_TM5_GEN3_CONFIG_REGS 12
> 
> Please define at the top of the file
> 
>> +static int adc_tm5_gen3_configure(struct adc_tm5_gen3_channel_props *prop,
>> +				  int low_temp, int high_temp)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
>> +	u8 buf[ADC_TM5_GEN3_CONFIG_REGS];
>> +	u8 conv_req;
>> +	u16 adc_code;
>> +	int ret;
>> +
>> +	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = adc5_gen3_read(adc_tm5->dev_data, prop->sdam_index,
>> +			     ADC5_GEN3_SID, buf, sizeof(buf));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* Write SID */
>> +	buf[0] = FIELD_PREP(ADC5_GEN3_SID_MASK, prop->common_props.sid);
>> +
>> +	/* Select TM channel and indicate there is an actual conversion request */
>> +	buf[1] = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
>> +
>> +	buf[2] = prop->timer;
>> +
>> +	/* Digital param selection */
>> +	adc5_gen3_update_dig_param(&prop->common_props, &buf[3]);
>> +
>> +	/* Update fast average sample value */
>> +	buf[4] &= ~ADC5_GEN3_FAST_AVG_CTL_SAMPLES_MASK;
>> +	buf[4] |= prop->common_props.avg_samples | ADC5_GEN3_FAST_AVG_CTL_EN;
>> +
>> +	/* Select ADC channel */
>> +	buf[5] = prop->common_props.channel;
>> +
>> +	/* Select HW settle delay for channel */
>> +	buf[6] = FIELD_PREP(ADC5_GEN3_HW_SETTLE_DELAY_MASK,
>> +			    prop->common_props.hw_settle_time_us);
>> +
>> +	/* High temperature corresponds to low voltage threshold */
>> +	prop->low_thr_en = (high_temp != INT_MAX);
>> +	if (prop->low_thr_en) {
>> +		adc_code = qcom_adc_tm5_gen2_temp_res_scale(high_temp);
>> +		put_unaligned_le16(adc_code, &buf[8]);
>> +	}
>> +
>> +	/* Low temperature corresponds to high voltage threshold */
>> +	prop->high_thr_en = (low_temp != -INT_MAX);
>> +	if (prop->high_thr_en) {
>> +		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
>> +		put_unaligned_le16(adc_code, &buf[10]);
>> +	}
>> +
>> +	buf[7] = 0;
>> +	if (prop->high_thr_en)
>> +		buf[7] |= ADC5_GEN3_HIGH_THR_INT_EN;
>> +	if (prop->low_thr_en)
>> +		buf[7] |= ADC5_GEN3_LOW_THR_INT_EN;
>> +
>> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index, ADC5_GEN3_SID,
>> +			      buf, sizeof(buf));
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	conv_req = ADC5_GEN3_CONV_REQ_REQ;
>> +	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
>> +			       ADC5_GEN3_CONV_REQ, &conv_req, sizeof(conv_req));
>> +}
>> +
>> +static int adc_tm5_gen3_set_trip_temp(struct thermal_zone_device *tz,
>> +				      int low_temp, int high_temp)
>> +{
>> +	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
>> +	struct adc_tm5_gen3_chip *adc_tm5;
>> +
>> +	if (!prop || !prop->chip)
>> +		return -EINVAL;
>> +
>> +	adc_tm5 = prop->chip;
>> +
>> +	dev_dbg(adc_tm5->dev, "channel:%s, low_temp(mdegC):%d, high_temp(mdegC):%d\n",
>> +		prop->common_props.label, low_temp, high_temp);
>> +
>> +	guard(adc5_gen3)(adc_tm5);
>> +	if (high_temp == INT_MAX && low_temp == -INT_MAX)
>> +		return adc_tm5_gen3_disable_channel(prop);
> 
> Why disable the channel instead of returning an errno ?
> 

This is the convention we follow in our existing ADC_TM driver at
drivers/thermal/qcom/qcom-spmi-adc-tm5.c. If both upper and lower
thresholds are meant to be disabled, we disable the channel fully
in HW to save some power and it can be enabled later if this API
is called for it with valid thresholds.

Is it considered invalid in the thermal framework to try to disable
both thresholds? Should I both disable the channel and return some
error from here?


>> +	return adc_tm5_gen3_configure(prop, low_temp, high_temp);
>> +}
>> +
>> +static const struct thermal_zone_device_ops adc_tm_ops = {
>> +	.get_temp = adc_tm5_gen3_get_temp,
>> +	.set_trips = adc_tm5_gen3_set_trip_temp,
>> +};
>> +
>> +static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
>> +{
>> +	unsigned int i, channel;
>> +	struct thermal_zone_device *tzd;
>> +	int ret;
>> +
>> +	for (i = 0; i < adc_tm5->nchannels; i++) {
>> +		channel = ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
>> +		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
>> +						    &adc_tm5->chan_props[i],
>> +						    &adc_tm_ops);
>> +
>> +		if (IS_ERR(tzd)) {
>> +			if (PTR_ERR(tzd) == -ENODEV) {
>> +				dev_warn(adc_tm5->dev,
>> +					 "thermal sensor on channel %d is not used\n",
>> +					 channel);
>> +				continue;
>> +			}
>> +			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
>> +					     "Error registering TZ zone:%ld for channel:%d\n",
>> +					     PTR_ERR(tzd), channel);
>> +		}
>> +		adc_tm5->chan_props[i].tzd = tzd;
>> +		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void adc5_gen3_clear_work(void *data)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = data;
>> +
>> +	cancel_work_sync(&adc_tm5->tm_handler_work);
>> +}
>> +
>> +static void adc5_gen3_disable(void *data)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = data;
>> +	int i;
>> +
>> +	guard(adc5_gen3)(adc_tm5);
>> +	/* Disable all available TM channels */
>> +	for (i = 0; i < adc_tm5->nchannels; i++)
>> +		adc_tm5_gen3_disable_channel(&adc_tm5->chan_props[i]);
>> +}
>> +
>> +static void adctm_event_handler(struct auxiliary_device *adev)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5 = auxiliary_get_drvdata(adev);
>> +
>> +	schedule_work(&adc_tm5->tm_handler_work);
>> +}
>> +
>> +static int adc_tm5_probe(struct auxiliary_device *aux_dev,
>> +			 const struct auxiliary_device_id *id)
>> +{
>> +	struct adc_tm5_gen3_chip *adc_tm5;
>> +	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
>> +	struct device *dev = &aux_dev->dev;
>> +	int i, ret;
>> +
>> +	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
>> +	if (!adc_tm5)
>> +		return -ENOMEM;
>> +
>> +	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper,
>> +				       aux_dev);
>> +
>> +	adc_tm5->dev = dev;
>> +	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
>> +	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
>> +	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
>> +					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
>> +	if (!adc_tm5->chan_props)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < adc_tm5->nchannels; i++) {
>> +		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
>> +		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
>> +		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
>> +		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
>> +		adc_tm5->chan_props[i].chip = adc_tm5;
>> +	}
>> +
>> +	INIT_WORK(&adc_tm5->tm_handler_work, tm_handler_work);
> 
> Why is it needed

I'll drop it as you suggested.

> 
>> +	/*
>> +	 * Skipping first SDAM IRQ as it is requested in parent driver.
>> +	 * If there is a TM violation on that IRQ, the parent driver calls
>> +	 * the notifier (adctm_event_handler) exposed from this driver to handle it.
>> +	 */
>> +	for (i = 1; i < adc_tm5->dev_data->num_sdams; i++) {
>> +		ret = devm_request_threaded_irq(dev,
>> +						adc_tm5->dev_data->base[i].irq,
>> +						NULL, adctm5_gen3_isr, IRQF_ONESHOT,
>> +						adc_tm5->dev_data->base[i].irq_name,
>> +						adc_tm5);
> 
> The threaded interrupts set the isr in a thread and from the thread
> handling the event, there is a work queue scheduled. Why not use the
> top and bottom halves of the threaded interrupt ? Hopefully you should
> be able to remove the lock.

Yes, I can use the top and bottom halves of the threaded interrupt as you
suggested. But what exactly do you mean by removing the lock?

If you meant the mutex lock used in this driver, we cannot remove that.
This is because the ADC_TM driver needs to write into several registers
shared with the main ADC driver for setting new thresholds, so we
have to share a mutex between the drivers to prevent concurrency issues.

I'll address all your other comments too in the next version of this patch.

Thanks,
Jishnu


> 
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	/*
>> +	 * This drvdata is only used in the function (adctm_event_handler)
>> +	 * called by parent ADC driver in case of TM violation on the first SDAM.
>> +	 */
>> +	auxiliary_set_drvdata(aux_dev, adc_tm5);
>> +
>> +	adc5_gen3_register_tm_event_notifier(dev, adctm_event_handler);
>> +
>> +	/*
>> +	 * This is to cancel any instances of tm_handler_work scheduled by
>> +	 * TM interrupt, at the time of module removal.
>> +	 */
>> +
> 
> Remove the extra line
> 
>> +	ret = devm_add_action(dev, adc5_gen3_clear_work, adc_tm5);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = adc_tm5_register_tzd(adc_tm5);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* This is to disable all ADC_TM channels in case of probe failure. */
>> +
> 
> Remove the extra line
> 
>> +	return devm_add_action(dev, adc5_gen3_disable, adc_tm5);
>> +}
>> +
>> +static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
>> +	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3", },
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(auxiliary, adctm5_auxiliary_id_table);
>> +
>> +static struct auxiliary_driver adctm5gen3_auxiliary_driver = {
>> +	.id_table = adctm5_auxiliary_id_table,
>> +	.probe = adc_tm5_probe,
>> +};
>> +
>> +module_auxiliary_driver(adctm5gen3_auxiliary_driver);
>> +
>> +MODULE_DESCRIPTION("SPMI PMIC Thermal Monitor ADC driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("QCOM_SPMI_ADC5_GEN3");
>> -- 
>> 2.25.1
>>
> 


