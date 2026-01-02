Return-Path: <linux-arm-msm+bounces-87264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DED4CEEBAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0CB7300D16C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859A130FC20;
	Fri,  2 Jan 2026 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiUiWEBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WDuFJsGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AE530BF4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362696; cv=none; b=k/QXn6gmjMqCZijt/gGBXw/kcaYv4XRDG4ptBmGPK6MlyfcbWVAP8nkl5sD1TphQZ7HNyY35SrLv1ONtwDRD6WNOgPi9oKwVoQC1v9aGPhHVzePsiivb7dq7Fh9DlvSY6uASttz7uLAJnp3UMkUF/u6b65ZHCmtSlnZk6+u0NmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362696; c=relaxed/simple;
	bh=fIAsJm88rdZT+4c/pwiqrmBcXCTPv4zP0IARgBg/i40=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XXNvKOVXNet1m2ThBxef+xJDUtuqdsp1F890nmdygVXdXy1X+D7/en4ekKNyou1wkaGb3ytpE/Qy6e8l0PvgIYQC5YQu5AAi3Mz8fY8UVpRSWpNZBdfjq/rh9O70qHxMWt4p/o186fV+lo9Mqz9GHik7AzbG+d8ddfBELRHsYVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiUiWEBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WDuFJsGS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3kw784546
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=hiUiWEBwMnNLAklc
	Mdn/iDZ5S1Ojj+YUIDgMWzwynsLFeHLgc95409459dtRgAoD+ah6IAI7J3HDgm2F
	iGsrhafq+9T1vcWC+a9uyqW2yjBcmLeg5ZAm4ViVhMal8b/YU/tGO2+0yN0sjp06
	mmYHFtkRXO1EjmabOBfrG5BZMj4qgrRj27Ej6K+bXYGnSX/HJQwDMRnECsjNoA7X
	8yuu+Uq13kNoL1e2wMQ/Cr97Qz6Fwp7vrCLyCoQmH8y32i9WmDVER2gBkdQabhOT
	vAik/WgXoUOfMIuo9A8YvE9aPTszAkJ+mpRQu60bwvsUWkOrEaB40vj8YO9mtlPx
	qAPpfg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkhxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:04:53 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-646c87dca90so652979d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362693; x=1767967493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=WDuFJsGSqDx+pfS6gdqXYWg7U7O1FH99sJB03C/4UeYblBg5daz1zrXNoYpcbggnGD
         EjIz3XVgTHUBYhPfCKacYmKLMmpjj11DmCYC8Ui8m6qbkN9UNMo41sXZGQNt6O74Ht9V
         5HJBbX/Bbg/gyh8t9CjZZ5AdFKN3xPkqP7V8MhlvgGI7Jl/4hiixlrfBACbk43tHiETY
         XGY+xlIgeX+A+vrvzX+PtTWXLMJN0n0rVim/kfFrEHNJMEZKx+OVxoMoRZUaWREcDjGz
         mFAMV9HYUmRWRiSyusNpvFFMqQUZJSNNsNJCAOSYweo2yc1ZDzIMMw9pnY9gpF6QZI3p
         eB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362693; x=1767967493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=WIZT98oWMnC8BFFKRM6K2Nptq2HA8TB1SIbBv4UjzYrFwPjbiSPlSQdX7yxWMNupEB
         MZxkP/K+guCmWlWUgVMv1ndTQ+nG5Vvw4m3MHGe7gl8vSMMxFwlq1fx+NQXwq4sP+UGi
         FjXHl1uV8wX7hATeZkao1vRXOQerXC6B/aBuA77gCpJmkZX449n9jsivUAbM/eQYUNOu
         f2JWAeyaVryfoyBs7a2SxzV0+fV2vN8Y9/UGk7Ra1gSqOZ4uJa6nrUcRd0eHndpDPWia
         GRGny+VHBNwyAcGUmEaYxUYWnDfUOPm+vXIjZoyajipn8OoYXQOCP9PJVnBh6R8k5twD
         /n9g==
X-Forwarded-Encrypted: i=1; AJvYcCWkVVHqXqo1OWtQnelEA02JxOKzXKDyR/aB9w4eJ2BH9dacKbZmnzFbEdQcSB5AR1lQP5NgwkecQ3/vDPCs@vger.kernel.org
X-Gm-Message-State: AOJu0YzWVp/8wjBuFoZ+ZZh4GGWwZB7PttyQjMlqaxl5aXaS7jRg2QB5
	NNXVcNMYJQpzUlIjQ9M83t6q3ILH3bzTRI6R0fXeW84Idm0hD5I4HwG9lj04/KmzkL/LsorWJDK
	dRODzcFpfY7RfC2zZbq1aF+7EseiUJo12H3ZoZOM/k69+LPBpgu6njcUWNWoQ7pAXt+wF
X-Gm-Gg: AY/fxX5IOFcL/IEBogg3QJyRK+iwogk/xlxPpYJXvLSCWsDT1eYo/C7ioPki23CqMpI
	jvRLaVG73gNSKih4jS6+FQ5eIXZUCQgZx4IlT07sKOtzRiW4s5uV1yi4EY/hhdfDVEynHHV36vQ
	+5EGMg14LFozrgFCEpQZWmbQvl2Sljt46qZAqkLQcKHF/sDA2F4U2OPOZuORLAch+bZgFY7Lp1Z
	au5BXUruZ3BScv4DeGUteqlZukCwHa7F/Y6ngH84MQSIldA9DKFwwucRG/5T/TnKG4V8vuP42Ue
	x7Z/0X6VG96MhG24YnWen/PFs8+ZjVO8pdafOA5igQ2nS+nhVG5B1Of2XLRqBnaN9MmiKlQoB6G
	SLEl/TkmsbrUg8qZxPwHVqYbGSPNHGHq3wyULTYjHmh+Jz3du08XaHZ7yqsYrOcfLkg==
X-Received: by 2002:a05:690c:660e:b0:78f:c442:57bd with SMTP id 00721157ae682-78fc4425d4dmr294187887b3.3.1767362693356;
        Fri, 02 Jan 2026 06:04:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcuVYNEGxR9hACuiPoXsy2jxkn+9H/E2BmtBs6xGRA8g33A//BqoQw+Eh2o4U0h5D7LKzxRg==
X-Received: by 2002:a05:690c:660e:b0:78f:c442:57bd with SMTP id 00721157ae682-78fc4425d4dmr294187647b3.3.1767362692979;
        Fri, 02 Jan 2026 06:04:52 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm4718340166b.49.2026.01.02.06.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:04:52 -0800 (PST)
Message-ID: <0707bdc9-001d-4601-a26e-f5645c8ae20a@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:04:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] bus: stm32_firewall: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957d085 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: gFEr-spywbdgfPaIhRSYAhNSwwSySeju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNSBTYWx0ZWRfX8fBXvTj1MHnT
 cyEbe4gP0CQrrTq6j9I9WZ3Jvdx8ygwqeX2hQRBTr2x4FmAYdMSXa0sKGhuR6LPfz3VwBFDOYAF
 fCJZCLcU+qs/EsG2bRXIc56XtCXv5hw+svo2yu+myDMmGBpEdktMwsqJUyyrMQMW7mKecOfmdDe
 tfQi0nKlKGgWEOrtLSd+DTfum15KCdS+5JkEAk1NTf0umPWYKwFCGXXlGE6AQNRltIuCyPCXGmv
 tiWYfYV46tXiP3nl+7DAGklhp+RIgKLDCo6DXArDypcFk9F4IYjD2px3qPr0UZ6lzwa+BCV7ode
 RA3fH6RrjeZQpQyEYDvqywNllrNKRLQoeAW7nLFOanRmP4CYor1Xk8qdkGH7QLUd58+lSTZUaOj
 MdatsQgdEHOdLm4kirMHa7qIljQj96NEyiTl4wMZbWpCYnl201V8M3P1Y+oJ5aDkmaK7Z9eNHzc
 SJgLOJNKFZUX7QLJ1CQ==
X-Proofpoint-GUID: gFEr-spywbdgfPaIhRSYAhNSwwSySeju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020125

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

