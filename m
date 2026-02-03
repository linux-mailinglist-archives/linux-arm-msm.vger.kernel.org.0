Return-Path: <linux-arm-msm+bounces-91669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH24HTfmgWl0LwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:12:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0BAD8DA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D36C3008987
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D6133D6CD;
	Tue,  3 Feb 2026 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jG7XWJ42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLQm2f3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7233E37B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120756; cv=none; b=W9BjtObxqo+KCwboE1CyxYz2GID259bmge0JrQviR/TYChOs5ASH2rIbxIYXRrzqQQ3iOFEcxK8LATV4a5XvfuioB23eh6XoMa0mg0+y7E+tTNprB7M1jIxt5TXrtbDToHFMTeZPh9okAm2smoJcr8OOz8l+rb079o4m8iuxHQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120756; c=relaxed/simple;
	bh=LptzFJUyjpykLlcey9VFL00nRZ573wuxgKxYMTMRdZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzAKHt5mZZOm+ZhwrAiHm1Tk4QUlgnjOkzdG1pp1UZRd663oCC3ZqH0P5GP7QsKqDePcDLqMspXnJeIXUYaIHWuI+k038c8GNin+f646GU0c8/b23k3+pHNgXBtIpjcG9v7AY6091tNJyZpKr0yt+mLJWSoPftO1i3dNa4DSVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jG7XWJ42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLQm2f3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136n0f12884466
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vx1+aGrw4+vH/imMb6fHNF9uGEkcIk4iAr7YXm2HhE=; b=jG7XWJ428mS4Paui
	AVuRZOsQZ1NH3qqSsZx6lppGrg9C3NspsYWjJuv2+PHmPMQeIyJj+DGusix2ouiv
	tHaeNpcdX3ExuUG1wGiDIrqy57MaC9kKkF6yRmKwq/XzN5VM/DDMf/cnN/MEKmGU
	9bSV96XM4b7LibLwLI9h9NJPuQtAMidiMF5S/8ibPIcTgnXW+CoDy7V3TjlcT2xY
	NWHDeo3MOAwlai1x25XMOBvTshUJD9DyGoJMiALyLO6UM35FDpzKVthGYg7D6DaM
	Ri+VQChyiOjI2G3THsOslwh4pSYfA6eG8qIqh5OLIvByt7xLZlbFJGW/sHTXElZf
	mMxQcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3m1e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:12:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8888ae5976aso16715226d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770120753; x=1770725553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Vx1+aGrw4+vH/imMb6fHNF9uGEkcIk4iAr7YXm2HhE=;
        b=KLQm2f3r8yJ4lzOi8SLvyp5owO/DGdRhXxym1pf6Gqoy4Vv4e20Rdouvjke3NoecVZ
         IrPBFMz8p+kGycj9dThma0mZWL2DkLisD6AI8Qd4MRoyNzsxIV4DAiw9P5mEipWGsQP1
         +nParv1bx6Vj/qu0dGi7mmxHNNI/d730PqAV5xG1oo8IJ13R9pya7xf3kdw382OM+h2l
         EOmzkm/msH4jKsNV85HexaXj+WUDQDTJM34VrsI+L52R1/3Y/J0BDYJ3PxSm7lRyNDgI
         kcQvQ3Y/psA26a+2Ja7Nkr3cSgDuwh1/62W6lepuepoX8fZLIjinMQA5XHuJqNL5CQu/
         0s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120753; x=1770725553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Vx1+aGrw4+vH/imMb6fHNF9uGEkcIk4iAr7YXm2HhE=;
        b=IcqLga93Go1QEzskkZL0BSpxsJTPC2zWzIQQBBrjTlOVh9/Qx/1HCZ1H4/1dSpn/s3
         t3wQsS7ZvVHV+9o2H4QPI8HfFgk+vkPu/obznKMVzDipFpxhQe5fxMmQgUZEnv1FckbQ
         8BAERisdmpCEtgOXvyLX3nEFWDnMBkBfrQ2cnNVuVg1q5LpGwrovr8W/rq/NgomihEv2
         67AvNJtsgHgrXUTyzcvT3y3gFM5X8ZOYf5bL3GYhQdRG0ebIi3td8V7p9GO7TkkquGo2
         W27dPBJQLluj1UMilbHFwKi5qXoXgnlxH3msG3B4GqbZ3+XldwhosOOmHA2w88Bq/5Jm
         gXLA==
X-Forwarded-Encrypted: i=1; AJvYcCU1C/X0nVkaoMJy+ytlEhANiFbGX20hL7OkhiRXIW5TrfVdHYkiXKeHK0KN+WRrqsSvbjCTbwCswgTnLD7j@vger.kernel.org
X-Gm-Message-State: AOJu0YyuKKnQZRZtMNAfKuNCMket/NiH3ZVMbxIwqGeNhBwuP30glUDO
	FxmaaLRQmU0T7BYko9istdWN99LKQbwM/p1IMFTZGTbLPEH0gWLs2F/EHamkLA/bwv9gJJp19S5
	ZxxPjVPFzmHyd6rfs78z/b6dhh1UhBm126w13pKdq7WbqmeYL9ZTyFt2nrUXzfzCrDc7o
X-Gm-Gg: AZuq6aJl58iU+QlIJ9Hl15RZ+Fmd9gLuQzH1XuNq6d3vlr/EStRjSHmYeCwP3aL4NfD
	3pkQ9vzO2+5a0DU4f0CysU0yEzKJaUPcT4pewYp0D07XfeId4DY0FxEi5Jw+QGCq6gedBIYkNSz
	WsdvgSrWPFcwSapRKA+XDcFobaMfu9xCr/cFGePUyJjEIga+uQ+NC6x7MJmOEtBVD7SaIxay4cQ
	6XfuUMQP72UbYmmU7XJ8ZzSpqBdvjl2xreBw70na2poGXngRmR1XHVSkH3PiAPsuhvebDYr96Yk
	K02u/bHWtnbDrPeovoI1PeZiYEVixnEAh3M5UZZJ6BEWH0GPUOG1urgmiBoSnMTa87u+Q6UM94l
	VaABDvF/kCk/DlDjvtyeY3+a4w+Ud8kKW8HIg2MC823vWiIjGx8D1l9hpoeAbF1wgLBQ=
X-Received: by 2002:a05:6214:810b:b0:894:7135:8fb3 with SMTP id 6a1803df08f44-894ea0b070bmr142778786d6.4.1770120753130;
        Tue, 03 Feb 2026 04:12:33 -0800 (PST)
X-Received: by 2002:a05:6214:810b:b0:894:7135:8fb3 with SMTP id 6a1803df08f44-894ea0b070bmr142778516d6.4.1770120752729;
        Tue, 03 Feb 2026 04:12:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b40efb01sm9177383a12.0.2026.02.03.04.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:12:32 -0800 (PST)
Message-ID: <044b1634-ee5c-4438-962b-cb535e35c135@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:12:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/13] soc: qcom: geni-se: Introduce helper API for
 resource initialization
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-4-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-4-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EZBZomh1BgpV8EFBAv2IOOG8KtSIJio5
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6981e632 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eLxjEvbIFn9X0h5zv8UA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: EZBZomh1BgpV8EFBAv2IOOG8KtSIJio5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NyBTYWx0ZWRfX5ZXMzRelOT/i
 Krz17OCJnu0LYb21sR/7YoZc0Ogdi4T8eoWVGJxkVM8F63PxlIztQTptWwbSs0LEvhUTKf8ZHRS
 fjgH12CQSrNZOyIlJ8gUEgDnsz7xcz+EykPeVbw5M4A4nx7E2s2/P1/tQ3mNZJ9kVJhmol3SA1S
 UMAL8hZdsOZjQzddpSRjMGbHueoL9pDMLLncioVbs/6lB69F6CiYiPKZowCCFNxmdK8HLVMoUs0
 vzWUW3+NhbhTsjH/4ByJibfMahQ4SUAwXCF9JxfV1blir8LPoRONf07B5z6LBCYnfjhj5wwyb4l
 4itEU1Wnrt6NLKnOpHQibzEhS2FcHdQ7bUtmn0XZm9oBB3CMKIrinOsZDrxxeusgYH5703cjoeY
 3zzHuxkoXrii1axxNqJ5Fg2qnKSOjjJc01LELHX5Ylb85MC2/X4HD5djl2mt9QIyFcNQYyzfm8N
 tDQtEpiC+6gDfWi4YKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91669-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A0BAD8DA1
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
> code for initializing shared resources such as clocks and interconnect
> paths.
> 
> Introduce a new helper API, geni_se_resources_init(), to centralize this
> initialization logic, improving modularity and simplifying the probe
> function.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

