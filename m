Return-Path: <linux-arm-msm+bounces-117204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bvEMH4W8TGrJowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:44:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4F719497
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:44:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fwLXoNlv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hvIZT+6M;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFD093047030
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D95E33066D;
	Tue,  7 Jul 2026 08:44:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94188330328
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:44:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413845; cv=none; b=WtcYKKpIhzJj3R82OUuYqH0RF5ycuGZOugcAy0ZWkS8CQL3Gl1f4mSeEWP//2KvbLPN5pRdfEudfQZXA7zKrRtK8MaNAev2/nT+C8qowIcue3QVnSBVARqD4N0ozJm5nQPGI95P8ljqpe+nFGj8vk/OxEMg43iZE9mzC79Ndg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413845; c=relaxed/simple;
	bh=Qe1dRzWqI3cx6EMPI8lx793HjTWT5V2KRYKzifP/06w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7wwhaBISlD4CmxXYFxnTFtLf1C8+NjnFYUoH/zT9m3NClIF8UmA1ap5EhBg6eEPujOh2tni7GbZutxL+c+IO6ZG+xwJcGxQ5kKYFSvnLBZCzb52yjLwgDRG4xQ2GFt+6wXP/GSYEArKFhu3MmoCTY6TPVMbGrKf8JfEAFQ2+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwLXoNlv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hvIZT+6M; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dg4u3050445
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXUXWqaoASgKGldEh6YTJBIIvyXgmngAzgY5m49GYxI=; b=fwLXoNlvsEbFTZkm
	RvnyGzub7C8Wyt0NN5UD1GXo4GNhsmel+G0p9Ixb0XTbHEKvM4p5qaYeqBIcknPA
	L91RJUpBHvgIoNyQQ5cVqNk5ZHfqj6mTFzYcvWYrh9PyPXHYcufY+u0en+EysBcL
	BJAQYqWEbdXMlvKM3I4gYNFUC8fU6Y3qReza5mC3qFiivBI7AheDMKhVvbheynpZ
	RENZ9WYIMTxihU0RuMqOgaRiF4BJ9D43X002hL1sZd8Pe+IF9Mis6NxOhEC5kQYq
	iV623yjxiQSC7F63SGzlMip0sJGM0sG+WUuwBcDkro3o3yjZ1nMlokwfsqfztC8Z
	3Fevrg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u89ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:44:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ead919557cso13856266d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413841; x=1784018641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXUXWqaoASgKGldEh6YTJBIIvyXgmngAzgY5m49GYxI=;
        b=hvIZT+6MlKx9smZyE05uM6IUm9fHQuxcRn/F6U0W7t68cdJa2s7wLTrz+Qpl6XfEDh
         m5M+by55HOwoMVHH/l/5gs6/2tuW3WuMJ4/nR317x4MKCuBZT2JA1tWF30JaKgfVE2DY
         mBFGAJ5+09InhcJuVLFlmoM9vPiV6npcVpkzvXngjerB6C7ALA62Y3l1C5DD1XLiqnvM
         fDjcoyBtp1W2neZS5l0gApovx5X+q71qPkNkAkBSsWYIAp8UZdebCePne051FzMkMclT
         kXuJcKvLV3ooAgdD8s6pIaypuBzJ3O/UOj6KXYEZtWlP1MY9RehVkOc8RgyP1lWqN+BM
         pehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413841; x=1784018641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXUXWqaoASgKGldEh6YTJBIIvyXgmngAzgY5m49GYxI=;
        b=tQ9cgh4L0OuUmbvKnhCmBijPyCbv6BXvrV3tzfySFKLX9+Clf05wthTAExcG+AwbvJ
         gHK0zSJNi6hGYEUkpFJuleUCYEHVF2Wc1MDSZPWUJGj8Dwl3KHW7xHKjaSmLG0BS30oI
         4HD5tSQWaAaUxX1YY+y2N2a7un978MJHhBoUUeHX8vW7IwV/2QIyxyZo0Yvf40sjmbkl
         cySsH/TDipO8sLSBFOmEFgBUAaaRyBOCoOWdD21fu6QwqFOR411GR3O4B1H28lOHp9Uv
         XxbcRp37jNWJfqMbdy43QISLhIWEr3TQc24wKcwsRprRP3eR4hp5YuK9L3uAiX1EjCxJ
         QDsQ==
X-Gm-Message-State: AOJu0YyoJixhF+MGB+Bw/hwMZ5dEy2jp3HqYfDQd/bLSDX8IC/iIWXrb
	NIr+3rb+3Soaxt8VHydEmJaxnMdTPHK1RVMSZgN1409xV2r4TxtzJ8RTjolLQWYgiG6kYRs7FGV
	of2TyIvfIwqtFVS7ZMHPIBqxIdkDmIzI1VHUWabPJFeCTolDF8YbYppb5oo5lADzfuZHF
X-Gm-Gg: AfdE7cmHEQjPtpduFqiqKOG/TOhHC9v1OxP2KIpRiK4lIYmVYtecWrab//VFEpDrtL4
	x7ZBk32UevpXByrEwu5rIVInrhnlQpny+WhaGXuOUKiAxWpSYU5lHrJYzcRl0jT8czmxg1HzFqE
	abY+BVN1X8YS3xT5LJaBiVPYSti5GYmfTpAclTMl12hmYoiwQzonkMx7UByBvq6q7RsifNvXIjH
	odMkLC9y5Yu24T0ydpgPFKPgN/B0vElBZg9V9vJt4+g+lr/Uv90aV+egOOJWKsfIfuE1wWiuyjr
	rEfT8ZD6xmtGAnjEQfIYKm1bBZDq2/ExGFnhJFNQzR4knk23FuchYctXQjUlFev6cv/DPf379qW
	uVKFGHWRhF6qXv0fcZcBa+WLS7XWf9zuIipM=
X-Received: by 2002:ad4:5c82:0:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-8f749b6b74dmr138770156d6.4.1783413840950;
        Tue, 07 Jul 2026 01:44:00 -0700 (PDT)
X-Received: by 2002:ad4:5c82:0:b0:8f2:fba:7f36 with SMTP id 6a1803df08f44-8f749b6b74dmr138770026d6.4.1783413840554;
        Tue, 07 Jul 2026 01:44:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19cd89b1sm5363449a12.1.2026.07.07.01.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:43:59 -0700 (PDT)
Message-ID: <ad7edaf4-caf5-4655-b489-de4b8bee6426@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom-qusb2: sort out register layouts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX/Y7LFoU1iHAo
 vecHo2mfsL+fZcBmm0uFOvMhdva2i+iONJrvofc6IHCKE+OJWELMDA8HSI/wrsbD/ngPvXtIxOy
 dDKynhU/bY8/7S0+JcOtCLxTf5Nnoqw=
X-Proofpoint-GUID: 86lj_8bp8sendRLbSGDGrazsqv_u8mGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX4fMsGy52TXhA
 OJ91lbvhQhH5BuHKAfR+mAI2eEby4r2RFdav9xe+oTac6pD9Nu3Boobx574uxITBLHUL5PU+/b/
 CWzkJO1FP6b3O8YsMCcvX+/bKOlrsuTPaBQLVSs5mry97VdUEicn1udXMjsdMOuxL60VEclxqPH
 Y6QmTJa+rTUdxWM+IJMoS01ZWXb4pB3ADOIqwTyDYBZET3gVO6gI7YyZ5sifMWgFwCPTDo6OKYC
 5yG8j4Brx7QVHc1hT5DDfqW1vB3jmJPUM7KvmxvI08PgeujxQBNLGw12tYYzpusXEjbRTva1Ec2
 S1eZT5vpN0KZFn+pukhEZrMxUciHcp3/x0eskgdMySQu5P3JFqFh1ONy7pgyXzoef7iKskq3G3F
 9FZkHjZYEtPFacCMQROezHUf2xymlhCNMU5uK5EHS19ZdDXCYXF3xq2jFMa8ZMhwDm9Qiop9Gft
 HbKn+FOxyPGI1ylzmgQ==
X-Proofpoint-ORIG-GUID: 86lj_8bp8sendRLbSGDGrazsqv_u8mGm
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cbc51 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BeWwBsZv0zths8DhLt8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117204-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8F4F719497

On 7/6/26 3:53 PM, Dmitry Baryshkov wrote:
> IPQ6018 and MSM8996 use the same register layout, however for historical
> reasons ipq6018_regs_layout ended up correctly definig TEST1 register at
> 0x98 (because platforms using that layout didn't use autoresume), while
> msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1 layout
> entry. Fix handling of the autoresume register and definitions of those
> regs layouts.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Reworked the series to enable autoresume on Talos
> - Moved autoresume description to the regs layout, it is a property of
>   the regs rather than a platform.

I think the new approach is sloppier

Konrad

