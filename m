Return-Path: <linux-arm-msm+bounces-104115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGAsJHu/6GmEPwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:30:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C1445F55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 309343009CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AB83D3319;
	Wed, 22 Apr 2026 12:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKj2GcBX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Crs4+Zvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278128643A
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860716; cv=none; b=UkDr13tDOcS9fAzlYyan1pe6DVGjU4ENAewg3VIbF3h7rWq7r5CHMoMvmdKjJraqwre+4++O40kuSSJbknCgFOFKtqY2V+43eYhRSsPQOI4ckHk5v+FLBD8Am+1o6qAc4xzV25nmsazLawDrX09vtnNZxbZQaSoVKq+Qqu/jqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860716; c=relaxed/simple;
	bh=dXMvBNPMNkVwN7WS379utjk6WNhTqMCoQBD3r1t9gWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lV0vJ/9jPiDZ4r9gkcxXUatYhDovGxsUMcZ1kwvYTuCVeRLkAuWlVmxqAil13bfX784Pbv4/HICybGbCzVzwM3UevPIh/ANMicUd3K+cGh2lXPcECduYh8C6mpqDfBStoYZYPo5Z3Da0A802F5k+h7mHI+g4ypSilxNc4JiY2Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKj2GcBX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Crs4+Zvz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MBm1ZU2935195
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1L2jpvcynv1ARQQedBopx01D86Nlmh2mos8lhgHfYc=; b=GKj2GcBXooSc8VjZ
	e8xjOzcUczZQzgmYHX+vSXEfAHuNoNFgkNs+kFehBfDO/W3XqHLc7nepKrkbRR6T
	Ni/D/xA/3nmBTQihqJSNNZ+fpEL10opd58QHWuVhQbFbHbbvUAjc20vTWW2YyFxY
	iQc4M19erKctUOj6yGBCHRtt8jbV3YQnO0SiKdGF1ln5Ekp51cLMOoRYTniUJONI
	oKpOt6WpE9bLIAf2wlVHGa6UChZpC2U+lyEhHWorojV3DRwt8pY7VXLPKaOvC6u/
	H/5wsSxxYmWNd2Ejt9r1JI0XdNQaqlwJhD2rfaTyULmbHhgcDlmR4ObDJOvuhUos
	usTAHg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkb8un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:25:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f1b94ac9dso9555401cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860714; x=1777465514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1L2jpvcynv1ARQQedBopx01D86Nlmh2mos8lhgHfYc=;
        b=Crs4+ZvznAbI/d6s2wrmfU/+4q0pVDECCUKG8qhVVsc3y7Z/pA6GRpXZ4xn7c4O/Sg
         lqgbr+ty7VwdpnQFQio/6/ix6ICsaDzeD2ZGGKb3S0+2RHVZn/hUHD7TJBDgJlNrq2g3
         z5m1Ir42RhBgqkmx5x51Y5dUizglQ3MKWeXJtO9R3+VO10u8OeZn3PlP3HBUD//j8wQR
         g4w41ll0+szc6ly3xPhqbyfOScjQSUXOwRpnTkMHEAiNi2rFSfePbi4oJKaCVYoE2Yof
         FBdmWrM2XG6OeqsABxNvP4nABXvi8MhGM2ZPjtAcVnlAfQ1czXofUfamD6K3SyBvPo3X
         nSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860714; x=1777465514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1L2jpvcynv1ARQQedBopx01D86Nlmh2mos8lhgHfYc=;
        b=YTMaHp1kib85N4XM+Bcr8TWRSx0bivdRix8FcC/5N4cwf0Fn4rEGTrVS71O45XIMZ5
         SbsjQD8SxbZFAyYO3wARx7sKNzGHfwfCSB0ZqGb6Xkt8qHjtNGRGX1ox7reb7xRxz9lh
         JnFxMXzLD3s6vNJN6pGRSZLzvL4m2ZAHn6O3W7CYX+2NUpsXnwGRI6byP9FfZRdRvgMH
         rMFwmZvL+UVB9ZEn+9pk226XKXHaqlbDmNBeAeGePbYTxHpzkxngOYwPXkx6N+1HnHuR
         MpqrwGZSjoYU4wuiZEd0l9IFkCRbJfRHCQWvCudBbWpQoFQzTCyppZC052d8LOxvkpAY
         evKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xAOirv1AdRNkOu6NjXKoB9lbJbNGcIY6YkmTaW5zpONPVpRz9Ihvg/mD2qCWZjCjWTQgwYA9ODAu3ZgpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZV60U/jdc0XOKEfNvvdLogE/4jHMt4k9Vcj6NMNgnoqosXwZ
	8L10yj/RkAd5BWETezzuGda3e5wAd95s4jc/u0P6VrAMarNM3OW4zLJF7DtEsBFw6tKt80qVAjO
	AsPdKUGrg3gYHjl/VzQd9UNGnLgwovUFUw27vUwzkdNn2+P8uGl8hb/pRvLvBbsiW3gzp
X-Gm-Gg: AeBDiesSXxIJksO0BaFl6nK4C1iKTnBGpwpZyt6A/DdnCLYgAv5/z/i2/hvOL9r0yu/
	UHPOAWAX5XsfTdLOpRAD+5UdyW33sKhhk6gbLMocBlHlnPDe1cDf0xV4VYxb9+tqqFAssEkzAQO
	pc8ZltXMvwcSSwtO3ZtqyU24CkL/YCUQHfrk+fz90Z4ybnwKISeFexFdQibPi0qgi7IOMvQaL/+
	She7t3NoEKUtybCvbnCgXfHbpFZgQ8EWmeA+SHYDpMDdaRb6FHEIsHh2XKhqTqva2tQCMyEIxr7
	RBMh1RLjcxPU8vf+VHlVE3CnVIaJRqUXM3mapWnjx6iFauEdE4XH4VMJRumgxaneIOQfg/WtLiD
	iaQ0/qld1Kafzb9sRjcf5M9hIReke4ESly0dNmDtd36v7ji6yzCBIvVdFD+t3swLJzzu4EE0S1n
	QOfjFIpe4Sj6oWmA==
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr57408971cf.2.1776860713819;
        Wed, 22 Apr 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-50fb9a68ec7mr57408621cf.2.1776860713403;
        Wed, 22 Apr 2026 05:25:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045898sm537949866b.48.2026.04.22.05.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:25:12 -0700 (PDT)
Message-ID: <faa3a6ef-da55-4747-949e-64bbfb54ac0f@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:25:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: qcom: iris: Remove duplicate
 HFI_PROP_OPB_ENABLE entry
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <20260422-iris-code-improvement-v1-5-8e150482212d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-iris-code-improvement-v1-5-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nKvsPVoR5UAtnoq10gOOvDeTUaofNLm1
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e8be2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ha2Z24GXLA6jdmDSZ1MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nKvsPVoR5UAtnoq10gOOvDeTUaofNLm1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyMCBTYWx0ZWRfX2RZC7DbtTpJE
 eVWjBIPZhuEMhDacNO9Bf6CGBSK7xckitTDPx0CBkoN1zpekhf2Hib/qsIoy5D4fhABQnA0UHEh
 vuaDOzBpzTwCs0wkvCLnEkPonklmwBFXrZqWYGINly8tn6V09A5uighyk64Fa/qZPQGv8EGnGy7
 HaHpV3qXfk9uqNGKOCVmB4rsFLTtE7JpZkmiu+pNThT1MnPNYmpaInT4TjXrXJFmOIiMk5AQuz/
 2+thyIq3yiiBKOdACFuOzZ2jHKPFdV3DMMfAaM2rbr/eUuy4wmJ9wErp3zeCuR30N1hUDsLPQJF
 0Z1x/uKkC1LPkGfc3olUBXgwq29vPK0j0H7epuurBJB7e2sALZNntgkF43lTazB20yILa9u4a8q
 CqLibJbZUrkrMN+EvB9A/h0UXObA62YESNqU7KUsqE+fspIVcvMpTwQ74i5EZq3Eb4G1Z/+qArA
 cN3hmRa7VyxuKkbHb0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104115-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C4C1445F55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:16 PM, Dikshita Agarwal wrote:
> HFI_PROP_OPB_ENABLE/iris_hfi_gen2_set_opb_enable appeared twice in the
> dispatch table, causing the property to be sent to firmware twice on every
> config-params call.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

