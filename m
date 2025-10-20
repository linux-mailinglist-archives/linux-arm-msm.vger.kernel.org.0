Return-Path: <linux-arm-msm+bounces-78022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C60BF1C75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 803814EC652
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBAE322A3E;
	Mon, 20 Oct 2025 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJUZLJik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A76321457
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969726; cv=none; b=Oj0fj1LjA4f1ldimWy1+w5Eiqu5f53y5oK5ciwWtM7yrAdq7t7/GwVXe5oiFp4LpzuY6cqbOkaPeZE50qhZBYKVTf72F00aSI7aBMTC3yWj1QjQyrlHG2Flu7wtLaFXsB5BBFuo7q7vUXDwzgWTV8//JNFr0TpIE2ER9oNT2JjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969726; c=relaxed/simple;
	bh=pclgVt1NaQFTZ+cJhZ1SnUnca/hbnaHZrZfaIkyjQ/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLx18YL3QFuEBNZEL+WCnQpFYRV7sTzhEqHa9DeLPGLQ4G7t9q64AS98VP0eBxdUmEHn8J5l4v0gvprbyIMEn+ft1non9KbKteEWMHDoy4cwZvyqYAOy7lbk7hIxoP1vIx9FKdA5yHuQAdbEFcW1G30kCjOYJZBOOuSmtxIg40k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJUZLJik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCFUGs002864
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDmy2GELi7gtK/8jzxwGBbx8R1YBxICNIb8VNFsE1t4=; b=PJUZLJikmWQP3BlF
	519kMTMz74gHVVnCpksl8pQUEKNqaYAYhqquCzDaIwYoi1bL1Nl/2mKVdCQDg27+
	skeVLrdlFK9D3ZsItTdTKGMjYQGX3W3I+7e6DURs3uLlSJELCdnDKAg1fwrwL6PU
	MI0ss15A6EXJtv5Pvk3kxyg/EPbBhGQTq7H9Fx7cRd4NJWIPsD2GX+Ii6kceXBOA
	7f3R9REKSTyyqqC8t8mqLYQ0FAXz56YAHOePkbokpvLVOEeiFwt4bBkudJLTZOjb
	EVu6y3l92CHT6xQppMYSSu9Wl+RDhyJgz0SPJ7xw6T9TvSsTHK6kh4HsP9Qc1pYp
	blQmCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pd76c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:15:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87bbee3b92cso16833006d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969722; x=1761574522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDmy2GELi7gtK/8jzxwGBbx8R1YBxICNIb8VNFsE1t4=;
        b=LdWoVA6J/50S/+pSCEJKfEvhwy8JfDm4wjmeY4xMdeZ1lejk9K+SzT9XtU8HpC34vp
         g6KVGsp8dS1yARVJpoBD78gOYtKpGt0GjEuhae7aiRy1NSEtP1AmAXpjDeKIYK6jm8Cz
         PXYpSIPB/VJMCOBraxjXZfYzyPmplEDFi3MR1z6TkMtl1pyPsZNofWgMeDcEXK47KZ1j
         c7YQbC1c+nUPZKJPuAtuHV6JjVw1wO92YOz+ibxZBITSBetAReBNUiCzPcJM+4CEOYqc
         4xSpAYd3SQM9rjb76Kdxkrd9idRlmUPXUsFxgvssS/9MfzCYxcyChpW6NC7d49JtySix
         pfeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaRaDJLfdzoHCiL7pMTtZmxCKurZ3rC1gIBQCICaj5pJCc3k5A+d0sSPO4vKLX1AF2HOsCvGFv8pAgVkPu@vger.kernel.org
X-Gm-Message-State: AOJu0YyLnZuRv63g+xmADhDyDnjfdSojjRFjabLethBR4djD9AIuT8dZ
	EOG5KyRipdcWrO++IzvCkIlGMbwaUbdkFE85VAfxhRRjnkdMgekfcyDHvSrsFAVRlxd9y9taSe/
	625QVpLw4UvPf5boa9fs5MGFRdh7UGkUwig5c0aAULqmMmWWdyC0xj3U1+8nZ6KCfzpCF
X-Gm-Gg: ASbGnctir8ztaHweHj/pTxyCdcosO0Mv2LHxx7Cj8jO9sV2Fw4+w2Id9nuH7YJp++Wd
	bgTqRKsLSwMumzGZ70bN1nLr1ufBDFmB0hk1/ivRWiezUQRcsLhmZkNb6AlHxRBmGKE02sVAGeE
	/H2EGmgTCdXhRtnPpZLX3+gvHWKdcKSbewob0cN6jPT7JK+Bxawos2GDcqAZC5986et/sZ8fwsG
	lbRPQbo4ZhtzfaJR6rm9OMy2mwCWrZ6hOM+SP83VCYaeJfc4D77wQ5L6KHYN1mJFGUO0NH8sUMy
	vKOj/6OZOOHHO6YcTuXxnycWRrbEQkJmlzxSWCAgz+jEtSRxnyBsnXFU53JMQZS4ssG/zUuUXzX
	SLNE3yqFDBYBVCkpx3C3w297rs82stJZJa/dINhHs3D3SJYemRlRiYJtO
X-Received: by 2002:a05:622a:430c:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4e89ed27b1amr70538601cf.1.1760969721852;
        Mon, 20 Oct 2025 07:15:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgFJIAqpM19kvrDWGwCuBgqCdJgurbW+8pv+OyXQ/fhgIZbl4A99RK4rC5R2fhCALO5DvG/g==
X-Received: by 2002:a05:622a:430c:b0:4e8:9ed2:78fa with SMTP id d75a77b69052e-4e89ed27b1amr70538361cf.1.1760969721351;
        Mon, 20 Oct 2025 07:15:21 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4949bfd3sm6749303a12.41.2025.10.20.07.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:15:20 -0700 (PDT)
Message-ID: <88f04334-8d73-4ced-9c46-e69c3e6cbc72@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 16:15:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1b783a60-39c7-49b5-8932-e77230f6cddd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX7yEwFwpBSc5w
 r5tTcsqIUCNlcAjzpW1ywdpGaf5g4Wf5shWs7MuUHotPe4a7IMRHSpLJ8XYdyd/ryDL8k790lHQ
 IqUungwtsqIHKBkekfyAvdbcF/Mb0rxmRPkkncmaUWEeMWsNCRkAVmg8QF0ZqfF817KAcYv4IbF
 dWsoBrvdSqhPSkMvyLr0EKnvG9pxWej+yao+xhFt1QlVoBKNHTGkVIuXndsqi7V2XItVpikV4vm
 5Zx0TkhDjRnL7JKg2FfkydwP1a9W7jrnttR7HmOFmSEZJogk67HjUxFYNVYcFL+VIxhPw7erpZX
 SAz1R/rI1f+zQRQAbG8OvvqDpYwGutRY5nrm46FKHwUtpZKc3+3ijvoTofJ3JH6L/iRvqXcCsmm
 pZQnmbu0tSAYRbJ300C8MEwnwx7NhA==
X-Proofpoint-GUID: 1MCr9L5eryEYL_0Wzc94-CeF3IvkumBz
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f643fa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QfOM7-ESXlBk_NPiMl4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: 1MCr9L5eryEYL_0Wzc94-CeF3IvkumBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On 10/20/25 4:05 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 5/7/25 03:38, Jessica Zhang wrote:
>> Filter out modes that have a clock rate greater than the max core clock
>> rate when adjusted for the perf clock factor
>>
>> This is especially important for chipsets such as QCS615 that have lower
>> limits for the MDP max core clock.
>>
>> Since the core CRTC clock is at least the mode clock (adjusted for the
>> perf clock factor) [1], the modes supported by the driver should be less
>> than the max core clock rate.
>>
>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> This change breaks the T14s OLED display, no modes are reported on the eDP connector.
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD monitor
> msm_dpu ae01000.display-controller: [drm:update_display_info.part.0 [drm]] [CONNECTOR:41:eDP-1] ELD size 20, SAD count 0
> [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 113 (1)
> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 120 652260 2880 2912 2920 2980 1800 1808 1816 1824 0x48 0x9 (CLOCK_HIGH)
> msm_dpu ae01000.display-controller: [drm:drm_mode_prune_invalid [drm]] Rejected mode: "2880x1800": 60 652260 2880 2888 2920 2980 1800 1808 1816 3648 0x40 0x9 (CLOCK_HIGH)
> 
> With this reverted on v6.18-rc, display works again.

https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

Konrad

