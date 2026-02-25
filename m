Return-Path: <linux-arm-msm+bounces-94076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHJ9KEfTnmnwXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:47:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03900195F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0DD3312AA1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8F423D7FF;
	Wed, 25 Feb 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nn/rFSM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH3Bw+Sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A139280C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016139; cv=none; b=P8QSJRvCTAvzZoLLwFVIG1MGFzof0leURoC/18ozir9L0zAXrF1jBJw0hh/HX/FLUdQKqrLaof4x16e33i4vRj4c004DQ1Xbzs/v7NyPaYEVjdWibFTPo5UumBMJ6RaMyVnO+qATCdp+DyTkOviX9DQdp+Vu0ZwggOHcUxhzz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016139; c=relaxed/simple;
	bh=0s9g4/i0x/T/4PRoIv/GL2S5/ZBeCW8BEvbWYUcbLL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxtnsVj/THuIcPdxqbKVR+CzAJoK2GXoeIP9TDmvTJJI+tORscipoPyLV50RoQWhxubTN5FfdtAUgIUhproENw7d+MkY+m8XwuEsImw0zwxBvmdW9SD3wXorB0JsDNFQKI6mmcLffGPyfnbtGzUKRTklOx//gP+jRTJ0fwp499w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nn/rFSM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH3Bw+Sb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9S3bf3057168
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebtEBQ44KO8bA5BW97WiwZ537ZmKUUoxBiJEqqTAc80=; b=Nn/rFSM58InaKPnI
	rlYTjp15i2PmF54B8MGxq8Dmzjss1I3DwOdPOTiAGnSoFtwvDQwRvn+QTWXHkSJk
	eVLnS0SUdkQLyTzyi3/zPJcEF/mKmtIXrWseI97SUmHyogXZGwBfMagDhM5VFUZS
	lhaGndAqpGfmt+DmgrFaPOKFY9JWIoBgdk2kwtywxYAOHqCY5bLsYatP9RmBTOmT
	IlT2a6W3E4AIkRmruWwP0pqVkrOqWTJu+bIbF648odeT+dVvKGDZelUD1Vv/z55Y
	FEM7nrEf24frulb61Sna5L/eJ9q2W57bAllQLVr3caK54E3Cr5o6Zg1CgAb8toRt
	DcOMEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39gbhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 10:42:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so624154485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 02:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772016137; x=1772620937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebtEBQ44KO8bA5BW97WiwZ537ZmKUUoxBiJEqqTAc80=;
        b=gH3Bw+Sb4mQDHBXH37HSSCOplwyaa9EYSbbmaqrLBe/C/ioQN6D3FBFnYgM5NjqD9o
         Q0+XuKooRzx7EXsjkjsLV+XrWXaX9y2InU1xyZpqbjldIQndZKHnAFfOU121IGucDASn
         M4kLGt6Sw52HM3SotA/q4Pv1qPfgZ6CplC0LHBScLmTY/otGIQvszvAtc/K2gROPAupC
         Q53ddeaZJMrJddE/Dn3MbTikNzDTYuXn+Sr2OG8LtzNduhwiCMDCihAmfb595VKf50aG
         XEQ4iQUu1T6PUosqsQ05oHLZ4dzcRFPGfubn9L571UYBaSDpdlJgvGaAvtA5PF+vBY8d
         VdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016137; x=1772620937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebtEBQ44KO8bA5BW97WiwZ537ZmKUUoxBiJEqqTAc80=;
        b=KR8jrZjBTKliIBLAmTvB5yiKWJ3t55fWfXb1BfsC3EQwO9CK/m+NJpBQ5/RJtr15oI
         8UEDMLoUq28xY9XHk5BJTxgNWdYj/32UHjfoI7+9z2GR7f7mvamZ6pez/FrOieHaW7cl
         inp62xRXDu2qXF1bEW5ISHgqCTTQj4busO2rqj5IPn6UlLDZk5R6ZEPNM6gRhYSq604L
         aePW9OhHLOhxmc1zxW9LxcX71Gw772Ss4jIgDAvN1d+yplSURmwA5w2AFiBrBH3vK6KB
         gybrZ2VXlj05aKaXHz+GeKg8SYJmTornb8pCSJIA0uEJQ0AxKZvhgQaOCdiFiFylUjIn
         thKQ==
X-Gm-Message-State: AOJu0YxiwwVJ6fDJjMDxF5UDwQ38FaEJa1FJ7w1BiiKy81W61lTz4b+r
	YomVc7XuxQqltIEfBINe4bexuraIRsvbY4HRw9Bmqb3JpETqOQ54zjpSpTCM4BX9xlUoZ1045G0
	Tg8vuhcVxQSo//Aud8Pq5K5TboeUYqxiU6M4s8PO2d+65BkbXbhjMBeC8PQeuNH72Mi3m
X-Gm-Gg: ATEYQzyJNe8L+vlwH4BJD9CXu31oqWhyE64pB0v8R06K4Bi64erbQeDREDN5AC3+kwM
	0WsDKLDkDOmCNUQ4aO9TDS/2zbUhvJsVCYfPp2QHYz9Jf87bsdkbpN6dGUz84Lgzy25S9zWixvB
	HcE2hHXZHpssWXl8wWHEaQyXhOGrqsKbEX7IT/YqS36lhtQCFkeG3aL98HH8aUa08lZaWrxhYpk
	9qrHSNdIsDMUgNKAsBK6nuppDcahJLWfd22AA5uURQGn1mZ8VOFLnM6VPkgSbTwby4er/ekqMJ0
	HDXrlz/d+aXB0jiRMIzpgW9AKNLuQ0ouyqDpEc0tPqny42tZpyt5F8Plki+TdRMOwngfUK0rmsQ
	2uwf4EMCRm9/22rN6HZLVAkGLT1k/cU64jHqAYq8JC0y5P9BnV51yjjMeixG1T0Prb3NRplDFK4
	YCqFw=
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1473554485a.7.1772016136951;
        Wed, 25 Feb 2026 02:42:16 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cb8cabef31mr1473551085a.7.1772016136481;
        Wed, 25 Feb 2026 02:42:16 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4160589a12.5.2026.02.25.02.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 02:42:15 -0800 (PST)
Message-ID: <6d9bb537-a7be-48aa-9097-0192392d32a3@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: dsi-controller-main: Add
 SC8280XP
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
        White Lewis <liu224806@gmail.com>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-3-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225054525.6803-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwMyBTYWx0ZWRfX6K0jYFQ4CTNv
 I1wSPk2CqADq6kPGVuoaMxtNGNRpvWyl3qSX5JPJKDBR28pOQZu6a63UPPajlGxLaeS0qOtjzkX
 clmkmjivdR3+DIJtTLlmge4/Iqi/Y4x1MCRynz9FOZqyNgloR8fa4kvM568OekvcZc2xGeNu5nW
 49trIrrhC4SnWXoFg0K2raW4APTWZQdepEJ54rRWML0wHrSZK3gehECbt/hWJNf5KwQApPfG8pD
 b9cBgaSxcbgKkv1sMi6k5K78Qdc6KrLIpCD8aM6+7Ej9qOJQphgyXxKYpTvZfqbl+AtOkQ0J9AG
 goDUVl7mbQyXe24aeg1r9hFLLoISm7R1Hov84BdMwR3QB4zjh0mjL1021SLCJBlWuGCP+u7oPIo
 NJiePVTodrfnoJij0sH/R2TAsq+Q7RuQX21wAy6zmKDQ4kWtFMwzSb9Vx+kaDkw0zmKhffu1Qz9
 9mC/ELv3DsM7QPGHL9Q==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=699ed209 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=XmQorHVxhl2AQNUWPSAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 72maN-naFUjMUO1vXpuTO5obA1RBlDZi
X-Proofpoint-ORIG-GUID: 72maN-naFUjMUO1vXpuTO5obA1RBlDZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94076-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03900195F9E
X-Rspamd-Action: no action

On 2/25/26 6:45 AM, Pengyu Luo wrote:
> Document DSI controller on SC8280XP Platform.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index eb6d38dab..e6aab0e6f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,sc7180-dsi-ctrl
>                - qcom,sc7280-dsi-ctrl
>                - qcom,sc8180x-dsi-ctrl
> +              - qcom,sc8280xp-dsi-ctrl

The revision registers match for this and 8775 too

The latter seems to have a very slight difference in a single
register though.

Konrad

