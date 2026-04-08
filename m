Return-Path: <linux-arm-msm+bounces-102298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJD5Hssj1mklBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:45:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 209133BA141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D3973008985
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1DE37CD37;
	Wed,  8 Apr 2026 09:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h9REHJRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XFD2phYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DA337CD51
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641542; cv=none; b=o+5seqxtoV6ZG8HmTS7uKiI4oMoWNFSh37vEeWQINRcHqpJRHSHRnCt+vlQHpnEJVJINfg/AnbasXOVA4D4VMDlLS288kF5h5lvr8tNBN/gsqLcDWZx8b7KuyKh7nNaXdPbzKylaTprGW3p1/hIRIlCsowPFylNzdldgOnJACdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641542; c=relaxed/simple;
	bh=uU5MKqcc7S1AZTc7G0DzeE9Lz2K603zklKOucPKspro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoAEzwfOdZo4iEcI7NKuuBsXkHLmC9DB2Ivh6hIluyuivHT2bmn1i/wtDW8qWtHmWNH4+Gup4Nva54LAvhKjrOUx6TuApPkAp78VZ9aRsUop50IMe39SZOphzc0rMwQpOU6LdiOE5OJ7CO3tTu6VTVaVXChgakjb+Q7maWESTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9REHJRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFD2phYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63862q1m1314443
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyuYaeJsnY00/XTkcl7oyT2eXIkuHhnCGydi3xSOPbI=; b=h9REHJRJ/zM7VS3t
	yLiAMnx5+zCrIn7pIVypDZhRVgJOfiqIyTLrR5WXR0DZOdVi8JjvdcgPMa7EzmBl
	SWhyGWFwMHfpfL1n4Lj6K6vLhG5VaZ2hnGeJNLD4dyp8emaS3fTTtqJZWezX5aMD
	Df8rX7rob+pp5efIbWUDoTr1fZSXoQKcSTc0abmP6U1+KFO4DwfrLnPpBTEn76dG
	CrKFHF23LxoWewcrszFFufxyZLHUBl4D877aUZQQmVVoC6eHrlnEQMc7PVVLBtHy
	9w4Nc509P08Vx66QZebX1ES1NQkPV1fEG31AelX7zzLTcJ+VDl4yroi/TNC5YZEx
	A2Barg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6jjg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:45:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89eadc12c84so22998666d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775641539; x=1776246339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PyuYaeJsnY00/XTkcl7oyT2eXIkuHhnCGydi3xSOPbI=;
        b=XFD2phYqetaG8/7wJiIwhFVPsLmTFw8NXVFv4mJA58bvPcUEUh+6CsCZPieY5dSBnB
         CfXNjp2dZuuD7T7jGCBE3OumpHK4FvmZC5/pXY2BUjotTR7WukMIq1G2GRdO1JOsUk14
         jeSOcAOyr3Dku8Rj/9tAMNg1HQU0mOQDZ1kOEYFjwqQExOifW0a0A3jqwFXuahk3cDr3
         Max0WGSKGRvwiYeBxmc272lHsuNui6VHlT2vJEbwlvWmgc0zDZQC0OXOMUe5J5ylw/qY
         f+DI6iGMFwoYXa2zSSTFfDiX6IgHBzv2rpHoJkLYpahbklhjqjlN0mjllWjr75yUt+jL
         kYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641539; x=1776246339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PyuYaeJsnY00/XTkcl7oyT2eXIkuHhnCGydi3xSOPbI=;
        b=TuTeSwvnBbgiVvazP+Y7RSUU/iU9yT+rQz0LU8xhaDFkv4MAEng6+Kzh/vl14/k6K3
         kIGZ4fdTRiHJqvxlxWQuLZhA7dZlDf2nDZ2xOLaAR60gnmSxrs+J5mywjpAnJZFMqH7+
         fjccO4GdLttMjYHvMz/0lkfB6p9ks9yb4eaQ32PNncBMtP8Ovle4GfpdGsP81CXyeq/w
         Rr1RsQyQFtQ0G3RiikMzblvnzXLf9Mh0aHUXM42uteBM2lyob7n4+pZdm33W2P0awdza
         owWcfAv0BY4PRqwQhifmDHibB8JQArGlGutwWVw3Tvstv/IgpWBmkrboWS3eNf5EO8Xh
         d05Q==
X-Gm-Message-State: AOJu0YwHWzvsVtl4SjUVhqdA19AwCZIIAWD7eQfZvZ69+Z+MN2Vm85eR
	sR7+O47ejq42hFlOBHi17VTf2G/IB+AOJBReD7KDyvu8LFDfM19aNLMLkp9xMvFfuKCcz/rbnxq
	xcIgD5AksxLCbk/AlAvE/05RJmh6bJ8ib0IBuYxLjzkSm26FPsCZOMTUE7mZf8B+R9IuX
X-Gm-Gg: AeBDietTZxsZTg1XiObwa1Xm9n+zPcFTk1ZMIESIHSvEByKxU9I8jjc3kQ0b/fNWAGB
	3mB/UB+8wrVa07EHMPfAEkxkKNYJUNZWEm74kg57hrsi9RxL8w2TORJNdDwLnoEQ4LgN/2nsmzq
	hpkKrnBwsmYWEkK4jvUG23n1yXPsE9jY/1ZafbuoO2gqQXv1X+gIt50OC5dpgj5N7cIi0OWG3To
	KJIrpZZAu+MCJfLQDVJTvccqorb2fjpZ+ByO/jRo2LWI7XNjgxuXSAtZa8uYNGNbDrh3/OYPzfv
	eCM5Mv6ZdHt6R4mRHTGiDiuFsynFG2V4NQsuZuOJYaBYGbbeiZ+wNKJFXJOsRBwhidsR7Tc75fH
	9wEHfIaLORG0nEL9hjr6fplEky4egM+dIR2rBTs/RVB/VQi2h25313cnc8yFTKpQzu4o0NfIfZ9
	47Two=
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr237836796d6.1.1775641539102;
        Wed, 08 Apr 2026 02:45:39 -0700 (PDT)
X-Received: by 2002:ad4:5def:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a701be043bmr237836646d6.1.1775641538720;
        Wed, 08 Apr 2026 02:45:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm623882466b.40.2026.04.08.02.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:45:37 -0700 (PDT)
Message-ID: <cbe889ff-327c-4e06-8747-3c81f9e561e8@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:45:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QCE crypto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oTECSjHzKk8U8ZTdMpQ4yC0gpbVqbIuZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4OSBTYWx0ZWRfX8GcWxSo7DnEn
 rYkZ8ZnZ5amVxNiUbyFmQp2dlAGG+UOGBzOgWjxXsO+TCJEXMR2NehgM0/OlLJPxJWEWTJQ9Lye
 cogmosesuEKM1dNtyZQzGgbD3R2stmxkvPO6ymTtWfkXm2SXYsgKcJ5g1D1Yo9EaP4OuV09T+65
 G0xZ4j5psNn6PWMrRVoBYCxfw/MZgOZ7CNmUmDovJpAOfEngSBlQge0lix7XQrcGRs50j5bcBwJ
 yKN/EIJvqI0Pm0QNrqXuQkVbAhz28OXm4bl37qMYitmlUWi4CJ6Q9difSfQWgKlMzpwAsh/DXeb
 q7XvCyDXOXGn12I6ecYFmbE2uBQizxXhc7GZQO5yVYwby70udJORzF/YeheDaks5vdJzyk9B+/G
 0dCxQLMghXCt7UHgYOGISWkz6iOE6AjBdE+cy3Vq4adS8xBR+vrevX+vfkiaetFkyKQ9LjjLa9b
 KcO9+AfI/w8GHOlpPqA==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d623c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9nldhgvQxnsrbX0ZkhUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: oTECSjHzKk8U8ZTdMpQ4yC0gpbVqbIuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102298-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 209133BA141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 3:51 PM, Krzysztof Kozlowski wrote:
> Add nodes for the BAM DAM and QCE crypto engine.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

