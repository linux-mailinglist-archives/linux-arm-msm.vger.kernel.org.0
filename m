Return-Path: <linux-arm-msm+bounces-75380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DABA5ED2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 14:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 415F04C0981
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 12:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84812E0B69;
	Sat, 27 Sep 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLhee7PG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC502BE7D0
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975708; cv=none; b=FkubznyJOAJNcvIdBHnAipDqHZqksGtAXD4o0eSd+T5FfO4BMQ6gafvicDx/qV59EYODDAgMoH3GOQm5YvqL4CS1GujHqPFnyvgt0uH/VqyVeBPiQmc0hqZ6aGgGGCKE/p0cd38aDAvX3JjZzwOvt+auix51C4/ekO4sLF7/ID4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975708; c=relaxed/simple;
	bh=qnNDCbMI32av29tRnaF3im4PUYnDi6Fg6B8QmcqH+K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLKSgiQ5ChInGgqDoxL6FQGbnqNzj+48XapDExalTYSOn73vGUDAVapB8S3nrhoHk81umcn1xt+LgA03cwjbEZLY0iVybSt0UkOmSmJwMswrFgIh8AyU8uv6YuDcBG7DFaHLn80L6yCbDMA5EF09LzTB0m+lClSTj02S54KBMzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLhee7PG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R3ZBp2025535
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xro+e+2dn97miI0U2SXZbX47C9NAolNE135GXXYJKfo=; b=NLhee7PGJLZB5Fnn
	vFbygERstPkTv8KGfyCLPxbaV7yvjOfeJ1btIaJZmBCw5CVuaPGi6Sr3dgvg066v
	xu2i0joxVOdaiTagRby45JldGWu8zuRdWPXINGNbJYOxGnG+ik2jt5rocnqGqko6
	vpyvk1X4Zv5d/t3aY088M0EFBsE4XCY50j/gEESA2g3QUlL62e7YR9+8JzAeNtqY
	o4hN/lTrqusbWij6yZbufRNtSXGxwHLokgOTZCAAaT9o7QhExkwML1l+pL9vXrch
	qqWWIoAHRE5PGA06dkbZFSCFWaCR7NqDp2He+F1L7kw6nbY1RctmIMTVKLVYKuaE
	B82hhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8518qa4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:21:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-82b15c1dca8so114639985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 05:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975702; x=1759580502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xro+e+2dn97miI0U2SXZbX47C9NAolNE135GXXYJKfo=;
        b=G7e1oImvcAubsdfLSRic6YcC/br61VGpK7Eb6oizr69HOyAwqmLpeO83kMKvEyIje5
         FxilG2O0r/yYgA/LrSK2O8+cOd5xeHJpSrbmAWC/I9DxS/bFeg+KC6vNas1EtEUq7t82
         rio4TTsebVN87PWWIclJ93SODE3d5U+NtId4f4a8pOw/q3MDHeYYG3uFoVEmeR+Vans4
         qkH4ItRUXVbeQa0YKIlyEN7jHGwj1WX8Q0lQ+DVi1hClRpqxc1VWXgVMY0fldOgbez3d
         myiO0MfHSQGOUyQ5pdlyPcLuS3O4qib7xeVI0yi1DbaGHchLMyPJmH3HjLTL4al4yQ/3
         NwGQ==
X-Gm-Message-State: AOJu0YzonNkNnEeO6uP3Oa4KuER9+KQn6S8bWEjmRsBdCrmWGq4JR74X
	wGAdcUVcOflhkzBYrEX05JVbOvCRzQfA4VZHMnRKW/HArs3doR+dn6K0JpxsJL5j+KtKh2/qDoc
	IivbWz9hv4yE3n6uBQRi+3QWChWupdHpQK5xpCRERcSocV2YoiDxKmrldfoXfX2DB8Lgc
X-Gm-Gg: ASbGncvlCNpiTpBIpN7sdbrLMBZW8gcb8VVXUBHdj489g5Uk6FfOx9JyWMxEU/OtFpN
	0N5KfRtbRORUAfQlLePdNriP4tydCJYdYzG0oKDq5XmBRF1+VArwX8zXsYf3t1TCBvz3pS2/nwN
	8NYVRjmxLG9hxwHtzaJhuFy588GHRtFcLlYk9UOFbiKtXLV/PxIy1fI4MMWQawb/ljBijWo7BSJ
	/bKAdcjqx1hs+mHK5uI61iB5AgOvL6oQqeY0WZp205F1qyV0GGSGKL6l4iBLj5SKy1TedT4C8rr
	c+C6dAfYHk3rIP2Ck1zBEw+mNgyTCSRYlIjo0zQFFBR+rRCIzAjYfSwbg6J7g982FphaqQFnZ+1
	1q7rBr9BEcQ2N949iOYXcHQ==
X-Received: by 2002:a05:620a:25d0:b0:829:9017:82b6 with SMTP id af79cd13be357-85ae6d8219dmr883817585a.8.1758975701589;
        Sat, 27 Sep 2025 05:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/XBV6tFVH7HzwL1SHOVi3TU/smws27aZNO1x1ZV5OkS2elqGSSNvmTbLL3DS1Bk2Bf/mvlw==
X-Received: by 2002:a05:620a:25d0:b0:829:9017:82b6 with SMTP id af79cd13be357-85ae6d8219dmr883814785a.8.1758975701006;
        Sat, 27 Sep 2025 05:21:41 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d0526sm548975366b.12.2025.09.27.05.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 05:21:40 -0700 (PDT)
Message-ID: <656173d1-b739-4f39-8e33-9c5af657825a@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 14:21:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook
 A14's displays
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
 <20250926-zenbook-improvements-v2-2-c0b512ab6b57@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-zenbook-improvements-v2-2-c0b512ab6b57@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68d7d6d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=gxl3bz0cAAAA:8
 a=EUspDBNiAAAA:8 a=KT6dqS1snKeT78_s1OIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=vUPM0Wvl0xcrLs4nqPIT:22 a=kiRiLd-pWN9FGgpmzFdl:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX8Aq5fKUEhyb5
 ayuo6iUZ5Z1kIdiIlkMApPRC2G5HZP9ndJ7QKBIkvqX/2RzswR9TEnYRS9Ru0S3FiYYxfxBa6Rp
 WyAPXwdCWyJSfM8TctKJ++WVmh1biYRzbRuDjJPK3Qci6Ih/8BPkPYe9qU+tQdnnH7iIEzFkRcg
 O7aP1qSxWjqTYP2EIjmvP6ByNkWg82RK1Y/LqJFzT9FmBQS5L2O+yjhhA0cgSnAE2f78at7dA65
 BKNyZDHbB7PuiJbLAPFS0tZPpnyij38odgpSgIUKH2/nUS+JqEV6Q/MYztwgai664b0DoSNyjcj
 7DWw9R2XddfS93T2BjHNrUZmWi0avdJT7UQMa6jWIms5+fhzJYnXgZBV/pKvuVJ9y3GSdVPLYEe
 tamaAiX+16E4/eU7oSL5Yv9qsZjexA==
X-Proofpoint-ORIG-GUID: JgCqRIjuvIcnFVsUmdrlvidmypMKjb2J
X-Proofpoint-GUID: JgCqRIjuvIcnFVsUmdrlvidmypMKjb2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-27_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On 9/26/25 9:08 AM, Aleksandrs Vinarskis wrote:
> The laptop comes in two variants:
> 
> * UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
> * UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels
> 
> Even though all three panels work with "edp-panel", unfortunately the
> brightness adjustmenet of LCD panel is PWM based, requiring a dedicated
> device-tree. Convert "x1p42100-asus-zenbook-a14.dts" into ".dtsi" to
> allow for this split, introduce new LCD variant. Leave current variant
> without postfix and with the unchanged model name, as some distros
> (eg. Ubuntu) rely on this for automatic device-tree detection during
> kernel installation/upgrade.
> 
> As dedicated device-tree is required, update compatibles of OLED
> variants to correct ones. Keep "edp-panel" as fallback, since it is
> enough to make the panels work.
> 
> While at it moving .dts, .dtsi around, drop 'model' from the top level
> x1-asus-zenbook-a14.dtsi as well.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> Co-developed-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

