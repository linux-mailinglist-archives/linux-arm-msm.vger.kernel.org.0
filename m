Return-Path: <linux-arm-msm+bounces-96972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AvNKqBksWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:48:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A05B263D71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17AAF313AF85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED55A23535E;
	Wed, 11 Mar 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9iD8xoU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwLJxjya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8E184524
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233155; cv=none; b=qIm68qcOe4WlCyBcvb2o1XABnIcC+vGD4GxSlc+Y/BSS0ML/v1UjnYCw3ICdK0HakQt+CP3/7TJjd0eQpzR99XIr3Ye7UBL/XxqBHSCmBmrLDQPAR3CaUSzvWNmCVIiaNoMM6yx5wDul2n1RYpXZWCtJJd/g7xk3FDS/dceW0sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233155; c=relaxed/simple;
	bh=MKVR/nvepjzhVk781OJpWMzL7c3MzQ030ZF6t0WPF1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=toAYOopWDFWq+rFDiFC9ACQXL+YfWCIHx3YWmbIcn2DPqfnroeGNvdd2JglvbIZ13rqO43ctu/1o0c3kn1k26Yw3yeWmD7AEbchAbkWPiq1Z3zTv4if4Je7yY4whK6RFolErQc3V8MsEuwNfoO/6HsF2C15b7V+ODa1eXDC/C+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9iD8xoU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwLJxjya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7rGlv508387
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdLrQRRyfilWie7X/vDizKW44QbQM3u+eAKoqS/Yu5s=; b=o9iD8xoU98ywtGiQ
	o0fzOhWqYWcHGQN6vWIxDHD1Qyn/acwdyy7fGTUUbDjIriEqkPsNr68NnN8KRZbd
	+GlKGvapezHBoGUo2eAngva+EpSR0IetJYEhb2A1fq+40tXazrQTQGfqquKIx1XV
	VqlgSQjU9Xdj553M0MeEsNiI0zi+3h+dfcFe+j6KUoTtQ/oDwBhkBVOlK/KF/Lci
	POVdK1RR/AEHuPj0OKNQkE3p0vrrDwmDp7U8LjtexQWRmlqUoHaGwNEJ1w7iOHQc
	p1Y6e7ZJu9XxRV4gK4PKdDEB4XnDllUV1Cl1qr+4iUtQu/OEbrChRGzTvp50wc0V
	4AmKpA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppakvhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:45:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-895375da74bso102978096d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773233152; x=1773837952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdLrQRRyfilWie7X/vDizKW44QbQM3u+eAKoqS/Yu5s=;
        b=WwLJxjyaqTGxYvmR55d5xOogUlA0d03NCh+f0IgNTnBeqLak8qPZqt1jgChK/HaBrk
         AB48ExkcPnP0vmZl/oRjXINRJMM6fzrpOSlqeauDsRhQqX7i+Zc346e3cc41yhFu9chK
         YiReb3OB4x453j7nZIlNqbiw/3U3QWRmQDOuzPCQrqLIBKhp/UH8QQb25rm00QvlN7sV
         xpFMzKrXJ+unbPbu8MCUOf/aul9OwexJvlWcewbS1IQnbov3ZaS5YUnluRqrhuUjy4pu
         LDAGm25G8FfAcX1lQIGTs9zc4wZ+RBh9ZflqBpJvdF5xkdy73vDg1Moi7UsGQeAmM4F/
         WwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773233152; x=1773837952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdLrQRRyfilWie7X/vDizKW44QbQM3u+eAKoqS/Yu5s=;
        b=UlGWpmXRBxIaIOjAbPJRtxBBqc+OUr/+xs3O1nkXlFxQ9BUeiGuO57xj9Y3JSsggrA
         Crj57LfZ2kLDqn2AhuB0lQZ+5gXwnfoPMlkNdrl1EualOUK/leooXtmqjTlCBWcFNrnr
         AVkECHb6w9leiWAn9mz4wcaibTfbFdtHUwKOD+QM7BAdOFMRiU+MQYj8UUVX2RSQqwZ8
         2FhmQFICRvg6Qx85TwB5Z1669PlsL/z0CzkXbWiOVkux88byCs/W2WXubHFxe5da/a04
         3edfsypYkPthBT08LL9xt7CyAi4hKblkYdiwnyrFQ/7TRqCrIYMA/Rca/AyrKlHrKrQU
         X5hg==
X-Forwarded-Encrypted: i=1; AJvYcCW6+rr6z8XmhbEODVuw6jNEKm+AmtfNuDOPt9lpRV9pIjfPXOt/us9UWdv1f9JqfBLWdYRqwnZMSy7/opMi@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDezEEeWjOREImN3P48fiA8Llex3fNIeJdoSKGnIkUkqJvRhW
	Cxux+02bYg753mx5An0rypojHS2Yaz+WzTSkExO2LPafID9Tj/+CL59kNgANX2lDiP93WCrMQad
	vjRVGMLPuj4Um+P620cg2/BUQKmHoiCsIAFq1FGzhQ4rNsETd7PWXax/e/nFXszoaqMXn
X-Gm-Gg: ATEYQzydVXswUvLTl0KZw2fcV5aKINTWtb3CT6un44P+MJCFc28nkSAeJ7c7Lf2wKfz
	NmsQ/fiQ01HcIwq5Lf4qaxZvTq0mfG13g2q2iKXNNf/EOMQBl0FJ6L/56R6J3ianSanJeI166X/
	YffCMAvVUoNpQAvpNguEYAYBpxZxXAbWOuvaaXzXYib4eHr7Vp/hjUoZZAYFgZ4oKVNLgNKIKEF
	JVq/5wcHgp7f71ywCRK6weE5svVXC4xoVJV/BO7GiyVmcvQPiXBFqOA2p4LTMlG4gDef/imrjl5
	62igVE3/S2u+lok/VWEKKZ8d3f+T72Bq0GAuD/kGzPmGzpvDo8lsvfNg87thbD17tNhMpxnmMSw
	PBaF4S3ZWjQwbL9NqI9aory3YAb40yCNHNZ/brViBOPpO2ovZqw96Sg22yGixNqzIhU4IfB/pAT
	Ms8o0=
X-Received: by 2002:a05:6214:4704:b0:89a:4ee8:459 with SMTP id 6a1803df08f44-89a66ad045amr19738446d6.5.1773233152202;
        Wed, 11 Mar 2026 05:45:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4704:b0:89a:4ee8:459 with SMTP id 6a1803df08f44-89a66ad045amr19738106d6.5.1773233151702;
        Wed, 11 Mar 2026 05:45:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e14aa2esm52398166b.38.2026.03.11.05.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:45:50 -0700 (PDT)
Message-ID: <31108875-d0ed-470a-9eea-e57f4c89f58d@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 13:45:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: sm8550-hdk: add support for the Display Card
 overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260311001238.4191034-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260311001238.4191034-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BRqwuIPysroPTSbVwLz9-LnK0szm9BXW
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b16400 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=dktjcL7kckRUqMNtSHQA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX8oC1zjxfiBT8
 uB5ZCyiAdSss4qJnSI4svsGXxrcUgtr4VQ80aiWdVzs+MWN/Fk7aWiE42brFEDOSDQSKjiPo4pR
 R9gyRaaNroCXV85ROQkpf3el5xf5Ww5qKjq0p5mesv/M90bskfeYRnVY7jdJPc8mKeY9Ktf3gCj
 rxH+YytgAGRcip2f1ysByF89cyJ2aMecVJe+9D1eUoaB/rEvpStQwmnsguhbrb1AnUSb6DmbOnt
 /TPZHJgT2Zb3Y754Bsxtle1WwN0UPp6chPP9m+XuNkIGvYo1O1OJkxyWWsmaI6+glAnRyVVgRrB
 d29ZeHYrnuHaoM83s0Ol/rpEUiDM5itfASbaimCVQP2Rwd/YCEZF0PA5djPTrTpFuLYrrNqo3Yl
 tUgKIFnGhE1c8kwYk5lexBMOjLKCT3qfEgL1M87ayseQfiriIUrneFRf+7DVthHH/JTFpEh7DvI
 dZdGJ3V/bCBYgToeSQA==
X-Proofpoint-ORIG-GUID: BRqwuIPysroPTSbVwLz9-LnK0szm9BXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110107
X-Rspamd-Queue-Id: 0A05B263D71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96972-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/11/26 1:12 AM, Vladimir Zapolskiy wrote:
> The SM8550-HDK board may be connected to a Display Card external PCB,
> which is identical to the already supported SM8650-HDK Display Card,
> it provides a VTDR6130 display with Goodix Berlin Touch controller, see
> also commit bc90f56a1699 ("arm64: dts: sm8650-hdk: add support for the
> Display Card overlay") for additional details.
> 
> Two overlays are added to support SM8550-HDK plus Display Card and
> SM8550-HDK plus Display Card plus Rear Camera Card setups.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

