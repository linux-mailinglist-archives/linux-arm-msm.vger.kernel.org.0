Return-Path: <linux-arm-msm+bounces-99189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOSbHrYVwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:28:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A72F0083
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 762B5300830A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BAB366570;
	Mon, 23 Mar 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWGPI5/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRh7kA9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9C38B7A1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261685; cv=none; b=Q2iCGfxwZQTLQ33uyoQ8QIWnFJk8bShAjHeFEW+NkHXuVKpgfYwOyREv4WwXR/rT+qEalybTCK6hJVSkoD39fDUbeEUXxXng7k3v8ds9exZLgfc/tiwMH6Wrlsdv8aA9WSl1fmlkaltJxl1Ddeg4EFqB1MtgHY3JFJ64uHuGt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261685; c=relaxed/simple;
	bh=GYwYHEIg28nGXMvEwbExNN0xfDb17DvHgTiPgknPFbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drGRgnYFxWY6xPWf62v6j1jZunR3CeRnnhck+WpR6sC3aAQ5jYxv2WA878qelvDY00X/NkClGCnnP39ZcbhSoUJog7RWjBEMbHqT9zDhH4NRzacb2BUkV1CDAGLrdqvM+Wu57+zgO3ArHDvw0bxkhocOvwcg8D0iiETq1qPWEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWGPI5/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRh7kA9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7VtKQ3529248
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v4VZe3+WVFtlZ6iERjGio9Lb5hHJRT9If0sR3pjYd8A=; b=LWGPI5/a0b7aCx6P
	XWi50VcL3xEioQaz3TKBC4OT3sJVSor//mpZ1psUyILaY+bSFeHLZ8DXVJNJ2qWt
	dj+AZRbc/2UoIZkxz/U30I2oWGLPShIOYspDSjcCApiAwEtrFh6SfpKfqITm9oAg
	phPzLtBlqrnefumACjFC+BW96E4A4ecs/3oCsulLuXi0ET42vV+7/024JqCfEuTu
	2jwF5kLqyLwDkLpAEigxy9oyZiTaipbDKNj8Ff89NJO8D+07afUsdOo1AH6Yw0FD
	/CEljFoLer2eykh4ZbmmuFITMqRtV4k76aLO1C2nbrLSrmpXd7cwZc2bEpC2ARLM
	L9kkHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jv6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:28:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899fcb63705so31569496d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261682; x=1774866482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4VZe3+WVFtlZ6iERjGio9Lb5hHJRT9If0sR3pjYd8A=;
        b=TRh7kA9KWevlCyLeItsBHrJGSxbBUlDXagZvMLwytuOI7ysDkmW0Kw/33Woaqbnc06
         DP5ZaucID6Pby2MNBlqcDcUVKHyLjdhJkGOGXEsQ0NnbFjW0/pfkyzUBxpHeuyZJYHBS
         BEY6gHOlUFvYYVQn45XHUGW8+QdfrOSnUMn0O4QOonW9YqJvJCKnOXEqyDs+V68rWASb
         mJOC8T/YfJvnhK59HoKLTqZJfj0ia0ofQViZYqwl8E96Tbvr6dIYWycbsnrnPLI951fY
         0gtIbAiMMJTplVFHGKXqBI74Gb8gpHxSsWrO7FmbSeyEcPW2GjEA8iqKqvvhwmGy6fJ8
         7N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261682; x=1774866482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4VZe3+WVFtlZ6iERjGio9Lb5hHJRT9If0sR3pjYd8A=;
        b=lFnAKAak0Hfxm6hn/+KiTdreM5tbSMkuzLoEItIqCkveNVQuc/sNTu76pfsjSWnaIb
         q/9ApYET/5WlFl90se7FEhgeUAiMcFH9koDXUvytBBpninQpN64UahtlZXoUXBRMs/ak
         nz5TCe56VHQfuvXpFnWB2B4egYTfaaF5MtlAKZJ8pnyLsaSc0ioWkI5Pcqz0/veYkowa
         Js+h4cLzeFwRjZBOJ2GWQ50wJ5pQkz10nA67VhTamwq8QfrzvDxlp4l+hCZ2z1UfWpMq
         2txookVO+4yKz6S3JVFJsjqyBoZpyve+uDY3tPY8vwO5YUGSMoaUtiKBKGJxyTrwG1cK
         4IPg==
X-Gm-Message-State: AOJu0Yz4lok31gfogEQDN8j/k93nbHaUPBLdzNjT3QUZTJrZfi1NyKpN
	DNsZNDhqj5EwkEnUMH0wA1ZyWw2mqXVD3KbeSukqLZY2Gvs7pEtqTE7uYjevopKtRTsXq6fPYy8
	VA3FlPhZ9IxAlkOW0EOiep7TZKtiFftr08a0+fgKd+e7uRkKmjz/fH5uqGlv9rOokaMji
X-Gm-Gg: ATEYQzyB8R7mHnK4riA/YLEmzruW5cDYzF+QYZ4v4Hd1eIpSMja5jdZG3mtL6fo7gb6
	fe70kR7L3s2YoM8YYAhZMY+FeShGzMyJHoSS4P36Kco6RE3JSeKsgGyK+1t101tKAEGq39zqAvo
	0W20XX/KmU+7D0WFIBVgCTqeYOj7fJ2wwrJ7LY+H+ez8NX54gQH1kqUaiy0l0REcfE9raIDWgkE
	KOno2i407A7tLlpHDm7JiYcCOMjkHVZcLL/bsktowM1ALQzRfn6oXZ8ZPZJ/bcWddwf2ttluAdd
	9xwUYgKUNASqK1WkSTsyiuwZlic7n8CGHMtu2Rs3gXDWDDU+hR3iduwL6unHDyE6xWKFnZJFOgQ
	7S3GAeMVb5e/5dTleemeJ0KMzOjXpALhoqhXiGSvRQd06aMcdj5pKehAHE/dnRKcVIr+wOo57Iz
	OxptE=
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr139845051cf.6.1774261677408;
        Mon, 23 Mar 2026 03:27:57 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50b:2875:5782 with SMTP id d75a77b69052e-50b37503d15mr139844771cf.6.1774261676917;
        Mon, 23 Mar 2026 03:27:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-669cba50ac3sm996835a12.30.2026.03.23.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:27:56 -0700 (PDT)
Message-ID: <83617d9e-c5c1-4756-afa9-28cf79374c4e@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:27:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] interconnect: qcom: define OCMEM bus resource
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-5-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfX0NNtqso2TC2f
 UHh98bPzh3oEZjlV1d3pVUlkAiflxcd9eWlj8MsGq8z/XSjTjfQM1QIsDifVdXQE4hMIPAoEnd+
 puOrIEBZj0eaXb0PF+6jd6eTq2ioIFaNjJ7sWXjJQVJMEpLHI175Q8do3NhF1449o1JjwH39xCm
 QCNUPBVxHXWdmPWaj314ejwViwwFs6KpFnQG0hcX2Zd7ISh+0wZMkacvbPP/eS0eYqmKs+0H68Q
 u2oXAm1mch4ZJsyuMs/JX7HLtlRnkjYAPBG7g29QeJgemVyBBZuvF6qJQIMDh6RYx1LSOQHO5s3
 mpFOtbAHDdPT9Uly1UDWZBdfbrbVhjgJbCBp/l356OboJRBqjC0zE2JaSwDq6G/lI2WJmHT4d/c
 Ks6n6zbHXm+Vy3sfqGQC/UiVg69v76RGgboKPBxGZxXDxQkWsVFYP8QztcA+c7Yf1cD1ImUdH8V
 QZbejIJ9B1cbcIX4oEw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c115b3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=g75QHS-HUdHfZH2ajB8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: rvUHlpvuUVWmUXE3J6MCrogNjGf3SPuq
X-Proofpoint-GUID: rvUHlpvuUVWmUXE3J6MCrogNjGf3SPuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99189-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B5A72F0083
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> Some of the platforms (MSM8974, MSM8x26) require voting on the OCMEM
> clock. Add new resource for that clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I don't know about the GPU prefix but okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

