Return-Path: <linux-arm-msm+bounces-101594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFDPMJQJz2kNsgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEC638F71F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96D523028B1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB8B1684BE;
	Fri,  3 Apr 2026 00:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYnoXXrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1lsXau0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34948220F3E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176077; cv=none; b=O+2Umy86ihAaHYhcNWl0zIHsfl3/0bZ1lIrhjJLm8ic31Q8ON0zw9kBmE0PxnUgzk1FMJ+JfOrn2yjqrg6K2HPnSrd1vT7MpVIdLJphfRFJlDODSJlPUVM0xjH61DcRneaou2j2ISLUW7hhgm8YGO4rHPs7dig3kNi4oqAzjlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176077; c=relaxed/simple;
	bh=7F2z4J6Gw/70SHU3WEIe6h4koZ1DEImtf0HW5NnAVWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxHmdjH7hPJgYNg2PqDgrTNBrrJ5x+UJZ69UMtiW3lQaX4cIIkYgX2SC+8KyTdoFUR91hGl7Tgo6MTMhUWIwrnPAWLNoyohhVeuXFnXqlgRz8RufmpHLVsqG6Uov+PZJ9yunOJvX66ICyB+STAdh8OHHD1Muld/3r9zZn/uKB2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYnoXXrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1lsXau0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632I2QuB3772892
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MuJNcdT01qfW/Ml6zHPw/vD12isOe1NzcSfGNdSoBIk=; b=TYnoXXrEXHmIQWrk
	bLhlXgtoaH2StElhA1GYKeGHhq4i8BtOlsiUed60QRIkjw/5eN7fEIe8wFuonZdC
	4JL/rwnwtiH2mL6KqSptLDZAGSZIUJD78NUnFHxd5hmdZPGyhracmOw+5HVMTJcs
	2qeoq6pN2c2gqHX45jwDdOW7Y3XE2DzPigZ3BRE3Ys9lfsMk3QeIB0pcq9Q0VdiE
	DJgwjgvad4yVqJ6igkFbiI403oEtYU2QDFf+M7gRkSx/eU7fBsseqKHli6BDRaMF
	abXS85LfhmCDxW35s+EUeXG+PCWzazE/8CBpbj0mmG6MtMkoHRJJTrnPPwLMKI0/
	YZsmyw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs0yef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:27:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c6929bd26so1664690b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176074; x=1775780874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MuJNcdT01qfW/Ml6zHPw/vD12isOe1NzcSfGNdSoBIk=;
        b=b1lsXau0xmeSVkOepXNdfllAhpHXJa06gaGq4J+FUXUq8SKbEF8xUxWsgSdQNsripq
         qCOkDRkPz/f2BbaT2057eBlfqBhxH8qSHeLZgxJ/KfTuOSGsW3jcBkCxDw67oeoUr22R
         xJ90s1tDnWkYytjvbS3VdDhWMm6i9Vo/egE0z79DMP+iONhkhtueX0shJUigl4C/tEFK
         rMBvUrNp+3gw6lkG6cFrsqILo+FM8pGmPVbeWgwrqpPnO1nEB0hCfr+2eXv0IXkueo87
         bxA5aKLQBubgZbD5nwZYf4zBYCZeDnx2XBLVD7F6otgux7t+3JnfMUdmMT1/IKjd6Kn+
         XLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176074; x=1775780874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuJNcdT01qfW/Ml6zHPw/vD12isOe1NzcSfGNdSoBIk=;
        b=TDKj2ulWN2Rxjn7CPI3PPbkPKSQPms5h1rvRvVxj1vbx5qRNBAInLwi1SxrHkBeUu5
         CVD0a58M4WlS0chykE07mwOmjHIn8qIjFVtZRvyylO+PuIDRxXfkuLaqjUDKE+YFTxyn
         cu/6BpcuqZrkXdOsPmj9Fb0spG04pxyL5HI1sAPG1v5Pj8SASVAWBNh72e3qd38Co9bq
         nHbB5B/wOzrj5uTDnU6Dgh0Er1GbqS0YV4YbjlLyaIADORQD0GTC/QfYPbtMk8gAvwFu
         uyAGIhKn9bc6at+Gv06ECtGbCQNIqSIDPsOeNgaxvrv0K8dLOf0zDswGiYkIQeiexPG4
         HCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCuJqlgKvCBKx6qlv6heFcAnQpn9IJuUBlp94PHdQv0eCFZHatVhBEUEza8zhxsoT6dPRkVDgv4WfYgBsD@vger.kernel.org
X-Gm-Message-State: AOJu0YxmGy8s0R8qvm3o4MuFVTnHMWTnz2q8Jcc/yvi0Kn9A96zoywpI
	VwqSlNXid+cMICc3CAfv8IDAkCjHOh1Vuozm40VU74Hon0booScPYBB5YmqiLIz5eN6FjSFj1Ef
	KGa7l6/npArr9+Dd83sL3XvCkfOdW5JtQ8HmYbV5Qv14JdZNjVtI8SdGqhzLzUNW+whmJ
X-Gm-Gg: ATEYQzyjjbHieIXBoiPd2ko9BGFfU2pl+krCfOU9AJ5QV9J6896+5BqFWUxuzM7tMgk
	eSttbOVnW42gKQ1+2u9jzVe/dxnhrfMP/EFJBn+D4WHKIWoHPepY3R4b2hocpb0Wb+Jy3P9aixZ
	teqaSHadFcgbmf5cm56ZouD67FU/PVgESSho2d1qJa8TGuPjdUAyCwPeQDvUNWuOnHwA0zgHUQp
	10N5jJB9czxR7TMqldOrhcFIcRYaW1PadZwvnjTrxwBSqU+n7I1L56FoKKxHV1bTBqS2roiHEcR
	dk1JqI0VersFFLiZzY9qJ/4pA1GzMARpEpSI7a+hQonancW39IARBEaFhyc42zRaaZc25j1LV9T
	YOa9DfyhY2d2PKZWFIjh3e4r7ZOUQbwkd9kqpaUMhDBfbCNfuYvctn9KxtUpKDHlcccwuuYGwl6
	eAaJzYjAQNck+wDg==
X-Received: by 2002:a05:6a00:2d15:b0:821:7d7e:41cd with SMTP id d2e1a72fcca58-82d0da41a47mr1020282b3a.10.1775176074115;
        Thu, 02 Apr 2026 17:27:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d15:b0:821:7d7e:41cd with SMTP id d2e1a72fcca58-82d0da41a47mr1020262b3a.10.1775176073638;
        Thu, 02 Apr 2026 17:27:53 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6c2b4sm4218146b3a.46.2026.04.02.17.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 17:27:52 -0700 (PDT)
Message-ID: <28e67364-4d77-4294-9528-171a9ec2826d@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 08:27:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: power: qcom,rpmhpd: Add new power
 domains and new levels
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-2-c830c79ed8f9@oss.qualcomm.com>
 <20260402-great-affable-panther-1a5ed7@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260402-great-affable-panther-1a5ed7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1EDbX4u14lgw8bMsdCxpM4F4kFta4kuc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMiBTYWx0ZWRfX9gT7ll1XX0Dk
 2n0MWA7m2rhv6tMU67sGTEBGhfOpz6vLgduHV+XhI2ZM0SuDy5Wb8osUtXoupBM2oMzREAvS6Qz
 Hyy8c4nBuOfELF5CvGSrf7vn2qXqlw5FOjawrRRFTAP4lazEOpOl/i7nWNPQhfRei9OMRFsQITU
 TPonSq/KNinUmpwPQLnDPRTLVIavxMthQCmD59g0aMZxsOyJIOpEmZXdKgoskJSn5YUIjYMNjO5
 MVLgTQT9P20IMEnAY3VAsx+utS/sDt4Xn9qv1Ibp3u/WoJNlgfcRFPJXlUp4d7A+IQVg6hRrcUO
 tlaj04mKk/JtcS52obKtIYlzYEbFXXAUbutMdYThRYxCgOM/AWGXScdq0/eXilv+3aUrX6fJ9gr
 EB8FdmI9y2akGv1D928rHe94Fd9+xPT8/Qo9K/KMVBAy15virnUI522XRIsp4XLt7JFTF4ARJJ8
 GvIBrfBHc9Mim7S2aLg==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cf098b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6iJtGgWn3elk5yOieJoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 1EDbX4u14lgw8bMsdCxpM4F4kFta4kuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030002
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-101594-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BEC638F71F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/2/2026 4:34 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 01, 2026 at 02:15:30AM -0700, Fenglin Wu wrote:
>> Add definitions for the new power domains which present in Hawi SoC:
>>   - RPMHPD_DCX (Display Core X): supplies VDD_DISP for the display
>>     subsystem
>>   - RPMHPD_GBX (Graphics Box): supplies VDD_GFX_BX for the GPU/graphics
>>     subsystem
>>
>> Also, add constants for new power domain levels that supported in Hawi
>> SoC, including: LOW_SVS_D3_0, LOW_SVS_D1_0, LOW_SVS_D0_0, SVS_L2_0,
>> TURBO_L1_0/1/2, TURBO_L1_0/1/2.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> This belongs to the binding change. Unless you are not doing it for
> Hawi...

Sure, I will squash patch 1 and patch 2 and resend.

Thanks.

>
> Best regards,
> Krzysztof
>

