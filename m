Return-Path: <linux-arm-msm+bounces-94503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLv8JaLeoWlcwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:12:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D41D1BBD43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC3ED3016EC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D35D35D5F8;
	Fri, 27 Feb 2026 18:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfHgCnCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTwLF8iK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4C36C0AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215949; cv=none; b=SKtmTe54L8JEGBsZV+hk3Q9/qDw5nJ94ArcmC1Xfe8WTVemfK3Iqt53mRsfnXVgz6MW3Xi0FAFGwBQ/jI0lUfjmevXgd98VaFBqQx4q5uaTqDHYPB+jbkT7Q29/r32BgIBimKtUxfjv5XL9vhCVlz1fX8sNn/7IvTV/IVPnjiFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215949; c=relaxed/simple;
	bh=thxsNsx50Nxe/wlgcwk4xajrTI2PVZS/JhvkNOPwPyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u4cbVsmh9PdoJdNYZHJ1mUu1z+kKIeF/PcZqP6MRdWb347oK9XYh9j6G4bvOZGaEqWjT9ZXHFlzxFPWVJhSqIMwa+lXz6ANY7DDrnfYTNyiHNY7ZWGRQqL/jODxMOfp3lZ1hTa9trBroRclOn5JUXM42ANLHSEJRcbYOOFT+WhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfHgCnCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTwLF8iK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0HC43944632
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5B1C1ZS8lb5bAMq35rYodnBV2Ng9s9xcJ2D5xRb2e78=; b=KfHgCnCvO8AzW7uL
	ZnRxIR1KYcSmVsvn/rplxIu7/rXgInAgKukDP5KqynQp4l3Ekg1/8PwXgQ0OAe6R
	fp1++tve5bCigB7QHeZIwWL32gVpzzWPVwhtqt2TsFKf8xD51pyqmXWW8PV1UIPu
	YdbSSYiQb3msA/QeO6GJ8riMZ1npzd19nmJPBLk/UxjcqIw849YBAiTcr3Tqcld+
	XKZpgofijZ+WW9X8dyI/jCn8CkjlzJPkfXSd259JgZiVD5R4fEp33KFP+efIuEK0
	6JXH1VBzHt7JGqH78la4VdYWf/q1AlQlyETcmOoDoQP6tXrWUhrNmgKoSZc7elss
	k8V5dw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q1ydb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:12:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so23390816d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772215942; x=1772820742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5B1C1ZS8lb5bAMq35rYodnBV2Ng9s9xcJ2D5xRb2e78=;
        b=ZTwLF8iKlmvETGn6UqahexLjs/UDA839JJ8i+1OvtFrMVdcwc/fOjN+9mMTfVSpsRi
         j0IBOH4VCD2YdWhwltUVSVY8diAvHczS+rfoepLJMPutbnMCsxqUJpX2Lix2wzKtyIC1
         96iZ7R4XyP4iQ8r7sdYSxX81WlDSszHRMIKR8dYULqji2OGiov71bsTN0IqsQ49oCmqc
         gOe8Wf4BbsBJhG6vxCHTf7asJ846Z9CmxqDNsnIK3Yw9R9b8jAwN1Fh2k407pPUBRdoc
         MX4J2bKmw9kCIdjBlgzCIoYm7p8OJSW78uk3bvfrL9/hYDamYUopnwBNqDxUHa+iZ2PT
         pjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215942; x=1772820742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B1C1ZS8lb5bAMq35rYodnBV2Ng9s9xcJ2D5xRb2e78=;
        b=mdkBci1zKPmRMsZmMf6xF2vw37NHAefF+Gq9QixMv5ImNEJmMRdB2rT5A+ji5SmRsO
         LpEZOG0fAaGwtxjYBHQzZULq7ruy8vwBe3EyRbRAsjMWK1ZJcySL4RZVAUldJ6Scg36v
         0A3BcRokeC1yKpa0FKotU1kUTNtM8TN1rmDHZISuAFKhahIpdcFzkNQ6PMfIq6rmNEnx
         wxV8gqWVzWk19x6iVZpbrKVHQRlWLQH6HJMnK8AFv+yIlEPiGKvO3jvygzxeAeJr7QAw
         TdRKH4Pfx5MxC/zZnT0e9Xk4ZgKIh4SYbN1O1bIj4eCZg69mz7bMscJEckGM765ApcSa
         gAFg==
X-Forwarded-Encrypted: i=1; AJvYcCX6uQInxRsSRp5Hds6iSC0UR695J62L/fTVWh8vxRRHg0ofMzQaDx6puwBi6WWjRbNtVsIbTYaEtGEpVPtQ@vger.kernel.org
X-Gm-Message-State: AOJu0YylmaSe6TSxKlO3d60VX+aQZ6D9YsSL/jPiwbHYRvKgmYmgHTbC
	RAIKbQnMJnzoqNI2V+NC4I3bnbwl8xSssx7DpVk8ZpEPW01VC/i8WHL/m4gxy1jIb9COCknGvJM
	/Uty8HLbVGSN9lSsjHuGTowR3VqLc8fCqRTJPOCmB9FAbL5+0qCqFF8VXzlQWVd8vnVl57rrvbD
	e8
X-Gm-Gg: ATEYQzzcX9BXofcAz/+Cs03KL4B3dRrxbwXGSO72byWXNLLgz5UscEb6oDQm1CzvsVR
	XLBT8KPhtD4gjysumve7LVxU5eYWmkjnywbUBueveKx+vXiNr28kfT1pBWPR+3bGu4HY1Voi1gG
	WNzwFEYLIzhv9Aqh3QFVoNjshLG+H3o5YicVk8uCn+Jy0iGjNjKUOdRz9s0sKu9xQ6o3mE0SinM
	fbRJVuDD3mWR9wnMR+OqZ+y+E4wHeDZmNq/+SWZ0R2mT45JIdUcw7O6tICfiHi/jukFErK4UgLg
	HguGuWa8LAzQtiICH4vKTUYnvj0g//t7IBZL3dSK6IkAxhOMb/frfpnKyODgzBBFIWoCOwbZQxo
	Auc67CFwCtbGLiXYjwUABFUNiiIJpkc2XflsE5w8OeBG86oo4LNyOtWI+o3ruqA9yxNxlE11csY
	/7RIU=
X-Received: by 2002:a0c:f106:0:b0:899:a83f:a8bc with SMTP id 6a1803df08f44-899d1e71bcdmr36642176d6.5.1772215941768;
        Fri, 27 Feb 2026 10:12:21 -0800 (PST)
X-Received: by 2002:a0c:f106:0:b0:899:a83f:a8bc with SMTP id 6a1803df08f44-899d1e71bcdmr36641846d6.5.1772215941365;
        Fri, 27 Feb 2026 10:12:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac513acsm171394266b.18.2026.02.27.10.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 10:12:20 -0800 (PST)
Message-ID: <12ba9b4d-7d63-4509-91af-e15cafa59b62@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:12:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: ubwc: Remove redundant x1e80100_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227175613.164637-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2MSBTYWx0ZWRfX4nh1trW427LS
 1nphJgtAHWZyaeiifEBOfWnzAFvQGSwAlG4lKmS78oIuw3Ca4EH3vwMObwrCjr+qsCWbW/QXiAc
 9Zp1Fb4sc+FQxk1ZsNVBz+fymQM2Pr5PGGFWDmcK8LW6KJ3iUd9+mGWHJvTgCi4Se7CHsbQINjs
 E+hxwg+KsEiBz1pJk3I44dXrQiil9pgCSWA1VuCq9rl8mJU3Ug6D/QRI44XMTlUndnN/5RByp6u
 a1ExikbkVizAnsvDrR7i76Q6HvyS/zF/gG1vm9XoLGU9oO91O77oic6GoBHUXLBwUZSnizw/dZV
 8en6pIKkCSpaZL3RK5JKMBTk3FFNvqEOr//jfxJhArWsw2Mnn/DY1YMnfL2l7P0esDnLQjQpLJ8
 E6Ig894ECG5vt/M2iQrEmc/R7ROwVIvR3py2JMCODTbUAt/BfGYlYFnYdiGUU3/5489N1px1nu8
 ygBtRCqdbYUKcfbspBw==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1de86 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A4qfhe_Bf-PYTsNBS6UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: gQ1NmwSldOCdbOIIMKyHfkDR2weO8Lt7
X-Proofpoint-GUID: gQ1NmwSldOCdbOIIMKyHfkDR2weO8Lt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270161
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94503-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D41D1BBD43
X-Rspamd-Action: no action

On 2/27/26 6:56 PM, Krzysztof Kozlowski wrote:
> UBWC data for X1E80100 is exactly the same as one for SM8550, so reduce
> code duplication by reusing older entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

