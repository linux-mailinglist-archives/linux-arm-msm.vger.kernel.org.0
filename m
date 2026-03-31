Return-Path: <linux-arm-msm+bounces-101077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNGhCgjgy2m0MAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08E36B397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8885730C3E4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5455D305E10;
	Tue, 31 Mar 2026 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iskVCLRH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBueOl1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DFA3FE653
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968602; cv=none; b=NpQxnvhCGCfBwa+O0+5dJ+xWYepaZxfzCpBkmGtbM/BjoCbkg/DGT60Al1nHmt+nc0/K+61gqixVjFZ4jt0lgKQMOUvr7lJ1YZ6w8S6iVh4r77ziwKqZwfULPfWG5L37JqvtlXIrOzQTw5hUtPY/MIti5UTfXePk98HyhOLuh2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968602; c=relaxed/simple;
	bh=uQSh2cLd2Gm07T4EPeonWnywCZO7h0/ltQbAEHvPKYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g54kAj+4WW7CF+6skmXBweT0STZEjM1xh0Ejca/14bPXnMjihbiQQWh52nLuB/RHOGunwhyy8fiDW1CXHse5pz76zlsmK3A+UK8B0jsgDfgOg/c8F1OISwt/BEiDd652pR0ZbzLcUQv1SpECuiy3DMtrx4sF+H2ll8NfbTbNE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iskVCLRH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBueOl1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEMVN52762607
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIEgX6Sq7suOHGbniJetydJ4MMVyt7S+QbkGd84G4SU=; b=iskVCLRHhXt7pc3N
	5rCv9R3YA7iOdMg7439gZ4FECiFbyDX++HsfuSDSiei/dCyHKfYm5IYrfWyR3UAN
	IdG5wOA1xYCcCfwvZhqaOIzCrefF2YKXhi5KGLio+uaw944/FMhzcY/gHFgCWSb1
	gyMvGf+bB6VYXBEVuoKhK8tL2OtjaDHrMb4gY1f/5u5+TpZcKgnlwkIH71EuFVdG
	xM1RHVd45NkvM9wkh8AVqFxdoY7C/a/ASiJ9ZC07knNgvIfvJnUNZjwe7clYGKyh
	jZ39APfcVnriYhxibMBW3aczs59ZvmwizFA7BWJJstwLPpKUyTJw3Rb9pNkRh5ym
	8aYkkQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b931jk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:50:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50947db2e97so15765711cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774968599; x=1775573399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIEgX6Sq7suOHGbniJetydJ4MMVyt7S+QbkGd84G4SU=;
        b=OBueOl1CelXiKbz5zpu4qsloe5v6lco6X0T73Vya9t3KbVGyXFnIYxfL4I0Cm69iTe
         pFQKkz+DqYenOMf0pzQ/wuDMVoM2rkBR2csjrN2ubQYlgJAmcKv+9ArK2tiDNd6+ZLy4
         XeJpogM3LqnPtl/d1rcU15w9AlTuca6xj8NyzOr4QrINHlsp2viUHynqV1AEBmyWVxH0
         cal/ZVJIMBX3sLQ2h3jh8gsaDtJZupQaGfiD8hdDnoIwz3kdMAwSvoHTp+2d194SSO7e
         pOX+ZRqTQTWYZszMO3MjLBhhrJY42z3ApxGDpVig3JqANhZDjbrqonSEJJR3JWke3Ihf
         0tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968599; x=1775573399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIEgX6Sq7suOHGbniJetydJ4MMVyt7S+QbkGd84G4SU=;
        b=oPvuAw12BPH1YC4y+3M3RESjoqqUZnIo53KMmWUjaVLjiM6vvAsX2TRk5OS787mGou
         dOIpQs5wIw34WxFbrHSv5QEH8p7OJ43Mnd8YmVpQ1xRWI5SFZBc/ZjWCr31XNKHnD+yJ
         TfbZNyduZtwLDTjAsk65YYIVpR5XOIpZpqpZkAUNlMFNaAsK7Q0u9jeNlQ13cQwBvE9S
         TlUCFGCGUbG4g5vWAL5XiZmsldnWBGklM9qJRHvbqblPLCbR/yQlAwLK7grqP2ZnGA2S
         0oFhBpaDnUG4xYc8qf3eYhoVOpwaxPNPpAV6lEWHu9fc0WgT4fXxprZ+RRTJ9OowUYcn
         RWlQ==
X-Gm-Message-State: AOJu0Yyqybo0axNWxmZmc1LqHx4jaHHSYPwZv8Oub3HmD8QtL95nwczw
	xtexSiF5yywJjNFj+1nt0VIUYUr62b5QzP29dRWbGTg0UdT/xKNlVl7zMj4Vt2E4xlzjmjMyVY/
	8VNSq7SKSOtcooNWdS/VSjgRWj6QQaLoFOixJ/8wWfD5mI9Ehg3fUJeIBYV2ofjvjB1e6
X-Gm-Gg: ATEYQzyF5sCV9054jBT8UMwAabyMlKj5uGXvU7CMJOv3bTaODP78ptQHISr3GzFzsSC
	ia0fieGoZ25x5ZbV0rPu8pyIHOGMx+uPfEF8KPZLl+RdPu7SQiiyXm97fzo/D6bSOOhDFW5QCnc
	wl+XileVZiyjphQbEcPU13rO4rBnehgPcu9Jg6ar/c9BPYC8OkJPDA/MEn0FX8Q/aFWIoHA/wHv
	HDzQzjrtbOH6APb1rxs3Ivrfi/TE0Nw6qVnCfqtgRo5wmxwJE+/mLOp3hfRdQj3vsNlD+6GbMun
	7AUIlkk0Wtvg24GXomZ83U7kb+/GXKZLjWlff04xO1a4EumqSWITetwUE8IOqStwixQn4P9hgHG
	Bn76god8XTxsPg1qxHsgA58+p6GcaKwhdgZWyqArw7zjcitvRbHuL1dH/y3KWhwTPh4uyz1FYub
	vn204=
X-Received: by 2002:ac8:5fd3:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50ba381931bmr178437151cf.2.1774968599019;
        Tue, 31 Mar 2026 07:49:59 -0700 (PDT)
X-Received: by 2002:ac8:5fd3:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50ba381931bmr178436731cf.2.1774968598477;
        Tue, 31 Mar 2026 07:49:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b227393sm414235166b.63.2026.03.31.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 07:49:57 -0700 (PDT)
Message-ID: <e4cad76c-09ad-45e9-8725-ec156c121bb8@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 16:49:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] arm64: dts: qcom: eliza: Add display
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NCBTYWx0ZWRfXxOCu53MWu6W4
 amBWGGEyDgIMFuKDBn2l6GyKc1MY0qZf59+cPugU6TMhcbUWxHN/zUAxKZ4X1z4X+YjNfF6118W
 SCVSj2JURbZz9rzp1WQdvEpp89bVmqP4K/K6wAGkRnPVJaKepxaopMn6R/LnsKDH/ZBbHyFfFtk
 wen+l0hs6Z+4C68tBt6iORA/hihijj8Z+7GIzg360Y9cB/R+jQYynTbvWjRJ/8UfKavM5VUE16x
 J6sFDUaPPy45foSldlYvpx83Mq1YcXOx+uElHi5SuUK5vxeonO0xVCQctZx7hWB1sHP20jJl5oC
 ieHGA+KF8i/2JaezfBJGJWf/D1ZPkTqjQDXf4bJ+pN/xPkZeLawA2mKDY8xt8QteQugYIHGqhQe
 PTsZq/NCUbffxvNkS8lRy47HQaGrZaq+LkvW2Qb8BbhxobyA/wXo4BtZmkSlEcsOCLUQY4c7p5T
 +A0+EPaL7hZbHLWxcig==
X-Proofpoint-ORIG-GUID: PXJc9TAFqxnS69IYGxC6aWcifbUJhctF
X-Proofpoint-GUID: PXJc9TAFqxnS69IYGxC6aWcifbUJhctF
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cbdf18 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NCrPhelpScx7X8brxEwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101077-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF08E36B397
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 4:02 PM, Krzysztof Kozlowski wrote:
> Dependency
> ==========
> Depends on USB patches, which are being reviewed, therefore marking it
> as RFC as it cannot be applied.
> https://lore.kernel.org/all/20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com/
> 
> Unmerged bindings used here
> ===========================
> dispcc: https://lore.kernel.org/all/20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com/
> (DRM MDSS bindings were applied)
> 
> Description
> ===========
> I did not enable DisplayPort because it does not work on my board and I
> don't know why. I double checked QMP combo phy and other bits, and
> everything is looking fine, but still no USB display, so maybe I miss
> some other dependencies as this is early upstream.

What was the furthest that you got? We can certainly try to help..

Got USB Type-C mode mux events?
PHY initialized and configured to 2/4-lane DP mode?
Are the AUX transfers failling?

Konrad

