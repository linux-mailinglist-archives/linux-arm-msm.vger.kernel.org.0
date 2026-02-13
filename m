Return-Path: <linux-arm-msm+bounces-92769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFC2BJYIj2ltHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:18:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5186135A93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67C5230AE7F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D467E2D7D59;
	Fri, 13 Feb 2026 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G53nQuBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIK0SceH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966A1F03EF
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980931; cv=none; b=QxkgqPeVHFu7ROlo++T/8sAwe2aQohAsKFO5djniI0uvfHulLBrxdq3R4zPA97EFcyLPx+J7s/aauECa328jZbXF3KxvZ6HHNueB0nJYL9oTPhvIt9d0n5Dn7tVtbVtkwOtpxz7yy/VroXBT1s4m+Yx+om7U8zv5eLCXmmGCh8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980931; c=relaxed/simple;
	bh=eLUS4wmiJJz4X0K3RltZP6ZhdKNBA6Kc45LhVPfWrbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6Pj58FsI/zbZkiyrFDHFO54p2rSJXUQ0q2nw6PddAl1QsoL+DZb+R9Q7uNNffY41Gmo56oZqS9Ifg/7cqIULvVn61Tqgmp17rANKjaiT3LnBUMvM7eJtne7z1zQiQuB2ndGUi/V4lZzCwJqjqBEaOf0SLVx6rdLO2V1+dH49kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G53nQuBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIK0SceH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7e7WX3043463
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjVCXvYuaym7jzzUznbrAb041QaziKAD/Kf70Jd3rm8=; b=G53nQuBRO+PzidlT
	HZWE8klgYzu9Nz5eCDKILQGFXKL8BrfT8B2bGk5syqr8S0oetDpgxR9b18Wrw/4E
	cmGsesO8QyS/DhVTd9nexsYyXZ1rmpSYNndlN/XyigY2Zk8mrGBzNY9HFG6aVrvU
	VDdyURh1/r6lGx0DlZwb4ziXO852De4u0frRwnBS+rgF6H6bDWKO/jsfojOmfbAd
	gGbqIrQ66poD9owuqbeJ7DAMVXTUjfhSzqDjQAUA1+evavPPg+Scyg1hrSzD4zqs
	yTPQbAdIAylUnlXvSWH/PwMN2TX2Y2sh5kzPvdzHjBj2jAv7DbaOMmLR0WA5gONF
	zfVZ8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2tk2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 11:08:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c709a3a56dso32938885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 03:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770980929; x=1771585729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjVCXvYuaym7jzzUznbrAb041QaziKAD/Kf70Jd3rm8=;
        b=QIK0SceHwuVehcNO8UY+6/m0fmTgAhXk0qIFndX9neVa0hh8V5nTDQ9Ls4JtNqLk3j
         DEi0ybily8F6a12zYUzX8UMgoWmt5+AQKcjiex6QxumD8iYJgBaVtjWbqj+cx7LuLLwd
         XC7v2b3iJva7zNeZroBIXyQC2HmyhOvJPhRPy0aAo4cnQMqeyqlnyIAhwBHtv43XEb7A
         a663RtnxJGeu6XO06EGXspR7O5cGz7myF3lXl3ABoHpe0hI/3V2Ing10HEcKGsdcDye1
         /Ynxu2ckYRb4hcHWlPK685XBa4rNkVL3HPpq9HyQ5fncwa2YSNGxjYJVK/RtZQ7yeFUX
         XFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770980929; x=1771585729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjVCXvYuaym7jzzUznbrAb041QaziKAD/Kf70Jd3rm8=;
        b=ZZz7AaS2gUzu5jF/u1Rl3gojJv53ktcMXFCka1QoCdnvx11WRKoI6Zw9j3yjIIHqt3
         3m3oCCwHGMbwfRaw2ivhfUR/drFvAvZ/CJqJAtP3Rv8cCWwGh9KeIwlqyWKyC9ol/u7+
         5OCBlYu1sQOzdQVq/nAwFH76NPE1cV840EwEibxU+sc6c8LZkFs7EhukrCcUu5gvf0Ab
         1OCoehCrD5sMDgElsPzZ/JCvxug8iOdvQNpl6ajD0ZxcdBE4g5XG6edJNfjyATm3Dmkf
         cHq3HCo+6FhBLFMeV/27R9xE9lZ4Ou2lvodADs6X2xEcnR/FLF1FkswgdMgyXr2i+JWY
         J8JQ==
X-Gm-Message-State: AOJu0YyX32L56f6VqJjuoxn70OgBCKzBL7leby6spE5wHqQT5J+FFq5I
	XDXhVt3HtGhNxX3l+PaAApSp3OZm86V2uwbDLk89gj6jfHOjmO6oYwsabucG/2uumr9vmt53T/j
	CMBWhHL3QS7MCdy3gUgp6uPMJp7rg0AnE8yTNDek8fIcTwe5/zvoJDl91Nbp2RNnDEeaj
X-Gm-Gg: AZuq6aJBFNmCzOC2osVDtjSk/pYYxdmXKZcQXEFEHMY0QeDgFcNKbWlNJ/MV9ECPg+N
	IiCgf/v4svf7DVpuYmi4FrebW6XAcnl1Il0YLuzB0zBqK2J2jJ61w9r87FJHawbPLLUiSY3lXaq
	xKbsDUwZHM9OFDENUhXAPhIU+/9Lb+E0sM0UcgJ+oZOYRvmII5yV0ETkbFsGzS3GRCsNMpLpz5U
	1u0xk7QQ6/A5z9jhHui3vRHotHVazUtUSg4UEj6azyUZ8hnnvU1T/AZ/invX22VrOyVlJQuGpgx
	iMKtgq3KLqtnM8XQlB7vYpmwPU1ZWXgLx+RAxJslgnK4fvkGi3f1NX2EqK5VD7cbzb/TxqP0eRP
	Squ2QfTfySbOWqgM2fO5AqYnGeDvatFNSKA2crXWognWRWg+3KWxgoQvKsF60atWV495SMOYgSO
	MlrG8=
X-Received: by 2002:a05:620a:4486:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb4074ba86mr186090785a.0.1770980928883;
        Fri, 13 Feb 2026 03:08:48 -0800 (PST)
X-Received: by 2002:a05:620a:4486:b0:8c7:9e6:3a4e with SMTP id af79cd13be357-8cb4074ba86mr186088685a.0.1770980928416;
        Fri, 13 Feb 2026 03:08:48 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm577073a12.0.2026.02.13.03.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:08:47 -0800 (PST)
Message-ID: <404ab3ec-1f24-4558-8c3d-b43de5730a34@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 12:08:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo PHY
 configuration values
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <1b78ea12-84ba-467e-b541-1ffd2348f38c@oss.qualcomm.com>
 <92556aa2-607f-4743-a480-19458836fffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <92556aa2-607f-4743-a480-19458836fffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nxVZGEKETN39CVVz0dlOqSqUG3U8jxsE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4NSBTYWx0ZWRfXzmfaVq7tdT/T
 mc7CISCB0tCvwdcbhznG+0EeSha+vkSf95pXjls+xDLydbdduyQ5l2VyUGPlJpu39KK9zRfDNr0
 KEl3kTsDWip4P5SutK+21osvnIZLX4aVtucUV5PDZ2eUXJSMBW7xQWRbOMRLy5va9Fqj4VRpRMv
 k2t8noRqJkbbUxJVB/8KlvWqmpgAujZ8H9QOsRbELyPpK/c3WwEGEqCOFk1LAmTx+AaRTe7vzAQ
 l/9k2XmT/BiaoYt8t6FHtWGlevp6HIcm4KjDthZOjima6KTEI/E3+lQ6UmPneZAYpiI4QaOqj38
 58ZHbcgYnDr/0R/tIjHx9psz0VIQOQLb1KxeGYdDOAHmV5mKbJntk7Vn6Lvq4AP4QhwbqQEhhpB
 WjgDwaEs0OT5uV90Fh+yc4KbjqcjmfKt34VdP3mrsn8wuuMA+K9hwHpRrOJZbh9bHfsw1IjD3Wu
 XWvMZnW02Bu+OaHr27Q==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698f0641 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EN9MfmX0twoZTdPln7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nxVZGEKETN39CVVz0dlOqSqUG3U8jxsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92769-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5186135A93
X-Rspamd-Action: no action

On 2/9/26 10:00 AM, Yongxing Mou wrote:
> 
> 
> On 2/6/2026 6:47 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>>> According to the current HPG settings, most eDP/DP combo PHYs can reuse the
>>> same configuration values.
>>
>> Even across the various process nodes?
>>
> Emm,Currently, I have only checked the five platforms that already have eDP PHY driver support enabled. The results are the same as stated in the commit message: in DP mode and in eDP low‑vdiff mode, there are four platforms that can reuse the same settings. The HPG I used was the one I found on IPCAT. Regarding HRG, please move to next comment.
>>> DP mode：
>>>     -sa8775p/sc7280/sc8280xp/x1e80100
>>>     -glymur
>>> eDP mode(low vdiff):
>>>     -glymur/sa8775p/sc8280xp/x1e80100
>>>     -sc7280
>>> The current driver still keeps multiple versions of these tables and
>>> doesn't fully support every combo PHY mode. This patch removes the
>>> redundant configs and keeps only the sets we actually use, matching the
>>> platforms listed above.
>>
>> I see that e.g. eDP Low-Vdiff swing setting for RBR is:
>>
> Hi, do you mean emphasis settings, i don't see 0x11    0x12 in arr[0][1].
>>         hamoa    kodiak
>> arr[0][1]    0x11    0x12
>>
>> It may be that this changed later during tuning but it's not reflected
>> in the docs for kodiak
> Emm, if that, where can i get the correct value for tables.. In this patch, I’m indeed quite curious why the values before the modification differ from those in the HPG. I’m not sure about the reason. The HPG I used was taken directly from the current go/ipcat. Could you tell me where I can obtain the final table that should be used?

I.. wanted to ask you the same question..

I would assume that there's 3 possibilities:

a) the values have changed as they do during platform maturity
b) someone used the wrong values from the docs
c) someone downstream kernel as reference and that had wrong / older values

Konrad

