Return-Path: <linux-arm-msm+bounces-91670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAqaErbngWl0LwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:19:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22FD8E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED3AC300FEE9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865BD33E37B;
	Tue,  3 Feb 2026 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRKJPBxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvPQWST5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C6B33E358
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120890; cv=none; b=qlHZRj4ls/lnxLXr5K5Bw3YUY+FtLSHeXKsmQMrBjjvrI7J4Od4oAOCA22ZIBN8j6fpQBsm6IM6ibOUC5QltOq+xon7qpbuN8pW8ePoiq2A5GodOQiaggzP8HwewekRPXuuEK0UVUOtgOa4fc/UycB3ts7bXHhE7Nd2pE4hTxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120890; c=relaxed/simple;
	bh=f2jxbDBMXSZTUZA+fhe3W5fEXPcXuzuwd9OFbZFi+aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO6W+16zW4vhgOH79IepwI7v4aTnku+2hW9vTRcM/WltmTzP8Po1CFDEcw1GtA1YWewdDuJ0y2Q/z5ACMFp5/fPRENMhmaUdEQeKwwqFq/k6+0M+htua/NLa9vnpujovsgu99jowxt+kyi4gIrj/za7NyOxKhTUGsRGSiwrCAQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRKJPBxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvPQWST5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613BLvZo2847379
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0sfhluVRaK+7nfABb5VFYSmnKNequ3uhG7WHjNhsCo=; b=IRKJPBxXK21Kbtdg
	7/lM3CvcoiOV5N6Q3zMnyohn3kwx45Nwd9F1+fxycsMwkP9CbVlrfYPOfJgBsS34
	DHgtcsRrdnjtgC5Ux7DZX8mkCHXF+qlHIqUgsGArJCYD6Zk9YWL2Xl+R3H2sKTfc
	i+KJPCpNYG1kn6grtx1cGJhS9NzHpqAMX+wzBh13PSxraxGszLRQRFY4OcRHf23+
	jQuD644CyFvGE1o+LEgBo5s3Gt03EumpnpU51Yo28IhOi/78biWlLJQ40y4KLhVp
	YCfz2ztmkcexSDWxHHRPk/7Fr8FWsPuIczzNb0wiPA3Gaqv7u1z8ftxJahWUhgbe
	Zc+2rA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3g33g4ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:14:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so103978885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770120887; x=1770725687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0sfhluVRaK+7nfABb5VFYSmnKNequ3uhG7WHjNhsCo=;
        b=hvPQWST5GI7LFpa/YGhFB/XBWKmFhyr4Wm2NGt6AWavoYky00ufSrtLT93lnB4CvX3
         YdMWd0F7OhBP2iy+aclF01TQGu+y1bZvmDT+5ZorMjqIoJa0lbUpSuU/ASHm0BZFCYk0
         4fBrRPqWM378M36sArl8d8eHMZZbdKVP1ptbP1wxJXpffhVeuXIPUFMZGzmfc/ECqXe+
         Bs06dKSZv0drsQq2WN7DP8IxWs/iPphs3eVEgHiRuBKgZoYpElRbT0wMRWWpou06+1Vp
         jpoR5EzoKo5V1d8fsASQUBLzpWWUu309UizSe/SR5avRY5NyUBgP1LbimMHDieE1dcEm
         MG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120887; x=1770725687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0sfhluVRaK+7nfABb5VFYSmnKNequ3uhG7WHjNhsCo=;
        b=BINjA2yqzA81a3ynyHHbVV7tt3de3FpShXiO99Ogy4+v3Q9oXaWiKe24aUB77w4eYN
         TCJkNfgVjmaAbKIu1qlthbi5JCiex9Z413CsTo2ET7Ku3jU4OrMMBGEZubZHLPLj0Ene
         RR2VhfCLDxBt8uChta5r2oAQweZ4k9xDWJU2u7JPP9XsQNmFkPvoNj4wxz+HSL6uZ38G
         1R+WCoDoqR2KCJbGJo/QHzItskcUf71RntFyd9fAJC0e/N1wEbrM0P6Kd4qfgp96L7Pd
         0E8xriFGVjWL/BEbVys9hbJO9HQSDGC+DJkZp7EmJ2GjARBJLk4dNd+/PDpy/956bQSD
         LlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVajWCyxh5Wu+Z4tT7s3EFSiFDvsPxvupjcEvSwZfSWClpzHhTZBpvI1krEbMXhpiDyvwkowsQ8TBfmqld9@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQ0g8rzRqz/mBa3UvMOYHtCT1ZEp/9j11p1ZLWYrDb413LOzC
	dwX0S4bwo+yL6jur/7Eyl8XXrwz5M25NExHDi9cxQvcAJDi7pRyggsw7b7nC7ECxyJIA1jOthxr
	lehBeCydKw9wWB1Fa9PMh7Ok1A/g4yJi6LYeQS3IllmgiA7wJISON8sWEYg0ktVjwDbep
X-Gm-Gg: AZuq6aI5j0QdlBLfk3BhjWOgGaNSvi1nmzgmuU7fCkgy7i9VnYBb0mnq/jODUYHUjNJ
	OlhwNvSS8l2R9akYTGmhGPlZqqCsVrUskBQc5tGWKLBVr5VzzpwcK8QSyt1QrNxCL3Zt15DtD9R
	zYFQFePkVTdXDjyVGlq0vTI6HucoEmgkL33iia2BEgPTdvVG6qSpnhxwsRM6oyNsQRHZDg0HSgD
	BF74rW6GL9jOCb3yncdPOTQzS3PmKrC2ROrWbOFsHwcUV/pVtmDy9GKAN+uQqdDvejoFxe2K/Ci
	RUX4+ix2zUUozfuQrBYQ5FzszdFeyDGkE4+6ism+7NutwcjsSKmyOqFbTxqHG1G+JaOhTaQmAqw
	+2JB79YkdlQmwQtnx2w+PbnilyreSKh+F6KyLyWLqA5/Q7AhvjOHWLvSnyAEOE7vbqEQ=
X-Received: by 2002:a05:620a:17aa:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c9eb352ba1mr1354436085a.11.1770120887413;
        Tue, 03 Feb 2026 04:14:47 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:8c6:ab77:f95e with SMTP id af79cd13be357-8c9eb352ba1mr1354432785a.11.1770120886907;
        Tue, 03 Feb 2026 04:14:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de8c93c11sm849299466b.28.2026.02.03.04.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:14:46 -0800 (PST)
Message-ID: <540cbb53-1028-4f17-ab83-5ac4cabe3421@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:14:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] soc: qcom: geni-se: Handle core clk in
 geni_se_clks_off() and geni_se_clks_on()
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-5-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-5-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=6981e6b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qVim3Os-OfJW7Cew8TEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZV_j25jeo9zDFpH9cw33gUcIvX7Ryah1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NyBTYWx0ZWRfX6i6Ovu+pEJYc
 UiRQ9lQn+pD5PeVeCK2/3NTic0eBCluO9dHzsykQhUynnA8plRtAka005T6zvSIUxEe750n5bzo
 dxYVzYoyEGDTQxUYnNzkBZ6sCjdMKm56baX1JMH7UxF1N7ZwBirc3AIbKYoTE1nXhFR8yxP7rGS
 Syi05AFszKndSB2E9JTlY06CTzq1WOWsp4kGGK00GYn4dXDOIowtRBT4XCusqtbQRKXXk0D2B3l
 1OlVkRn77grLSWks3DtjnNtofckeaOmA1t+NJ0lGkQuyAsV0C4twLOLADrceR7qUX+EKyReAvCM
 ZAJIjv3Yt0H6XFpL2laU6flQT8+AbFqofh4Yds0pg4Tg0ENtdkrNyvmb1/WguWV1460IbZKd7dm
 z8x5oIVepXKgrEZZDdVVAzewiQlxSA12AInvkMtPiyftFYV8//7Vr/Ebt9auANkMrI6trqs4hMH
 KbNJV6WMAQ/e7GzpQCw==
X-Proofpoint-GUID: ZV_j25jeo9zDFpH9cw33gUcIvX7Ryah1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91670-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E22FD8E6C
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> Currently, core clk is handled individually in protocol drivers like
> the I2C driver. Move this clock management to the common clock APIs
> (geni_se_clks_on/off) that are already present in the common GENI SE
> driver to maintain consistency across all protocol drivers.
> 
> Core clk is now properly managed alongside the other clocks (se->clk
> and wrapper clocks) in the fundamental clock control functions,
> eliminating the need for individual protocol drivers to handle this
> clock separately.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

It may not be obvious from the context, but this core_clk ptr is left
uninitialized (because it'd only be assigned with geni_se_resources_init()
introduced in the previous patch, which is not called at this point)
so everything works out

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

