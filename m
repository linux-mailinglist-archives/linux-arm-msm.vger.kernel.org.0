Return-Path: <linux-arm-msm+bounces-57427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E73AB1337
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F2C11BC694F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF9728FFE8;
	Fri,  9 May 2025 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+PZEqEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA428FA81
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793403; cv=none; b=igMCxwOwNkGxIilfkSLd2kI1iNPJfzOgxjmAY+9HZonQ6UI2tGDO3KxZQKssRhNe1mC2pCXEEQxY0bhOatQhmEFqtzMs+wP6eVjpi5TEghXfhIX6Zd+/y9dCInJbURtiJCDNJ0pNlvOA8iTFZ14mUjALqZRHbziOhbbAwownIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793403; c=relaxed/simple;
	bh=BPTqbhqBNKF7eXF603y1EFlEzMSdfVj/K5RsaXM8QAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbdydWyy+WBalIQgkMNEucvxmUwDE45GAKP4uDMuTVoDqzKjanfW6nF7gzcjvAkIg1e202QH+MYm9Jb7esx230TlyRDKxRKcxIsxuYoFNkragea8lymkzCwEwqkSxjBtWWSgW85DtZS3H/gEHFsj4KzlKBfmL7H4o0J03LB8ybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+PZEqEd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDqgq010675
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1f/JYxetqb8RgZlUy4cv59FbC1e8F5GR8Vi4igmQdNk=; b=J+PZEqEd9BepWbVD
	iex2vj5XBGALhIf/4pMYKcDfLKs+p4pNKeZ9JDUxf5DFigiVGR1+E4jh4qRg6nCf
	HGjI11DGa0llDaZesu2jl7sHJaPzvYqyT+8NjYbclu2MQ80pVRQoI4yWp6tLq+rz
	n5+MeI4ipNvNsSuBf/KJnqb5qPcVOgEenfYOtWS8055VIz5hPju1xBtJBPknQueT
	t9uMcYjLm7lLgR9CdFEFt3HY2OQV+EWE31Tb1Uy7hGIacvDmmZ/vVKGOBXlSR9U5
	sW5ax9HCPx7tY+scTHuA8QU/H1A6qC2xwiabR9og9cW25U2F7Fwd/0vl4qr5Zran
	aCPG2g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmmmej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:23:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f540bc7ccaso1412936d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793400; x=1747398200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f/JYxetqb8RgZlUy4cv59FbC1e8F5GR8Vi4igmQdNk=;
        b=CDbGkTukjCjaTXmafRMUKWremleEQvb9wn1ydmnt+yr8SSlmxygsd1ZkcNIO6NZSyP
         5QpWiTKlBVzPamas79qmKzSknTQNK643vsrh6cYcyhEJDonsm1RVGdHT+RqxCLu9A3iC
         ZDVz9ZSVsqNty6sX7nTI01UKILL7359WfAkml0qcjyf+OBj4nw/LuPXko5WXvS+/tYd7
         vEeB32/vYg9en+PBxmWuUe81orSnpeQ+gm3oHWTiBusLpFwKx/giCxSLTy6HLsDYd+za
         rDjhAq6bR6p86KRNQ6qtkWys9ad2tHjnboyiVDur5eQL1e78esWVFkoHjYsV99c3rXwc
         cAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUE1Mj1OpFjelnox8fVKlcfg1DLgNaHih75tsEJSrz4/bEUzs3wrABL7OrfITpNDcUb1DR1YdJAXec1XeT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxQ2vMMSiV9RdrmAvpDNF+NakzUYtHijQ+ocQTtYhdSiLWltW
	rr9Stq/Su+VQLpJEqyJtr5hOqca3uiSaOm3DZqVUqYAsLdCCBKKT5fTOkrkOvf+P8eol1QBglm7
	ypRzkWwiIFm79DEJPbOyvG0N3MKxIoGnPAewltX1v3upQvcyK1wyoW/syYwDV8JGw
X-Gm-Gg: ASbGncvPofWmCWVkW9oXEXiilXkKK4ehaCh1XaAkCOyUVmjP2FCgT8iWk0RgpXdBQNq
	AxJ7OP8Bcclnp4z/QpeNJ09FjCI1vjdrhkO+0t0YO2vrHotuV00hK8xQTVodCr8K5AiFP8fAOiZ
	io1ZUsOqm+zbB7wgxDq8odsxndhjsir0LnTzN2awA6KwMrU2OKUG4YRjA9Z8k/Zm7Oa0is5Lpjy
	wq8fIPJ9x7R1ZHirhlEsy874lTPoLw8rnGBDjOz/OJB29otJP/XDZ+PN9CaQimCx6r4y8RvUElO
	4qC6BLw9C7WYAhozbR4nhQUFhM4/MG7L9SfxaATQEcCmK816upZpljA0QAypFnsezOA=
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17154256d6.5.1746793399924;
        Fri, 09 May 2025 05:23:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb7jn/fkRrS+0pNmBt25lIF4IJKWPlbMbX3OP46mB2qIDzck4hs/EEPTKkaXlUd5qrFgS1nA==
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17154106d6.5.1746793399605;
        Fri, 09 May 2025 05:23:19 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d700579sm1336922a12.51.2025.05.09.05.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:23:19 -0700 (PDT)
Message-ID: <0ebf9eb5-6906-47af-a4f2-99a4587150be@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:23:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250509-x1e80100-dts-drop-useless-dp-compatible-override-v2-1-126db05cb70a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-x1e80100-dts-drop-useless-dp-compatible-override-v2-1-126db05cb70a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681df3b9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=oFAjQAwgCFvTbsaC9pkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QIWoGdXxtl-nzc-NChk4KP5wVCz7V80M
X-Proofpoint-GUID: QIWoGdXxtl-nzc-NChk4KP5wVCz7V80M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMCBTYWx0ZWRfX5+ggfcl6tnKs
 VJWG0kachNX5yTq/09nDiHQAt6G4N2zm+cjiv4yPnAzR3RCEGT7AYx7P3xyTxYXWefICK8yK/f5
 3Us9hZypeV9dIqYtaoRttsuhfhq31v/wVA1VmfxO+68RDNhz4QJLJ0QzzRnQ5VXJwqptoNv8Q1h
 fLY3lGn9jF1+y8WT9ieUERPgvgptdkXGyWXaSYNCx3zdb6oAClU8l4dP4nT8eZf1NALip6fos9L
 6DltsXg5dpoXcHjKFNEBQDo9r41UbdPrzEbZUnPL+iSkeSUDCw7FQBrt6Ur47x7D5HCb5sjk6EU
 OuQw7yvXYo+0zcKg3JrMrZ8ibM1CSDp/m9SzUffV3LJtlKbfEl5MkXKlTsKPW2K7q/k3v9MSQr4
 b/KOgLvBeE0wKSrTRzugZ32QRj6goGi/8g/fYGroQPoof44ocMqqiDyuGZjVraIiXdBBizX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=815 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090120

On 5/9/25 9:08 AM, Abel Vesa wrote:
> Back when display support was added initially to CRD, and we used to have
> two separate compatibles for eDP and DP, it was supposed to override the
> DP compatible with the eDP one in the board specific devicetree. Since
> then, the DP driver has been reworked to figure out the eDP/DP at runtime
> while only DP compatible remained in the end.
> 
> Even though the override does nothing basically, drop it to avoid
> further confusion. Drop it from all X Elite based platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

