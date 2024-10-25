Return-Path: <linux-arm-msm+bounces-35932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B730B9B0C48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9460B23AEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEF2209F57;
	Fri, 25 Oct 2024 17:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut98twQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA618C93B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878943; cv=none; b=kYY8nbWEtyqqPigjpN9uyYPDgEmY/bdO7JGNSKFjehBCEb42EeUCz6ZnQBAB0OGMa9Jqy61o3B7j14LZpf/ru9OpsDO/37yOsMZgMpok82VsSeu1aTXencdBdgdsFLcFHx2WDXkP9NptGwEkMAe7bjDjUHFOaRxqXrATyiQd3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878943; c=relaxed/simple;
	bh=oLTcbBsCH/Mt/pGRwR/C6SI2AZWl7kQEGneT7miSIcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JadTKvPORrorTuAy0AM4AhApmjxaYdgfLSEPUjtm0RHxpeQk8X1l3xFQxAxxBm3Ir8ugFvn5Wf88oenAdLjKmYhseVvgEaAt1SDU9FYt5fUUtQydOyWQt1PeGeMFUKz7Apwa8rmOBt78FChw7gC8yUYxnqKYTmIbU4ZRlnF8ek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ut98twQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PG0Pt7019971
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE1OgiX/KUdd+ojY/198MhALC2g0LqMiphme5ARCTko=; b=Ut98twQ2ucKlUrj4
	HZviYBEU4rZMhmO1aivLRC5zWwdo6eKqcepmWJp9cYXaS0W1EGC4FckmIZWipCPG
	kT8xJUKWkt7MDRjHDP9cOXW028GLx8issDSqOl+/0gxE/vrWYhajiMpdrsG6XHKi
	vPYdw3Kp/GfdxmViEe3n+8sgLtfYsja5Ke61JwE2c4+ylkk6U6k0beFsl4p7WeWm
	s2Jzt9s7ETcnchUgURBz18JCROVXVjZD1L8ufh1Dv5kb6JcsBwWQMnQtMftzyAZr
	3GTE1Yqqx+NMqucvCL/E0eCqAj3PoiCKUfhTFrU5eYLoA/BpcE2rouo0XLT8E3Mr
	qREIow==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42g6y91un7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 17:55:40 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-717fac47d50so712992a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 10:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878940; x=1730483740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aE1OgiX/KUdd+ojY/198MhALC2g0LqMiphme5ARCTko=;
        b=NSNcmuPZRbtM/UfRb7nW4UgRsL64ykTNR9hmWgkmifGtHtZRnR/8bu4FIiHfE6Fh6D
         WBxMXP3Q92ZwSqG6nNCHlMYDpMJOiJlzZ6knZm7G7HSX1O/4LkbPfb0l99mZbEVRvL+c
         Grg7a5/oUDutT4db8lMEcasmcN3qS6DwmTG5Y4ZS1NTV65bba5KJJiMHlDbwt56afnMP
         uayWqZ6JL7OYecCp/88Glt1a7LOcKEVzPop1YQPEZ2toviVODsuagqYjHrfg272T7y1n
         xaulhdKc/YrG0RzvIL7DMlSYFwzOnjaUpHo70Srves1llp/aUp1B2vu+o/zOInpg2aPK
         Lc6A==
X-Gm-Message-State: AOJu0YxQfisO/XRbnbpbk0zTXyUwQE9L+YhePBThN4HLhfaPUK7OZSWP
	sp6RWNPbKhve7jQVe/OCyIMmaQ5pYD8G+permTy+XPrgzzLUiaDXpnXf1yD70IXhQmb62XDy5Ts
	zPZgdhbAQjnr0zXtEPXCKlfMFthCKkXlqmlyIOCpaa55AQcXl0hu7eJW19Ps9kYyO
X-Received: by 2002:a05:6808:21a6:b0:3e0:38ab:6ebc with SMTP id 5614622812f47-3e6384c6587mr107514b6e.10.1729878939898;
        Fri, 25 Oct 2024 10:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXFx7ijeorARsQkinM4rEFrRkYVYVx+dmiHRKzTF+5GoWLt3KqkcnzbR9O07EqXEHibq8a+g==
X-Received: by 2002:a05:6808:21a6:b0:3e0:38ab:6ebc with SMTP id 5614622812f47-3e6384c6587mr107499b6e.10.1729878939510;
        Fri, 25 Oct 2024 10:55:39 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a0849b1sm92613666b.203.2024.10.25.10.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 10:55:38 -0700 (PDT)
Message-ID: <8955baf6-8e86-4eea-945a-258ca287a5ac@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 19:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8300-ride-r2: add new board
 file
To: YijieYang <quic_yijiyang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
References: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
 <20241017102728.2844274-6-quic_yijiyang@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017102728.2844274-6-quic_yijiyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V-3foIwad2MW5dS7H4nhomCw7CEdC6SD
X-Proofpoint-ORIG-GUID: V-3foIwad2MW5dS7H4nhomCw7CEdC6SD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250136

On 17.10.2024 12:27 PM, YijieYang wrote:
> From: Yijie Yang <quic_yijiyang@quicinc.com>
> 
> Revision 2 of the qcs8300-ride board uses a different PHY for the two
> ethernet ports and supports 2.5G speed. Create a new file for the board
> reflecting the changes.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

