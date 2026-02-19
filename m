Return-Path: <linux-arm-msm+bounces-93434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE+iILtnl2nfxwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:42:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720A1621AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 586BF301060A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE6B30BB95;
	Thu, 19 Feb 2026 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQcXcMC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHWD+NO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA51D305046
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530168; cv=none; b=MA+bem8g8LDkS43ssCv60Ta1mzHwr1/YEIW3y9CztIIRb8xXRDnccO/VMdT590Y39lU8wZZr2+R/J0MdJroWblNKTO0nO9decW+zVjLjnE57zSLdN778kbgm4CNNj1BW7eNdEHKW4mFEjhVXJJhnSjwVbEQLDghYbumO+fqSZKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530168; c=relaxed/simple;
	bh=Mcz56Jl+p/soPmNbRmaQsqePO5EC6zzwHTPcSBB+GxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UzokfjXJuD6uW8UJIU34F5X4Pawhauqkj+2jfO+StZHwwowDtQbPeE/drfmC2xcTAhEZsnYuj1kT1aB2GS5o7a8/sZmRAxK9fAp3ZLL1Um2L6j69dmkgSNFMpxfekr7LKGSQOjkGBeRp9ZYtVPOWfEMeXRWBBq67hKYcKd2dCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQcXcMC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHWD+NO3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JI9Vdi3133082
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcKVJlOB1hmcCtrOgSV1bzmf0u5ByVni4PLnc1gEtbU=; b=gQcXcMC/lVLMfTbm
	MlpJhArBBl1z4O8Hw5cM4kXDBaad8wkR/JnQNxBYlP5+MMD1tV3FIpa7U0S81mN6
	+X8Zq1t0rOxBR434rpZLsMPbNtudG2efGgzWdZOdqlCHv1jm/hQrKgWFxZgTOStY
	ThmuBhi3XEGn+nrYvXZ0m5UG3i8CwJx4jmCvpLibd8rkTAKYuXe4quFywLpc030T
	PCXApzYgwu4DmYZcKb8JhRDv3GdpfkMAZiJW2XhpnnGn5FPoabSEM00cRMRK27sY
	ppOIeg0QVP6tP9vtBkuaVKVjcJq4FMGZzSdVNd7s/gsBhhgHebBUljLmv7Xf4jxp
	cFPgZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvueyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 19:42:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bd2a2028c5so1923133eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771530166; x=1772134966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcKVJlOB1hmcCtrOgSV1bzmf0u5ByVni4PLnc1gEtbU=;
        b=YHWD+NO371tK34TobBED4fpvK2oCH6amQn9QEKXemME9flFhsG19/D1v4idsNkbOCt
         9laQzu3JqioxdpQ6ojUJfQZ1NDduVDnNBGTJefdIztNOSJzXDeihw3i2MMY2dLZiXJJT
         SIe146RJgEyY9HVn5c+r8fLPAvwVouJOblFSiVVXzt7SqBs1ZnvGySXU5g8GDHT6llP+
         jfoMA8mXVsHLO5qkjz2YR9+Gevu7ux/O42BWr19s99U+U6sibdWYpQJn2kx6+lzNIZR3
         WNKyYf4szAhXN58YXJxuKxtXj4jaauhsE3RWxq0aVU/rxr0tCKtx8d+XYTtCv3fUrxRy
         NB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771530166; x=1772134966;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcKVJlOB1hmcCtrOgSV1bzmf0u5ByVni4PLnc1gEtbU=;
        b=RO3kDuKyMyPPNuHkDHAicRzftKayEYZF6H0r1yR+0oybFx2ESaNgRPD/bx4zmKnFmr
         m5Lr/Ijs5SBuvulUbyA17G7LRGT8qERlQ2vNoT6qF8JjnU0pBtVEj0YmfxMYjAEnqZt1
         32M/2KPIzlbDOLe+z1JdwyJOKr03Y+eUxfXha09porNtvX+PtXZGJryLjGFEVTjATpnQ
         +xtqVDv42rpS3B/HysPTIyvrQKqLKND7hSKfrh7EdzVYxmDeZbIIxhITdF+OpzUR2Lm6
         wYXJMqoP4aSX0vKvHcGCyzrpFUy4yzHPqNvneqfNOyNXZP0eiLjEVOJMfG5/7tCSMPML
         S4LA==
X-Forwarded-Encrypted: i=1; AJvYcCUndwLUbbBXjw5TjBBXDMjv1VtyXYi2GEdBozYAxLl3023nO5zO4Bfh9g393cpovCqoMLm51vnmRkA9e00A@vger.kernel.org
X-Gm-Message-State: AOJu0YzALZ5nfjpSC9JRO+5+36+4oRLmdGOHvjUWd1+r+omMUgEtDjaD
	9uzxjNjaTaxP3hsmH57A4ipmN0wYJo8oRxBfW6CobCdAYtWg+PDf7nD1vdmCanlXEsXH0Ji7v/9
	LZ1qBXXXJAND3w+Cd3+5sBn3aFU2K3dW4XDcHRgVSd6eh3eE/cD49CR5m+7VteKqgXq2r1//86v
	t6
X-Gm-Gg: AZuq6aIBuW/kpnmXtU0rM5ZBXUR+An9eqZ9RY/3PN8ljw42iT7qov8Kf6XNUEcnir1V
	3VAg2JymPMfV29wcxUo3z2iopvtZY8pMAUEGr5nV+a1GyGfA8HSxuDU8VUUj9lvYl2BZit6A184
	ZlsRt00TOM0oiLz4sfUbA+lz/BHmnqs+R1mCw5sFiAAgCCZuzoNyB5KPHzhoIdOkYjdipqDAAse
	10ek6ZEg0FnsCddPHyVrVya+DlDHe7AZobghhuPr9SNOTk1B8zWA5j3VHs1IBaS9ItvGvyHNwKi
	Lnoz1ajcuAC96KVBClEUfibaWmNLmFWjMCWiLB2KkaDPY3nsVWI7bljkn1WKoaSgRlQAB3wk9AC
	19Qmd94mRVKRIi8Zz1xHdbS2DzelzfqYJgCJpLPiIJWJv2H6AcQOWPNXX0KCDw5XBhR+VY9n2oE
	rCYaK/KsX5VgGqoQ==
X-Received: by 2002:a05:7300:e614:b0:2ba:6c1a:8818 with SMTP id 5a478bee46e88-2bac97d241amr7644326eec.29.1771530166255;
        Thu, 19 Feb 2026 11:42:46 -0800 (PST)
X-Received: by 2002:a05:7300:e614:b0:2ba:6c1a:8818 with SMTP id 5a478bee46e88-2bac97d241amr7644317eec.29.1771530165725;
        Thu, 19 Feb 2026 11:42:45 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543e1dsm21614319eec.4.2026.02.19.11.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 11:42:45 -0800 (PST)
Message-ID: <62d53cdd-b71b-48f8-88d5-65407d3a80c7@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 11:42:43 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
 <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260113092021.1887980-5-varadarajan.narayanan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pBEij31t1EdK8ykzBWwDB2lyGruROHRP
X-Proofpoint-ORIG-GUID: pBEij31t1EdK8ykzBWwDB2lyGruROHRP
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=699767b7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UqCG9HQmAAAA:8 a=bzy-IBSobD9MKY258vcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3OSBTYWx0ZWRfXzpEoW2ZXt9Wb
 6JTj6ZsRw8y7pe3ELvIhHRb0Ry8TycZ7ofFJ6FdY9TE8+eqFLNpvYAzwzObzhiB5cla9ZGVul7O
 amDFHlm69nt1ksVTjtvQgUwUn3Xx2nvaJ0/iE6q9N2d/LMGQfyOHhVJa5x0/BAG1WeskqPI9XJh
 9V6RUCdTLtAeZQaOQc1rDaZhwyJ+JIvQmO6cuoMkVWRrDZvENkZKOSgmeoV/soinrZGiNcA295k
 Q7Kmb2yFGsRLDS1nr7nfBlnjmTJHapcmhsTfsqqUQOssUGc4BuYcviTYe/NIopotU+aQoutMDQd
 WFvc9x1HDJ8XUur6hdQ+WPjuyfSKU3v0Uoz90fo0B5YXOBytMhUiLwsDWopgax0Fzc5yiiAf8um
 rHG+Cjcoalyz2aqAyV/HiVJBNGQ7NklP33sfJc8fqvB/Ayz0bbz17ztb9SkUFsdYAlfcu+oR7QU
 E/3O81Pra5araGZQ0qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190179
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[outlook.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-93434-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,cd00000:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2720A1621AD
X-Rspamd-Action: no action

On 1/13/2026 1:20 AM, Varadarajan Narayanan wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable nodes required for q6 remoteproc bring up.

I just recently became aware of this series, and have some questions...

> +		q6v5_wcss: remoteproc@cd00000 {
> +			compatible = "qcom,ipq5018-wcss-sec-pil";
> +			reg = <0x0cd00000 0x10000>;
> +			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";

This file does not currently exist in linux-firmware.
Instead there is q6_fw.mdt with associated .b* files.

How do we transition from .mdt to .mbn given that distros update their version
of linux-firmware independently from kernel updates? Will we need to have both
the .mdt and .mbn files present for some period of time? Are there associated
changes which no longer attempt to load the .mdt files?

I ask because I've been told the ath11k/ath12k drivers will also need to
transition their firmware loading from m3_fw.mdt to m3_fw.mbn, and I'm not
sure how to make that transition.

/jeff

