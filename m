Return-Path: <linux-arm-msm+bounces-104272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNBLHi7o6Wm2nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:36:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1912644FC39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ACCB130055B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADCB3E4C97;
	Thu, 23 Apr 2026 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI5jUi6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSTMyuBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D606F35C183
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936702; cv=none; b=sXHNLRniDCMVl+C4qppFPlAtri/5/ipY2Mfp228JWV9lM15zHT35yEWc4LNSqeUZggnETFNk9yOBFYVTPpqqy2XiEQQ83bbbx7Q1+VaCZm0E6xlR1E2Z2/7+0gmTWB/nyUo2vqhndRwx0ZoI7dVPm10GvpYg1p1iAey2cOXqXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936702; c=relaxed/simple;
	bh=OyeJjQc7m5w3nWMDA9c1cIClhsmP67PAU8W5OI9hm30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av20gyesxEDcOEnUHj0ZtVxII2QuneXbUkIUQgBJqr1SBR1YwP5zLPwuY/UccCG2wZLreC7y4RI8bny8OW9aXFeMdpY/gIk9FNAfnDSLy2poaQmG5CQvf7qy2S/9jeBrYoal00L3UM6Jf5baqNoglhOHBmR6lSQ8xDsi7UQLmvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI5jUi6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSTMyuBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNuP1565804
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZ/xeSGjBxCBJLxIsRC02trYohcTKqRfx2FsyvqufKc=; b=MI5jUi6FTwLB+v8c
	EOnmSw+1dUtpR2hX+yuxELbmgCKYWmCB7aTndj8+DakigmxspezAhAN3Cd0t5t6O
	v9tLsrqCg3lYqv3nqsGR6ZROvj4aDqg/3/A39OxcVHoFYeUw+luTXT2yRowczKns
	eJzsIyu+uDSX09F/mlUCcC3W9wtWUEZHcFWoRvnN6F0XhTrszUVBklbZpkn2tlAi
	uXFfynLv4zqYWjdVmTXuOXoVGhGvw0ppO5VtdjpK0u2cEayfdD3UMPwUvnlk6y4p
	QsgiJ1KfQZMxi1FIxcu8y6XzDq1pQWNB2sGdiAZ/x2CUU9kxpbsmNbFvYFKamUUn
	UEtlLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wua13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:31:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faec938fcso9667071cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776936699; x=1777541499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZ/xeSGjBxCBJLxIsRC02trYohcTKqRfx2FsyvqufKc=;
        b=YSTMyuBTqAjQ9nZtvaNz3CKChAJjmYwDZ0cMMTFHvfmFVFMX25RFi8LpUkHO97FYRU
         PpGEUXiPRNs7xg/j8MDVfJc5IvZ9eECE/tFnX+vXYNDig2PD/mmSF9x/rSQU0vosWaHI
         mr7jSrmSrk1PvdmfJWvSdOyw/u5RiaZ/ZF4cv0LE4U7ax1VJ2Q6dMSS7NjgLY60eDTnL
         jpWO1C2ROVSRL/cS+g4kEHq08NSvi88F1jeqHoEjTob5IINnLeiYELQT8IcdZLFZ/FZE
         qoXYsf21JsImA8pGKv1DLzi/inmtnx9Ubg3YRJ8lSkNk0LIvf+rNiFQ5ByUdFNIJsy8d
         5xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936699; x=1777541499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZ/xeSGjBxCBJLxIsRC02trYohcTKqRfx2FsyvqufKc=;
        b=Qo1ymDzv1QjnBK0FTplCz0kZHGa0K4d+FOOlKQFO1y1h8zN1mMVePV72Yv9oCKF1oD
         eAuLnvI6wiHCnCp/YnGO1U1RkHiQGlWZAvHNgVqO6pwyR7DHtHXEvZAzk0JOjrUFdY0G
         dUx2HGt68th4sAD483tmGEB2Ukmvq9TX8LLjzBjMq/054LnS2xunMgwy7XG2eKepcpTE
         +I7sNmxYPQNUuwuDCq+7JUVz6IzqTtuUY5bauCle2Hcgcm3FMdvEewcdYsCPV02wX34J
         SC+uU+EmjD3dqXkCVthJaS1BZ9SN3rwiYRPzqGnamxUHL7rGvJOn5Lnc7+j5fceOjMCY
         DDDA==
X-Forwarded-Encrypted: i=1; AFNElJ/rDAQm1JUDkExM2FzuGylstuAyUyBPYRcLutesUO7G8ItYTLYDLW328Zk1/G3m8oz9+X9VcWJdRQEu66yI@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0I9VMKc4rCW7asi8WrMn/ifoZEmKie2z3Q+Oe6obaqIF69g9
	LakpsUOFvjk/BMuaCxRkSMGAzoamP/NkqpmFekY/53Lggl9AaxWs3aCLsT2E7TJFlzxu0bWodKT
	8GTz0cxTAIHDRIJqn3jwhY2JIwL1B8PZeHWFiW0amMjlUzxHfX4CoCaU3MryiTitiVXEd
X-Gm-Gg: AeBDievRzS5QfMqxdDpdQGe2HA3voBiWd8Sw1mu/9m+qiUCGkwqjvVAquIbnstujoy4
	yChpC8h3vE7j7beQnC9iXSi+JZdl86XaQkF+Q+to1WCS8jkO7MgGVLEZ1qErQQ1OoY2tGTtikrT
	6Qq5opYGl4oN3A/tc1zt0NiinIQ46g/19fKH3fs1qiBraom4pyAm11uBqyr3jZiiSCPVmBYNizj
	lnn8P1s8RWUMiJtzr/BGemyjRN0NzE6NovtYlytnvXy2MpjCTaiguIh6U4P7zXnCoL1sK7Zdv/e
	e5UoXZ4W5BfWc4W8Ohx7ECsMxQDxWrV3zNWF3JUZuHrFLDJ9iE6Or5hZPmMA3pJ07iVFqFHaoVT
	uxmvPD6G2W2xg8ZYk3BZj1t7c8FWCLQWb6aBuqtE2pB3pJDfVWS5RjnxM69gQ19vhkiaEgiEkW9
	mGrgcreL7oUEqUtw==
X-Received: by 2002:ac8:5741:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-50e36c140c7mr245205191cf.4.1776936698900;
        Thu, 23 Apr 2026 02:31:38 -0700 (PDT)
X-Received: by 2002:ac8:5741:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-50e36c140c7mr245204871cf.4.1776936698416;
        Thu, 23 Apr 2026 02:31:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d508e7sm3710498a12.20.2026.04.23.02.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:31:36 -0700 (PDT)
Message-ID: <43a6ac95-8f6a-460d-bbf3-f8b1d082b8d5@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] phy: qcom: edp: Add SC7280/SC8180X
 swing/pre-emphasis tables
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-3-c38bef2d027b@oss.qualcomm.com>
 <df40b4d1-6133-4d49-a7e3-47cbb2b058e9@oss.qualcomm.com>
 <dyyfmgpxzpdlrutxi7gy4fudhpwvlljiylbbcirq6tgs2zr5yt@lpkrehmzgqpq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dyyfmgpxzpdlrutxi7gy4fudhpwvlljiylbbcirq6tgs2zr5yt@lpkrehmzgqpq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MiBTYWx0ZWRfX5gJ1WdE0ldEB
 O8A4X6ynlFbbl81GUfHsCKc0KfkQzEuAFa83U1Uu2re3CvTYky9d5OneVQFiXxD+aR8DCUdF2Gr
 A4KtfW9UBBTQLANQWmLDENxQt9yPBzxxp21iKIuDmKeyRdJc9HCkRLmwUFjyQho2gyDglSnDzQs
 DukabZYdDP+BM6xTgc+3KxU16wKZp9gB1kT9i4jQwZZRch8KAYCYx+0lSNc2Vn1SdurLLLm9fAL
 EJctos8pcBQnnUvAyi86G2I3MDcBZ+T0HwmJWMu0us8x3rXn+wLoh/ERYCMRzIuzhAARGbvxJrc
 eN8k/SfAd9/FvHEpAMvRN4T7jc5TayFtCXP4dNDLeN1sDm9HQGKt7vuJCdLp17ZWQk/ZsuECdu0
 Cgdl+jPgEEqBgW1/xOIQ4ydk5Vn5IFkpXwWnhZhXkK49w6VyZ1g7BDZpsE0b8s0jzoN8z8RINw4
 +OCuj/wMe1pc17D9QuQ==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9e6fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9M6qboyCHJ9uvjCUQIkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 35PtHvU8tT4IqdUdD55_idMT-1nNEF4m
X-Proofpoint-ORIG-GUID: 35PtHvU8tT4IqdUdD55_idMT-1nNEF4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104272-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1912644FC39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 6:33 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 22, 2026 at 12:42:56PM +0200, Konrad Dybcio wrote:
>> On 4/22/26 8:01 AM, Yongxing Mou wrote:
>>> SC7280 and SC8180X previously shared the same cfg because they did not use
>>> swing/pre-emphasis tables. Add the corresponding tables for these
>>> platforms. Since they have different PHY sub-versions, their eDP/DP mode
>>> tables also differ, so move SC8180X to its own cfg instead of reusing the
>>> SC7280 one.
>>>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>
>>
>>
>>> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v2 = {
>>> +	.swing_hbr_rbr = &edp_swing_hbr_rbr,
>>
>> For eDP / low-Vdiff:
>>
>> I believe the RBR swing settings for 8180 should
>> instead be:
>>
>> 0x07 0x0f 0x17 0x1f (matches)
> 
> 0x07, 0x0f, 0x16, 0x1f

Yes, you're right

Konrad


