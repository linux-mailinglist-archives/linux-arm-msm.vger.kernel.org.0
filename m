Return-Path: <linux-arm-msm+bounces-114219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7qtYNsmIOmoR/QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:23:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDF6B76D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:23:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="QY1/d0Ue";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Yy0W6jRz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114219-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114219-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E83306FAC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919823264FB;
	Tue, 23 Jun 2026 13:23:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45D313543
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:23:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220992; cv=none; b=msyh2vg3V1z0H67/9/QjgmsEbbiy9rpBjmMTP74kNRhNOJJsC9tTb1zAd0LNu+nFy6bLb/UCwPZUYtP4O8wt7YSQy1lUhA/KhOxxcEK1FQjgkRPEArGFA/E4WsEGD3AAxv6zeqO5oUCQJXYjnBZ3iwgi5EohexICA8WQMDvV2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220992; c=relaxed/simple;
	bh=KHsbF2q5YwBbi3WT6ofbIrfPK5Aoj098duTHqUgcKl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ap34G6skUTe+6CgezYYLp162kuB4dUzzu/SOnWgrhVeV2vW5GL8JyLfHjThnL/xxodv4Y2YmM4UQ0oWK5qUASNvIhXo1hYhVrRRtiYRvhhGdbYb4tTeniYZp6v/b1+y+72yNT0kNOl18OaZGmwOfp8V5Xk/KpUlUTabtrpo/imM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QY1/d0Ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yy0W6jRz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZaIO134211
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWICyA4OjvwivGmi36NJ951DnPj0i8yHE05ZwVHeGmk=; b=QY1/d0Ue4iXDjNIg
	o42Gu2gjzPSiZZqkcb1eQBSY+kKFJhFSpxjwMX30FOLrZ89QCBViVxlPBVDVvAlG
	21sQhXwFvtC0/gq2jTKwjf8OfFxk6awKlu1+VKmh3ikueB5lz0I8OEbpp2/XEz2d
	z2vqPNkkVuiW+nlLJJ1EZjQG+dQwVgjDVF6bP5qXPuj4AUQ+r1TRMbslBVF90YrC
	YfZb6KGnjsGnyrDA1Pmzw7y1ZILRYNC+JHR9I3r28DFS4emZ3wqw1Hmvh0JfOAU/
	YgGw3gpELMrW2WcUyOsHGauVPqVB/ZXov6/yqV8t0sxVgI2nqg04Cr95hLM6f0rR
	HizbNg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320pbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 13:23:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso3883150a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782220988; x=1782825788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWICyA4OjvwivGmi36NJ951DnPj0i8yHE05ZwVHeGmk=;
        b=Yy0W6jRzQTGLnqRddJqDzE6/JNQuv1PS1ypF+7hFxTtaEwYwDRgK0R3TzGgRk+zcn0
         bjQqehKtiggJjFDOdl2pUa91rxEvsTN02LZ3h2uoS/646HrTAO/cGapYtSrLMJudCTaM
         fgLhDr+PiTQqKj9/fWGUjI/XuWa1SG5GJA1sREXzUXblEdu7rWg5DWgT3Nln2WcMbdFZ
         YYgxeh0v6ggJ9ueial4SLyy1+tfNBqC2L4xczUhwPisf6031dsitvAhRRM38MS1jRmfP
         lXIM8M9CsQNkHgP6o68Au+1wYhf97wY/E0r6i/ai1dVML/Q6UK4CVSd22N32h54rFtw9
         FHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220988; x=1782825788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWICyA4OjvwivGmi36NJ951DnPj0i8yHE05ZwVHeGmk=;
        b=ooE0kddS6CpcSGL8HUVsX0TzsgJDr6rPUh5zikGvcYa4jMaP0Tt7arj8UjkvES3ARx
         7QoZ/luGoi8qj6M2ipbgU1LelTTz16wGrz4oz+5gXUy25ridmn0X5H3DWrh/l+OZbO6Z
         l+Z623uN6DJ9AjxxQqfNKRIcoCN/kRF95v/mdlNqF6EiyaOAT6YE+YiOBw+JqldKWK3C
         9Vj8KuoJiWnDMYM/mccZf6bptLmX6275I9Jyh/lCbckrnAxkT0AEI6q3SlMg41CWtiqg
         /vOEWCGPLeyYaghdIIGs7uMQY5UUhHz1mxcPF8wbXkgRxn8sVlJfo/tRcRDjEtPHhLMg
         3unw==
X-Forwarded-Encrypted: i=1; AFNElJ8wrjqP4pTEfhgdfyvzkY/XcqxHyjWQ5lNMQUTlqZPcG7SaoCfmMXwGhtA3HcMZ97zqACiGT8wT7VV71sPz@vger.kernel.org
X-Gm-Message-State: AOJu0YzMRzCihR5RKtnYz2RGWOKk8NYyNLAGYMR3/yD2agzVmph/fiWg
	ElbabZmosY+2nDuJOZaZRozcRRH0FVFA+Lu7GlVvvHfSAHY6D6gAt/Sf9CBjM+fvrkgj/Q2k8Ow
	+u26OKYLG3N6ZEFEgsO84qfzS3qa9S6ZAXmNL+bkYNe1EgO0xTMb0atipoLoi6Y971Me+bntHy/
	hA
X-Gm-Gg: AfdE7cknugctbMf35Rrve8xIsrjZCBKaBUmPu5jONBxWMOpznegzMpcmJl0FjSsw6Lw
	u+HXuLgAXIzeMIVWFapJG2TpQeZBXM2TpShC9sWLBTcbWeQZWBzkTXwh3r3YH39+F+Lw3mvQX+g
	2AXYkPm1aEN1o18Md1gpzFHULd6CQtDNKzIur0u7St+uD6fy6++TZOgA64Pv/2+zCh8/BxaXQyo
	oI/be6igLg8Bdawv4vf424Z7QF0sR/JM4syKnGbVc/3m2hWPdObvXICHh3WhVEUjBLhC/2LZ/sM
	BLcVU2UgChEvy+LMTLbmi3MXgcfll0SEFRBIiJANYC3Dd1R/HEDVy2hpItBFviSMHi8D63TWX1K
	4g0a/YTgWK/Ec+I6PbdhK/xm8Y7L0tPwKG/ZvTa9oNBnr8plaNTHQiCUw/GmkIyGiqg5NC0tL/w
	YX
X-Received: by 2002:a05:6a21:32a1:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3bc5181970dmr18275358637.7.1782220987977;
        Tue, 23 Jun 2026 06:23:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a1:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3bc5181970dmr18275282637.7.1782220987253;
        Tue, 23 Jun 2026 06:23:07 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5d04858sm10135881a12.28.2026.06.23.06.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 06:23:06 -0700 (PDT)
Message-ID: <ab578742-005f-46b5-a865-1e7065807c41@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 21:23:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] scsi: ufs: ufs-qcom: Restore TX Equalization settings
 on FOM failure
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20260620080322.3765210-1-can.guo@oss.qualcomm.com>
 <20260620080322.3765210-2-can.guo@oss.qualcomm.com>
 <3e6codiksnngi442bitbvzgs222hl5poqi7o7chtt4ulnq7na3@4otqpolqzhbs>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <3e6codiksnngi442bitbvzgs222hl5poqi7o7chtt4ulnq7na3@4otqpolqzhbs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwOSBTYWx0ZWRfX+v3MDZoYhiOI
 pGfqYjS0grYBYzbSqT7nXy8iFhBApWABCnO61o0cEvSPCqxfmS0sSx227sEWp6YouKx00FqZqRa
 NQhUL4uM8En/6r8Jybo9LLWdQ1jn5Fk=
X-Proofpoint-ORIG-GUID: KK_mSrKY0lmrfZ4l1NZcf32XAtSIwtN_
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a88bd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Dm8MaZoDgxkqV7ZbULYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwOSBTYWx0ZWRfXwK8M4FMd7Ppt
 rCFZzNU/GtvCIZmxf1/cebb5VYqehyaxu03fZPF3OK4nQQD3+X7tAaB4h2SPgzJAKSPgJH2uqnV
 conWrKdDZEvgetBYz5Tv5J/jMH2Ok7Tn/kecofiiTLLsEqLvUr33sZ4hN4pmrYOv6SWWtbNKkEF
 yKqt8p1PXD3v2Z+f8yZQAV8MFyDCsJwtqt7h/2tCeB/bJj1M16lHbf+0yuNZrohHlpYsSBwdruY
 vMKnYJK5xLyn25eqWciZkhIiML1xTfftiCOb7yvfPTZtyOX4prxmRn4uarPjPFoAM7mObJPmSij
 Y/7zHR5fpqbOqAwHML94oXl7C7mTI6c7o+cYezurcsvsOMZ9QmegBBvahF8I8JuFNi2lPxnl7FD
 YhullTbwbM7McNx9BT1nPqdoC/222b9ypP/fU6rg24zplIGvV5bal/igupECNFNp6ofyBRZtfq5
 vul56MbFDqIZGDxH2uQ==
X-Proofpoint-GUID: KK_mSrKY0lmrfZ4l1NZcf32XAtSIwtN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114219-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:bvanassche@acm.org,m:beanhuo@micron.com,m:peter.wang@mediatek.com,m:martin.petersen@oracle.com,m:linux-scsi@vger.kernel.org,m:James.Bottomley@hansenpartnership.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34FDF6B76D1



On 6/23/2026 2:33 PM, Manivannan Sadhasivam wrote:
> On Sat, Jun 20, 2026 at 01:03:20AM -0700, Can Guo wrote:
>> ufs_qcom_get_rx_fom() applies temporary device TX Equalization values
>> before forcing HS mode and running the EOM-based SW FOM scan.
>>
>> When one of these steps fails, the function can bypass the shared
>> cleanup path and leave temporary TX Equalization settings programmed.
>>
>> Route those failures through the cleanup label so the original TX EQ
>> settings are restored and link recovery runs before exit.
>>
>> This path also reuses ret for cleanup, so it may overwrite the original
>> error. Keep that on purpose: if cleanup succeeds, the caller can proceed
>> with the FOM result for the current iteration.
>>
>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index c084ccc72523..7d7c001435bf 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -2791,7 +2791,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
>>   	if (ret) {
>>   		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
>>   			__func__, gear, ret);
>> -		return ret;
>> +		goto link_recover_and_restore;
> IIUC, if ufshcd_apply_tx_eq_settings() fails, then it means the TX EQ settings
> were not applied. So do we really need to restore the original TQ EQ here?
Hi Mani,

Thanks for the review.

In many cases yes, but not always. `ufshcd_apply_tx_eq_settings()` 
writes multiple
DME attributes, so a failure may happen after partial programming. 
Routing all failure
cases through a single cleanup path makes us always attempt restore and 
link recovery,
instead of exiting early with possibly transient settings.
>
>>   	}
>>   
>>   	/* Force PMC to target HS Gear to use new TX Equalization settings. */
>> @@ -2799,16 +2799,15 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
>>   	if (ret) {
>>   		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
>>   			__func__, gear, ufs_hs_rate_to_str(rate), ret);
>> -		return ret;
>> +		goto link_recover_and_restore;
>>   	}
>>   
>>   	ret = ufs_qcom_host_sw_rx_fom(hba, pwr_mode->lane_rx, fom);
>> -	if (ret) {
>> +	if (ret)
>>   		dev_err(hba->dev, "Failed to get SW FOM of TX (PreShoot: %u, DeEmphasis: %u): %d\n",
>>   			d_iter->preshoot, d_iter->deemphasis, ret);
>> -		return ret;
>> -	}
>>   
>> +link_recover_and_restore:
>>   	/* Restore Device's TX Equalization settings. */
>>   	ret = ufshcd_apply_tx_eq_settings(hba, &hba->tx_eq_params[gear - 1], gear);
>>   	if (ret) {
> 'ret' will be overridden here and '0' might be returned to the caller.
Correct, this is intentional for the TX EQTR sweep. This helper runs 
per-iteration, and I want a
failed sample to be treated as FOM=0 so the sweep can continue to the 
next point, rather than
aborting the full procedure. We only stop/abort TX EQTR sweep when 
cleanup/recovery itself fails.

Thanks,
Can Guo.
>
> - Mani
>


