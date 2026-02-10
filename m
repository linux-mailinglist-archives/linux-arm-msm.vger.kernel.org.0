Return-Path: <linux-arm-msm+bounces-92447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NkTMxn6imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:27:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC17118DE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D7F7300690A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDA2340D9A;
	Tue, 10 Feb 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4HfFm6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ial1hhCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFE0340A76
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715668; cv=none; b=Zwc2RCz2n5ripeNv3FOvhLmfTwGStp1/1mTH+BP26HRSS+GZ0XSaLkZx4eZ1ExZAMf74cEU7xFC1aBke6WomzgoViF3rFye+a2qffe74BHi8XMQf4fM49GsXKCJaEqrIsNZuUw40hbRJwh1o0R7nnId1xtERVwhFdrRfCDNOAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715668; c=relaxed/simple;
	bh=8VakcWDVi7zIGTDVo5kETSCQEE20JVTwYSWcfemEPJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mWFz6cO8l7pdzUzkx43CoxM6wIeCiW0re/4Gxo+EI7HVHOjQy3eKZbpt7iO2GafXANva9u6NcnDuP2sBs2VSq3JK2TnejtHNIUPLWQ8/PI5B9RucaylRvrcXUGKhZw7hBBwcdEXanR2udkBI1PzgHC8JOSiCcjDUSXL9Sx1uxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4HfFm6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ial1hhCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A76x3p1151739
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeEebfFL4tWFiBv8fgLVar0877GIlm8tpODyhjaarbU=; b=Q4HfFm6niTIgzYlG
	m0ODJEX2qOatac1uSL+IU6WAygE4xjEgKrIH1WuZb9fIPOmcpV7D9Fn0A7jumIzt
	t5iE9BWPqQfO+bZPoRrdLXF2+FoctmP0neL4ylW7+TzWidr68+KlY2HoOE8zGvjV
	wSO6xoyjm3biVQ5lTQ7KpjwePEXtVXW5GDIy7/10XwUpRTZdxBo/3Tb+uRqmLvQA
	3ZWXQ6DJ3xTajInQynW3jA9xMLGstFaAQTYr18fWC06HPfnLmWJeklmDYLzZb2fa
	AStF+yTjAORA0XiZth+Ype7ttydfRiSJzkjg5hnV1NH0/sfsS7jSjHl9suZMnToS
	Xy3AXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j8gst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:27:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946ebb51a0so20025696d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715665; x=1771320465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jeEebfFL4tWFiBv8fgLVar0877GIlm8tpODyhjaarbU=;
        b=Ial1hhCPAuvnxKEUn0GHWSEe+32mXh//JMjW+pPKECfFMjV+wRmBFXxO2UZcvq2KVM
         LRdriwCN99mTlYWtuPHqxUqBTSxwO2C9gX8fE0w7wPFbA3/IWgoslw/KdgogJb0hC2+/
         UsdLZPKrV1FsTwVp4Y4AZSTGbKR3kKf8GKp7FqJ6mR44X9Riam0sjqoeurQqsATEL0LE
         vZDfs9fXFd6PE1AWe8R+fem9MzNGE38CqWLQ8gyV3CLhYzqeD5LT83gx/HDVyxziG9sv
         dY6BiByIVJP+gKKjAs6YgIxpMWhLdK7uevw/OTOIbwmO9zWQypako89J4uzlUZJoFLvu
         VhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715665; x=1771320465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeEebfFL4tWFiBv8fgLVar0877GIlm8tpODyhjaarbU=;
        b=MsIjxp9fYrDeYaCadQS8f1TZVxM/oNtIlppl1UdE1p9bh9QYAkZZ5CRq7NWxYLngS1
         mwARHkeVCWnQZ2UHc1qRxkjo0lYlrqSU1f7ahXdVL6KT3es/AZuwRJWL6GxUOdMaIAiE
         u5CGKsczjAh7xGF4B2rX7qb5gJPItSIR5y5x847U0esnoE/xw/kwvHLYm4GZjR2FHwSN
         2tA0iTbG1QwRXEsnRRUwFpt+eOBlEyBZ0ra1tJyqY4O375fIuZnrMLZU2xsA7aeCZRiC
         N7OicSXwL1CTZQ24MbI2vrrcftJ2xu6OeaKL0RzLZYKtyv6Zykrz7fKHFBciGRKAxJ8O
         FFVg==
X-Forwarded-Encrypted: i=1; AJvYcCX5aC+xffSqptUgL95W52vBPjg4AXNzlPVU9GRjq19sy8SWOYo3erUvwLYrshWcvheV/qyAWCbhbEJXklIv@vger.kernel.org
X-Gm-Message-State: AOJu0YyHxFeG0iLajHDLMQ8Fl/Kt1HfoFl5fHPWQ8Y9n81P4KVBZtrf4
	9XYe2UHCjZztvUqL+5IIlBfTGuMCjE+plkETxf70kstV2Qy9489dvyvtphjZRrjY0GME4ykumpE
	uwdD2tqP5N5S9H6Z90DnSQlJ20XVhrh48yOi4NREvE6W0Ml7sl5sbPUXyjG4SAhU1MzLq
X-Gm-Gg: AZuq6aJpjI0t2BRE+3uNW//eF6IO1VZokMMS8W8bYQ3Ix+/ttgtYodVAMRkOuw7F94G
	EF9k8TmGxjT0ZgqhzxA6j0kc5YcBnFzZUMQFt//eWeXFZCKePjqMEIM+1J/CyAhnu7fJTptNXFz
	mleijlAS0wJ3Xvslh/bUqHM8kc+kFljkS7DyqNhiz2XMbvoqqvqZ8vuKVQ5/3/9h/6hykpLtCsd
	CcoptTXtQMdnwrfXgcld3ZXD11GWaoZr5oJ1chajWvndw+GD52yF/kS/UkPC4hzeA80pTgvxKxK
	+AsQOMYDLeRks5QH8oDlUcOgtoSWuMsettImndBpirlKCK4yzHWMLGrbhoXFWphLrfhWMF2fOKj
	D8OGx7OhHf5N8NQf2iTRIBHmTkr3GjNM0YoNLX0434ZkUqSqjWdyYpgUnhOKjInHCudg523X0io
	tC5CQ=
X-Received: by 2002:a05:6214:600d:b0:896:fc89:b21a with SMTP id 6a1803df08f44-8970fe835cemr8047836d6.4.1770715665483;
        Tue, 10 Feb 2026 01:27:45 -0800 (PST)
X-Received: by 2002:a05:6214:600d:b0:896:fc89:b21a with SMTP id 6a1803df08f44-8970fe835cemr8047676d6.4.1770715665103;
        Tue, 10 Feb 2026 01:27:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6598400f0f9sm3556135a12.16.2026.02.10.01.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:27:42 -0800 (PST)
Message-ID: <026ce34c-c880-4832-a791-656fb245a495@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: llcc: Add configuration data for SDM670
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021957.13357-1-mailingradian@gmail.com>
 <20260210021957.13357-3-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021957.13357-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OSBTYWx0ZWRfX49uMZMCJlgJI
 XM/qlLJ3Zi2hFHVUPf/lyBg/nq5U8FczLBCoV58Kj3kbxzoXMj2b/z1/jsGCQg5CT2RhlTtL2fW
 4MV3Os8xK5iMLxAGcr85kbgO13GgHYeUEuh0wfw/u8Luhsr1OqiJlUk2zL6ieO2N588e0n9tK0J
 9wD4ABe332AlHkMbepK+0oln4e1DaSn4a+lzO6RPwml2crBNdCt5tfQkNQYhZMP8VdOfXZuanVH
 Cp5ZoeW29k4iJH+iR6YXi47cVecRGxldJRKsvXAyykwGj1iBaGshHDDfohZ62qIlxKtiQXowMQY
 Yhv7P+r8/6lKQ/2ZeiijuynS5WbbLeM6rFM08Ug58cSQjuzaIM98DKrxNFCHrihRcIY2QkxHvN5
 FzqgnEGI11ixaCQkVGOuHOVm1HbfuiucRl7u3MuD+QozsNK7pNzu08+LR92V3b+8ZYvldxqqcG+
 yvB9OGAn7BHNhO0go5A==
X-Proofpoint-GUID: xlcUGd7TEHB5Mj02r3F-HjPs7Obh0R6B
X-Proofpoint-ORIG-GUID: xlcUGd7TEHB5Mj02r3F-HjPs7Obh0R6B
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698afa12 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=z8cJk1-d-abATlfEAfoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,huawei.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92447-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CAC17118DE1
X-Rspamd-Action: no action

On 2/10/26 3:19 AM, Richard Acayan wrote:
> Add system cache table and configs for the SDM670 SoC.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

I have a clone of some msm-4.9 on my ssd and it roughly matches this
patch

However

In docs, I see a version with only CPU_SS, MODEM and MMUHWT left
(your settings here seem to match), dated later than the last commit
to llcc-sdm670.c in that downstream kernel clone..

Because this SoC seems to only have 512KiB of LLC in total, it may
be that it was found in testing for that configuration to have a
better perf profile

Could you please give it a shot and check if you see any immediate
gains/losses?

Konrad

