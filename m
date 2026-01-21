Return-Path: <linux-arm-msm+bounces-90059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCimA9cNcWlEcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:33:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F615A951
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C01AA88499
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622F14949FD;
	Wed, 21 Jan 2026 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8GFuoc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIAmURg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BF364EA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014356; cv=none; b=icJel7Xc6TLUPCXPxWQCMcNqel7OXwis79Wn6hHv5xcT1on9uC4cKhmmiGaH0y2V6kW07qVD5hwVtshzxxcPQpfSEdwSkclTdYuc+mTCQYsEn95OATpfhTM9PtJjJTEXEfC0RzdXzH1XEHvvCqFNJgrgJlesPAgYyl/GgwaxsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014356; c=relaxed/simple;
	bh=WIy1I4XbytZXyMT5K0uzcA7QaKdaKY7xEiRxpEesxRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVlABYHNaBrF6ZccocsfpViTx2CBZArX2vczjYGmRCVNhurzGblu0RS1kzWFI5SOqxX1q09b3jwydlW2MJHMcScyA9b8NRjTjmlS2kfUj3Egn/KwTl6wmCm9/NdIcZ+evAnut/IEIxoY6nfPTQA4cR5bd5Ud6XGMVOwhP1NWHd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8GFuoc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIAmURg5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LD08ZL3217956
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyR+YusWrjMwZEEpsn6at4Lj5Jd4mxdPjF+PE4Y97B4=; b=o8GFuoc3cRcwPlvp
	bNkN/jCRGcxbgS5lWWqD6wj7wMtfEqxuuC07z+aplhh8UU7aKVVussAPoolFtOEX
	QHs1wS9IM1G5choTAPNw85KkbuYZ0drzc7H2VGWdtGb1jDio20T/dNwteKhbOja8
	Tar9SYGoj+H5UBhZIJRIh0+B5URKrVmLqUf64eMyck8Aw8rOqyIdy0L4877LY6md
	VWyuDssbk3Ft4x53ebQJfeykTa5L4Bj/nTBFXClezfr++6BhlS88eq2k/5K8UgHX
	q4gm3CeJEq30/bpCtkAf2KWDA+16UBr98Jx/1uP4jqJ34qyHVsv9caAvtnQDTjnb
	3ApzTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btya28t9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 16:52:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c532029e50so895385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769014353; x=1769619153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyR+YusWrjMwZEEpsn6at4Lj5Jd4mxdPjF+PE4Y97B4=;
        b=MIAmURg5YWW0cEM9AnN6ZFKwk1pYLW7tTFaRN4gB0n7+l6/Bi9Bv12zmFHrBy3i0vY
         cENpg3MkNbzDBR4PQzgtb1mwuxv92zIfPFMByDE5zoLJll+rhe8dxKKUysjEg9C5W3fF
         FwOaWBr3Ro7SxOgxzHSKj+kDOWw6AHGGUZoREuDd+AmNvoy5Y515bPDFsDh6Tjs6kInm
         lnWtDzHN+BxwyxDYa4rmJPcVyb8zd6nuZ6XvoJEhNG6fGV9jZCgeHt+StNQL8+dGHwGt
         WyUNyueF2IOQw92Fm0kVY0YVEdgJ3USWedKPCTUJOGtzUclWxys/whK58ITC7aQ5RAyM
         WjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014353; x=1769619153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyR+YusWrjMwZEEpsn6at4Lj5Jd4mxdPjF+PE4Y97B4=;
        b=TI4nuY851ZSCprECkO6Btw+UVx//gxZb6wE6rQu6/IZjoZvcsHMcFI5Clqjm9Q+2UY
         4+aaOQxG7o50T0hAgJvOmMP9didyhTbRfD8boa95n35+rwITbDpIN4wYws5CKb/WYppa
         fsfcLr+3HVLf0AYM9dp7bgJJLhsBCkgxxCHhs0biBJB9Q5+e1+lg/FBMzI6hDGmNnGjm
         CtVJhAQY5KxDvUFCKZQ/btENx7x/WwkWmlS/qIr027SyxNba72scJowuVJKEmxDpSRy1
         AMBVvGHOyjvpkjFF5JWHt9YvbqjyFujkgD9L5SGhpqXh/p+EiJQ/QWYMji4fsqv2l+E+
         WBGg==
X-Gm-Message-State: AOJu0YzZlm8SoKTktATol6052Uw8A4YbBsEp9TZ+PsIYvnQODVjlGrkl
	7UCFOMANc+4zblckwJ4nGNGODFIeIWDriaufC5GAFWYdqP/yOKPV5JgEs8pz9gauhwtkqVdO+vR
	8hXojODzQqTPe2HrQ5bQi2HY+gOQmWXBvBIxc1cRJBFNdh+0U4qhQUBzV4CQtQL+bBwXciKsE1c
	e4
X-Gm-Gg: AZuq6aLyVPGzmV243+E8xCm438+b4LG2BE6JfhalMqozrBMcCi3djMtr6+Exl7ILSPr
	ZNZB0QfLW3xOc76ngp1F6Ed32z5iKEQEgYZBMIl0LsvWF4jVSqKPP/yPp31VqDRP0Tv6bWnjM43
	UH0yqt/OrQdR8+nLcLPq6x3NelOfewWZarY5YzmlQ0/32Aw4nYY4krFgK3z5xQU6+XdSbhajFgZ
	/SsaSxjWCPdJghF2LymE/oSpaUzQQkj8XAbUI3UNn6Re0vQhAlwsuNl8KS0+oJYT1DbQp12FC2G
	aMZktwVzISOQB4MXHNj9EN+zQKphA6P4p6KM0fQ7QCHb0ss3giQMaZk3vzYKCMq9OyiDppDSiUw
	IJbKX1Ln98KHwH+d3kd+L42HfuW+rwGcNu0AeMTLHZXHwMRX8Rq9h+VNnWFfB9ydcodk=
X-Received: by 2002:a05:620a:448b:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6ca44aa9dmr674465285a.9.1769014352545;
        Wed, 21 Jan 2026 08:52:32 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8c6ca44aa9dmr674462985a.9.1769014352055;
        Wed, 21 Jan 2026 08:52:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654533cc5ecsm15073959a12.16.2026.01.21.08.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:52:30 -0800 (PST)
Message-ID: <48881f0b-be93-4c0b-ae7e-49a404f20232@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 17:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: qcom: rpmpd: drop stray semicolon
To: Gabor Juhos <j4g8y7@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260121-qcom-rpmpd-semicolon-v1-1-9bbdd9478ba8@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-qcom-rpmpd-semicolon-v1-1-9bbdd9478ba8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=epbSD4pX c=1 sm=1 tr=0 ts=69710451 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=BASZtaSSWwGD7eeZ37UA:9 a=QEXdDO2ut3YA:10 a=bDEiuqbIbRIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: tVbye0pwC-xYfufgHDgBxNifZ89sSrlk
X-Proofpoint-ORIG-GUID: tVbye0pwC-xYfufgHDgBxNifZ89sSrlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MiBTYWx0ZWRfX2OgiIpcjaWbF
 S0k8IsL5Ss+nBrTWUIH3hOCc7iy02Ci/DdWDA4IIj92tJ/YdqeaSGFsUTIAYvcBJ1FLTgHgr0s0
 BPv3SUjzR8gvdYVxtOpmwQ9SR33uger6RV/gvj1ftiDHzh33kmE5RIcLmaD99toNaG8W7pzIa8V
 zJeTpLopGph8nKgybcVpqhgSUNd4kRc1rORHpaFnEgP5vMW5bIXRSnJD7mI7hCMTlwxnO7eSzqc
 35D7zs1sv6dn2wgdV7fvSGwA+QhmORCxA+wzBagt1gSQB//kcTkpoJFPI9FH1SnYHjC8ZkNa2wp
 +wCYA3aUADUmm9ot4du7Q95B5H9uiTVd+cxG9wxEbBSXJ1H81mTW/iwpNKBRN7g2ARcEaZy1Dii
 FYqEcAB2ASq78+k0R9uEU+k6M+pTTudksI1jXw+tmavfym8y1h1/M48ngKJE82qi7F1+e+ABwS4
 n8Ad1B/2gWFZa4Cxrgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210142
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90059-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91F615A951
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 5:18 PM, Gabor Juhos wrote:
> Drop the unnecessary semicolon after the rpmpd_send_corner()
> function's declaration.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


