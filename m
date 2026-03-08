Return-Path: <linux-arm-msm+bounces-96070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLDaDriqrWmE5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 17:58:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A4A2314C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 17:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B3C8301C559
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 16:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8583876DE;
	Sun,  8 Mar 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVRoAiz2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azIZyKdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BFD389116
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772989045; cv=none; b=c49sKUg9FHbx6Au1t+iQJH5qA758GaHrRM9cD2oOq/tVkGusjaMyOee7rcl6/+aCa/tsDTrd37/YFizM+J6sUmRAyFtpLMJG5Wgah/dsEWbzorbv7PGV04pgk3vwxt1yLQw0YZ++WXtqZq0okYgBogyX7SuMJaoSFqExJ8h8jRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772989045; c=relaxed/simple;
	bh=X3wrQSXnnCcmNuhfF7cnxRhEbjLadrA8sMb9cRcRBrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVUEWN4hkyaESdSGfr15iaLX0lZkrwRA+5HNAMydH5spwphNzuiZAmrmScpsUzhDxkcV4b7Dl6t4U4ot15Wv1W0Ceq9HqHvitdBRgD7n8+R39qhjHEBBMgr5lEXev7ezDhj4PcT2Xd/x5gDZrMvOSo8gRWITi3OoZ0XWLInTL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVRoAiz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azIZyKdI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285h3p8500094
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 16:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAM93eomdwoH7HQgq3/Vroer
	EAtPZOSWavBhBp94HMU=; b=KVRoAiz2iDzEeWJ8jDRkRn/zNE/17fvaMFqazqeF
	aSR75uOVVzQuRatYm0JOU9NW3hM4FY5FpXbiSl18M6akwgsytjY94/U5ATVROXnV
	o+TuXZgAJJEUOvV/dcnNQ/fa8kBkDO8C+/7AatvAqG16QWYfSS5GnCBvt1+qyhUm
	sZqH+CNd4jFYvrdpuLveUaPZSUDU0TWgZl0g9gdRe9PfS1T+vizlSPQHQbUGK37a
	O6L41v6zUdLAXUbN/GRk4Xmk6HOo4qh4rtzL5bBcz8p1ch23bdbgDmRWby3Rs11E
	snaVYZWT6qN6QXWIyaHtAiWlC55TxdSabThWRoAek7jQWw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg2w82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:57:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-899edf01747so558426356d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772989038; x=1773593838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAM93eomdwoH7HQgq3/VroerEAtPZOSWavBhBp94HMU=;
        b=azIZyKdIvx0j4d0KRcCU4rsuygy2aLYlc2b/XG8To4wLQiyhERsgAxyt32/g7XDcVx
         l9HSGkSE3PIL/H6sZorWaw581sQno8eYHx+V2QKVgPOeM/9nGzzDkj52aEteuF6USwni
         OhuYZI9xgzJjH8v0Oixi8JTxNIqWgVmPrqHnOGvb+WaX8W3AMjc8PZhfahRevynulx1q
         9f8fmCx2AFuqMst93Ez6CjzSOvRIXv4PQd1jTEs6rFrAtNgOkRbjwjftLXza2KmPPdkE
         mUB0/ZQFPsXQWqDzG1gRjc4T9Jp9FcW6GmqK274YjGlkmqk+EKYUPwJV3cb+nAja8KSW
         xacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772989038; x=1773593838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAM93eomdwoH7HQgq3/VroerEAtPZOSWavBhBp94HMU=;
        b=hZ7F2gMxu3k4zOWSS5d3+Lcq+NfecLcg3VG4pwb1EZkcPswgbnn7CflIecC4f945Ss
         jiEDM7SXi8/BSy+yFMUR2GmVZEGeKZFnUtAaS39fzp4TM6kvDZWOwOosULYf3xEvCLkQ
         C62/kkq/B16G8IL200JxIDoXPhEXDO+MMLZ48nPguaFmM7YKD1xxEi0C6SvB1fIhOEwX
         6a81pKn/7nCXTbZaNmia7N+jz55ExQxcHlOOJSuJOkHp4z2YwZWhvtrgPnU6U3IprSuk
         jhJvFGbNCD6jqcvn3vmwd9VU6EY7p0AlI6Hu7B+IQB8JwaLRmAoh0Kid81jKQHbVrC/h
         O82A==
X-Forwarded-Encrypted: i=1; AJvYcCX3/SmOYVH29zEW2kPZDANhQJFHdUKaBAb2c8d9PiyJvxIAybMUqLjINoT1icWuztgjIN0roQ1eym0CXxaa@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3vabG76dKJlEl4tnPdlPwJJaOIFwsFZ/6GJ8tCNv4FohyTuE
	w9EK+m9VnhjVLGgw1e7pQG+/LNgskFOcs9rHDq7oJNqIQB0rPMLRp5uF3wzNKbj2d/A16WhlBIv
	EQjC9mmq4DJ38u8aOdNKz9h1eu+C14YAI4hEm4Zg9UzkZ5Anj2abg5wTft1WPhVGc+Vd+
X-Gm-Gg: ATEYQzwFzFeGQslaPES1PkiNqPxRzqKwG5QPUkBDlKBu7NDvoohM2We1I0KMerevo+0
	5F3EfPg5gkF6P5OrtnbgPi/MEVe+KPEYuJY9dSUl4g/6+1IPZ+gHtjCxvWuYFanQAIeusA3iYHx
	bpoAfElZANl6TzLgpv34aP+iJx/Wnh9iybf1DAJhWcfynDL93iZxJ3TdK1e+q0KUe7h/MobiVNR
	uHbZLvWOQq9VUAU76FxtOuNuserf/oOhgbhQ9/Gc70na/E/b5uv+mW/ou3FI6JO0/MIAWRCxk7h
	LOWlj4EuNemV6xU5dUQpqbgnysyYzeRKUxLrKJWoFKvBdaKwiYzHFVewYgUt3OphaJYPRZd2RwE
	CcaSF79ihz7wbWRGFHEN4g2QtlPSXbrfa6bYAsp/ATl0xJPU7cyK8YKdun/y7BihmOA2g9CSMNl
	zZtAMMcumbKn08kb7ZpbFHxwvrz6lK6eBOGEE=
X-Received: by 2002:a05:620a:294b:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cd6d36c445mr1018185685a.20.1772989038121;
        Sun, 08 Mar 2026 09:57:18 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cd6d36c445mr1018184085a.20.1772989037726;
        Sun, 08 Mar 2026 09:57:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e074sm1631045e87.59.2026.03.08.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 09:57:16 -0700 (PDT)
Date: Sun, 8 Mar 2026 18:57:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: Add inline crypto engine
Message-ID: <zq3rqekjzvlhsnya2knmvz4xni6nugl27lm46f3vferfywbdju@xe4d77lus2ro>
References: <20260307-sm8250-ice-v1-0-a0c987371c62@pm.me>
 <20260307-sm8250-ice-v1-2-a0c987371c62@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-sm8250-ice-v1-2-a0c987371c62@pm.me>
X-Proofpoint-GUID: 8W4gj_anNAex7EiMG1IHourWIDVCmTao
X-Proofpoint-ORIG-GUID: 8W4gj_anNAex7EiMG1IHourWIDVCmTao
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69adaa6e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=F1DPrRZ4MOdNTT26lOgA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NSBTYWx0ZWRfX8GMsE3Xh44bn
 +8rUIbCYtpfNnrasZExQrKQcaTn6MnDL6GSy/Cm0p/ptnfcfmGfW65p+cBQEgAIPvUskZjeMQyO
 +GzyJC5jMlp6RuRBS4HdGs4Hzb1N16j9hCPaqHthQEEKa1MJ9Mxe9ZlqdtFZXLS1vfFQ4vZbXwZ
 7AI06BvrBklF5+BSwzA0oMJbnW4l2ZrL3xZ8SqYWlZalPL3WVhjHo+enEZVYJnRVx3DlIISuVIG
 L1pqicCAfbBcRGVpliuz4ulSNud8PXgJHbGmKnnYxsraCEt5nK4PBY82BWQLR8S9CZVdviRih2F
 8ZnXL7q5mp9424D5KBaY747tThgAFeNFor2qRszGtiLQDuq1+UB/xRsUek01LOnF/OBqF7kiJhw
 08Vr/uCkxnRcWu9BXwWjsMvgKTdk4TeZYBnGngE/F1pFieG2yrpuPe2KfKbkLyCx+6/WS0ix1xU
 CSN6kaXXRXohN7cXIpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080155
X-Rspamd-Queue-Id: D0A4A2314C4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,pm.me:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:49:05AM +0000, Alexander Koskovich wrote:
> Add the ICE found on sm8250 and link it to the UFS node.
> 
> qcom-ice 1d90000.crypto: Found QC Inline Crypto Engine (ICE) v3.1.81
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

