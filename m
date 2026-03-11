Return-Path: <linux-arm-msm+bounces-96987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIyeNXhqsWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:13:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5026437D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 542E93013A61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4843B2FD1AA;
	Wed, 11 Mar 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWzGdNlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R96ij2WG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E772FE575
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234805; cv=none; b=Jt99HZ4DqbiQChQ0heQgsJvTZhELKnnVUFMWmwpwwGLcvbx8RiR/jN/lZsx98IGVLL9eNwxFABkKF7euHlYdh0PAX72dipAaJSmnXVw6jCfKrfZCuxvodyXjEYqJWMTS3bmtjTzJrNiINuFA04o5Gux3iUEFMYvzv3RIF6GjosQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234805; c=relaxed/simple;
	bh=NdSZp++KQNCXUc6U2tMU3uO38ZBIDs7PQbzwDBll5RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgmpXczorvl/PeU52L8Pr1oTmzgdkPg1O5MR/QfGr0Aw7F5x2FBoelVmb/E6E5i8shnabSj2dGbNOLyNKVrqLyLTplFf4H5aoT4FlygOAQQShmJQEKaM4QIihQsre7mi775r0QmJje7AAr9pb3EGgAmv9L9Pmk312Z36RV9GAwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWzGdNlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R96ij2WG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvLCe2622649
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gl4580y5MUNHEJwOWEj8JqlFF6VhT8v0xAXP5HiybLM=; b=dWzGdNlWvPur7AuV
	wHKFTFMzbueYi0UM8GCGrN5iqai4yObnDkJ+AVw9gkGXZGBtmEpZT24i/AALt8y6
	14jEqlgLm+dQoQz5G1KOwEu0NI5X+86KLMtSkJm3esCLrVWSFzMrD2/JK3Zlyzgr
	ZVBoEMeumFZkBH86W/0MfTP+wGn5r5+Uz2CQld/MffDktKxeh7qEJhHlBwKh94R0
	7zNAo0+ToIueXzySxzMFB0iqYxjBOSkBM941tzSI9GbD6lkxEzAATSNYUHf+LZZ+
	WzAI8uH+Mckh7hKrbNRRptnUP5y0tnim/16BQlTM/xJ01IefDkVQNVHMn/GbAQrK
	UZa1UQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h0e4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:13:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a081737bbso82179636d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234802; x=1773839602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gl4580y5MUNHEJwOWEj8JqlFF6VhT8v0xAXP5HiybLM=;
        b=R96ij2WG6PyDeO3yB1eeqq+N5yiSTrvsYK5+4uJkEjPKUQPw7lWUtxjXs5YxaY2aPv
         O2qRVCCoqzxMzY3aKFFMR6199NA68BE9ut7t0SrAXgl2KQR8jbxP21z5tAtYw8c7Oer8
         OJ5hCwwx3k+vwD8+F+umvp1k26otXqaxGy+akqUUw2+AhFW5Kelnp3qvZJuOKL3ZlHBk
         ARauMDUQ3Ch9LhZNs2ZmYg1aO83tZ5Kd+Ls9WFWRC31eV3TsgU21P7oJPters9H1CHNZ
         zNJW3wVKfKop+pgif4uVfz0i+rNdjoHzpLm2OY+Tbjg/YvXm2jSpe3MObU0uaDY/vMNc
         0/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234802; x=1773839602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gl4580y5MUNHEJwOWEj8JqlFF6VhT8v0xAXP5HiybLM=;
        b=E21hIxVmH1rrijx9Q7w7F1BApIpoK3mYB9/Nok9bU8cGEt2KXVPmIXDX5bGxjzqYub
         OC3YRHRgy+uHFbS7ZSGasYXul5jKrWHEMLX1cLzkHgbs1JYrpwKSzHvV1uxqri8s1Xfd
         UKKqT187Dwxutcduhrhxpv61yaIfjR92lUZxkG2RW7dvkvZR0uE++5O6bNGbTXI5y3Ps
         Izh2/aqjyIfueN3TRmbFhAi2KfPq46F6JaZKoy+ay7ISURLzh9nBbSL7clf5WcrY5Qvy
         tm75TrD/RCUkPpYLTb8xci+/xQqz6AG0MCSCacTt82R9B824GpHry2brygL6xRGiYrBC
         q+vQ==
X-Gm-Message-State: AOJu0YzIsiRnunNcS/5tguIuO9Gi2FCnua6MtITTxlvFMGtzN2NoCoJm
	Xyt4FuGTgcBlQ7Go3Z7C2P+POYyxrozXRuogeb3pZUQOS8pIExFN1NG/XfmcUW0XjpueCiQ91Zm
	k3vjv5EeAYGIB6e2xUeXvRmiKwY0E6iHKpr3WQut2kU0nkx/aATZSTCKqFKEJGi0ebBYZ
X-Gm-Gg: ATEYQzzImGMmBrCO3HCzi3fywR7Bk/0GyJQU6oYubQkGalBVUBuUQj7rOXFhldyR0iS
	tG0wclR+Hy3av1WYghJXBXNqFctYHXxjQOCf6E47tNP4MjZ1p7mHGcfsHq3dESa3ZXcKhchCCPV
	oyzXeaT3onP6nCxJ/XEpsJwlWCHwdvTaCAllV0ClrcwOtd95o5/1N/8KzYEPGKiyiMJTxu4zOFr
	lOUsMsb9Co8PCQVIX/HQ2Rmk8skg7qtUYMlgQCrcVGKbzNOIupaH/zr7ESrjk9/urz12l4i3fS3
	xpomOUW00puuiUYcKELQRTylQMcoEQfGztc6CJCIiQWtFi6kI8Ve6V2tgbTek67IG1mAQ1AyGbm
	MFteuzb9+SiHPqF30I14yVH8llDvQA8x6W5/+EmB4GMtRRprBYpGaftq8FZnlBIXPqr83dmNaEH
	nH7ME=
X-Received: by 2002:a05:620a:4692:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cda197c759mr242849585a.2.1773234802492;
        Wed, 11 Mar 2026 06:13:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4692:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cda197c759mr242847685a.2.1773234802111;
        Wed, 11 Mar 2026 06:13:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97313230desm42322966b.26.2026.03.11.06.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:13:21 -0700 (PDT)
Message-ID: <3e5e1bfb-6b4e-44b8-a83d-4970c7019565@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:13:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
To: Alexander Koskovich <AKoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e5x3XaXEyhc4vq3KKjrDsujyqT7frwDc
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b16a73 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OWesRWRB_LgOq-UAHEkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: e5x3XaXEyhc4vq3KKjrDsujyqT7frwDc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMiBTYWx0ZWRfX4GPds+aPDt2I
 vhLJ01+6zms+9fOBOXyTZY+RJrKwBc5rV9RFL8//ZNudXXdo05I3xjbEeZ4VH2JVToIhUaS+FXc
 kER6VKXE2qwTaNLlivHXy3fx0InwyM+qci07gS2WFlw5ItfVME4kF5cWdKqXOD1GEC6krSUxFIM
 2tTPOiVUg7LfgExyb42aSnAEP9d9bpSGqPStp7qpy7Gzztd261wh5JMUIykZp7lOmEoLWwC5rW1
 cKfZQct8xfb799443p0z4C1j492bK4Vh7C7zKKq/RUY1Y3StqFVgfRYopD544C5E+jOYUnJY1/t
 j8MPMN04nC6nG7qyUWlhGE2Of8YmnzmeVLEzi+2FLRnGDLI4BZVhcKjB32p3QhH2GqXGiZJ4Tf+
 hBoKkaeON2raCrRdIU7mjqUtNHULBfEUDkVSjmbrC2VDkEAm2XByVUOYUZxYjMB9VwSUK5Wp/NC
 lkh2EWlJ2Te6MEJbCrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110112
X-Rspamd-Queue-Id: 57C5026437D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,pm.me:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96987-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 5:26 AM, Alexander Koskovich wrote:
> This resolves the following error seen on the ASUS ROG Phone 3:
> 
> cpu cpu7: Voltage update failed freq=3091200
> cpu cpu7: failed to update OPP for freq=3091200
> 
> Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

