Return-Path: <linux-arm-msm+bounces-82301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59DC6975D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 13:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B87822AE67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 12:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF21D231A55;
	Tue, 18 Nov 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6t1mYm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmWNjGth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9923717F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763470070; cv=none; b=eFPPM7DnJpCR0KcdCxqsi/GAm94jkRwD9nWdpTJ+JkXC4OCV9MHF8vkhcgBUoyztwsuyyg/m97s8Vpvw03ZoSboggmkq/bBhZFHxWcFNj70uc8umj/oitkQ/qpaTD7iapIEzS9JYlUv0LMcSXM23CRnW1bgo+Hv62f99+o2CpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763470070; c=relaxed/simple;
	bh=rxzzdyfw7bng541ww+e1ugj2yGFHGxAs0me60erg+I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qUGSs9v6NPN7n1uDzJppuO2pjp1XcX23nNcKeBTIfsnsm1hNt7neHJ8p2XcjVg5aomxwo/bWHNkzETOi055vLK+pd+pB+fV2MDmbSFzHlP1uWUr3xOz7m3HqExpQ1naSJhTtOd0VSlik41fOtXqHR+HQIrPaEjMOv10sNaJEoAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6t1mYm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmWNjGth; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8l7oU2755129
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7gavh6uoKBBotSDIpoJHKwQ1nIzxe+w2VKeS0F3xlI=; b=U6t1mYm27jWeRUEn
	fZml+NidCpzvzlCz87uR+m+DQ5W1w1RP4TTiSsnge2ytaY17kNoNpiEgQE/2mYMH
	b/nJj3U3IZm8Rj229fK1lvIVry6Mz6E8Nwfkp0PXVPuTAdRHH3CUgNi1yMnSrPzk
	raCCPsF5LlE5p7CSx/DAbwxjJoHEIYoiMqFJgpkMzL6IOiRSwUpSgjxkBPalCV4S
	RUzyvaFdRRUG/sfmYVrrt8aG4k2esovaPRzO0qk5sv1TFndcdIK+3Z0TeQ38sH5L
	kSyIrBrGhEclsgs9xmiCeMuYRS3pPBWJSPewGqxMAYbHlwufigBzDBklpgYSDtC/
	FOe7OA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj0nvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 12:47:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e518fb75so50980385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763470066; x=1764074866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7gavh6uoKBBotSDIpoJHKwQ1nIzxe+w2VKeS0F3xlI=;
        b=hmWNjGthkKTmtlyXRnY1cOM/C5w8fQg7vDJ61XeJkbqWf1lCmdmCGMDEfoG+YQh+b9
         pCEiy+5XkZr6uYze2b7VSvJVbCBLabAfMdZHXgwR6G7UeYYsIeUKX1QX+w9l2rVe/Iwp
         0SZVxypoedbxcYV7YF/YoPzwJlGO6OR4zFAMDM30VxqcCequCnASyacqfksfeDqqqYO7
         sdH+TXRZ5hx4klomVYTCuH/noVFBASVcNMruKrMefuuScfSlbYkxOEnOs5qA+gI26ifb
         MP3L+u9ApCJXkmw7j6e1O8f+n5wY9W3eRLYrZjLhKj99O6/oQszii2/k1I9tLKodkHKF
         lk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763470066; x=1764074866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7gavh6uoKBBotSDIpoJHKwQ1nIzxe+w2VKeS0F3xlI=;
        b=hFZ55m5JqLKoZurvlzEPiVaAOVs3y+YaKU2iXXpyIkxoLwcRoOsQJJbJEi/1A5VptZ
         PsW9pUMAmG0UvodE0kd3yEzHRCyCoV8kHuSZdqYADFp6IWpsQfPraT2a5apcXp6S79yL
         spahdo6ivy20fH89GRZfaiQj1Z/AiIdpKcxI8IEmOfm9Lk2g4Cl17V67zoGNrpbPBhgU
         3uiWvM8+cKcf9S/MUZF5wwQ8TN//IbUHpybakpcHbGl0DahCM31vwhMRIdhNatFL0Ufs
         xjAaxlrYCNqHJpQWFH3+Cw6l0NuNEgGh15sIn5Al1gVSqhAJI9YDTHTRNQAvj0ak66/A
         slQw==
X-Gm-Message-State: AOJu0YycGHxWiFbYK0f5mJJxmPdyHcsAqwdZJ5XetbWPRh4+ZhVbngv2
	x1Yy1aLz07uCSiwfmvo0OhYgCsP9ZpZoCWIvwXnF2/gg3YKwYythNF7PkW+09QN/NsgVqUSZAhn
	U2TnIoSOVTMFJCmpQNLMwgYVoJFY5CPgle8NHge8NE0Ylkm/3QjUK0a7vh/WdwsgmZtF3
X-Gm-Gg: ASbGncsDn2VhH/0OmnB+2knfcjrbJiH39MYZouHmdK2JPE2YGlKMu1DDggreexaM08V
	zXlgEDuYY6rJ3q7K6TS1iHxQDdp2/MzjEGLGXPhHLG5GX2ObY1Oo2QoCNhFgn/8dkS+ER16uL5x
	kX+Hd7WSA6h3960T/CqFgZIj0MDQXAUx39e5OgXYKYO9kmx4IrZ93CMhIzIiv1DNYTLjfEbf3np
	BsKHlZw7BXcB1UcGC7VzlvbYHhDVuqf9jIrU+WZbzhn6+BApLvnBLiD8bWpoInrrHWA5s5sBYPV
	tsf6JK5rGq9cTS7bCccwl8JgeUxDDAjCqn/mlDEUp6y9t+ht/fgNbap61xIyuH7LtLeyeg7bIhb
	2E9O5uLzZ440xTYuPc63JClsVku86RByw990CBTOiIHdNLSUoBq7lofSXyeY/Ww70GIQ=
X-Received: by 2002:a05:620a:3725:b0:8a4:247e:b488 with SMTP id af79cd13be357-8b305fe428fmr218066385a.12.1763470066564;
        Tue, 18 Nov 2025 04:47:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFLp9H2IEu2J/VxIAOY2qtEwtXYkolfMCNLrJn8gjT7ZmNv7h3ik3BwJNapF++HDOz1omL3w==
X-Received: by 2002:a05:620a:3725:b0:8a4:247e:b488 with SMTP id af79cd13be357-8b305fe428fmr218063385a.12.1763470066102;
        Tue, 18 Nov 2025 04:47:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1333517266b.70.2025.11.18.04.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:47:45 -0800 (PST)
Message-ID: <8f37d909-162f-4777-b105-e1f5737ed170@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:47:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-10-df4910b7c20a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-10-df4910b7c20a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nU5qJXJ4UHdJe6Xiap9k6YMYQE66cv9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEwMiBTYWx0ZWRfX1gHKjA/Wjr1Y
 i+VKBCkoNYDLrURreZO0kEV+n5yzGBhTBBKkF/ZcMgDVLgd+zxCYlQ6jgk7W1crlrh+Z1epAEE8
 QzZlITxdFExp7V0C1pLSr8aIjAmnHkef573E8NQ0QJ9+6jwpbu5MaS2HeWlhuiZkPVCQO060Zxo
 u9uD5BujxyLAy6EDC9D5J10HOr9z7AiEPWShzAcwikE/rCyQ/3Ty79TP9eWKhfOFclPW9yq5ulR
 hr36yzosEnChApC8IW4XvcVrKNWIOcrZdxpgWAWLuXKrrrC+y2tjYIQPH8lHe9cAtVObTQjRr0s
 Kbke2dVerd3MELRKHpXnyP2QK9SuvLMvxrqUirANqlSK86EO7Ce2Drh3nAvKcQGxRjQJCsfND8A
 DGaELu4F7Z2mvmhi1ctD2fR1XkWC6A==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c6af3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tQqT8VwP9WrLgrXSfAAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nU5qJXJ4UHdJe6Xiap9k6YMYQE66cv9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180102

On 11/13/25 11:36 AM, Mukesh Ojha wrote:
> On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> responsibility for creating the SHM bridge both for metadata (before
> calling qcom_scm_pas_init_image()) and for remoteproc memory (before
> calling qcom_scm_pas_auth_and_reset()). We have taken care the things
> required for qcom_scm_pas_auth_and_reset().
> 
> Lets put these awareness of above conditions into
> qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

