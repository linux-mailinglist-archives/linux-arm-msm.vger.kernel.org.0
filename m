Return-Path: <linux-arm-msm+bounces-80334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D1CC31C30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 16:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1617E34A24F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 15:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD5322D7A1;
	Tue,  4 Nov 2025 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKlOWff2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XF/9xNIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E9F1EB1A4
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762269155; cv=none; b=u8mX9Z6sftWHIT32/BVan9Rt/cipHNQZ8e7alsCzFYVZ9ClM4lKFG5H76Ms0uy8F/X1PH4dlnHTdPqssVvmOMh0rstbXKn8tRuU94t2I+NtrAdwzkYnG2LpayQhWBfA+ATD1TKQmrzPkDtv89d4fchb+PSXaAIuwOp/1WXZbaAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762269155; c=relaxed/simple;
	bh=YnR8Xk+rfrjWIKNCC383O/sBECGfsEHElNmg1wrLO5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHRobOk94DlkMx1dDCY4/R1WFehYYKN+7TXQuFG3VcNH3oYRQd4ZAdVY3CkKiUNyTXs44vwLjxRAa2S3magCuw1IvqzNq4Q89bl/HKMvIdyuxXeQkSws5IRt61eRxRVP/bJbgJtIL1QzweuKPrNcK3xfRz1LznKwJm6RfcoYe3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKlOWff2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XF/9xNIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfvWd2049350
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 15:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vqopIC4yJDbwil1oh8vhhREvmrvyN/FTdfpv/O18o4=; b=LKlOWff2vhMIj3/s
	c4XOGFbVqGWEDlYaxrxh4BfCKXKahFJIYvlwsxxAuXVulQul8aZppuC1wps3QzXM
	pqWxDQsMr3HWDvb3Q1Vn6I/t2WauP0hO8085kcaUXrIc51HcDj43sbux1O1lCFwG
	G9UvE6tcnzBB0UWHlpggLRSpPJg3UtGkz5grOHWGI0l6Hnhw2uujF3AuU/0xAWMa
	RU2G9pVJF4Pq2Me0ifV7nbOIj8aSzjRv1THVkNZ5NBz/8Ztuwz04HR9FumPS5w5J
	X/l5S/ZTzbuiMaNkLYgbaYuFSom2qR1hIO0B97cl3012Hbvt98fJwxbNJ1EfkrDk
	rDno8g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7f250uj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 15:12:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804823b757so86111176d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 07:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762269152; x=1762873952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vqopIC4yJDbwil1oh8vhhREvmrvyN/FTdfpv/O18o4=;
        b=XF/9xNIj9h8GYN59pwyLwxxFY+DKcpi0+XqVFduWdQq1ye2q/kxc9AD3DFDEmVpBFL
         bIim/vkGNEo6VVrSh7113Z4RWcHYawbI0CAwlr1ZyjLNqg1hAOFtbBrFNS5nCyInKsFS
         cFXpzpAsyesWq+VaVxb/pu+HQ1L2R7FAptG7J23pqOq2sY0i80k9dZodG8p7FwH7ASsx
         w0GBu3XQVvnrh/XuWhz9NxD/QnNxF1uAXxSsHonsgNLH9B4WojWqtliudYSfLP7kxNmx
         ecbvbevKP30hMI4DEkU2uVnhtPW867dsaEJD2AEaxhlnxnDsPw7M58fgocwtRY8evNUp
         jTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762269152; x=1762873952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vqopIC4yJDbwil1oh8vhhREvmrvyN/FTdfpv/O18o4=;
        b=W67EgIpkkIJbqrzZP2f6l8AEjlyibCj0qH+fQo1ZTwib8Gkjcraz3jUaIZZcijKL0k
         GP66H9eQsdPRuBSOJedomquWb52Xgpm157HmsK3JlIIT/jCHl0qLip+tTYj96JJApIJW
         THeHvODe3vHLfQ5+9P4VKXe5i0yYwghGnZwcxOF+Ehe2X5ajAa+/PfGZ8oodq2JIRkPg
         HT5bLv1E5FkrLpd+ojqlVUtYgTE2RwChwNU9t65/qtNQxNihw8mPnh/eFX573bP/Br2p
         utndOKMvV9fxSYiAPFS4qdZnAxr6CqTMr4P5tdPT4iIVTEIflXeSdbtF8b11AupbSFGb
         K4nw==
X-Forwarded-Encrypted: i=1; AJvYcCXWQlqtblC6Zu4SDP3Z2Wf9VruUUAog10F1/FiN/Lld5d5VCU7bxPS+QA6ipuoP5Essouqdp0kQJnFglhR3@vger.kernel.org
X-Gm-Message-State: AOJu0YzemXTpCQPMx7NIWiG5NgqsxlUx3Uwfse3Y1OQ145xgnyBVpksY
	Ry+rxt3+ShaAl+FomwNO1JXqqguXDEpXBxpv/KVuwqzVU7ElnlhPCmSrWNt67tokUNe1aTX9cU2
	otUOV9PM72Ka5su3RrsiXPNiu4es+fEf9N4uimCIH7vGg7niNaqm+q76v3/Iax05GaAMq7mZ/Ik
	IOwkS8n3g3Yr1AVKFujTaLvPpmsyTcygqMBTyCaAJ63i8=
X-Gm-Gg: ASbGnctruV/wdZ5e7BUQBYBF/M5350td+MMP+5vm2iMQ55U1oclULfgtTe1ZcCbelzG
	6UxfQkKn4P2XY8sivrPiHmTl7nIdnWzia4R9JVhguiqe/fVyMZVz/wTzEVV+pKJKw06gt5tafrp
	W5iDJKQdyD9vaGIERjEvcAahCrDyJh7hy7B0zTNjH/YVTET0bQ9vDEaUVegyNKHZNAmMRrQOyOC
	jDSga8Lr8tMp2S9lQ==
X-Received: by 2002:ad4:5f0f:0:b0:880:5249:be3e with SMTP id 6a1803df08f44-8806236710cmr43432536d6.13.1762269152547;
        Tue, 04 Nov 2025 07:12:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1mnAQoxkNokipiDnEZIOKDt4CKNUSdt8eGXRFFPOPQBreNOmC0L7nu2+HY38I5j9Yj3cuvz2IdOs/ebH/vDU=
X-Received: by 2002:ad4:5f0f:0:b0:880:5249:be3e with SMTP id
 6a1803df08f44-8806236710cmr43431976d6.13.1762269152092; Tue, 04 Nov 2025
 07:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-2-loic.poulain@oss.qualcomm.com> <20251104-spiritual-jade-marmoset-0fa0dc@kuoka>
In-Reply-To: <20251104-spiritual-jade-marmoset-0fa0dc@kuoka>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 16:12:20 +0100
X-Gm-Features: AWmQ_bkT9-hBsqBlfk6MvdU7iEm9BTtvAnmuXeeVmxUlfFeX8bUJJwWN2n-kPCQ
Message-ID: <CAFEp6-0wCEttHgyHp5hfSrThN8vqin77SWF9nAgB-QHYu=t3LA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: power: reset: qcom-pon: Document qcom,warm-reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dNyrWeZb c=1 sm=1 tr=0 ts=690a17e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sAukdvN5d5inU9OdpqcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: I8LOqHeq-jDroVpr9P1B7yBiamMnzE1O
X-Proofpoint-ORIG-GUID: I8LOqHeq-jDroVpr9P1B7yBiamMnzE1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEyNyBTYWx0ZWRfX0UoLlaNXzbNL
 BK7znSYE0jzjvIAZJgsjF8EHvYKXBVc76IjJDcMkyARrOtuPmXV6UDxwHXGRtUM6GrPb582VxCH
 UT9O5j/86cepHnYWT6+IEoKuWr9+yVpWTRahHq9ICULZuXmNhEIg2BIJw/VQqi7/cM3F3VV6/iO
 17GxtOoX10/EU17MwbYRoEyiCjHmZersWWwxOLyNMjnrmzqphojXoVerDzEnKZDG7gtPUpkC97I
 M1TaolAgHyWzGWJpuYGjSHSFWRYy4BawW9ynVJwVe/4hhipJA0gf07kL3mPzYYY/M/zz4A6G+jS
 G/cU8iO0gv3jvmMvA2N2ysSWff9evZMvIox7gTSkwTwqLiCtjN5VtF9jWKf3fZjBvNDfxY7PuA0
 9/+vkkRu+hi8QPHR6vWa3841juwiog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040127

On Tue, Nov 4, 2025 at 3:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Nov 03, 2025 at 07:20:02PM +0100, Loic Poulain wrote:
> > This property can be used as a fallback mechanism when a warm reset
> > cannot be achieved through the standard firmware interface (SCPI).
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/power/reset/qcom,pon.yaml          | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yam=
l b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > index 979a377cb4ff..ad8691c87f4f 100644
> > --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> > @@ -38,6 +38,13 @@ properties:
> >      minItems: 1
> >      maxItems: 2
> >
> > +  qcom,warm-reset:
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.
>
> > +      The PON (Power-On) peripheral provides support for warm reset, w=
hich can
> > +      be used as a fallback mechanism when a warm reset cannot be achi=
eved
> > +      through the standard firmware interface.
>
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.

I could argue that this property is meant to describe hardware support
for warm reset, but since all platforms support it, it effectively
becomes a way to configure behavior rather than indicate hardware
capability.

I=E2=80=99ll try to discuss and find an alternative approach that avoids
introducing this extra property.

Thanks,
Loic

