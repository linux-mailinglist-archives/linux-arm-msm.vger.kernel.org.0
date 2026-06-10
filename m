Return-Path: <linux-arm-msm+bounces-112477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f/FfKuNpKWrOWQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:42:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85205669DBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:42:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cY3CKTHV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hx3HptgX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112477-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112477-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3289530E68AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3321C40B391;
	Wed, 10 Jun 2026 13:32:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DAA40B382
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:32:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098356; cv=none; b=Q5EwEDBl9aQHweLPWzQPome1FySSu7OfgGhWGE/RsBDvmI/AnNrEw8qGbZpubYu+Gm7gcaxuHAv0jvlE0QwKd0KwFvxPCf3M4/vWSHm1yj2sp4hTGIga2X2DJ2mxmjwDbTwMuQzmWQEukmr/fuUA5a/cymHfkt2OcdI8SHNYQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098356; c=relaxed/simple;
	bh=4ShRACg6pRN5f5U0yeS94DPp+wGyACls53laAsdrDZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XPEXnGqjapa3UCKHVQOKLsqhebTyw3F8GqXYB2i5KlDT1dI0n7rgInbIYIXaj47nxcMsAiQNL4S95kR8Oy9hjQg3quHwoNJXeWnZFPGkypWcfxMlRel0aIajdndhWkDHfeMAwWFZO36F366lXqJRD3jPNB68KTZdsfydjh2nuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY3CKTHV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3HptgX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgXl1138079
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=; b=cY3CKTHVDUsuNxMW
	xD3jRyPDlpXYqlgbyOpYd9Jw9o0n7Pvq0krnlEjoAConV+NVYvaHCjs1xME5bgVh
	Sh2ll16mn1UJhkr+OluS2yZB9pV9vF1Hej23hxtqi10cb0EBsueK3siMlGohNaCI
	OKckJn10HXBmeB2Ag5DqjsErHUOaTc/SzIoHS0Uac1CAl+fyLDH/b0pAOKbLeHio
	9svv7gyglZMwFTia27oWyEzdKND03MGBby7Fr3t/3Mxi8Z+qgGG8ALTWO8jGRdCX
	C5d3sPFadfTCllpd7fEKoFv/z/aUnK+MDNoKmG6lNTGyvQuERj8LQTegoYZn9RNQ
	gzdlPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2jmmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:32:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so97066685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781098347; x=1781703147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=hx3HptgXPpXEu2ptRsb48y+KzGt3AKeDG1HD7EoFqSstKs1lWOIRtj2j7+PhDrvkCQ
         D4Gw0CuiS6c9P84c+Va2eQIOyylk2Xnk0MYxlUXlLZAJJ3yr3Hs7jbqFbCRTO2TRjm/R
         M6KdmqEmBWDmlsulmqGKW47rcczpabf1A5qukLU8mGDdk+5W2TfxqcvTsva13ug+Z5Ir
         s8U1CSZimW6hljLek9f1fsVqWe0LClIll0HGpEnMcTs724rMacEpqr66mYo5+ntt8CVJ
         Blr5vuedZdacxP0bHOM01uUNGZgPT0u4ruUFcjDsPEsIITgTyEVz1PXFGvuotdkAa5S9
         y0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098347; x=1781703147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxxItOouM/LLJDfARm8NkT8swJucJrX6hVaX+sB48Fo=;
        b=fcLaNvWzrOgwL/vTBI0ZOmq3AuwIm2Aw4L/HjPXrhlXNltT0QHhvZddilNR2/lTGQB
         udgGPX4At7R0CyAChp+PYeEvcLywYLJlEeTNXwQ3IWcM2ItYPwIly8AOV1zEa8KagWZU
         TUxYH9sOre9HsA2D+TVXyz16Ba3gcylorwYppl7319Z0mQVaMeBByf8BXAAJP8GWrT/D
         ai+efr3eP80tB3ZV/BckFjh77sVqsV33riByOkxtsOP5s0HMveqrEBiXjt4QIeCdoRAT
         g9YoAzAaOTwtC17D8YtOskjD8A7Tn6ncLA8XOJLsbVn63e+TaOuWaJeAlwFBMcyt5Zmp
         Ustg==
X-Forwarded-Encrypted: i=1; AFNElJ/rN4ZogWLbrAGng44Qkc95+EBlJxgZJ+o5ns+Om+RhQWwlmy+sVcbDk24l7quPrn6qr5YFAHvP1tb5ZO49@vger.kernel.org
X-Gm-Message-State: AOJu0YyF18lyTHVQ3cz3Un3UrzGa2+tF7Ks2VSil8nQ4FPQsGb0JGVsd
	9LvOT5VDacLLXCpUPgwpV7GML12P4zkOrxJmUnzjZPPkDFPAQbzqvLPWhs1P0adecPdbAGrFkox
	47uK0k18aSEE4R3njMPunszGd3PrQjdE4wVDSj/4/faXJVRFr7opcUpzxcUpo4hia1MYU
X-Gm-Gg: Acq92OEP0ln9Vh1wfqa3XPTfPjvqWNqEmXaeNj+0Nsyaf+SbUnasug6ESZJmYIYVnli
	rCXTrYwO1HncAQHblig25MYR2wrJBMrgIosET83eGkc8h+mMBMpR0mAqvOW+ykGe3MLmfsQzWrp
	V+dFJcuYIU1NGeU9ByySI3JHQsW6X5O51frJCZkDBuZasiNAIAddQX0qrigb5Sk4/sWG5xA10O/
	aQ3BlTzgkhV/FyuIqqK5V24Yj8YrGdMiE+5+G0QgvmCmwkkub/of8JNGpugNSA3jIuErghPecbl
	vU8C63AyBCAlD87eXOrearl9vxwdZoSVaO++FEXHCJ4rYlc3BBn4mrzy4D4h869jsDSJz3Y7sTA
	qRZXp4ZppzxIeHmmfwiFhom0xqXgOQmFXCSqcfGBY1BICEVOb0lFY+iao
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570904785a.5.1781098347411;
        Wed, 10 Jun 2026 06:32:27 -0700 (PDT)
X-Received: by 2002:a05:620a:44cb:b0:915:7c1a:1388 with SMTP id af79cd13be357-915a9daebfbmr2570899585a.5.1781098346827;
        Wed, 10 Jun 2026 06:32:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm5335664e87.25.2026.06.10.06.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:32:25 -0700 (PDT)
Message-ID: <4cd6248a-04e0-4056-b72e-00b860624dae@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:32:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29676c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sFjf4MH_f5z_4b8YUgcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyOSBTYWx0ZWRfX11zdKWcy+IXG
 +NBTe23zZqpcE46cBExX8fbvxQS8RX3r0Vw4/COe/TDjgiBRB2TLuJXf7hEGf4szzvrZESh0WZt
 E9yOFkY3cpaig1CCUud8kKGJPAC8Ib6gZl9gpOab+oWb8l4Z6dUPNib0hpzWIYOm4ZAfhMF6T1O
 mr8PwM5i03g0P/3y5uQftuoyhZMoLPf3pLnzySvnNCGJtjTcujlRYs5lXttBoBZFB8yWQWasU37
 X2hsqv+9TzW3upcZg3vHI5PCMxln/aIIruH8D+65ejr7MPXZdoEBacbpl04YaVGGvQSMCabWwok
 NZUzxWvhR9fjVWFOvWW04OSwU57hQzeEb0UF5tPHnqnmQs380uUJ6w4DR4YH8mgPrvwcdhSS6mf
 qF7Bgm1ulgqgG73KiskI1T8VUaPfrlz0ixZuLLaXYc/Uo7PDIIq06Oqihp71zM76mIp0eIammo4
 CEmmpNiit5hEp13023g==
X-Proofpoint-ORIG-GUID: 0UL6vn9mi1B0kc7PLdC0Kgpd1naeMPBI
X-Proofpoint-GUID: 0UL6vn9mi1B0kc7PLdC0Kgpd1naeMPBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100129
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112477-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85205669DBF

On 5/26/26 3:24 PM, Erikas Bitovtas wrote:
> Allow Venus core GDSCs to have their control passed to hardware, so they
> can be powered on by Venus firmware.

"and explicitly state that the vcodec clocks' halt bit should be
checked"

// even though it already happens by virtue of:
#define BRANCH_HALT                     0 /* pol: 1 = halt */

and C partial struct initialization rules setting uninitialized fields
to 0

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

