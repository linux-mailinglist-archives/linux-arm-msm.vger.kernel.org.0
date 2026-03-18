Return-Path: <linux-arm-msm+bounces-98313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M11MZUkumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:05:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 179552B5A54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E40A73040FAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A2E339872;
	Wed, 18 Mar 2026 04:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paLwn93Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wivhz/8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DA3204F93
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806739; cv=none; b=OV5DftiJVlBy25+65aDHpgKmvA1S/ITvwoK7PXSqiD8/4JdTsJ60X//glzq5pyipNhiCGHUy9P+pTokp3/b0SiV2AjS6jx/Jn0RRwLTSrK7tDo7sehyD0GSYOFtp9dFD+67lPNlpsviJZ1VxC6ptJlo5vpMfaQDuVWpry3X8zeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806739; c=relaxed/simple;
	bh=zcoHfvFyrYvSLr2kOf8XVi0qZBsPT566O6cVYgZlUTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrhpubE1yRIEcldfphAOSUeBD3teXNqXxqcjWtATN5hZ+tXsOUjW/QbYg5fogiXrAM5aW17Cxiuh6I43xOPRm6FqxD1G+myVKtBb9o2fQ/5rh3/w+VhOpaAJidinVbkNLxPzQhURz3nqPx7NMYwN+PuXr97Qjl/P9JGBmfbd5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paLwn93Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wivhz/8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2nYem402517
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=; b=paLwn93Q9wUIJo9A
	uMy54svfYhUIYKfb3g/sXTTrC2Xwt0Nm6yt6XCxfVN8yxFPA3ODllqZ5NijpDEO8
	+sAKEb+LUN5PUn3L6WBiWihJXF2oweNePPa9Hq2aWZs2ffTUrtoTEZH6vtxelED+
	fYTUyCHX/U8wEbHChH9RK6sNwRPj6ZcdfF73N1cEzVal18bYDjiVE/17ZLZ1WSvQ
	yUp/CknpE248w8M88YA6q8E4/d7L5XJC5QsJvkQZlgjEOguJ5Lk8IyslfD3H2df8
	h0SP7nxQ4P4aZ7ADBwHJCE9lToZtX9q6yWtOOPjTjnrMPGs82Of1OkQyBSJ78URA
	fyHkXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dsvak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:05:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b061868724so135326965ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806736; x=1774411536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=;
        b=Wivhz/8UN13TqXnjvuSPVmQ/FeTBH2ACppM1F9OeNKvTVWkVXAO6cP95mHjvvLxEh0
         iFNfAUPNkvxXweMtOWfxG9jSOJIy6iZUVGxVLB2i6BPfdWqkP6ad1V2MxXzAr14yG0QP
         bntlECSoqfGLyC1/2U2eUtnn7pMsPACWN+rV6GYeMqlNhl3mwiHH4tx1NMA94NvC037z
         IweFnYjMgYJ8ktc6A5U1MYyWIfZCkWacQd2DM52J4T3vlkmGUdVa1hF8rxuqROhQEdqa
         t+tzWv2Mk0B+YnhuzCjQNINHmEjcsctRjnDlqd/96VwKBKJXpKGUs9cqmixjsHNfVZwA
         jqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806736; x=1774411536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=;
        b=m4XDcA2K/e9BZRFoQHuk3s1tffiJUAk3h4VvK27OXQFStQ9efBopYR43PID/Dn/5bZ
         aFBW2AWiiT6tpyXGlcpw5rvKwPtDhQ5YwVky0uvi0Okfh+GfjTfu0rxEHmW9+ar1zMhl
         4RhQP0E+EumHF2VgrYkMHxogPa36Rh4Zgh/4na9SEmqAkzw2W595L4Ly/XJuLsHuShuf
         pTDrmyPzW3swSTxLdMn9GqUX6q3PTqH5th2kPCTcbp9IGHbSlW7gMNNPNjqT3FW3Q5m/
         hfXHqqZSCMJKRHsoqcQdnx/KqL2tfNGI10ryXScjaqWocU0dIvvrRsGNhP3co9zyLqle
         /LpA==
X-Forwarded-Encrypted: i=1; AJvYcCUcUavHVmW27pDq0Zv6giZRMQ7reaUXXdUVYcP58rDNNOhoZPQ1rK6GbQodfaQqC1OhMChpw/hkOXVkOza4@vger.kernel.org
X-Gm-Message-State: AOJu0YwWM49Xgl1/xKE7mCtK6GjbieVpXxlx77Ud4YHa58wNhq5hkPYk
	We2YcDxMVByAhXggyO6Ca8anVLbAxtqIZdqwkfb9OdrG6A3wG+Pb/Ob9+yOKeTwcOSZp0WMnNPX
	/sXXMPY8BtXeS1MIEL4lyctJ3+TSWRdWEEUnOaglFwP4NIMTQxezPWO4lRg8Fwg36DxMC
X-Gm-Gg: ATEYQzyVof3lkK5LkoMvKF857NWTBGkQCcyYTtA9D8zgJUwMkRdn2CvlRU+pWtU6cuu
	zBP38dVag3NmVOiNzqLYj+4E/Lsv2qth3XRq+/ykE6ee/2CEStt/fzh8Hs7meuc4/sUDk9xoYzc
	O8q+lD0eNqoXFSGJahVbvCAYbpjLqVfM6wR2fn17yt3aXxtKTmLEQnuKoo1vw1x3+mHGmHzUT+I
	yyQVCny0PjjCbFc3ouMKb9jXTZ9oZgptLWV6giwwpkkB/af5u2qxnEOl6HKjlgmWEItXYlB3DdL
	9ukypuxTdn4t4SxHdTa7WHdKrF+V54xUfqlu8D2K3bTiELdCqIhHDgNdg7o/w2e2nm7/ns8p1iY
	iwgzMc9cHJUd6vTveV82F8X4AvPTxShAasliqnkK0/Duf5kI9QQ==
X-Received: by 2002:a17:902:cf4c:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b06e323431mr19012165ad.10.1773806735690;
        Tue, 17 Mar 2026 21:05:35 -0700 (PDT)
X-Received: by 2002:a17:902:cf4c:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b06e323431mr19011755ad.10.1773806735209;
        Tue, 17 Mar 2026 21:05:35 -0700 (PDT)
Received: from [10.217.217.233] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e62fd3asm10424855ad.78.2026.03.17.21.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 21:05:34 -0700 (PDT)
Message-ID: <797d1615-860c-4829-a8f3-ee33ebeefad6@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:35:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <253ee25d-3096-407d-8d2e-3c9d1072b2ae@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <253ee25d-3096-407d-8d2e-3c9d1072b2ae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX/AxaZVnMeTHs
 wMKUJJj9frgcRD/wHlqrHy65JymXmm6NLonjGHpoCArf7G0RGfmnnNq7SjJxdCDzKHCGClA3dC5
 CETA0eab7tnUTvVJQCV+FuebGSY78dvFyK/oDrAIW5Lypz0jsNXKE/R0xZ2HjI3+UjM2gv51CB/
 4R+F4wP4wJaw7+H6hHe5Hv7W3bsdqaBB7czExhY3jwGVABwK9cWGgLZCJjYoC1UolFQdYD7di6g
 T1OVe2pwjH75p4tJ+5Q8b6qb3JUz3zBsTyqJYUJwKdIiJjIzL/lPFSvZ8fxxlACJtjZkIKBzQ/o
 Cx9NrJXNm7tvQaYYClUA1sxVHhqVXrDVw13pKMvhJElErcxfh1F5K90SCLXBE3MyjqfFqPwr0wp
 +ii0lGDt5DsiNsl4R0SlzJ1JsY5VuSi7D11WiFnPkDkipuRttcWHE0WiysvWujR5HXoRwt1B4QO
 rQvAPeJEOgPpxadychQ==
X-Proofpoint-GUID: dvoKZOHOYFf0jcMaSXwoiyquy9-d9aXs
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba2490 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k92yKOBYwQCJlanLp_wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: dvoKZOHOYFf0jcMaSXwoiyquy9-d9aXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98313-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 179552B5A54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/2026 10:53 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Add driver for Eliza SoC camera, graphics and Video clock controllers.
>> The camera clock controller supports the cambist clock controller and
>> the regular camera clock controller.
>>
>> Dependency:
>> https://lore.kernel.org/lkml/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com/
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>> Taniya Das (7):
>>       dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
>>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>>       clk: qcom: videocc: Add video clock controller driver for Eliza
>>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>>       arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
> 
> On which device did you test it? Considering that you told me you did
> not hear about integration branch with patches before, I have doubts you
> could ever actually test it without our changes.
> 

This is SoC which is already tested with our internal mobile platforms.
The SoC w.r.t clocks remains same and has been verified and work well.

> But regardless - on which hardware exactly?

These are our mobile Eliza MTP platform.

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


