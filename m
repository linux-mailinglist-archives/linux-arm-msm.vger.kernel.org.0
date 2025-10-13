Return-Path: <linux-arm-msm+bounces-77059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A4BD6BB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56D219A21CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B05A271A9D;
	Mon, 13 Oct 2025 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORy9I3CI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59F3212568
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760397898; cv=none; b=qotNYmkHbANrPc4iNxEjBfbbzlY2yA2nQjwpmeXdM+nczjix1jByNBDHqMukc71CY6+AnmHIZwChw0CDzcwkGVHqZbf0GbcA7YUvyyMEwelUuhprZTlv3ELi4T92AfvYjX+xnbaxheQIQJlA4B1OnKehr7vq603v6VllumtI2ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760397898; c=relaxed/simple;
	bh=RTl9s67Ox210XdrNvqEpgEam0/leSPOiHIn30CUFBWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BF5DwBBS+u2+YMyrqgFJ0SntuH1a6o/S/eAMUMjxETGCWad20TNUlDNtNL5/sq4wW6PUTQ5j4RbZYVg6iO4EbBj01VUTK/MJzwCe4KisOdeGmFeJHpM0qRfphEjRDsOLEZ+fmghKwmFYh0bru0lsuVKikYPTqYJ5+nnNxjd6vJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORy9I3CI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDApZ002445
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PvISk9YT5RJCI3q0r/F45lMUM36h1JsB4OfS502032c=; b=ORy9I3CIh9vjbRdq
	BYn6Ol0nEE+/SgP07RdDi10VonMY2H6CO2DE3VdIWTwgcb8tT+iKmM4VrNwAc9nH
	/8fbMn+0Uzf1nav5lbrrqVMI7F2oXLcZnzokQWXAKuY1FNVM+Ya/poO21WV826jn
	hayaVnK6OITE7JkVRBXzBqueeuyWFhyAIGs1lYiyYLlkZ3PKPwR1rr5vkacpZPxd
	K/Gt7HSoRTg4cdDG4aF/+ZTQQ0O0icwwdXSEEhcCB+kBpQhe4Uig4WzSpkMSA5GE
	jjorl/YTjKnxNze5pe/PCf1hM+Ez3JT5ceJhM/VwJhFYqYq+Ks2mMn5QyDLDGd1N
	zuB2Lw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk6fsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:24:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62f9247dd1so8280939a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760397894; x=1761002694;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvISk9YT5RJCI3q0r/F45lMUM36h1JsB4OfS502032c=;
        b=l4zsZPBleIG91K1K5onrt1GiFhjeY5KTUWdVFQHmqKnwpGZ2nn1YheADgw/5OhFOu9
         78B2YP70xFhFiLKiUP4hI3ZhPRBz1iXRqGmfVvDlelvbJHx0EEh3g7wVhwoVNxqJe0FK
         Xsw8IL/bMdPd2I7koT2X7cHiXIxg1OlTXWJHC+0DNmfcsdjb7cLR/UdSw9jH4NquQyLI
         nCpcVH6GqXG7VO/uhl9oPfDS/yuLYpI8ydHoY93q2RT35jaGMshBa0njumCDBNFYtTD2
         SY2k0RX6/vXO/qnyh7LPhbU6chrRGKjmw8tg6K8qxbXHpcbj1RiqEXzc1T0+cSRSknPb
         YM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOfKhDtZWi/mBoiU4x2J8vXEvXKCyuXeyaCxj1cLY+WdTzrC8UjcDWGsEbkqpi2tfiXyzfW/EokIk3XNNb@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVft9p90t036HPP7ZI8ICRMthYQexFWad4+gzXgE0owzvFfZa
	AtT9VvdhmAOqPcyNi4de81K6FLUUIuIDa5klTWSLsB2JSf/Z2uEWq/vcqIxiceRkn965AGL1gtG
	bDNkShwf+AvlsJM3XGbWTFQyF263RGvc5e/Pf+FqTyw9j/P1a+uV5hHnyv7K3MZX3py9C
X-Gm-Gg: ASbGncscwKu84TS0s3wdJH87q6+MoFSRBPVByaO26f4469IndTtPsP8XFyzJERCp9iY
	Tz3luqzT0fEqftBfCF+Tq/r7xky2WqnROwSClrG7ZRS8M4ETGoh5qm+e59wHs1LrARILgUFHhlE
	jmD7o6EaK8mnyuc7WFPGNKBLykddgPBiGsY/6o11BCekRFa8wwWMxvK3onn3EPMMqQsvfOcXVEQ
	wkpSbtacyWCNvut7PmH6DCG/yNRVjPjhpJQCDYhMZw+kVZx1vaa/eo1oEKIto06uSlhviyFl8qM
	0EeOdbmgM5t6jPgnG5PyJHt2LSDjp3gsD2reCVh7UN2nWCEJviLpmuby8zInNkZZkoFJlFQpC9/
	XZ9RAgcoYCqCC4Ojo5U1SOen5u1o=
X-Received: by 2002:a05:6a20:a106:b0:2f3:b278:eac3 with SMTP id adf61e73a8af0-32da83e4f90mr32307114637.48.1760397894126;
        Mon, 13 Oct 2025 16:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBhhcsb1aEwKee6Uz8WqMmDmhv+KWlye71kdEFyuGJdJ+boHVqUtpb2DUEbYRuqEwLIl/AXg==
X-Received: by 2002:a05:6a20:a106:b0:2f3:b278:eac3 with SMTP id adf61e73a8af0-32da83e4f90mr32307097637.48.1760397893698;
        Mon, 13 Oct 2025 16:24:53 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df8ea31sm10143431a12.42.2025.10.13.16.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:24:53 -0700 (PDT)
Message-ID: <8da98737-b768-46d1-a0df-19e01d5c4964@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:24:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Ensure entry belongs to DBC in
 qaic_perf_stats_bo_ioctl()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7yVJu4SQD_qKR4wmj4H1LdI3nimS_vD9
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed8a47 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyNJWp81KiKnRxZMCyUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7yVJu4SQD_qKR4wmj4H1LdI3nimS_vD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+fiNhicl3uzZ
 aktXKJXUZ/22YP3C78GAMYZ7JBFQ4wk/0B5cPhCAxTQdAP14GMy6BMCVcw6ekg2a1SJzA98Y/x4
 SfITA8Y2UIoAwPANfvz35idpdLBNtpZ9PNtDVS+LkKwcJeu1dBFwkJ2uEaGWiPeOCByGaIZTo+S
 PgqqvPNa9+yLH8mT55QLXN/4p90QNfYKTA63xMRJoeZ6BASI92Y7NLBGq8rtniTFhx4MLCbu/+r
 T7MwDRA1RwTFYKDe3Rrjl6tYT2v38OpuqOG5aymv+ICKcnvk/QcwI/4lDNzcsTSGxQKR7vg3UEF
 jb1fif8oia8stsNCZFAZ58TUuJ5qgs+Ro/EYeCekZUTOWWJE4jT270wDJms2jcF2vUjNpb5K5MF
 L05hYVpPGE9PX4b+d8Ix1td5iSZ+sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On 10/7/2025 3:12 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> struct qaic_perf_stats is defined to have a DBC specified in the header,
> followed by struct qaic_perf_stats_entry instances, each pointing to a BO
> that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
> not check if the entries belong to the DBC specified in the header.
> Therefore, add checks to ensure that each entry in the request is sliced
> and belongs to hdr.dbc_id.
> 
> Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

