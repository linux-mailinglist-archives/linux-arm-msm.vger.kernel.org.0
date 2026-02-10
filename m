Return-Path: <linux-arm-msm+bounces-92467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLZMMVACi2npPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:02:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3B1119524
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22910300A606
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D5A342C8E;
	Tue, 10 Feb 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgqPkqGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tr+3g74H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5C9342510
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717518; cv=none; b=U0ZnEYXmz7Ezkb/4DUh8S/Nj97dnOrjUcgP5zc8oxlF/OJzUPGJgL/48AyitMiAl7Z4Ordedo2nhPjCCy8Tqp9Ild+nE58wmG1A3ZRoEza8kHwKh+etWCPa5m0wegJRchKg0fVGsJENABprVczmV0d4w/JfhGDVefacuF/wRjYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717518; c=relaxed/simple;
	bh=O633pzcpYpaVv0iUzzYIagk/jGUaHFDdI2DqNIk4ytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sJWr9RoEQItOcbbtBuNfG3RxN5Wc3PM9DqftWXuTv6m8UkSYHTDuvMdNAq3FpY7FHj8R0S6lNdPVPrRWOayqNSVTuCUXqi4F/211jJJRsvPDLTHj8Rq7LnM9EpWy+xr/arjQEplQ3ofpxBkGnANcjZzCuZ3g+6ievyknJDDk+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgqPkqGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tr+3g74H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A6oPQq857026
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J02eDS5+OrtFybete0MtrhNyMJZo6fotYJ3t3dv6qwg=; b=mgqPkqGPjdq1Dt4C
	UaX7wwyZ32sGgWTuR8t/jHHDXXVUPaPQCa1tMTdCiLp1mXjw+TwnOIYtAw9zHEes
	X+rewkVYueDYxXTaavIWkJ96LEx+tJf/PF+/JxqzosWL6N0gniQpX1kU8kcnRDhf
	h+4ViGNqifDk8zscwmQwTnnIkPVE6Cg3JzgI/VpiPYmQmd7m7uIrck3THh3u7Xks
	N9NjFbcNwr5qtWWFZJadldc85sQqepK2p5/yhq4mvbvQE3fcpJ2GizUdlsrGHYEx
	j7m/QMSlR13QWFAqYO61U7X1cc55CcmcQ9V/xwKDCX0pdaHFiR+IIrYN8ttxc2Bj
	WijUtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga63qw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:58:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so166633485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717516; x=1771322316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J02eDS5+OrtFybete0MtrhNyMJZo6fotYJ3t3dv6qwg=;
        b=Tr+3g74HbBOwffqYLpUM3V1L2Ey6CMIFZJWK4pf3zftOc5b/boOHC3i6rasKbPO9KH
         nwJIhnbGYUL+3+EC+SKm5G2LKWUSIF/4NI2NLI204TTye9ovzL5HsO5Jz8c27FXdsFtu
         0go+ge8FQYlYsPSwm0wp6p7r4Vk3q22GL/3uz1jonCyALM8evfrW1RhnZfKnHfc3q3tG
         bmRe4yBYfDa4xiybk5a3p0JqI4+8473vwadvUqijUcwQF7Uwp5yA/Ph8IIL0AzLtqucW
         hNRMV7SEL9G1vPGA3J3DRWfkCXavcjtbgjAhF2lJHWYSzr4iHBdcPfA0wBMb8zUzQ5hH
         oJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717516; x=1771322316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J02eDS5+OrtFybete0MtrhNyMJZo6fotYJ3t3dv6qwg=;
        b=mDN44Qkow0kkxDAhGuVHTFeC48YUzQj7mCrbG7XjFS3dLUWRIBDRQ9FH2DVmDZn03J
         /juLYjoaoOvEcsr1cvyIFxxKie2nymam5JlMB9S/W1ll8wqREbvxXz/FP9MEwVd54I1n
         8ApMuyHJ15Na85RJ1d9nJegNWjcQ2cf+vrJV3HsbhE3MdM0dBcFBsRWAj5uU0K3AE7tp
         b0fnqMBx7qAkp7zUQF3bjDm0roumbndSYnHaNeN97YNuvOORpXHszD/F+XmCL6B6XYGJ
         /BlF1z8z4wa88cOlGniJLtbjdAc/61AQeMkhE/iFnddjbYZnZ0FJiAq2vzN9VmPyJ8PA
         q0tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRdNbv6XRJsxQNfGqzOhzOxSGhhFbeWh4JqB/xYigxjsECgUyk6qNmIxhRaKgKn8/14uuNBRGGT/JLK4hz@vger.kernel.org
X-Gm-Message-State: AOJu0YzqizaHGy0gvHp9OPqzFQ7BO9MbaljolhBIK5V+dEhWXWZorM+E
	srqm8/TBfAgZdgZwzcYCTgIWTiDEjLWTyEBVW1J2zRdRzqjgV86an7y8A0pPSoRqgkaBUsKILpV
	LPoXk96Ptrh47PtJ5E/v3rfnJJYs4YEqggLw2uz4ud1DIuNn1ODVJzElYle0NtHSiua9r
X-Gm-Gg: AZuq6aKYOOli632f3w9wB+p34dRoeOBryRMWl53eOqitw9hWNa77RnzZxL+tsBjsvPY
	WRLeWjvIforXP2vHBWuSa1W/tjUzyEYwCtH/BHMk1oz6UxL/eq16UK+MUrpD4aGBvNNi6+lCcxk
	yBx0MuyoMOoGZ1FfUUhILyJB2hrBFOMsCB1EfNtU2se2/AMmZ1UN49hMhSCI0tvyFgIJW6ZkpHP
	hxMoSTRMwK0j3uM0dXHvUF1+L/ZWhIsItSR1YZ4DA1vM32l7HuFDQwPm0vdzmO8hYB0nyTb/YjE
	7o0LESFHhswU3bz7YH4GljfHs2DIPJBFJvaW9UsokU8lExTgE9E+FlIvMhfFylLkw8rvBfWuLFz
	092qbjoOU5sfiBwhyX8Du8J3ntVNPGUow453ua7qJUbuMnX0Kne1XXN+P7RMdqlPCexa124WhIs
	pi+SU=
X-Received: by 2002:a05:620a:45ac:b0:8c7:110c:762f with SMTP id af79cd13be357-8cb1fee2ebfmr111382585a.4.1770717515554;
        Tue, 10 Feb 2026 01:58:35 -0800 (PST)
X-Received: by 2002:a05:620a:45ac:b0:8c7:110c:762f with SMTP id af79cd13be357-8cb1fee2ebfmr111381685a.4.1770717515161;
        Tue, 10 Feb 2026 01:58:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18aesm501973166b.41.2026.02.10.01.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:58:34 -0800 (PST)
Message-ID: <cb5c4a0d-9f4e-4338-9c49-8f13c2a5eccc@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:58:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] thermal: qcom-spmi-adc-tm5: Correct the voltage-code
 scaling for HC
To: Richard Acayan <mailingradian@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-3-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021819.12673-3-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zHKtDxSXUczcNRVR9JNIPs8pUied0TqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MyBTYWx0ZWRfX/9u3Wmdj2ioH
 VsNqc/z6TaqHm9BjEzDqux/fAM7Ok4UoGtYZ2SJDXb1Ze5oQ7jX1yxaoAqIK4b3//dGZMsVJaOa
 A0OJxJiKMvK+lSmMU1w/XlZRYyTSlvrujZvlEAsc3SzSAidMZCnESh/wx2Z4qQ8fP+0je62pl1J
 QBteRZrXKfXK27Jcjt/dobgwZPpzOjUvgMFgiVHh1m3GEvF2G+KM0l+SeRhQxNk2A/RsrfiO1iE
 dwWSWjkgD5lqeI7t8ycb068c+m3jay/ZWpgJgXuroj8QAi2w6ouQg2m+HYjYemgqJpyUoC21Ddw
 fAIDSRIzCuawrVE4iBdQiIizlEZeCdBuixbibUYmjZ9lGAJOwKK0NCWOpfFeFuuJz8t0G950Xq2
 mBTH+Xp6+4MhvUP+ZfnLoxU8KNRzuCcnAIpNlWhlRW0l2b9/VD9hgTLUu/641stvTsklvceueM+
 KsYP9KFAJcYpc+LTfAw==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698b014c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=am3lAksc-JuIhvUlS-gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zHKtDxSXUczcNRVR9JNIPs8pUied0TqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92467-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,arm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C3B1119524
X-Rspamd-Action: no action

On 2/10/26 3:18 AM, Richard Acayan wrote:
> When support was added for the HC variant, the full_scale_code_volt
> value was copied from the tm5 variant. From the downstream kernel, the
> scaling value is 0x70e4 on PMI632 (tm5 variant), but it is 0x4000 on
> PM660 and PM8998 (HC variant). Correct the ADC code to voltage
> scaling factor for the HC variant.
> 
> Fixes: f6c83676c6097 ("thermal/drivers/qcom/spmi-adc-tm5: Add support for HC variant")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

nice catch!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

