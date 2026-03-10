Return-Path: <linux-arm-msm+bounces-96664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE4aAOUksGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:04:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EDB25149C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E10DD3584085
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A144B38A718;
	Tue, 10 Mar 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0OgBRW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hiQy7P+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BD38AC91
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148379; cv=none; b=bgfLqaDsBZZeUqXxToUlBASI8ncUnzTwcX9GlBrqgRt/wEMQNvNeL6M0ZKuV22RtDYq0ygZqIe+bgQoNfSiuyOAGbBjoUKO+MLf4u4iYVdwlC319wZm5XwcTOfcnGoaE8KmcnR8HE9Ht3o5JOpNWzF58c0EUAs5U72lds1ByLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148379; c=relaxed/simple;
	bh=kqR8StKY9gPtFVZE8MTGyyw9pd2MeOvNSDrUH4L/DX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYseZMZNd1xMSJzRYenbmsEQTzvIBRv8t4oWLtGtTUiABRpVGyCxYRWbXpkOt0q+dLShnooTJkm0FBM+XJSBGatGStaLvFwqO1FKbq8DPBafQlksGA2bTjmW6fnIh+hDqywunOXzAlHuCU2iv7M1ocZj6LHaLSAr+vzAy0VmWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0OgBRW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hiQy7P+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACapOK790202
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPwKz9eLYQdHUXIO83LJugJwTVZobApTJtsv+MC4jxE=; b=F0OgBRW0OTgeLbyX
	NL8ziTwO7GSbC540v6G5OAScayy21O6zSkI9hsNWzF5J+rUbcZW1HBSUmB+p/vKD
	bvOOpQbzlUU17OOvftXMn7S90Av/LsULrV2va4Ae8dTu1slOeevO+TcmH7KRHLZ8
	Tx0OsmpKuRUsvQkfsY83ZhobuK7u0EW05vIHbgxL1LN+bbMrme7tVgD52f5ahXg1
	OQOfozi1EZdV9vTfmkVu+bOIMrUxtQc0kuBmVH+vM8I0o/Z9KFOxp05+kgtMvwr6
	resOqr3Z1Rx6ofBFijfMAR19y8ZwfdMcEjGURjIChunr3V6/mi3ee/nRnpWZNuQL
	P/zIHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekuyv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:12:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a04e9d4faso47016176d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148376; x=1773753176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DPwKz9eLYQdHUXIO83LJugJwTVZobApTJtsv+MC4jxE=;
        b=hiQy7P+rB9Alleb+tzrKB3wdRLhgtGZs9/MXxJDXan/GMwh1Fce708vmFy6hCE6LRs
         tR1M5g0f+WokNw4OxTFNvOi9fUeKQb/jpw5/3Kyu+oI5+Y/eDDe4AQ9OCkq4yw6R4zYU
         7phrXxx9Js5cgsdxsLS1iIKNXmZJZZt4xqaowDYbPljcpxhLwIlva5Fyg58kBfddARsR
         EiGp9umktJnSWoGYsdG4XKu2uO6YwvQQxa4Hvh4s1jY5QVrmyaiooQL3cBsEudIVhwF8
         EXLiZlGUojur3jrHVJ2vXMbSiVPvEtgWXyqWC0MhjoV9xU2eo5YgFCCHqpuNK5erak8D
         qYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148376; x=1773753176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPwKz9eLYQdHUXIO83LJugJwTVZobApTJtsv+MC4jxE=;
        b=g875W20MRDGC9ljv06OAssfdVTAqVTbivIkV0oMDEywdwKgpsyvbT6BkJbE1WclqVr
         CkJXjfx+kMdfTp9VPNAThIYyRNjiYDUKGYvG8kJQmAmSO6MtTd8kWYceSjlFNgD00QI/
         aVUpq2TglXy5w4nCS6RX32cf4aYKzCZ17THU8n0FjS3CjOlugnI/ssxW3oEK4nzytAn2
         RssTG6CGqMi6dvmrqafOk3N/E7cG6nTfgBYKTiXjtF6thUEMLadOz+z4vXDCjLb1oqKe
         egpNBuo3ZeCRqGLeuRQieVDAZErfYgCNFx2slkc5VDZGYN57xDNOAqsnuqTyqYsEtVZP
         WsDQ==
X-Gm-Message-State: AOJu0YyhlcZD00ar0SZ7t6h7c2/dmRZUrLcpODzT8mWiuYHDEW9rijhq
	6zKIsR4mUtBhPbndOgaIPs4LeBypfurc2stqmEcLVbO4nSUNJpcBQ6HBikXN3MWK/ZFKmo0NJ9N
	ICphp5HUpGkKk2Yq6JyObXtB0ju2VRGqw/Ss2ncLcY196bSAIzca3kc84deT1omxD7SRa
X-Gm-Gg: ATEYQzxPu60BfyJNrLaoEhVZBEsVvYT/jqwPh2NC4oYTyLaUyrG7PxGVjJK6NvpIVw5
	SFc/slV4CvSG5R/AWerxtADt78BbeTyP4urxD/bAjgZg3H+Qh3VeiZEueoiwcvf5tXViD9J29nG
	N6aBpPNiAn1wKrSoiMmbqx2VhfB4QaFyPMIVutusJHeIpEFr7eADJ/BSG7j/6VyAGtlejr5RA4l
	TutW5/78nKE2oL/OiAshB53GKWbpi0m+7p/SQHCt6SwVlhVXOH8hGq69X+cfA583H+iixpX7od3
	Hn6ThgC4EPg2qotjC3n1PhuYtiOUksvGWBcASFGacSTc7r8uERc1QcyhVDsJCOYkcHJrO68Nt8B
	GlnCijiZtuiqTCfmlAnXHa8qXlqPiFoq7nFSqum6VVJp/hsSKLR2I/IPsPUrrEXirJ9pWOwgdQ5
	tshfs=
X-Received: by 2002:a05:6214:8016:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89a45d4561bmr91222286d6.5.1773148376660;
        Tue, 10 Mar 2026 06:12:56 -0700 (PDT)
X-Received: by 2002:a05:6214:8016:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89a45d4561bmr91222016d6.5.1773148376160;
        Tue, 10 Mar 2026 06:12:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f15d532sm489707566b.54.2026.03.10.06.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:12:55 -0700 (PDT)
Message-ID: <d7998d09-145e-4651-9027-b06ceb87860c@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
        lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, neil.armstrong@linaro.org, krzk@kernel.org,
        abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
References: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309063720.13572-1-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kem7Ezpol-bIX1BnIPq2c0KTR7foONML
X-Proofpoint-ORIG-GUID: kem7Ezpol-bIX1BnIPq2c0KTR7foONML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX/hQ6AAkhpIjb
 w8fk3iQC3c2Xn+8of/jFIfRveowMnbjkJ0Cepzm2WFDsEd4EqSAxwJQdZ7a3zNYxQdCxr/Fn4PO
 Ng1NVNTdjCZk7yYCqp7BPVigGIeC88BvrcQpsGnxLNB4WpJbjQZrKUOVqw9IO9wY9EVO3A6kicS
 +a6NEHSRM5kM74trkg9x33ohThGSHMsS4AReN43BA7+qYSDsfMr6omVvOznKMlHryM76EKaoD5X
 cCMidkWxP/PRRYy4lbcxK9CG9tbjVZA1VtbB9n6EDqR3CyuEox2WXqwW9vNgPA+NGqB8I0uJeGE
 yeI8GdTP6j8h0tyc/ebZ5HIJTJRkb1K7yffGzFyL6PGxJffOugob4VIwozMJy/Ht4eyB4rO7PxK
 shvHZTZr8BSGk1nizyLttt6WpBo9YYHLsLpsh9H/kCnP/wuf5YIgB0j2Nk/a35Ttr5L1gZjZkDi
 HzVhc1VAXgF3wFJdqcA==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b018d9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EmtiIJl_oBPMN_jmJGIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: 80EDB25149C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96664-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 7:37 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> to stay at the highest level. During dpu_kms_hw_init, calling
> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> fall to MIN_SVS while the core clock is still at its maximum frequency.
> When the power is re-enabled, only the clock is enabled, leading to a
> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> highest rate. In this state, the rail cannot sustain the clock rate,
> which may cause instability or system crash.
> 
> Remove the call to dev_pm_opp_set_rate(dev, 0) from dpu_runtime_suspend
> to ensure the correct vote is restored when DPU resumes.
> 
> Fixes: b0530eb11913 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

