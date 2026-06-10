Return-Path: <linux-arm-msm+bounces-112489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SmlJIhqKWrxWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:45:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B29669E2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:45:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LQZpXydL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L0tpZjCC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112489-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112489-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F339B3008697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E259A40C5CC;
	Wed, 10 Jun 2026 13:44:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF6402447
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:44:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099083; cv=none; b=C5e30gVLjEJdEE0WeBeVIjcMObxYeqhyPjL8D6wTRl5PcGRqvCW3BIjF1eI0uJMDeHWedmVolJsuoMokXoGPs/nMujc76d8Uhy55m7xU2v6F8xcvVpSSOFxmFb4TR9RlWaTsfpdUs4xdBXMS8O3WPe34eDFjpMvY3eGVrfB9J/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099083; c=relaxed/simple;
	bh=CdfnwlmRSBV+figoFl9mNT4ce/sY0fnUNjgPXon7xVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWg+ufd0j9P9LIiavB3/moxVnpKTxI4HDNj7frjE18zIL/z4y2wb08NgrvvYNHb/Tqv7iJRvRNg/i4w1s6B/T+5EXyBhHlFHVs0H03P2BluJfAPudIn+i4qGU3CARoq0H33MZen3UYarwYEEgZc/+bPf1uNle6lzHSAk7ZZUnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQZpXydL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0tpZjCC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACD2Ye1599621
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=; b=LQZpXydLGiXepNhg
	SWI/+ezHS7zEMl9xyCRZX3RMYEMT07m4gcgw72XSm95oWad5GSMrerW1gPnXr5of
	4Gvpm+z4f2oFL5r9Xc/lj5L4EVRnWN4HpSq2FUTOQbsxOWe4vhjEDczGb6pWv2VX
	k7Ipilb/fn5GkUdJmni3PQiIWdJvnpaSvyaHQ0UpB90O0Bodq7DmvA3JGfhn3K1g
	6YquE3BVhOzXvnIiX3vTouYiBL/Osfg4uX2ea08WktCWY2LxAKrY1gxfT61LtsJ9
	y8Uo6lMU/CzzpcS0Z/2CvAwNSOncShIJxKOdYxiKB5BJrPjEVms1ByweVZC1Tcpv
	x5vMNQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sehmv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:44:41 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c9239a1dccso317939137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099081; x=1781703881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=;
        b=L0tpZjCCp3PwGJkaFfORc56XfPwAsxbLyWu3zmjTO1Yx9xSQEfry5dClEYMmY9o/BD
         tVc6yLtHYHeJ8no3E6782LK6Yj2tq6mtlPVs5WSsfHZSWqHU0xUR1zmej/wcqVWIGOAb
         VlsqGaxSBkRXMKCU1C7qaMrr6meKAiOVeZtKsx+t/6hGC+zsgt/JYy2LhWHRikxQtRRy
         vp8+cPJ5msRTvX2VuUixbSUWG6dzS5CProJrUkpMDFPWP4ekGqC2R+FHBSNSpEEWeIA+
         hHtzkXPlwX2FuTn+nRG18BEq3f7DjMrmmHpXG7gFyC0ahpLeeuVpMOPTSaf1YbUwbC1V
         ZvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099081; x=1781703881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kug53bNTwtfaBOBC6lkpFkpl1cjnIWTW3W0ddWiIpuE=;
        b=Bkmg/UVaFHSmVhzEPsclG0lcbtZTS6qx5dbRtplhUij2okPI2AWu+pHWVfGFpe6nFP
         E6tw6o0q3tBiMhbMLPh0SCoOH84volqfMGaZ6I2JiKQXiJlNThl64fbRRvibVGxT7BkN
         op1bkkNve7YO2Jh7gDTjwTVpwBZwJVwt8vxQGCRFXcdIR0lIMfuyUq2qqPqSH1wI/0Hx
         +knXKOYPg4pyKUUw6LTkhnh+iAxnNbQTzJXL/jt39oF9WEckMneCUqATQr33ExohjByu
         yhqYtKYbJsBxlfJCt6bZQ0r4Gk42W/gjOhjPWhXCxweDkFx8RcMUC+crPHtctYN3HqLr
         NGxg==
X-Forwarded-Encrypted: i=1; AFNElJ+LiadAlcHGccuKxb2Xtq2siN8Qim8M7/dQquYNJA/tKf2d+av4+gFr2u96BJxoxTZ2q8yLOp7wSG8oTnh+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6bJAMYN7CJHOd0nepPJm/hrQ/Oib01kRf197DQSMTliGDRhX
	sECa8sv0sjMLqbzBQkcQgRH/EsbA/MPoe+18hy5Q2zhA+n1ezdiptxUH/S23OMGjqjV+fStXJJq
	JQ2nxgX1zMZQsUdJgElJJgpInr1EActR8YTF3Cbgp0ZBmRm+qAYhbza3e6vaQl7WZ2eOo
X-Gm-Gg: Acq92OGK1HraysRXUUAMy5boV1myvljaxfVr61QwpPqaCJ9+p1sdVYQarUpgvgaFCHT
	HQhBeSfd3fsmPEXbdhkF13L1zYAtPugY+VcKnNGvP7xk6fem/IWm2KC/auGIkP/0KoAcQES0foE
	2jc44WfsbAdpnQLdqR+FaSJXuoIBHlBBrauSO4SlTlqa8xeqT/1bbnV67+aWhU0UVNDRUHmnKw4
	Q0sqA2J/hoZ+66POl1xG2vBqegPqKTR54ay14tvKrvCeIIEJ8A1hbnVvNhmzcKvZFcMR0VWAhDu
	8BNoI4PEV+1XaLqnz0ceVXEQcqTwYqIrTnwsW6rdA8FdvKpvzWv056v9kdxMLZPhY/LbtNtcZ48
	MSnJzduiBZBZl8fGk22EG9vYuq3R87ij/IIHY8Z/wAMoBlVWcB9Qg1KRo
X-Received: by 2002:a05:6102:1489:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-6feee4f9571mr4179085137.1.1781099081037;
        Wed, 10 Jun 2026 06:44:41 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-6feee4f9571mr4179073137.1.1781099080601;
        Wed, 10 Jun 2026 06:44:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac091b23sm63272021fa.17.2026.06.10.06.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:39 -0700 (PDT)
Message-ID: <c76aff72-9167-4048-a009-9b8e477d3764@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] dt-bindings: clock: qcom,gcc-mdm9607: Use proper
 address in example
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-11-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jTPzKdHaldNVdCclq0woEiAO72AS70zd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfXx0OlihBDYi86
 0Wycmt9D64SgA2kjz+U55NBpGdiEFFhr1LF7Eba9FKhmQkXoViuAU1Yl+L9CFVphEMugpFnIhol
 FbVwrx1IQRsvhdoPWDh9gtsf9CAs9nG5QUN4is3YauAHzQC/o1MSPTxfa4EZC5FCHVYLgjpttj5
 lyoswVob4GonuYDGuYB4G1XuM4UI2MY7/SQTqSYTdnJGnDA167pAG+lClIOEOU88kcHWf6PFtc3
 qlHIbFs0oJoY+cm1rBiadV/qyIpb4V0k0SQy+d+wXadFaEH8d908/+dlb4pt/Cvy2RYfgB9J6RZ
 cIWVy9SXK9Vm9nkTEzTS08a9lA+ZbH4XkCMyLI8AP7vJjFY5cEopA7TgXI+Fv3dwmkOrFyJiRnC
 2Z6DkBjeIvAClJ2VkNYtHMTrnOfi+I79LItsunFDoBGKrePA5BtylEcAXsDBX+3bliWWNfZkVNW
 bQFFiD1WME2yn4GzkmA==
X-Proofpoint-ORIG-GUID: jTPzKdHaldNVdCclq0woEiAO72AS70zd
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a296a49 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OYg1jswFRQlTD9ONj4EA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112489-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1B29669E2F

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> Given that this is a dedicated schema for qcom,gcc-mdm9607, we might as
> well use the correct memory addresses in the example. This does not
> affect the validation itself, but will reduce confusion for readers.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

