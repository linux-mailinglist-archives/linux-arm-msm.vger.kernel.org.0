Return-Path: <linux-arm-msm+bounces-102120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJzFK6vd1GnzyAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:34:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201B3ACE9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 12:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB1293054F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 10:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148BD3A6EE0;
	Tue,  7 Apr 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXS8Wm+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTVYR1O7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF0934A76A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557825; cv=none; b=qhaRFcO2lOKdcnvqZO99HjSwDCS5A8rPYZCU0yBjdJKOVt6Cm7bmGnW0Ilh8nu44aPU+BNqOLWvAgTkhRmPiSh77PxhJuXK8u2+g5LVG2n8LSDdxU5ois770RRZ7uNY/xaqOLPsBvCr8qijw5/Cg/n/F36vWdtxItth7VMo0o0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557825; c=relaxed/simple;
	bh=kfFx7m0Kla4Oibk5jdaHYReFM8hCk3zhSmSJxrtCcHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Orn0vu7BZ0BUVoCl3irMUWedcsSs42l6i/bSLRlR2nNvyxjmP1nsH9vk7l4aiBP15Ls1TXQqjwu87wWsM8nv12XGqNqTLz8o42pEfKXt0ciFiEulveqTz2xVlekctyfZkjHK6gBRRan/OgUopXu0ZRWE3SNd6G1XVOkTrT6qy78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXS8Wm+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTVYR1O7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376qRII3816989
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 10:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=; b=lXS8Wm+/sHuYTbr2
	fUqPTFB7C3j4FBWch5Llgs8xNJuJJYrCNg7YOtmT7ptcFOkjJw+ccSw6GGEetUWA
	NmcvLOBQfrclKzZvB2yeVhaejt5P/duE2mCawpkgXS/N9f6OVu7xO5nIOG2xHma4
	yyaIgtpQ9AnrtBvp2kIUYJvkuseEJ6Bg8KiHinvJx2sg/AMvuKDmFkLT1RIUGD+n
	OlBk0cJNWTywB/6VWkVSPSM7wE6wGs34z7698N7ViBWr6pw2krIlr94Bb1NGt/NY
	RBfCTeYjtEuN3DT5e9hh7PEJkC90tISQVUVaJtLgjorh3WGre0/iPbCqyhQO6ET2
	EL041g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4ta0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 10:30:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so138168485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557822; x=1776162622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=;
        b=CTVYR1O73IVZAI8xtynf6UaLBP6t867+i1O9xoL2JqN3/TE5kdo/u9+V/M5hW1g03S
         K34UfxF7P+Whayh1rZrzBl0nCD2pxdYghlXxH7FR3GT964ca0blhC8VoWlobfMDTMax0
         7mMvWW9QTY/2xMQpYg2PVl2mTWT30jYIVXVCfVGlgMoNnpz1cGh4MwWF/TsiZf71yaCX
         rRIxyxmhn1EhbWHvnkHyONSlBasBP/xWofVWpWJbebiTUTh1EpC1gcZUupnMQ/zxZlQj
         fgznqRyaYp89QVWQuh9BMIRjf8pupdLjp9CzpYR+Z+X3FdiGn97jmFc1vrLpWFOFCrRU
         gxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557822; x=1776162622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=;
        b=YmTvONeyBTNo0R3VS8j/1Wp8TXKt3wiGisaaHQcpMgw4HNXP8gUB5rcGSvOyb0vmI6
         idDkUrwrNToo3MSw9sbvff5vk1mWxiHZdQJWrIh9M/zFf5UszPTxAl+o5CmsL8nATMTC
         1MAcupsA9TNMYUgMlTbD6R0QXD4qETL9XgD119JJ1VePPJNzxn+mb+Hc6B7xJqznIBTN
         gWf25RV+ptQ14a0HitJQkfMP09AznvRJ67J0Cn3Zch6lhlk1FNuRJpleGHL0s87f7ok4
         +EDm4mqhVhgmCctxGVmOv631pmmv9dAjodUmLARxyE6dXCdLuXbQPuLPoE/K7b8si9sz
         Hg0g==
X-Forwarded-Encrypted: i=1; AJvYcCWSbfTp5bKI1Xr0i+9v+utr7EalqXND76Qp9YU+UO3zzB/FISaHHHBaKwEN9oGNG8GN5/6QPW7GJHElJXCm@vger.kernel.org
X-Gm-Message-State: AOJu0YykwyeHG8Tcu2z7Gv7ah6BGHosiigZFIBq2XSA0MPwKgjmCpjGL
	OdVLk+LRAYAYvRtx95QV5yMXJhwKpL5Wfx7n5x5W2/AX1Iaucp5iySQ+nS2dVsmF9mucd69rV2h
	OezO+b1u4KH8iWZRXolT+5DUdTLJG+ds/9lwoaZD6Cyc8ltKQcQNIdKztl6eqIAPYOywQ
X-Gm-Gg: AeBDievUAIvzbn2/I1jtMx/4Pe7Rwz1iLz8woBi9nPTdaZX6v3GwQPmPU6egmGMA3cm
	pWo6t6FTdqIyCXlEld0tYuKTDgF7JMR1/H3NejuXNtnTAIsG8zqn0OaJAox0wipLlLWoiZqw7mP
	gdA4CveoZljUUnb6GgZtV12ucnggrgUnuuE+epseufUjxSfuMrfUohjtBC6AMAhJeWHzvYwcyHj
	XHMNWFvY8r39PupMuxQL0D7p1LRvfDyeBcJXibtIDSBCES6Fp15TZRkjovpWjlZlD1phLSdD5Gx
	r1TXhfuS7sv/KzLs78cue8H0dlL38iE5bZKI1/gK6gA7CXuv2JuWWg7KyOzp0wOVXXPpH9hrcFk
	TZgGTpXPftQDAij9Qve9pS5NjYnVdvof6siJg6Yb/rcYLN1tx4pycvJskMxxyLf6ferGo1XEA+H
	ArsH0=
X-Received: by 2002:a05:620a:199d:b0:8cf:c757:f1e8 with SMTP id af79cd13be357-8d41e81fe78mr1565720085a.7.1775557821896;
        Tue, 07 Apr 2026 03:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:8cf:c757:f1e8 with SMTP id af79cd13be357-8d41e81fe78mr1565714485a.7.1775557821327;
        Tue, 07 Apr 2026 03:30:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4185135a12.16.2026.04.07.03.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:30:20 -0700 (PDT)
Message-ID: <9788748f-fd4b-474e-9378-8ffdb9b18527@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4dcbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=apJo_pz1HnjGAtgFfvkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: x0s42cgyKdHB1OmDw5_FjtH9Upc3Z3g1
X-Proofpoint-ORIG-GUID: x0s42cgyKdHB1OmDw5_FjtH9Upc3Z3g1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX796dD9D+DxB2
 +iRvfQ9wL4A2NwfzuNo0+HIoj6+qYnvjVUvqvbdwfZygYSxx/lDbkQ4L8FrPkktO9uLJI6kNrs1
 OXTvMJR6LZt60jQ3QhVXuIeNhH6kX/St/c1YnyOK9/IFF/mHehg5zNravBM/XKTsirPeirIWT81
 0wpAiEo9XwdgChZw4Aaypct/r3nx9MAu5JEeCE9qw1b6wcyAVBkKAEsp1NsIj2UlWLobsAFqFLj
 2QhoUQUsBwFVPe4m9phJ3SVpA2YuNdT2pv3CrMx3kK0UBiQbs4CgxAqTtmXHUH4dHRlt2VbLsn+
 duX1kvbUaTKvpM8Lo2SPe7lh/8pfXw8EgyDayiY+XXK+4LqLPuwcXdRY6ijgP8BWVdmS1SkiD+0
 PnPPbHX7hTMonH0p0BI09xKT42ONUm2bWJh5hnuOwNCH+SmOREERLerNbBRBUENm75Sn+xLKIpn
 eKuZJ/mEZvkvHmJJBow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102120-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5201B3ACE9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 6:43 PM, Luca Weiss wrote:
> Add the description of the IPA block in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


> +			iommus = <&apps_smmu 0x4a0 0x0>,
> +				 <&apps_smmu 0x4a2 0x0>;

P.S.

I don't know what's the scope of upstream IPA today, but it seems like
there's two additional SIDs: 0x4a1 attached to an "ipa_smmu_wlan"
subnode and another one (0x4a4) called ipa_smmu_11ad, perhaps for
some tighter integration with ath1xk_ahb?

But again, I don't know much.

Konrad

