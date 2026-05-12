Return-Path: <linux-arm-msm+bounces-107144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD4bB+pbA2qE5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:57:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74705525424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 18:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 872643164775
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970573C7690;
	Tue, 12 May 2026 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOt0rcTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S55XTfMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B123B5F5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604531; cv=none; b=kpBIpi1HQ6xQFvCMDBmOYSyR52xWDR6VmEuT83evS3W0zWFOkGNCmuAJ9rADLWiUEdPs+XASDFYY3M7e75R/UBLYbJsySnact2LHep4VDxmjiwGD+r33g5eRx8XKXLdFwh2lbkfRmBqaNcXXEUsiUzolR3e7ySBxOFl8rZQkQsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604531; c=relaxed/simple;
	bh=GWf/+tRlXAcWyJ362P1ZNcB3a8zvflkQTKYhpdb1vYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5iXwCJQ4t7hJhxOPYj3MOuYT/oolJqmsPP6m/06M+wd2zJE+IfUStQp4SC8ywR/TBK6aW2m7tCzINAd9p98wRTZ6iMzxX2YgK+1n/etJ2eCGNo7bDe0L/AVtquFZgXALRKsHC6hkov7fGvAJC7TFEexyXOz8Hbadc/SE4qJuyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOt0rcTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S55XTfMA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CFLXTr3422497
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZB0D2+zzw1ZhGJQXpB+1LvzU47GEZERdOV01X12Jqmg=; b=kOt0rcTTTxD+fOW/
	paNXKsSqMO3QgHoRK7KknyMqqpOKKGCuPKCLQwS+qoRRQ/qQ7IqfzIxiNYkMej+A
	DuAhfFoH0J8BBm4OG9GPbXSSpoNEXiOSB3iRZvGIHlBzhzTZufNG13OT0NnDXETX
	5JGWJUp8ZrS5K4qaERUI3CB75tUppEsZ6vNORO5xzODcEH3fODf6vyh06oxG4/x/
	UytRWRDXwWU1r17fUSpgEx1SrmDMH6pwsIxT//QxTflCfRFkLawXoNA/7MJn0bxS
	1K5NkL8aKIE1XskYqYsPg3tWYkUeFi/e5OjHjUAB9jxGHUhHYyJh/+Tayi0EbGAh
	MbM8sA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9rctw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 16:48:48 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1329791f18fso7532754c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778604528; x=1779209328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZB0D2+zzw1ZhGJQXpB+1LvzU47GEZERdOV01X12Jqmg=;
        b=S55XTfMAIZRtWIWSOW/SFleZ5zeraf7OEueDuteGSUAB/euTfPQgEp6gO+NihZT7Ui
         daUu2ABvX9KV11F6XPNjiy6vvF+kTccj7tliR+LiQuDhKnc43gGbxqb8dxZ2dfF8lH+u
         iONJW2+MAqt3vbqZJDimu6ZKqfPuu87n8km8+6108OjyfxZ81484eE2L9oO3f6roeqYK
         cWOhWSrX8z/OrZ23d5oymtHJ2BySin0Ty+peRnHvkV849ybm4y4gYxubQUR/ennWUijn
         wFLQqX5GH0wnrvv7hQ0jrF33IVqRC89uujG+T0cJfyiwCrt6pH2UgDCrxVnMYoirqaNJ
         5eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604528; x=1779209328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB0D2+zzw1ZhGJQXpB+1LvzU47GEZERdOV01X12Jqmg=;
        b=eH2/wuuX6nEhuAOR0owKGaNepl3jgfuk+BjkeiPKyEQDlxHwsNDmQU3UQaaj45Ui6g
         czX3zAR6WoFekkfG6pwxBn1ze8+PGwk8lhHXQnAtD6+tJwKRBpOzNwYAnHXZUfPFHUoV
         cNJ+dhc8VjOApQ2rm9nOCQSKygLvGJ7Qt5aIiMvpa9oqZ6AEgTEzWh6fKguEN8109OW6
         6TCeOt3+fkJ664I0nEXx2h9sgJvYGboHoa1VEb5m2UGmOjWSdZAlafJGKs7U6hZrDDRO
         WsdA0WEEdtkQ5MJd8i6B0Gysw7WW/oahkbPyi4clf1ISR9NAt9bJxnHZl3GanHfSIYt8
         7T6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+h0yi6U0HJWM8x4o0FDBgRgjYwXkTssuz40E4w9jWvsRfsIrmvwmKUWWI1LWgbL6V/wzwlekEO5wxI7H4T@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFhOaLAueA6ny5BMmukEhR7MhcbNxp0TaqY8hMcOorp+zqZR/
	piE6e10kh2AQFyJkdodVhxglCJtSFq7/pYQa9Tjjoq0NfiWOIrNmdryOoKL654B08VbHPtGlTl7
	OSIsUxRCj5up48gSUH/XhLHHS7puSfYR472UMZZSweP8Mb6yAbeki0u87IUH0Jrn4fOMa
X-Gm-Gg: Acq92OEbAMBMn97tiLJndCAI+g2qe0asd3eEXICF1YI1Pe90NEQ563jFydr/Ku8aQAf
	2g0YC9uXousTrjviVq6EhTflkTyBiNJeZczRjCJocivlRRzYH5NDoVqqTBpXW8iydJP3EvAQVye
	EazOmYTwKB50SmrF4Y4ZVVOREDb9+wM3tYcuZQHKk6A8DnnmrGN8eKFhKspB1kaBYJBfL8B1TLF
	1AunI2/nA5Yoa+x3oPumZfK9XWrsZdaDuaF8sUpysK+x4kAR7pFVxqU165reGdzrb2NvwWM/ZVg
	tAOl1tybSpf1Xf22U9P742Wxf0QfHFB2esJNcECaP8vbrSIKwtzLtdmK5RQ3cvv94rFYbB6EKFN
	FHqZTN9opeaiSSdrJmcn+pbOVtD1NvHjHAqigs6yShwtqBAzfLfgYoPF2axbbqnegeBKeSUHlfv
	U=
X-Received: by 2002:a05:7022:f212:b0:12d:f0b1:75de with SMTP id a92af1059eb24-1319cf56178mr14141874c88.22.1778604527746;
        Tue, 12 May 2026 09:48:47 -0700 (PDT)
X-Received: by 2002:a05:7022:f212:b0:12d:f0b1:75de with SMTP id a92af1059eb24-1319cf56178mr14141853c88.22.1778604527254;
        Tue, 12 May 2026 09:48:47 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fc59sm21912668c88.7.2026.05.12.09.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:48:46 -0700 (PDT)
Message-ID: <b60143ca-e090-4a81-98ed-d6affaede97e@oss.qualcomm.com>
Date: Tue, 12 May 2026 10:48:45 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add overflow check to remap_pfn_range
 during mmap
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        youssef.abdulrahman@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Lukas Maar <lukas.maar@tugraz.at>
References: <20260430193858.1178641-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260430193858.1178641-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3NCBTYWx0ZWRfX7KT44mFO2wYl
 qwMpmO6cP/wCk49nfwChnBsQ5Tf9O7mvzi1QPkoKTmX9sNhD1CqIGgKLs4qTP2xt57bpulI9YN7
 SrpkAbbr9Z4yKOQVxp7w7jN7N6oGLtXhY/rbT49b+0gTqDDQZxLaC5UhxS5bOBnOBzG7L1p3a6b
 4wLwA5X4LUB3329rhLkbc6fotuNq3fG2bJm3vNdjkDVceM9qTu9noPUd4T/zUctu4JyQrcpYqvl
 87xZnD2T6tiOQHkG5jmpl2Qh+ZE+eougb79z6Vs3xv+zsKOleX8fmDo3C0WCCoKfUXk/ouzN9wQ
 B+2ICmAtXi+Y8783JumDXZogU7HLZPh8F1ae/fW4MuDFvnMaEA+FrPk1y5HvAnceBxp8AD5t6y+
 nzt7rkf6jOnEA7kCS/fyFVEXtewfIBtvqLRw8Um0o79oNH0RAzeZMG/w4gjt0Y2FhxAGFepUmOi
 zCkcz7jLaOHF3zWJgNQ==
X-Proofpoint-GUID: kBxuFx1xHdIFbtSE5zzEeWAA3QvdJ2n9
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a0359f0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ixu4JsPXSrMzd3x0NycA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: kBxuFx1xHdIFbtSE5zzEeWAA3QvdJ2n9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120174
X-Rspamd-Queue-Id: 74705525424
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tugraz.at:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107144-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 4/30/2026 1:39 PM, Zack McKevitt wrote:
> The call to remap_pfn_range in qaic_gem_object_mmap is susceptible to
> (re)mapping beyond the VMA if the BO is too large. This can cause use
> after free issues when munmap() unmaps only the VMA region and not the
> additional mappings. To prevent this, check the remaining size of the
> VMA before remapping and truncate the remapped length if sg->length is
> too large.
> 
> Reported-by: Lukas Maar <lukas.maar@tugraz.at>
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

