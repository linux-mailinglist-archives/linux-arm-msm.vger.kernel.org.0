Return-Path: <linux-arm-msm+bounces-102926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DtaJwW/3GliVwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:01:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F33EA222
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1471B302A682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B274B30E84B;
	Mon, 13 Apr 2026 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvElgcEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwG+ewSn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B07D35F8B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074241; cv=none; b=i+UZsqX9FEA9MHbIkxt6VDhO3WykuK4jRfn9m/RRoW5hnlAY9XqHeul0zfEGGaXr9NvZfQ2p/MNwX8maYHG35oCH8uR1iHm5GZHTM6iAdD2QpCLe4p7CoyVya9FBkvbIJvitHuLPXM6ReSzklKm8q97fPSN5mJdpjbcMx8qurFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074241; c=relaxed/simple;
	bh=JIK9t/UaT2zuGSoM5C3ZscOwrjZcIDgMukjXlrPNlHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0JIzmI2E+D4PNz1C33DF1veMbWiV0NQRrWbQj6+tkovT41iA1nU2GmoqWSXGB7uMaOSwzgdg2jw3LtjcEpNLeMpQQG++616JAbuc+qrvC6V3b4UhSiyO/AAd2A/eyq5hml5DXcoqvtQF2qvRampMJApQq9/uxeuVTQ6n+t8NOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvElgcEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwG+ewSn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7TmX53828423
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IePX8ablR1DL6tpkqZbrnc9SY1kinjPFiiuTjNwkJAg=; b=ZvElgcEbcftowOIP
	gkJB3OqoKFELpTxRt+VZFpjxHJzGmo+fBUGA/sxn2rbxX3UKcNz8Z7OmqeCV6RLl
	eUQhv45XR3iqUMLs8g50MS1f+QVjH0kzQ4f7aBnJXGBGp/0YlCSbQKuMkGkoahex
	dl2z2EqG4X16NeqBQ9VIMhJh2parLr+viy4Dr+4QSTDngR2HJl0ubWSZI5MZm46o
	FB2ktZMbSgYQ6KO2qpKYVsSOQ+dlRmaXUoq3Zvme6eJK/+43ZzvzM3l6lOze7sH5
	pbbqHg3JdCVlZiU27TAJgqkcJ9c0cxq+3qDVA2lbquJsvNSW+qfXGizOdbWvzTq2
	43YjTg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpcg7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:57:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb3741d12so904656d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776074239; x=1776679039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IePX8ablR1DL6tpkqZbrnc9SY1kinjPFiiuTjNwkJAg=;
        b=AwG+ewSnalbT2WUw9tps3Y+0LbtNdCpoJNSTclNrjk7XlMHWf7JOklpp6otTRKuJbF
         qjPJGiC/40+cmokiaFbSJ8Te/1k24Q3Am0gMKFB0mMsj+nGDD3PNPN1jYySMk2eo1Qp4
         5oR+F+wki+H64wTheNEEKzf/mECxi79MS5+ROMQ5yj6Eng/YNQY08m5Nl1NAFh87zkIx
         S+vWtL2UjOhon1aZbwatncPLnTndb4Zq3JfbQZScKn37xM2cSShznnUt39AL3/SwgxZ5
         /X1RS0RfZeRKomsyxEKEvzGhIdSWjZJR7QxyXs5hYkTbLGRdjmAjAuFtDydaBb0U+shC
         pxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074239; x=1776679039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IePX8ablR1DL6tpkqZbrnc9SY1kinjPFiiuTjNwkJAg=;
        b=CryLBqrSv5Ko0uaUcFq13yudux8uMWF+GdIRORdxFt/lbTPjjoiLYAWzo7t8Kq2ELd
         Eq4RtKlsTrYn1ahpdvzXio7arBOigusj0Ei0rT4b57tHMa1nk4uu3EsHbnQd0BjmErOB
         2wyBFE+7OMe6ADIquEWloTTZFGuy/jil/EJEYU+fSNrzSJDGrAwJ3MnhRua1Bx0/dyl6
         wiUmVNvs6g/Lz6UImskG3Lhvv12UMN2hJeErGKn1hTV0gEZslXKN+bqto303YjMxQHul
         X1TK/oG96t7EVvcBVjRREQZPnxgMMRbLvmOf8ju2wAmO31yCASW6QVfwJZ9XM/yxj+yI
         4o7A==
X-Forwarded-Encrypted: i=1; AFNElJ/aPmED5z2qHNlTscM8WwdAp6GMWKkSjhz+WSxC1nzvXmre7fHkfVQS6ObNgh56CnmBjr2zoUo/EnQLhdtE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+2CBW2bZlu7QooN1kaqOIVd8ZXWP2SNxw5JC82OKegoO3ubd6
	aELdUM8g51sp2NX4ss+ZBogg+gut4EYQvtaW85zdKNwbVRYVihVk2eX5ZjFaUprVjaGkRLNDwq9
	LN5wMfIqbUBD8BW7n8Ppo2xcVTOmOtJQU6KyRnGEb0pOC0wU9/2SZE3G2C1+DoOEGecaE
X-Gm-Gg: AeBDiesjY3UbP7EUtFoBM9eOhhBO0Exps0e+NRlIx4HPu2XFWM43TfQOKSr5sTGWG3W
	HatfLMN8n2mv2cdhkih0FoYzjN/7HaSEIanJqMPhNupgsIg77VGBabeSMIKxmcRt0xcmaNiW2OT
	4wnlbeBWJ31fB4dcuN9C5ysFyCpUGwOfAATzLgY2cSHsywLp88QEAuUosvXy6FQHKJIOXfToiKZ
	wJHfP4tS4pRDP8xCxvTAKR/kM5zKHiTJXap0IrjRUO/2BP7nG8WdvjOz4bRXVxj9kvzKwG2aCUr
	d7LnSZehrj4vFEwsBdBu3g9PYOnfF5QQXmI5s4LF0ncIpp5ByltO7t1ybewQRR7pMONusgLz25d
	bTmsJGaA4rEv32KhpfA2UrMWVcugSBAW4Z85SE2IfkOLglbQ1+oAmGxSKwV9KRGKlkWyyL7BF6f
	LgUCs=
X-Received: by 2002:a05:6214:c8b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8ac8601ec4emr148565586d6.0.1776074238882;
        Mon, 13 Apr 2026 02:57:18 -0700 (PDT)
X-Received: by 2002:a05:6214:c8b:b0:89c:5fbe:cc5b with SMTP id 6a1803df08f44-8ac8601ec4emr148565476d6.0.1776074238392;
        Mon, 13 Apr 2026 02:57:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm297114666b.38.2026.04.13.02.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:57:17 -0700 (PDT)
Message-ID: <2ce5e773-2b48-447d-bcb1-59649cd28dfb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 11:57:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: cpus: Restore qcom,oryon-1-4
 compatible
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091625.607976-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcbdff cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WBqP8z3UkF452L6cdnIA:9 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 72WIhIFFDOhUpvPXyuKU75COxWt55u_3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5NyBTYWx0ZWRfX611ElCUDaG30
 CYibKddygmaqcctrvog03/jeUu+pbT6vfi3lvaOK3Fb6CPXvAQMKr8hPbbjsa7AS80OLPFgGN6J
 cw7VDJlEbgvaE2c1Ais88rXl2FphpdBpB1mD4B7aKRPjfYTMOg0wxzPri/LdpL9DdH2YGuVykA0
 2Ho1+DtJaqMU0xBHdqB9DgNjkCUK+o9abIab+K/oIDnJaNYNSe9pMGNGuP7aPHvrecMvhKsjVxf
 pbGvEpjPz5mrUvefCCDQmJ+MBSS7KfBqgij/bXC8TCYxD/2vI59yiXZeUcmP9qQD2EjSyNb1bwE
 qVuP0Fin2BxDsPnRLfbO0RT0hyI0dhW6DP/BEkgXrXaRb2doRo+as8gKJ2UQwjqw+QiSTPRaxAn
 LWWqRI7zi37ABiqGDgRQPZhDl7Nhig6Iibwh6zZDZtJ94043LYpIu6zLDPW8F/GJFv6IktiEbrH
 vhQsTGI25JTIyfm510A==
X-Proofpoint-GUID: 72WIhIFFDOhUpvPXyuKU75COxWt55u_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130097
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102926-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB3F33EA222
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:16 AM, Shawn Guo wrote:
> It seems that compatible qcom,oryon-1-4 was accidentally dropped during
> the conflict resolution in commit f6935ae6147b ("Merge branch 'for-next'
> of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git").
> Restore it.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

