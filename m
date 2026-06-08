Return-Path: <linux-arm-msm+bounces-111677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LDUEJEZWJmo6VAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:42:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F076F652E21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 07:42:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hR5qDZcW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a5kWCiUL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 258EE300C996
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 05:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F94379C36;
	Mon,  8 Jun 2026 05:42:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93551EEA8
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 05:42:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897344; cv=none; b=sTbF9ilkAyhuY9D9mtD+v83ufa8W8JBrrxXOXM/6hqyDwP5OghBD1Utsp60NQ1jdznCiCzf8D074MjONczOONQFVAIruEo2L7suEKqLYYntYr+y05SdVsf1z+N5dnA5JCAWp4k/IEwUPF3p3u01VvZCTXE4ITeNF7raENsHx9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897344; c=relaxed/simple;
	bh=2SVr+LQoKjw79sAsIlmnjAWviMMqD7mQYrJApeHgLGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvehetHPdr0DvJ6CQmcZSQfMuR2TH5oTvzBV6ItQXs/pMQcTwHHLtO7rXOgeU/LvyCnWta7bS7F1El1X4+J29z+sVGJWqpLhspzqyU/Bmh7taQ0jMXRtbEpCigb88v9XmCIk9tUFGcvsYgw5aXP280+ANUZ05Ce1N/Vc5ymQUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hR5qDZcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5kWCiUL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Fu682005223
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 05:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufzga7I+3z8dNmCbn4BCdf+K+wlImg+ptma/5JYe8rg=; b=hR5qDZcWrXC+xQzl
	P8Sk7oLb7CBCBqsjwOM8rNWjxfrxvPLgQvSocdvmltik6PU0ywkw+Ce1V4yO94Rn
	u9BS56x/lpCZqPsYPOzXrE1ef2NgOk1O8hNCH7w4rB+AhwpSMr6aOF9zeLp9tZop
	yqujksUDezZAj97s7BhinXFewTL7/fo7HShifnnCv/xLAUDHGBdLvawcIX6MJJLn
	9nf1oq0yPobzc18BfDOVDgGc4HVVTST0kt7SPnayxY0jlV4tjE0GZbLPGe7mqZ6B
	ndtFPuz9odBZ2WvlJ9FriUVzN+6NTiePOQ17NEreafiyGMrNirBLPm3S2Ras0OS3
	/PcoKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w62uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:42:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2beff6b6e74so41018785ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 22:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897341; x=1781502141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ufzga7I+3z8dNmCbn4BCdf+K+wlImg+ptma/5JYe8rg=;
        b=a5kWCiULdI0M1B70/xKsOlws/JqysXPgj1wh3NM7ktuGCx2uYmFMR9kULz6lUZbfOS
         TyuCdP4LWNoirwmBtuTU84Oz3H1qfxwSNtOwIcxH/LAjEiBt0CF6D6jOP/cvV8J5y/nL
         odawfSSzb+mGf8KsmDEpv0hZQeP7olh+T8rPKZo1LqvUPGp7qQSjzrel24IBnZrwmdb3
         X6b9i6LY4CqZ4BuPkn1DknipTx/EURH8OUR43EPsu9Ib7cCWei/9OHUNYhkajgFczQwH
         IZGDI/yrdebqDkSo0pQ/WEKlpf4xL7KoyNx4vlxFUyMoqdW7VHVme65UWUXJhBsPmD8B
         TNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897341; x=1781502141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufzga7I+3z8dNmCbn4BCdf+K+wlImg+ptma/5JYe8rg=;
        b=QhNy0EC1TF/fYzuDOiLnY7SjDeOj6nM/G4DeupwtwoJotnQCpOPp+7l0HIfz90DMlT
         slPCuwlaeErz54MfJF6JS25+EKyN9WnhJF+0fQc2NkJnWUMTtRaeVY7dyI6tPqvrhMve
         FijfTskpk592ZW0gchHwPkfpa4J8FzI20JfHv66A5RK4d5JNCCjobXay50MbA3x7cNC9
         pZiWOCIfrOET2g+hlZ7lqI4C5rUeAqcQ6ome3R660o07EKZAPHjWyA+r3hADHKFR55SN
         GuIA0MR8sVq9syaZXZZaQnxGsimgJ00CjAB3k12pD0ov24hhdpkVvpGQ020Cj0n6DFms
         tgpg==
X-Forwarded-Encrypted: i=1; AFNElJ97AUzKKsiyYPgV9LVDdgA3mmJa+m3yhoeDcksjmgePt15jCXwAiKUusrQAdT6XQhGzgi7+LGQoDML/SWs1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9f1UvHCK/jdaE4DOX6DC0UfYUhw3/o7mhworH9UWmhX2/cVvF
	/F0lEzmREfzWhe0YVky5o+GCWHBuFFIk52XGwAdc0tEsROKaXCnIkUA099XAmwUKZmQVh44KuCQ
	beA/2gsgUlkHCRhaV3CrIrSzYOJnmUDkr0G0U5WirQo+LZKuQUHdWZ5qwdS4bHO+4XT00
X-Gm-Gg: Acq92OGbZtcaqbKN5Cy0Tfod7HtpQizx/Gany+dK5f1wHOgofzjIpd964PRRHplKUOo
	Wh0UYGocTEP6EEh2NqzB11qD7yHiBOUNL5QeyWx1a1/zVg5wm7EPee0vGVW6Tp0OH5U3CAXRqLp
	5AoMNBzMLE0kmBqobn9I5FkzmDH3RrXTtRWgIH1z3l0LesXdP0jTVIcqB0KvqyQPAhi7eL9NDar
	R3Lfa6SlwANL55uEAFd6sb4cBxxWHJN26DHGAIdezrXBGIkWeBfRffyMCVkWI+N5CuHf0w+CA/u
	zyDEzwwkBfiRtM/Jj+wKS+flPs7m1DnwcTfxkSEXZRplGeJoEdER2Bg4/2u6gdUEkrw6bYO5p+2
	LAZIkyCn4KQVG2zL2pVizoUaTxo7KBF9uACYRZJIbullOHV9z+cmCxbcPnZNY1zhw
X-Received: by 2002:a17:903:2987:b0:2c1:88a1:9830 with SMTP id d9443c01a7336-2c1e7e74ecamr162938095ad.17.1780897341526;
        Sun, 07 Jun 2026 22:42:21 -0700 (PDT)
X-Received: by 2002:a17:903:2987:b0:2c1:88a1:9830 with SMTP id d9443c01a7336-2c1e7e74ecamr162937775ad.17.1780897341107;
        Sun, 07 Jun 2026 22:42:21 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm40507255ad.42.2026.06.07.22.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:42:20 -0700 (PDT)
Message-ID: <29763928-2301-437e-8787-916930b64a88@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:12:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] phy: qcom: qmp-pcie: Add QMP PCIe PHY support for
 Eliza
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-3-6b44c9c23d5e@oss.qualcomm.com>
 <k37nby6lnczb5qajku2shpff4rsisyynlfmzu46lhojl5eiwqo@wkpy2tbeoa3b>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <k37nby6lnczb5qajku2shpff4rsisyynlfmzu46lhojl5eiwqo@wkpy2tbeoa3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u7Rt9R7l6E0cRtTyUdhraWs4Ft0_6iiG
X-Proofpoint-GUID: u7Rt9R7l6E0cRtTyUdhraWs4Ft0_6iiG
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a26563e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jbukJSVhv8iEu2CO0E0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX5kxKCYA+onDL
 wIrftuW+qT5uqkG8Q/TosvyxUqdvOVis4aDBI5Ezc1PWwWE+I5KMOZkQssrHAcREpR7qg2gA/8P
 HPZy/rGfJ2PwM3fOojqrN5FTTvZiXiOCtRJwo8qHIysXDK7v2/IkxlI8EiZuMdpgqEnzy/+z9NQ
 eV1nLPnYNZBiEITXqpQGrGqje/9iJtawExafCuUiFH6rUhEZeCPgvJqnlNimJPHUYRwUATYtMZe
 wzlPOwXePpz939haNA6O45hq7MnxN1lxbsCElynkUbpdKcFr9Q+PeBD7T1y7hC0atmV1eqKNk9Z
 Kbg5REkaUWVxObY2xgZXwqXkLs0E2YK8g/bXH1ZmbKJdNYWObkMjN7VoyWaLKhkq5wmUuEYD4DW
 edzAf0ISPWflg8GKiESQv/8t2FoLcDCkSTR0SUXNq02yGKi52SUyRmCc8C/AIowRXgZmzZF5MRP
 gkbwYu0VVG1sfMWpUmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F076F652E21



On 6/7/2026 3:59 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 10:59:46PM +0530, Krishna Chaitanya Chundru wrote:
>> Add QMP PCIe PHY support for the Eliza SoC. Introduce a new Gen3x1 PHY
>> configuration with Eliza-specific initialization tables, and reuse the
>> existing sm8550 Gen3x2 configuration for the Gen3x2 PHY instance.
>>
>> Also add the missing QPHY_PCIE_V6_PCS_PCIE_INT_AUX_CLK_CONFIG1 register
>> definition to the PCIe V6 PCS header.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c        | 139 ++++++++++++++++++++++++
>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h |   1 +
>>  2 files changed, 140 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index fed2fc9bb311..257b4df965c3 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -198,6 +198,112 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
>>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
>>  };
>>  
>> +static const struct qmp_phy_init_tbl eliza_qmp_gen3x1_pcie_serdes_tbl[] = {
> Thisis exactly the same as SM8550 table, except for three extra writes:
> QSERDES_V6_COM_VCO_TUNE1_MODE0, QSERDES_V6_COM_VCO_TUNE1_MODE1 and
> QSERDES_V6_COM_VCO_TUNE2_MODE1. What are the default values for SM8550?
For sm8550, the default values are different than what eliza is expecting

*PCIE0_QSERDES_PLL_VCO_TUNE1_MODE1*-  0xA *PCIE0_QSERDES_PLL_VCO_TUNE1_MODE0*-
0x53 *PCIE0_QSERDES_PLL_VCO_TUNE2_MODE1*- 0x1

- Krishna Chaitanya.

>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE1, 0xb4),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE2_MODE1, 0x03),
>> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE1_MODE0, 0x24),
> Other than that, looks good to me.
>


