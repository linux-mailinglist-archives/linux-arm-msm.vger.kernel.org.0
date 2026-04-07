Return-Path: <linux-arm-msm+bounces-102096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DhgF0rR1GljxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:41:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7A3AC357
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53213300A133
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6B23A5E8C;
	Tue,  7 Apr 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSi9XMk4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/pHz8U7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F617397E9F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554880; cv=none; b=ZTk2jULCwmAqBk15W1pPqsT+H8uUhFsimfd3R9llanDponwk1mnwg/BsIL7YbphLUZij6a30ADNYzUYy0AK8mqGO8ce2atcn3Mxy7mOuz/Ay7Qt74DanmEBGoT5F4XfHy0CufRMyEI70F+QgVajLM5fIPhhrXv5x3K0QyJRAcFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554880; c=relaxed/simple;
	bh=93uIw0/MrYoNmOw9Ysz5g5mAxL7ROFJwLCr6FumrCOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qE6aKt/T/Ld1WmXq6vAIc0RCc9N84VfDvptSI9BngygCJ852fFjnz0Qo3wl529t8v5tg0438+Zf2hZTpTOSllQu6/xvtstW9gl+OG6hHchecjnc7CJ3lLOihczwCFh4cVYWiQ5qkC1iBcMP9wsmTiM1Z3qMnp+MkLgC4oIhgjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSi9XMk4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/pHz8U7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376tmFJ4009044
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aNdOLb1kVbddgmRukReC1NXMi8K6aXQSmUkxoMsRfU=; b=lSi9XMk4U+ExtEXO
	O+U7UmT1eN2IrsYIyuVml3b0hOv3YoFeigaMh2U07U30aUp7Yoys95At6KpA4m8p
	zfJxdIAf76bEQrtiBviVLNA3odlxjtUQK1oiBvs46lfSBoghUoa5E8GzF3tOO5TQ
	cOI4EvvIS9DO0YjBhVJSS3R/3R0JAIxgYeLb+MDEbwYzChxLC25jv6om9+fC50BI
	7rp1G7Haj3t149Otb+hXUn5G2LaBM8HYue0YwHUyy3NFoiPbSMHzI9Zl5GRv5w8f
	8TnkO9xZFakniqp4R3pbqrO6lGvjZL4QK7krF/GkdFqlBqru+b1+1eSSctWsDgbo
	N6iMPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkt2s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:41:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so21584716d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554878; x=1776159678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aNdOLb1kVbddgmRukReC1NXMi8K6aXQSmUkxoMsRfU=;
        b=Y/pHz8U7Io0G5IaW/suAiBbdnh/TbrTLT3D0QfNVlVmDfsgYPRAJs/T/8pCNsUh+kK
         8mgLo7xz2tzdQYZvnWvEya+ndVpDzSZfRT6IaHuzihV6QsrLuhtZNWpEmFu+qml/smLT
         l7I1t7vC3pkxIZ7fnnQ9S4UTdTTGw02y6wDfbfJEQWYJ+n4/2IYOYcqWJq3TM2BZcuL4
         5JHS1z2OV4oop0m6wMvH6IaObgbXOd1kdP3mVnB1deA6OipRDeeogAwQ8ciPtse1bJXI
         jJUpdXRcXfl5+xWYS8qtHSZoip5dtfY+Mv7j5ZSwKOsGDPgTHGgTNiuilC51VTQD5VQS
         /Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554878; x=1776159678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aNdOLb1kVbddgmRukReC1NXMi8K6aXQSmUkxoMsRfU=;
        b=DRwXfnsD5KP1enBKvjQyP90o0C4AO6jM4Bpou5CRya45rdbiGbpLYZfqPa+pj9QM+T
         AzkugHQjzPIUf09Qe2UWP7EBkOCpZL1OFaxcZMsSU8etGJ0I7Cklf0fIGjqs1blnIHBS
         t6bOeftoS4sW1/cYaLFhyWrF5+1DYyh3Gug1PqZby639f1r95VG7NihhTFzdZ8p9VAEV
         9VFHwZ9aiRL6AlCmq6lSy5ns0UjZ9EE0WIEyelxLsJSALKkhCSAQYVXNjZn+5oDwnKoY
         Q/PunMMZiy+j0GBHt8xCNfzsK8Su6pvOvj+lnzJBjUG2Oqc6gOPaz3wTBCXVxfxGzZKi
         RC5A==
X-Gm-Message-State: AOJu0YzB4HIPyxjiTgBppd1kMK7pk1j3+u9e/ggWYDsDixFjkTtrjz8W
	F6jQIrXFiy1ashZVWO6d2De2CNVXnHjcJ/juflZLcZYQfk6aaIVML0xCM0Ox4Ml6TXgq88wLnLK
	mjp1jR1nrWlPkcwn0hc9fBshlGJNoADmIA/TQ71NK//kKxyA/OYygPfa4GIg46qA6pxG7
X-Gm-Gg: AeBDietORLuzjCm+okSuu7qjZAvvM8jtY1xzQ9CRUrjEbZ0Y3iBYVwXEP5wAxD4z1s4
	auWEWKj/myTHIMSHgxMbye4k48UP9gHkMLEALrL/PY3JtNTRwqGVTvtJoLPWiPN+VOr9bPSPeW3
	VqePtOiySBrvZZrIWkwmnKscrFemBv8PZXt61/pzzT8bkhjexlPPvOX7qty7/rIp3FtOBGW214d
	ln4VQUsop6Tj6c6WwYanCBCW4tqehEqLClqIrhGS4v5bIulCfjoD2L+fiLOax3JxiuMmoDcNixC
	4V8Cam5h5A+5RuZwBJ+Sthg4mzpf9JE1liHCnzLl/bviqXU5CHl905c2dbuBBruSM+qdGQDLZeb
	s4PzzJT6P0nWTAOrAYRH9HYr9+1nXoD8cXBJyWTJ9E5AfpG38hU1GNi2caJ955TEY0goZB4Sddw
	TrAE4=
X-Received: by 2002:a05:622a:5f05:b0:50d:9138:3322 with SMTP id d75a77b69052e-50d91383a55mr55395181cf.7.1775554877634;
        Tue, 07 Apr 2026 02:41:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5f05:b0:50d:9138:3322 with SMTP id d75a77b69052e-50d91383a55mr55394931cf.7.1775554877176;
        Tue, 07 Apr 2026 02:41:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm540646266b.37.2026.04.07.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:41:16 -0700 (PDT)
Message-ID: <63c62004-a6f7-455f-8dff-fc0139c00fb5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:41:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-6-34f4024c65dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-6-34f4024c65dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4d13e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kR4CFCDnwyPe45QzH1wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: CSwhTXkHO-VbRlXgLOB-qwNwCPaXnjV4
X-Proofpoint-GUID: CSwhTXkHO-VbRlXgLOB-qwNwCPaXnjV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfX7f8TmbW5+DjE
 Wbj/3vfUSgHqovoZcjcSaTdpKNmri849hxF/wSyomuD/sMR1lmJxLa48pU+X9+xOeHjJ7EZpJXW
 4PovXoqnxF5F7xLuCNjgeEtMZRcYkU94gCMS/29A9H6h9zeheyorgVFaQYIpdD2Bw1cL6pXW2Xj
 r9CsQTDyy10bGzxhLvMtHLMNhTqWDaUQlyFipg6xcrMig2fe3O+XBD0ASo9IKN/9YrEcYRCheet
 GRIJmHUzSK6QvZyAhNrG9zhE+wReRY8SS7nlGTHbd6EDMovvvJmhRedlf8VRoel9T07ILcxBfie
 YDFa8NnJt0cskhVhPVgbufPCfeXlD+TRVQSqBmfz7hnnZs9X70lqCMojb6Oz9qAsTzm/Z8Hf696
 JGxBVGXPE1BsV8QKKA5xhTe1Q1Nw8/rM1zp2a2Ekr8RG2yKrjaYuw7N2kMCMZu5A0gJDnkZD1sF
 j3PI2suAem9326tGXtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102096-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 0FA7A3AC357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/5/26 4:34 PM, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8650 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

