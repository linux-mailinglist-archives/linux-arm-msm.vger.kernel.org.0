Return-Path: <linux-arm-msm+bounces-112984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3FVAFMngLGoWXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 06:47:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F25467DB1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 06:47:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FbdGHNk0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Eij5fCpI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112984-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112984-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 516573044C2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 04:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B706299929;
	Sat, 13 Jun 2026 04:47:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D56F13AF2
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:47:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781326021; cv=none; b=boD16Au6ZfOxHzHQlsE5kBAEz1mQQoJ2omAESoc88P3TC0ThH5ASkSxGYdNCakDjUfZ4HbUrbiS4gpa3w58QsaSsvSA/N1Nlb5BKgcrUI6aT4x6ttfS8HP48iaS8u/tZP5llPy2CD1TRaLzDQU4t6pTwOODCmBIp5OMJdtEu+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781326021; c=relaxed/simple;
	bh=Va3NT1tqZbe5IMgKWr3GK0oOwzn3cWko4YKcItDxgYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlAVXOL/woy+GGDIcbKRGEGuJDS7qUCncQaxUUzMrZXYmdOdxC8QlNT1MswM+V4k/sSeO7N7kqkOG2zzStoXQLaNMHGRbjwNgtRvu4uiZ+boFL7ahV3KysD8wxD0rH1vGOQaUfUsSWTC9eXNpnFCst4PvY8Mwrm6eOE2ro1+f3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbdGHNk0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eij5fCpI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D3OwxC1331901
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=; b=FbdGHNk0J3dmTF7E
	VbQOfepA/30dcFFN0K2Pz+a7TZTVL22LrVnCHKwb5WTNq6hXW+woyk+osv4XI4+i
	nf/o2NnppS+JkMLl1xOrxMjvVHirBcdYkmMu9YI7Len5y2pRp2v19aHRZlR6Ph5f
	gkyfvYO7LzTNC23um3t0QNvDuDuJIr3qYRSP7HgkkjlMmt+628mNI71JcF3HEpye
	dUEu5ltfJnQVrSU4oC3RAgda7qx20KjVjQ0J6zKbZ2k8puErNnYYn9n3fA+SuHNj
	YT7FLed7i+PdajDeJ4/Q+9lp+rb/mzEqwWx1RxjgG9p5/X9mDhwYgDxt0lL+Ddce
	5mjpRw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9f84rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:46:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2beff6b6e74so21829545ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 21:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781326019; x=1781930819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=Eij5fCpIzO465x1E3lLBbbV9idvsDJncQyn6otR1fiwEVxKD6v6pZGs1IKrKVg7Ckc
         SM/UdhcGpUaOKXZKYzaxRrIrSJ2NErefj4G8NAa9IwUoa56FnGgMfu9IpFbxCb8rvn89
         82XwnJx8a7/urAFZl/a8FIcWn9ThiJBMUBzwUFrfbe2kr+fCaoXdnjxwHJdm0aRXdvDn
         3PUf6Ep+biWpv1iHa9DBbsgwyAIu9PP11/EjaVEnOi4iySxUbwGIepGf9Dz35F4Vr7bM
         4KpcqG8LVBp9YLpoVh06hwSN/l4PKYCNJjbjCz4ChOS0wneoeAToNCWonJUOa6d+x+ss
         fDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781326019; x=1781930819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WltrxbE+VrzBAeQAuOOkNg0JVKgr8R9KzViSn7S/z0g=;
        b=JD74kOoWBfbg51hhsSrlGPoEjzChE4afs3qJUfjLlOBEXyAhQJWp52zrx6ArQx7tcI
         JWAUvOH0PrXth5LsN61M2DW9jEzWu/p6WAYZXI+Pm9DFjE/5sHzZg9Rn6VpP9MfchfpN
         doCAOvPHM7tb6/l1sc3dmEb9BEqNH4BGC3u7FUWFLz4UHubmr4kQFwIipzi4YAqJx4Ac
         58afGUqvhRobnn/M9gLLDRTwaYoFevBpFxsl1MorpSw7txiHkeJytJv8g+4clEVmEpk4
         Nn+lwc3AX9/SJmiijww+SmBf20Hn92d4Ji9IicbFWEe+chFqEhSS5TOu7dn6lpRLkSrn
         szKA==
X-Gm-Message-State: AOJu0Ywa4kIol4ujLXai+TVVREdcvpdGV8coiTj+TSpcsWVocUWyD4bA
	nyPxpHFfkMeETXorgih7piKW7p1KYPlYzxTCBCws+vwMlj0WJlwX53NixtP2z9VEA9Qk5cHfX5u
	8PZxpdfq2ATiOKRIUwouAK7XFReMKVG39HQLJhIGR5+h18H+gWFRd4Hp9Q02LBl7hAlh46VqVF8
	Qm
X-Gm-Gg: Acq92OGue9s/hYqYInweORntub+A4Go8uUmZ7krZwPrBtnE5Ux0bYnG3oNbpBJlJ4WI
	c3POY8i+FxCrDq2p41PC8npY67WwwbzzZaGVROSTNtZ0TfywcTqitBf/76B19LCmdZFRqssJw0J
	7ytixsYGXGvgvRSajK/I7puPyAzEZb+uFviEVIRX7+wbuoz3HRS8CqwdJK8qn7L7Ozj/a2QVbyn
	MbvrBUJ4D4LXgDh2cSai074aIYbg1Yd9lUZ5Vf86JibMTNYAaESUMWq29DYqA3t4AGEdedvd5GT
	KbaDzP2oz9tVRalRf0S1i9oLmHZCTsyYvKGRUm47NWhNPUuYi7dhZN12L7k4nT89vW+PlV3JdVV
	4/MGC6w/9X+MVRP3vCd6VfqbJ0hgnVkL0ploJdawFTTBA3q/k1GA=
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050635ad.11.1781326018935;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2c2:bd0d:3cfa with SMTP id d9443c01a7336-2c4110b38d6mr61050515ad.11.1781326018461;
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8becesm37162965ad.56.2026.06.12.21.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 21:46:58 -0700 (PDT)
Message-ID: <83594a83-64ea-4c52-b0b7-fd0070f03f04@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 10:16:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-6-ca1936bf1219@oss.qualcomm.com>
 <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <b10ecb42-0d4f-4037-b786-cc52bcd1bdd6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA0MyBTYWx0ZWRfX3VM5YX1pJ+75
 npIoqL7CuKLPP5sCBZ1z/a+iqAhFO8T+lUnwe9WDqrETu/YUcH+lfKQEFZaxEbuC6z3gD+BoRGi
 MVRc8LBxVUo/cDDJmif+bFAt69Fz5Dx4JerT6ArO8L9QQi1Irjm6eE2/XnbSLwOSOWmW7LgeRkI
 VQ4dZfn82xkvJXMEizjpuoXXTQotnmvbRmu942bYwkNtgRQf0Vuvl7JrAjaehccMg7ZyqwWdedP
 eronNUw6NXUVmnU4oRbjpzRPpsTqtWFT1HmcHs4JZZpZrrj91MSkLrxzGOHten0LQ9YwOSrq62G
 3C6OaMHumz0TIs4ENpAeQpOvt6K2wNR+zPZui9eRMOelCOdhpJKbffMDNeke0DaP15U3+Rszh+1
 tBONGlEn87wUBKp0dekRSAxn4YM+Ty2obIa5lhGwk2p7y9zXRlBN8sHRMH6/+CJ1FuwAnsAQ+Qh
 DQsVA2ysY+e/imBkFLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA0MyBTYWx0ZWRfXzMclLXkT009f
 D688gCni3/oeZ/6AETEXDntPxm6dAbQBLzNCZjYyTrWuVO3wImTAmOig1a2loy93O8GbqAMkyK4
 FJvSRSFkXd+Zqym8s+hxC0D1wD6hNG4=
X-Proofpoint-GUID: W8lH9r1YMbrCZ0wtGL4W7ndsEAH2T37V
X-Proofpoint-ORIG-GUID: W8lH9r1YMbrCZ0wtGL4W7ndsEAH2T37V
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2ce0c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=iljdq1zszXl5pgKHGr8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112984-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F25467DB1F



On 12-06-2026 13:40, Vladimir Zapolskiy wrote:
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <0 1 2 3>;
> 
> The numeration of data-lanes shall be started from 1, this has to be fixed.
> 
Thanks for pointing it.

Will fix in v3. On MIPI D-PHY, lane 0 is the clock lane, so data lanes
must start from 1 as per video-interfaces.yaml binding spec.
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    }; 
>> +&tlmm {
>> +    cam1_reset_default: cam1-reset-default-state {
>> +        pins = "gpio33";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
> 
> Since it's a mezzanine specific pinctl assignment, it shall go to the
> correspondent .dtso file.
> 
> It's a concidence that one .dtso file is good enough for describing the
> mezzanine for two diffferent boards, but let's exploit it by keeping one
> dt overlay file as it is now.

Agreed, will move it to the .dtso in v3.

This also eliminates the identical cam1_reset_default block duplicated across 
CQM and CQS board files.

Will incorporate this for the IQS dtso file.
--
Regards,
Nihal Kumar Gupta

