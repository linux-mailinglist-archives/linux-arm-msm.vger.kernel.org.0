Return-Path: <linux-arm-msm+bounces-68893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2FB240C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BBE93AABD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34AD2BEC24;
	Wed, 13 Aug 2025 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaheEKzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1D2BEFF8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755064544; cv=none; b=VT7CcF0xQryNWBYTlZS7qCthr6ZZQNs+j4tSnQvYGQcJrshzKTUpQf4HmxEG7KuZPU6xfPw/xJp2MijnuB2X15LziUpAI9fXhGcS+sJ4El2MLgEuMYRX5U+gEk2EUX5zqjM1GWoBysWbphHvvTJXO4/AGLO6YOqadZKvNGZFiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755064544; c=relaxed/simple;
	bh=3+UCjNp2P71sZESLCJbR548hn2AjfdJICXkD9Womauo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDUfxNR3djbwJZkmYPE10S+MB50FyDjeLRZpGlEXFzb/Xoxn4NB1+rLgaDDKzDzNeNRhaRzRQRyP+JMGpk2s07/OhzVajcDA+/fnG4yp8Y29bxKYWtDx5+7wDvF50RpRVYxBB+iJji41LiVvVgWXfleTLm0oJGcnXt67Nzjdqoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaheEKzP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3ndVc007373
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KHpx4xczwyhMGyk6W3OmOsK7r2nQtCAjXkX3DDdjW4=; b=iaheEKzP4zWC+epU
	VC6Wu0l3O5LUjPqmaHAiXiztUZF0i/NBaRlsEJzvvLvS1Cb7y5FeWt4LVLZ20fh/
	kKBhTFlIGLQLbzkKqrqYgR72GBFW+jxwsaHQ3XG799rVXT3tRa8vSeSf6ZmAWnuU
	FV8f0aVh1OBM/J4G1KGaPCP9NtwayK/B0uW4nlKoe9f10vnxZvssKTKq4Vd5uwlm
	EvpnRBeco+YFDLhDAe11i2JHtjHGH4sJ08FDgqMW17qf/4L3pmM2Do6/Fo7g3Qi7
	m0gsUuyLnoxNMmt/n/Ta2HXTii5YYHhRG8mGeyQHsKZtQnC5vXLcLpFKz0qEQSFZ
	qBcnRg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9sprf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 05:55:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4293085605so5928336a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 22:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755064542; x=1755669342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3KHpx4xczwyhMGyk6W3OmOsK7r2nQtCAjXkX3DDdjW4=;
        b=LMp++UXA5MqNJ4Spjw+3eqFgyuE8D/Buw+ZLyVrJC7WP72GNk/ltOrxIacZxGUpRCA
         EOfik/PZvY4DHND+1nzZzRBPZHh0CID76XD83wrz47Bv4u5w7tzJcqAtmHeuijWPALlc
         fOPN8chTYOmMdUzP9IO4Jy0ylWlPBwU7F99S34OxWpMq0iLXcZaOAbgDPdAMqxxoyeOn
         Ar1E4CIc46fiH49Yrj2xcHBRtJMlaWLt70jWlfDirLm1WQLogCnkXiwuyNPzbrGfTLH1
         03LP8Rc8qDxvIBo4mgip3StQ21ypxL1xvPbYswJ4zJfFR+CsQJxSKrhuWsTv8EdaQX+E
         RcHg==
X-Forwarded-Encrypted: i=1; AJvYcCW+vdF+4UJb6SJdfkdmuCXdTkfgIP1RkjFv2XtbaDj5awJ4AUtSgCyHZw0mxz+y3EzTobQFtYNPBlSbhtIX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7MM6oOlCRenVk/gj8YYjUQJJrcmImFZQRROpg21GdfgrPy7/Y
	Pk7U/2xJvdO1LniwvHMXi4aS47joRnd2EQYBubjceeA32JceZ+gZFW8BZHV/SVCpRmJVK2pS7Ke
	UTf7c/Z9B2LQ3Ac7h8IywUjrJs+bw08JjP8nCkoVJ6wOTZQy0qgzuWKN3xMjOj20tX2fm
X-Gm-Gg: ASbGnctw+pid4keHTEe6BuRhFYZrNZjPudLpPqHygzlG4BPJ3oYyC1xSDoFeZp8KWAM
	VSCvs5HZJLKfFHBSl5dbh8IN6GL4wQDvYc9oIjsiLO9Yc0/1PLFpzJMDiKyiGIfn+1nWs06vM+m
	QsbSfnsaPzk0VexHFTp9iSY133hDoSGJ1KUaZAR6bi9VAs7AoeXvSAiuAFTWLkY8Xg7nwyjoXci
	YMtwl8Ayur3jPR+8P/zOSz0oQYYfOfz9eeuUtgp4Jqgdq6grl/dki/6Ms6fUYZ4g+MeUqltYYH4
	0uagpj+Bt9K5LFXZRT8CNTcSr60gWMD2t+4PJsh3Jfo39FLbO27LdL9tYdh0SewPRVsSkAI=
X-Received: by 2002:a17:902:dace:b0:240:3e40:43b8 with SMTP id d9443c01a7336-2430d238147mr29979485ad.53.1755064541636;
        Tue, 12 Aug 2025 22:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjeZLj43GZgvnhVo3O62NOP4Bml3NVZ5MjTOxx/SHNJD2XfpLuuuU0j95oZyQKtcn4cXkmyA==
X-Received: by 2002:a17:902:dace:b0:240:3e40:43b8 with SMTP id d9443c01a7336-2430d238147mr29979135ad.53.1755064541187;
        Tue, 12 Aug 2025 22:55:41 -0700 (PDT)
Received: from [192.168.1.7] ([223.230.83.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef48fbsm316527015ad.36.2025.08.12.22.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 22:55:40 -0700 (PDT)
Message-ID: <28b97952-1b67-411f-a7fb-ddd558739839@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 11:25:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on sa8775p
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
 <20250808140300.14784-2-odelu.kukatla@oss.qualcomm.com>
 <90b51e31-3217-4483-bb5b-ec328665a723@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <90b51e31-3217-4483-bb5b-ec328665a723@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c28de cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=SiMmawhtwnuHYgKqZ0PRSA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=_8-003QpdazN-62OuQ4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GT5hm6QNi2x_KEl5BnfH-WGATdOitmFZ
X-Proofpoint-ORIG-GUID: GT5hm6QNi2x_KEl5BnfH-WGATdOitmFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX5MmgZaBaITAE
 r+BiFdkq77q0URjldS6IHA43MUoHqnqOMOzceYZA3MKhrjTo1jLn6dqUsVaWXp3BBKBPTox5X8u
 QFJA7Gw/MGjDMPLmjuuj8DGWzWolpvpfDbCFuUPlZfWn3c6MG8apOUfYnQkSKLsjcy15KlQ5a2E
 SLCxBTAnGxTvOWhF3m9sLf6xl08bsozndUC5LL84+8F59xV5s2QLURTI90QJnmY+qGqNVWpzzK9
 cjHRab1+RbNrqKNlvGq8d96PSxZ4EedG7ro5P1v0qLMnDfNEE+UHSVGm03cAr1TwtpmU2WwOhfB
 pFG4G3pzVWpV2jV00CI6bnMZdwOI2O9XEqgPRlVIshg60WkfGbn0jOKRoibQg/ol3t5ePc0+e9O
 J/Ev8Shy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164



On 8/12/2025 3:47 PM, Krzysztof Kozlowski wrote:
> On 08/08/2025 16:02, Odelu Kukatla wrote:
>> Add reg and clocks properties to enable the clocks required
>> for accessing QoS configuration.
> 
> 
> Nothing here explains why EXISTING hardware is being changed. I also
> remember big discussions and big confusing patches regarding sa8775p
> (its rename, dropping/changing all providers), and this patch feels like
> pieces of it without proper justification.
> 
Thanks for the review.
I have added description in cover letter, i will add here as well in next revision.> And this is hidden ABI break, no justification, no mentioning either.
> Again we are discussing basics of ABI breaking patches?
> 
If you are talking ABI break if we load old DT which may lead to crash, we have .qos_requires_clocks flag which takes care of skipping QoS if required clocks are not enabled.we have addressed this issue through https://lore.kernel.org/all/20240704125515.22194-1-quic_okukatla@quicinc.com/ 

> Best regards,
> Krzysztof

Thanks,
Odelu

