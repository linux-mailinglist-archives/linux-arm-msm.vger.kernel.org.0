Return-Path: <linux-arm-msm+bounces-91491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCdGGSmFgGnE8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:06:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D89CB75D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 12:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEAA23018D5F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 11:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF23535DD09;
	Mon,  2 Feb 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/13cqsk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCqyAefz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0E35D60D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770030021; cv=none; b=bw8eQlzXstTLsjiuPwxrVF3cB9XC0QJkuva8lS2sajxlkOSdAhllbT4YofWkZ8Lr7sexhXc2ZgfoU26sF8KQM5XQ0vGni9XYW0TDZPn0DRw/u0gwz/NbTYwA79fx90y5uhu//WsumPvVhux9pjn1Kg9/QJOPLF3C7Enfk/23zhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770030021; c=relaxed/simple;
	bh=rDNg3RNfurGN1Z6oV8ZAzB/LQiPiwhWEOlLHnxUvaWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NtQIOsxRKpvLDz46tRdbLtKuPXHahWaWv2GuN10o72QY+gxhpQRBILoJ//C5O0H/g3vIQi9lK6WggXKHQxeTciIDMwZB+7ScV8t8K/evP1pxk6zvwyF+m9NO2JgQ2hmUvEkd1E58y6MVgH1ISQE+nqz6rIEYxWYGcKimMrqzocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/13cqsk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCqyAefz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127fgOP1189735
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 11:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8nl8n8+hpRgD4+NstSwXyU0r/XY4eYaf9Gky0MTgSo=; b=U/13cqsk+FJXMZac
	3hyJSrD3uiPA5kCpemopxx6Gz28WT49/Cra4/b37224uczGNuEYeKdFnF7NxEZmE
	HDVAlmSBDC4D7xaYbHmBpByep3jHWdzVk1FE8KtjFp5ilJNyUodZPUmjmhRqINqy
	rSRxE6HxxGPEDc7PIQrp25dNez2SYniJbavSmuAwMjOKJG3h0bIzp0ck29BSzKth
	HRNb+wfS1zLjO15MsehX8XKdrw7OrjJ/Ax8vRKO9Z00izkm3hEpbBKXLlijC7kRQ
	3qzA/5o62f9n8L7JUK7fj1WRdOGJn3qgHBxq08KaqOYpKYCK6mgXgrM6GhWXGAMT
	eVKvQw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw6t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 11:00:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946c23cf90so17515286d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 03:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770030017; x=1770634817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8nl8n8+hpRgD4+NstSwXyU0r/XY4eYaf9Gky0MTgSo=;
        b=RCqyAefzF9bnizjo1KJnhyaGrRipK/nxWuVKSOgco5VcI6lScfP3x+AALdgunM8PyS
         +26rmQM+H7CSNeKD9D1j7bFgYVtQq0U6PmbGN4dVwyD+bphICxUFdMq/3WfAzz3GkVjW
         jvnRBaCPlWnM7yYmendnxlcerp2VBlh5TTWE/0a52kvvphKnjH/bizlAMcCSbEc07/C6
         VtP/qRO7EKTJyslHxinN6uQVLKvo1n7omQwopgmItO8+y0sK8KlOG8BAuRVj1YrO22II
         MFiQ/RAMfkaic0MFz9JcaR4lyJsCYj8zjjywBMSsOa64aMRat3FMfrsoNSx5KgBhhJz3
         gfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030017; x=1770634817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8nl8n8+hpRgD4+NstSwXyU0r/XY4eYaf9Gky0MTgSo=;
        b=jPmCkgqANqp6LtWo4VXAoIzGgkYSHqMXRFPnXppdnzgom6ZzRzKlDlH+pdyG7uA6bq
         WFwuV/pcLFCDRkn8x/+B7FoRGpZbmFdegtcTbzAFjqgBg3dV/S2M961UTlt7Ogfa88lD
         I/pSZNS3+ycxChuASLSzICuJJQc9V3Yt0Mdl3sePyF+T0SKPAvRukGdDZLkFduICDjG4
         XsCyl48HVyxa5IFRQgElDLF+mU2EU99sOiKDtnGLp3+rbZcbZFMkOt0x47l+XDcDfgUb
         NXPkoxWpOjD2QntbgXtHyAhoMyIFq2rSU8+aiUXfVO2xnNZeZYw+GmScCHcN6aQdNX5x
         ff+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW80ZWdaOm6qVgG1ldxjdoa9UOqEwG9CfjwiZHts9pOm9l8Ppxn0CF5CBwB6rujQVFPfh/aAw4RaKuyox+a@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdNrUecmcZdUIKQOYE2pqa/pkfjJYHN2nrgje6iTKQfUX67M6
	5quTuKottRUOITZA/XdXeq9EyQFHWRq/eRxxko+86lnYyeSatbnpJZ9a3eg1npR/PnC2by8xWhD
	V3/v96FwH6U8EvrA74TiucX1/IiuYy2l19Wg8x3xehxBKcwUOA1XWM6KG0eN7jSH545jf
X-Gm-Gg: AZuq6aKK+n/hbgcW/uDvTq3ucT28gVM5cltMvhdEIqgymH+kGYmqNYsEFQlnFFtCtMi
	On9f2XrsXk2wFZhLC4njR3yyDp4mxrAbBr0TLDU3tWSKING8b2zo6TCI4nSrD4cdapT72CuYyIe
	PN4bOoitHEg3HE8xGC/08GauwfenWdbiZjGOFSnRbDTTjyYB8lXTnSmv/eNw1PEBUBkEPPgEgoe
	GrnDpEZrKciGwaWWEjkQOZ6M5Tz5AJ8qyTm0QR0f3CGSiHbVo7NMzTJDLGPoxN3+CsuZ6odZg7r
	zQN1JeKzDh1Ot51QmOq6KJemDBR9zBM8Jju1oMnxYoF43gFrr1Yhkxu++QHKxq+txQwpvdfhipN
	iqDQ+WhG4pO8caTM0QDMcdRWsZpl7qkZYDOy9mY0XvUS3eNf23Kc6bUKlUAReB8CniIU=
X-Received: by 2002:a05:6214:8009:b0:894:e086:e4bc with SMTP id 6a1803df08f44-894ea12bc69mr114324436d6.6.1770030017353;
        Mon, 02 Feb 2026 03:00:17 -0800 (PST)
X-Received: by 2002:a05:6214:8009:b0:894:e086:e4bc with SMTP id 6a1803df08f44-894ea12bc69mr114323166d6.6.1770030015295;
        Mon, 02 Feb 2026 03:00:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46abb3esm7641208a12.32.2026.02.02.03.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:00:13 -0800 (PST)
Message-ID: <57c2b126-2620-4fc6-87eb-31b4f8299dfd@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 12:00:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: qcom: videocc-glymur: Add video clock
 controller driver for Glymur
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202-glymur_videocc-v2-4-8f7d8b4d8edd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=698083c2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 5Chtpq635M5OQBymFlRF10ft-fQX6L2q
X-Proofpoint-ORIG-GUID: 5Chtpq635M5OQBymFlRF10ft-fQX6L2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfXztTDxlxGAbqw
 jwEj6JPdKPlPqZwEKH+/uza7cB7NLPudyG8mafaTmecH7v/9cUKi7r1K7YBqZjifpbhaYR81dlB
 UsVLAHowkPWEEXymKqIRGlbTs8M9MwQQJ96hV5rXsYW7ZYLpfAuzS1Smg/Oexs7K5V0INbJxxK6
 tA0dh3881rBq9/yRghRAzcsoedH2BveeUJ36/zXlMQRgea2+Uq4gqXMGxcdPSjSmd7CPY97om6L
 +Te0aLwQ5ytc3GcpeiCQ0rA4gP+33G72kBUhWRLZjA53p2jbjybypzahRh6qpwt+Oab6kdO8vTu
 BMaup4nXK+isuH7juk40SvPIYHYnViize9R/v0pKokWKb/zkx3TbdRSdQvDvpj9PZl1QZjfuSn2
 Kf6qLy4RAt3q5vOtjEnmvFwZ2tWFoTaQWJ/bxp882Nptp4IdrnUP1bjHsLeyhp/mG63IjgZpN5s
 CCvNqoaYeDaqTCm2dkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088
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
	TAGGED_FROM(0.00)[bounces-91491-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05D89CB75D
X-Rspamd-Action: no action

On 2/2/26 11:56 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Glymur platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

