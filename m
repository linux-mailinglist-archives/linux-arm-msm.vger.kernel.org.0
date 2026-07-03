Return-Path: <linux-arm-msm+bounces-116202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s40nBhNqR2rEXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:51:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 868AB6FFC19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:51:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EFH3Dbcv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ba+D2z10;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116202-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116202-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38BB0304B98F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFCB36A34D;
	Fri,  3 Jul 2026 07:42:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402CC369D5C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:42:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064556; cv=none; b=XjS4bWSjKmqYnUlCaMofYxdcEUg9DDH0kJlgW+4SF950e7nOEaLPwJvMYVVs4PszdtcNjNW9ICK/JP70S4En+nUdbUKfZ9r6V7kqk5MXykh0tIXaozZLMtvtROIL8PdRcHkdsCV6kLF+DYDONtH5SaJxn27dg8kdhnEdwgJYHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064556; c=relaxed/simple;
	bh=BzjWFRb3b9wkGzZJrhXMK19l+atse9KtontvxIdAvdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxoN5pGU7+9jkvmcCFeX5DlDn686yVrTjr6QHKfEtvgGSu+sFVdihfxSYl32wQZ/7sTr3SS0zd3o4+VjZsHR+E/M4MAs0Ehl3oyTMfVUriqsiqyVyjWqzxI4ZLhT1MXXO7+CV3MWqz9eYpkiBhA6mQbnTFi4aewSEF3EjtjgNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFH3Dbcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba+D2z10; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rgTV3136151
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=; b=EFH3DbcvmeLsz2rQ
	qNyoRYSVImtQszdoukdpJcm80NL7eWBIR2UeL4A1fr26BHKXvQBfndZOM8Nr+vX+
	/y/dva1+SkSE1PA9fTDgVV/MTVbJH4PAwv/d7sh5zVmQtATSjBRODeIQarrzCpUp
	Fy3oCExCNRvxFX0GHHlb2YeL7QkQul7CbfAM8MvVhuK87q5VbyXlysyo1pvlxvqA
	9VqXH+gnn4abck+qYYRl6QZhs87+mQMY34xz1glyLhUcoceFPfWOXbT1O1wvBrxY
	cfY7VWsVhP+VZgUxRn6owp6NsEsyNd6nn9LD9+mOyuAkoTQ4edx1egpSay4xooZg
	VsDg3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b598bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:42:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so1302711cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064553; x=1783669353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=;
        b=Ba+D2z109OQh4jexEBRWWVmqFXPwCoR9WqvROPcMcpshHvHgPMWfXxFE1uDCzXJn7Y
         cOz14N3sJIutYRpydXC33ZBqtI1Gc3GM62k8fYg+AdEMA4UawMMSKDd5QRwm9qErizET
         iAJqXipZrJxTBZwiGAeIbXfMK6TvpA/PdGOjkcP5/Nx7wvauRb945+wYJvyuMTkujkN/
         lrAOJLCNLhrDJnvo1nNrs2uiyTD82dedijRfPLno1IPaj8X6s7Aw6Y4ZnJO/T2gN72u+
         CbxPz76vf6ucdL1TbQW5XTGT//88PeWO0Afo86c1uxnUhN2UHbF/7+nK3jhknZ3vuNGg
         PVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064553; x=1783669353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=;
        b=qBpydfGMU3KoU4oeSYppcBjO4lu5V+NDe+TZHz+FBOISCRqKIcv4Cz37L/k60mhGLx
         ziwKtS3cyxtNHIH6IZ45ko8rRMYwPTaQl15HrYyCe2jOGdNQcpkIw/3ZWDAlD5Og/Kr0
         phpwQjjObFqUJ9Ug4u8t7ajp/FG/+RMiFEc/XjOMTtHXnWLlqJMCBeuzJTftwH6f2aqH
         seh1u9s+lF68q7ZtctDQ9Mb2UWVsYBvG6us0ST6E4ynO29RCCNrnq3EJGSGX9wFgrLEB
         FJhPvunIyhglAJ/s96VSuTrrz5H37O7SszgQJ0QJJ5BxowDl/MOdh1+isjgLbaNQgnTs
         lgUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GdrFfNW0m6qdCx8q8OHqcIdYMSCFE3/mW+KpxZViRvEGFvoM2FydAa6ynTkqxMEkcVqBX5w7fjBjSK+j1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XMNGoG3Sl/Qh+1vY6xXT5pSGNfT8EOp1ko4fawTvONtss80h
	CU0cACEDiezJijdPpJlvOqzLs2iNIhm35huYl/CjK0UhoRZdht7ga8FPFE6l2k+nxGkTcsX4G1/
	1b+DhgLuTfu/EB/zeH7L9ooWDJk75HShuZEd5yzgXJvj8d9W/mQAZZ3YaCT46pB9Udgb+
X-Gm-Gg: AfdE7cnE/v55SEms8Sv8y0EwsldlN3rhVlDVgAoYxsv/oO/YAnN2/zCUujFQqQVwFAq
	K96K3z92wrlWVhwxDg+AIBKVp2XvHGIzy3f3ioXtATF0FXchdjnETQUsBqzhF8Leo0YI94Lodat
	mAFu3aYsHXr9p0+XbbgLgnWhfhwHODow/trtNuqZe1r9LfnxrZ8HmfFktpJprPjY5Q90aBGJX9z
	6BZBJ9PaJn64Ch8bY1w9EOP8s/lKqAkd/muI1pJ4VRydMr8jQ9dx8/6sdiXqmAPnKP5HaobH0WY
	Lt/hnNZoT+iDeMtbyETgoCPqtKdl9wHy2GuC92gIL9+wvetfxOiD0qMRL89i3ypnb2gxbGlDMxo
	0BFPP46u3tRk0E3VbxLSFhL+VTjTU5zrkBMA=
X-Received: by 2002:ac8:7e8d:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c26a3ffeamr90732981cf.2.1783064553434;
        Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c26a3ffeamr90732821cf.2.1783064553073;
        Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f38f3sm246032366b.57.2026.07.03.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:42:32 -0700 (PDT)
Message-ID: <3788c687-b913-4b33-b105-9e10c2721536@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfXwI5qwv5EZM0W
 v9yYqZ9e/92JecWhgva5QxseX9kngALlq4ehJMu/PlYV3KxmoZaj/zaQMXjlQZ1AAMbdSAKCgad
 clLCP6TGs0vLDtDPBvS8294m4OGjals=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4767ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aPmvuzYC7OwECpyIFukA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sFZ692wc_3aQVD7127fiHMU0TcCg-Hhz
X-Proofpoint-GUID: sFZ692wc_3aQVD7127fiHMU0TcCg-Hhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX1C53vjzHMBMl
 vu+3g6t1t3DKUnhNKvVSAX6JNseBspPk4aJe5LnKsItKFvzX8e8Sr7vxgs8jpGu/mwi4HjqLLHy
 soQX31oADN9MQXvA+abHaZJKAouZGsOnYQqVrZNcsWB9LYT22K/kl1Rzjn63HNHRk+k4ElHXE28
 aJrfVHx132HO4IHWUYSAzel/oTJTcw++GV2xZqgNGIXaIubh6Xk/RkQsF3fvRydmVJMQRgb+b+M
 DtSFImuJu351OXE0aspSz06u/rhVtLlVOltfifeBXww6VYscDneElI2sGZ7G0k0Ud31ZgSm3kOq
 nZRHWz4xykOGzFahB3jBQz5pohFczuHl0+ch8ltkGb/Yf+ievjsXJOJKmUBkYUtRclgi9PZIHGz
 2JWZUPvOIu9sbWzWa9JCzpZXajobiNoavDADm3aDjl/8ErzQ9SMAVk4mSJff8D0LVczwlWOxFJS
 JU8jFnZQaWh5YECQq/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116202-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 868AB6FFC19

On 7/2/26 8:31 PM, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

"HW team's" > 
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

on a note, also not something downstream does, but hopefully
this is right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

