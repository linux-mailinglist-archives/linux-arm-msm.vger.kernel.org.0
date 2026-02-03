Return-Path: <linux-arm-msm+bounces-91630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNEIGDm8gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:13:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF4D6A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5BE83085619
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E09396B96;
	Tue,  3 Feb 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtfecnF7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E41Iw5bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F991396B6E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109759; cv=none; b=L57bOCTptVx6HqEcQqFZOe32yB3R+JTc+kvsTCCtnLF3uAtu2xsujRcbJIhWLKKRKq7LsCH4hC4j37FfWedLJwBz5U0swQk8tKJkkQd3zq2iqHnSi8nTxRJw0tbZywaIHpF16hT0iLma0Ikf4J/qzw3oOkDa//0kTrQc/WQmmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109759; c=relaxed/simple;
	bh=RbnNXqqnHRQty5lgihCl7aAK8zsm6/eeHNN3+SXXnnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWt7eA/lLKYoi7A5BxW+F2Z/BKj0IW6O9Z6aUyCpvYPYjt9PsSMUAj5P28gFrJ7aqtSIsnfjUJQQBYFSPSEF5CMYN+uUJJykEGSjeqP4ZET8m4In604O90cqJWSeQdOQZ6DflRboHaevA71b0dO37ArBx0MILIwgMg7ISp+ILrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtfecnF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E41Iw5bl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136CTUB3916015
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=; b=XtfecnF7b6lSPT1m
	Al4z+2S+cRWod1cTVYfLGdrIi3mjdNBnLxfJhRTY7xyoog38AUtwFfVCS4lTvzNQ
	v1Vxn9XbKF+jjOIBgGfoP4q/v8egm+tBWW+5cEPi6qexdpYczhnudkmF1NMH1Wyv
	WeejUw431yxYLAL3wPOCSPD0qForMCau2vwDCx4Y9XB3jJ7jXqmvFU8SSYwnwOQi
	5xCX5eDmgXk5EDhFoKVgVm4+knF4DfFdafZsSGEf93M9iAipt2QLnRDmw7+rq0ea
	KUmIYp5BBiiJs2zhwnjrq5DH7glBfj5zfCWiFNWoQFT+PKx5RT9GH52TAYjVSiiA
	sfJezQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmkqa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:09:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88882c9b4d0so13327846d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109757; x=1770714557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=;
        b=E41Iw5blKcVYy2/xAiUDtgNY7ErBkza9vbw9Ryo7c9H1omDNk6+ZXLnUTr+FZTVGet
         fgFjClReIS25wps3jR77g4GjPNijTA4u3f0TEAyT1NovpoUe6iembt1eBkKHTwURPQhD
         3qslBFG7gAcOgkJHWUMX5O2R44R86aI0Zd+/DgZzop+n2SCfQVFFjenGGnLAVsR0eXFu
         48+GwSfFAAx1Qxhq1ygHlxTXHBe1i46Djw0BsmZEPh/4xK7jKwFmizXkgjaisCmNbhMx
         wI8roNwDxRMMk/Z50R0rDCOyPZJn1GVMA2isg/4L8a+Ocoo3b/djUwF3zcRaxEp0RPQS
         pevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109757; x=1770714557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=128vGHTQSDAOeGqPmCzaWsYzKlabB8tkqK5y6Wcp4Nw=;
        b=a1DgraeaYCR+oTkThAH4JOxowrpkXmALTCu8JR0/+keriAALd75DNPENTRjMe8flkB
         c1bn4GHn8RqIFLqCbdXrLAJP61YfLzvSxwSEFzaxja0fkIxbn7k/y1xqZ6yTbolcmJlE
         5LBQrRjlG+kMLTwm+AVug7uzhqCzZw0m92ipLv1RX0TGzs9/1RuU+cNcQDV4KRWgkf+Q
         LqrFRPlb0F61HWXpSwpv0eiq09wTnewig01lB5qp5nOJ0vYiIfPBO5SbB/tr7ep0X39c
         MBZniDOwb9/82cHqRdtGkUc4RYl3zsfB0pS9dHhsmGNBsv4bXvn4ubTHL2JiOFgdLU9r
         T8VQ==
X-Gm-Message-State: AOJu0YwlFgb7wtUdEao/3q8ieGY/o47yiZbq5KbmNiB4mXK3Q/9f9xQo
	Mqi29I+b9bDCoOue1/6+9J4OTZ0U9wJAHW2QR1Sb+uNHuLeE/sDd/ji6apoz4/UC3IzAI1SbhT4
	QCXKcApycL/Y16W+DZ2BM/eYwvxq0YWrTpNbCDyaSKi9Z2C6modpCgK8l/q5iNU+3vtoO
X-Gm-Gg: AZuq6aJy18JASyWFJhzRkIe9yAQsrGnPp4HsU/zqcmTWgNPnYKgkxpDxif4LAcub0iL
	We6U+HDA66v4Y3d+NPucPectRRXy016l4AXXtDSgcWTCEEQwPe/ck5JLvHucibAx8pR4p2IxfZi
	85/yVCt8+vIPP932glMiTpsRfiXokKh25RVP3X1/qNuMB6wPH7PC55pZxg8UKq58XxbPpmVUoji
	XSUSckpRdqbevuIgQfBdMSIz4pycl1Qa2493fJv39Go8noiCTKRhTR7QqCf4nIe30qW/VP+KBg3
	dLeKYLZUdwEByOH06o4YQURsDw5p9Fd4fYaloAGZ6bcU0RvIhDzOx24pTYGCSpfV8hyEAUepTTA
	B2CGArS7FlU4x3GcFJBKirDeQKg5m6Is8OBBH8AoZb5J5WSATE4Q2H67aSBM9gD8/Xz8=
X-Received: by 2002:a05:6214:808f:b0:894:e24e:5b8c with SMTP id 6a1803df08f44-894ea02a720mr145594306d6.3.1770109756606;
        Tue, 03 Feb 2026 01:09:16 -0800 (PST)
X-Received: by 2002:a05:6214:808f:b0:894:e24e:5b8c with SMTP id 6a1803df08f44-894ea02a720mr145593966d6.3.1770109756225;
        Tue, 03 Feb 2026 01:09:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d0asm9195354a12.18.2026.02.03.01.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:09:15 -0800 (PST)
Message-ID: <6bce3bc1-6833-4701-b8d9-7205cb769a4f@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:09:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981bb3d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=K8E2y3tpqAm5I2OsxKoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: Xn_UWdHfMTEWsIXXUwZH0oOiOjLr8Gv9
X-Proofpoint-ORIG-GUID: Xn_UWdHfMTEWsIXXUwZH0oOiOjLr8Gv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MiBTYWx0ZWRfX02q+DZsY7qZi
 930L+PROqItk7WnsoyvOS5YA2rnVepOE3biV1MbEBx7rXXGcqelLpS51dFhGE5aW0ukC/G5XmDU
 FyWHtLag1x/73NW7e+QRQAr3WVlgPx01wRJgp1uzXPlVUfkeRT5GsaNScnvQsQS8sDVJ+OrwAz9
 28EidvBGD/NldER+eKBEAFI9o4M6gCuXK9lkeHONktd5t599elg6Tnudxeid1EvqjemrBoBmp5y
 wiOr6p1xivocIf3LMeGxnXR7ymZBW7RnXSir4JaQLhhGAmDEkeF9Xdubl9IqtH10PL6OyiWQcJ7
 pFEhOc+lh+ZKZQWCRgpWBe6ci5/kL5B2HTi6mSXPWO8xIdNIDePqRaNgxJx3X8WatvGqg4licBz
 AZAhs3Y/8W+AhMLNe3qNivs35QlrxKqOIGWaEPKrdYyGpwTNIdaj+N1AC23EYw8z6Rv1td9FPs4
 JX+bbiLHoHJ87hMdspg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91630-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01CF4D6A42
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but,
> strangely enough, using MMCX voltage levels.
> 
> Add MMCX domain together with the (more correct) MX OPP levels.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I noticed that the subject lacks an '8250'

Konrad

