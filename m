Return-Path: <linux-arm-msm+bounces-104104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGrYJWu06GmIOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:43:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F15784458C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8D63033AA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF14B3D1719;
	Wed, 22 Apr 2026 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMUWXQ6j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rw/L8AQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1163CF05F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858185; cv=none; b=tY0tTrgRveL0wF7AzqWRq3Q2IN4LM1ByEB0LOrGzR6PZrCVUWPFq+pw8F7cewNiGlRBCLgBd2kFK/4TNjGPG+qcfmyfaQjT9Wr/kpkHQlbXs6ZlNMcOa5Hqps4q4BuFaKaQ1Whdtj+IUtU9SQmTFDnjBxYTxcfFE/9xFSpRaVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858185; c=relaxed/simple;
	bh=xpmmlN2U9IP/07c5/qTXUOmLu1m2Mith3UMXzkuawE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zfdol/IaPaf6WI1B4sIS8ogQKgDXTUGDjYcCX5v5UOQ8K+W/ZQ8SYnQRhglhehJ2xg20ofCWvJrS8gm4MOmpUCs7my14aaUXCnSxOy6xoc9kPwJ45i70SGnSmZUzqrXNMkR2TFkHz4AZELY6HgcEyH6FuPaDF+0L781x5/DgQt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMUWXQ6j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rw/L8AQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAiYDh3377480
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmtyZ8ImtLYNrjmdyv9HZA5rCehvd27BE3LsxITC6VM=; b=BMUWXQ6j0ETp6V2D
	FfOeWhYnL/DHlBWtH6WqCCcLgCAW7IQDuJXDYi1OcEySpSmRgq5CMUeMVxzNWHe9
	QLlkTw8FohClP2ZEISb97bjhMBjE80Zx1BauCokLDNBD+8vshlpKWs/sgq0JZtNY
	MAJ7pDCmFKVKuoIebrQB5AAxSdl0ymjFi3g6qko57hleDh2lqkBuDrsc6Z2dUL3w
	w++3O8Z7uYC/1sGwPSI6EZPhJpfNSJjy4AXGneeDjKow5hZ/sj7s1I8ZKPwoOY3p
	zkOQrAzCTW5FB6D1vIbNzGb/5ovhxLBNVgj7661fR+D5GIjKwjN6DjyuFNTPOHGX
	bzCIyg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng384b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:43:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso13102127a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776858181; x=1777462981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmtyZ8ImtLYNrjmdyv9HZA5rCehvd27BE3LsxITC6VM=;
        b=Rw/L8AQkQ3UDBDMHzdyq+2ymCA915CJPmgpMJ+gOdkVAHKISoGUwD6e6zGfxj5XRx9
         cxrIXHpcwDhhIqwA5+L+KqRZGowImu05gDFNWNOzD9oI5/z9hfMkObnkcsJEVnqPNStX
         pN+L56XSxXNv3sYX9fYog1NbN3z/2rREU59YR3j815VG1OCRHBvSTJcqaWq8cRVdS1xX
         JxmEpmJamq20WpkeUBXsQgDxzi6Y2xdwfuxYrId25HrP4oehOYqqwe50CC+lfQeBzELA
         PS2b9enlER4U2A/K/rvrBhttwsxK6LKmK8HXHqH8pA34j+Td+6+cKrjrgjTVYbuQny3U
         EegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858181; x=1777462981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmtyZ8ImtLYNrjmdyv9HZA5rCehvd27BE3LsxITC6VM=;
        b=Kec4Mme/g+5VBi2nXdc1X9MDFRXnnh2E4OZT72lP3T4C2R5CIZ2yUN2TZRH4YcpuWI
         KLVY6Xfof4tSl1jX2yVksWhTUS+DK0UIVrH82FKsMMr7kM1vMLWAdML2xsn9mXUMCNJQ
         zWQH3B+U5PKQH0HXiJr03QDeGA0eU8It/YQkuFxoibQcJHQjverfQKpzPnkuiZq2JED0
         XQEf3ayE7WOKlhcRy+bt0CMr3MsX7liuspI38dLb0HrSJCG+9DvF2Gan8Nda2fh7msbN
         trOicVKjD9LYFZjWfE2zf1R2syr3tMxbYBETlfxuIlZYt5eHn9Qp2802n23hr7RXnfv4
         PpIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CD2YCtT8FThteys5v2MEfknOq+Nt+2U4/iXD2VSshtBl77FSexIzeqem8eef3hlBXqwhfMToX8olPIup3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QltncIn3bZFMSTvsyMoWoV2lPMOi0zMs4AhBd5nB5KdwURP+
	L5emnuaI9ugX09Vk0nh92Gd7Ejy0zYEqUn2okesPtWupS7rxavS/x+L50sNF7B13w9Dx6sYBwRm
	JxZEp0ZRY3RJrnZc660t1K+OghZxSMimzq9TEc9aQ6EZVXi041jmNBmVystFkLQS/QDNi
X-Gm-Gg: AeBDies5DlCa1oAmofcijxNWoE5H6GndvJfUHFrYL3g5rw2d8aLKYgCp9CEOim9wlfv
	8KuASZs2QwAikE+ldW/Lj33ZHqVGA2t+1lN+bSsHQcYNkhvGtBWSCg9W/Jg7c+FBCTovfl7HGha
	4WKSsfUiQ9Kliz4ExNvWX7uaVr34OCwUS26DDFcha68/mqIuxBK5ZReH18Y2patAKTXZq3BDwgr
	iZ6aS+W6alfeuTjDrqkNSlYfoNRbf5FuHPW53mT524FS/vCtj4vjQ2whn56acmmDcJzJhx3qsL4
	IPb+ySNzwxGJsP7PG+9IZZ+IIydO78oq+EN1/A+LYXnJbR9PhtUI09JITnwbD/pQ2D7ZJ/EeUUX
	ANyFjERpLzFEUp0P0UaOGJrTWYkcopqBOzdU0Va//rQACUGhwld57o+iT87C4YFwD
X-Received: by 2002:a17:90b:562b:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-361403bdcfcmr23079168a91.4.1776858181243;
        Wed, 22 Apr 2026 04:43:01 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-361403bdcfcmr23079141a91.4.1776858180728;
        Wed, 22 Apr 2026 04:43:00 -0700 (PDT)
Received: from [192.168.29.82] ([49.37.135.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc575bsm16858965a91.4.2026.04.22.04.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:43:00 -0700 (PDT)
Message-ID: <544962be-22f1-4215-ad1f-21286798ed12@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 17:12:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ufs: core: Configure only active lanes during link
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        nitin.rawat@oss.qualcomm.com, shawn.lin@rock-chips.com
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
 <20260417045602.3042928-2-palash.kambar@oss.qualcomm.com>
 <zi5fjfyjwja2goouqesdpddyl243bjjpau232ik6fvvxed7kp3@egaolv3m3quq>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <zi5fjfyjwja2goouqesdpddyl243bjjpau232ik6fvvxed7kp3@egaolv3m3quq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8b446 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=+bqKbExyHclgz+xyRKw6tw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Db-oeYxN4i5GQM4S5YAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Mck2J7RPlV9nxCYXyV1gRTQJJ8YyoL7r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExMiBTYWx0ZWRfX01es8DYc3pe8
 LL4kTt0dZyCcG/YPiW2v2CLTAC9u04pVYgwX4QGOqr3wpXMJSibyRc0yV9Kjrs6MKJeTOcOI9ki
 +ucODQRuTLhjVAiP88qHXM9s0HL3GPX3uLfIYiac/B9MTAsCKY0cHN5NAXHBB5TKWBsXevsU9ZT
 LrlBsh2DQdRGdR9uHTRW5doANzrlwe2KQ2R4Xpx6DL9EAWgekUBU7S4x0eDlz34B7mZNMp1ecxU
 ghuUTTWFSQkl72VdfdoapovU5vwqR2acGJ9JiVeP3IgqP1fFkLE8D9l/bgAb4maoBuLR8IiOL/r
 NjopLOGBMy7xrzrkrB7Q7y6hpOg3fUn0mEKr9nyWtqeWLcdLy9qpMIgDc6b3AvKTqWOvaQ0tccK
 e2WRmtwO8pN0D8uEuzXmmXCp8XBTFEKltFEpvTM837J1ReR4/kz8zaB5VSBRfx0c4IWLZeEv1GI
 3EO0chkDZCmGncsj3rg==
X-Proofpoint-ORIG-GUID: Mck2J7RPlV9nxCYXyV1gRTQJJ8YyoL7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104104-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F15784458C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/2026 3:10 PM, Manivannan Sadhasivam wrote:
> On Fri, Apr 17, 2026 at 10:26:01AM +0530, palash.kambar@oss.qualcomm.com wrote:
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
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> One comment below. With that fixed,
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
>> ---
>>  drivers/ufs/core/ufshcd.c | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 31950fc51a4c..10f8d2b552be 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -5035,6 +5035,40 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val)
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
>> +		goto out;
> 
> Return 'ret' directly, here and below.
> 
>> +
>> +	if (val != hba->lanes_per_direction) {
>> +		dev_err(hba->dev, "Tx lane mismatch [config,reported] [%d,%d]\n",
>> +			hba->lanes_per_direction, val);
>> +		ret = -ENOLINK;
>> +		goto out;
>> +	}
>> +
>> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_CONNECTEDRXDATALANES),
>> +			     &val);
>> +	if (ret)
>> +		goto out;
>> +
>> +	if (val != hba->lanes_per_direction) {
>> +		dev_err(hba->dev, "Rx lane mismatch [config,reported] [%d,%d]\n",
>> +			hba->lanes_per_direction, val);
>> +		ret = -ENOLINK;
>> +		goto out;
>> +	}
>> +
>> +return 0;
> 
> Odd indent.
> 

Ok Mani, will address the comments.

> 


