Return-Path: <linux-arm-msm+bounces-89894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE74KrYJcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:03:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFEF4D710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30911AECBBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 22:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216EE379975;
	Tue, 20 Jan 2026 22:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgJOi1Mc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ab7EQ3Lt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18E33290E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946532; cv=none; b=qNf2WHkMrJP7K242QOoWaJw6o/jESiAdCcwPLrM2o1OP/lsIbIm6iDobjOdRzwH57XfzLm5uvW7fBAlUQnC9mUhuAQ5jHkh6ziYt4d+GSfiqxj6L4zn6BFY6Yc3RzkfS3+GmbNS638j/fslePT+xkb9D/2RsFv4zuMTQYPywNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946532; c=relaxed/simple;
	bh=VafLE2LsMSEMxe/8SoZIb+i5nLHEo+tX5wmA6Yii4yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUZIebGBDnxP7DQDfhpdkZPfqoKQFGuu0JixP74LEltV1chLEQ7dkQki2NK+7gtY6bBcwz5ctf+dYGLlYkRCeFTWuW/5hC+smAdV7Wqrc6JjYmR2xJn6aM3Q3tXbLDRkHBS3pGdCH9/9xpMuKDNvw8PiXl+K6mzsbjraNcVoZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgJOi1Mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ab7EQ3Lt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KK5KJj384992
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9crKbumNaTveQ41rktS41EDf
	zqAitvWbjmLVxdNQRjQ=; b=cgJOi1McE15BRnX/3Iqw+pmpEoef8WZ3PboUuFAv
	7Z4gjsFQp+6e4KqkmJYDppx7dvKrPqinEvA7vUSsok0BzzZKdpBfXLwbnkHSivDD
	Uv7FVyfHbXjeB7aC7jQSMDar+0zseL8fhxVWivARDvbpvyCVl4fEdlQKm1cRMo6r
	aMCm67kmIuikB0yb+ujnSeSHH0rEhwKPV7iP/HDAbz4Bgec1HoWrOVnC3Cim46vW
	Xw72jk6J598cW5txqC+hD/wHVVohB+aSAPp8VopuM1WEATi1qg7SRzxuR1Ub7meQ
	Bytl5AaxaFQC+WedhNBYObOqRjyON8jE1l3H+Nu9k2fekw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7q9t0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 22:02:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5311864d9so203791685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 14:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768946525; x=1769551325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9crKbumNaTveQ41rktS41EDfzqAitvWbjmLVxdNQRjQ=;
        b=Ab7EQ3Lt4Iu/xOOlZ3dAFgTyfGnxeZNl3+Gxq/eWqcD7qbODx9uBplK8gX3R+aEXmu
         ASlt1s+G1mftXO+qvNV/uSgdqmZp3hw9h5crrUSoYn8LwXrxcH3P/hVo1+TI5sQ3/Ojr
         VXzaqAb5flDySmFGdHhIPIbpFr0TmOZrMiMxFN5o9YXvpo7ivX0INqtr6lkL12Ci4aJb
         XrL0nI3Hk9n9vzojzjRoREd/3sr3VEPrukFlwY3p8Pq7yhv3RKKN8sHq/gfDUcofOtYJ
         XLnqUxLnPFbkZ0nDGmohuN1cSx+RWj07yrvctA4DenjrdeWHQdFschww7tkQpep1uPSq
         wWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946525; x=1769551325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9crKbumNaTveQ41rktS41EDfzqAitvWbjmLVxdNQRjQ=;
        b=VyD/EMc1YhCAMEB34q2yIA/1hs4hl20psU1GN9E00yyLj54ILItvur8c85L8yID09Q
         YUmI7wx/sIklUfKybQ5ovJwZQHiXO7ECzbwlXtf7JqcsXWyHMA9eNsRFBz1f3GMjd4ec
         z4I5C03hu/dRWU6DobtbAAns/LuVMD0gAH02M/jHuZCdONB3DAdCnKkfitLIE+D283WL
         0zzyEyss8CX5epuUtz8VVEhG2GIwoEtgU3ZDDjfhiUDfGmSiRH571UT/MmmxWARNih9U
         9RALaUu5Z28RbMGg1K0bY1cvBl0gmZTQj2WS2FlW96X6ZtZdGurDuUJJoC0yvNw9UlkR
         Z1zg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KUi13dqjl0a3VbltnjCdJyQze0R5kOQCDTQks8v+Cn8YK/EWmXnDFegll1oC5JaguSZE/c6YHfT2C6oc@vger.kernel.org
X-Gm-Message-State: AOJu0YylT6YPMsNQxnfwYGT7V+xG59rL9Duwh5EY0Pufn/KjpPRzXvSA
	1TZJtZxdSamT/rl21ri0TerdnELYR95fF34c8PLONgG92bxsXe7/9rvXVT8g9HEgVbAMAbEhGHP
	+rIerCJ6otX4AXWGjKwBAHH1PwG9gn4k3rrpBkAp7ziaALr6S17SEPy9QsUkVI15yCisp
X-Gm-Gg: AY/fxX5wyKPRDMw2GbwBBU2sHVbtbxdKs9GblRP3S+KW9DatuEhBT7kBRHzNT2EznbS
	rgZWpa6cJV0Sk2MRMUlhy8catpCeMsR9c8OYE2KlD6G//xmCAkhUYPsgOWtuNBk2kRHM5Sd6LER
	oH/MDZP7Nm/8NLKuRSHJX+KYRNtHIzX4pd1cjrZbmpLjal+WseJaq92OxIdbbhDSALzT52MM+y7
	EuCS0igEnNSEPDyPvb8cNB9QIWQH66PFzIojfIADNGQluzLROuGlKUrC9zWdCrTvWumXkWoAALM
	gQAUIUQiEni2kMTB0bBAh8acyHTrFuGotCn5WH+tuqzORA6iWrLH95qWQkHXHKpZ0Wc6C/w2xD4
	2qjlgixnhPFT2cUTPjT5d4+4jtB9MH0/oaKp+2PJM8fuYQVo0sDRJHYRpaIB+X8q1wDfcewB4dK
	vhU3Cy0pGLb6zxcb7V1nuyvVc=
X-Received: by 2002:a05:620a:4723:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c6cce3bafcmr409213285a.60.1768946524818;
        Tue, 20 Jan 2026 14:02:04 -0800 (PST)
X-Received: by 2002:a05:620a:4723:b0:8be:64e5:52ab with SMTP id af79cd13be357-8c6cce3bafcmr409207385a.60.1768946524180;
        Tue, 20 Jan 2026 14:02:04 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384bc471dsm40146081fa.0.2026.01.20.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 14:02:03 -0800 (PST)
Date: Wed, 21 Jan 2026 00:02:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        cros-qcom-dts-watchers@chromium.org,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sc7180: Add missing MDSS resets
Message-ID: <b7yt62rylzcu43bu4k7haj56xltyg7ejj6nfloinmiyjfg5h5e@hhh6ewrslff6>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
 <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-2-0b1b442156c3@oss.qualcomm.com>
X-Proofpoint-GUID: mjLKNlmh-e4zQRQShz_5VnWLV3vaFm0S
X-Proofpoint-ORIG-GUID: mjLKNlmh-e4zQRQShz_5VnWLV3vaFm0S
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=696ffb5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nZ5XTfsJM_D5RP7zCugA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE4MyBTYWx0ZWRfX+wJnLeL8haZq
 hIlZFG0GvYCNWtRIFeVvArMkt+/Ba29H4OoQHWw89cjXePivnxj1hbcmaKZ2LcW+9/uxpXRCO18
 tAI4V3MO4cToHvK4ZtrlSTwK2/Z4RyZ+zbuY4titlI6b8TWBCJPKgEZFQi09wnXEsBIOeuazIle
 oVY/G1HevVNfg2U90aCju9EXfkY6AJ7U2S5mfUDgqS7wdNX8ODAzGO18Nhwx7VWT7VSRvYj8RHu
 NtrrfsaVF4jz54M1qcYPZnB16hCMHMvSpdJmH5IslHjCVDD/+t1G3H3GnlsP6pB38KGc342ySsF
 9HqtfGMs7IgK9YSyFQv74x3gV0X4lKozj1jcxYMIy0xE9eo0IvEzEhyej8x/AvL83l+qeuVFGI8
 V0FEHxYR4hU0DDD7QCgrXxG6mxe1hwoJx8UxzqbgH8scO6zBjZ/nX2HYIccwjS7ozAMjurm7/Z/
 JE/C0OXI+ktnLFyUZmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200183
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89894-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	URIBL_MULTI_FAIL(0.00)[dfw.mirrors.kernel.org:server fail,oss.qualcomm.com:server fail,qualcomm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CFEF4D710
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 12:19:26PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The MDSS resets have so far been left undescribed. Fix that.
> 
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sc7180.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

