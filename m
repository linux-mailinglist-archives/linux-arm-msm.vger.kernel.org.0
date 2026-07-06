Return-Path: <linux-arm-msm+bounces-116724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tlt8IkyBS2pBSgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:19:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E9170F144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:19:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oV4pdxOF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Dq/xkDfq";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116724-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116724-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC6963057B56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870D741DEE4;
	Mon,  6 Jul 2026 09:33:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6FF4DB541
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:33:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330404; cv=none; b=WYoALu+5e59c36NoFGTG4NZt8PM/yQX5I+EaG2LhVovEGTpHEbLC+2tlIZpwmouXXIQmyPE/7UzfLTxKZWyWRrkyKgdaKqSCjVrlwS3uz7qoE8Jwm61Smj6QFnUT674w+EBE+4uy+P7NCBZd6VzIeOMOzFSs1iniBgpoKqBkLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330404; c=relaxed/simple;
	bh=rS/tT4UyEIl+85LBso67PqHLP7F6BOYzmZCdyUtb3x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZzWYCVXHss5E7hA5hXW3qXfmMwRY688q7hb+iAlvsoEVm9IgzNa3Bkfwpf5x1G040ZkvqzGJJlMkLmYBYOIjjv+vHAx4eOCQbfdhrNR9glZxtur9duXn4yFLaNfgpbgqiI12yenxTn7WdOSAuAfooY8c5HFx8XHxrq+q7Hp2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oV4pdxOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq/xkDfq; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669PmWj184109
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=; b=oV4pdxOFkkgiwhy3
	KqQkRC/eNXZnrAUtWwLiMjuiM9z75nTKAlsexWfvJ06t8B6RMx1uhJ3n+CvmsGvq
	ijj3ukeTsKiOA9rME3WLIRqParkCUvFsqEPrM7NAllVPF69cpNKHrm7/RWwAT6kM
	vMg+2abWKTLmYA+EcGRmtq16AxOY8VT0/lyNrcjvYE8Iu/KXBPmqxB0UsElSBR3Z
	/QKljMdrTPLdXnr2gHXPBVEsuD31Zvk0qxhQQ62aXHKcLHuRx5e3q4ykx1HopZd1
	leEUczyCwW6zfkO30AlDmc8rEN5RBb+JoFUOWU3w7EBRRWhjz0nS5NRLA6eAMcwo
	cVsUTg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpg0wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:33:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso7563756d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330399; x=1783935199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=;
        b=Dq/xkDfqavyyNDvbKYPlxuPI4/doq7fNuC6zMOCLFM/Y3BGc5J1ELOOMNSUg7/s9co
         dOodiyQXrhlvYusiCQWbG+3M44zHkE/9ePo6O5DOOCoHlsXuoDEmzj5YGYmXS0kMjK9P
         SyFXxSiJjPYxQhr8ShRBMPq9I2jf37CJk+/Q4FhAzxMvhvgA38mJWLeSPgKyyoH+fcez
         qhtvq9MeQdQB9El4Tf6xbvYphlFzgXLE40Ac0OGe8KZXBcBuPORuNH0y+kZpwyTeffvS
         OVJ4YXnsLF1aIu7Wa0icbitPXwW3Z8wf6rkjUeJtyPvx4nRh3OCFEVK4WZ1d8/QRSiZv
         IAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330399; x=1783935199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=;
        b=Wy2Pe2AfY1kw4tFERzZpUA08TwE+ZCaqvehnS3+UjEs/2FBaMzEjPTdW5rWjmg1fQ4
         fGXQHdSK5sm0arnbdRGO3wUAIeK68khvSxwShl4A5tZaKaL4UfNf3MfzZUYszEcd8Eew
         OIH5g3eki3qttE9fwzC0c4KTHxRR5AuiJhfcrrAe2/IU0UQZAbz/gKE8VNQT5UGOonSI
         5ZcwBhrCkGIdwCZt5fq8ioCYGtBf7HrPKeUheXP7iS/KzYMwQ5ib9BW8ga36vPv8zgAn
         1wXH+iQyw/SKlZI3x8PbGAPrNR5EXDkwu8hgyDOkxUNx6kGVkgrRz2cHZ9eH8QoCH/lP
         HHfA==
X-Forwarded-Encrypted: i=1; AHgh+RrpL72Tu0kj6FIFsNQorMj+M3fYwDoCNz/UDOjPxYutBEvIGOKkrlrf2krk542dp8ePB1/sf0uctlHqi0D7@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbMihjoW1ZnSPRdnhY6v+71/4Na3+fReCiuNPl2zm+bJBltbY
	bSgdz4PZW7TqGrmA9fEre0hcmroRXeJXGmYRGOSFUhGHOE1UW1swelyAgdV+rLMP/+ogUUjXdxV
	HeSXXHjaiCqVCljv+bQZDyW6H5QbUgsYjzI5YMFqq6VSVrRaLiprZJTv65xAxGNBoO1AT
X-Gm-Gg: AfdE7clPGOD++xbtOmMPbni4lwJWckLn+7ZUnoiVmhQ0QuH187dhLKVk+4osnux/9hp
	dxyd8FWYqhanCmlRIUiL8ntLOZR3PR7hn66gin1aHUUEWveMkKyXLMWwGy4zgMCr9cKM3azYWwf
	NGlGZD1knTh0Pi4LpaKOI34FSGi4pPyimuR9GxGLcZ3nkNA3L0tDIkcBVyYfX5NHMy7za6i7p+y
	McafedD050ScymDPAmtLdbphhRfKG+SI1jBCWSaDUGCPKdVEO3PR9Ls5WLxcIM1u7MbDowaEOUI
	FmKgsxwvzT3URemQx6Bp+wBB9zVGevzi3fB7n0uf7nmRpstAtobJJV1fh8DdCTJPLdQpXyf140W
	o4gpzxiyEbtUWJqY7OcV5WffFUYHV8kOmrKs=
X-Received: by 2002:a05:6214:2503:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f74caaf417mr106701786d6.10.1783330399119;
        Mon, 06 Jul 2026 02:33:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2503:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f74caaf417mr106701416d6.10.1783330398707;
        Mon, 06 Jul 2026 02:33:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9e701sm3807545a12.21.2026.07.06.02.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:33:17 -0700 (PDT)
Message-ID: <14c366e5-f030-401e-b51b-62d833f9dde9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4b765f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aSm4Qw26VvBTH8LwfRRQi6tTQXOkccs4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXyzzVWvJwTgep
 5Ft5pcKxO2qP2ly9gwxsVsqa+pVDG/KeLE7/APKKSj45izjJtkSWweVV7UnltjqheAE48e287Rf
 Vt5Y/b2Rj3hMHKF1LPFgjRdr1CYRvAgyhlq/jYHdFI3QpTTLkdoVTxxup3iNI1t5nxvshscUhFm
 BOOXPN+nFe1bFo2dN/2OSEtha2vVHqgKZI74k9dzbFeDeNelNqjDtxfxcVL8mZBD5C8bLUM96Yz
 7cIvmH7wLDfokATSskQMvtqyouTU6lhDHC3/b/8Vu3KVdodlHpO66Q5NofA/+kgxu9q2LiOLCBX
 5TUxf+UrVWtS3xbVZov1VWUndAvaoDTckREVkEBq2TKti30KXbeWsquVkjLYgphWTiFm/LtqwyO
 oHcyzWMKp4Xl6eaMwQme5SJVbLlp6qIohmhAHRYeWa1jl68jgl4/pSbjtdzcLJ1BhVnJtsUd9QY
 RB5A7B2ZRVazV0YzGKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX4q+6jJIqIcgw
 pYpFA2gMf36kMBxbUouEWRTeY84uV+Hlv/zVPY+DlvWMS057ETMpEQsTL2HfzKIA38KEGPt1gCZ
 ehL7v7Ivij7Sc3aTfYV9xWtn+LlJLuA=
X-Proofpoint-GUID: aSm4Qw26VvBTH8LwfRRQi6tTQXOkccs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116724-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:quic_qqzhou@quicinc.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2E9170F144

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 7aa9653bd456..19eceecc2a19 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2601,6 +2601,49 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";

Let's match the property order of glymur.dtsi

for the contents

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

