Return-Path: <linux-arm-msm+bounces-96648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAI8JoMjsGmVgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:58:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B42511DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 239853416D44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9E038A719;
	Tue, 10 Mar 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEV1A73O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4Zih9KQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A6A39DBED
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147812; cv=none; b=H/ZEpuXsVo/k5tF7++vNYoI8WHA/Rn6ZEXk8Bo8TMM5aJ3MDC7TXvuFzkWrPF2eGDh+CjcFpW8C2ACg13s+daE7x+Qq/uKZy8jt9PAmB+gtYRrgyfv5jcnkbjcINL2rEApWGs40vf+FRZma/rT6yNogJD5NpmfIoF7VsRdflNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147812; c=relaxed/simple;
	bh=PgzSZj5vUPZx90J0wBpIHmH7GI/fLiAEoveQ1Mm6LDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X30+XC3HR1Ol9sjwFc3RHDe/+hDzDQ7diET5QB5ZW4g18sfrPSqAlcbQq1kMnLNaWiljnk6bE/hbECJ8yrPx7zUHgUGLy7hzEITn8QKNhM6Iw8e4R8kMhyUzPdi+0aQPTdXFwP1eaLuLIGCeA0KQmHKuCbSOCoYWTcM1ud1UP/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEV1A73O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4Zih9KQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaWGc2861986
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZI+tkict6Tv2oCB/0Zy86iga7hdbPFqRNtpp/IwGkPs=; b=iEV1A73OugxYFKk6
	IF+gma36pg8qa/kFD0pSRA+eHHAgucSpJjeQ4SoUPHBJ76tbrMUe58SIdU/d1Hp8
	WIUbivkDtdVbHPojPv1WB81bjtidHvF8XIEivOi8dR0w8DCWJa+cGFYQo5EfE+aL
	XoPwyr51i6K9qbvl6X9aMbD16DQlPEjPBu3Xuq2elW9HA9WHfsvoIw260x802g+L
	20AI8+k0D9/NjMY88IL+qdVNbYYkgTMIIzzle5mRfuyZkAOm7fX/6m8wiJFRgyih
	WIHmPuMGRredeeoyh6tD7E4Vo9u1NAGT8SMgl4XP6YH7X3OGouUwbms1up8r6BJa
	mImQfg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w9dy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:03:31 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bb636bbfcso1155751eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773147810; x=1773752610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZI+tkict6Tv2oCB/0Zy86iga7hdbPFqRNtpp/IwGkPs=;
        b=Z4Zih9KQ27gd984o3M82aE0G5rtGWp6TVhC+LTpwNGgx4KpvgPuPhttn+fKOUd/JTW
         o/uzM8pKZn94KKHSXulTKI8I+UAT3Nt6x6Z9Rv+dCcB6xQyByRyoc0zl62zwIR2k8TY2
         76176twiz5Aagt5o4Tj/FErvhsdXji1D8e9q3fkP68fNqOOgfuGgsIB9b6aDYEC4xAub
         xwRRv+SWA3hQuxykcBZskWp3VB/nO4xvShuF8V1b2PCpLanVq+su67TWLV2xa/3rEMzm
         LF07m3aAeg9ip2EXWyOogWJqCO9n+VDVFKSV3mbPi5CsH+qESrsHWPRFI0Dg0rFF5o/3
         JG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147810; x=1773752610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZI+tkict6Tv2oCB/0Zy86iga7hdbPFqRNtpp/IwGkPs=;
        b=BMj0pYEuAPSHj5JIpQX7k+DkN9LfOVFj3krS/pJZAYd6oLbWUx4NhG7+0tL/ANXtMg
         brCp16JmwvpJl4tDwmybnB/uJNAez2uJW4oACRyKstJtEU9jKeGTGlKN0UFGrDQHUsRA
         XpGVYJPzzb5hJ1d+vH/mawgIVbMMu4BHIRVefm8ne7Cx02p566fKq4XZ9blUltYgEtA6
         iMNtRdzAYeYZ+EQCozKpWzAvgraErLyUfv4BEIdG1phF5qKacyORkJ/D1SeNjMLxZKZ0
         bWUx13Yq88ecZOvH7oRApHLo0bE6odxRz3i8ZlUUXOhlzNdQt6EePbb+aeE+zA6XZjzs
         8uIQ==
X-Gm-Message-State: AOJu0YwhkIAdXWyTCpXAO1Nn8uvtyWt+QO6ZXlY85/MhauzJCtbkiTX4
	d3YRJ63ty2nvUEa/ttoLVQl9RZtfjD+cbMTQs8QBh8+UPA795y8qbOIMOUkXnyrjCHFtDRf+Ooo
	nluWmzFeDA9lvM7mhrY02u3Y739C4eTrhcN/u8maU/Eh20OMAJjus4AcX6QUS5g9rWxdA
X-Gm-Gg: ATEYQzyQEBXIdxRi50oQoOvZt+9POOPH4jd8owA/pgvLqqeGO7ClTB2x+O7LCXhlQUQ
	YgruBY4iQNXAF7IBvLXnRf9Sr9R1MaVenVZpdv8xMjR/226ar52rvHX/5FH3Scvctc7YM4V946i
	E3SdAaMWwpq+80xpqml4Ic32MkBk3picfuSLowTpUHB89D2ryA3O6sOY2RZ/ZioKiaWo8PvSpDR
	IAAV8by8a6+wQuB1AGXEx+KwypRdFDyMniIldaQk0VZ1merj23aZi/AwTwS00hxK9GZRyEzamEl
	21P24gONXFWMstauftf3MqQZLSJkMZOxbsOfSCrCHHyH/9+4atEeA2rXOtRSWJD/gyy5gb88+Km
	paKU57W4eHr3wtZ0QiNQmlGVa0Pw9qULAiK0l+dDJVWl+0JoLyFW7DgsHt1sioQbIUsH2ZM55u4
	2sRn0=
X-Received: by 2002:a05:6808:13d5:b0:467:de9:3eab with SMTP id 5614622812f47-4670de94d93mr2957893b6e.1.1773147810015;
        Tue, 10 Mar 2026 06:03:30 -0700 (PDT)
X-Received: by 2002:a05:6808:13d5:b0:467:de9:3eab with SMTP id 5614622812f47-4670de94d93mr2957843b6e.1.1773147809304;
        Tue, 10 Mar 2026 06:03:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a200asm4106880a12.31.2026.03.10.06.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:03:28 -0700 (PDT)
Message-ID: <51d4ac58-c494-4e74-a38b-94be77100dd0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:03:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/24] soc: qcom: ubwc: deduplicate UBWC configuration
 data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-24-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-24-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX1/yoUOyqs0rH
 KBHXS6oV09thqPLnmy89eJsll3MJMC18RfLmg/6FUey+gD/2SSoIzuReRhtxHX6NAD7dbUdgZ4B
 tJIwxmcz6YKcCBF8m+cpUliPzMge4jsdQpzmXLDGByXK5WqE+Fmkc3PdlAXAK6WHTY0wQsSX/dm
 w7NxcePPlP7NoOXEKcW32W/PBYbH82wIE7h6zaoK+SEOdm78GCIs5uhK2NyBCj99Ovvq5lB/tH0
 L//xqT1biGjsDbDn9AHxbx1rlzaH5Zi3lrgb+fKJnovQ61bikzQ7C9XZE+STjzdurkpp/C0kFFV
 0On5rjTEBKOrnsMY7mEwJh0xF2PmOKIkqa3ge0zNEKNlxpFEW0NvHtmVK1g+2WKbcVi9ljAwzxU
 z8S+aAEvmYpyik0pnJGDi4ki9Gi2x9cK1SnO3W8uxuQAh+6PRgVgoRngS7N4tN74Hxy+7zsGK6z
 ViyxQVYLYkLmM4kVaRQ==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b016a3 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=O9GufyCepPGRX2FzT3sA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: 2WWxSdM5Dnm_rMlnArHEJXJ5-Oj0ibql
X-Proofpoint-GUID: 2WWxSdM5Dnm_rMlnArHEJXJ5-Oj0ibql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: 145B42511DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> After removing all extra entries from the UBWC database it is easy to
> define generic entries, common for all machine classes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I ran through this manually and I think everything matches

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

