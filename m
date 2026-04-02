Return-Path: <linux-arm-msm+bounces-101511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBhaOrg7zmmAmAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:49:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A613872E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 11:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B08D304DEA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 09:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C89B3DBD6B;
	Thu,  2 Apr 2026 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3RpWaCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDetAXS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C4738D007
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123311; cv=none; b=Th/KmOkuS96Lcwu+jtr0cadoo0q7QJ3zfz65XXLJWizuNQrirrW5FaQ9+r9fd5by8yVUQhHe8vqsnMgG6vNo4i0AxLWoyzQsAcnJYi9vYDvuH/y0EmMp3O2hfJArQKrvgZyh22XSLy6YSsEqBSwb/JtbHiKwfGjbNr66G6PGu0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123311; c=relaxed/simple;
	bh=K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=eqoeaIUtdHAlWOdNr/xOby6cqATUEF2SCSw0puwewx9WTNeaTxL81yZvEuLb3vIGBO2afXgfwCXNTRO1dDcEfTgnv92t2Lz1pNkYLYHtHS/+nai/91OsZ03GcJsANy3L7HmWRts3Hf9dH/fnrsFSo7ap8B2BpMIVgEqiAqCinOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3RpWaCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDetAXS8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326h1Ze1128543
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 09:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=; b=L3RpWaCpIFI1+Q7P
	A5c6BiVoY6X7zZkryrcZspb7q1PKgDaoY4+bEyotxL7n4eEcMRrW+S27uMtpb+p1
	xfUuUFMQjdrmlmNxYXl/e+/m9q/uknVEmhYYgrLVd8KFwkQvfXBjH7MFf4gEJzwV
	PntSn97nvBQL7KHJKNF+8sEaWQgYUBRHZZ1ylMZmSebFexCHnm3pzE6mkBt6H76p
	mErhX9r+lnNYBxFPW7VfFpcBGVHodacGEo7KowXwD7VeySvwHn79r6IQa3y6LC4f
	JBz1f9mMK3NaSJvUJRO65xSRhZMOTPo7489goF3BkiH4C1eYcrpPdhbaBvLIRjGS
	XoETQA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9be97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 09:48:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76b6ccf298so518465a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775123303; x=1775728103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=;
        b=CDetAXS8jih2Lizx+BSC+ZAUbnSzUyfnm4fRGepLVmYItqECTNbq7f8uWYg4W0Ub7c
         G26+urLm4DQoIEbWp9SpJpPeARzm5PiJV86dC1MvGWwbtBwNwOXAJD41gRjhFIixCGPe
         wwhkyEQ1Pw4/a0lMWrFAgA8wKHCCw3hU5j7By7I7IReI2bRhINOKHKgmS1lNp+ukq7ji
         eSTuAXC4/OdYD4XptW/mcBBUbMujaXrLLt0vDieiK8ZnAH0kElIWq1p1mRgFqBG2ztkA
         aNM5T22F81Q0RkKamrF+IbXQQBQK51WZy1XBOM+utvOcGh6WphYr9pk2kg+J30mtzrMg
         x93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123303; x=1775728103;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0KkIFUCvFyXnZFYmaPL1OGI41UHrDSOQfmE1E7QERw=;
        b=asGsG0LkNHzy69XqabjOmeNlnSImtnBw2nZ+pJ2SWqmHV2uu+w9eRi5Z7XmwzTtoHE
         jIaK/EthsK0P6SFhhzlldAeZK+b0oaLJIYqvqvZ+MZMo/qwWuvD+3LaNrkN0AZcVLgSS
         57dF0/CwTRBD48qP7kJ1mgcLe4xLD+HsFUmQ0U0DaOGLhFezyavW+4SV66RTJSt4Zo3t
         ZAbPmgT0+rigHO9QuUOvAUMM5auMWvNilo/glM/+toI4XYu2SLIQWEOLrff/tv6v4+wi
         1CFW2p1VkMqcYL01G3DxDWgLpJ/jjLL8MYIUZqEYHmh6UGbqveZR/016bMPFjgpxy0bq
         mbHA==
X-Forwarded-Encrypted: i=1; AJvYcCUfqlNlnbB83UNLUChIqpJNPzpPw+Fsu1nM3NwvVCIAn1HYWR5hJx6bdJT6C8QQredpt7J4WVpfmrzzAUN7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/pC3DrMNQZL2PsRlgHhRRkztH+J5ID5Q79cNGF5/eiTE7jRY
	K8f5yRwq31b+Al/YBbjDVuOXcGIs9m8u5OiKI5QAW6z3JOMwKUDX2uqG1zJ/Z18tIoBuvIW6naM
	l0zrL1mxR6N/4zM4Pem/eBzBDCGlFmi11rSHl7Gp2l672wbl1cHXSfxCxKrFnRLs1M/S0
X-Gm-Gg: ATEYQzy5BHkWQmB0bha+116qrzcoPJ6ZFpjDzjrQAYmqWS3LYnxPINfHsSW6HDyjoxZ
	ORDYI4W4en27NCYJQ2eajLkc1e4FXRwDP2TAP5IwAvxJrfJ+jC/+f9u/SIqScnmWZ10EHCM5eX5
	AZBFldrnx/465n1JoLz7EkZPGBoBm84coER7w5SQGNG1RZv1KQQlgZebtcaTyIemSobVkBvAknR
	/3IY8NXK/lkpJC06V5NWP7CcYsHSksliX+oikChfMQtBLjoX8+D4yTwl88ADxx1aYsM5qZjT5dD
	B8MY3Yj+JGoN9zmjYtdggExAYszb9s2qt6/SAnvYkbPh1xGZ6Is+sKpCmGqSFdBWDdF7B1kyQLL
	moWCVY0ZV7iGMzWgYG/YJbIrlcuRGgFVaeGwqwLdPTV9hMuFGRuJeVX4o9+rYwNXgUhXxJ8L5y9
	yKo70UWKRACcpWICU=
X-Received: by 2002:a05:6a21:9996:b0:398:79a1:cb1 with SMTP id adf61e73a8af0-39ef779f9e8mr8023007637.64.1775123303191;
        Thu, 02 Apr 2026 02:48:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:9996:b0:398:79a1:cb1 with SMTP id adf61e73a8af0-39ef779f9e8mr8022951637.64.1775123302047;
        Thu, 02 Apr 2026 02:48:22 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6372078sm2226629a12.0.2026.04.02.02.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:48:21 -0700 (PDT)
Message-ID: <5affb7f3-30c4-4e98-9905-c09154711542@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 17:48:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: increase fastrpc compute-cb
 session slots
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260401073345.478-1-jianping.li@oss.qualcomm.com>
 <ejt3dzkuo76sb6jipkuae2u47kushc3vporxn3xclts445pgck@5qfcnufjljiw>
 <7b271810-c1ab-4d07-8364-e4c30588722d@oss.qualcomm.com>
Content-Language: en-US
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <7b271810-c1ab-4d07-8364-e4c30588722d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce3b68 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zrXMvOTigF7fNPF74M8A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 3O5jKvzlQ0XQZdWDIFHTu0Hc5nwwDG78
X-Proofpoint-GUID: 3O5jKvzlQ0XQZdWDIFHTu0Hc5nwwDG78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX6iNpZHkBX2Ao
 6DHWWdFMI7yi2raGuzYHp7G7nKo7Gn/4b0evX7tPJ/33QYiBDHro55HcI/GqLANPZW7HMQsUyKv
 k+4iR9Kn9wqF+iY8UeCSTflL7YGTuvfoM5nTWqbHLW++plSVxq9kJT9g/OlUypvP+lR6BKiO8c/
 499Fv0YCAtBhd1eTR0lW57UkjuoCHUM+NUcJ1Oh6OYik3QqdxeUzmhyK8auxFlqtczbvLiI4Z+W
 DLZSEKi7xF6b9OYwKieON0EsbRjxYkAs+LnQqrSqrEVQ/ok7V3JUb99icCZK/tF5/NBQWkPXVLT
 P/5DgX03HqnLhEDdJCJqBTjTGYAZeC9iGYd7YArdyAighdw1nj0P5k//I0kq1bnupMBK9JKDB7T
 RM3du6R9696MWozFQUOOpjqkrRrYxE6hSgbs+XcfMdu3kh/qSTjfP/uQAX6g5AVbJH+d6Gg0Cds
 DidoYw3yGwBTlF9srXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101511-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 71A613872E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/1/2026 7:40 PM, Konrad Dybcio wrote:
> On 4/1/26 1:33 PM, Dmitry Baryshkov wrote:
>> On Wed, Apr 01, 2026 at 03:33:45PM +0800, Jianping Li wrote:
>>> Some workloads on Kodiak can exhaust FastRPC sessions when multiple
>>> compute clients open contexts concurrently, leading to -EBUSY failures.
>>>
>>> Describe the compute context bank with qcom,nsessions = <5> so the
>>> driver can provision enough session slots for the compute-cb instance.
>> This is a software property, so it probably should not have been added
>> to the DT in the first place. Can we replace it with the driver code,
>> allocating more sessions to the last CB?
> Nov 2025 => https://lore.kernel.org/linux-arm-msm/53644b36-2eff-4b1c-9886-591afee8b589@oss.qualcomm.com/
>
> Konrad

Received the comments you gave eariler, currentl checking them.

Thanks,
Jianping.


