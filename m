Return-Path: <linux-arm-msm+bounces-112496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IWteOqFtKWrMWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:58:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E466A059
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:58:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jTbN00Jq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="kfIE/atX";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112496-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112496-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA3B33017EC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9482F3DA5B8;
	Wed, 10 Jun 2026 13:52:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013BD40E8D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:52:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099538; cv=none; b=RrvQhpVqNWWylsku7DxCtcCg+LzQs9GGyu6rJpC1jlWQt9icrdpP9vWniTT5kPt4DA3mCb8obc8WMeSpX8xk4Oj+lg/qvHZJXphXsSJ1ovw7hhFUSFtIy+xPHqrpTFE0Z3HcOsyw25sM8Tcbgko0ytLFf2GopufsbomvHoAN72I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099538; c=relaxed/simple;
	bh=X7p60vKSYFVtf9zaaGW5ALzNV0QbUKPyCsrvu09GsgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6jiMnj2iQxck+YyVZSib+96aEtx+leq9GlAA233KT6CnGwsLCgC5uAsK8lUdWPuDl8AM341XL42OfuWYds4iCIlg2bnRkyLmn+ACOejTXhHYcrvkE65+LeiERjb5rwmP95h7pf/1ycqhmiw87ygbaYPaQHWuXM1lJ6wbrQBO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTbN00Jq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfIE/atX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBixs1138112
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGXBjo6/TmiRcXkBy0wB760OqQYQ/wZz7svMuJEbpCk=; b=jTbN00JqmGgoqCCZ
	+XrlscxJK+AQbms/i6h6SJGN4ihBDHBt5jOnlmD5VW567vsU23Dg/Dcd6W4x4OZi
	+nVpF1k4V28ZUmJ3ApMq1tH7ZxjV1lUdZXB5ICt0KAjaOYYhkAQnaHSkvEgleclZ
	41QFWa+NbvSiUO76Ih6AfKKN6OOeGEIpLT25YYvd52fjiKZsudGxm/3bWE0hyTqx
	+78RTVYB57fqTtwWFnri9S8oioBcmgARsSWmEumfj3HtQHzTdBBeLrsGktzVSqkD
	LfiivvEx8eyoEFaTpUkDdacP4aV+6immx//bZc6TAkDBZZiuX0yx+MoYtR7giuFc
	67F1vA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jpt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:52:15 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c4b898e8d8so390572137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099534; x=1781704334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGXBjo6/TmiRcXkBy0wB760OqQYQ/wZz7svMuJEbpCk=;
        b=kfIE/atX9NGsZU8YLNuS8uNgebsJEPNhJ5wUzIwiiKSOrwnvN4eVyKVC6uiMCO/p+v
         7YrYw5NeurzLjoLaAwKoLV+BJNsU3g86ZOfU+tANGqVqD7coAQ4NT/lO0sC0AMJprEtQ
         Gurvebfbp4/jl1ivvElEk9PvE4fZ6dL4PiPzIT409q5yD1G0ViRqRzxQAwwHiUkJE79d
         Sk2pB1vNHChNQfAQrSpAwQWBT5IqPV/fEJjpfNUdvUIR9ArUvqYHSqLE5dVX41ftSLj/
         v6z0MuC1CmOL4s214n/KH5KJvtG3O/CjnL3rPVzKtqLXdm+fvmZxN2SVf+06HbntPqdu
         g7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099534; x=1781704334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGXBjo6/TmiRcXkBy0wB760OqQYQ/wZz7svMuJEbpCk=;
        b=ahaSeHbIkit7ojiHBx/bpw26ndirept5pu0LBkEXjOnXnBhgdJESfBnOMQDjyBuwjj
         q49KmAcTrjABNciB4t4MyB/3qcajPIou7gfxMWL6zN3DT5XS8jFfTmw0QW3lhRoQnnCw
         3FmseWGwENFuvPc1Hz5bPHSk2HLc8qHVLUz+ctHgciq/xON4ghhdQ9SUl+Liqm+QZbMc
         wqd9a9N1DrRRFMCbQ5eeYT3oQ+ukeIrywGHRJVkw8Pu6/ZtzTQWITZ6A+Fbb5HGbzc+6
         niow9syi4/o29ljHALR9Bcp8LnGJ0otKshc6Zzeasx4eotFSSHWfebT1L0/cTvL19h1P
         FrLA==
X-Forwarded-Encrypted: i=1; AFNElJ+8AAZnx3q30sVvg/1ATYPPwgSy6YMyX1RhzcpEs0QeDRHaO411UWlB6TDnOlTIup2aQl1mmQVOnrd6Ir7y@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQSKekn5ZnPxJBMyaZeZ32qhGmXd5uaoN4kkpmIB0QZnfQCI1
	5/Aiiun0vCKa28N6dCzcMoHA6IOltR0gmLwbbMuMFTk9Mbrm2ehBUjWEpZHiUb4I9R587jGELeO
	ywGp0wbO3155hZSU+X0mF2v6P15l/gAyonGl2qzPCIEV0dpvNzvOhtC9gjtHWFDkvdDfl
X-Gm-Gg: Acq92OEpClkEeGbxyT2PUY9Hm6Pqi+5dG4q4NVueX6WM9a8k2rVzIpr5ASpWoM+p2+d
	1s24QNm50jbw4rlNh0a/Ul1rOlgP/MbXEP5kXmSPbBKXS5ptJHvbIfLA8o5w97mq207rfxFMaXq
	sCV+eDsQL+H/bdg/qO2Lki8FD2q1hRo8xnO7yKDj94qQvjgD7QE39ZSqrlXm+OchTKlnyFREZEy
	B7kfxW/yYvBkw8Fk1PAxRO+tboYkL27Ab3WnMJuyWhbEVdEDNWc55lC5iCMo3ZwIVSwYcI+XLFM
	p8y09s5BxC4DWRaWWL/IyoMb0aJ484JEYuq8pQ3LZRSpzP0UZiu2i/uAwao1hgl976VCmIlRKqi
	zb9hF++5oMWK95KfzWI2uCLnq8USVB+Ja9Tp39j/6dl0ZtN1JddSOTTaK
X-Received: by 2002:a05:6102:442c:b0:65b:c17:7052 with SMTP id ada2fe7eead31-6fee2af191cmr3971322137.0.1781099534259;
        Wed, 10 Jun 2026 06:52:14 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:65b:c17:7052 with SMTP id ada2fe7eead31-6fee2af191cmr3971303137.0.1781099533817;
        Wed, 10 Jun 2026 06:52:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f358sm10108440a12.6.2026.06.10.06.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:52:13 -0700 (PDT)
Message-ID: <73a30753-527b-4662-ba99-2ebc3878861b@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
 <5eaea87f-5fed-4869-93e5-55c9da5ced84@oss.qualcomm.com>
 <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cacfl4livqlkuk2c223hgapl45ojd6hsqg5sqqd7g5g2q57kk6@codcnqhfz3e6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a296c0f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iWv2uGAxcboP7Le9rM0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMiBTYWx0ZWRfX32R6S0jLrpdM
 +77n52Xk/X/xr32KzZ1ZXfexIenuMAnoUwqJXS0ud9fu4JmJIpgXdwpsbvY+t87t5Z9/TEJmIdc
 XqT5y5ve2M+hNSMJu6Xy5wTBalrDlx+HnSmRMBQYLNxbVudmlnKpupruVQAJd76kmnmkBo+8hVg
 s8F2PRs0iW5DhBjmoT/igpUwLPzpHYnRXy5hJElk7fwDLaKxo/dVHSdMnHnOgDnsMBm8REoW2VC
 xZpCu3D7Q7hB6J4lXZFM9ImvLjqIazm3r4Opls7F9+XAirp0xv+KoxgvMGbngUBUUQ0dYzwbKKr
 qVUyCI8hzXHF3Vn3jyn3/1Xrf2vJ/Qd6RtsCgDedDXDtvcKl70f532u7xza/5Jf4i+DPr57JaBz
 NUBYBZMGRwsFGsNm3EMId+O6QMYOIRFuWg8tQzqpq4/JgDkdkaJEtbNSE6NE/X5s8WymuSlV3Os
 8U48AzzuwcrW2tjDr8g==
X-Proofpoint-ORIG-GUID: A2LADiSs51awWlwmGdhuNIkC_Z14Mha7
X-Proofpoint-GUID: A2LADiSs51awWlwmGdhuNIkC_Z14Mha7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112496-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E4E466A059

On 6/10/26 3:34 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 02:24:24PM +0200, Konrad Dybcio wrote:
>> On 6/4/26 6:22 PM, Dmitry Baryshkov wrote:
>>> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
>>> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
>>> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
>>> MMCX voltage levels.
>>>
>>> Add MMCX domain to the Iris device node.
>>>
>>> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  				opp-720000000 {
>>>  					opp-hz = /bits/ 64 <720000000>;
>>> -					required-opps = <&rpmhpd_opp_low_svs>;
>>> +					required-opps = <&rpmhpd_opp_svs>,
>>> +							<&rpmhpd_opp_low_svs>;
>>
>> So the computer tells me low_svs would be enough for PLL0 to generate 720MHz
>>
>> Is there some transient dependency that bumps this to svs?
>>
>> Your changelog mentions you altered this in v6, but I don't see any related
>> discussion
> 
> There are two sources of information. The "clocks plan" and the "pll
> info". For some reason, the clock plan doesn't reflect actual PLL
> requirements. See the info on the corresponding PLL type.

OK thanks, now I think I asked this already in the past..

still, both point to LOWSVS @ 720 for sm8250

Konrad

