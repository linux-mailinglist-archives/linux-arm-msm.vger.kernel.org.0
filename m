Return-Path: <linux-arm-msm+bounces-90061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMBoCcsNcWlEcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:32:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC415A942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7656829CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168833C0090;
	Wed, 21 Jan 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxIJUbuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1hmfkM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF134C9A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014811; cv=none; b=DHfeXgmlpKZJ4PblnqTno/yTSgANKJuqmSHpizLLFuNP4UOVunJKWXVHlXlcJP4rxYAcOp/ns7McBW2rKX0wN6tRcrc7k47ZBDGzICDwUrFqoCK9q/Eed2xkstJDbcVBD2rZTPKY3yIxYzCc/piKK7Vy7HjmDqmL0T2I5JCKtkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014811; c=relaxed/simple;
	bh=Rq19kCLiLbjgLUascNi3uFHr/okLMD+Mut214LcoebU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5/9bksagBTEiQf4ifZZS3WpIy+QBQjaBOnJLs1UVZIL25pIqbPOsV4Pfzol427Ji5PguRaKwssszaWcAO7pt4ZS/Og1yeoBDBwX+mlHvqjUdaP85zSHbW2XE3Wte28hJbkW7igYuIHe721pYmD+cVCM4RbJcbWiD3Ko651WtJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RxIJUbuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1hmfkM6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LAmse63315761
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=; b=RxIJUbuN5E5tMSZX
	qv64isG/bBFQzWvAci2JxYT0lrGHH4+8mRte9Tmlx97SLRJk4xCKhkRhJrc/4MLZ
	2VQT4rMqYubJL2zuDbX3u9Ksjbe/SA8pZcwuu9s2HvbSrJ824zWUgKfvGgxt176a
	1ezZk3ozn0GEIsVuQCEO/+ktUZ5ozA0V/53Fc2Gi3tXV24tY2397KoOf+T1MuNaC
	i2NqtPq3vFzAvT4KmtEDVakw5ZrKQx2TFLI7+3yc6ItVbt+8B0DfkymY/42xDpgl
	/7Vs9CBP8kD5/lwCETrEMWoBUuFrr/bbfpKfdGBdN7Za4YwEd0/ScWChFsqgtot4
	UlyvKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btwcjh8ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:00:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c69fd0a87bso2281485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769014807; x=1769619607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=;
        b=h1hmfkM6/8Y92FxSQfwlDOuLtAzyR0jxa0/j6r5+I8s1JkBzRFnzyCET22i6QEbTny
         LfKTGYtB5NHnvHD3rHyswWL7m3meyRbK9ziH9hkIk/mq52vu6QF0fTWTUSVO3V5m++up
         mQC+H0OJocyMJSQQQOykAdlwL+XGdM+GQNOOfK3kp1cSeO27rKDynh+oN3x89A2/WQNd
         IeJPzV5LRJzgo1v/UtDPRkph3Z4TuOE4Agqd4mkJKM1hDufitVrLqHDNxBruVRBH+x1a
         kfIAX79tWCJjBwjQGdQgLcsclLBNkFGBlbOemIiGnezihv4uazqmCGtK/pwGhc/yJua0
         eTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014807; x=1769619607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ib7kzlkMpIuGdkzj3jtoMhVY/pgx3vVg09JVTXE93K8=;
        b=BR5qMYxBRKpfNG/636JVQIaO3zqumTFZ/agFbBmvqaW8vY0aytfGkiA5SILaeg/Bkm
         Ud8xRWBMHB39IsGqMKqKU4IyYrADxhAPLaa605Vc6Bvbp6MMiBxq9lBRCrNg7YAINW0a
         3LORKEZY36IarKqq7hLjG3cLARg6CJEUeSF7267ujVYhdcmLMM0IUpbdBFExXvgQ5oYW
         YJeYiL47Vghs6RiWRC70ImJ+uTDORp3mTj65JFBwPjyT1FjqQY4x0giKJCPW28EXcDvu
         1n1PrWQAIRrK+yBgIsX73AMCqiU7gJgfR87qy266o3KlOFS5PB5l3pTfaL/vtiObATnK
         7Y/w==
X-Gm-Message-State: AOJu0Yy025DAywDTqhrCpLVJet/OOu9RcfSpaqZcWiYm7SAPMVvNO/wy
	JVPFKFjtxc6RIrGKyY0TOrDvV1L0QLNoWdKQYvd63TD99RBr7tY+I0QM1oyQuSBos9jX0ISiFE6
	iXdml/gMwvjDUhc8L034V6719Q3BnSF8TQxkWgy9FDYtJPxVvYMUTGSGsCmyc86Di9uWF
X-Gm-Gg: AZuq6aLQtVpFGUrEbvFor9JjmLBbBTpy7QcBr2ZcDcm1vRi9efJOl2v5yTdCANg2H3p
	OLCwqMSAKnLK49xjnXxEPKXvA/2oZ1oeQWWecfOu19Kyhlg9GFzeGnFc5Yo+h1/65r5nc+Xohvz
	oNYx4z9wV6E16Us2/bzA8Bxinp3zkevdgqU1l5rE1HexdqcqTWrYQ8g/NDPdbvO2ro5/AAfd4mj
	0/DOH4zc0L0MAoo/l8IGzW3A1PoWRhgzEncKffxo1NrsU5c1LImK4G5SSujMxiX3HTFDXoUK7w4
	BATOGoB2PpiCMszHi0Q55+5sjsbMWABiAZJv6twsAfbea0C1uPz3JmA1fPg77KmkdOr+t7mRqoJ
	K8tgGTlrWSn7wuFjwIKV4YuPHYrL25Q/yvmiFqyGkAXVrbdtw2Xq2porDnKJz/GhOdqM=
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6a6799061mr1771910885a.7.1769014806054;
        Wed, 21 Jan 2026 09:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:1995:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c6a6799061mr1771905485a.7.1769014805404;
        Wed, 21 Jan 2026 09:00:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a192b6sm1582377366b.59.2026.01.21.09.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:00:04 -0800 (PST)
Message-ID: <be5d67d3-1909-4a05-a4b4-c9efae4ba911@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:00:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5PQ1NWr542elOFvSOupYWIzWpKYsrsoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfXyUWPKy1XK9Zs
 uBPiGfJSEc4Rt6kphCVCYZ9YcDifLl/3Na/gxnE3UAY50iXmRzMqQNilpuQ1V8LgtHtooNlj4TR
 dUk9mkd3Qpv+AtF1YlAusL+o4OSx9qolu/4QnxP8jBNZw65OTc8CK+66m7T52YUoDHcqHAVDKRF
 SZG8/zPAzzeBjygA5fUkJw36gzyjQyQhWJyUU11rpZZc0N7WAi8+QW4LKD+HNPfy4kDcS+Z9cq6
 boSI5IUUqXddQJtiw3FTCe2SuRXPQ2wyFEYtQDpTyQMiEvmTB2rZ3NBYdijq/1DCdzn9/DxiWdT
 bNoG1AKzRMZ4pJtU0dTUpYx3eOWvz4/PmjsL5zHWc+h+A21yUbC3yQ7H6WgbT6zTp72DZ8IGMRB
 j3elk0ZXwbo/BhnaNf5BtDYfFI3m5tCoupf9diIMo4W+5iwZ/TUo6bxy5X+ooKRmt85NARwmJFV
 fNS4dOTvQIAU0tWMPQA==
X-Proofpoint-ORIG-GUID: 5PQ1NWr542elOFvSOupYWIzWpKYsrsoy
X-Authority-Analysis: v=2.4 cv=JpD8bc4C c=1 sm=1 tr=0 ts=69710617 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=I3w_ynYpeOqJdckr6GkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210143
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-90061-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,cosmicpenguin.net,arm.com,8bytes.org,linux.intel.com,suse.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFC415A942
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 5:01 PM, Akhil P Oommen wrote:
> Adreno 840 GPU supports UBWC v6. Add support for this.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> << Trimmed the cover letter since b4 folds it into the single patch >>
> 
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphics
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
> 
> The single pending patch in this series in now ready to pick up into
> the msm-next.
> ---
> Changes in v5:
> - Dropped merged patches
> - Rebased on top of msm-next tip
> - Link to v4: https://lore.kernel.org/r/20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 30de078e9dfd..5a320f5bde41 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u8 uavflagprd_inv = 2;
>  
>  	switch (ubwc_version) {
> +	case UBWC_6_0:
> +		yuvnotcomptofc = true;
> +		mode = 5;

Downstream agrees (and they do a better job of using field_xyz than
us this time around, I'm impressed)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


