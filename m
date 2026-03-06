Return-Path: <linux-arm-msm+bounces-95816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FX/IqnbqmkZXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:50:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84B2221C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 14:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE2D53124DD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 13:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F0B21D3F3;
	Fri,  6 Mar 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8Tao04s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJm+xU1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C4730EF92
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804506; cv=none; b=QDoGgQHYfgPlR1oKeKjWaVD9tSSzRaKlVqUuBfUGVRMpK5gV3KY0V4FvLtZZp5mRs4jxRjC2SDEJoCo+etngGfjtLSGDp7XrpDFex44s4P5oayhKz488U44JWcyTmcQVS9MSK7Xmt7V7Dhll+UYzgv1/l5gQ5M7lkomk+boK4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804506; c=relaxed/simple;
	bh=GggzNaiW7iM2Ao7ECDXQbp/Mpe9x/2gcb82l1DPPWL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkASRST54XjqQcoNGrmQpp00ViP5l+31H2k4pN8jgCCuXchtEGWoeE7/yMGzwo8HY6W3sZ+k1ciz4zi33AS9h6Dd/6iTUnJy6jAAPNEd90FLu/DdRlMxyEOCudRn9Lv9PwNwsY9tN06UYNqiqu7C8J88xRzLxUefHmsopAaCJ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8Tao04s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJm+xU1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BajfY3716436
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 13:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUkyRAUAgGTHMW7VwQaFnB6wTWyKA5z+MqCAPBAVXAI=; b=e8Tao04su1n6AGJJ
	NDav88NoTdOhmxMPqNLoekfjLJWZ5NY2saSItVKl71X7CA+m7i0tAHYtga3ioeZe
	mHFHDZ0Xmev9sbTItR0G4Mw2bQxT7lapFg13afEHRtdthk3RxUzUgQnBXrA6+ltN
	TQJJBQaT6BQCsU6pGnTJzzIfTjS/k+31w2xbsVRvrybfzt3zfN8nNh84kpoSpAux
	4AAOikojn6gRmUXk8tO1LeivnsYldkzpRlC0NbtNQXdv4TWk+V5zkoVrdD9bu9wH
	4Fs0AyGIxvlGCWuGFLkdeog+YDHqjWuecQQJck9h9kvKs70zK4MZOHLYTf+TVwHe
	aDD1SQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98grjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 13:41:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73935acff2so826086a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772804503; x=1773409303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUkyRAUAgGTHMW7VwQaFnB6wTWyKA5z+MqCAPBAVXAI=;
        b=aJm+xU1mPaOqflosvLm5BIZkPL/x5GQqD97vtz/X2qJhI/CrzGQSF+7i1qqxRjV3F0
         ECrBC+PPEZs1bmNybSzjoQEsRuxOC6vAaglKFcbIpNGAVZu9xpU5CAxXvdevA/w27caJ
         LdUVCoBzI2OHVaK/B6h0EgnYGEOxMzOps7lnVypIt3QrgFUIwjb07tCGrqAnSWs7XYzu
         LVbORetBKpREAztumvXWDxtaQ1ldm2vqjGBhbL47WDM2ZV+qJgSgbZQ9FqMHd4L4fBoD
         Rw6kAaiohwxS+yohLT5PFlcGCUUJQ0QacV3XfU6Zsn/sa88pverFfiE41EIyRpBASxrr
         TnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804503; x=1773409303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUkyRAUAgGTHMW7VwQaFnB6wTWyKA5z+MqCAPBAVXAI=;
        b=qrZXda66B9jNvQfWTba+sy1xeNXEdzqOKPPDhBQ8lQunFSH0ZyIfWqB1B91K5vT3bu
         DlNoBw2KBcZD7ehkoAAvSeTZAyZdPGYh9keVX6EwSEURzE2Gq/GC1atYipu25QbvLzFM
         1VA7knZSWoAQ7Mq8pmlIDE1A+Ss6iGAnBaU5JXNrbfpoGm58JW5d/4zywCallXcKiyQV
         zWBeqc9NdY7qa3qyV51UbZBhdDhPTrrZIl1ukX3sdXcBy4eF6uyyK2iW4HuTVm+fj61f
         OuOgvPi4aITX8IiZTw7qcDi3e6eb6PqT5wuZRi+Xk37+piusExsZfWfeVtdd+OTRAqnf
         VrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM2h1gLurmEfFXnkaUkoEuCEhHLrfXAIuVTiWCPVMpsazbQVAJQud2JBqVSlt024zSFp4hgeMQqZrJJ9pm@vger.kernel.org
X-Gm-Message-State: AOJu0YxGpWkAf+d4SFWxfQz3hW4M3Zy4LCaOdFcBEUQm3IdxKK8K3eef
	FFUsUQOW3w5SDm99aui9kCUxq9CzVvNHQJJMby2ImiXHO8aFK706WJD4mpNghH4pNPjsmFlJGKK
	XCPJw5fk3OTJ6HEVFmJCXN5yuqslAf+bqPtnJCI7htbOLRyfg6Y+cpaUuZwXEPfxIp7LokX2UQi
	4LeP0=
X-Gm-Gg: ATEYQzw4oq/v7eIVYVMeRF0nV9DH7gWmQI6EfMVq3GeR/yjRLo9/uwy/7e/olWc8Suh
	9ebEImtMqDESBNaxDgVP1Ukz5HJvmOJPBj+K5CwFRDW1NA7pQz7ptVe7BUTwCSeaQ8iOlHL5dnd
	t1i19Nw7HDGQC3n86cbFJ6mGKHkXcvA20wBzLjQCk652V38RUpVeEHsjoeKE/vfa6Ws0mnFIc/o
	pr2M6cKhxGHGpoFaqxFLvFOL6h5nf5g9Q5zlju7b4bUYnACS+1xt/uqcNsYH6It7JNHCvGiYphA
	XCN2pMX/9j7liZA2fv3k5xkNMscqszADTM0HkQqJL8osV7A78GZ0SeWk+4UFjvf3yOqPT4uXBN4
	n1gNmyU1U03FUUV3Bi9s+kTTKPjgQ6OES/qnsqSZbFZlzNKrm1EgfR1bNksqRxnFBwq4Etmtiuf
	Z+CdkpkY5GlQU=
X-Received: by 2002:a05:6a00:1f10:b0:81f:ac78:ed22 with SMTP id d2e1a72fcca58-829a2f4a0e5mr1988562b3a.37.1772804502729;
        Fri, 06 Mar 2026 05:41:42 -0800 (PST)
X-Received: by 2002:a05:6a00:1f10:b0:81f:ac78:ed22 with SMTP id d2e1a72fcca58-829a2f4a0e5mr1988534b3a.37.1772804502156;
        Fri, 06 Mar 2026 05:41:42 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3ccfsm1983502b3a.59.2026.03.06.05.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 05:41:41 -0800 (PST)
Message-ID: <64e7d659-12ee-443b-a45c-ca985951dec8@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 21:41:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] scsi: ufs: ufs-qcom: Implement vops
 tx_eqtr_notify()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-9-can.guo@oss.qualcomm.com>
 <fpcbidjthsvsxszyqhd6qwydjilquq76pkexjcqiis5wzdplzx@6ap7gopmudqu>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <fpcbidjthsvsxszyqhd6qwydjilquq76pkexjcqiis5wzdplzx@6ap7gopmudqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IgvKvFyLFsOInuAYllUbjvkB2Xv4exi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzMSBTYWx0ZWRfX1XRz9P4GiaVR
 2VAoGXS3TjwOQ1t75l4aUJDVfl5e0hwGNkLFgC446JoUFSX9Xp3YnftKD+0ZwGyio1K9xvvHrbw
 nL8iD8syfmaLB6iqptjCkDHTiEwTLgEtoImwGyJSDoz9EurSqixSQ7cq5zNncDra5M6bQJZkGqF
 aivwBE6NnlY82QqhEdQ1nrXqQCr8CAEpkkTIc4mgOBtM8v/RpjSZic5lnFDrh6dEOFJZOi4fwfo
 6h0x/rJ43jWUkmuQoIK6tEfz+rfaGV8by9Surf8YZ+EMqyGVB9W0jDdkK9OJPbVPnFe9QKe2GYX
 vmU2wlftpM2nJSPuGgpCsNWr436qTrE7KjzgOc1xyvCnO4A7Kg+cxu3SpWDzKfAo1CvCxGNGt9y
 /R34mHTuo61X02J1DUMGgnKuXWJ4BzPv3SO5U2WU/W0bZFeHDgtlpXyoznKgc0Wi9h93nrJxeSd
 GT1w6qpFiiR9iOFMS5A==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69aad998 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LtwGVnD4aPPzF9yLLxgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: IgvKvFyLFsOInuAYllUbjvkB2Xv4exi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060131
X-Rspamd-Queue-Id: EF84B2221C4
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95816-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 11:20 PM, Manivannan Sadhasivam wrote:
> On Wed, Mar 04, 2026 at 05:53:10AM -0800, Can Guo wrote:
>> On some platforms, HW does not support triggering TX EQTR from the most
>> reliable High-Speed (HS) Gear (HS Gear1), but only allows to trigger TX
>> EQTR for the target HS Gear from the same HS Gear. To work around the HW
>> limitation, implement vops tx_eqtr_notify() to change Power Mode to the
>> target TX EQTR HS Gear prior to TX EQTR procedure and change Power Mode
>> back to HS Gear1 (the most reliable gear) post TX EQTR procedure.
>>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 63 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 3a9279066192..1e074058f23d 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -2512,6 +2512,68 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
>>   	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
>>   }
>>   
>> +static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
>> +				      struct ufs_pa_layer_attr *pwr_mode,
>> +				      enum ufshcd_pmc_policy pmc_policy)
>> +{
>> +	int ret;
>> +
>> +	ret = ufs_qcom_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Power change notify (PRE_CHANGE) failed: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ufshcd_change_power_mode(hba, pwr_mode, pmc_policy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ufs_qcom_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
>> +
>> +	return ret;
> return 0;
This function should not exist, I will remove this function in next 
version.
>
>> +}
>> +
>> +static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
>> +				   enum ufs_notify_change_status status,
>> +				   struct ufs_pa_layer_attr *pwr_mode)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct ufs_pa_layer_attr pwr_mode_hs_g1 = {
>> +		.gear_rx = UFS_HS_G1,
>> +		.gear_tx = UFS_HS_G1,
>> +		.lane_rx = pwr_mode->lane_rx,
>> +		.lane_tx = pwr_mode->lane_tx,
>> +		.pwr_rx = FAST_MODE,
>> +		.pwr_tx = FAST_MODE,
>> +		.hs_rate = pwr_mode->hs_rate,
>> +	};
>> +	u32 gear = pwr_mode->gear_tx;
>> +	u32 rate = pwr_mode->hs_rate;
>> +	int ret;
>> +
>> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
>> +		return 0;
>> +
>> +	if (status == PRE_CHANGE) {
>> +		/* PMC to target HS Gear. */
>> +		ret = ufs_qcom_change_power_mode(hba, pwr_mode,
>> +						 UFSHCD_PMC_POLICY_DONT_FORCE);
>> +		if (ret)
>> +			dev_err(hba->dev, "%s: Failed to change power mode to target HS-G%u, Rate-%s: %d\n",
> Same comment as other patch. Goes over 100 column.
Will fix in next version.
>
>> +				__func__, gear, UFS_HS_RATE_STRING(rate), ret);
> Can we please not specify the function name in error log?
There are too many Power Mode changes in Qualcomm's TX EQTR procedure, I 
want to print
some hints to help pinpoint issues easier...

Thanks,
Can Guo.
>
> - Mani
>


