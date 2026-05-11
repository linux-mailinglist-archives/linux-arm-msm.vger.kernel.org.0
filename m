Return-Path: <linux-arm-msm+bounces-106916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D9QFl3KAWoRjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB92750D986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBE223054F79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32154378839;
	Mon, 11 May 2026 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLPnJoTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYU2zKuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0F436C0C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501767; cv=none; b=BG13JMN5/pc5sbhfKVtpUk1PYjivJyfQnupZg7yW7cWLOZhf1hpkAvhol2N11lVhzwmf1gbFPPyK3atIFsExZVyo33xOeQJCo3AozbBGqh9DEIOI60o2Fw+wW5McbASZcMTPEWRMBiVe1vq/AplqnkS7G3rI/jZLSjayILcLysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501767; c=relaxed/simple;
	bh=5LmD2xrBd+BvxXKGNxHQHr/mIsjpL3/68DT28tsrkZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tr/8QDVC8SNiMTUN4rm4xz00XEnQXPTsb6beuZ25Sx2JmgCYHqY5VoLDPmV7T+rYRHT8VVlZGpCksYj/t34GoSoo9vUKK+LVS4V9yUmPiONPXyZ61L6BWkShu9XKvzk7ZRTI+dtZrDRQIXTlcqaRAKZfhiH3ShW92ZfPJSix1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLPnJoTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYU2zKuO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6gMOu774891
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvDL5vXfS5wOLGhwRK0Utz3a8iu2H0eH/wjvaiL9gP0=; b=BLPnJoTdpq5YWlbP
	XPQTJ6NkMXYj5WwMG1apYlkhyGVbBf39NfQjURKK1Cc4gc7G/ugnSI5ikBDSQiul
	CvsI744Ujozy2oswZKwxwSxinaKvZ0K3QUqRgOdDVaYV7ZfjiGSn9Pam7yuuwhe4
	ywooZQua6GjMumO02IpgP7fRZxwyiidnb2gt1wvhCBWDXGaSjlQ2Kzs2qKADAYPw
	Ekk+y2OMkAY/HAMD41mo+Ioepcz2NfJL84pkcTaGuln91UiKKNGdg+WgNF0PzMpv
	rLT+LqfpQeMz0wN2xpEbnchQDmdvlLuPKqdCgPzhIT19Ll9Vl/4+P50jWAgayw8y
	hVlIJQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3a32h5c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:16:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so3992214eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778501764; x=1779106564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvDL5vXfS5wOLGhwRK0Utz3a8iu2H0eH/wjvaiL9gP0=;
        b=IYU2zKuOseOlRFHbnZYyfTZO+ALSHD7vXZnWBWMbcqJ4cZzqPbhE288pTRqiy/5q9n
         58S6KGAAn81pxR8ZNG9VPP1MJjL88FbYju1TPU3SMryO8G+wTM1tvMoxHs/MUqCgOnBU
         xDUQuMhQyA1ZjQB+77No3TqSrFZJjea3y7KX9RpmnfPCBzk5dKacNBz72sPJ58KoRVlE
         7RiARnpCavU0o/a8lJiHjl3XpsWhfXHYilh6snhaVVE0hRQ2peEZpJ3g+4jIbQKlB74C
         ur5PSZ//W7Mdo/LrNeR8m9mOG5mfLYhb5Fl4auXK2aQyon3on9YsqxLPygjXbESj/s4+
         CHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501764; x=1779106564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvDL5vXfS5wOLGhwRK0Utz3a8iu2H0eH/wjvaiL9gP0=;
        b=LiRVwxmX0AxNdeZzJwWdKixrZfB66CTLOCML/2O7M9GdNarWkOt3KU1/5L62CMNe+H
         I450ghsGQhY/A1SMKT64zIY/03LsbysgSH4BKFzv0e7LOPN5++E9JjAXB2qHDgb85xJ0
         FttFz78gk2OSMPEpBAklX7Ggb3pOW/h8wx3Ye7no+yZDKFrpVFMkCYMFXuHcNMHPz6Wb
         3cYUe/Okj92TkINnGCRvO1qR8NQ1oEyaR9NWBFxvPQMK88lznCUIgfcv10tBQtDTrjNT
         cwgTlW+R+bOho+YSO75KsNZMH0818FSdrXudWgNIffd6ugM6WtzRhjymEXmC5G67CKIp
         qnTg==
X-Forwarded-Encrypted: i=1; AFNElJ8TemDWkJjjipjSlWFSF2EEdVtbo0cYYkT0xWY3is5Hux+gfyqFs+a46ekt4IGy5gFXVuKyZ2LMwDmZpgO+@vger.kernel.org
X-Gm-Message-State: AOJu0YwgZT6JH7wq/hXr9r9jM9kpvuOQZ4MRCZhGUIRZ2pESuyltud2V
	4rUdKkGNWhgTDXZGhqo5dPBI4GbjDWhOBRkjAZE4xRRT0VNE/6bsyD2gQ71mw33LoSG6u4PKKvg
	Sok6wAS7oDPi4U69pNubmIrFb6mSMhDJTCx/T7r83wuhw+nQsmwh2gUo6x1caBBnl1jFa
X-Gm-Gg: Acq92OEwh4V0EdHfFXLsl4KUSQoZvdl9wPsu1cox5DGgutpVZjGr3dFDR6YOBiOwaWq
	hbtE0+K2Dm5ANFcYG19xaYVPccD7pRV6K5Rvn1l3ITREcN/6stLoPsAGo/AYBEBYh4s0FrWzgLn
	AGuTkZc5GsS2tEJo1jAjg4gPCkVevrPhIdecLfTmlNKb7XKdSTxjz3nZHwF6ceJ2m762DfGhKpS
	lv0zNjdbGklAXvfMr5IercvzQrX65QVXZDiKjW4WQldSEpiKzE6S9oD5CSTXXkq1dAk1EW7bAkV
	qfG0yprAYlED2JjPzNhrY1y/APCTbBQAg6vLywjfge1Uky5MYZYylh6bjAZVND4z+nflxYdazbN
	cqlo8rvnzwfK8M1Q9kUBMm7tbkiSxBclUZl7X6PrKqXAXZ1spWLI2Qsd9tJ2ny/SPGz38Qp7q/g
	AmhvQ=
X-Received: by 2002:a05:7300:ac81:b0:2db:2089:460f with SMTP id 5a478bee46e88-2f85d94b37cmr6218869eec.19.1778501764081;
        Mon, 11 May 2026 05:16:04 -0700 (PDT)
X-Received: by 2002:a05:7300:ac81:b0:2db:2089:460f with SMTP id 5a478bee46e88-2f85d94b37cmr6218841eec.19.1778501763468;
        Mon, 11 May 2026 05:16:03 -0700 (PDT)
Received: from [10.110.69.241] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847506fsm15790665eec.18.2026.05.11.05.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:16:03 -0700 (PDT)
Message-ID: <7fcc699e-bf46-4d67-8f66-df1668e2351b@oss.qualcomm.com>
Date: Mon, 11 May 2026 20:15:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
References: <20260507112626.2527413-1-linlin.zhang@oss.qualcomm.com>
 <af0Bsv-OFs3rmbQS@baldur>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <af0Bsv-OFs3rmbQS@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4GFFhOC2Sly0XdT7lDuBl1WFgUcPJeDz
X-Proofpoint-GUID: 4GFFhOC2Sly0XdT7lDuBl1WFgUcPJeDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzNiBTYWx0ZWRfX1l5A/t06O/p3
 f3VlxZ7j/AWNR+zVnBgXvzgy8wLMiv9f1gk0SmAVJu1RyQQ98Isw0TuFG1kAef7fEi7KdMgaN+F
 sbg/bhWgGXLSx4rmTHaqC7AEEDSXlGLcC/0bbbyMXIcCQTNDHMYrpd5emcbq52nKMJK+7Dk9Dr0
 Oho81Dth0TAnbHT/mYWNblTtivN+VviNy955FIDILaEuDZNNMz2uhljM3/Rz2H18Zn1oJlo7NvK
 7QSeicTgesQtCg8n1szR4fwrBFdEgmZ8WRYeBhBEdIdVyHf2TJlpguyhJONlSYTDYX98DXYSB21
 yEgDkZPoXyBbGqS0nBVCIE2SqL5oXHEa5edY84Kc0QgSfRVfcMJl3RfbgQIIS4Wuhse/nbmvnxr
 Dr4rhp7mDSN3HlR4NY9Liw2QDgj/jON4aWYQCEQbCDtpEjSAh3pHgUKQGz0sZ8MgzCF0KvTjZFj
 fQ5GZ8HFlSbJuAiyoIQ==
X-Authority-Analysis: v=2.4 cv=SLVykuvH c=1 sm=1 tr=0 ts=6a01c885 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WYTWnbZezO1wd6nDf14A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110136
X-Rspamd-Queue-Id: AB92750D986
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-106916-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/8/2026 5:19 AM, Bjorn Andersson wrote:
> On Thu, May 07, 2026 at 04:26:24AM -0700, Linlin Zhang wrote:
> 
> I only got 2 of the 3 patches, and no cover letter. I can see in the
> mail headers that you have:
> 
>  X-Mailer: git-send-email 2.25.1
> 
> Use b4 to avoid this kind of mistakes.

Thank you for the clarification.

I followed an incorrect suggestion to split the original patch series,
intending to send different patches to different maintainers. It turns out
this was a mistake and resulted in an incomplete series being delivered.

The missing cover letter and the other patch are available here:
https://lore.kernel.org/all/20260507112454.2527088-1-linlin.zhang@oss.qualcomm.com/

I will resend the full series (cover letter and all patches) together as a
single patch set.

Sorry for the confusion, and thanks for your patience.

> 
> Regards,
> Bjorn
> 
>> The QCOM ICE driver manages the ICE core clock through direct calls to
>> clk_prepare_enable() and clk_disable_unprepare(), which limits integration
>> with platforms that rely on firmware-managed resources or platform-specific
>> power management mechanisms.
>>
>> Replace direct clock management with runtime PM support by moving clock
>> enable and disable into runtime PM callbacks. Use
>> pm_runtime_resume_and_get() and pm_runtime_put_sync() in qcom_ice_resume()
>> and qcom_ice_suspend() to drive power state transitions, and enable runtime
>> PM in qcom_ice_probe().
>>
>> Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>> Reviewed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/ice.c | 58 ++++++++++++++++++++++++++++++++++++++----
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>> index b203bc685cad..6f9d679b530c 100644
>> --- a/drivers/soc/qcom/ice.c
>> +++ b/drivers/soc/qcom/ice.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/of.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>  
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  
>> @@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
>>  	struct device *dev = ice->dev;
>>  	int err;
>>  
>> -	err = clk_prepare_enable(ice->core_clk);
>> -	if (err) {
>> +	err = pm_runtime_resume_and_get(dev);
>> +	if (err < 0) {
>>  		dev_err(dev, "failed to enable core clock (%d)\n",
>>  			err);
>>  		return err;
>> @@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
>>  
>>  int qcom_ice_suspend(struct qcom_ice *ice)
>>  {
>> -	clk_disable_unprepare(ice->core_clk);
>> +	pm_runtime_put_sync(ice->dev);
>>  	ice->hwkm_init_complete = false;
>>  
>>  	return 0;
>> @@ -716,24 +717,69 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
>>  
>>  static int qcom_ice_probe(struct platform_device *pdev)
>>  {
>> +	struct device *dev = &pdev->dev;
>>  	struct qcom_ice *engine;
>>  	void __iomem *base;
>> +	int ret;
>>  
>>  	base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(base)) {
>> -		dev_warn(&pdev->dev, "ICE registers not found\n");
>> +		dev_warn(dev, "ICE registers not found\n");
>>  		return PTR_ERR(base);
>>  	}
>>  
>> -	engine = qcom_ice_create(&pdev->dev, base);
>> +	engine = qcom_ice_create(dev, base);
>>  	if (IS_ERR(engine))
>>  		return PTR_ERR(engine);
>>  
>>  	platform_set_drvdata(pdev, engine);
>>  
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret) {
>> +		dev_warn(dev, "Enable runtime PM failed, ret: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0) {
>> +		dev_warn(dev, "Runtime PM fails to resume, ret: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> +static void qcom_ice_remove(struct platform_device *pdev)
>> +{
>> +	pm_runtime_put_sync(&pdev->dev);
>> +}
>> +
>> +static int ice_runtime_resume(struct device *dev)
>> +{
>> +	struct qcom_ice *ice = dev_get_drvdata(dev);
>> +	int err = 0;
>> +
>> +	err = clk_prepare_enable(ice->core_clk);
>> +	if (err) {
>> +		dev_err(dev, "failed to enable core clock (%d)\n",
>> +			err);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int ice_runtime_suspend(struct device *dev)
>> +{
>> +	struct qcom_ice *ice = dev_get_drvdata(dev);
>> +
>> +	clk_disable_unprepare(ice->core_clk);
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ice_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(ice_runtime_suspend, ice_runtime_resume, NULL)
>> +};
>> +
>>  static const struct of_device_id qcom_ice_of_match_table[] = {
>>  	{ .compatible = "qcom,inline-crypto-engine" },
>>  	{ },
>> @@ -742,8 +788,10 @@ MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
>>  
>>  static struct platform_driver qcom_ice_driver = {
>>  	.probe	= qcom_ice_probe,
>> +	.remove = qcom_ice_remove,
>>  	.driver = {
>>  		.name = "qcom-ice",
>> +		.pm = &ice_pm_ops,
>>  		.of_match_table = qcom_ice_of_match_table,
>>  	},
>>  };
>> -- 
>> 2.34.1
>>


