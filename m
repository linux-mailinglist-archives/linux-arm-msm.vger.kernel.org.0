Return-Path: <linux-arm-msm+bounces-110512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJNKLO4tHWo4WAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380761A87F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 08:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35CE3013276
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 06:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646B8343889;
	Mon,  1 Jun 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jo0Lzogy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMeGbOuV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2281737FF7F
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 06:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296750; cv=none; b=dF4N/1HnJK7mthiKJZHFJalWSIU+EIKnarSR481dNHJJLjnXj93QnjctT+X9MGRUQfMKTVZb6+F33EwzWPp+z9XnzEfGO81m4kuvv0EKGGFVc1TYxVgWfBT+VHJZfRTRyscM19l7ps3GMqPQ4vVIRTHAM3Y1hVYxSN3n7pPdByI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296750; c=relaxed/simple;
	bh=XZpXct3qr36dcgHjb2/rqDwDBavphiOSG42YiqiT71A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iy4OrWFnSEzNhJSMTj5rg1x6K+HwdSi8A4guG6bFRYQU6jFVkDJjW4oN/uIBWsE6xLkaiSonWLAWt8Xbbw6plCiGAGhNrVxCFT+5lVG0Q6HhF9RxE7GVtbo4S/MVGJxPE0tqJZ3+51DJ9ckPaPvvxJ0WSPz14HgIP7zrXwyQSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jo0Lzogy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMeGbOuV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VNbf533269799
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 06:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iyou3X5eHXmwONgdpxt9PcO5bf2Dompms35djagGuVM=; b=Jo0LzogyHkUG0B30
	j+53Q2rYx2xRzmSddxgDAxAFVah7jcfmEzEnxfiuqqvLbhgb3tkOYuxdmKOpBrK/
	8yUjcFdifWXzL7sE/ajeDXsrv/xNBNx/jwVfQDKkZ4mcYYNeZgyaY4mu2VhTA91N
	sPmC7pzTCT2UzBicIeGr63WfdD4S9C2VpQj3nAWatavKUp0DkuLRLcyEqntEL3QB
	uqWizwKTNTJ1epDWuqs7+UoJxuIjvLi++HQueheh17ptPN39wTZGR+5gsXsAIsgO
	GJsxefdlA5qEOPD0SoPEdqo12SrnmgmtGvF68FeAwJ7YboraUzTZYOABMhDYFAFW
	lMM3sQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98e31x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:52:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84233efcaadso867028b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 May 2026 23:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296747; x=1780901547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iyou3X5eHXmwONgdpxt9PcO5bf2Dompms35djagGuVM=;
        b=aMeGbOuVXPqULmrQLbRTzEQagT+uAozPvyjl3gS589YUrMsKNXKpi6QeR+AhWrgFMc
         9W0C1pPOzpdCJWl8WL1/Ch5Ap1UDAqYslUYDkLH05Mzy659HmWh+45wUux5bMR2AzHcS
         J+0IRc3lgw3eVQXYsPZhH6UKsnRx+K3TeIIiIGobYPuyOA00G4r88U4kQUXxhqAwIG/Z
         nJj18v5WBqfC4eUUjWK5gZZpaYlCAI1z1qL76gd2mMS8pGW7oOCojV8oeKPME4+bK2lO
         uID35D16eb9SmCYIRNItc8UHLWDh9ijOxIkejHs8Ed5Z4t2TtwhqspoRNjWly/4Mlcyz
         mDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296747; x=1780901547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iyou3X5eHXmwONgdpxt9PcO5bf2Dompms35djagGuVM=;
        b=GAf6Lorqttwa6ghdb15UM5aeEIU3oxzfIFmFtX7oy13CBV2vumG7KhuKr57feZ9SQB
         NTJxSC/CGl8IpNB3QcYASOBQsJCUMikFLfCAh8lkJNHKkbPE6XhSoLsGrRY7GGlN+dAM
         IF/02S1axbIRW291rx8z+YpfyZtH98MNkBpA3eFnKgSEWCxg+gZk40hZD3N6tWtyXXGR
         gc9Qjfm8bq0qnfT2p3Jxr6UfF/qd7gqc6wvm7RDKZhpcD4308GJWW3b48aUjrV+0ITuX
         2TgDOQrwa8gAaIFhajoelFH9YYsbGUe2GLKHEivzms8OYvU60vY1ccgqq5DkxcO7X3Rz
         bBmA==
X-Forwarded-Encrypted: i=1; AFNElJ+ci6FjPCTD+1Z58rp4j/OiO1BesOhJEVqMxskI7wr18qtbpyjZ1wHQLbXM1oZYHSkNTFJqCaaAaYz5rcm2@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6EpSDc2CFRz+VnVCRui6x9vJPklaPQ2dlhPDCdeeLJjeUlzG
	bhritLPM5xBQz0i11DRaNbxBaWShzHsI5RTehFupvr9yQqDPpXHwDl303+dFntcDguO+QIeXoAH
	guA9lNSX8ogjhp8dsx5pYbSOHNJQgBbByggvfvREaVZ7xK7Le7SjtoACg1s5tcx3SFHQ=
X-Gm-Gg: Acq92OFbTA1UMdjVQl5bTqPNH7yB/YhEpGC3iFUBTJqnO3rlamqMMBYy6CAzetix+7f
	Y2hvmTGXMXBrGim+/dvjtOR8QGKSWafScKgO5xgoL6YUx4x3EkUsqB7hFL6oSBMEb9jdGkmIbT8
	aAFHBkolupMF8rSN/j1Za8qxhGN1fTCPpUFqaXkcCqrxMlT6pNa8s1peaXykp4dls4WzHNvVefF
	iS3XHtbdquNFddnxMs3FaY4zOheGbBLo2SWI5qwKFqVwOTqh1XwrVPxtk7WMTV0eg5dWgFpCC0C
	/v21GtXtW2zsZplLilYTk9y/Q+J9ok3CxP8NZ6Jk/7AxN9xMzGbHeigxJKa1L086HAZyfJNSved
	MAvs2v04seZl2teKLweJTBlEaMW09HPH3KvreokyPvr63tMQHUdG70STZ
X-Received: by 2002:a05:6a00:71c9:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8422f28a598mr6117537b3a.17.1780296746719;
        Sun, 31 May 2026 23:52:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:71c9:b0:842:2f28:4e36 with SMTP id d2e1a72fcca58-8422f28a598mr6117517b3a.17.1780296746151;
        Sun, 31 May 2026 23:52:26 -0700 (PDT)
Received: from [10.217.216.18] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423bdd217csm4400839b3a.49.2026.05.31.23.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:52:25 -0700 (PDT)
Message-ID: <ba42e3ce-6f1f-4c14-bace-c4b5669adf47@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:22:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
 <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
 <ahxu1rm14pbwQFXK@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
In-Reply-To: <ahxu1rm14pbwQFXK@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1d2c2b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yX8Kf8TJ2c6MFKM0v7gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: AarxqMWVmZThdI9Oqpf-QP8-6ynqQZvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NyBTYWx0ZWRfXxq91elFVjHYH
 LA5YbHq8+TSnpuxr5npsFkhZCs3GAX9dDyaK4J/wXjQWbetQhfZxPinfDMg3pxWNySQzwAIXI8g
 oqHaWA64mb2KeYNUgxhrOlR9uWHN1ujvtPVF0dU4FICkZLf1DdNef9kPEos+OHuyVbbPmR63j4b
 2cxjhVfOmr3bYExhyJjozn4L4kpI/yUqm0WtBmR75cxPx2HFW6bcWIxW3AY/b/oWPVDDnQ/Vz5+
 2BxZgiZOxSsiZalEAc3hmKuEGyWQlXInS1aZJjZvaY9KPHAvxhXGUKNYE56N1xx+XXJGjOmWVJv
 CVQLT2nhC8X1YGwIJ/ggugazK3CPoNTpZAc0Ya2i+cGuu0W5qHkXcwlx9f37+sEeGp55QmzS2Ru
 c4lCnJDXQa/2G1to3sVw4UohDKjYahL1lx5VWheGuD2FxlpfNdlLa1H++EHXdObUeqR1w//aaDr
 DZ0nXZXeCGJ3IjOIvfQ==
X-Proofpoint-ORIG-GUID: AarxqMWVmZThdI9Oqpf-QP8-6ynqQZvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110512-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1380761A87F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/31/2026 10:54 PM, Abhinaba Rakshit wrote:
> On Fri, May 29, 2026 at 01:40:45PM +0530, Ram Prakash Gupta wrote:
>> Set ice clk rate from sdhci msm platform driver, needed for
>> target which are having legacy ice support, and need sdhci msm
>> platform driver to set rate.
>>
>> Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index b4131b12df56..c6a073718aa4 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -286,6 +286,7 @@ struct sdhci_msm_host {
>>  	/* core, iface, cal and sleep clocks */
>>  	struct clk_bulk_data bulk_clks[4];
>>  #ifdef CONFIG_MMC_CRYPTO
>> +	struct clk *ice_clk;	/* ICE clock */
>>  	struct qcom_ice *ice;
>>  #endif
>>  	unsigned long clk_rate;
>> @@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>  			return ret;
>>  	}
>>  
>> +#ifdef CONFIG_MMC_CRYPTO
>> +	/* Setup ICE clock */
>> +	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
>> +	if (!IS_ERR(msm_host->ice_clk)) {
>> +		/* Vote for max. clk rate for max. performance */
>> +		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
>> +		if (ret)
>> +			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
> 
> If we keep dev_err(), the failure path should probably go to bus_clk_disable.
> However, since boosting the core clock to max is kept optional,
> I think dev_warn() is more appropriate here and avoids making this a fatal error.
> 
> Abhinaba Rakshit 

Here its only setting rate of clk, so no clean up is needed, hence logging is 
sufficient here, but I agree dev_warn should suffice instead of dev_err. I will
update this to dev_warn.

Thanks,
Ram


