Return-Path: <linux-arm-msm+bounces-94817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNakHaNYpWnj9wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:30:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B11D5902
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2429E3042942
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9A038F634;
	Mon,  2 Mar 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GoRcKCM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAQXKj1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B94638F621
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443726; cv=none; b=oN4p7UiPd7yaMs6dy5bw+xQ228RDn5mgCphPl2LEigdUEYChcaUFIS7bs/dOr9yU+JRvq0Bqv69ErX1IDBeASBhIkRLrVBKIFl7a2HQQw0liN6CxP+aXsmFmUMaXFjeYGQiqbpjsMIVFaEYKwGTQEo7T0m1zr70Rnz4ajJpvdi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443726; c=relaxed/simple;
	bh=283ITlUTpw+pnnWf8GlTk3ilsVM0BLNnI2fU0ZTZpAs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=rb92Oq4FJgRF+ZR9g3DuQKctlIHPruq/IsnOvDkVKqDv7xb7DKu5ihTX6bnA5NiM42DImpvsZhVCVfsVEvyp41p+yo3mB2o+ndk+2++ZeMj5rGNqyN7/UnS3QX1plSTKZE286pEizvzpgoO3ptpM22FHTlKtPb92exOJylOqKHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GoRcKCM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAQXKj1L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K4EF782859
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht8a1jegW8k/H9PVxZasCwKoJs5NEx57HRzB+8Y1KVo=; b=GoRcKCM7831kuUhp
	I5iRKWUanqqzJFpMCKE4KqTqTkEiVQz8Oq4LpbM+OJtjJu9kqs+IqAq+aMB4u47h
	irngferz5Ea6YPaLiPrYNznw33L33vSJhrzYPzWFkAcWTSi43pfFnMj2s6KhKyPB
	VaJFxFU+CEoQpoGlVu9xQ6d8wyLzyjfL8WNDzUd1Z21CpgxFbFWwSmdso+1T8QZJ
	5syQ7xhsSAhJkuQ1stVjxQO1+8H5+EmoE/hiGDAiXU5FeyMPvf9MYsLRUeK0utc+
	ukYtUiRDUWhz0cYj82yh5zEG2xquF1tBGfaV3z07jNuGyAOIrFpU36Obt8ozCa0P
	Af823Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u0012p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:28:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3595485abbbso3168193a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772443721; x=1773048521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ht8a1jegW8k/H9PVxZasCwKoJs5NEx57HRzB+8Y1KVo=;
        b=HAQXKj1LZOf/bkOBpFO8RSxF3p1pu8TmGDm3kL12okUxlmnuF80uTwxY2M5gKNvY0X
         +pVhCJrmkADX04+Hk9zFILjk432uE2clk2fLiIxm9aYviPcHwKkshsA0gmsqwDoQHzVU
         d434cJmCi+Q53psdcOUMmIn7CNK+JqXcesvuKJTUIal/F8uxD2F7O/4heqsXdoTguPpc
         FjVoqL7a/C8gU/Lzz4p9KJHgesp5CUnBxfxlBbcpyeSX8xRmeF4a2QKNMJWFEJY77Hau
         vbcolF4tK6+p+S00PBsIoeXuwpN9aQGKqWnuCQA3siucghQdNsEMkYuHJiLrX/MDVRIH
         Yapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443721; x=1773048521;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ht8a1jegW8k/H9PVxZasCwKoJs5NEx57HRzB+8Y1KVo=;
        b=kgpSrNfwIyEkUh7HT9/yTMGtJd25Yb2dnNwqCkXPB8V1Cg3sKVD4Z/9f6MNoXe98oR
         l1e3TY9uSnnvSacAmcuqUB2+d8qJ+ncophzAT95VgHaWhjLnh84PDzC1xiblXbDbp1De
         6n61lYEh0OQW9NCr9nVeb54DQJx4/NXdmWYbDHgOIOzMiJtORdM32s1S8mDt9Kq7FCj0
         5wGcKq15KoB7VWB7ngM1FYdPXuvY1dDx7IRB6HITBrxEfWcr9yClJxWpy3CO66s5SYJb
         5qAo4NebrrlS7jNyhfT/eVdEO0gW2tvh+dKBUPgaQLkNFiPtY+i3HyewKdT4t05RvkOK
         DuSw==
X-Forwarded-Encrypted: i=1; AJvYcCVCzBMDqJlN1jgT589w+tAMnp6fdqc+BaRqp9lUy7UJK9OtOX+xyWTsR+q8uUAjPJE26ASloGupO4Q+YO39@vger.kernel.org
X-Gm-Message-State: AOJu0YzOzTUIEpI7q9S6mPd9V3QHfIxQsdZfyNBojPV3E2Tzd48jAbQH
	D4Q+4RnCyqVauTdp8Ve03UrIiQROI2iazTxlBhXX+CMjTjtFu7QwrWPBsZVm60wl55trZHde7gM
	q0/n5bCnXJVMORmDx1/3/F+048LiZuCHphQ34FRfeVVcjtpT9olCF9n+AuaXZklY6IgdO
X-Gm-Gg: ATEYQzwKGj01GukEW4hyDnUCYwQexbMJSx3X0ntdfB3yUbob43UYiJmVcrPeLGFjETM
	1KoAW8G2W1K4qfVRToNPq4j4DGaFTpw1Rx0C5BIGmMEGuag6MCM9EtXDR5IovT2tSVAvvU9qgFs
	tEcEtSPWcHXrzYSA1GT1XrLGM101bDx997T0gV7NE3Haet/pjn4VVEj+NmyDpMWx+q66Ymv4I70
	CqgL4DJPGqjZpBwaXPeFVKCHUmYTGSbR7R780YfhKKYKX35vbO+cZ+lVypgqTus9Vd6Ii5O5of3
	xtupC9SSOQRleg6H7gPS5fzy7r5FC4k5OFwrJi/a05y/+yV9+c/mX7CadCvv06S36sX6eQdAkpP
	mIanW874BNGkJ7rkDZrG4yALpRNzbAIyxC61fvv2fBoShyy/Ilw==
X-Received: by 2002:a17:90a:fc4d:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-35965cc9d6amr10190633a91.23.1772443721266;
        Mon, 02 Mar 2026 01:28:41 -0800 (PST)
X-Received: by 2002:a17:90a:fc4d:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-35965cc9d6amr10190617a91.23.1772443720773;
        Mon, 02 Mar 2026 01:28:40 -0800 (PST)
Received: from [10.217.222.63] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3597dfea2e7sm6307474a91.12.2026.03.02.01.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:28:40 -0800 (PST)
Subject: Re: [PATCH v3 1/4] soc: qcom: ice: Fix race between qcom_ice_probe()
 and of_qcom_ice_get()
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260223-qcom-ice-fix-v3-0-6ca5846329f7@oss.qualcomm.com>
 <20260223-qcom-ice-fix-v3-1-6ca5846329f7@oss.qualcomm.com>
 <h2uhrsjlvovjcj7k2ckpkgrhpuwm6biun4ueq7kyzcm4hqcsjr@y3iiqx2vo6s2>
 <lrhali5ukotcmxqp4yb2g2jvbrhlanpqc67cpvluex4l63skne@ln3j4xn6qfvx>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <ea659db4-54df-1892-f04a-74a8f62c7dec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:58:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <lrhali5ukotcmxqp4yb2g2jvbrhlanpqc67cpvluex4l63skne@ln3j4xn6qfvx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a5584a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xC54U6B0g8_6vy67BIAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OSBTYWx0ZWRfXyjECEnw9D5Vh
 JaPnnj8ccTef/FotjMlcKw23R3lfrt+zEKo+zwb/MzKjjlkfa2X3oPhc4qF4RnE30AOT/xZ2xg8
 XwNGFBx0SoYoV/CuNGlfNkL+ipIxZf4/BmWYRVPxlBv6BQyPHDX7gVqhgaYuvndp7K8qbl+Iax9
 LWZXCgjAwrexhPY5LjPEyko+dMJVFc9KlecftzK0U8qKDgru+jBi+ulrq1m06cnfxsAeZe505Hp
 KJq9o19GYMUcI2QkA4E+TY/NBY/3rkbbI2wKJLCXkeflqe+0s5NFrKAfqeankvdRMaSX2y8rG4D
 W6TZLNddeFSTg9Ln+K1nWee2crSWUV4UPolA5wYvNithlmw6tpEBxeutUTIlJ9trmIlwd+RN8yp
 a6LbpnLOKc4K9XyCEZ4AxzGzWi8sx9uswH9CIiMQohSxZV4Qs8aoPNeH80vGHenTS+Jq85mPPmI
 bptN0m+9DMfuNXxIm6w==
X-Proofpoint-GUID: FzQnQq2Bt-bqe8XhjlGOSFgaoOyCy580
X-Proofpoint-ORIG-GUID: FzQnQq2Bt-bqe8XhjlGOSFgaoOyCy580
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-94817-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E21B11D5902
X-Rspamd-Action: no action



On 2/24/2026 10:16 AM, Manivannan Sadhasivam wrote:
> + Neeraj
> 
> On Mon, Feb 23, 2026 at 02:35:04PM -0600, Bjorn Andersson wrote:
>> On Mon, Feb 23, 2026 at 01:32:52PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>>
>>> The current platform driver design causes probe ordering races with
>>> consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
>>> probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
>>> with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
>>> be gracefully disabled. devm_of_qcom_ice_get() doesn't know if the ICE
>>> driver probe has failed due to above reasons or it is waiting for the SCM
>>> driver.
>>>
>>> Moreover, there is no devlink dependency between ICE and consumer drivers
>>> as 'qcom,ice' is not considered as a DT 'supplier'. So the consumer drivers
>>> have no idea of when the ICE driver is going to probe.
>>>
>>> To address these issues, introduce a global ice_handle to store the valid
>>> ICE handle pointer, and set during successful ICE driver probe. On probe
>>> failure, set it to an error pointer and propagate the error from
>>> of_qcom_ice_get().
>>>
>>> Additionally, add a global ice_mutex to synchronize qcom_ice_probe() and
>>> of_qcom_ice_get().
>>>
>>> Note that this change only fixes the standalone ICE DT node bindings and
>>> not the ones with 'ice' range embedded in the consumer nodes, where there
>>> is no issue.
>>>
>>> Cc: <stable@vger.kernel.org> # 6.4
>>> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
>>> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>>  drivers/soc/qcom/ice.c | 44 +++++++++++++++++++++++++++-----------------
>>>  1 file changed, 27 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>> index b203bc685cad..3c3c189e24f9 100644
>>> --- a/drivers/soc/qcom/ice.c
>>> +++ b/drivers/soc/qcom/ice.c
>>> @@ -113,6 +113,9 @@ struct qcom_ice {
>>>  	u8 hwkm_version;
>>>  };
>>>  
>>> +static DEFINE_MUTEX(ice_mutex);
>>> +static struct qcom_ice *ice_handle;
>>
>> Did we get confirmation that in the UFS + SDCC case, there's only a
>> single ICE instance per SoC?
>>
> 
> Right now there is only a single instance per SoC. But Neeraj told me that
> upcoming SoCs are going to have multiple instances. But I don't want to spend

Yes and patches for same are under review here:
https://lore.kernel.org/all/20260217052526.2335759-1-neeraj.soni@oss.qualcomm.com/

> too much time on *upcoming* support, but rather fix the current
> implementations.
> 
> Extending this to multiple instances would just require storing the ice_handle
> with node name/address pair in xarray or in some other data structures.
> 
> - Mani
> 

