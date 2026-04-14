Return-Path: <linux-arm-msm+bounces-103150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDq4NbBT3mlIqQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:48:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 376CA3FB784
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3B6830097CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2FA1B4224;
	Tue, 14 Apr 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMMyTpJ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CwjX+o/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A0EF9E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178093; cv=none; b=Ndx9rhUUHTG1/NoCz9/TI72WSNIH5KpSzWf0IE5zvxumPGQpJ5Jdg3EukuvAMOV4QSstUm+sKet+FsAOfbBN4FD7Wh2ZGHxUy5w3OjVoDj1ESNqkJBmAVXBbmAHFQZG+eD42oDqchY4zgsTQvbOpV+fwhsuN1r62a/QFMgNEw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178093; c=relaxed/simple;
	bh=F4KrN7AxWl1zxvFjsxoDq7IgNFLpL0NQ0qQaV4v5U2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZPUBX3szg/PG6BYU8PdOxRJtLtfQx7/MkTuKRCh42DpGF66V3n1UGWE55RElAcEl8gTyxaqDcCunUkECtNe5RjifYq5q1EoQcULF2fnw9h+DI4b03PIa6haTK5JIuu0Aat9iD9H41L2J4B48McSfWxVOdECt0JKpjhVmm5e5NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMMyTpJ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CwjX+o/2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EC2TMG361834
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asIz/goXM85jx8Mtx/IA42gOXbEjTcLDg3RNbVf0uDI=; b=TMMyTpJ0SSjVBYqU
	btGRqb3op5XUXdbZUaFI/uSd8zvCXcYPVd3/mmffHe8p8C8r0FtY217bMo9vQJPP
	QL2lW7JB+JtX85N4SMFL/iKURvd74y4ej7KLOW8Dt+3GebWPKY9h3PhR8gXYcuqA
	VWMivjyVlPeIQuBuffqCVQXtppfc3P95pEpjoH8EpsSrZLcQj+G8MaU4+75y+QqQ
	7GRfhzEIOGEE6azrOnT0QHtTO2nZ/WTRfGkZJSzSKGwTfkEhHsEa3mf6TGd49yIF
	/wSiS6wyNGOxNsnAwJ8Y/NW1RKa7TPFg1Ro7s8xekkqgFYBKr8O00eli3xYTdaa6
	opMQQw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870u6sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 14:48:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d840206c3so9617131cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776178090; x=1776782890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=asIz/goXM85jx8Mtx/IA42gOXbEjTcLDg3RNbVf0uDI=;
        b=CwjX+o/2Bc1Jzp19qiHdWmj4fGnHsnAZJ5wRgKGy+asnbXuV7jJZDNFZLfcjL0etaV
         9VDLKRi6nr5e4w4nF6hMeLhKy1vIj6p9ZiYiksfUX0iqfvVr4E6F1g1aIDBsuqB1ePSB
         u4pCYFI4eaqpA3Hx3LlDVj7EBIdjDGAnblVZF+4Z/vsMgRvluAdNowBgN2GgxsXMBPCX
         B4Lm7YKcTPZWUsy7c6+judBTMiP9jkIVUSSoZbOTIehzUJnHhV51PBApXjvTJkPUpzUA
         Ou5kNVLEU2lU+f8P6AYMOr2hSbYVC1Xlui3Rz0MNRjKzFRMX7bdDTQPf5rhkfrlQW/bX
         1Y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178090; x=1776782890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asIz/goXM85jx8Mtx/IA42gOXbEjTcLDg3RNbVf0uDI=;
        b=qUMQtzQWp1rmYl3PzqeN/6NVE4EKDMtGyqHf3rGzktT+2DWVR3BXY7tqhB+otBnO4+
         Z5WGhqMVlcpLrjBVoMogHGka2U+b0bOwe5XZVf+HpUtyKXpkopBJAOXZ5Msu/IOQUyxx
         xjyKtQNNnxoPyu5VDbgTBU5EVCv6JTZRtT9qh4kU54sU7g1l7enI6m049MKFoYvbKFn4
         P56dZgSArPYroLKmpfHUtJ09bL2MzEkrLtotnG12AwWehGsFSAvtGHgkjHsHNNfqWmB1
         vsutkqYWiuJhp9hJyPzDKJLE7+9Vr5Dp9ShbnzfDGKtWLJRgCL01CbohfosV6voJLRCF
         RFvA==
X-Forwarded-Encrypted: i=1; AFNElJ+o5xy0Um/3FtcFopwNh3BuIl/vcNg7wOwxARWq9KmaiVRoNlCUGcX5dCVQXJcozxk9M3+sKAcEVzzY17n0@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMDr26rIhsGo9P/o/FADaB46diHOXsCNg/cynMkYqudqAAXOl
	TcQTVDyWYiaWfph0dqJ8mp0aaYqxQVqz2G3zSbNfVec5JLqqDzsvOiR/4huJjY6pL74EQNNl+z/
	wvbFpvlI17ji/srq32WBCvKdplqjYU0L2mNSAw4sOPBs3BOOjs4AAWbYqQVZPXGnNvaiv
X-Gm-Gg: AeBDieucV+EMDoPFKqGhH5BtWhTG0/Eg14qw3kEPjDKCOND9P4ou53Ur6Lyig1vBDoz
	Sp08cX2LR14kIASvCdTKiI8iSQWBdtTue73uJIZGJvZQfYt/M5unjYN4v+2o0ch4f6FD/59LOg6
	UghRi+PeuNsIQWyL9r84lvnuATQItPE3/0s2HahrKr0FNG8GfcUGDTs9nq7vjj03pvK4j8Vpfbw
	yWsjOHv0WjL8BZJQSpc4W2Bb2pA6xC1P+zc76UEwfG8S7e2hWUGNq4gb8LqC+objhqC/XTf/4Lv
	sMVWp9LIOqn9kemCKgT9diUQuEZVI7WmBTHTG1K0pS9MUXOn1P8tUK8GFSWTUasrVFjCNlzijGA
	pT/HUK6mfkki7sUGutT99CvRjVkzWFdYwoPW6o70XLQ0rozQ5HjTB6nAIknTbxfeXvFZTtz2IVo
	HJIaFu4p1ZdIBsIQ==
X-Received: by 2002:a05:622a:98e:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50dd82add60mr172439611cf.6.1776178090617;
        Tue, 14 Apr 2026 07:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:98e:b0:50b:8ccc:a41f with SMTP id d75a77b69052e-50dd82add60mr172439181cf.6.1776178090154;
        Tue, 14 Apr 2026 07:48:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f1340sm3291881a12.10.2026.04.14.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:48:09 -0700 (PDT)
Message-ID: <6b19880e-83b4-4811-aea1-dac6cbdce2f3@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:48:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-4-4bb5583a5054@oss.qualcomm.com>
 <73196147-0133-4646-927d-dbe93c254286@oss.qualcomm.com>
 <a573a9cc-7426-4d80-ac9f-e084e72207b2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a573a9cc-7426-4d80-ac9f-e084e72207b2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de53ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Kn1p6E0Hg4E-9EtVOsMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzOSBTYWx0ZWRfXwMlnKq8XtPYU
 V4dUU3mmp9MSC//AvPB/w+uYMD9HgfdB6TN9LFXkfpBVZrUA1RGyV7SJvC49cpJwulgEDyEiFe/
 198gWAnEUQ/qLZaNhtrgjT0tAZd1nU7yHR0eqS4Gs9JCLhAUEmkM/4KRpnneXT3XoPoOlmhV1+M
 6XLHYG3DFhiPI9yurkNp6jNPutcj+8/GtACqZOJZV4369dBq9HdkVcnDk1K9Zz1J466KdsFYBKW
 NFLBxMlRtV99DrJobWzIr2vzOTHT2rSGnSBg6XtA0+8IzwDNPjtz56klxHtsrD4SI7tpUbIBhHo
 /cl9pPjbah1bEnhPnk3bG1/pjLRV88VfX6C7HMSIMXa3FHR4bbv0m0zQY82uugUcEzAsPNAYGVp
 sHoauMEb9mzi+yUq+3X1nHduCfVX6hLMg9nUrn9NYGrVNj2wLRBO5azWYojGE63SULKIoBRtVUs
 uvo08yU7LAn3n77mzvw==
X-Proofpoint-GUID: LmPkW8_h87kpZXWAtUTVXKl10Plnjic9
X-Proofpoint-ORIG-GUID: LmPkW8_h87kpZXWAtUTVXKl10Plnjic9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140139
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 376CA3FB784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 9:25 AM, Taniya Das wrote:
> 
> 
> On 4/7/2026 4:59 PM, Konrad Dybcio wrote:
>>>
>>> #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h> @@ -61,7
>>> +62,15 @@ MODULE_DEVICE_TABLE(of,
>>> gx_clkctl_kaanapali_match_table);
>>>
>>> static int gx_clkctl_kaanapali_probe(struct platform_device *pdev) 
>>> { -	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +	int
>>> ret; + +	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +
>>> if (ret) +		return ret; + +	pm_runtime_disable(&pdev->dev);
>> My understanding is that this works because we have more than one
>> domain associated with the nod (so the generic code that would
>> otherwise enable a single one so long as the device is resumed
>> doesn't apply) and your previous patch ensures that after probe, the
>> clock controller is being put to sleep, right before
>> pm_runtime_disable() executes.
> 
> Konrad, by disabling runtime_pm will ensure that when GMU is moved to
> runtime active the clock controller is not runtime resumed, which would
> prevent the votes on the rails as per IFPC expectations.

Right, so the burden of only accessing the gxclkctl when it's got
power gets moved to the driver (which patch 6 assures), got it.

Konrad

