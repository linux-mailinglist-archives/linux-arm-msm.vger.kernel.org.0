Return-Path: <linux-arm-msm+bounces-82875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39247C7A396
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id E68B52E093
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E204E2773F7;
	Fri, 21 Nov 2025 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1DsrRMx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xon5N7sj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C634F27E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735896; cv=none; b=X9Z+SQksSW0vUaqj8MEUwY5eraWR3XS6iUElDfoztNDEdQSBoxaEEF+xj8OlURc62YU10gnoajUsuwFuJs/lKXwlqM3uF1IbS4nh8p/mFCT1kGtENrXlTfgOLn/BaUcdJ+yDPzaq6gZEv/1e45J0up/cR6iYHZaO/hHrSwfWFJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735896; c=relaxed/simple;
	bh=ZFArkNraaZ0L36n2Wo2EzKiOExURS5T/VCXeLAYPpBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3McWhm+3tt+G06aP9L4HcVxo+ct9ImPvzqJ5NBQVW3qxcMNbhEv735vZce2ZJT2ZilR7OpY9aWDdndEEy7+BGlpxOCeqnuLtBSbSkMvH9Lfb+LxvBf8J8fWrdp9eAdEwhr8dDMgQCiCancHdeMTY/y3GgnZhJWSbDmrZ1B4oHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1DsrRMx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xon5N7sj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALDUw7Z1637150
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TzWfedC16FIZGAIbkXllIwmNHSNZoAyGyCi6sqPgWo=; b=U1DsrRMx2GrDm3jZ
	xmEKQDnYPLQEgGwD/s2UMRpVMTFYS30XOkH/C+vznh/t5r764uTc9DA6P1iwiLNa
	EPjmWTdFt38674XHpZP66PDvNS9DdL8JmExwsby+Y2/3Npy3JxTw2mZypsAICBtz
	whGTzWBzN5B+TzpZGLjE2NiDjo+vGSzPI5RDi2tAolWDVL/gAr4fiWrYWdapL9Go
	7TD1i+GSRJhzeThyOQl9kE/MPrec8laqexIllJ5o2esDzE+Aoe6VztJGKX6eZQdX
	Fw2XfmT3NO3sYYgkXtuUFNn/iZ2cFutJMdZVf+1SzRVnOooGZl0DWoH72osCExJc
	qUQqDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagatxnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 14:38:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b227a71fc6so55544285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763735893; x=1764340693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TzWfedC16FIZGAIbkXllIwmNHSNZoAyGyCi6sqPgWo=;
        b=Xon5N7sjvLI/Tx0ixZonb5PhV5RoUy29bcsQwXaZy+Veq+xAOCTLgUpExdwcTz/FoO
         v6znZJV3yECTfUSOjxuBFkQGW2lTaFog/D7KA2iGvcyYv3uVcX9c+lbKpXePgkon8nWh
         9sRgI/C21XNlD6sQynLk+IrXrsSRApdx/lz4QAa6Vinc4R9E3qJbuja1bOzxmguedlWQ
         oEx9Ztxgq0sBdWNfqO0pwUYZfrfUZT+2VWVTt2aPPt/OaZ4G6iUkRIEPn8ifukcMO7zZ
         +QwclSqkutHLFWem3oBeGhRPEFHBnsKPBLtMUS3erO3R0sFkv8FIRjrnMazoj2672dnU
         g3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735893; x=1764340693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TzWfedC16FIZGAIbkXllIwmNHSNZoAyGyCi6sqPgWo=;
        b=Yy4UKRO4FQ/5L59GQIknrfS9gXdaOvR7+C0cgkjbM/mxJtwvlQcjWTb4r2dv72b0ev
         tlcmjU7Su9BOJzYOnTryzBr1IKHIBpXVJTlR0O2UTrd8JUmOg8seNLDImaC+gdfhszTo
         QeZoxdqHVGlFV0glI/+yUUEAvPdbyKf4ysHBfaMEuAaG5eDjzKNZvJwJ/Hxj6pFO8BaP
         lSSvK8X7yDXcobBH8iVEkHNtGm9mY+Yw3Ykbpeh265Zi3IkKO61mVlpfh5KpS6kv3VNG
         NSdYmifi3rIaGQDfUrclHa/KDC0Jd74FTRyi8vrCbJjBeiLfKCCc9UV+PvTjHhwu+hd1
         SOuQ==
X-Gm-Message-State: AOJu0YxLEVI6X4ukEuIIUUnVpo5dJPkOM3m7+HDZW9YisX93KEZQzHu+
	AppmJJpfWC/rFeyyl47eBI2cU77FWZ+SvGceWBYJFFVa9SrRFr5/Ki4cRWiKE/SQmCXVeUQcFgv
	nzzf7CXov9s9qK+k0wBF3JFwkfgiWJfK5mdwyQmpEaW5Fbk9b5um/++DOhWGAMtuDFxBS
X-Gm-Gg: ASbGncsTLP20VVJGcYrSWsfISOO9UvK0tUWrDO+7OmhxycuSCU/IobjpKQUk3SnVkvJ
	aRgtA/1U+VlmUc3LjyOlXmDwlalWhCCmq4Ih0CSiU0fklBQng29TekSO9VvQHKZEB7jef08Ec87
	fF6UFG42a/zqt9BL88pfxiLS+mFm1ApPci14MbJ/bt3iPGPsP6Da4B0zv2VbEJKQzP9xrAA8zBT
	v7JOOOGWXSQUCc1KRW2du3WWZ4N/psn/MyfH7dDKaQLlEajYLnj26BMO4bzhZaQh77FZlr9qn51
	Yy5vaFJugInzJexXLpZage7WLSPu1AGPONKFP1cWjqDBujD84B1Gx7BDAW3rFXDyMqM/XBZNxPa
	XYsxHwvOt6HOlrj3OvaHEcaj5OB7BNiHk+QCG7KiEAeUekoFXKQMqm558yANG4It+l+4=
X-Received: by 2002:a05:620a:f07:b0:8b2:e346:de7b with SMTP id af79cd13be357-8b33d1bdae7mr211616885a.1.1763735893354;
        Fri, 21 Nov 2025 06:38:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMu9pZpy2vRt5M4YmyPta+NLBOcWEyzBSFHlwSK9NFiMIDwPyu1lGevV9M9FA2ND/ftU0B3g==
X-Received: by 2002:a05:620a:f07:b0:8b2:e346:de7b with SMTP id af79cd13be357-8b33d1bdae7mr211612085a.1.1763735892796;
        Fri, 21 Nov 2025 06:38:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b5a46sm4686247a12.8.2025.11.21.06.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:38:11 -0800 (PST)
Message-ID: <190d0703-726b-425e-8e5f-3ff24c8935d1@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:38:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] ARM: dts: qcom: msm8960: Add GSBI2 & GSBI7
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
 <20251121-expressatt_nfc_accel_magn_light-v2-1-54ce493cc6cf@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-1-54ce493cc6cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=69207956 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=INxY3ozUAYpN26jWuhcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEwNyBTYWx0ZWRfX/BMARHe1cOGc
 4v4l322Z/vCYY0WL9AY9t/k9Dkc4fEwwWLX+B4VzI5UFMdYFNsSHhjKgD76umZ1EbeGI3bOL4Fe
 yR4vGKDEZignATkUBgM9b58qeBKasUiR1U2cIKExjq0chzAtbSpLbrGk6UWdhqUuLtMxLGX/Uie
 hgSvLMsYrJ+6IJxayjy+9gIDiadAkks7mvZkXJj9eO3nAoxxUjOfNuJ+kfbrM1CF0shEPEzqfY8
 b1ahB+hHgv3uxwdQFKGAMn4vAf+bbmaplu0SQWbtNFjPeYs7hzxnD85FgvV90COyzrZgqZ4YZhx
 h9lahEDqHEqBAv9lT0H9lWwHt8F4yiz3az0cQ4yVY+zmHH9j43M4nFN9woXLkUIdonn7MpnbXSU
 4d81sSyzMlIr/0TktqkcJlaY7TTdwQ==
X-Proofpoint-ORIG-GUID: 8SdkUxQW3Y3WLqi5RcVPgIUJb2Unth4Z
X-Proofpoint-GUID: 8SdkUxQW3Y3WLqi5RcVPgIUJb2Unth4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210107

On 11/21/25 12:44 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the GSBI2 & GSBI7 Node, which is similar to the
> other GSBI nodes in this file.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

With a combination of some docs I was able to track down and some
downstream kernel reading:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

