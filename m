Return-Path: <linux-arm-msm+bounces-60716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8436AD2F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98C81188C9E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 07:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E41D27FD71;
	Tue, 10 Jun 2025 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GnEHwjy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418DF27FD75
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541602; cv=none; b=kQPfC8btZ4GW8cOkmhluE/TdZw9xv0hVwhMWwp3+k72SRdTpy/hkb+p7554s7GfZ2R6NJB3m73KFTY9din9htkuqUI4ygl62QagNXOOqP+VWDRVIhaP345cS8KWE1WZc3dcOAEz+wtEifli63pzGIDBuo2JGc1DQfseqwPQQIyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541602; c=relaxed/simple;
	bh=6/THYvgLbES0YhhJZPQnRn7c/QwZTodoYVo1PYBsJvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QozfgGgFiyNeyPhO8T5hZYpFApLlkHFbuEGSgudH+XAH8gd6Q1tMPAyU3E2q2iQZYZwFbX0+slIVy3twR+IwB0fSzy5pgO8snMimKHhiQ1h2XEetByDwmwXGzY8kFW+9DGp20PyM3YK4GeuoVU1GqPfljJfKeIU8lyyT21YxcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GnEHwjy4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559MLpKb026500
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkmLQstAxmaDWYQl0rijYwctWd0n5xL/jDxvnCy/h8w=; b=GnEHwjy42NF6FOZO
	A/qWXFNCjG6zuEJF5XimW/InL2sV6f4qvX3x4oBCn12sJsjVzA6GMPQmVVhRoDxn
	8/YOSUtRucmUfXVTQ/+c0QH/EHh0rubDQ+8214WVoFXiMe37mefrCE1cGarAaC/v
	p2aCiWtWTaLKuxXiZmF13jw06X+xR7diuKS2fiW+zWZpgFmGvCiX78Yao1cNVAfB
	fY+dfjSIVdBijTnXsxbiuYFbgfHrVacfilR699yZ3QPX5IRMplwX5PnzzWpn1R0h
	1Jj7HqEYPenwwyG5H+o236VpXYW/UD3qODzx6C0g9V1CEqR5pIGb3cYGafZ1eEbu
	HB1a6A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9rmah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:46:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235842baba4so44083575ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 00:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541596; x=1750146396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkmLQstAxmaDWYQl0rijYwctWd0n5xL/jDxvnCy/h8w=;
        b=UCuws4HVphNWHeEA+8QAteQVI2KVaUjIb6p12VZ9p3MkkJGxGxreXfOSaUIW9Kv3nD
         bM/cyxd77UpNv6xvqTi6tTwNZEuIo4fDPMBeuhpZStd4noKpUj34WuiG61J5+5BplR4L
         4TBx4FLzgEIcnHqfrBfof3dwd0nUL5uzR8uTS6eOtwir1gHW4HWk7B1EVGjgkH4sQZhd
         7vG6OTE7tPKKhPfnOr9mLL4rYx3erZyATokvbS5LhQOlOsRa+nf9reFKO8/rHbg/Kz4u
         xP2lQk70QdufU3HMTAO7y5qkaYlvmq7av43qtv8ceidc386aH7J5hnP2qMMOVli6XgB5
         we1Q==
X-Gm-Message-State: AOJu0YxIHhuY9miBDoTzByUbU7q2ih9BPgF0i3BuRPfFU/RzGWJENidB
	Jx7Qy3q5UeXQB453DSLWGPm087FkE+kDeE7/IEWyNtytURHoS0jGt69wkvhdseqgbYHab1zWlxW
	jE7o2f/vtuCXXOAnWJDLFGEWImgdNb++eqcswa2/TN8czGTRwevYhvffuDpi/pM/LfUpi
X-Gm-Gg: ASbGncueqim1xyt9JgEn0rOLGk4ZpM3OiCyOF8s8KHlW/L1fAcmCUAZXpg1uii+16BG
	S/avHEPtKG85Kdfz0Uu0Abezr7Rxa8D38UoRBc0U4k2ucghamE4Xe7dYr03faAUdPsX83CFFWSU
	pU21ZenGvq3wAjgBYRPAiG8DwjO+NgGI+S5A0AEzGhTu4g89Ahg1pbQxGXR1mPW6OVal3lIt2YK
	44aQV1qLBrKYUYkFcaYtaaedtHTFcPgX2ayxhycCXdfiQ4KeBvren16BB/N8QRvLj3ysvQPM13B
	sreGZwXyXg5glBd2Ilm4WDDgIBGX9JJfjPd35z5PJ5ljyKv1kBD1embJ/LmpyYA=
X-Received: by 2002:a17:902:ce88:b0:235:f45f:ed49 with SMTP id d9443c01a7336-236383677camr24638545ad.33.1749541596509;
        Tue, 10 Jun 2025 00:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ioJqWJjAW3OBxKY8Q3keXw9lPemyCTPatvYkEI9nkTwJZxVY8u4zpkiMNnh4ZOWVzQ758w==
X-Received: by 2002:a17:902:ce88:b0:235:f45f:ed49 with SMTP id d9443c01a7336-236383677camr24638175ad.33.1749541596052;
        Tue, 10 Jun 2025 00:46:36 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078116sm65678165ad.19.2025.06.10.00.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:46:35 -0700 (PDT)
Message-ID: <c2d138ba-5b08-4daa-95b3-e1f95f05938d@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 13:16:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT
 and BCN_STAT
To: bjorn.andersson@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UgJpN7TjdsNwbeaDrPzqPaJBjS5oqwci
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6847e2dd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6rQvm6eimZqQVVFLZJ0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: UgJpN7TjdsNwbeaDrPzqPaJBjS5oqwci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1OCBTYWx0ZWRfX+pGC2TRS3ln3
 +zGkAMTZItWmFc681rntv12Uedp0uDSY3egOpVNOd4BafsDzbv/yp9SPBCPhd9kF/JR7NXarcsU
 czD9deSZjdDnh9wy54d5mNMQgn3Et6lE4yFe6OJMbxksT7oDuHgxg0OrvZtyzexolc3lA76222V
 kIdsDj7INiT/2I6h3elsxL4wdFH3a05ieM//XWhpahqwCumwO8qXYvg47KJ8RORaYG+dux1o16q
 o8PfvNg0ZLUy93IKvGVlvKqNIeAViRYvVA8YvEtKipVlczMc6yEGgnPKUlkHw+483Kg8uTGxHvS
 DuO4QdJ9S1A5MRG2GLzK57zcgE56kDSH3w9sEXzca2iDhUcJ7nz8QYotVowu65rFToRU2t6c1oa
 nKUUe2dD/fTX1q2EPBaOcGtHflVKZj6rAx/ezOMWfFJVNXRugG2Q4TdgwX2nYkFuEx3RQpOI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100058



On 6/10/2025 8:36 AM, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> When the ath12k driver is built without CONFIG_ATH12K_DEBUG, the
> recently refactored stats code can cause any user space application
> (such at NetworkManager) to consume 100% CPU for 3 seconds, every time
> stats are read.
> 
> Commit 'b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of
> debugfs")' moved ath12k_debugfs_fw_stats_request() out of debugfs, by
> merging the additional logic into ath12k_mac_get_fw_stats().
> 
> Among the added responsibility of ath12k_mac_get_fw_stats() was the
> busy-wait for `fw_stats_done`.
> 
> Signalling of `fw_stats_done` happens when one of the
> WMI_REQUEST_PDEV_STAT, WMI_REQUEST_VDEV_STAT, and WMI_REQUEST_BCN_STAT
> messages are received, but the handling of the latter two commands remained
> in the debugfs code. As `fw_stats_done` isn't signalled, the calling
> processes will spin until the timeout (3 seconds) is reached.
> 
> Moving the handling of these two additional responses out of debugfs
> resolves the issue.
> 
> Fixes: b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of debugfs")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/debugfs.c | 58 --------------------------
>   drivers/net/wireless/ath/ath12k/debugfs.h |  7 ----
>   drivers/net/wireless/ath/ath12k/wmi.c     | 67 +++++++++++++++++++++++++++----
>   3 files changed, 60 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index dd624d73b8b2714e77c9d89b5a52f7b3fcb02951..23da93afaa5c25e806c9859dbbdd796afd23d78a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1251,64 +1251,6 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
>   	 */
>   }
>   
> -void
> -ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -				struct ath12k_fw_stats *stats)
> -{
> -	struct ath12k_base *ab = ar->ab;
> -	struct ath12k_pdev *pdev;
> -	bool is_end;
> -	static unsigned int num_vdev, num_bcn;
> -	size_t total_vdevs_started = 0;
> -	int i;
> -
> -	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> -		if (list_empty(&stats->vdevs)) {
> -			ath12k_warn(ab, "empty vdev stats");
> -			return;
> -		}
> -		/* FW sends all the active VDEV stats irrespective of PDEV,
> -		 * hence limit until the count of all VDEVs started
> -		 */
> -		rcu_read_lock();
> -		for (i = 0; i < ab->num_radios; i++) {
> -			pdev = rcu_dereference(ab->pdevs_active[i]);
> -			if (pdev && pdev->ar)
> -				total_vdevs_started += pdev->ar->num_started_vdevs;
> -		}
> -		rcu_read_unlock();
> -
> -		is_end = ((++num_vdev) == total_vdevs_started);
> -
> -		list_splice_tail_init(&stats->vdevs,
> -				      &ar->fw_stats.vdevs);
> -
> -		if (is_end) {
> -			ar->fw_stats.fw_stats_done = true;
> -			num_vdev = 0;
> -		}
> -		return;
> -	}
> -	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> -		if (list_empty(&stats->bcn)) {
> -			ath12k_warn(ab, "empty beacon stats");
> -			return;
> -		}
> -		/* Mark end until we reached the count of all started VDEVs
> -		 * within the PDEV
> -		 */
> -		is_end = ((++num_bcn) == ar->num_started_vdevs);
> -
> -		list_splice_tail_init(&stats->bcn,
> -				      &ar->fw_stats.bcn);
> -
> -		if (is_end) {
> -			ar->fw_stats.fw_stats_done = true;
> -			num_bcn = 0;
> -		}
> -	}
> -}
> -
>   static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
>   {
>   	struct ath12k *ar = inode->i_private;
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
> index ebef7dace3448e4bdf2d6cb155d089267315172c..21641a8a03460c6cc1b34929a353e5605bb834ce 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.h
> @@ -12,8 +12,6 @@ void ath12k_debugfs_soc_create(struct ath12k_base *ab);
>   void ath12k_debugfs_soc_destroy(struct ath12k_base *ab);
>   void ath12k_debugfs_register(struct ath12k *ar);
>   void ath12k_debugfs_unregister(struct ath12k *ar);
> -void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -				     struct ath12k_fw_stats *stats);
>   void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
>   			       struct ieee80211_vif *vif);
>   void ath12k_debugfs_pdev_create(struct ath12k_base *ab);
> @@ -126,11 +124,6 @@ static inline void ath12k_debugfs_unregister(struct ath12k *ar)
>   {
>   }
>   
> -static inline void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -						   struct ath12k_fw_stats *stats)
> -{
> -}
> -
>   static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
>   {
>   	return false;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..2d2444417e2b2d9281754d113f2b073034e27739 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -7626,6 +7626,63 @@ static int ath12k_wmi_pull_fw_stats(struct ath12k_base *ab, struct sk_buff *skb,
>   				   &parse);
>   }
>   
> +static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
> +					struct ath12k_fw_stats *stats)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_pdev *pdev;
> +	bool is_end;
> +	static unsigned int num_vdev, num_bcn;
> +	size_t total_vdevs_started = 0;
> +	int i;
> +
> +	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> +		if (list_empty(&stats->vdevs)) {
> +			ath12k_warn(ab, "empty vdev stats");
> +			return;
> +		}
> +		/* FW sends all the active VDEV stats irrespective of PDEV,
> +		 * hence limit until the count of all VDEVs started
> +		 */
> +		rcu_read_lock();
> +		for (i = 0; i < ab->num_radios; i++) {
> +			pdev = rcu_dereference(ab->pdevs_active[i]);
> +			if (pdev && pdev->ar)
> +				total_vdevs_started += pdev->ar->num_started_vdevs;
> +		}
> +		rcu_read_unlock();
> +
> +		is_end = ((++num_vdev) == total_vdevs_started);
> +
> +		list_splice_tail_init(&stats->vdevs,
> +				      &ar->fw_stats.vdevs);
> +
> +		if (is_end) {
> +			ar->fw_stats.fw_stats_done = true;
> +			num_vdev = 0;
> +		}
> +		return;
> +	}
> +	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> +		if (list_empty(&stats->bcn)) {
> +			ath12k_warn(ab, "empty beacon stats");
> +			return;
> +		}
> +		/* Mark end until we reached the count of all started VDEVs
> +		 * within the PDEV
> +		 */
> +		is_end = ((++num_bcn) == ar->num_started_vdevs);
> +
> +		list_splice_tail_init(&stats->bcn,
> +				      &ar->fw_stats.bcn);
> +
> +		if (is_end) {
> +			ar->fw_stats.fw_stats_done = true;
> +			num_bcn = 0;
> +		}
> +	}
> +}
> +
>   static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
>   {
>   	struct ath12k_fw_stats stats = {};
> @@ -7655,19 +7712,15 @@ static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *sk
>   
>   	spin_lock_bh(&ar->data_lock);
>   
> -	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
> -	 * debugfs fw stats. Therefore, processing it separately.
> -	 */
> +	/* Handle WMI_REQUEST_PDEV_STAT status update */
>   	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
>   		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
>   		ar->fw_stats.fw_stats_done = true;
>   		goto complete;
>   	}
>   
> -	/* WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT are currently requested only
> -	 * via debugfs fw stats. Hence, processing these in debugfs context.
> -	 */
> -	ath12k_debugfs_fw_stats_process(ar, &stats);
> +	/* Handle WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT updates. */
> +	ath12k_wmi_fw_stats_process(ar, &stats);
>   
>   complete:
>   	complete(&ar->fw_stats_complete);
> 


This look fine to me, Thanks for fixing this.

Apart from this we may also have to free up the stats buffer list 
maintained when the stats is requested out of debugfs (like 
ath12k_mac_op_get_txpower() and ath12k_mac_op_sta_statistics()) once its 
scope of usage is done, else the memory will be held untill next fw 
stats request or module unload.

-- 
--
Ramesh


