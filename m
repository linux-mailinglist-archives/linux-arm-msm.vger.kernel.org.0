Return-Path: <linux-arm-msm+bounces-116007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3n+UL7BZRmqYRQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:29:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1676F797E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:29:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mWWd5PMS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YTwSQr1Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 820D73027A89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAF647ECF0;
	Thu,  2 Jul 2026 12:10:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78447DFB0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:10:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994235; cv=none; b=KzTG4ZcQif1fTj5x4Ahrfr1ELbr4SFcH/VHmktRswcQY356Pu97kL+nR7r7HFrDLFMsSH+MSIhxkH+SCKoNAG9CvmyCzNBYNvNiHVuAamBHOa6VQdgqOp7xbi0huIFTU8CsK6/r9EykYPmqcDMi/es+vM8+SsngT9p/+hqRjR+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994235; c=relaxed/simple;
	bh=fBpx8p/Chp0xeZESFy3AxPnuzRiL1+9Xp3jd4L857AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TimwOsEgkJSoubJNf1yR57e0Qwm5GYYmrPCTTPyCZxD76gWgkioT7i6TMkRU72lsGC2FEFKiq2Gm9nkzPAbmiy+Yru2GuNDHjlxJAmgdG0lzBIDRsJ0zjrBvJ0AXQ0Fd9SvQF/mygUL60TJR7o//YZTNRSluIJYJzH7lJ+qWiAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWWd5PMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTwSQr1Z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627Tsbj3964230
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAXQPHPTRb6mDxvmbYjOMDoaASKp2Q3eEFRTSdWK7SA=; b=mWWd5PMSS8eR//L6
	oaIzvzB2NI1MUYv1u/Vf4YfuFSZTe7qmHpXoQRtSlIA8Qya0bj5RV1DKNzjfZlpf
	g6OSAzDpN9gm37kpQyB45WWYUH6YbWsJ2RdI9SbsP5wUg9Hd8WJ0wfCtdwxf/n53
	h+V++u5fAFDwqpCq1ok5LhgyuVs8MJdRJYhwZpH50YMYGPWLb+fLq5NVgaazM7tM
	gKsoKRCi1NZZCQi5/+71XZWnj9FbZWuXDTMbHAic7pm8okDXBqPSDoEHTRKKZ+UT
	XXlrvmZ1agVPUD298ayV+dm/ib3E0E2AzJIhK5qc24qsZmenLRIah5ZjEvx3TmIz
	lAm0jA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc12wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:10:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c298a1b20so3259141cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994229; x=1783599029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAXQPHPTRb6mDxvmbYjOMDoaASKp2Q3eEFRTSdWK7SA=;
        b=YTwSQr1Zh5DxJmBwN323efdB/DCfrekFQqWc32HUM2MM3sHmG5hS/Pm50EDwEtHib/
         qVeTFNwoA41jkdY23pj/imOiAAyy5k7hD/+Z4T1tXmNkRFKbne36IaD+cq50V6eFV5Mz
         rU2UG15CAaA6YpKD6NMl7oLmRjFT6mCfsais+71Iz3OhRLnILS7tUmsXeztDhLVSFOtB
         qnU+bFiNndmcCJe2C/Kq2kWxA7ZuAgX4elgzk5wcGHdj0hJnJ/MBZx+SsLzEuiRYCzcl
         k7Msuz/3UkOUEZYJ/yp1Ffz6qFmAmtC4lFpmIQ2obmjJTDTYcVbwaZQ1Ambh3mGA8rfk
         bqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994229; x=1783599029;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAXQPHPTRb6mDxvmbYjOMDoaASKp2Q3eEFRTSdWK7SA=;
        b=YInVflGkCXofuIHYI0ouVwdRP3I1Id57EUGbN2uC+FVgRxO4XIpbZdI3aPUdyuo7i3
         z3pwxfUgAOMp5brubXOjdb6jbCAzMinBXpFv5BdYTBUI2Sez//7LhDM0+R72UKj7M6PW
         6wLCHuBj91CaaMfDSB2yPSpy5B88rFaXd0E3+/HKvaQc3hkmXv+qlyArcMU/G7k8k9K6
         tmtpC5MY7A8AGPAuSQ0J/zJcPieE0+1P7lkpDGTNMjaEpHGQ/zJOLhyZDKjv0yTro5hU
         qXlT302LyDZYkQ4wyZ/muEvsXfc+sYPi/hqdYVKLxsoCPZy0A4LIU1wYwjJARsn4japA
         P2Ew==
X-Gm-Message-State: AOJu0Yy0QS770OnO+hMdWtuwMKoGZ6y9dxLJF2txplduCdlJUSF1x5bi
	iAVVepTWGXhEWZykVWWkEDOOpfauobw/oqfLKSES7D/iciRBQfcHsG2eN8yl22dvCBIWP5NzsZk
	b8XK9SzmONtk8DdaGN/Y6TN+EzleF/nYUexte7Tq3OAhkFC31j2vxnlptt+YINwfhDAvY
X-Gm-Gg: AfdE7ckP3741GgKp4xFnJNCzMSSiT/Ml9G3dT4fHhcKs7OosD9wpFeWSGAWrmjyzdX7
	Pm+psFJD+kLUGQpsPCd4S3lSYfL1xk450MVt1fE8Syr7i4qA7LFbFUTKFVZSWgSEhovKYr8X8CG
	kweHj3TlGnObq9GDMnQlrX6AFLOl84vpRtzgKcZTMnUIQTB0EGcuB1VLAEFgSv5LkCwU2ZQfZNU
	ZUGP28Tz9zVOpPDDsv2edm3Z8OnQKM6fuVM6nVwjroqpWBHRK41EaO7vfoEolcTz6cpwEXf2qJY
	skUQxSuvnDmxZoa2FuFdeDjeuqBQWb5SmWm9F9J8JWZyvMSho6cQXnz4M+wnYjyAw95BDMdADqH
	FcVLaROMBjltPBpkgJxNB+3MxOcPL0qemQJg=
X-Received: by 2002:a05:6102:94d:b0:727:36b9:dee with SMTP id ada2fe7eead31-73dab613362mr887608137.8.1782993811944;
        Thu, 02 Jul 2026 05:03:31 -0700 (PDT)
X-Received: by 2002:a05:6102:94d:b0:727:36b9:dee with SMTP id ada2fe7eead31-73dab613362mr887591137.8.1782993811400;
        Thu, 02 Jul 2026 05:03:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091cb3sm121646866b.22.2026.07.02.05.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:03:30 -0700 (PDT)
Message-ID: <9e87459e-1c2b-4052-9183-e61b46cd6bb4@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:03:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-qusb2: fix autoresume handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260702-fix-qusb2-v1-0-b5cf55621524@oss.qualcomm.com>
 <20260702-fix-qusb2-v1-2-b5cf55621524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-fix-qusb2-v1-2-b5cf55621524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cfAQ3we2xZ7VsItNBob_GUvF8e8Jognl
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a465536 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Noy9YD-PShQqXFI-NKcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX4NiEFKo9JccD
 Q7Nii9Pz8pLosSEA+DvdyXVM6pWOAgl6qt1IFNb4o2yIIj+cMcPQezeha7EAd67qUl1MgeRKv2U
 OaOcuUxyknIyG9jjv1CGDH/ITD07NPzxW7Pgy4EI+PngMY8k+eLtl7qF4qwPcjIbC7rBFpapzsB
 nBJBELiX7mxfTyfp8bSnr5oyoDgDwqZHmGtJtdv/A0S+o87qIqWU8Dqelf70DYBUESjpM4RCw9t
 udGqe/b0PYbYXlm5iB9wJ5m1AdWKeI1/PP2S4eLG88z3QyX9waRpo4qqYjiApiWu1yrBvzgHgQB
 c94eQSvZyktZ3IGlzES95dS7pAbosxSvN537OMcE1mIsIEF0fSGwUni9R1XXgUAw/e8/54FWuV0
 FYsjhl5txxLzInxqN6d+3K/+fHJnVSbATo1cVRzydhgtGrCJr5qeGmY0hH2l9pZtnHJ5rQVySbC
 SMwOojAETKsmzFzNEMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX+E/PjQ4PMcxF
 /25Qdgo8NA5NFOBXxfqWevwjAI0ypa4xMmcnQuyiEkZji/bvbR2RWOUC2hirqM3HAGu/h5m3hVD
 HLm6iX0tjZDyqtoI5MhYVsb/2AHERWY=
X-Proofpoint-GUID: cfAQ3we2xZ7VsItNBob_GUvF8e8Jognl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116007-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC1676F797E

On 7/2/26 1:40 PM, Dmitry Baryshkov wrote:
> There is a confusion regarding the autoresume bit. Some verions of the
> QUSB2 PHY have it in the TEST1 register, while on the others it is a
> part of the TEST_CTRL register. When adding support for autoresume bit,
> the code attempted to simplify the handling of those registers, putting
> both registers to the TEST1 layout entry. In the end,
> ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
> (because platforms using that layout didn't use autoresume), while
> msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
> layout entry.
> 
> Update the platform data to specify the register to be used for
> autoresume handling, define both TEST1 and TEST_CTRL registers and merge
> ipq6018_regs_layout and msm8996_regs_layout which become identical
> afterwards.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


