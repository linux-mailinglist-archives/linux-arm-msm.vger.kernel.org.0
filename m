Return-Path: <linux-arm-msm+bounces-100286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IZ4LxdxxmmkJwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:59:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3761D343E39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62F713029A66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CBE38F93C;
	Fri, 27 Mar 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaxR9xt/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsVSPLFU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B44D388378
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774612743; cv=none; b=ZOnGnobH6IZUI1LIP+NWhvcTXX1ON1rAIBddgmPT1ucNuVmTH6puZKwsu18p58biwDlym7Y7n5ED/9a9uyPQgncajAxLxolJybnLz0cqSELPSnabr6mavnGZlQ8BddDe2zRTQUtdPrY5ef+1MfRXKoiGVSvRQkq8kF5T3z9S6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774612743; c=relaxed/simple;
	bh=w3JedPAx28O2flGzVavIS/jETfiHXpBRVc+ZV/SS7Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1kimgjncX2x0p6tS5RaM4pihsX/nCF4OIkgQdugNEexR/rZeUA6vQilORbS2HR3EMQ36kGKEzPuqwbICtP1Veti9gEjbwUs6gO0ZXNh1roOC0mdiVGJryCuc1Tat1qAhzqkMQnzKFtteZpgWnAFOlmGEWlDt8xa94/ObFOyaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaxR9xt/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsVSPLFU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w47E1860270
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cujlSLknogHUz53/M5ngb1ybc0eI1qWSmC0JNuYAUCE=; b=KaxR9xt/CuTb2jx1
	2DoXe1G7+eP7sJ7dZ/t62yx1xrGDCtVHntRwSZWpV5P+Iggy1sAMSsamBuQVLVix
	RrmvDVZWCKUWm+/40kY5vyDs985rj4wVIKMWwo80tdb2OBOJc5Y/XVlmLWCZgXrb
	YNmP80HR3DqiKLzw0HbcafF9vhxZ1rjNKA6kiiJ+ommlKKSVh1HGpdBgdGQv8ANa
	OnQrzaEbniNUAIYAYJCjXWgvtCMdwwMQj3i7exYey9zWc1eToCWb6Zy9ymNLjJMu
	hrha5yzcSkAeKvLaMcLG696kVoVC9s+cJoBsHnqD9X6HC2el5pMU1h2CQozcBztg
	9xiqrg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxv2wek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:58:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7381a95fffso1310617a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774612739; x=1775217539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cujlSLknogHUz53/M5ngb1ybc0eI1qWSmC0JNuYAUCE=;
        b=VsVSPLFUFypUOO9Tye8CQnI5mI2YeSrR5VvrFrDOTbGb0OnzMD3uQmUbQ47skxPrfh
         71yuYawMQPOKa/QzTNflC2JPCgqiXajtVypxQuJPQ4/9dPSxKHw/peuoqPQoIAuSGElA
         nuTrYKBZcox48JBAzrsMMju4xAOGzWnjTAGo04Km47Thz5Bs/eADmI3AB67KcP+QmapM
         oB1OftivOHneFrnsH6Gr92N0HKW9ChJhs3kwD7EvqDFY4MO+fnYV4C0C76bNG4PgcCVw
         mPS7kNBsbskSyjAuJ/qoz3MgdsJD/NeI+KvmIfFiOIJSXyoBctHfBhvxVF43Nw1FlDnB
         VA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612739; x=1775217539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cujlSLknogHUz53/M5ngb1ybc0eI1qWSmC0JNuYAUCE=;
        b=ZB4eE9v9BW4Y0YHm3ujwETjvWsSN47zD8BfQACrJweN1DUALKWbst5wtouzr0HAlkc
         siwohW0f5WiUI0fJvweVfRRQoIF7wmzkWWlSMM3LPNWOzb8//IS82cV/R9h9KrnqwX7F
         wtIdZrpHT5UwWTYO3E0hKz8HnvMu7Ng37qEfKSMeYbsJrdj9LmJGgUoisbi8wP3Qirae
         BUWqKlxJvGmrDqmYqz9ISTZOhLIX1gcTM1+P5Z4Gw89+yPjLvjySE+TaUzJy22+c9uRk
         olUmbbkWCXC7sWjSyTLsSdptO40+7I27BTXKNxNylvLvWiFb3FLX7TpghWEBX9/Lq0x4
         mfIQ==
X-Gm-Message-State: AOJu0YzZt7b3YY2P/gGTT6527bzqzVrj0eBmqfXOsYCXTZPD0moOje8+
	jhVppk+VeGVm2can1kdIG/AHTb/D2OOSx8vIw1n1evLTDdjEFW+waICUNwTwXUZI4BxHZocdG9/
	IlD+10lqUqsUIJEog+fBz4m32W9oy4NiU7E/DFdbUH/++E/XfEkyDdkbR1iKNckQ6Wxtb
X-Gm-Gg: ATEYQzzz4QeuU5cq7yXbO2Vc4KLCMx71FU0hxBMhXeFG12nD1Noc9KguQEgcmBflvci
	6CYUIa+oU+dOSotrVMg7Pr9bcaE0cMQm9guaLsMhGJ1bqNDLvJksZO4/q/jMeII79YckHp4m1dI
	KNcrevNRkqGW+GBIY+toChtxA0zQrVqpy82OXQtD1zvy0yWLzMD+33YTta5FOZOWKxlwNCmkhKQ
	bQu4IjqZq1TctAEFtS0BXnru3tqQCcVPq2yLkwAkJSosv2g2vtK8cV2ERGGWbsNEI65H/uxrMiz
	i3Ss64NbMXYTubJhwsOsBfP5PtL1rHCSlFssuEHEVe2eJheM97vksNO/yiTg+6TKw8UFV9CKVV5
	ZRJbRb3f6KLOI86dsstSo18bWda97vrW5/7YSNOllqz/d96VKPzg=
X-Received: by 2002:a05:6a21:3086:b0:366:14ac:e201 with SMTP id adf61e73a8af0-39c87c4ae56mr2521322637.63.1774612739083;
        Fri, 27 Mar 2026 04:58:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:3086:b0:366:14ac:e201 with SMTP id adf61e73a8af0-39c87c4ae56mr2521303637.63.1774612738614;
        Fri, 27 Mar 2026 04:58:58 -0700 (PDT)
Received: from [10.92.178.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739b5ec9sm4480178a12.32.2026.03.27.04.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:58:58 -0700 (PDT)
Message-ID: <39e72094-5f9c-462e-a0ee-f9b51662b9a8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 17:28:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] ufs: core: Configure only active lanes during link
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
References: <20260327090346.656324-1-palash.kambar@oss.qualcomm.com>
 <20260327090346.656324-2-palash.kambar@oss.qualcomm.com>
 <f0685a6c-25f2-293a-cd94-754326abcedd@rock-chips.com>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <f0685a6c-25f2-293a-cd94-754326abcedd@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=A99h/qWG c=1 sm=1 tr=0 ts=69c67103 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hbg6syq5vlUVZb5qw7sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: iL2eTOCyjBXNpnFTDdDRMApYwg9lcUN9
X-Proofpoint-GUID: iL2eTOCyjBXNpnFTDdDRMApYwg9lcUN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MSBTYWx0ZWRfX8epAolaYK5qc
 mT4uBr7bYbw0FFLCs78RhAOF5/2EXP9GnbNTileyJ4nPwEPfV5J0dlVvjkHUWaTvPAaRSb5bdzp
 bAb6i5TRMgGb2t+zEqngqCsyk3fNww0cystEPq5tX72LbiqhLh85gIhoRJzf/S4JlXylE327QrQ
 o9hlr12MsYbL9t6rx/A9K06OElCCyBRaxmNaw3Or1/EedhG5yGPNPwNHQnpJaCLqhAjqzHd6cqw
 gZ+qr6Iq9018x4HYUsvP5flTchsnaoeMNYWqyiDydy1YIH644dPNFVleAaaIP1WlWrr/COl3mb2
 +KF05N8Z1hMfTXAcX8S9l0wQXDQIWxCFDzG6zw7jHOXURM3utddWopiK3MO7T8EfoT5BtEvTp7j
 QOWr1+vWP4px1U0YTZQ0eItdguqUOIix9EsS2Ns/aXTwHAHInGuD8cBgg1t9QGHa/f25ykpvl8D
 gT1WcCmvI96YYqH6VYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100286-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3761D343E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/27/2026 3:01 PM, Shawn Lin wrote:
> Hi Palash
> 
> 在 2026/03/27 星期五 17:03, palash.kambar@oss.qualcomm.com 写道:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> The number of connected lanes detected during UFS link startup can be
>> fewer than the lanes specified in the device tree. The current driver
>> logic attempts to configure all lanes defined in the device tree,
>> regardless of their actual availability. This mismatch may cause
>> failures during power mode changes.
>>
>> Hence, add check to identify only the lanes that were successfully
>> discovered during link startup, to warn on power mode change errors
>> caused by mismatched lane counts.
> 
> The logic of your patch is clear, but I believe there is a slight
> inconsistency between the commit message and the current code
> implementation. The patch currently returns -ENOLINK immediately when a
> lane mismatch is detected. This causes the Link Startup process to
> terminate instantly, preventing the UFS device from completing
> initialization. Consequently, ufshcd_change_power_mode() will never be
> executed, there is nothing about warning on power mode change errors.
> 
> How about "to prevents potential failures in subsequent power mode
> changes by failing the initialization early"  or something similart?
> 

Sure Shawn, will update the commit text.

>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>   drivers/ufs/core/ufshcd.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 31950fc51a4c..cc291cae79f0 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>>   }
>>   EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>>   +static int ufshcd_validate_link_params(struct ufs_hba *hba)
>> +{
>> +    int ret = 0;
>> +    int val = 0;
>> +
>> +    ret = ufshcd_dme_get(hba,
>> +                 UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), &val);
>> +    if (ret)
>> +        goto out;
>> +
>> +    if (val != hba->lanes_per_direction) {
>> +        dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
>> +            hba->lanes_per_direction, val);
>> +        ret = -ENOLINK;
>> +        goto out;
>> +    }
>> +
>> +    val = 0;
>> +
> 
> ufshcd_dme_get() returns 0 on success, non-zero value on failure.
> Perhaps you could remove this "val = 0".
>

Hi Shawn, the "val" used here holds the value of attribute returned
I have used "ret" to hold the return from ufshcd_dme_get()

 
>> +    ret = ufshcd_dme_get(hba,
>> +                 UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), &val);
>> +    if (ret)
>> +        goto out;
>> +
>> +    if (val != hba->lanes_per_direction) {
>> +        dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
>> +            hba->lanes_per_direction, val);
>> +        ret = -ENOLINK;
>> +    }
>> +
>> +out:
>> +    return ret;
>> +}
>> +
>>   /**
>>    * ufshcd_link_startup - Initialize unipro link startup
>>    * @hba: per adapter instance
>> @@ -5108,6 +5142,11 @@ static int ufshcd_link_startup(struct ufs_hba *hba)
>>               goto out;
>>       }
>>   +    /* Check successfully detected lanes */
>> +    ret = ufshcd_validate_link_params(hba);
>> +    if (ret)
>> +        goto out;
>> +
>>       /* Include any host controller configuration via UIC commands */
>>       ret = ufshcd_vops_link_startup_notify(hba, POST_CHANGE);
>>       if (ret)


