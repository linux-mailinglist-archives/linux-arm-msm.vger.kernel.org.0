Return-Path: <linux-arm-msm+bounces-108758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD09DAy9DWrH2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A358F1F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3366B30F8CA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264503E7BCB;
	Wed, 20 May 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVbr0qqz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYoJNhWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95943E0754
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284650; cv=none; b=SbqIzIr0noIFKI4WSu1kqcNJMsofmtqIJHwQRETibdKUdyjAjFd8oLoy4Ybn/2AiREvdRDLML3o0YoSs/V7WGIazJn1iVX4FELhGcSq5n6xQuf7HpYKHG/HG0Ey9O6AeCuMkyclJKw1IZG10xwMcxQxN7ONbW7uFWYa7KT+jK38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284650; c=relaxed/simple;
	bh=8ZAIWW++k6Z9mhB8Rofcy1NdGaNN4FGMQCXX4iEJu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8w2wqe1mzaiHtLeJDiwuSvzCrkk4RVQ6k+Lnmp4OCO//fTf82TK+dq4yYlykRQJwXF6xcM7JX2FH0PGX9Sf8W68jYyZysZ2fy4PnpcZ2nclA+0nV8L7lhuiwd+CAKeFAlqpV/83NAR8UNRficfQnd+0N1zLPnbxWsGnCdwT0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVbr0qqz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYoJNhWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7D24S1237989
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=560jRcjDyg9F+NbpaPbaEIRF
	vJtrmZpNd2HjsFPSqnA=; b=AVbr0qqzKN9iGNa5ZHb10SMJl2nEPHCZ7b51Jn7F
	JXEHixen8d5/t7VUJqmio/iqMD8PBysDY7bj5MTlzCqyPkGiXHGouCqpKaFPj6QP
	amtvfQurJVHFkhT8SWqarUkbM92gCAOCeJ4zoD7yIS98TrSE3yu8IuWHrlO5m/Ai
	GbPWjkz4j2rXFohlJ9AccXM1KOlqViwtLMj0JXUgzWwPEel7ZLdG5HG+hV2tSPWb
	8yb4G1qIGMsqE1m8UPRasnuseFRPI9PMJnQmHo9TwVzOFLR798klJCEbtKwmR4kB
	tndl2UAPFZY8+TgN4m4YrosD8uVRONuyyNAtkCtcJht9Ow==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sw1y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:44:08 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5754e645c63so11833911e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284647; x=1779889447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=560jRcjDyg9F+NbpaPbaEIRFvJtrmZpNd2HjsFPSqnA=;
        b=CYoJNhWKjzEXEj74Voc6fWP2VEDueZ9FuQW5TNbLplZJIF7uqXqq3fTNtqkVF3s1/s
         0o3XNg15519QVRtFLXllE5/L8tIxjkifpIaXHg3H18BGvi8CDKqf3epfIpCwp0sEsC1y
         H9cd902YclMzE4sRUKSLd76KHEsb5uDpJTHZpakq++u4+7BJqhpi/xO3xHR6qFnzcG84
         M4rPZN5TDhwhJOY1F6/z+Tbcy8ieo30lUoSCDSDIqG+9CWBOqsuvU3hpOGO9agaIuYZZ
         1AruBe+pfLXAqvoxk6ibbooEkRVvrBzpIMvs3dYNiTv9lJcDddKpGXjdnUVC9I+CypaD
         FZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284647; x=1779889447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=560jRcjDyg9F+NbpaPbaEIRFvJtrmZpNd2HjsFPSqnA=;
        b=k2Q3077GOesidPZctCiWT/v+FpPkMzJiL4WF/pEvZ7vByCorFcwZS8J1D+XTeGMfXX
         Jt4JZcKFxAq3QOp+Yf+CCtyvLWxcqCpzvCNEdoB6XRSsCYlqglTqXaBnv9u9coQj07t9
         1jP7cePyS7RrWVaBnwM+y6+8R+E5i6RYvxNYqpQkv7OIBGGND9U9O1l+MkZEj4Pa5TQL
         H4ZWnlpQU87eioU6WrMLqi6QUd6Dj94LZm0rXmDpmJZHy0j+CLS9oWv812ZPQnkn/xRB
         szMqZ4QsTQAymaUzMmokz3B7olQsPk/0Bn4oq21sGgHJwd2LelIFHV9hfcj8J1JSZ736
         rjSw==
X-Forwarded-Encrypted: i=1; AFNElJ+EnxGo/tz602LYqJj38Es6nZ6UFcZKwtSRTi/zZTjK0a0U9zuzy6AD20JEMjxczA8dE8/MAQlzu+mhLjKC@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3sQU41AWdO6DH11FpCo4hbMdGXDFuv8bxHLgVD/fqShQW2x7
	29wO/oV/VehQatw/TnWQD7gwIjlvd0mltLEhDg4iGlmw42pOcNne3oGwcOjX3jLuggyC363fklX
	pZ6uHqEKDKEC3x5IfikQAAGVbSvqTdxK+Fe9JGxHo1ArnuToUqEJxqimS4IsBy8GTv+/b
X-Gm-Gg: Acq92OGRf/8UxHGLCdhHwiH1rANBFfzazLep4o8jL8Ul55lMB/GH4aiQdb47BtH1puU
	TBZ1oiS7aRGP6QCPYGSC7yqDddQxLDWdNET4rHA9usul9FHtnpLMyazFhZeaLC/tPY/ZXCcNvqv
	gug64D9R363VZNwGB3dvp1iGRrjMOKTleE4ZMODTEecEDBZGryckdSMZuHz2RdYnI5NqoY1VBP2
	iCmtz++eSLsWhiI9XJ0xWZgSMDBIfxXzU+rjGJEkhJMWjv85mSRXpoipNaXFqIxyO9lPn1qHRw6
	hbW/Fco3eUwyfhfb3XT1QVJDz8KuXQS/LBcrhsLlazCChXmb7A0ghtTrFZ3IGLUZ2+h1Iq/N727
	4PPDOCzAf2wfw20RCy9O3Jd0uVpotYvfJ4EYUpTei7JJF77OsvKj5AxmV1az2gJyS9hNnA8pRin
	IiSJuk5sJLaWzyUvJTYl1qhyO+IBFDW83lkQU=
X-Received: by 2002:a05:6122:1c85:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5760bfb9623mr14884861e0c.2.1779284646673;
        Wed, 20 May 2026 06:44:06 -0700 (PDT)
X-Received: by 2002:a05:6122:1c85:b0:56a:fcbf:8aa4 with SMTP id 71dfb90a1353d-5760bfb9623mr14884827e0c.2.1779284646263;
        Wed, 20 May 2026 06:44:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc407sm4927823e87.52.2026.05.20.06.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:44:05 -0700 (PDT)
Date: Wed, 20 May 2026 16:44:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
Message-ID: <fr7pojzxcpahwq5s5bhniwbxpjboxsjuc37orpn5sohxo675el@qtyy6eassp4f>
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
X-Proofpoint-GUID: iD4lLshry0KIoK4-Y1-QLi50aU7-F-5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMyBTYWx0ZWRfX+IOkpwRO4Jcd
 3YGWhBUPREENowGhgrEvpw0Il5N4VfkctXvI2ZVH6NOig/PmPBTjOqIwXhnqAk+8OwlC0IM5gRW
 8RAyLIK72HKqI4FTwEptTVgzxQ74b2FnSydi2hmeFsEPLL4hyIvDoG3p6xpYPzc9m10P1NFuvZf
 BeZaEghnHJyc2mCq8TmI/ovF0QRdinCkYECjdeXurNXk6jmtnN31AMj9tX3v8W+W3JFPQwUgead
 7mkT2mGJZ5AvhnsRpxkMrfLBGp8mQ21cyJDf4nPUWqWgH3eCUVVOMIQ3EQNr4FUVkmK6utmBDtK
 j04wk1oLcFARJ/41UYQVLGeY9bzeMCFyEtj9SNDQ/sAPVtqzaP5aFrk6jajWV0kZmkyiYglo/3s
 tVJqTZ9vNVURqet3kAmu4P5qiTfpvRiQcPFoGsf4zZJv6GCiWWyg0Eq90ItbABucNzw98F4SFeV
 RkTDDy1pTVQ6cnNXZwg==
X-Proofpoint-ORIG-GUID: iD4lLshry0KIoK4-Y1-QLi50aU7-F-5X
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0dbaa8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ArSBqUEsZOOXoIw0mWcA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200133
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108758-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 845A358F1F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 07:25:07AM -0700, Gopikrishna Garmidi wrote:
> The Glymur and Mahua CRDs use the same board-level hardware for the
> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
> regulators and pin control states. This has been verified against
> both CRD schematics.
> 
> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
> reuse with the Mahua CRD.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on top of next-20260518
> - Updated subject to include glymur-crd scope prefix
> - Rewrote commit message to describe the actual shared physical hardware
>   rather than the code-sharing intent; the commonality was verified
>   against Glymur CRD and Mahua CRD schematics
> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>  2 files changed, 396 insertions(+), 399 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

