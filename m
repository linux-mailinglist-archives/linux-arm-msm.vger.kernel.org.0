Return-Path: <linux-arm-msm+bounces-100973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FmwA8eKy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:50:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 186443666D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 482343001CFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756C028DC4;
	Tue, 31 Mar 2026 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chtD5zRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMP1ns45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3F3BE649
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946297; cv=none; b=n/7vmwoH1hYqh+jioyBKtIiHE68aYOXQuVOj7SwvpjCbTjwUKOh3TyD/8oLpILtjsuG+jWc3WLnCg8FTMzfhGTRL/yyhWzYsRfITZKcAL4GkFyvevFmOJs5FDOnXdQI2WMgwHDfrTQjSBL/Hp72+mrbjGESA+iukBXaGe4IwMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946297; c=relaxed/simple;
	bh=1epn3NNU1vhd60UD1evNtQYmh+2DPzyxsy+mv4iH1Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=csZ+BGasY1uHoHaxLJhLtCfAACyAiceNgEr6wvkFIk24A6EpfVtJ7HfUlqPE17hjjIsmWKV+22UgAX98K7BPR2zErLGb8X8j4VVOM5sxgk836yKD0hgi2h0/AzAtc+AltkiVClfmam1jPlU7dHtnf2buR5FdUmO28XWzRtq1FJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chtD5zRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMP1ns45; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V5Xcau1842632
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOgnzemfCyTApJGzFBsiPBJ1EfCJ5UuKses1fAbptrc=; b=chtD5zRR62hZ35zS
	cGCu9QLd5aQknNRs7wTRWNQMmzowtk1jKglCOlKmCXQ5VbTuFpMmKxeW9xMZo88/
	e34c9V8dZEIV7dUgf4ZH+mIA9J0K+4kMi43iy+1ZjOfevYd6hrh+WW2gVTFrPvpK
	YvJwnS7P9iPFTpdZjSA9M0IjxA7Kr05XKmHqSSMTd0LdNocVSSNzkC8+DLrwbuMq
	487ALjWaACDrAjldJnc4yVcHM6In5E9E6vp019wNNk0dM6dIbNJdLPO9PGE+JG5U
	A62HSgDmvQM//WQZ9Ld6CvsT8budf2DaLgMTxY3s+0s7ipx4bMtzlinawNSIewH2
	ZkDDJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsj5j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:38:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8dc8b434so161419385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774946294; x=1775551094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AOgnzemfCyTApJGzFBsiPBJ1EfCJ5UuKses1fAbptrc=;
        b=aMP1ns454cd6aqPbmOKVvIh3k7GU0/KRCvY+6ijU/BK9kIRefenPVORswdQNYGuRtU
         QbKzI0WC1U1q+4823+jEMltUBvmQ1W2KG7uoDZLgcCnv7/ApAcUgMeh8mwhAKwwphvp/
         ddiivbwCDZoLb82SzKlAnyzg5oQOBxBufYhHrxin8SBq+zvKM7rDMiXPzaWa32GwwawF
         kh0PXIcqpmqbk8xuo/BZ1xRtIZu3gGaT90gjUPhM9Z1HD9rXyWdBL0flf8luaeogeWOV
         aC9M3v1ZPOKv7QWO5D/fvT3kex5KjhmNtX7ezwXTlDLNNegcX0PoymnuCVRwaWwoolFX
         WYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946294; x=1775551094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AOgnzemfCyTApJGzFBsiPBJ1EfCJ5UuKses1fAbptrc=;
        b=T2FbRXGsRb/v/vjIW2A4Y0h93nWhh3JDozWOSEoyxIZI1QuIyOukkcnsy4vYsVHs9X
         fVBPqZ38Hk6r5+NPkPGWbJmeLp1OjyKjs0FItkIYYn/uSm36yxcQ7InUR6u408E4Ze9M
         tCFRrPTCdFUyA2Ey2oNbYrrglLvVV12wttBzhviavgv10QagTraJsNDQoVzQ3GM7P2IC
         OWPJfgn9KakRW430RoXLVd/0bJGlpIZTW2CwsMJtDqjx6fpdZNU8Utv57uzzd2arVRr7
         l6e1ucJiPWnTHay8qApoQsgPR59u9S7Ox3MUbs6yZlmutUoJqmib/hPBLP7shU7+k6ux
         L32w==
X-Forwarded-Encrypted: i=1; AJvYcCWzCgkirGgre8zj7czzxWUcVkHtkNZwF9nffvmU2DNTzWP4fDxauMcQwcvSB29QWiXV3qfYz4H3QpxJrIFS@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvKn+MU0bMskI9iTNmkH7/IDhUv8UxhwHm+hFghQZyUdQm8q8
	KZ5qlwGIEBW2Vc8f21RTyZxWPORX6TE5wHkHU7uruLlCvzTZeNVhMWSbV22Mi0pllWpDXWXEq82
	oI5hh1JbFLSAT4KKPa01Jot+M4L55bG9FPXCnonhYbKCdNiPI+3xlPjxMKusPJI99I4Za
X-Gm-Gg: ATEYQzxnLzoD5E7nnJeljSPHtx4ECoUAA/OiPvg7RnWm4ZOE+5yh1w/GqovMhOV9SdP
	TVuMRnxZFmdv4eBbdzkp7xtJRQlckBOfKZSmhS74nnEdk1pHzpjuyZkCBHgDKXZkksau8Hi3OP3
	uoRaumeHGZXIygKiHSrVgSsUm6/2ZUBwdLhoDIfW3dMjSkYOCvv96r7CLHkUTU4pkpYcBxX8FsT
	LQM9zvfQy+XWM75HnZaRaiN2fcc3ymG1DoBj/W0Zw+WUqg1jkh7lbIo+wT55E4KAxhelrPiZynR
	2v5/bel9Pb0w0+I9dKgqTfaxeT/RnNsJUMc7r2eacOWILxL4WfHPgD3gS6EeoxU6tucn6VLdsLe
	a22GpDklYLYwJRwRq/Ptg8SvGwG0wjBmDmQSD44yGrKVwBxPOa4na8HTEHsmqFIrK+Uek51E+Gh
	wQ/Xk=
X-Received: by 2002:a05:620a:2911:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d01c5b666bmr1470463985a.1.1774946294256;
        Tue, 31 Mar 2026 01:38:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:8cf:df8b:1e6b with SMTP id af79cd13be357-8d01c5b666bmr1470462085a.1.1774946293831;
        Tue, 31 Mar 2026 01:38:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76078a8bsm3305698a12.20.2026.03.31.01.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:38:13 -0700 (PDT)
Message-ID: <1cbaf52b-f978-4892-87bf-fe5d78a966c5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:38:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330164707.87441-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0VuvQQe_CCdEkpcBYi_FRHOOc42tNpX8
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb87f6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=ezCydkNMFyUEMr7ESdIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0VuvQQe_CCdEkpcBYi_FRHOOc42tNpX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4MSBTYWx0ZWRfXyqvHjWoQVAtJ
 s71+h2IQmuhaJ6Kh+CXCGuXm/W7zrWpSQQocHvk60/68P0SsGv/KSOi8d/QCW4+muDXd2OisiRd
 IYe5jIB6sfw/fuNk7M6yj7fkeXF1oXq8sHHfGZTIAKuc6QgyuCMpescVOZU5+vFuSBO8tEk53sH
 WUpq6iwdJW/v42gn6WTWNe59fBcdxhXE3tPInHwR7qffIEeX5jU3kjy1YdPYi6SREWet1hXrYIP
 2dhu3wxIj6MlH4bvdOMCssl9OJvzuDVihwFg6j67X9yNgi6Q8+f7hV1aaghGF8OTOwnJjkRzIPk
 rpJJmmlnSEV5ypEg357AEwFz8pFmgpQqiyHM1qlny1slnfsMCIdfbr18W/tDegwymHKLFGbXpn4
 9cqMFeJqJk7CrNX1eIZc2RgdFRPMt/+kTv4u3GbC/VbtctdAckztvOA6LBiHnaLfEaO0O9jfKOU
 2B8nqt48YIohYoRIrsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100973-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 186443666D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 6:47 PM, Richard Acayan wrote:
> The Snapdragon 670 has a separate TLMM for audio pins. Add the device
> node for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

