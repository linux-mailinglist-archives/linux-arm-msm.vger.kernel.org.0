Return-Path: <linux-arm-msm+bounces-95833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yA63IdjhqmkJYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:16:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653922271A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28F6231D0FB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA973A6EEC;
	Fri,  6 Mar 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KP1TZ6Ld";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LARKCkNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEDE3A1E92
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805873; cv=none; b=pgfuDYTe2Xy/jOb/tkxOpUeIfNWeuvTj9htAovaY2W8/iWRSufF989C7jUAWdlrzVSJ2NxkDN245xrChmmLiaM4rJZty8xOsfpLzTS1RZQbVSyvp7MlHGN+uV+oNIkKwDc6IelPIeLHFyWriqwansjqYNSnOsJUb/9si26f7eDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805873; c=relaxed/simple;
	bh=gzWRdhiiJk/A50wkWrD+sWFzRr6Iv58+3BeSPDw/dtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEk6dE1kUPQ89wGT8K1/Y9GfqxM3Pm1n1J1Tun0jw4yqolE415Y0d/VT9PAlFXQJOMtuRspp5fd184MKmW8/36sBgJa1LOEoD4lIBUJ1En4j2b4hML/Zv5zowPAbapaH6vx7S80ZHOMprQlEvW1UyJxpRyCU5JA1oFe6Tqj/rpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KP1TZ6Ld; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LARKCkNk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Batqm4186262
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pStvCmzej4+XrTdYZ9PsGbkCZ+yDayDX7pPj56xiM70=; b=KP1TZ6LdzYfX4dFZ
	ukVHWefA2LVRuBrxto/su72yxtT4jx+2g8w5PZOoq8WfKx6cVqTh5gUOU0ezyos5
	dY6iI+CuqfVowvW00wY/Q03jsWAG+sIyPPWcua44QCIthBZyW3EDF3x6TOGIVCxv
	bpUEg9jJOcOZFgWRqdL+sQwhV2ReslXt+FOeVljsgDAD6fc0USO/Yt9dO4bJwxId
	bsQEYFYLadXHebOfFxjPgEj+4MTlyMTVA2Jc1kGW89fVFZiW9eF87SI+5W+WT1uy
	YAULYY3yxRzJ9/qy2PwyttEonS8Us+eQY64k4NnK/MHH30vQv9B3xQQIiRqgDRb/
	NXqAkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk9krp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:04:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so8667589a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805869; x=1773410669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pStvCmzej4+XrTdYZ9PsGbkCZ+yDayDX7pPj56xiM70=;
        b=LARKCkNkAboSyQGvxlaGhLu0BP69sJT3gMmoh4U8vcG9NOnhYqzWW9q6ezMuSCTMcO
         OBd0ZjpwlDEX6IwApXF+O5cegZpWqV2jQ5RVmSDyFgVclqLc7URLVlngaixhivbUYYTi
         GVlydBWMOe7rYsyavWD/TqaNmOjLs0HrdHwifIzl/m0VOuaUMHuBCwsuEOS18fvtsuhh
         +Rfuhhz4juN6UGUXT3Rd3I9gFhpQ5ce8F5OlFovTB/o8mw0HhLaEAjHP7B5masGT8sFj
         V+uxJk+M5hbtxYJgyy7Lha3cSBx7q4zxtw39f0vShTOoQ3ObACsiGMd4S7do2nqj7Wfd
         mzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805869; x=1773410669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pStvCmzej4+XrTdYZ9PsGbkCZ+yDayDX7pPj56xiM70=;
        b=mS1QRDJWaq6zJ5Ws2xGx2flrQ0Oe3b/GOQ3WEn8rQs3ObjaF54GYf9g2Y2bJaeer9h
         bt6jDKWBg2MFNQnO6+DQwsGCvzXFJdN2ibZoLZ6RlYVaCWg1avs4swGwY1aQ024m7DdV
         UvRrSWtPPRCtFnH2n5ig/DRU2Jz90AXBAVLbmjL8dQJJxHjZHxGarL3hzaiSHJoZdGaE
         pwg5SFyyXHMIRxepJBj5ZurVA+tSh+ED6VHw/jusCcgMecBF9ctCVaOFp4fIS2K0JCcL
         0oBj4/iE+3bIOilMcM/r4KLxsufy26iShz0Il8icLLojVdCEzAwXYy52KLwCjNFo7mOg
         o2mg==
X-Forwarded-Encrypted: i=1; AJvYcCVlZqb/KxXggYbTHgGNbd/YVpNeiSoL/7D/SYFGDVeb+0WH9cuQsA0b1T0zlmrpcnMGJxGrsyqklsVfChzu@vger.kernel.org
X-Gm-Message-State: AOJu0YykMPXVqDBvDc5qv2/qEwZVnrhuoTli+XWtaz9HpURup/II5ZDT
	lJ8TDotElF4CKStNL5UyRsUIp6DnRJVvX+8N/f2SWPUpuQG4K2N5opeiqUAaDxNxoeOfzqet2/0
	vrDJlwV7YmXj2ix5J1oAen4hfnq8JZbQoKMD5euH/ZzWVibl/WyHzAWqkzfj3tpFEt8gfCutzfA
	HSoGg=
X-Gm-Gg: ATEYQzw3muxR4Zd2zQ4xAb/CSs/M26XtPWwWS/f+lmZFt0u/pKqpac5NaLlQjo1vFKn
	n9iVx2XKx+wK6Jetnl4DYMZs4Y82vZRk+B4BbCoijOUK2FlBsWYlnOHyoAaG9A0S9xs4oHKKp7W
	rxXypUJpLvkotF86n3Cp83RwSiFD5xilM0eDf2MFBqA9tvreXqYE/WTW94tO6sAfNfFqBUK8Xjm
	dNQ5bQarOIWaBlVAMKPzn+vP+bPbt6ut5pZMBdnp1xac3vHJTzKQYZdkGK9l+ucD3biwDR5w2Os
	pJO5jEgg3AfMvEGXCXXjk+wCW0L2lpn4KXU3SxnEtQAEj0Ab85jQ8cNr+54ueR6PcyTTcRikPNi
	WVqO1zAwyFk4iSOKBtttQaKu09g0L+dXt1N26sAkQa2jd7ub9vToavTumqFCWUOsF3gEtefFwAd
	VzlN1ElEIfSY0=
X-Received: by 2002:a17:90b:28d0:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-359be314eb6mr2082039a91.23.1772805868933;
        Fri, 06 Mar 2026 06:04:28 -0800 (PST)
X-Received: by 2002:a17:90b:28d0:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-359be314eb6mr2081988a91.23.1772805868207;
        Fri, 06 Mar 2026 06:04:28 -0800 (PST)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a709csm2257616a12.1.2026.03.06.06.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:04:27 -0800 (PST)
Message-ID: <ebf2ad3c-e75f-46d5-ae36-ad81f437ccc1@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 22:04:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] scsi: ufs: ufs-qcom: Implement vops get_rx_fom()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-10-can.guo@oss.qualcomm.com>
 <ffijub727efmyhatukpqlridfdknwzbsc2dedeohx3snosxqzs@os7ddqrmziqd>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <ffijub727efmyhatukpqlridfdknwzbsc2dedeohx3snosxqzs@os7ddqrmziqd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNSBTYWx0ZWRfX2g9X2aiSmk9V
 1K7q/gLzR8VvlrnVimExcdaz0/LLJzAfblCRnZtOEFx68/cx8tjwvh3lKlmn8r1rtTFlOY6heve
 jpTDWj1kX5uLjgj4ZUR85vZmqkg6iHQwylPsEhzkpR928cmH05VOZLBo0/spq6+UQ16IwLB2Cb9
 jvfnzWGpaO3AS16BGUXRrBo+z402IwIEI52YXwgiNXnqRZmyx3CRMmQ66tFdXbSrYypaPNxTJjU
 klY/aFv+VVTmDObHD5OP54BCwRGPLSDsu59eSBtnvBrCmS7H3TkbSakkt6PjYAhu9IIImUw2GFn
 /Sd0e4eZnUoMYSJzHDyZgkTpdmKpe+z2fCwABFstH+3PJdZvrDMpjLnRkwDJ1x7HCBcefG2BjWS
 Bn6kO/AWhUgDb1Xxt5qbrLV9PFfkDYYriOlhc0Wb0M3GQ+pEtx5ylEgOcDha0+tUJnOtuV9S+gN
 23aTvQk8xFEVwTIUrNQ==
X-Proofpoint-ORIG-GUID: nYCGOOHKoPSsz5RE7g2M9gbrydzWH12P
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aadeee cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0uF6H6XtDH4SaxNOm18A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nYCGOOHKoPSsz5RE7g2M9gbrydzWH12P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060135
X-Rspamd-Queue-Id: 2653922271A
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95833-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 11:39 PM, Manivannan Sadhasivam wrote:
> On Wed, Mar 04, 2026 at 05:53:11AM -0800, Can Guo wrote:
>> On some platforms, host's M-PHY RX_FOM Attribute always reads 0, meaning
>> SW cannot rely on Figure of Merit (FOM) to identify the optimal TX
>> Equalization settings for device's TX Lanes. Implement the vops
>> ufs_qcom_get_rx_fom() such that SW can utilize the UFS Eye Opening Monitor
>> (EOM) to evaluate the TX Equalization settings for device's TX Lanes.
>>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   drivers/ufs/core/ufs-txeq.c |   6 +-
>>   drivers/ufs/host/ufs-qcom.c | 315 ++++++++++++++++++++++++++++++++++++
>>   drivers/ufs/host/ufs-qcom.h |  42 +++++
>>   include/ufs/ufshcd.h        |   3 +
>>   include/ufs/unipro.h        |  16 ++
>>   5 files changed, 379 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
>> index 2cd2d5156607..02c1a8479910 100644
>> --- a/drivers/ufs/core/ufs-txeq.c
>> +++ b/drivers/ufs/core/ufs-txeq.c
>> @@ -227,9 +227,8 @@ ufshcd_compose_tx_eq_setting(struct ufshcd_tx_eq_settings *settings,
>>    *
>>    * Returns 0 on success, negative error code otherwise
>>    */
>> -static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
>> -				       struct ufshcd_tx_eq_params *params,
>> -				       u32 gear)
>> +int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
>> +				struct ufshcd_tx_eq_params *params, u32 gear)
>>   {
>>   	u32 setting;
>>   	int ret;
>> @@ -259,6 +258,7 @@ static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
>>   
>>   	return ret;
>>   }
>> +EXPORT_SYMBOL_GPL(ufshcd_apply_tx_eq_settings);
>>   
>>   /**
>>    * ufshcd_evaluate_fom - Update TX EQ params based on FOM results
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 1e074058f23d..b8fa4670ddd6 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -2534,6 +2534,320 @@ static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
>>   	return ret;
>>   }
>>   
>> +static int ufs_qcom_host_eom_config(struct ufs_hba *hba, int lane, int v_step,
>> +				    int t_step, enum ufs_eom_eye_pos eye_pos,
>> +				    u32 target_test_count)
>> +{
>> +	u32 volt_step, timing_step;
>> +	int ret;
>> +
>> +	if (v_step > 127 || v_step < -127) {
>> +		dev_err(hba->dev, "Invalid EOM Voltage Step: %d\n", v_step);
>> +		return -EINVAL;
> -ERANGE
Done.
>
>> +	}
>> +
>> +	if (t_step > 63 || t_step < -63) {
>> +		dev_err(hba->dev, "Invalid EOM Timing Step: %d\n", t_step);
>> +		return -EINVAL;
> -ERANGE
Done.
>
>> +	}
>> +
>> +	if (v_step < 0)
>> +		volt_step = BIT(6) | (u32)(-v_step);
> What does BIT(6) correspond to? Create a define maybe?
Will do.
>
>> +	else
>> +		volt_step = (u32)v_step;
>> +
>> +	if (t_step < 0)
>> +		timing_step = BIT(6) | (u32)(-t_step);
>> +	else
>> +		timing_step = (u32)t_step;
>> +
>> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     BIT(eye_pos) | BIT(6));
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to enable Host EOM on Lane %d: %d\n",
>> +			lane, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TIMING_STEPS,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     timing_step);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to set Host EOM timing step on Lane %d: %d\n",
>> +			lane, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_VOLTAGE_STEPS,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     volt_step);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to set Host EOM voltage step on Lane %d: %d\n",
>> +			lane, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TARGET_TEST_COUNT,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     target_test_count);
>> +	if (ret)
>> +		dev_err(hba->dev, "Failed to set Host EOM target test count on Lane %d: %d\n",
>> +			lane, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ufs_qcom_host_eom_may_stop(struct ufs_hba *hba, int lane,
>> +				      u32 target_test_count, u32 *err_count)
>> +{
>> +	u32 start, tested_count, error_count;
>> +	int ret;
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_START,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     &start);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to get Host EOM start status on Lane %d: %d\n",
>> +			lane, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (start & 0x1)
>> +		return -EAGAIN;
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TESTED_COUNT,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     &tested_count);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to get Host EOM tested count on Lane %d: %d\n",
>> +			lane, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ERROR_COUNT,
>> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +			     &error_count);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to get Host EOM error count on Lane %d: %d\n",
>> +			lane, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* EOM can stop */
>> +	if ((tested_count >= target_test_count - 3) || error_count > 0) {
>> +		*err_count = error_count;
>> +
>> +		/* Disable EOM */
>> +		ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
>> +					UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
>> +				     0x0);
>> +		if (ret) {
>> +			dev_err(hba->dev, "Failed to disable Host EOM on Lane %d: %d\n",
>> +				lane, ret);
>> +			return ret;
>> +		}
>> +	} else {
>> +		return -EAGAIN;
>> +	}
>> +
>> +	return ret;
> return 0;
Done.
>> +}
>> +
>> +static int ufs_qcom_host_eom_scan(struct ufs_hba *hba, int num_lanes,
>> +				  const struct ufs_eom_coord *eom_coord,
>> +				  u32 target_test_count, u32 *err_count)
>> +{
>> +	bool eom_stopped[PA_MAXDATALANES] = { 0 };
>> +	enum ufs_eom_eye_pos eye_pos;
>> +	int lane, v_step, t_step, ret;
>> +	u32 setting;
>> +
>> +	if (!err_count || !eom_coord)
>> +		return -EINVAL;
>> +
>> +	if (target_test_count < 8) {
>> +		dev_err(hba->dev, "%s: Target test count (%u) too small for Host EOM\n",
>> +			__func__, target_test_count);
> No __func__ please.
Done.
>
>> +		return -EINVAL;
> -ERANGE
Done.
>
>> +	}
>> +
>> +	v_step = eom_coord->v_step;
>> +	t_step = eom_coord->t_step;
>> +	eye_pos = eom_coord->eye_pos;
>> +
>> +	for (lane = 0; lane < num_lanes; lane++) {
>> +		ret = ufs_qcom_host_eom_config(hba, lane, v_step, t_step,
>> +					       eye_pos, target_test_count);
>> +		if (ret) {
>> +			dev_err(hba->dev, "Failed to config Host EOM: %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * Trigger a PACP_PWR_req to kick start EOM, but not to really change
>> +	 * the Power Mode.
>> +	 */
>> +	ret = ufshcd_uic_change_pwr_mode(hba, FAST_MODE << 4 | FAST_MODE);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to change power mode to kick start Host EOM: %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +more_burst:
>> +	/* Create burst on Host RX Lane. */
>> +	ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_LOCALVERINFO), &setting);
>> +
>> +	for (lane = 0; lane < num_lanes; lane++) {
>> +		if (eom_stopped[lane])
>> +			continue;
>> +
>> +		ret = ufs_qcom_host_eom_may_stop(hba, lane, target_test_count,
>> +						 &err_count[lane]);
>> +		if (!ret) {
>> +			eom_stopped[lane] = true;
>> +		} else if (ret == -EAGAIN) {
>> +			/* Need more burst to excercise EOM */
>> +			goto more_burst;
>> +		} else {
>> +			dev_err(hba->dev, "Failed to stop Host EOM: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		dev_dbg(hba->dev, "%s: Host RX Lane %d EOM, v_step %d, t_step %d, error count %u\n",
>> +			__func__, lane, v_step, t_step, err_count[lane]);
>> +	}
>> +
>> +	return ret;
> return 0;
>
>> +}
>> +
>> +static int ufs_qcom_host_sw_rx_fom(struct ufs_hba *hba, int num_lanes, u32 *fom)
>> +{
>> +	const struct ufs_eom_coord *eom_coord = sw_rx_fom_eom_coords_g6;
>> +	u32 eom_err_count[PA_MAXDATALANES] = { 0 };
>> +	u32 curr_ahit;
>> +	int lane, i, ret;
>> +
>> +	if (!fom)
>> +		return -EINVAL;
>> +
>> +	/* Stop the auto hibernate idle timer */
>> +	curr_ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
>> +	if (curr_ahit)
>> +		ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
>> +
>> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXHSADAPTTYPE), PA_NO_ADAPT);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: Failed to select NO_ADAPT before starting Host EOM: %d\n",
>> +			__func__, ret);
>> +		goto out;
>> +	}
>> +
>> +	for (i = 0; i < SW_RX_FOM_EOM_COORDS; i++, eom_coord++) {
>> +		ret = ufs_qcom_host_eom_scan(hba, num_lanes, eom_coord, 0x3F,
>> +					     eom_err_count);
>> +		if (ret) {
>> +			dev_err(hba->dev, "%s: Failed to run Host EOM scan: %d\n",
>> +				__func__, ret);
>> +			break;
>> +		}
>> +
>> +		for (lane = 0; lane < num_lanes; lane++) {
>> +			/* Bad coordinates have no weights */
>> +			if (eom_err_count[lane])
>> +				continue;
>> +			fom[lane] += SW_RX_FOM_EOM_COORDS_WEIGHT;
>> +		}
>> +	}
>> +
>> +out:
>> +	/* Restore the auto hibernate idle timer */
>> +	if (curr_ahit)
>> +		ufshcd_writel(hba, curr_ahit, REG_AUTO_HIBERNATE_IDLE_TIMER);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
>> +			       struct ufs_pa_layer_attr *pwr_mode,
>> +			       struct tx_eqtr_iter *h_iter,
>> +			       struct tx_eqtr_iter *d_iter)
>> +{
>> +	struct ufshcd_tx_eq_params *params __free(kfree) =
>> +		kzalloc(sizeof(*params), GFP_KERNEL);
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct ufs_pa_layer_attr old_pwr_info;
>> +	u32 fom[PA_MAXDATALANES] = { 0 };
>> +	u32 gear = pwr_mode->gear_tx;
>> +	u32 rate = pwr_mode->hs_rate;
>> +	int lane, ret;
>> +
>> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1 ||
>> +	    gear <= UFS_HS_G5 || !d_iter || !d_iter->is_new)
>> +		return 0;
>> +
>> +	if (gear < UFS_HS_G1 || gear >= UFS_HS_GEAR_MAX)
>> +		return -EINVAL;
> -ERANGE
>
>> +
>> +	if (!params)
>> +		return -ENOMEM;
>> +
>> +	memcpy(&old_pwr_info, &hba->pwr_info, sizeof(struct ufs_pa_layer_attr));
>> +
>> +	memcpy(params, &hba->tx_eq_params[gear - 1], sizeof(struct ufshcd_tx_eq_params));
>> +	for (lane = 0; lane < d_iter->num_lanes; lane++) {
>> +		params->device[lane].preshoot = d_iter->preshoot;
>> +		params->device[lane].deemphasis = d_iter->deemphasis;
>> +	}
>> +
>> +	/* Use TX EQTR settings as Device's TX Equalization settings. */
>> +	ret = ufshcd_apply_tx_eq_settings(hba, params, gear);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
>> +			__func__, gear, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Force PMC to target HS Gear to use new TX Equalization settings. */
>> +	ret = ufs_qcom_change_power_mode(hba, pwr_mode, UFSHCD_PMC_POLICY_FORCE);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
>> +			__func__, gear, UFS_HS_RATE_STRING(rate), ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = ufs_qcom_host_sw_rx_fom(hba, d_iter->num_lanes, fom);
>> +	if (ret) {
>> +		dev_err(hba->dev, "Failed to get Host SW FOM for Device TX Lane (PreShoot: %u, DeEmphasis: %u): %d\n",
>> +			d_iter->preshoot, d_iter->deemphasis, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Restore Device's TX Equalization settings. */
>> +	ret = ufshcd_apply_tx_eq_settings(hba, &hba->tx_eq_params[gear - 1], gear);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
>> +			__func__, gear, ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Restore Power Mode. */
>> +	ret = ufs_qcom_change_power_mode(hba, &old_pwr_info, UFSHCD_PMC_POLICY_FORCE);
>> +	if (ret) {
>> +		dev_err(hba->dev, "%s: Failed to retore power mode to HS-G%u: %d\n",
>> +			__func__, old_pwr_info.gear_tx, ret);
>> +		return ret;
>> +	}
>> +
>> +	for (lane = 0; lane < d_iter->num_lanes; lane++)
>> +		d_iter->fom[lane] = fom[lane];
>> +
>> +	return ret;
> return 0;
Done.
> - Mani
>


