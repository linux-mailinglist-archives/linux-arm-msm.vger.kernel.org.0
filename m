Return-Path: <linux-arm-msm+bounces-101263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKpsFWTZzGnnWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:37:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA70376EE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E20AE31B3AB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F9F3B95FA;
	Wed,  1 Apr 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7o5tUIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRbC8XUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9AA3B895B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032235; cv=none; b=jW8+9JOUXYmgPL6bYKrVNdHnC4614KWz8sWRrJmVkTgmDV0CBVwXTfeSJtFiEBTy9w8LFs7fY1OyKDSGdjlbYX0fSnHeBzALG7zzv0x4G2W1NmS+m9dZsbEc9w5vgt6P+VWRGAfMqy7bxO26zMlZiM4rtuHkgR37UqFGZuCZwKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032235; c=relaxed/simple;
	bh=Kr6O6bswOhBHr+bJOVMjowWiawpJoVxb/WSEfqkgU1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1u0gdWh/Lhg6o+ZOV485mDKIsjm8PDg3LXrqMEJ8m1QEBY0FE+JwnCapi+CqBSjFT0UUbeRvDa305pQk8/WKgRP3RnuhcnaF4mjf/1Z5fMfGWug3nRDr8jAlIbq5O4Os1b0eKZ++UYsMjgYMmn+WpdsJdi0yVjpLowbfQ1PMTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7o5tUIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRbC8XUz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314ODMW1562679
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 08:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeMOgOtlBiNDPKSt1z65z6B7HVy9VlGHw71ZyMGZGBE=; b=A7o5tUIRz4bVhDmo
	SgpS0zxM4ile5a6ISFA4KULizhyy9TMVuYpOu3cEeUSOmy+wxDODqBOBF0lf41Xn
	l7OkE5pHPAThwnQ0IgjiYgYFFVqA79gLY0GufYT3iTIUGtDrbG8uUa8AI0GVUXpM
	Z/x5ynsvm88KSlusl0CQkttUSq68OCYK3d9Gx2e7CX36bJe88ZoxBzPNXttbuIkH
	h2W082qgW1J/nL3QpAWrFQeg4p854PmsbUS7vaqzR9T81nHDey0akhL84Q281pc4
	VEC0/z0ru/9f1RRymsniHUlaYxItg36Nlqbj7PowSadshgQFpCZrLAjvrM4Y+t5H
	NHSZ/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3rwfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:30:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2d5e61f6so19186171cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 01:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775032232; x=1775637032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeMOgOtlBiNDPKSt1z65z6B7HVy9VlGHw71ZyMGZGBE=;
        b=dRbC8XUzYJROoIWcSQb49eQnE3BOAt+DZDZWUqaHSXzzUYCwotO92JydlyDoP3xoit
         oZ9OD2HqxrlkMr3U97wLJksxBaFazP9XznbufeCrOlFXw1NuTT5nDGN6lhaMXK+uOrCI
         gfQEeaVqTDbq1f6s7YMQ7cgfPi46YtZa55CconS4+w+CsJpX3+nTS2eeX0BfUgAxKMck
         tl7iT3glfmvi8m1tDzzXa80U7xcvIw8I4kNgNo49Qhx7jTzNvQZMY6cWUqACKihT96n0
         bs5ssPdWoDa4tt9MlwECMcmHMrt7U6Xblt+JsbY02HyrSI5BlL5ttkC5EPXYxqpqYBz5
         rTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032232; x=1775637032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeMOgOtlBiNDPKSt1z65z6B7HVy9VlGHw71ZyMGZGBE=;
        b=D52gbAw1nsVorS4v5918/WrtKBoL0Xjm/ooJBrWFUSvQmPtkFZkQAJ6xxWXRQ77zhi
         cKja9ReXH5T2f9DaihpUPSnfSUcBAD5xt+4gvdPwTt1otp0bHiSLlbeh2ojAwmJkibCD
         +HiUR+jjlx56tH1dTviZJregdUHRiqDQ6D5CdjZXXLLoh2nPW+gC9NXpZvfiPnhgO2vj
         2+kEihjowobQ4Ng9yNd+AaOT3tiI5PlXWagnFiYyACCUv4/Ee5Bx/dM/pOW/zpu3wLaq
         /90W3l6MqPyRUOJLzPYsAeEgJeYJRusgT4RArUQMnkkaXRUMrRWSa/jPmExymFs2bqKh
         YmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9c5F9dz2xcPb98Uw3DtVJ7pvQuj16LE0IxYC1fwsIWPa/E14GjuwghE58fAprzOj3pJxhWlDEvqxwoRbm@vger.kernel.org
X-Gm-Message-State: AOJu0YzDRW+1B8bOFzGYSy2lKbO1/gpbXgd8sUHm9rh2fUM7CjbWk5iI
	PWpThh9N7orMxgMKdpAXXYJYdFVNM7xnLSma1IH0esctpWkc+GtsnLd7V5TSYQf2dbpFSzHmEIQ
	8u894StgkqRe2Dw4w8Q7uJp7xLkcVBXJFKGUo3EaRk1rhoPgdjBP2d0sAjhCIsWNwHdyg
X-Gm-Gg: ATEYQzx77u/o9f+0ZCu8w8zYpM/gSKCZZ1VqpekdodpRZyfJv/arH/NaMtJF1MSnSre
	8HrP9DHix3eb+9+vNcd3uITotQiW2xJ9GySWYhYClyYJ1CNksLLZtO3FcfS5ZdJ5aZr2MWWwad6
	ydI7Kd3BMVA48KBfZfJ6U/XRV2UhStBx3+PFEYhiflx08KfwBXp2BaBO6FOuw2EKCpslGUuF8wv
	/7L7zMsIFT64i+PLns0Ii5Jk0gGBrnGOpUvbUmmHH/0j/S6fATfJ63K1QWbQGSdze8JOwhm0Utf
	iqZhabfVSj0aUBkTQf9NCfaclBYfT8Oan06MO0JIWnfmaNUrGvfuUtXIbHmO14Br+ovfuiVvxlZ
	tD3eZbzqO0f+LUqke8G1aLpvkTdIoqh7EBI0hz7qLNB1t2aZqoBf91aBj05kI+McxCGcSeVEP2a
	pg6mA=
X-Received: by 2002:ac8:5f14:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50d3bd92985mr28169821cf.8.1775032232567;
        Wed, 01 Apr 2026 01:30:32 -0700 (PDT)
X-Received: by 2002:ac8:5f14:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50d3bd92985mr28169391cf.8.1775032232032;
        Wed, 01 Apr 2026 01:30:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c1b48050asm55285866b.28.2026.04.01.01.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:30:30 -0700 (PDT)
Message-ID: <e21212a2-4688-4450-94d4-0769ca45e252@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:30:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU
 clusters
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260330165237.101045-1-mailingradian@gmail.com>
 <20260330165237.101045-2-mailingradian@gmail.com>
 <ca6c13c2-4e46-483c-bc22-0ebb6db704fc@oss.qualcomm.com>
 <acwH6N56W_ULNe2q@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acwH6N56W_ULNe2q@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z1OOC-1ZctQ_pod5u5OMHIzsVJhPIKB7
X-Proofpoint-ORIG-GUID: z1OOC-1ZctQ_pod5u5OMHIzsVJhPIKB7
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccd7a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rUcTYHlEmdXW-CG15zEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA3NiBTYWx0ZWRfX/wMdaj/WQ1ev
 tPC9PcBN0yETD4TwP+TjhwfE/kNEVyNhoVy5xUJoq4lXBnn7KyuT4rv1JMizKuJDn8Ku2FBqR5R
 jUTzEYr3+ptB2rDQOCFE2IqskgMjzzG9WCXqnGRWXM2Ep2YisEwva24g09+OER2fZOQ1GgKfW0N
 03G/7WFVXyWmrFWGchU0ImAj63RYqErE8IXfwqelLA5H60PDkgaswYBfqaDSLhEqCTSUl5f4hK+
 Z4cdDVrWM27KdsI8WoaULzHrQBCxLV7I0pr8mIGmCsjDCYt2K+j5rdCGOESrchRV0TKeMAtHK1X
 Orr3jgSrHGUqpmwKoojOGvmbU50VVm3Evqb0HWuM8GOCyKHhF5gdtuG/cY2OA6kfwOVEiVyOsBP
 8UxkkCnN3Rx4emjardy/Wup3zKPleSxYauc/ghwQSRWC5EMHExgJ6LbAkrRHbpAif3XWwPRkpF5
 iUGTbjbdXrWLRBkxmRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101263-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAA70376EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 7:44 PM, Richard Acayan wrote:
> On Tue, Mar 31, 2026 at 10:30:29AM +0200, Konrad Dybcio wrote:
>> On 3/30/26 6:52 PM, Richard Acayan wrote:
>>> The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
>>> some SoCs divide the CPUs into different sizes of clusters. In SDM670,
>>> the first 6 CPUs are in the little cluster and the next 2 are in the big
>>> cluster. Define the clusters in the match data and define the different
>>> cluster configuration for SDM670.
>>>
>>> Currently, this tolerates linking to any CPU in a given cluster.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> [...]
>>> +	if (cpu_id < 0) {
>>> +		dev_err(dev, "Wrong CPU id associated with LMh node\n");
>>> +		return -EINVAL;
>>> +	}
>>
>> nit: try to use 'return dev_err_probe(dev, ret, "....") in the future
> 
> Does "in the future" apply to the inevitable next revision? This would
> be the first occurrence of dev_err_probe in this driver and the error
> path was just cut-and-paste.

Not necessarily, 'in the future' meaning 'in your future patches'

Konrad

