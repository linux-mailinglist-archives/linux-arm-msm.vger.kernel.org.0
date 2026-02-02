Return-Path: <linux-arm-msm+bounces-91419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ+RFYpHgGkE5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:43:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E50FDC8E98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 07:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 086813015D00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 06:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0F93033E6;
	Mon,  2 Feb 2026 06:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdelO55l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTFdeXQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18893016FB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014534; cv=none; b=L7TTKDZJ1F9dTwab8QNU+TWS+WOcnEC1dGLqUfok3JbX0oiUL1RwS6dnyqoZ8vpubHpAo4ioe1YCtiyujDfR6ObrCJges/Rij5RnNqJ7ks+07OkxXsxpRmQUlkdj8dQiBJDxm9Q33wVEbxDa2Ly7ivbgiGEqbmSWevrEzC8ivIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014534; c=relaxed/simple;
	bh=Gxcr6Ryt1GGLj7poKUsgvffkF0vTzZkOcx1nBB/94R0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fTo6l9QV12l16/nTYNXB5QQ9Iqnz3VImnq+7v/dQIP6Cvrnlu9/MhD+NMMlI7ioDG2M6MbsGvzAdTlQeHSW4uDzfcMWZZAwURZXxjMzJeNRqcWtO3OJmX7jQHDOINNsN5tTfJKX0HLOXYAqsPZiZ4ZRVs2b3W+uNyjCPqamWj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdelO55l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTFdeXQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611K0p9p1535726
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 06:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwSC3Pj1ca/7t+rl2ydZ01UosdX08ogkFrsKPK31lJI=; b=TdelO55ld4R5b3a0
	QqAOmrDl2L3OeXHBpGGYKCYzQqtUhSu0uEue8Ef5ZkyU2addRNirAe4ReMbj7T4Z
	FEyd7+bn4wC9j64olhvkwXqnOWPOF1OkS0FvvHhwxJazWTyqewybeBBOFU4mkJtz
	Mo7cM/kzva/0yLDyQxZ9xUiC22NIokB/gAI/v/LuoM4qCR+m8lQEixRkM9pMBK4H
	4b3rKJoW1QSGUkhyQo6lbGNz0ViozoyFCHBzGOAAyfIhOXF2l+Zc3didgqVeEO//
	d0Lt/lM3/KaZVjOnP6nDCw2U2p3XTitmSszlx/wkvbD0vm47PQlGq9lcskCXx/J0
	wMbJQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnm8sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 06:42:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a863be8508so55058615ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 22:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770014530; x=1770619330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwSC3Pj1ca/7t+rl2ydZ01UosdX08ogkFrsKPK31lJI=;
        b=eTFdeXQDdsmHOkHopdqLA31r3PUCH6m/5vOnhOdmncC+Qoy/TOmqL9uCVr4bil3zZb
         x0cpQ/H0nhrtdG7nypKD7UWaaEb4egs1t+VsuT9CkQqCV37OAIE8ppyFEgAP9IF1osZU
         Ewlr3VS/yOYnVSb0WDgPQHMLJ08Vb9ZbeXztYYnZ4qtM/UrlLH8shfc5pLWlGlEd+pwA
         lp8kGi5FHfctoogqDd0T36UfZ/tRLUkVTgSrlwlG3LLlCqYJOhnlxu0IGTst/J0t0Nei
         jxLQNfDLY3Ow1Gnfjd8LYcBFNBIBx2WZOzBdR0PPrfcimn2FkA1YtzT1eefpXl5zmznq
         PB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770014530; x=1770619330;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwSC3Pj1ca/7t+rl2ydZ01UosdX08ogkFrsKPK31lJI=;
        b=k/tmhZH9Ra4fdl+YROpReJDLPNdesyNCdG4oy1W3950HTPvDT7GtVBysmg+nTcooKO
         gtrOYNCSvodymdP/fpTWTrFqR/siSn8BIBB3eQT2BWKNCd7fZdZu/3YyNEAK0DvYi491
         UzHX1vyIN6TQYDTMc5lHflWnKl3WyjKrhwjBpn2oBTSyQUqbXaMJXUuKYXBWB/oyjDVM
         CxdiHqsmhPZSZJtQrp7DCA73tMH2pQog4Wz/v9/q6siMp57l19Jy/FPxTagSBIy4Cgwy
         AgAWzND47Y1DgtzRYlo/gSSLJhBqrObgnEtWqCYikXZrYAK+teGgIAEDD1/dtnaTkHIQ
         p98w==
X-Forwarded-Encrypted: i=1; AJvYcCXyMCPtSilyM+227xwjg04t+ReYQi8b13F7q+9Q45UrhkB/Cb0oWr4lnpD96k9mHu11yLI0VEpTdrh5bPsb@vger.kernel.org
X-Gm-Message-State: AOJu0YyND8kRBAGNcyrmaPTL99XVIjmOVfvnCMNXVeA5vHzcMY7LRJ8p
	671DxCXU9Y23AYSUXpUTCPI29QVaWsDKzGy4r38FNJq5dIHHFT65jFMeeup5DCLol0tZ1/FyDC1
	/1oZKEUyh4y1nPL4CoEicX2bz+Qs2JJ9eUUrdxhvvcGHrcEqPT8i8rVVCjfGDEuzbaK60
X-Gm-Gg: AZuq6aJZVltT1bTSyZs4ayAzw9dGiGK7Bx2LD8zqxGjbHcJE2P3BO9Bh/1I6Jh9Q5WQ
	gDRpTE1A560R90/lbeH6EIDPBPtc6oY3TCfzmJRatti4/CfDdm6saSakIigXpLZA8BNtiktP3+Z
	3bP4ZlcDDWHXZXhaSIZXmWEpkZOvTO9ocbmg0exAGbR1nCl0XZWZ4Jvy054X12Nlxu8t6hawaR2
	tJXfoUOcopLDwBAB4Hs7Vec32ZP+zwoAITlJduK2spfJomdx/ONGwzYvdumtN3asdsNs3jz2Njt
	cyuAOs7S1lOYwRb9h363x91+pfxLqg+E1nmDAtEBhCw9jNXVsV/z9kiJ2l27UMj5BBPQ8Ch0yZd
	VszJ383C8cY1zLDsvhPMiIFIRw9OJXmeqQfz551g5wg==
X-Received: by 2002:a17:903:138a:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a8d803821fmr111018705ad.32.1770014529972;
        Sun, 01 Feb 2026 22:42:09 -0800 (PST)
X-Received: by 2002:a17:903:138a:b0:2a7:c21e:398d with SMTP id d9443c01a7336-2a8d803821fmr111018335ad.32.1770014529376;
        Sun, 01 Feb 2026 22:42:09 -0800 (PST)
Received: from [10.204.100.98] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm131347415ad.3.2026.02.01.22.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 22:42:08 -0800 (PST)
Message-ID: <249f2097-8676-4fcb-8570-1ec8c0e946fa@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:12:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] media: qcom: flip the switch between Venus and
 Iris drivers
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f8179247-80ed-4bf0-85d8-53441f0d9311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 01xwDuXd8HuYY_d4bCX4Rpk5rV2sQjNz
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=69804743 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qzIaaMEuUFiKcPSDxBUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 01xwDuXd8HuYY_d4bCX4Rpk5rV2sQjNz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NiBTYWx0ZWRfXwQ3O87WC+jxp
 a1u7bN5/AkK/9lpL/VxBXVAmS6KcRWESdT1TO5Qs7FcVn2NnhdqET9sE5RNsNyhtBBpmIZnnZhG
 E04R7AlDmBZ7tSvCxr2L3BDpgyK2onSuK7/9Q0/Sm+N9mHGpC5zKrKO603VjW2Dp3MSk7SWMo8W
 kiWvPUbXf7Blb7QwIceyq0hA0A0eigEdfi8jd+72Z4zWoqNNADDcpLDburXculjmwICazD/7xTX
 TBHIZ17TBI+G41B/HDXGVaeSRkX75AI3eAzHwe94JgFJsSscGymfiiou1GDqfVnQ9s18scpoBzl
 EIQTnM2/Eec6fiZ3pAeMWok0i6FFsVjlhrwBeQG81yjKcgZQDieOmCRUM+URiNrX3Ii8TskN5OV
 3+A36/8MnreQqcEEOoZ53QwDgcA0QUIMJE8jCwGbcl4Gko8GdNDrQi778IQHaNDXxqCZjqwPIxF
 vYRN/+N4wQhMFKEW9iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91419-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E50FDC8E98
X-Rspamd-Action: no action


On 2/2/2026 12:00 PM, Vikash Garodia wrote:
> 
> On 1/31/2026 7:28 PM, Dmitry Baryshkov wrote:
>> As the Venus and Iris drivers are close to the "feature parity" for the
>> common platforms (SC7280, SM8250), in order to get more attention to
>> squashing bugs from the Iris driver, flip the switch and default to the
>> Iris driver if both are enabled. The Iris driver has several
>> regressions, but hopefully they can be fixed through the development
>> cycle by the respective team. Also it is better to fail the test than
>> crash the device (which Venus driver does a lot).
>>
>> Note: then intention is to land this in 6.21, which might let us to
>> drop those platforms from the Venus driver in 6.22+.
>>
>> Testing methodology: fluster test-suite, single-threaded mode, SM8250
>> device (RB5).
> 
> Fluster results for SC7280 is regressing, which we were discussing in 
> earlier version of this series, need to be fixed. All tests were failing 
> but one for h265 decode.

I see the patch (#4/5) to increase the size, please add the fluster 
report on sc7280.

> 
> Regards,
> Vikash
> 


