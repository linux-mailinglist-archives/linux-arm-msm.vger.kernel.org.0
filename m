Return-Path: <linux-arm-msm+bounces-104488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJU9DmSQ62k+OQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:46:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9006460EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D6833002311
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176373358DA;
	Fri, 24 Apr 2026 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZyDB0HmT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChEnZeOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7311A2545
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045600; cv=none; b=p9tthDjPSAfAQSBEvTeqHtFEeOv7kBNFnizBtIpFYnw2B3vVua4neo+/yFo+FXaqZRc/Yh9gNY7NQkQ8nfG/YwgypJuVxgMnaO6Z0xN188iLj/O920uF3uKMzKWlOl0GPZmL7MS2EnPsZWthaOIRHN6WJnI0rdRlsMKx0MP+xJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045600; c=relaxed/simple;
	bh=wNxaDkC6wrtTcJ9lwSZH8l/aNgRlmTXFHAH2ydH1Fig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KLaCJxNY7SDaBkrO0P25ReNL/RLTOWplLi3tqgDBp2xst02Rzd5tivS4tWiZ9tHWqCnGUmtN/kTJaz1cQz+D/L7Ht8uZEfjvITqgGQFreF7nW4+ovck3SLa1GlLHH/9d41515Kxlzi8r2Nx1Mu8tYNCxjL+ylWo8lzskAIOSR5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZyDB0HmT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChEnZeOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ODjin91888414
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCtC7wMAjY0l1IUFrPg/DawpqiL4qFS/e4hs3Bu/Rxw=; b=ZyDB0HmT9Qro7imW
	WOZde+TsRJQfcweux9/yIkbAKREPInZwuFzNPl3+jziHSii+tPaIsrcvhDtKevVf
	mvrtCHnvBw9GRh9FJ6e8ezOyonqZpyxExVCBlESpLQQRTLsTLeWvKUIHdjwvis5w
	ugrmIwO/XzUN3Niu/2MOGBGGGHyotHGVVgZflxH0abk/QJFe94OEkWEruM9h4/hv
	GiZy7uv0lrmfS/HeyjtpO3++RaZ1I8+DppyDR/b8+hwHxh7mLhQwU4yPZnmfV+7l
	3B4Q/UfBjmdZP6PMIFstXxRbbjUmOffUIdBG3g7wLuP6MrzaEbcq9YJFP/dXazfJ
	DqoNCQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dwbg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:46:37 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-799003e8a77so227776127b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777045597; x=1777650397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCtC7wMAjY0l1IUFrPg/DawpqiL4qFS/e4hs3Bu/Rxw=;
        b=ChEnZeOXLVB9CWor+s550+BbnBM+tzweCtgbpf1e7jbtBiia9V2VdUEb6DUyMXenWv
         H7NdGpDC3ONDYAGl19XtRHFwb2Gbluz09+5ZdyP2KuHktWviUy3cDQ7miElmStn9tH71
         ovKGM80T+dgGtcXyXczLhaAzBvEgCnVUIBF18tKQ6CepeTBvQ4Dw7G9ZTNZ0C3FoiF9f
         G6bHmfJzTxzp4mlZ2uXg/THRWFY44EpEfnZSy3zkLF9xVCX8MB0wAzWN+Tsr5dXUXi3o
         nx7Fsi2ibfdb5V3TzQfNpAsZMV1219mvf9thHQweMPo8p3KOQgXyoCGo+rocazPdoW8y
         R2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777045597; x=1777650397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCtC7wMAjY0l1IUFrPg/DawpqiL4qFS/e4hs3Bu/Rxw=;
        b=fM36VmPbfHjwhDLtTSMWLVR11bZQudiNCCROm8hU7dUad55Ld1Sr2+MUAz+D0dCC9q
         +wb0nViGUp5m9CuahpT0eevV4V2+6dl7agT6PNZwPixnUME2YW5ynoz5bP6ds+BD2adU
         PjULiv5UwpmWWfV3rRPLf/v7XTDY8cQ0Pycxd31uzKRXYQhMZELA/xVJRQ/8JICYpS3X
         AovqTq1tsbGvcjmz5TW8ibtL6uiU1B57zgt7YM9HDV4OKQZSnpqluOcbbc0cVrpIbaus
         lZfsmc6N5lRaQyjXtjSh7dLLkmZ3f8xcw32ZdQX4UYYFxNk6yBn7YojxZp42LVxWPbaU
         GR5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9HV/GH5SAnaLRJ6miopvsOUyrfA/WdfEu0KlM2yWqSMVVLEGuN9ysxP+PQ3G88KaqapROPwRxHsH/YwVxM@vger.kernel.org
X-Gm-Message-State: AOJu0YzPzg2lYd+3PFIA3SNldfxM8Hxk0GYEQo4ba4BK/A6yhRvfIDrM
	I6ta9/gx9n5EPYvF6SLkSweWzYlNyjQnpeLJ1BSCfbr9+Ehw/TWaFC/2CbxyLtaRc7mzwqUABaQ
	oV0TnFF/4APiCfNWVqPPq8760HOtzOFHK+aLnYOMa/upsXaTxHrF0BoMdPWh2qp0p8S25
X-Gm-Gg: AeBDiet4pWcPHIFXXBPVdu12Hithfjnft8Cgu3mK7E/EeGeTCtmEtfmXmAS4DkLbM0V
	AuXky5aO1a3c40bh6WTN//rx4w4QymUgdTmEv1p6LnNCxV5yCmQObX0iq9PxHbCmHdtctGyVRy9
	2Nb4mLHH84MoeQJox5fQtJIq9VDfG4qIONaSB2Cp18xmB6CJDpsuyHdJEArgzPSrb/M+PwNAoZk
	jwF8ntqyvMbZ3JkWy9m0Yy3EcHjBGGBWpuR2lLzCo0uHz73xHaWMhu/bOX/x/R8yFb4sHi3IzGD
	j7lLU09YZNRoeAQx9bvLOCoBKfM36a+9TRVIxjq5Z0PTKKMmeR40K5i2Gum0p9RjUeSBQCxSc1Q
	9CTxbaDIwyIWT6vdV6tNjwqmxG1p1D0YL1BDy0MeMVy5Z7t4bpABW6vXLCkts7EuAWeQ=
X-Received: by 2002:a05:690c:6987:b0:7ba:99bb:d4e7 with SMTP id 00721157ae682-7ba99bbe1bdmr297735977b3.8.1777045597177;
        Fri, 24 Apr 2026 08:46:37 -0700 (PDT)
X-Received: by 2002:a05:690c:6987:b0:7ba:99bb:d4e7 with SMTP id 00721157ae682-7ba99bbe1bdmr297735307b3.8.1777045596645;
        Fri, 24 Apr 2026 08:46:36 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.104])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee99bb09sm97450137b3.32.2026.04.24.08.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 08:46:36 -0700 (PDT)
Message-ID: <76329aa4-bb1a-4ae2-a785-b7815e98d1d2@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 21:16:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
 <84bab102-9b40-434a-9882-f6cbcb00c038@oss.qualcomm.com>
 <8ca34203-68cd-4e5a-a4d7-de36c0c35f91@oss.qualcomm.com>
 <1bdcb9b1-c703-4a7c-a740-06f237bacfd5@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <1bdcb9b1-c703-4a7c-a740-06f237bacfd5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6tq4_nYitJrpO00XSnA1sJ7EsYG7zhjf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE1MyBTYWx0ZWRfX1mdTAFdidR6H
 FfZ2ds/yVnilIbKo0fO0LQJoVKoqRhysJnF2Sk32BjWcZHsjuM1PFapgatdB+9eRMx3NtbMSIQL
 ZXG/MjqMyf3v5LSHCkIzSaMHXB7WJ5E/0vvwIOS4Vn6DYfpW7XuMQcD/xPoRH3uEmobW8Et4t1U
 YMPrrMokELJgSWLBpzAHOGZkIX6fPio/utlqJR1GHGcbj8IE8r+nsKFM7VhL8sV/73CtHgy1Blt
 DsUytcDni1N141lyDMSENFv1ddNxyBwbDuDLrVPbdT9iWPMqSZYvSglAkBpvBWm3z19ZBYFY/RV
 4RyljLMIXwwidUlFrhAxtQ3wuLxq+TNEZqvgFjd2N6Cxm4Oz5j/WVLQxN6KhERQSt8kigfhavuC
 2zdSCV+6IUgQ0XQ097EUBPKUK7eezhAKHTF5VkV6DGOeuoSu9M0P7QZ9dlMw6eDm9UnJ3XIWBrC
 Nk/3E/lCe+q0Go5udVw==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb905d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=DCeGIJpHnZWVbLPzD22jCA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SZItK02_K8JNU482h3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 6tq4_nYitJrpO00XSnA1sJ7EsYG7zhjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240153
X-Rspamd-Queue-Id: C9006460EE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104488-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/2026 5:09 PM, Mark Brown wrote:
> On Thu, Apr 23, 2026 at 01:20:01PM +0200, Konrad Dybcio wrote:
>> On 4/23/26 6:41 AM, Viken Dadhaniya wrote:
>>> On 4/20/2026 10:14 PM, Mark Brown wrote:
> 
>>>> Does this handle missing qspi-memory properly?  It's not conditional on
>>>> the compatible so it'll run even for existing devices.
> 
>>> All existing device trees have been updated to include this path,
>>> so there won't be any probe failures for existing devices.
> 
>> The problem is, not all users of the new kernel also update the device
>> trees
> 
> And also the binding says that for some SoCs there's still only a
> requirement for one DT to be specified in the binding IIRC.

Sure, understood. I’ll update it in the next patch set.

