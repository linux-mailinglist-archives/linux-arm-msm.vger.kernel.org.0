Return-Path: <linux-arm-msm+bounces-91004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNcwJm7/eWm71QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:22:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF0A1256
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D2D73031336
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14E82D9787;
	Wed, 28 Jan 2026 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3kF+9bK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/eaypTn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CDA25EF9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769602755; cv=none; b=rwpNX8tQm28794+QUDJQrwv6JBJ5bHu9TpjTLjy/gAoQGpsfoNkqxHoGNePtQADy5ZNCc7UwaBE1Z9TYoiNI9fB2EJL2Humrhp+B4Jamb+JGkug2mW5LjqeTNeT3kgJPM0zTnGyp3AdL337eK1ZAyXrqdh9Nl3KgtJeWCfQFi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769602755; c=relaxed/simple;
	bh=xMwDGOfD+QoB+El1ETa7HX9k9SyOvEQUTcCti+zDsA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7kF/Xg2YKb5x7tlpszHifIot1JPkS2itgDLI9Dwu+Lziqew7LL7NP3EBkB4azgtg1o0HY92bfnaAeNIbNdzNMJLV5tCcFb+cvZzO9G4Oe3B07qHSdnjjC++GlJDlA17UrBqquWmK6WRxr0I7SSTURB9Q92vRu1yNyEWWhCiWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3kF+9bK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/eaypTn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92879811675
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uXV+Ct9oIOf7uhe11ZAvbv0UFOCyg8KrcxcTo0LHjw=; b=J3kF+9bKz5m9eVZ3
	0Ra+XC5nWhiU0P7r9M/t53gJQT4nAB4ILifRV/nJHW4opPrEX+WcaJcVlMpBVCeJ
	nJ445rOVAcG3r0eFAhAJ5lgINjs9JB+AdlHrFusKE6lg/CFUDFtiCUN/USvug15l
	RWH7fjxCkoE9aYEjCizjzpibf/epH1q1guxAnYSEhDqAv0agYy2VwsDm+2rrUnYm
	mRZqpSE9KR+Opg+jSmJFsdPZPGq/0m8496RL+GPavaaYeAx0hRExVgkRyCJXsxSs
	U/Mq3dSI8/rtugel7pLvLUaylbxxlzjGR/syxIhXIEL6mntMdN5G7kE1nwWHiVwc
	fxJO0A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbjdvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:19:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894662cba4fso19147006d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769602753; x=1770207553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uXV+Ct9oIOf7uhe11ZAvbv0UFOCyg8KrcxcTo0LHjw=;
        b=M/eaypTnpLG7zfAclRd3ibKdzMwLGQ3PCxUonG/AxqOUtga8DkTqMcfXc2VBORHsjv
         HGnYUcsRK1j3J6E9nfvAdxv5YG92kc84Lr6K7mq99gHHnCToth+7FQB+mcp4DUe12az7
         gNN3XGlvMcvQJculqJeUwE7zhJYkAStf0I4kjAe0+i7Fk5tsRXZXdav1z8IT1DkhO9m/
         5OI7I+M48PvL16e/Wrj+r/jB85deVtAkMekspABXHNdGUp0Ryb0Z+qSNjTmY5lG6UIJN
         3jaIxvTk6UxmQ6h36eHMYQbh/TM/AwuN4PnX+7l+8dChxCQZUewuvYHqqhErihitKHSR
         xk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769602753; x=1770207553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uXV+Ct9oIOf7uhe11ZAvbv0UFOCyg8KrcxcTo0LHjw=;
        b=AJ+nSy3JBfCzKGW0yl4xxMlM9hjLvFQwfhTuDqXO+94rtcBcf2UpHpNt7WrZhi8TcO
         pDslAJuBrXIJ414xDT4PJkS5I9BQ/WKrhoz5EEV63G7jVf3POo6XBWPezIfQIZGQT71t
         xjrzA4DFxcwoBjC18RRK0oGEz8igTkrkzmCusBjdvNNVyq5HelL7DRvgPufnqqTqZwM0
         ygl3rotRI5OL2gUPgyXIePvpsdmWXEOpCdbnjlSb4Coj8M1rcdT6olW5e58/sBfzIvpv
         odF119FRCoUtUv3R+C0lb0bAXirY7yWL9FmJmMx0TW5b7mNX2WgJHBN5nQpiEx6dec+f
         py3g==
X-Gm-Message-State: AOJu0YwQeEHd7hFEbfVnaUAUzRMmUlJd+99B4CUnkmqzJJ+fHVhPIX6J
	y4y3M8aqHfZMh4CJf0rhZZommkdl5z+DnBvXCd2zMZfJe6sIZjQ0Mk6ZxFufohECCVJMfXH85Fz
	qsBUSBICRcfUeXHFm0qvIchynI+DfApiK4ggIrm44h7WbbW5Y8C7ni6i2ou1Ongo1jgtz
X-Gm-Gg: AZuq6aKRgN8iqPVCQYxBEO8m5KPnF9cNB2WJ/lguzNr1+r/+l4O7p7mMXY2WFOBAJtH
	KTHJIrFWS2jbjyabnt7Sse+KtjA/O7+XwBfPe5hdRFWuuMXvp3Rc1VBLLrja8pzTQVkIvpC4lDn
	s7EfLkYid1VAsogBidUh/45WhuzeofEFY1ofXB5VvKuF+Q5E1lVMYXZ2W4Ss7GqZ0IY9Ik+/S2p
	KMg6OVuQgXEhAoPlZbE93MzyngqxGP+BNalYzouGTX5kQVCW4u6e70F3YuDDfbYsB7SeXTt+FzT
	6nbKo3okvER+onSNzT0umfq10trhoerA3yT790CGXJFKyyFHSumQNnJlDlVRgc62fhGrXiyixBw
	Ctwu73z1cEy9/12FXSdUKy7yQsT/6lqQgV7UtoQQKS2M5/eAZ6LyaI3f//toNWRqbWn8=
X-Received: by 2002:a05:6214:6117:b0:880:4f69:e598 with SMTP id 6a1803df08f44-894dcd0a0bamr394766d6.4.1769602752697;
        Wed, 28 Jan 2026 04:19:12 -0800 (PST)
X-Received: by 2002:a05:6214:6117:b0:880:4f69:e598 with SMTP id 6a1803df08f44-894dcd0a0bamr394526d6.4.1769602752320;
        Wed, 28 Jan 2026 04:19:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ac0e8sm1431956a12.34.2026.01.28.04.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:19:11 -0800 (PST)
Message-ID: <7a3541f8-079e-459a-9f30-cb20002e75f8@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 13:19:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: monaco: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
 <20260127-talos-el2-overlay-v2-2-b6a2266532c4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-talos-el2-overlay-v2-2-b6a2266532c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DS1t4v9u4Q-6_bu3AFWKnfjR8i2ExX2a
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979fec1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sdnczi_gjX_ezsEsx7EA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: DS1t4v9u4Q-6_bu3AFWKnfjR8i2ExX2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwMSBTYWx0ZWRfX2dFuij7Pdrx4
 IpgAFToWsmO1ZMRf9HrTrnDG750Cm/fqPBwUkD9DV4+sREzZJ4zzBX0jngQCDpDCUjXKJUQbKd8
 yp5+TV42peSk3XmpcamE1Q5ec9zcX+SJ/69zbvEynH2eJwQkyqXVwrlljNed14buCLc1vRxMM5P
 SIO60o0vKhn/AjYpYZtmpUfLwrcUI5ibYhIht4FC1KfTiqZ1kL2iGQKCiGezeKKkztAzC2Ectwm
 3dt7DQxlD7o9cYVMetVGLHU6sJoY1gl1ZMDTRKku6LoHWDK+fIxkX6GAHyAceXLhgJ4KqUjHKj1
 fDMgFEtwBfKyHlNWavGrbK32ry/dBfbJQsjIrhpsaJFhGwablI58aeDB6OUm4Q/3fZ4xpZD2MIn
 cumlQ4+iMsjpjDqYCWb8VDjsh8LSQkOU7dLO/ZhSgwO/c4kRWmliJ9YFg0Hwr8rXPQ28wsS5RU0
 tMWVbWuQH3ndXT8Z1vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91004-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7FF0A1256
X-Rspamd-Action: no action

On 1/27/26 12:43 PM, Mukesh Ojha wrote:
> All the Monaco IOT variants boards are using Gunyah hypervisor which
> means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU streams
> are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
> by the consumer of this DeviceTree. Therefore, describe the firmware
> streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Monaco IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

