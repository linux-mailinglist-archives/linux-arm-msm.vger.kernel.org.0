Return-Path: <linux-arm-msm+bounces-102264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB7ZBCgD1mlsAAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:26:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD3C3B825A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 09:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9DF53017F34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 07:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27997381B10;
	Wed,  8 Apr 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxWrO6rl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bexe6d+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDFF381B16
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633172; cv=none; b=oTxMfDkDd3Bu+xOTxi9IHDGKAxQTaOfuc2/RhLjtN8m1mxaJTMjUsVaRPf1WbJtsBSBprE0VLF9HIHWDwShNy2jPSVKwXe6KrHCPcWe1bVGTpdal0ZezFch3UcSMoDUpbCALBXh00DamgTAxVVhQ3WBXyZOJ/nDyvxW9Qnrrp6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633172; c=relaxed/simple;
	bh=Ig5jcY66F9voThV2woqtPxfrHIzxaD+lt/JsXQI6rqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CergS1A0GcrRSii71EKeB1pmU/0dxZGFOsRI9OP+6QPmbkPCIG8HWfSlBLanPa65mORnpJL1zyNtBwrxUGlkOvDZjOYO/nr2ZN5YRdBl3gp1XSdAf71ED5n/ik6TIRfcyIhQT84ag2p2Y2ZrjmAnsQXwIlvwndrQDJURL/NYi/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxWrO6rl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bexe6d+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6382ZIjK2412265
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 07:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11H98f1tYHIJpO6RDSqhNnaFKcnwdWAOjgMNXJCTo68=; b=DxWrO6rlXv/xzJmY
	PuJypwdfwep3auuCEBuDudk9VTN1ivnHRmd6ih3uO+QWRP5ksr1+N2jE2o+BDT34
	lljlj6cVRiAPVOPBulvVDDViZd7Eo9vPeGmpQP/zeG0jGDIhppWuR2bgOBAiCILR
	ZyNDF6EAwt8n5I4wUK+HRbM/KXGFEVhWhUmJ2eG0pVPRNAWyBMXIhF7gDlzxj8q0
	/GoNnZHNHs83F+GE4cuojKTGouI0YbaMKN7WfcgiIaksaUwO8lQ1g02YMKFIpN1g
	aw8sGl3pztCYv29nY5rcrQ1L8/GhNBeuxyajHRi2B01qdi4Quk9xzM1eJg5vGQfB
	MrWKjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vaj58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 07:26:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b250d3699aso142303485ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 00:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633169; x=1776237969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=11H98f1tYHIJpO6RDSqhNnaFKcnwdWAOjgMNXJCTo68=;
        b=bexe6d+MPZQrRuSLupaRdi1MKNcq1dIMDKeF9gEhQto9Hz07t1yH2wXhRxObhjtUQe
         cVyjLsKa3gN3rCxvQUTiiWHe7eeAz4TuNVoyMGqTgGROjYKDKqwDfjWGQh1CqaklbrBk
         gLsX+i06HIW0H3qnG8OKfwW37goCkAUxiBktsyqyRbbg7cwEtIVkdfqUGdbc7X1bRxnF
         CqzleaJjfrSoWKHeWaPBa2eZe+BWpf8BOg2r5BZwdj9gBYyMatwskIRG4y4maZBmXcfz
         M+l7xS2rgnMF9YpiGZr2a8tYjziuolRBvDnMKMjTrdxYQkCUIiihtQh/YJ4XviG7GNMp
         atzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633169; x=1776237969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11H98f1tYHIJpO6RDSqhNnaFKcnwdWAOjgMNXJCTo68=;
        b=HBQUSSYO6BEmGBZ83rw031AAcJyz71aH+euRXP0CWgrU6yljSbN6Q1kX30+5XsGUdN
         RVLfinHM09ova2fh/EW1TKME5ybh4FviHFX01ah7pn05t8415r7rd/iH5UiKWRnJnJwx
         5VKN3wJKIxSv7PjX7cfYZpg98uD8nR7WSa2dsPQ0QloTvylAC2QguCSUkYrnBxJJaB7Q
         EcrpdRAs3I5MswIQVQcMXHGSBQXqGbaPIrzLkvmg0h/YNXVOEnOe/0ve4aCP4BTvYJGi
         KCRgaSM1aO7vDujUPMXPVQVTdnI8gFrN+7JdUznbC5QnDu8EvH+kSrpfoDJbEl4Vo0iA
         37Yg==
X-Forwarded-Encrypted: i=1; AJvYcCULw4fxxeG/0hsVRJGEj+06C1znbmpDl3DV3Sl9gNZLGk68aSsXctubczrmXxAoFvfOxVVhRn6CLk34F54J@vger.kernel.org
X-Gm-Message-State: AOJu0YzMidGubeUp7k1gZzWRtBF7lGKqqnpt0V6OtwDVrbbExKd0uPhU
	6gWCjmpqAYsNFKIYlNZx2mEidOKNubq7xKhAonuTFcRPTlnGpm/N8fxzCLtS3TFyhsCR1hqZ9J9
	nQ5Flj2BBr4s49tS+IcoISo4psJkE+oxoHEWv4ZUVyUg2QDltKqf2cxxjGNaYx51Nvd7M
X-Gm-Gg: AeBDiev43ATPKfkGhOyOIJLFjtwsqoBiN1EXSVV2cMgMi//vnvRXKY6hU4e7bsp2o0L
	TDlODoN+a2JproQpI6TqXYCCWZrN1hrkq8MYQ9acNd/oA5HsCcyjPWlZob3iXqYO4O0n7uNREsb
	4IsvCfHJzCMW/pkjaUrBBdCTJfCbDUFYt+loC1IH6IBU7uZDFB1BQHhZH9oU2ZQhOuN7SjtHHdF
	UhNYT0i7oMVSUD3kHPATC0v0zF+R88uwgdIAc/mza828Ggwq7wmM0whEEDb1e94jdD8O6JHwwJF
	xaKBhA9IEE2qv3jQzjpMWG3ywTwIbNFNzaJQpXQM+DvzZRpo4M1KpsJuCQOpd+W7P2hL9e3cNqv
	6HkpwxpSKqif7fUin7m6GCHmMkxjtkq5rYt4UMFePyDudwbWv1A==
X-Received: by 2002:a17:903:2c05:b0:2ae:7ed6:46e3 with SMTP id d9443c01a7336-2b2818016dbmr223333195ad.27.1775633168696;
        Wed, 08 Apr 2026 00:26:08 -0700 (PDT)
X-Received: by 2002:a17:903:2c05:b0:2ae:7ed6:46e3 with SMTP id d9443c01a7336-2b2818016dbmr223332875ad.27.1775633168219;
        Wed, 08 Apr 2026 00:26:08 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a4791sm192337875ad.66.2026.04.08.00.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:26:07 -0700 (PDT)
Message-ID: <a573a9cc-7426-4d80-ac9f-e084e72207b2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:55:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: gxclkctl: Remove GX/GMxC rail votes to
 align with IFPC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <73196147-0133-4646-927d-dbe93c254286@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NiBTYWx0ZWRfXyMBpXM5UB8W5
 VOG4xdXn0Sc0TexIBi4gxi83GISP6G46Ar0fyvOTM5S0Ck9ZQCHS+iyR2p5pFY7bPMqwCYJumRx
 lQKOUAzd/Q9dfWhSFagG1eLKMEC22NMf6loee94kNNOUBPUelevzPytf2Ru6qYwehsLkPhifXnG
 8BY7wXmjina/LiqPTwUgyBIMtmSgLUJeG9++0XBPb049M6U+5HFGz0pqRqHGl+zByHT/ci/NrS9
 LyBgTtKajwjWQ6+b/zpMUWVl4GwnAPmjDdZF5MrUfGzL6+vPaNR+WDj1xWLELaW2D4tiQqJjqw/
 rWP2O0FgYbXbZKzBeBxQrwKAWNMupH3qpz+eAv12Q4M5HPsfVwKmQL461YoPbuX/di13ApKCoPu
 Eg6nfLIIIpcNA1UQhI422piuZeIKXmBkUI1HaHR7sSaMaYEY19jefyppsYZ2o1dKjksT4bWyyNu
 r8K/6fjXbd7u/undMPg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d60311 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=lwYRxUUayc8gUbovT3YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: hzcYq5fm9YZBaKPsTjUNOOpMQV_LFM-R
X-Proofpoint-GUID: hzcYq5fm9YZBaKPsTjUNOOpMQV_LFM-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102264-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AD3C3B825A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/2026 4:59 PM, Konrad Dybcio wrote:
>> 
>> #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h> @@ -61,7
>> +62,15 @@ MODULE_DEVICE_TABLE(of,
>> gx_clkctl_kaanapali_match_table);
>> 
>> static int gx_clkctl_kaanapali_probe(struct platform_device *pdev) 
>> { -	return qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +	int
>> ret; + +	ret = qcom_cc_probe(pdev, &gx_clkctl_kaanapali_desc); +
>> if (ret) +		return ret; + +	pm_runtime_disable(&pdev->dev);
> My understanding is that this works because we have more than one
> domain associated with the nod (so the generic code that would
> otherwise enable a single one so long as the device is resumed
> doesn't apply) and your previous patch ensures that after probe, the
> clock controller is being put to sleep, right before
> pm_runtime_disable() executes.

Konrad, by disabling runtime_pm will ensure that when GMU is moved to
runtime active the clock controller is not runtime resumed, which would
prevent the votes on the rails as per IFPC expectations.

-- 
Thanks,
Taniya Das


