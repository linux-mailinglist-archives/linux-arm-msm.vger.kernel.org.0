Return-Path: <linux-arm-msm+bounces-102286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHg9MQsd1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:16:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7B3B9BB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0DD730125AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE1D397E99;
	Wed,  8 Apr 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eABAAoUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffS3aUSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E08337AA63
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639806; cv=none; b=ucboUQb29NAFfUb/Ou0OPLewd+qJqZKme+0ZKxyBxGkbUoTbvJVDHGhhmZE0hBs0aIFNu7U8X8uwtil5gHjO2cj7fLuQTo1P146VAFDvB/YVlaGOpQNtNgzg52/fS6vuERiRu3W5Wg2T+mOwfY9fJMvXQGrAYUcl8TnSrCHjdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639806; c=relaxed/simple;
	bh=v9tPwsDptEipHOEuADTthgdBRAyA/k6FpoUYTH+e6zw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VcrxE03er8WsKpefGFNvZxUvxz0x+7bL1iII+ZuJ9jW3pc12DCg7pHe4stTIZkARkEs5BiAnHuTYoy5vpqfrihGQGbwqsB/4s8Xq+bFIb0Thc/dT7h50lY1HyMtL9sVdHS27MHliR8Hh6s6qWRL9Bwk8cfwM3LY1bmpTH3nv750=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eABAAoUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffS3aUSE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385MRvb3362755
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=; b=eABAAoUxVYDV2zqc
	5PS3dTNUbdFgy23F9cDC2gUxKerdM+0RD+6zF3TaXxd+D2uwmfGkT4IlM584gdmo
	ypmxUkQKz0TH6R48AFMK6lNDq3EOA3NmIlkg8jHcTCzlcxw9Dlnadd56zDdpxqCP
	jdnqTBPQv8XuHXd7hDzR1DP4U74b4J0yLC7HTkatUCVZi3I3ufyNT9sOCVqCiWtQ
	z+SMTvkS1fetjUGOdvyk2I0LqyiKsqxK5liuxhzhGHHul4FGPtVEcgagiNsaYImD
	ukJ+AjiB4hyciI82LC3UU3pVrSdzxDY0ifWvhuKj8tYDYnSiwgnu6qt4aoxTV182
	x99DZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkjhrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:16:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0f4e632caso89557585ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639804; x=1776244604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=;
        b=ffS3aUSE3/QpSCX+DXUwzNoXIWzmVkNNdOY9JkT6WKx9CrZRZTf/w4oZf64ZwXix9r
         x3z6FLiXzWrqscZW/z8m/uSY8ZOYRTPvortTdxCpw65ZHd/ZJoSOxLsOVIWg8mCshZg6
         E8Jeq87QZvbz1Zquo2L5v5zBGvCSTs4C0OuN+vMPFNTkR5H9Kv0U+Ls3oM/TMoKi0KpX
         aaviCAv97sI2VMi9AG46cFBF2KOcpQRRNjTI3tz+QnCqNvFeyOueEli0XTTcLBUKbx79
         K7dg4FdwcH5xKA6MJrz0Np5ji8MkRLeXbAU6LEh4ayEcPMY0A2vfXYRIl3aYNpwPydUk
         cBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639804; x=1776244604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCq3s32lHUaj6k+qmJdVJ5PtOJ3QtlGnO71HELrPaUs=;
        b=UsxA0KbQYPDBSum6lgdY0Kso31bm1iicydx2L3UA403XcTpfRd1QYH8PR5/D3iFghT
         6zm6zyG1ZU8KhAjJIylQUBVfxdz7LHnyRgUJhYzbJdeTFEw9Vb6tSGsVs1H0zILidOxB
         DaHPh/Fx/a+440fEaop0B4WVSYIYw6w2BZNiFfDlXTXJiSk5JZnRyVBq3UEwM5gNyi0O
         bwQnLLSQdADumFih6MrM6l1QynYbKfMq44vuCQGmpGHqlHJoX11vMqNwz2QPqScVDfzT
         VQaKB5qyrJY0rASaXBl5rBuBsy44ZMzoiYsKOhchqsYeP7744V0aX33QV6NkeBE6g02U
         IrHg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Mk+idYrVY9ZaJFBlbB6tJcCrxIH7NeUXwAnjnhBDv/fCgJuzAfSfr9CiSbfhFfm5xOgUvR2RUvhoMdyK@vger.kernel.org
X-Gm-Message-State: AOJu0YyRItjsq8QPwET37pzxtQ85dU0zLCswPYfyLs5dQgdCHkvkAiD9
	2A6evm4dT/VmfujChIqKsMBu59ToxFX05ugMFBd1CMa5JWA5wkB4qcYtZU5hHuQJ6ov2cCURw61
	dVwmtqGQe43ViI2Z9JXVpI9ZZBV71A6lfmVRycQaNoZ12o5XlR/5w7S0Zv1rOPNUOATnz
X-Gm-Gg: AeBDieu8AVojDKGjgugVB+8LlgzTGwIlKX8kHFM/BaO7J1LiI0BOW9n2l2NWmRlW9Pc
	5vJ1/TBDmeD0vsGXd0fGRE5bS08k8FRqnjVlxapMy8+57mJtrgpnzPzB+V18rbNoWoUcZlMqXkU
	0xWDP6SYtFGdu2Xf2ZQLZk0zUTuMvQEhes5a9lS3Qv/7iTF5DGDleuDFaQ4qSzI9qwwL6vAfbWc
	X1GmQ5FYWf3cEZFQvFU/jURZh5iA8hJlu5AxOURBYINGZIq1CBhFgwIi7QGsstsKjFalZ11frxj
	MEzlNtStJ9Y7NREGaYJBjdekpoK3/T1OvdUBYeBI2fQ00LZu3WhA5GT/UwP/pMqFL3wgiFjwvGy
	IC4TcIDRVC/gtcAKxwrs7mr5aMwbZCd2pfBJXwHqnAWuvzbAfS4uGFGfD5rJf5UP6rTz2LA6x6b
	yGIaKZLJBow0pcf7NR
X-Received: by 2002:a05:6a20:4313:b0:39c:c07:144a with SMTP id adf61e73a8af0-39f2f19e2acmr20823858637.36.1775639803864;
        Wed, 08 Apr 2026 02:16:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4313:b0:39c:c07:144a with SMTP id adf61e73a8af0-39f2f19e2acmr20823831637.36.1775639803378;
        Wed, 08 Apr 2026 02:16:43 -0700 (PDT)
Received: from [10.249.21.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm18248338a12.31.2026.04.08.02.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:16:42 -0700 (PDT)
Message-ID: <9bd4e289-9cf1-4502-baa5-d85cf6e07df1@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 17:16:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
 <20260401-enable_iris_on_purwa-v4-2-ca784552a3e9@oss.qualcomm.com>
 <20260402-lurking-tested-marmoset-f315b4@quoll>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20260402-lurking-tested-marmoset-f315b4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d61cfc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=J0sBhcH8U7IMieNuPjwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EKnlE6ULO9mUsL3fEU-0QFK7lq2dj9yv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NCBTYWx0ZWRfX+Dp8ZqxwkMLw
 dhiPJRmsv6jC3nkgo381uhSuft8GCZolPpYJAsxxJBP8yac8AiRiuJ31V60SYRPkxzWMPhKiT3R
 N6lxGNDlMCqeR7+OA2lyX5owlH06pAUWUaIGey45VohNmNEBje3fBNS/2GKVdcpXH169G8E0WtI
 qt8mO+7aIl2YLOdHGHDAsUQJ5jnwSG3NZSbAQVJIV4Q53uiJdakysPNxiaAU5IVXiS6z0tAZ6l1
 dgGsOGntUYNhPr/9hfZozLNEAI147ImbsusV+fbfkBSrnMfSjyLnCnNm3EMbyeteYXMHGn39uxg
 g6lwVzEfKnbVHTKaSvdVm08WOsm0REFUp9ohTpVD9BO0jGnPbuoLStU/5ID0t90yapa6B1YkSUx
 zZtFvWRKXiej26/+Nuzpu+wg7hJUbl76xdDtMd1QPLJXr3OlSgBEBnRgGBqgwLrDRf07rB80uC0
 pQfRXZAzPpFCkVfjb0Q==
X-Proofpoint-GUID: EKnlE6ULO9mUsL3fEU-0QFK7lq2dj9yv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-102286-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBB7B3B9BB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2026/4/2 15:08, Krzysztof Kozlowski wrote:
> 
> Why no IRIS_HW_AHB_CLK in power on sequence?
> 
> So if you rewrite the code that you have list of clocks for hw power on
> (IRIS_HW_CLK + IRIS_HW_AHB_CLK for all variants, +IRIS_BSE_HW_CLK on
> this variant) you could have just one function for all of them and
> devices will be fully compatible.
> 
> No?
> 
The original patch was to add the IRIS_BSE_HW_CLK operation into the 
common API, but Dmitry requested to separate Purwa's implementation out 
independently.

-- 
Best Regards,
Wangao


