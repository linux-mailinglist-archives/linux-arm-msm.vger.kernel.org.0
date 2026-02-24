Return-Path: <linux-arm-msm+bounces-93962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M5GLKKMnWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:33:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A94F18657B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 12:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6307A30D67DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152D137F739;
	Tue, 24 Feb 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WV9qkeNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yr8gA5nU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40137E31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932416; cv=none; b=OX6iNzHwUJ4mXm+DaORH8/fviWWO0PKD/5r1P5Cpzeh5hycwxarwaCbpMPte/5R5x8cIcEVBFOXP9NWlV141hs3wA0UNlOzz1AamR7c4oD02/3d9PZvVpCsGT3QO5HiBl0OZFEJ6jMue4oeamzuDgSoCuhb1YSTIEJIgAmxQkMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932416; c=relaxed/simple;
	bh=i1Uz8hHaqTmYPcdRSJg+1W8ERWsTMCsfx9kNmvap+2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Asy0sR439eSRwEG2C5SJR/AFrPfrYieovngKAiCy/bKzX5QLGsYs9Bo/y/M/h+TNeSKe8RLfl/jUBothMokqFbYulJLfcAv018pVtztL2uj636V60T+Ggv8tlBkn1AJd6ukyBDmcigeJ0qeK9rypEqzVYG1Dij2LW08go2uYaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WV9qkeNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr8gA5nU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFYRU2220909
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq5ljdhvQpdlrNBP4J73pc034HqQbFjPgysDzmTkskE=; b=WV9qkeNjVz5iwuzS
	ofkV4JEa/zUJST0YSlVQ6Y1pENCM4JjEBDJLiYggkRw/ox39lcSt4COb4/v56C0A
	UTX/dxyfYUn5H2GiBSR03PID9A/62y2aZ86HGPbrCB/1Wd4fSHlyitEpESc1FRzV
	3ir8RHd43PICwVfMLp4KdYM7Pss/6zq64pXnRXuaTPNqQUnUV6Cdd7NtqR7oWmfX
	Yjlk+BG02y/cfrmlO2BqMZpbgB42HhKybtzPgn1LRm91Dgtj9ex/c3w9WLgkQbmB
	27aX6fmBkv764wOim6Mol1Tvpcela8nM+pJO6seTDtvm1IR9lyxQd1fLqiC7qR6f
	CE+YAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e398ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 11:26:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so543289785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771932413; x=1772537213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fq5ljdhvQpdlrNBP4J73pc034HqQbFjPgysDzmTkskE=;
        b=Yr8gA5nUIH2BbQnhITi+7eW9oLv5nr+vgJlAsVkfj+AYPXxZRT9vOSQ1wh0tRy7Ix+
         3AEp4aAo5ixakiQUHCOB18NJV3GGRvyWRoqtLstMouMK4+aRpeuC4TDGRbZgrVIwaSuY
         ZpA2+yUxiEUmHaO85gpkqcaK1uyyeoPMHtW4D8fAIz4njUK1UeIM8tWSjqOERDkeeIP6
         7/HNVldGBW1KnwXJY0AfJPG5xLPcq88hu8nzAvZQ0u+XXcF25SmFwb5nOkkBXCHo8bA0
         CHO8cZQayLCUXbVhYkNxpTKzaNbjYVP5MSCrH6wnHBzxY2nIqcIZZuPr7eyWClygiDOo
         yfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932413; x=1772537213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq5ljdhvQpdlrNBP4J73pc034HqQbFjPgysDzmTkskE=;
        b=l7RPT5602i19eQEuZ2+8JwlutzjJXrwchXwvIs46puLnmIOMNSmD1KnZkAwy/OFUnv
         FxUf/KydQXo7aK0oBzCrPItjZv2Ls0hTj6xvwgrAQCYz9GxCju8rrpVQk2AbZTHyvHOr
         tEQR3hXauXq3obF3PWq3rf0EQhAaTd7nbWEf8AwvxjUR9DPzNEch35D1uWe6AUogHI5i
         vnNW5dE8jeUF4yOIVDLe1mCeEsYfzkizvF4X0Y2kTw/IH1qKn3cE1QCuFDk7eAiEG4xw
         cpU6hFr5LRwau4/w4HOJ+xfFNkvC/WZnfDMV5amzv6PKysN++fbkl85S+4TYOhLlpH3t
         H8UQ==
X-Gm-Message-State: AOJu0YzxYA0FnKDobnJIvtQFs7bhvR0Xxsys5fF1zFz0A3m6aipGC1xS
	CpcKEGOfayNR5S0rv1HqKzYRvMstHwfLBzHoBMwpqvo9d64gWV9aRjiLtsidHs3/05FM6OLK5Qc
	IZZH84Rncm3SZzsjXvvDWfRRmUnoM9I+vpby5nM04BZFjDblF8tb1ex+DQbNEVSSwMqZ4cb+J7s
	8O
X-Gm-Gg: AZuq6aJ0La6NJLyt7OqGdY60U4m3mOKBr480Q4zWrfw4pSKI2krgLTgrRw1OAdcIK2u
	upDQeU47XdhM0qKgro4z5gU/BR38tqb2SYnVF8NsCXEAi7zFcDp71jBd++/5mnXn3ruxjO2lPVk
	Y8KEzyEE/j+ZBuN2Ec4ye3UGmwp0MHzo+cUVe0wWzJhC69YLuz/1hipuxdVQvxsJovLcyLiULEC
	CLZKeE8G24xVeHm5x1HCMk2dBdIQ4uJE0RY3osyBMn4D8/jlIfBIK6lNHardEXwsCRNGFFDqg5N
	U70tHsaoTPTl5D1E5s+CtQldLcx9GOUjfuOPshU2xFMVEmh89s8NiMmlDQd45rdCY0G0YT0uRGK
	DcFVFecbhC4Mi/X6dU7lgT3JGVlQDq6GSjzeqdEcE0uyJkxe4VbMQeKiCBjz/Omi/5hZwLAaovw
	CamWs=
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb8c935646mr1114292385a.0.1771932412968;
        Tue, 24 Feb 2026 03:26:52 -0800 (PST)
X-Received: by 2002:a05:620a:c53:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb8c935646mr1114290185a.0.1771932412508;
        Tue, 24 Feb 2026 03:26:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eaba1381dsm3466546a12.16.2026.02.24.03.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:26:51 -0800 (PST)
Message-ID: <be919283-c34e-4f03-a866-4a100a0ca5c9@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 12:26:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd-mapper: Simplify code using of_root to get
 root device tree node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
References: <20260224110213.3929063-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260224110213.3929063-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699d8afe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-8V1emER5OjnXxvwXfMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zON3d_62vuvg2AHTg7A4FZVtDpfx0qUF
X-Proofpoint-ORIG-GUID: zON3d_62vuvg2AHTg7A4FZVtDpfx0qUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA5MSBTYWx0ZWRfXykEX4QPDgAMR
 CH4iD8W+4fUZd/7JiSKo7MllsxFZU8uCA+wEB7J15+Jt9/mbGKZvPDM+pkMUPjLfbq6b7d8SmQ4
 ItNPyXOng7Dh63OS6Rw0dT4ibYFatztPDB8rmyu533iqk84KSM53mlQFfPuLFzPS8GhUKEKWQEF
 AZ5iUOINMZ0EBuUpeNcFIf86dL/5gL9jDwWHu0HQy0UzHQ1UgVEgHf7P9jm1oSWfOVEISfnrJ+4
 kELWw20NDxpWko+djdM8Hv+V+LiLjhgYQZbRhxdjNSRJvf00Vv3Uzsk1Esc306jutUYhDjm4Pa8
 nvtzVE8SEd1ikNh7HzWn7j2NCE0o1ORUKauO618ruAjaBbeFXOU+J/LfbgbW2L7ng+OUBiHDNA9
 Rg2zOn/YItDxCNZpsHPNJ0wyLecvZVFeI6rBbAnjbxjseCVFopOXzxpBpZXEmrehgIbrJRxDAH0
 JLLDb85bxjsGHcgVaQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93962-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2A94F18657B
X-Rspamd-Action: no action

On 2/24/26 12:02 PM, Vladimir Zapolskiy wrote:
> A few lines of code are removed by using the global non-NULL of_root
> pointer to access the root device tree node instead of its recalculation.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

