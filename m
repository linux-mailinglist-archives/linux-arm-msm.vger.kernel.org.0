Return-Path: <linux-arm-msm+bounces-42948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD39F8F32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 10:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98FD1897129
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 09:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2091A83F4;
	Fri, 20 Dec 2024 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRSy3nJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF281AAA1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687746; cv=none; b=o7jq1D6w54IcaMRaC2VNre/UXW3cheamBr/A9+8uCjDlHNKDbUrCMzHrSHaQmeWGbSvZY4ZuLM+f2lZj+4Oe6Lf8DQFGS/+ty0e7mc71eGjCqR6pTz1lAmBZ3QjhxWqzUEiJASbqwLyzEr+FnfBx6X7Qn1fw9wsutKATq6jzjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687746; c=relaxed/simple;
	bh=Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U980zsQSu2Uo3xTJq6cxjJxM46m25o5FztZgV0ve9EtbTTrQFPnDIRQ4FmcIIWJYUHrO8DTR3Oay84jPaQcTNiM8iwz65hrJuwJ0ZhCxgLR/IptNp8gScZJQPHGnsUOkBSbPdBzkRqHInmX8ixT0eGUjewfo8okqPhXCY1Qm5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRSy3nJ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK8gZ1Q027376
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=; b=LRSy3nJ47eVv1x/r
	RYcMFHq4QDGUTLr91PB1Tcx3UhnVVQhxqaLKe6bKqNPkQC7zSaiVo9njvksGR3PV
	Ec9SYzXUZZdG96+N5E6l6hrMTpC107YsVG220PXuPtxxvuNz77sCZlBMLq3cTwpB
	saQEH4ilPtHjz1fQ8WslLvjLeEI/fu0PA5l3XcAD5OWJkTbREtz9wWS73kFCjlh4
	kYXXAVyJ5wBNLGmXCVbxFyUKrMjev2dGIiFfvkwK9F5MdEaMqO06Vzjot/gZcGvo
	g5PSkuZazzLAZ+3cK5QnKLcAGCADdtUI/h8JSNXbXwLTaslaDB0yXr/zaD6Vxjyo
	ayRuOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n59x855t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 09:42:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a437e5feso4052941cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 01:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687744; x=1735292544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Srb/IMApP0AmNywP55aONUjmWy3LzpeEFQ6056YKF3E=;
        b=oTQ+2hUfitAnmVdUkrRX45ZIY6vZQi5kfs7u3FjDFRrVG2FThouNETUgMXGOxfzqdX
         M5bQUo9cnIzZgIm3n9Lutyk0g7kRALkbnETD2hDEro0oR/77AkbY67duZCo6HIShCwhw
         AGJzzZLusIUKz994vtuurPm3sjA2V7q8CxOswb9pvqvOE12f6slgaxgwcFxcwT23pkyQ
         QFPizvFAXTXIwkNlJ1tiI3SmEoed7cjXkRCK2bsCMf9QTyRKlKTVRAtQ6yhNVcFjnDak
         a7Y5C3acH2KQ/xNGvQZJTvsYijSCa16g5BB7KzKcZ9ePjEyI7bz9IfP0PY+xS9hL7ifU
         +l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUuvj5P4Y7kP1n11RLpio/uwHvjVZfLIUkwiJmuItN3tpo15w92Nt7tvOIFao2XJX1fq3VUz9HDquprdww@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3MIdVnG5DxaQd7x/X2CXyDgSdbihiQQ6gOXf7+vDA6kk8UJIF
	Q8Mpae4l7ZpKOma6cARI9W0Tf0tSji46OdUNcdG/YuS7YTO4UIfzHfGEK4X7RUHpSSLQGNVtVQk
	K0evULvHjgIv3TfXnUA4ckwKv2Wq937tdkBOyWl+sEjU84ecK7RoMlywBS2ct5cjC
X-Gm-Gg: ASbGncuZLCPo7DZMiBOWABGkVgfPybgV8na/yxZ5rVxbb6eppIESQcejIBidiH2fZUY
	/cs5uMeizfadCLcwmb8Wjh3b5tNKiuvvowEVwAkuMmhprihh577AaXZr9UJDcsQRIUHvTgIvpV4
	UEiYS7FwpsNEbB6+pwDjC7rbOen/wMsOQfef0vH4htL2+L/QvXYqLPuBFT9PWWfIPyCcItswv1S
	hlpjs2b48SeHJb2esEybHPI+gzvPYUJImf5Rnl+RIfcowsC0080hgZAIyX8GYsqgX6XKXFRWIeV
	RWo5H+Lkd0rFaZXB6v0yt7Ev3mU4SA8W62s=
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr14370761cf.10.1734687743665;
        Fri, 20 Dec 2024 01:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtVFYoZr8OVyUkQYL9m/mvQSFGgdGO3w4czfWfr5Bk2uAOQJsU+lMK0vdweVrYuEj46G9JVA==
X-Received: by 2002:ac8:7f14:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-46a4a989db9mr14370531cf.10.1734687743313;
        Fri, 20 Dec 2024 01:42:23 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80675a41esm1545415a12.1.2024.12.20.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:42:22 -0800 (PST)
Message-ID: <d9309db7-e208-4dbe-b408-e637566ece4c@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sm6350: Add missing parent_map for
 a clock
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-2-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ICb66PXUTEES3-gelMESiNb6m4WHw32
X-Proofpoint-GUID: 4ICb66PXUTEES3-gelMESiNb6m4WHw32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 mlxlogscore=823 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,
> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:

Same as patch 1

Konrad

