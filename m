Return-Path: <linux-arm-msm+bounces-36001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB99B177E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 13:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785532830E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 11:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F2C1D4173;
	Sat, 26 Oct 2024 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDz3mP/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673EF1D3634
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729942726; cv=none; b=YN2jgpGtIZfbi8pV2Y9OBltIAFflhWpsPIqcG9eu0AhI3B0ymSNHBclpbNsPXI6NGveb/2FcDGJq4ANXvnqvmCMg8UuNP4TwwipL/EPvj49A6tEQ9GInRUZIjCmbTZJIF1SLLA1aNG22NMO6gOkY8wgs/3Gzp/nLjuQXR33BZlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729942726; c=relaxed/simple;
	bh=wxc+dIWaFDqYXJ2UOmZG5MwkG5ZYvvsWMsSRYr4sCqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ni1XnuUQAkYlL4KMaJgWjEQEyC8dYHHNdritPFAzJQEMrxdbMQEP74UfcHyyzzQ4VnMtIjkegmoPY3366rjSVVtVWDUbp3hJy/x0KMfBeTZid5Ap4Mek470I/1MCYT7/2oYxx1wFaf49leHaaX8l1tYHWd42Yaog8nKkrZF/gj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDz3mP/Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q4F3Ac006223
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxc+dIWaFDqYXJ2UOmZG5MwkG5ZYvvsWMsSRYr4sCqo=; b=MDz3mP/ZMt8WB/wA
	IcAO7pwBza5WgovDX3dJprlxB1WBXOdlPTAQL+bugHUXQHO1DzJOx3plmqFgF2/Q
	s4nN4CF6YY8HZIB60+OXGDQ11A+MGYSt/PWsAmJpye2ZZ2tS85KWDsda2TxRuBiZ
	J6zLWeF9baxcRvmA8kMnn7BbcgxG1lL9vHH5zlQ6L+9SpExDDt4R4EwFg08JcEJu
	oe0jv4nXQFZ3i1JGYJEDBbp+sBXu9r/eS8L03Pj7u4q/txn/yX+IPtKowVUnbAtK
	Lx59EVD2BQykqmceCas40qwhdXfaalHByj5wjrcea1NCz8jR+whdjXkIfMHTcQJv
	WRYixg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x0up4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:38:43 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe40565feso7967946d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 04:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729942722; x=1730547522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxc+dIWaFDqYXJ2UOmZG5MwkG5ZYvvsWMsSRYr4sCqo=;
        b=hGgcNyIZ8PKTUFj600kWiciUL9CiwxW49PW+xSlbaEicXGhjbhWSoTD28co34AipgQ
         PUKCDzElJgdK8ULwPpGG9bew9BKZM5lyGAHMjmRCBU4kJgXqGNa6QUYWmJw8U7ydFI0L
         5+r16mEfQx8Wp4nPCVLsahzIYiGH2zYRfI/+Jqnl4SwecVrSBauoBFNLZAH01U1yaCb0
         xPQPktrY0Iqovw2JmCihlM2XilpXPGihEAzLWoVzW9yWJyDxgoAHD3V6y+9axuur/V6o
         s4GEb049Qe2Zo47tGYuuHxVKp2CF88OQ1KdHuSaIfYhWzgHG1mQmSr4Y/FvONnOcCtXN
         pWQw==
X-Gm-Message-State: AOJu0Yz7i4UoDqT38MK2E6Po85j+KP4eIwDxcRMrBLBHS8tWLIR42Vt2
	Aqn+nzNvTuRZ0kw23tFs9CuMlqa5HlWSVnDlwPhxyvZsfsacYTX8ZLiOtukX2E3iyH+95N/JM5h
	bgENLK4Sg0Y84m8MlnvX9S57b+WN2Xx6j7eaVnBczKrVXdeHSAi7iQQ51h3hEgqAI
X-Received: by 2002:a05:6214:492:b0:6cb:1fad:82b2 with SMTP id 6a1803df08f44-6d18566505bmr16966066d6.3.1729942722389;
        Sat, 26 Oct 2024 04:38:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjV61HARupu7W70JLeA+UqwYOAVuXyIFMiS4jRVtOulAOXFcqwYl1WNINTuzhv44XyFwqZCg==
X-Received: by 2002:a05:6214:492:b0:6cb:1fad:82b2 with SMTP id 6a1803df08f44-6d18566505bmr16965886d6.3.1729942721904;
        Sat, 26 Oct 2024 04:38:41 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2994ddsm164820666b.110.2024.10.26.04.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:38:41 -0700 (PDT)
Message-ID: <768a1c92-6e1d-4d6c-90f6-efe66f68dd0e@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 13:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Karl Chan <exxxxkc@getgoogleoff.me>,
        Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Sricharan R <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-6-exxxxkc@getgoogleoff.me>
 <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2eck3tudqoqyylcknfvz77wj52fornxevp6po3y7sov7swikt@asez6wepyl6h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RwktfToQSX6zV6HmaHqjB2d6fibSJlx1
X-Proofpoint-GUID: RwktfToQSX6zV6HmaHqjB2d6fibSJlx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=674 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260097

On 6.10.2024 10:14 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 03, 2024 at 07:28:04AM GMT, Karl Chan wrote:
>> Build the Linksys EA9350 V3 device trees from the arm64 tree together with the ARM32 include to allow booting this device on ARM32.

+ Kathiravan, Sricharan

Would you folks know anything about it? Do we have an open source
U-Boot release that could be sideloaded as a secondary bootloader to
kick it into 64-bit mode?

Konrad

