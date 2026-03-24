Return-Path: <linux-arm-msm+bounces-99603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDLCDn5jwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:12:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90122306482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 967833029ADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32F3314D35;
	Tue, 24 Mar 2026 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyWb4tBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zw2/jAEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346538F635
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346848; cv=none; b=dvI3B0Yn1OEodiwWeWxYNUe/DugPyiBUypQM091uGdg1M1/FsScjsQSzjV83tEzuTEZDMVVwkn0y/8cktiwgru4HUvJBE1+1caB/Y7LgDJEUW1m/4ajwLbWBfSFetIyruDBgWxUUvmAz006QTOSj5OjoGN0nlxz/JytPYXh03JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346848; c=relaxed/simple;
	bh=APgpxZb4TmH4fbafj+HWNsy7cqz4zTQUR0YfIOgt8pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwWrDt14B5ODhEN30+BeWnO5m+uzPXk7kWMx8xrh4Ncrg+jmv/gaIsBdRs2OxROzjHgomGMwyfARi+QbpX7Cb8G1VNWngHOX1plNgKlL+OIQhdQhAxGFDiRCDEftprC9cbBdb2+dUiEf5jzCvcOlibkZL6jdlMYRN+4nU7+r34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyWb4tBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zw2/jAEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O6XZJ9409104
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sj8Gq3VQ0Zc3+20uFwp97cooX31vcz6gw5LJfk/5xvk=; b=eyWb4tBjsgLq/rc7
	6C+ZbNOr1eotnWI/zvVmTYUJlXNsKeJGR0oeewL/ijpWJrhb0QZ88RzyIeFsrHlf
	l47/CgZpvDcBBuYxHoEHYrGWd68mb9MrmJuss53XTKKVMkbJUfQJk1Y9JG4Glkov
	grNqECSHp3FfMOKorggpjKAsFxYYNQbv6+6GZTI2X/CqxMfgnx8J6pIoyItbUz+/
	jOeHY2ZFM6mmmnsmM5AUtxjjGkMBmh2RfedXMNgKzOHY9BiMIrzfZMy1mvBOHxon
	RM1Pr2LwyDERqsqv3ReS3y39A+WhDpXaokdcKIMg2xdcDNLLf/kFf6MlhbXrgAY8
	59C6sw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexrs7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:07:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b32feb719so33561061cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774346844; x=1774951644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sj8Gq3VQ0Zc3+20uFwp97cooX31vcz6gw5LJfk/5xvk=;
        b=Zw2/jAEG1CdI1EQl0sOpIV2g26lDzId4TxkLoqd3rcr3iGUVW7BX1KftncCwjWxy+w
         ki9X7v1tetPGdWEXss5K2cLpRhmTA6pAuNbevnQVqASRlYeFeJKxNEN/r96O6KxUAmsw
         36cTbnZ6nBOqeWHdsT6knq/zL6Y6IVhy6XWK7c3MRwuDXrann9Sg5tmeApUnPDg2CzeU
         fzYoJDfTsMBuu+iDTu3zlFoSlWqawJHHEbU2kdjI9ZqE+ig2GlPPU6Y5OmThTP/pgzJD
         0OPZWoRSAWnZnkZ+1lkHA+dK9pori/YG8l/i49/bAUNd5dsPIpZQt/5T9S5ibZYovVdd
         WPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346844; x=1774951644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sj8Gq3VQ0Zc3+20uFwp97cooX31vcz6gw5LJfk/5xvk=;
        b=dQ/T7gkvHE4fTwFEKmFeLVX0LhAOK6Fkd30Ve27caXAr5mhh5Slsdtj+HvbjzbY5cW
         bpfSfMBIxxgHU59jkN+kmn/xGxsm6sdgWoL5ztHbdne+SVyoRwfD1jyWGetvDogNSH30
         TWViZtSk4cDU18ixlCZeMwG3eEmS5xzFLsKzipVQzlXPv8MwpO2oFtKrw3F3IXKUV4GB
         L7O95DEP4+CNv+ofynIvuklJ5ogKz2CILfjbdYzXTdpMc/Syqw8lgtLNBJhzSBAPFnHp
         07dctz6kzJbZqvvHpyc/4ldPzfVDZuxK8LFOQT+LxSDohf3tygJJ0cyrfpnCFgkqhvYC
         PbwQ==
X-Gm-Message-State: AOJu0YxF9r+9Tf58QTeC9aWD2UjAI2GUp+mlNBvcYx4wilyZQ6J3Yjsd
	5nf8aQVYLLBzbDgTqWnjwFPTZW49DWoi+NzQ80z+6EYnGJ9Xz2YMg/HTLa8HhlTe+qg5hjIrRJM
	ZkqgZTmvuqjg+xS/20kkwHfnLAZa7xKlOS0D2OXRxHyLeiQ5oVsN/yIc9dfaHfOw8cSup
X-Gm-Gg: ATEYQzyWSKtqBc7igKkprHHauJMU+rfUCP7drMdPaU8z7E7Zb454uTDVuEFc/65cwac
	M4wsm6dWA/1Z26dQpeZ+DJFaO33vQ5F0cKEbrmbtnqd+bFS3Engu/Jn1NG+uss+K4ZmdBozXSt7
	h2v0Yc0nXh/GkJHr2ExJRmrz+7m1q8ShSmxtojXP1m5GEpnVfpaOJENHGMonYEnj34Ubfma5PD3
	HqIb5QUC+g/wGzIBnUHbz6CNtBv4tUxwMXTXtMdUbkvq4K3qfw1M9N3RLDQB5ndyLXlWckb8lrM
	ksdoxpKOB79u1pyE1S2qt0aQSxjpFIei8zGpzByIMo2eFBGisQKkJ3ccv+XwdX1CZQWjs7atv9b
	3TjoIkcY45SYE0rJuLNcvWc0KlEOggJQD+ThXGvOsnOfQgaXLXjpv4up8kLCOupBnuGNFos42kt
	+Xy0I=
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr32330601cf.1.1774346843900;
        Tue, 24 Mar 2026 03:07:23 -0700 (PDT)
X-Received: by 2002:a05:622a:4647:b0:50b:6b21:2a80 with SMTP id d75a77b69052e-50b6b213658mr32330271cf.1.1774346843436;
        Tue, 24 Mar 2026 03:07:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf7e30f7sm4480697a12.8.2026.03.24.03.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:07:22 -0700 (PDT)
Message-ID: <e44e776c-df8f-4555-a487-9a7a6fe032dd@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:07:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] drm/msm/a6xx: Fix gpu init from secure world
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-10-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-10-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4MSBTYWx0ZWRfX5yyfIJfQB5pC
 fpB0KNgIU+OQo6YAoqKz58jA7f4rQdUkji/3M/rEylwFJDcgHO3Fcn92W7ELRF1n4LG2a8Ijzz5
 8F43fgMV1GQvCMRjFsAYcXxy93m2VQao/DqzOdKIJBuZmQtD37DQiYWHaBnIgrmjhdVQEL9gO76
 IBpOz+r5GFf9TWd6QQbjE+93J3D1gBkT1pIhYg1kjvESN2yjQv4XLZin8Caiwb1VllAHFN1Fk7F
 5dv4XUqm/Xc+7HTlVm3poAzF7bIv70miZoWrhfzsrxhJCbROhcSNbyI3TwIhtqWfJBAv+DhB36x
 ONOsm1288ahp62QynHMCG/x4p8+9g3tl4xxdN74joKVDmgBHRMve7KH+1AmTGSioJ2OJ/ZTfIfr
 IyRO6eYD7Jn+vLFcNCvMUSta3dt069o2m/RkBnnlLNiTv9llq7pFrlw1NYZQYaO7cD/p1iKPbZH
 FKfosL2IfXoAkCwiDng==
X-Proofpoint-GUID: yOkKi1Wr2XcmdJfcuUGdDSSMmaJ3TsUn
X-Proofpoint-ORIG-GUID: yOkKi1Wr2XcmdJfcuUGdDSSMmaJ3TsUn
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c2625c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vwBs5ZOmTvMLfzL7RNEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99603-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90122306482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> A7XX_GEN2 and newer GPUs requires initialization of few configurations
> related to features/power from secure world. The SCM call to do this
> should be triggered after GDSC and clocks are enabled. So, keep this
> sequence to a6xx_gmu_resume instead of the probe.
> 
> Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

This now makes this happen on *every GMU resume*, which sounds
undesirable (kgsl does this in gen7_gmu_first_boot)

Similarly, we call a8xx_gpu_get_slice_info() on *every resume*

Konrad

