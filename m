Return-Path: <linux-arm-msm+bounces-116444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sIogF+RRSGrkowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:20:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB41C7063EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jwoE7EXP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cviJ88uK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75C4D302A04A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5321FCF41;
	Sat,  4 Jul 2026 00:20:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2E61D6DA9
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:20:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124449; cv=none; b=dWy/fcuGVWB8WykgaT5BjHACFhzS6g2CHw/T2KVjS1SrGoZLGh2Abnvy+4LeiX9EPsybWWn2k6m0u6UmgW6oQctfytc2QPyh+/MSjbMZrMvuRUGBzjRulEQOhiHoyn6aV8+ofIbokv+u9FGv+L9WRXVtnq/teUnoi3ihJvTIajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124449; c=relaxed/simple;
	bh=/3S+Sc0qUdx04iSana84C+LKlwW7PylviyD3NbYx6GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjZZlRGEGUPApBGdM2CP46nOnrnJWXPD1xVtc9bKklfCqUJeNuoxyoruaFDcW4tFfnbIkTNXmEJuuntc8SY29R//enbOf4GTtIIGw0uoflLvtxzXqjBRPCKzE28sXelxZpz29q7S9kD6Gu0sVao/N/fV8GsYBsQQFW4cw6THZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwoE7EXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cviJ88uK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPnTt888939
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LpRkSJiIILmsxhLK0DIvM97s
	GwfxmQw0i+mZQB/ozg8=; b=jwoE7EXPgIU3VYQYBRaatIdmDV5wzTJ7CwWOr8T3
	I2qHaoEttiXBVw5nL1qF4MlcAToVN7RNUhEf0lD0C03KOWE1T3MfyNOhuTNWkhm+
	Rip+MyNxPDwMM+iB12yj/wwpnx9/NNoqSEompjxF6NO2Fn/Ah2FnH5JRxj7TxOip
	RhP1xTPYp6l5hOG74aOMJ95wC/TwRCL61YbuJvVxGQsh8/XWUA4GL7wAiLJ1c8BT
	pcpuTIrA3936pHTZdccewA9ZGMGY6qzQmMpxqJGWcS2DEslqY/+/e5qm8KPiEGYP
	GV7hkJpb3VaFjTRc5Grv34FHvh+5zEYHPTU2QfShUDulrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bua0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:20:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f39a46efd9so23476626d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124447; x=1783729247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LpRkSJiIILmsxhLK0DIvM97sGwfxmQw0i+mZQB/ozg8=;
        b=cviJ88uK0FnLH4C3cR8WHlJCUlfw+FiUpk9e8E31R8Vvhq7eUTYIAj1uR8FoRn1FTh
         z0BZlORsfSzfIt5BD31AbE04QSyRE0zANr2ESFLBSaQEqN+1rjrjlh7XBfL1oS1Zj5kw
         NLXYT89wVNilLu0Tq0XmHBO19RW3cmHB4Cr/Ur+2dZfd+s4Edvi5Fu+ROucfYLjhqZQu
         3maajeE9Gkf9ZjRIJyCvyQchfzkTuDXNPWUt4DGOMMSXuzT9V3/7EdJRHDCY56My6dWC
         nFpQ+jeE3EBol6cmtVdENwUU1HDIwG0LKsUeED3/S3kSkdlY6iqmTs1dUHY/NVm5uhS0
         To2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124447; x=1783729247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpRkSJiIILmsxhLK0DIvM97sGwfxmQw0i+mZQB/ozg8=;
        b=QQULBRgQFVlvShpX79pJZANX4+JYgJzqSeLjdyNlpOKWR4+wSvNlWNPdI/1gN/BUQ/
         OXSLa/fsbpn0Ac5GrWvjb4Gn4L9ECcg6jx/LuhnynVqBacuQleR7OGCzuu5cX/qLId67
         uWyzBfhYSVyf1Un3tc0R1aP537G4jNdtNdh1zSd3IfLtULJ7qKZZiQKPcQAYQh2wj1r8
         UeSIIGcOywS60S6ALPudL8Cg+qrg3NvIpR0lQwOQMrIYmj5WM/gU2hEU1lNDc01Gmc99
         2g2m8GRxkBhzIatvs9/DxXqePQwP5dEk28Tykyszkfmcjsn+E5Jn2r4YM+kRNz+dVd1G
         Qf1g==
X-Forwarded-Encrypted: i=1; AHgh+RqKhc41jouRzzrWz/myIIWEkio78YRBTJmbZ66hvpu+N+VM8SsgF4Bo2FfhYtcpmfrLe7Ke/cbeVhsoZOJN@vger.kernel.org
X-Gm-Message-State: AOJu0YzutWjK/c5Fj79dqTKedj1GJinZAIiM/1mb1zIxATVwww91CWUI
	kxKuryd1YwBEMMscImO8ye5cN9P30CyfxrURAth7J8tXLlPe8KuXZuohu8V7eNm7lDQat5QLeVX
	B53ugIHQgSqDdyDLnAed15YAXagNgoMaO2btYpljsZCMAqfbdsyGiIWSP9tjA17V8ev8b
X-Gm-Gg: AfdE7cltSFejEJzSFadRMqrUBtsA9rnOFiiD0UeUCgVx9s+onzfDd+i1eMdXzAJw+yb
	C6uTrDgB1uCLol2in0ggagcO6/oCNCX4Ch1E6S7bGA31lZSfFL0kHucT2N9BEsG3XFqmtecf+zW
	epI8pbiBGtcyF4Z0ZSFH/a29euT7kUtI0W83EBIpbO1RdXl9wQZDuECLHloUhghDlWsNgYqwKGy
	AoRd8qeSz1BvqHhzBTmY82f8MIexBQ1aOGGWciJL3ScFKHBrrs5EsjFwyGjIRAd55cGspR7d8Ue
	eZR2/U4rD+D4Ceg9wqyFtYYeSfINeEa3/evWI3c5Mux0++DIA2VkElgbhcK0gDtSvHMx2X0x78Q
	eR6vjFykL72X7U91iZPmp5sfy48s0h+lyTsHHHIHzcCnjUpkMqkrHht1uFs+ellvN/CCjAWdRoH
	3Uv4QOUxRy/T9CNKPS+/uVs1o4
X-Received: by 2002:a05:6214:27ca:b0:8f2:1d46:a882 with SMTP id 6a1803df08f44-8f74ca9fa5cmr20352866d6.0.1783124446681;
        Fri, 03 Jul 2026 17:20:46 -0700 (PDT)
X-Received: by 2002:a05:6214:27ca:b0:8f2:1d46:a882 with SMTP id 6a1803df08f44-8f74ca9fa5cmr20352496d6.0.1783124446281;
        Fri, 03 Jul 2026 17:20:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm865446e87.12.2026.07.03.17.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:20:44 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:20:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/19] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <kpg4pwmhu3liigfu5mim6wzshp5swmz4wsamapw2kswvpxlp4z@mgh6rlkkfog6>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-13-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX1RPOa+Af4rss
 s54PMw02+vuv1+1X1RNSOpBCwy6phI/Mq8BqNEsIneNLt7YmJmTfz3sNwbcQpdr9zjjmB94RgSS
 Eq/X45Mqs37+xSPuRPLFImn+1WiClGzPlQrQ6KlmwluueOzlGp+jhQvSY/RJ5TVIYQdh4IiO0T7
 AvTkVzZ4KBnKqrKoYxzZpWSocKFXAv86YB7xYuLfF7t4NAYv9aS+exLYq0F8yU24TX0R8Tl8jfd
 Fsh7kYj6Ndq9N4Q7ppGNSkQWoCKIW60MUEhDvrarWQk2UjLe5LqThTV7TJHwewwO8rt7WBZXScK
 LtDlbavXsx5ixTEwLB4WGmObYZrRCBvxRkDcVvTSys6UebfPH+J/ytw0WZq3pmuUhbJ32E1BB2e
 bVOIK3EFD+KGeGMJmeUC68/XurWdcZtN3iuPqpRDKz0chTWBHZYdRmE2+E/RBkcYIAV0geSGJaG
 c350y38lX6hzFXOc/iQ==
X-Proofpoint-ORIG-GUID: VlMYRUPnMmz7g9S4updekigEfTHQvjM-
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4851df cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=244XV8jIjgl5S067L6QA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX/TSPOLvssWz9
 dJ8MV7Op+QS3kQHWyqu8oqLoAcI9eoN8NIE1o5Tgzo/xuGU/BlK7PoUPm1JrV0grdiTJRn71Wna
 WWtZmzM+1rfZVN92jA59UuqykdNshpw=
X-Proofpoint-GUID: VlMYRUPnMmz7g9S4updekigEfTHQvjM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116444-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mgh6rlkkfog6:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB41C7063EB

On Fri, Jul 03, 2026 at 12:01:35AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 50 ++++++++++++++++------------------------
>  1 file changed, 20 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

