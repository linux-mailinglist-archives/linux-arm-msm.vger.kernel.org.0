Return-Path: <linux-arm-msm+bounces-115472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O95aGonXQ2rdjwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:49:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8476E5914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:49:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S0wOhgnY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C+xKPbxi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115472-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115472-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BBB83115B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57E542EEDF;
	Tue, 30 Jun 2026 14:46:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D123E44ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:46:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830805; cv=none; b=m5BcnxWUak2Euu7yNxRb/GrIeLKmGsbU3ADTZXtie+Ew9E4U6T3VNFeWKeqojakOr+nv3tLrb2Xcqr5FkjeEtJo4KbH3Uvlg843AOQHCkEz6eSQ4itn2tK7VtbEPV5XuJ4Q/8oHDifgFG+VvZRsgTunkq1nnvpS5nBzgtE2lIRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830805; c=relaxed/simple;
	bh=ehcxL5HeeJWAK/5s32YamGLKBqKKC82AhYE7FuOqU+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEm96reUk2BFwypW9ycncgQWcySFacZcPgDu4aTwmN2hxPmO+ygzaitn3VMicDL0f9KDW0S8XukFmAYLJAHJopDGbIIQu5yMtgkllj6i7TZ7fCsmjFLFox7piUra+vAaPVFa9mUeUDrOlCwScVeoYBDXaPGTNrZ1qyCsJQsER9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0wOhgnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+xKPbxi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEEHTe2226812
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kM6XssLZS5uE8jkI5SWx0ezfn7uyBMeOizbquvZVlhM=; b=S0wOhgnYKh5IW2tu
	25zPa31Eji8X4pqfm4kffM3nmnyIHWqMESJr0aiaHw4TOJnV34XCSGMFRq/irS5r
	DjzbctXKUJTMymftW4sCUTm8g+nKYx8j9dU5uSrrvlHNit8xfHVQztEYJkCElCQK
	2uCFvrhirJFhW6FC50Zq6MDlzr/uy+KPnYID8zVqCjDBSLWxun8dozTLpfbxOjll
	cvWUuazbK8hmxqKk2dxc5h4bgsRrgJQRcLdKBl87MjzpC52KKlTg4oNkMUcoxeem
	+oJjObYZJ5KqhmFFAxQkZGVrv8xa6lmuXQUDVuapOuqRNl4p6qITwvYXN8HHVMb5
	5JX28g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cvek7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:46:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so13804685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830803; x=1783435603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kM6XssLZS5uE8jkI5SWx0ezfn7uyBMeOizbquvZVlhM=;
        b=C+xKPbxi9vFD6FkF9NJY9TAZg3OURzDc7sQCmy2rcCTOrE9OFBYUM9HwXKzQItFHiS
         kKHhaSFfQ9IRx4QMhF/TFUNqb8rFA0mKa0pOZgDU8b9E4WbSNT/Xo21+LJNWE4sBEAzg
         x8iFOGKAiR5WTnd2K91s4IjdfNuCcaGldNkXwvQz8eqGWm9Eak3MNA0nWVpqMXmQ4KXC
         dM7oWU0aKBDVXGPrmgnOZSBM23JktR0zyLLngUIm11qBwBkD5PXwIXyuLZYaAn3J5/lq
         WsH7BzMk+OubqSvn74TJWFXFHT2fopLXmfoO3Vs7vlWSZjgX1DcJUMDTijxWF7oi2v5f
         jcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830803; x=1783435603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kM6XssLZS5uE8jkI5SWx0ezfn7uyBMeOizbquvZVlhM=;
        b=WP+RnyLc+pWsrjtFfYGFrJou5Otg2cfZLnZ6IoSBeYuqeXhzEcCa8A679HLVXe87yo
         KhuQe57CvD0h6/6fyfHsJ0F1SNA/nEIkTltdH4mmeP2MLSAGXN34Wxhi3PH3Kb+5EhwC
         zkuggGpwI01JwWb9wJs37br0P19lUQa1a9p4dZkFURX/5i7bEq5pFlsaZs9vG/Wmvhx0
         sqiXSawEvDRrB1QLU4ipshgJETKbghdrS5yNye5lwcqH46H/TONqJjxtqlYf/6n2yfW5
         b67fKYBJuPmjrpLvGz88xO5GV3+h38vy1HmDaDWbmrybKoLtqTjAWN02b995Zm31psPY
         GsGg==
X-Forwarded-Encrypted: i=1; AFNElJ/EkzCHU+hanO63unMeBjkAgHytsRM8XQJtkmaOkcxwjcxzHtE5YIuwKyeOVtqFbKlPx5QKUlZKDct/IYOC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Zeu2GWqtHkMrcmg503JWKs1sAGtumqUv2cBj5p3vX5AjvyXP
	pXrStWGULnA3SR+6FXgd75BAtwfjZR8pydEM7tywUw0XuZ58zYUsEYtbXFNzOCBQYRBQsezn3sp
	bEMISiopUED0ClQ7Kn+qlKZI91GJINpCV72/WNgKi6yIZpD+nQoGFBzw/pCRE0vpnj0Zo
X-Gm-Gg: AfdE7cnrdDILz5UmTOgo5RZibB36AVdEGlI16mnhNNnhZENtWiVTpPvzHyDrM0k7Fog
	iblKkVXeR6AUMPVEmUnEYwrX1Wz2RuXwWwIJM9CAbHN9mvZ4y0DAp8Cmi63X1Qiv4S2VxGyUF1M
	pGNdTkQtUrjON2g9nVfGGkN0pjPrPj6jxUZ8nmXK+xx0Ct1Usl8Y+pwTpQVcG2phHKLJFUHZLbN
	StGRLMcM0M1eXtmZjCvZJu2WrThiDGOCwYPHuy6lDLZXNC4GFfLc39DXpf4P5x2YkdQHVJ1FL4i
	bB4DyDQGx1xvUZJzE+zIKRzoe8Pmcw8d0HlQNwW39J/Qi1HGMyb30ZKi0oh0T1+6HdQD6ChoKED
	57AfqggSR6+qqlYTQoa5IdDISMPG65BCldOQ=
X-Received: by 2002:a05:622a:6a44:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c1c735368mr6822471cf.5.1782830802439;
        Tue, 30 Jun 2026 07:46:42 -0700 (PDT)
X-Received: by 2002:a05:622a:6a44:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c1c735368mr6822221cf.5.1782830801985;
        Tue, 30 Jun 2026 07:46:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0df9fsm142087966b.35.2026.06.30.07.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:46:41 -0700 (PDT)
Message-ID: <f98065e7-f335-4671-87d1-dc6ea63a8085@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:46:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX/jqFYaEGmeVs
 GtmGuRTmk1yvjmSKdBcZ5U5FBgRLXWeB5AIQMbwyTgupXIIm4vvT8F1IZfdhHnMFpu/Qqq4ysnR
 +gANTJCqKHUI5JEPT3Qqdv3D92F5vp7dqiFCZxYyNACkq+ph1WJlmSsSSmYcZQPVVJJ225CBruO
 ZR934Ooker8a+cWJ1Lqesib2cZY6HzqnhtcNtVlh8N54oid/XOZv4w1tvAOQIslkbcUdXOFaFwE
 Icci6qP2s8bLzL48TgDyo3u1N+LKf9mSkTM7vCDtlApCS9W9EbF9q0MLzPIaIKdnuKkBXRG4As1
 XHGz/W2xJV9Z5eDQoOw0bg318zZb8aFCbl+ZPyNbvzzWV+DDnEs0xTse5KLQk7MkTTJvNjvFFgB
 XmivywUxwPkTqkbpl6gQQnSSA8GH1P1mj0z0t18tSXEqVsikLrhnt429knNwoUtvHOhcS6/8UpF
 14NY50YRL3GikGM8eiA==
X-Proofpoint-ORIG-GUID: ThLKzYvnceCvBsxg4HrP3KASK1Uh3Xc2
X-Proofpoint-GUID: ThLKzYvnceCvBsxg4HrP3KASK1Uh3Xc2
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43d6d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KdbZC8JMYa_JGPUaySMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzOCBTYWx0ZWRfX/+ws+ZnOoeBu
 E2npRRdtjqUZ9bzHeQtUp5y15kK/8/kvV2kvglsmr1+1z7BPdUlMfZMmdMq+kddXjAg4pZc0Hn0
 44ifZetfr24b7ynlKsofcSvrsIQ4PdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115472-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A8476E5914

On 6/30/26 11:52 AM, Mukesh Savaliya wrote:
> 
> 
> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>
>>> Hi Pengyu,
>>>
>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>> also support GSI mode, which is highly preferred for certain
>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>
>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>> the controller into GSI mode during initialization.
>>> Why to force ? You can directly configure in GSI mode. Note there are
>>> some configuration done prior to Linux bootup too.
>>
>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>> impossible for a normal user like me to generate one with GSI
>> preferred.
>>
> If firmware doesn't program in GSI, you can't have this working in GSI mode, its going to fail (and work with fallback). if it's programmed in GSI, anyway this will run in GSI mode. So why to add extra things without any usage ?

My understanding is that GSI mode works, but the the FIFO_DISABLE bit
is set to zero, so FIFO mode is chosen.

So NHLOS would allow the use of this GPI instance (and not reserve the
GPI channels for this SE), but not set FIFO_DISABLE=1.

Konrad

