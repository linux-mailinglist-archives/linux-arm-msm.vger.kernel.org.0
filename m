Return-Path: <linux-arm-msm+bounces-100739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKc1G4NLymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:08:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F8358E00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F2FF3007295
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673DC2D6E7B;
	Mon, 30 Mar 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNYYmvQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIn4IbcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72C3AC0F7
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865106; cv=none; b=o94ewx8NqH8ANvaMvZFbGvypVlrDG+26rXMxidfCnyG+VQYBmqrTvR2uyH8CBeTvtvCqtjzqv92J/d8U8LfMPwgBGrwS7CaXh5qbkTiLTvx/GzdnvoVvFwXu0/NdvciFIYConj5PKW6BBeT64VLdxsTArSmFbbmcJF++Iy8wBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865106; c=relaxed/simple;
	bh=tkSZD2K7DdJY6frknv6PnsaeA19NFEYn+BZRQIyByI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JSSJcHtx4bEZjgr0SO1VyYT1+NfLIcuOnVLe+v2XPZEuwjOOwLwhjsQtEeXYfetm4Uv9g1ZU4r8mS6JytRWLfAr0BG/4QCfoAGBpfmjIl32JgVAnfJ9uQrPSZ7RtlDjiwX0gIrnh0p3J6/0B/uroQ4dGOOEdKCsx/aDeeHVQNTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNYYmvQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIn4IbcT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9Wals2271127
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBY3cxS3DbBsaQF3TD14VLqct7YSsXHc278ExE899J8=; b=RNYYmvQu4xspc5K5
	8f13x/xm9eOM4FFsC1zmgZOXckDY3PDNdcIkyNxrFt4zLfRZ10S6BUe/SHZ6Wsyc
	AlkitV+yF/dKYbLVdM9Toh7Xundobxu+kK64zlEoFY/i21cpAxSUDkLUnVx5YL5R
	dBDlFZ6uOf9ZE1kh9i0z2uz4jIS2EVIeHFTVPs3pPBQYSpFqrN2cIoJtG8+13Ws3
	ZzZPdP/E9IbFUWXUIFNKy8Qm8SdXTJwmKUkqqh39QVmoDFSt5K9XHNY6p2JZ4WSi
	x+oWt5QjGd1MQcoZnihc75+jXp2qOcQgjwJu1OsOaK+EnyBXlmF9FEwtcU5lHfaa
	YR+GOA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3jfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:05:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a016b99579so4882626d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774865103; x=1775469903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBY3cxS3DbBsaQF3TD14VLqct7YSsXHc278ExE899J8=;
        b=NIn4IbcTsbvv+wnd1UQ7mkhbi0frRLq0uS7Qxk94N427Fg+GLUuE+OcZVU+5xNv7+x
         jd4Ojzca1ke+3DXY4n2oc7n8Jegh5ESz+pnCywfK3QORAorXCE902h57wcjiKP3xbVBT
         ypGCUwTlQ9RXKivf8hHp66ckLUJ2gyC5stQYV+FDVrqZQzgmjtqkmffdXO3XQjHDiSmT
         7vK8YX+7zlP2+lfU0cIo+RiHZn4mx+9KYEMFZFLw9AM7RyYimjqZQ+FgNzDANDQNkWMH
         Udsuha60GfyXiMF7oje2OizcntEMBHnHurh5VundnbUiaXkvWY2XwBWmoHji9k7Z5VqE
         zYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865103; x=1775469903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBY3cxS3DbBsaQF3TD14VLqct7YSsXHc278ExE899J8=;
        b=lWQmwPqJxs2z9GDv9LNosXwFZN1gshVEZlycp+n7TJEd8QxFDmIL3YL2LO9ojznlLV
         Ny+6/+2Qswa/4uNH4W96UP0S7ccYQRm7WYCzzZCIwahwlGGPQ/njcNhA9PpVybvxQRvW
         mJarw8zv7mZEc8QRkG3U42j3h3YOO2eOHbAU+XvTwF/p9PtUetGC2RXT8GuAWRuk3GSr
         Tu6NO5xv4EfZ/5GefGbtPsRqd0+FbXsz3su0h42QQbShXuugmRgCr2iwZBVDHkT8MxHQ
         enVXONEPMLJ3Rqa57A9YdRh13AkZIatD5lWljAiKcdT2kgZa+Tu3UeN0mWFyiN2ik/yv
         wUVw==
X-Forwarded-Encrypted: i=1; AJvYcCWhwCZldn+RNOEmr5Bh8YHUvyjzZFL3ASlTnQmTHIQcR44VIRg9f01lzX8UAPOh2IuTOqYcZ22Y3fBjziEA@vger.kernel.org
X-Gm-Message-State: AOJu0YxBnFqPNuWC7vMjBv4aDaROZsYVmo2rfuCThdPKRAYlc7KYGH8t
	lScHhtSCN1bDs1RzSCcGq6JvbffOO8mR4i32g/WUVNZYqqiqBAm5jRbkBHkmUazVGz2/fNp6c4h
	5RhMn0R7SQjQ57DiojicFxiKSy+h5sWeKYBjisN+6Ls+y3o+ec3Dr5iph8rzvjUTm/atO
X-Gm-Gg: ATEYQzzHI67uEkGca+3wvIlPA+y3tBzKw/QvkHNDp1huQ+0Cq39PsAMiseZBi4Diig2
	KjKlJl/yjZA6Cl082GsEfK2AeEkYvwdM/YpMz8FrLCIjcSIa6bIOP1glI4V9ky6z0p9MDN5rEIK
	kfOyQIkCIiUKPRJaiBzCneDj+4fsmSVbXNntSkocwhxK/HTRE3TWreYcDHu1Isw5igShVM5ZRqK
	8uKfRWtg7SiTKO4e1jr+r+MgEaNiOKyrPiPAukDoDP2WyEH3qYHjQVB7dclOp0/SNNb/YOdeijk
	DQ1Ba5vN3Ly/dvNmnNCcrJYX995F+p/hP47REygKlO4IpbO142zZDuR7EJw12Jt3n3eUG1GtxJR
	3um9ZyX3HsFYjfMKM0AVhepWZrYNgEMrecuHjFBFdiTPI0ICP5E1O92Ipm/qtFq1gOWJmYV5+ud
	r1QeI=
X-Received: by 2002:a05:6214:2e88:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-89cec598947mr95913846d6.1.1774865103615;
        Mon, 30 Mar 2026 03:05:03 -0700 (PDT)
X-Received: by 2002:a05:6214:2e88:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-89cec598947mr95913516d6.1.1774865103127;
        Mon, 30 Mar 2026 03:05:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e4395sm261709466b.44.2026.03.30.03.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:05:02 -0700 (PDT)
Message-ID: <30aac663-2483-4cf6-9376-ed9508d62997@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Richard Acayan <mailingradian@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260328014041.83777-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3OCBTYWx0ZWRfX8JQ2aE+U3B7H
 MgJsZ5WdNalqh+kZLYVukVqgIBi9x+mKWWPXJJiEMmI6Yd+SoiZ4y/P3Xg+fs/FQ0mVBK9YySJF
 1GaEDRA8m58sVJo70MNg6tXicqgDn24yugD7bU8QD5N172/UEvKSk3IutwZpiQWNMWazYoGLYWR
 qhKHuTsEgzwRnqtu5gBfUJgkD/vDVQBL9Dr07VHw6dyXdbE1Bu9HEjr+JThDQh+31igg4GzzzOG
 +OSvMAdPvLXPzMMEq2bwxRBVgPRZ+HEHJZQ7yxw/KloaCfkYMtF36gFapF+jTwWIIe9ReWZhZ6M
 lewSp7v2HDo9nc8Tf+hBLqd6mqDUsnl5AlRJvoUj06YzxQc30ix0kURb+PEAiZg7QK/OflcY8Q9
 4mq8GkQaJ4WF/WUyIv2y9SD7HPTCU/gHLwZ7xJXVvGENV0pjtrr67XxyYa/2D2eJ3ctdaC4R50j
 x1w7DPTVyd/6S5QfLww==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca4ad0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=lVURl5kSPPj-3T30F2AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: ZCnE4BProGGBrhlk_438q26dkBVp-DB_
X-Proofpoint-ORIG-GUID: ZCnE4BProGGBrhlk_438q26dkBVp-DB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300078
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100739-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,arm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 771F8358E00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 2:40 AM, Richard Acayan wrote:
> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
> the first 6 CPUs are in the little cluster and the next 2 are in the big
> cluster. Define the clusters in the match data and define the different
> cluster configuration for SDM670.
> 
> Currently, this only supports 8 CPUs and tolerates linking to any CPU in
> the cluster.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
> index 3d072b7a4a6d..46c1e301f6c8 100644
> --- a/drivers/thermal/qcom/lmh.c
> +++ b/drivers/thermal/qcom/lmh.c
> @@ -30,14 +30,17 @@
>  
>  #define LMH_REG_DCVS_INTR_CLR		0x8
>  
> -#define LMH_ENABLE_ALGOS		1
> -
>  struct lmh_hw_data {
>  	void __iomem *base;
>  	struct irq_domain *domain;
>  	int irq;
>  };
>  
> +struct lmh_soc_data {
> +	bool enable_algos;
> +	u32 node_ids[8];

u32 clus1_start_idx or something similar denoting the first CPU index
in the second cluster?

Konrad

