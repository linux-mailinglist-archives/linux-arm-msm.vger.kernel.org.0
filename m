Return-Path: <linux-arm-msm+bounces-50065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AAFA4CDBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 22:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9EA172542
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572D21F0E53;
	Mon,  3 Mar 2025 21:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGJjuC1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F01EFFB6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039001; cv=none; b=ZsI1NRMsz3YBGByr7FcQsn5BQ1D7y8L1p7tjmOTtzEoMvhZCTnMiUGYGxZ5vQqBtWBF7gSQsxFQOjCYfq9YseoCeIWpVhrURE4cc+AUdCmVPQmXKBS5MTt1B5bl5NzKe2QzsNxZp8k1o1cvWVY7tZeXRRjS4MwOiExDpIqjzYjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039001; c=relaxed/simple;
	bh=hQRHnDkkYYJm1kGP411WuGPS6pRSmfEvNG8A2sv/jFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnMrcdp4AgFiAQIfju3plnc0J7m0Xc4r/42rbnuMjigyXOc2POzAUU6obbz4FlL5TvSSTFyufPfGOC2bpz1erbB1TQJVZvUg3+I3H+zKhpWaebGlFmk80dniM4/F9HRMP2tiLfUUgO3rVILe3lyUuK8yKZL6vzv7Fvo25K9vRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGJjuC1r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AmXhq016530
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Mar 2025 21:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kdn0EPWjFWi47gSGgVfPoqhV4FTHW45fU21tUvu6lFM=; b=gGJjuC1rR3uk/jKs
	PyqX6LaRjzfVdTM8o2IIHA8+VSQvpd8NxuRZ8q+SvGrQ7pZEkc9wx0OPfJizgP9U
	hIprJcrb6w8Nj2Ys3RqKH6hoNmJ+CWOwsyik6zgpcLSvttHnpysQzm41xkZJIGES
	ewnI2VPLLs5OZrLoXgbKMju6I77fnWApKh2ZdLhy5mLcOC+svC79AA2uICJ4oZuK
	E0879FZOme7PtrDO94DZBgi+KEQpGpfyaMBjA4VLqqQ7kQfbsBHE8Xh7uGOUzzl/
	OLpATw3+Zv+2GmFbFfuGd0F+O/SAB+NN+NsSfVcdWQ+mnKbKk5fgLiy0kApUk4is
	OJQxzw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t7hx61v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 21:56:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c9f7f9f3so11964485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 13:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741038997; x=1741643797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kdn0EPWjFWi47gSGgVfPoqhV4FTHW45fU21tUvu6lFM=;
        b=FJ2FvMo+YB6w1xD6MnL375SCT9ue6B6Sj1ZK0FhPOsv1MWBb9RDqaexjnRNcwChM0u
         sD4jKRXVdqDK77DSiyd0w5CzNw/JzudgitYgDR2gjT0bAQEoQfSSHAE7t3xF0KHtQE35
         NpuiyzmAgzOJ+9EOA5xjcMkbAoNyokjFgICk5ybV0/TcjuivcRiYbTYV4ECqqT06v8Nc
         cfYOD8QU6cPf2tUmc9x0Bv11O05zlkSXKTcld0EpgjXg+UDCmYbnaHGssRHNS6Ezg2BX
         5z9HpyKRh3WxJ6OXuhOYwi9X+jWJ0OlL4GlyRwDsNzNDj6WPk03JHptR4tgrgvFx7mQz
         4Jkw==
X-Forwarded-Encrypted: i=1; AJvYcCVkkUrnlkK3Ml3FhsdtJ7NsGkxayJbiUnJty5SvegjmfdvgBh3zsMlOSQrhTrVLyAhDa/0KBFnMYtQp4W23@vger.kernel.org
X-Gm-Message-State: AOJu0YyYVcFQykucrNqeP5LGR5AORUSCj5OS8UiA4NR8AnXbcYlzxAaJ
	7RiQ9RDuvKfRskvScn3dLSfb61KKKf1Kt0thS0kVZb6/EU0HyMf5vlhtHNe8H4H1n2xzxf1TryW
	Lo9uXjPxyTpV9KeHEASeWv5fUthvLdU6dmLYx1R78mOLH7sjtnsA7t/upnrDeV5fB
X-Gm-Gg: ASbGncuHOD782aL3n3UCHDj3UAYKPYp5MjSUL/1mUPPhVOu15RrxeBXORpyvGIVA5Tx
	HpZdlJh1drGvvSqyJQTgF6MalUuX1rUAPf3enFHTiqGRssOKmGcQ41MGjn0I1lX8XLU5jiKm8Nn
	LxCccN3n6ljnrbCAoAwUYITXEQS7KIeyaZfwWkHaxc5/QGo3e090/97sAHnzj+5c+na4xomas1z
	wDavbnlZ+/UEkd6y23XUgrC/xDHDX8FiNwrhyIeKGIxNHnCZIek/JHMiMnCOtSabjBbrj7lZzem
	LNNszSHTR3O57eioEctqNsx64aOy25JRzqaL17ZQR2hKXRqY+XrjaJoQu5hG6gxFNZS/rw==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6e8a0d6de81mr72806026d6.7.1741038997596;
        Mon, 03 Mar 2025 13:56:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrJuoSvkjwi3RX1KRgiUtMf0XgXWhFFVFKUGmACEcoXKDG2ph4RBblLXA+X1oIIsGokl70Sg==
X-Received: by 2002:a05:6214:2aad:b0:6e8:9ed4:140c with SMTP id 6a1803df08f44-6e8a0d6de81mr72805786d6.7.1741038997268;
        Mon, 03 Mar 2025 13:56:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1d860c279sm172592866b.27.2025.03.03.13.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 13:56:36 -0800 (PST)
Message-ID: <33bf565a-82af-46d3-920a-ed664aaef183@oss.qualcomm.com>
Date: Mon, 3 Mar 2025 22:56:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_tdas@quicinc.com, biju.das.jz@bp.renesas.com, ebiggers@google.com,
        ross.burton@arm.com, elinor.montmasson@savoirfairelinux.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20250226075449.136544-1-quic_mmanikan@quicinc.com>
 <20250226075449.136544-5-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226075449.136544-5-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sGt6fwP_FuVnzwrzd1XmqQ71EZA53BtN
X-Proofpoint-ORIG-GUID: sGt6fwP_FuVnzwrzd1XmqQ71EZA53BtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=659 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030169

On 26.02.2025 8:54 AM, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add Networking Sub System Clock Controller (NSSCC) driver for ipq9574 based
> devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


