Return-Path: <linux-arm-msm+bounces-104281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGbjJgzu6Wm2nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC774502E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 632DC3011A69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3F8377579;
	Thu, 23 Apr 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYJPKyMq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJ2O0ixZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E43377556
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938501; cv=none; b=lUsRDnW3NWsB6SxKuKIR7q19P+nQxNYXxPKS0bZnZrbMmTpYpBQkmzbT+bHygdJErA1E853D1WJdg7ndDMPvPJbmlQiK8eHprVPlmPbKew9QrUFARnJx5Mx+YqNyTblkOhIu4YTymqhGY+Mh852AAEmpqqoLPvunWJgB5QB0R7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938501; c=relaxed/simple;
	bh=S8f6+ehUtJMx81AZ6koB32qCI1+M7p7cO19QQ1odyvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKqFH4ZlGnnZs79dH9zkrdz08xpLf9+qli86eO0gyxmd5TkAKO1EWdGVBAzorSdfx1km/e9tPYhH6MWX9SHlS17ZRQZ/sU4C84T7grqBAjplp4p9eslmTzOz3GdYoJBEVi0KkEkk7sjCYM9iY/5yK/15wZtB6Eij0Rio5Zg86/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYJPKyMq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJ2O0ixZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEEE3044060
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTAImua58OKvf6hsofV3JDzOzX9CCnQSyZAKqQ4qL4c=; b=BYJPKyMqgjk/t3KX
	BFNyIjnQOuPOH/a7sYtFtPdwUEcma/Gv/OBImajy2/k7MseMBEtHpswBbXbrOW14
	6Xl9R7lhVL0/16EjvOAuwcW1u2LdQPFwu5P0FHYjEdJdDZAWC8A9+pmY6OZXtUfn
	r8N+rxqnk3l6ALSaMArtwWii5vXzR7R6qx39yP/rl7g1xU2BratkVglgS8iwg2Oo
	10U4x3qOGEKcQXr/yl3OKtUTdjYuqHxnzpmkbRrknQ5IfEzZxTvzKCT1YH1IVA74
	5BpIlc7/zlDzvWvTfp7/qBMUcV5aFSDnF3/5izc1lyUDbr11ralZVNfQpd+n8l3h
	jo/1Jw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3am6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:01:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82d40278103so4335538b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938498; x=1777543298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTAImua58OKvf6hsofV3JDzOzX9CCnQSyZAKqQ4qL4c=;
        b=FJ2O0ixZrcwp6G2PJxcciK28u+LGZdx6jeOLl9uFeno+Fttlocr/16PNm7AdAMaZBJ
         ZSYKQPUOZrVbIftYXvNHXisd9dPA1WaFVv6Oig8ZmRyXpVQIOqIRrpACAZ/Ghz3EydlW
         RYuZt7fg6zLadWIWmIcK8YWHfvFjbaXDiK5q2Wa7Zph2L2Z4HrL5myE1eNtBqqK1NDZz
         jrpkxdzRuWyN+jmQpqUXH31f6+CsDzPCNz5JcnKiRhKJkoZViEWBgA323LKorv01gh1+
         wJIXnJGIz3XfHKfjlhHv5jLSjd+OVro0Oz85nrz/ibXJYIXUr6SxhxqWaU/1WthGd4jF
         2mzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938498; x=1777543298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTAImua58OKvf6hsofV3JDzOzX9CCnQSyZAKqQ4qL4c=;
        b=jfX2w1noDoMXgvWEisF2jjNmIJOsXd2FRQzwYAUogWfIebVnsr8PQ9hjg3bzTiLKD4
         REJD7P7gkGU0pl8f1xO2l1+m1LtIOtWu++A4hCfY+wCQMpYDB6w/AdCCU6b/AHb2GJkc
         W77dnVHoS67shMCWUIroyNX6Wl3YRIGxZGCoMifLEQyn7ImMC/Ox+YV+Q5m0ChCb665w
         ouNvWR1mIf00LsP5xWkOmrnadu7NqfHrSMymvA4ng1iND8CFCD4MZNWQA2klmf5JqqmY
         HW1rhBWTJKHF0zC0HTsVqVH6IOD10HvoEN6Z50oGOIGqhcbGi5h2z1XT9Bmt4dhbn+6A
         KPhw==
X-Forwarded-Encrypted: i=1; AFNElJ/r7DmNiefk8E/UHfozQvBLvFuWaSqake18jHGi+e5XXnOnzap1B6smcCdXnQ+P9eGpjFrnAdEqP+ItdPNy@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaTFzHmWEyf0JM3jki4o4YmC+rdqempw4jn5FSFMFi+4y20yV
	kdNPJLkSNoSLBv4sDAoNfQoZ19khlYK4r0VWh+V3JVTDTaNh4kzMVyVsU5glAagrrUEnrhQX05K
	T16WrwoPs50hzw/SEzzk4H+pLqgTWlfdb6HC+1G/yRXUrpph/56IPw7oco8UtsrgSm8Kq
X-Gm-Gg: AeBDievo9FqYxtTytwLQYuC/djpE7xqlTB1nDkcCJQsCWpR2V5AE1PycLdTBMJrCZ3W
	9/F+6YaSZKv+TB9IN7PYdLtHSTEbVk8BnAqDqw0wnUiU3ow24C0XKCYFVu7+aKUVpJOckVhy83y
	hewwsTT8yI04nkPef+RY671v3x6Nf1WWSRYIdNQHqEQcMFEhkJnsSFKeVNaESdlYqH1wPD+8qG8
	HVk0zWCLA4QLCzlo3t8EuB2rLO8ePzZn9bIDbuXRbzgdTHBfb/HsETExU3eJ0eZS2/V7tuvkoYc
	AMkUEDBuz8U4d7YxWBelB4ronGb6E0kM9R/3BSsOtYHeWYoL/4nENuD5snguzoFLKBdKqVX7Zy8
	OiNvYW1oi1AXGgEWcJx+GXZ0KGVDPdKvY7zAsWBPHRF5IRLrY8yOGLKrUrIAFmAo=
X-Received: by 2002:a05:6a00:3cc6:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-82f8c98c45amr29192072b3a.49.1776938497723;
        Thu, 23 Apr 2026 03:01:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cc6:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-82f8c98c45amr29192004b3a.49.1776938497025;
        Thu, 23 Apr 2026 03:01:37 -0700 (PDT)
Received: from [10.92.175.180] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ea0098fsm19522390b3a.24.2026.04.23.03.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:01:36 -0700 (PDT)
Message-ID: <722eb005-351e-40a1-af8c-c6cd01fb168a@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 15:31:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/2] ufs: core: Configure only active lanes during link
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com
References: <20260423055914.3566684-1-palash.kambar@oss.qualcomm.com>
 <20260423055914.3566684-2-palash.kambar@oss.qualcomm.com>
 <we5guwh4bayq2fertkfsh27ykkzz4h2owzt5wjiezn2yzfjpni@77a3xpe6in2l>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <we5guwh4bayq2fertkfsh27ykkzz4h2owzt5wjiezn2yzfjpni@77a3xpe6in2l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5OCBTYWx0ZWRfX5/H1Ya5s7jqW
 0dpxxUOto1eS2ibMVd8afxa6YelVcHBiYa58H5wQa7P2HCsfuUIVvNWSRcWGBdpXIYBIxJsHwn0
 m1PTLOLugoRbwQym43OB+9WDCXtyc0J/ldeSIm7c1HhkdnYgJXwRKPBL/qIcOwCsPU86ypmd+xg
 auKWnVo78y3bhhP82X4JAYHN7x4Z/+wG1hWbMa+bPL6iKwOeosB/UdDmS1WLiKJ3mxbsJWpI2ce
 sB7SumjA3banWhcYVeyKlKcUlPX5dvEC/TA/O1pWQ6DHW8CAqaSRx7SJxWXiGM14gydGs/mNo2N
 szjpI8mbolJh5VDb6SigQCFjIsHXXK8DFeE7zM1TuLA5xjkanTuAI3peSKINCrwcz1M9tAY1HYo
 CzblKrB0UV25eaMGIjNayofRZK27nn3sIZ3RTT3xuecEbaSwDCDvXFhmeY7Hp+10meswyWELwVd
 TNrJwJdqkLOyZOD20QA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e9ee03 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N54-gffFAAAA:8 a=s8YR1HE3AAAA:8 a=VwQbUJbxAAAA:8
 a=Db-oeYxN4i5GQM4S5YAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 13ZBJYfctZf-nf-dwVEJhrjeVTCf76dz
X-Proofpoint-ORIG-GUID: 13ZBJYfctZf-nf-dwVEJhrjeVTCf76dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104281-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,acm.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: 6BC774502E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/23/2026 1:34 PM, Manivannan Sadhasivam wrote:
> On Thu, Apr 23, 2026 at 11:29:13AM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> The number of connected lanes detected during UFS link startup can be
>> fewer than the lanes specified in the device tree. The current driver
>> logic attempts to configure all lanes defined in the device tree,
>> regardless of their actual availability. This mismatch may cause
>> failures during power mode changes.
>>
>> Hence, Add a check during link startup to ensure that only the lanes
>> actually discovered are considered valid. If a mismatch is detected,
>> fail the initialization early, preventing the driver from entering
>> an unsupported configuration that could cause power mode transition
>> failures.
>>
>> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  drivers/ufs/core/ufshcd.c | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 31950fc51a4c..fe5bc85c6870 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -5035,6 +5035,37 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
>>  }
>>  EXPORT_SYMBOL_GPL(ufshcd_update_evt_hist);
>>  
>> +static int ufshcd_validate_link_params(struct ufs_hba *hba)
>> +{
>> +	int ret, val;
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDTXDATALANES),
>> +			     &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (val != hba->lanes_per_direction) {
>> +		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
>> +			hba->lanes_per_direction, val);
>> +		ret = -ENOLINK;
>> +		return ret;
> 
> Really? If you had spent a minute in reading the patch after writing, you
> would've seen this obvious mistake.

Ok Mani, will update this. Thanks.

> 
>> +	}
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
>> +			     &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (val != hba->lanes_per_direction) {
>> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
>> +			hba->lanes_per_direction, val);
>> +		ret = -ENOLINK;
>> +		return ret;
> 
> Same here.
> 
> - Mani
> 


