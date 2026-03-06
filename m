Return-Path: <linux-arm-msm+bounces-95834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK2DC//gqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:13:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7258E222638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52B6031DED82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A24F3A7823;
	Fri,  6 Mar 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYg3ajWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ebZ4qqtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D3C3A6418
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805954; cv=none; b=Nx1Bq04MNZHwdL5DwLtneZ1WWeYFVMkkKpYtTCArYVN+5NAGPkhLnAYlUq2JZuAkxWvRjqnuLOFOgP5BzE7UZaEKaEtVEsbur/cH8okbOCQaFQlsFN1Mq0XCEQcjjkmTmpElT8tID7evqNUr/gIK2qawkM7pWc8W76qk1R1FFig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805954; c=relaxed/simple;
	bh=PoeET+qFa6pR0XKfw5tKjEtxRNaloT7k8RrQJIDBWjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IScoOL8mlZ/L8e/Wb9BvG0q9nd668q0CeBTweMQf3O38RLNSaTLClf3Cp/JmiyLwUOGqJVRuKdT33NMVTN6hUtslK+ZwadFGvA7hh5mnqwwiI0ExY1UGxGaFns71yNjMRq3DM1iAYnNXjtAugCS9GKr2LIasqvozCP6CmWXC+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYg3ajWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebZ4qqtM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbUxR3727680
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+VfUnExQBW7y3BidnhCqBz/4vBGXnsLYPZTfRBzDOc=; b=WYg3ajWxYC5Ou+vJ
	3t8tJd7Ts4aC24Xe//pdxy9F7B4kBIWetbNTPWll5QHD5jOgjO4OiLQKG8p7GH/8
	wz6Rjzs6x1zFcfAC7/YQBBMqqkG+ObKI2ik/hdpgtKo10hQ0W4+WzWfL85KRcfWI
	TuFa9Tv3HaWg0hsa7VODN22E8sYSuNsDBf7LILC7XrQssESF6einmdYB1XdYx6FI
	VrF8fHo8bpadiGDnquzI9WU9l+Dm6sM+wobyfZ72Jk0vlz4fUMpMQltcF94LHg6k
	IabH//dkv53UNmrZcjvhdwND4RDNUWJbsMD53EL9cDT9J5M3hgmdxruPT/WkF2ZW
	ss8DIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43244-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:05:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4f27033cso57870805ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805950; x=1773410750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+VfUnExQBW7y3BidnhCqBz/4vBGXnsLYPZTfRBzDOc=;
        b=ebZ4qqtMKC+YRNgbvli3ajUC5lx0n0uTkrUJi8NxXzVYza7vyZvJl5DOjoLo43RzVG
         NggUfHygWfd4An5QqN9kyhHD0i9uof7VvITH/20j0+VXR8CW18KqZ4uTQjQ3PT2ffEwi
         QJVJaaPcWbLlB53zGHdjyCOIzHJ68iVdtC/XgBafe2aE44SKHTYJzNz7V+n6jIjXAnar
         5B099Ci22pWeL0rmgzJO74n7SrRySqH537Vd1kW+LvUjbYe86W9MYvXAuTGn9DnmGD/3
         MHOKQTrRevqC68AhMpAo8KgSphocd0A6kfjcUwvNZhKfgE1ffRjbbSRgbEqEEQw6G4YC
         ioog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805950; x=1773410750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+VfUnExQBW7y3BidnhCqBz/4vBGXnsLYPZTfRBzDOc=;
        b=FmDApuHenNqdlaTPPm8oLrOZsk+CCBr8nLRqOZ29/bqm8MwIuZ7vyRi/Iai+86Gq6s
         BRAUoIFaga0OzQ8y3qB4PEuoVTUBnh77oR+XNPX6Ia6qnNZCVMAIT+AadaHhYjVsnxRS
         nMpNR2JLKpY0/21wwec2s/+fN4eOOPoEDWYaV9lr1O5rJwTT7gFqLaXHUFzu7EkBuCq0
         tR6Ay1hrYqsCHcjHZ/LP5JW3Y889EuEGPT+WsVTggvrE5ii/OwlXeF+g0xFTz+SkRc7K
         v00NwIqJVmlT19HHumgAgd2cMrCRz6Wb/PxMOtruVFYx9Cf2YybbGjU0ZfsKZeZO7mKD
         vkVw==
X-Forwarded-Encrypted: i=1; AJvYcCWJQVAeZpjblmMoxegnZihrtpXz3cA8JdQDyKpOcPKArhFWm0egToACvs/rIeG8pQm1uhEstyXYtorJVvxq@vger.kernel.org
X-Gm-Message-State: AOJu0YzM40jAd57zm+iF35f95TF5kR3hI2VqTx2EPyvMQDvQhax9E+26
	1hp1cx2GAR+2CB+6jm2HuipaSeCpIjfLFmSQL4j+WvBAy6LgEYGz7D/dHQYRGSa7IOMIgIAymva
	L1+dQWBmK1v4cLoHQM9VR5srT6Dqf2rbVMl/99iIag7X8TX9L50ooPat4ucPyH6fR+0Wu
X-Gm-Gg: ATEYQzyFWO5zpshQNBDqoIVV/Lf9Hi6yQ6bpKRzsR1zreTIgduvlpdmuHo93PMRpEED
	dxQX/cxOnWhzmho3p5jy0nWRy5bxLfUIcfaJkzTYeZNsbXFvooPLYQ6GTZQJD6boSCgIm2bR/6F
	CdojqHo4giclsw7WfneiggvbHGfolu36NN/P14B7qILMoGRi8N/Jisl1qjss1uwnGdSPDgzgfh1
	XwdGXyLdCaKBvNF78cLxMuK+X73rxDMxnqobug+NvIJyE3Y8Uhit4lbTYGEDoT1S08s4FzaGceU
	RJunsOKghJdT5uFyHmhEiPD6AdcJRm0loD7atBRPCvJL432BdOIuGVrP8D1cFGUOxGnhR5UNR/K
	jBXkYD7TkiXR78uWZzRfPSsdqfJfmfnRlkhiV0VfYUwKwAsxcPuQ07jYC3ALjuOp+zVYIl3rIet
	2XW55YYy/qkYo=
X-Received: by 2002:a17:902:cccf:b0:2ae:805d:e0b5 with SMTP id d9443c01a7336-2ae824bbaafmr22917495ad.56.1772805950076;
        Fri, 06 Mar 2026 06:05:50 -0800 (PST)
X-Received: by 2002:a17:902:cccf:b0:2ae:805d:e0b5 with SMTP id d9443c01a7336-2ae824bbaafmr22917145ad.56.1772805949445;
        Fri, 06 Mar 2026 06:05:49 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7864dsm22663795ad.49.2026.03.06.06.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:05:49 -0800 (PST)
Message-ID: <493da66e-3c3c-40af-8859-646c144acbdb@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 22:05:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] scsi: ufs: ufs-qcom: Implement vops
 apply_tx_eqtr_settings()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-11-can.guo@oss.qualcomm.com>
 <uqhyyyt5spxggiyhzcrnlcl2noomkfybw5kieki4lde6kdaryt@ozdoxegemqpn>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <uqhyyyt5spxggiyhzcrnlcl2noomkfybw5kieki4lde6kdaryt@ozdoxegemqpn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S2z9cWZN2kicRuRYyDG5k4IQQh3P4NHV
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aadf3f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cWpPSTlTcvdTqOXPF7sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNSBTYWx0ZWRfX5ebn0E71KVWM
 Klk4aTJ0tH4XWtvT2tJUqyw6Xsz0MgVKQWQ94ApQJvOMRzrzRjCSggv/Ogd5mqX3i/f2Y25w7aF
 PjBX/7TE4s4LfHS6DeDtc4bVpcwtziLzmCIMg6g8h6zfPWKpOsu8hycEGW051U/leUmq5rGwxAa
 UYOt3f53+0MP6Kv0DvGgGx5HDwrfHc68DHHHXmQ9vmuqOjIQ8yKmP+TOpmWpqGDsXZWcPzs9bZe
 tbz2iovVUDyoTL2arKlXq47WNE6I/Q4SbuqHFHu4SjDmTnrXAXnls5TS413Hjwsnad7ix3MTThl
 //vp6qnXE9TdfYQQoOrpN8P3UKvK0G2VJXbVj+Kbettzwg79GjcyGsm1vTyPedWRvSdot1Zg5OG
 TTnNU0ZDBBWyifx3jc+VFxb+1Xd6NCqaz+K34AAdzvQnbxXVHeEAnYU8feUYA3KAqH1SKyLdaez
 1YgfJbC1Ep5Ucwvb4Tg==
X-Proofpoint-GUID: S2z9cWZN2kicRuRYyDG5k4IQQh3P4NHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060135
X-Rspamd-Queue-Id: 7258E222638
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95834-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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



On 3/4/2026 11:41 PM, Manivannan Sadhasivam wrote:
> On Wed, Mar 04, 2026 at 05:53:12AM -0800, Can Guo wrote:
>> On some platforms, when Host Software triggers TX Equalization Training,
>> HW does not take TX EQTR settings programmed in PA_TxEQTRSetting, instead
>> HW takes TX EQTR settings from PA_TxEQG1Setting. Implement vops
>> apply_tx_eqtr_setting() to work around it by programming TX EQTR settings
>> to PA_TxEQG1Setting during TX EQTR procedure.
>>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 33 +++++++++++++++++++++++++++++++++
>>   drivers/ufs/host/ufs-qcom.h |  2 ++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index b8fa4670ddd6..89bea823a08b 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -2848,6 +2848,28 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
>>   	return ret;
>>   }
>>   
>> +static int ufs_qcom_apply_tx_eqtr_settings(struct ufs_hba *hba,
>> +					   struct ufs_pa_layer_attr *pwr_mode,
>> +					   struct tx_eqtr_iter *h_iter,
>> +					   struct tx_eqtr_iter *d_iter)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	u32 setting = 0;
>> +	int lane, ret;
>> +
>> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
>> +		return 0;
>> +
>> +	for (lane = 0; lane < h_iter->num_lanes; lane++) {
>> +		setting |= TX_HS_PRESHOOT_BITS(lane, h_iter->preshoot);
>> +		setting |= TX_HS_DEEMPHASIS_BITS(lane, h_iter->deemphasis);
>> +	}
>> +
>> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING), setting);
> nit: return ...
Sure Sir.

Thanks.
Can Guo.
>
> - Mani
>


