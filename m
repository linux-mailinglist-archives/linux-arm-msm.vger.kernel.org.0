Return-Path: <linux-arm-msm+bounces-101735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMVhLAQj0Gkp3wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:28:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BF39829E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 22:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2EFB3008D6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C6A3D8115;
	Fri,  3 Apr 2026 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMeK7VGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QF6Rmltl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12363374186
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775248128; cv=none; b=P3RwViZe6SjTp15YgIKCo4SeVNRJNRxesCOu5yFBq1yTKAD7rS9IA9c1SsTQWYpC+1gsitVT/LH81VE0Q71mwcYBbyQwt3mOzj7gwuq2Y6O55dGFfJ9MN1lnzicQr9MUHSUJM0Yh5P4qbmtYKP0UaCsD30oGXp9LXJMzQdQC92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775248128; c=relaxed/simple;
	bh=qrrW5DHRneVpOdMcREizH80SwXXqXh1GoF8jzymiKFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc1Q3UF7/gfdIxF4vCxO0SNahX8frBKbvpPicgZ9cLXRKW3M7Is7zHEq0DVlKdlWuYA5nrSlgDTlVj/vVFOZ5HI43qP4/rxI0UiBj9GSmJz7ljQLD9fqngM9y8AY0Ddqsmvh73Js4kXLXprCcwvHcHlS4gkWVLSRTybTwW+wgVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMeK7VGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QF6Rmltl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633G2dWQ2707236
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 20:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19NRcOFC4DO5B8IoTjtidQNHQSolsOYWwFm6ZIT5Nw=; b=BMeK7VGBwhdVTTv9
	FSdhQbn4wZOd8I+iaXF5f52I9aVDhFTFVgjqdj64Qb4JI/7noo/iIeOgvxS1FVQV
	2g1T1mfA771U1Iz9PeVtH4DYppnVFt7fVgDLqJ5dzz6MF09QLeD1SXj6dD0t7jyk
	LQEhMDjrf80Ltw9Zr7TNOgD0Fy4eaWnavEjvjnUk1fo7XXNuIYmUpxPnYTjdXbqE
	PAwKcjbLdLnRhE7t0zxikpK5weTkuo6TengkUs87xD4musE3BPW3GWhPrbIvGVCo
	bsFbAXr/D4RHvJcDdhcm+vyOCyTU+bqQko0+dmpbOEQQEf1ixNNd3VaVDpxeVLdF
	8Oz49Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjknvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:28:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so60751741cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775248125; x=1775852925; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J19NRcOFC4DO5B8IoTjtidQNHQSolsOYWwFm6ZIT5Nw=;
        b=QF6RmltlD6ibV/wmhyEbRILcpTPt3maO4FUf9MUGmLUxV8YWDxIL8sFClFRb/GFfJT
         g4J9mEPh7IJ1Le74GcWu+7qFAoWh6Ti0wCOewyLTKVg2kJoi8CUyFstja8n7NvxgHDxd
         BfJJWORUnI8DtjTpYUHd/o/c5Qz4/3nydFWKr9tjT1hbpQdv1Xuvzd/zRvELGScLwLlq
         wnE28rA9KzT6tal+ogRanEZM4dtOjVCRLu0JpjroMtB1dx3kZkFaWtZYpghf8Rzxr+Rc
         D5JaZS9v1cPt/mW+A0MKVf68SNG4oP1h43kMe/0SZLQ5kpDBT9z2iyZ4yBGrHAAXNDfG
         aRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775248125; x=1775852925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19NRcOFC4DO5B8IoTjtidQNHQSolsOYWwFm6ZIT5Nw=;
        b=JGThdzRWTROeU9LgLNCrkkjDrUpYGTky7uvV3JcmnZzfqHAioTsrkkVmdKhLwmnNgg
         T8pfDtv5pwLKw6Sg0um242kdrtT6c9kyXezNp3xsWa76hfwtx0lhLRvYHBTjg9XEDeKc
         Ws7/KwquSoLmyF5CLi+C5rIOdOPSZYHJiOBSY0H3G2pFPDluOEWTOTgd15D0xRbwpAAA
         G+wH/In0WfPaTE7s9Nhbas8W6TPPTx/awfP8clewmiRvMGEA+6349zRBJhgqxEeYf0wp
         hLM4NWb1PyIylEqM6fnQAYHEylizo/KCkIzwhzLKsPJMnlReCavUAzWcjh+joq0hePQR
         fPog==
X-Forwarded-Encrypted: i=1; AJvYcCUMfRI1XFL3QIcpdi0ZGcIyYj+pUX6wWKsprXvxUZlMVWVvsjUKU8w7QjZXwS/RKEyxOwn+uGb72L8a1SNE@vger.kernel.org
X-Gm-Message-State: AOJu0YxyJ3HN5Ef7NdTyzTGBEQG/O94pR0RwcKGG8UB2OUDXrSREChTa
	R82VNAxzFM6nj4WhVTp08yZStrqynizF3dBmJqVPbzEgWHe+a0msjT8QV7r1sD/G/pql8QUvgsT
	8kQYrGg6i+ZIlOKkW7I1hznwOIMMRQbjFmObkGVwxdVAyyBES9E4nYmaxQi6iJeeMBoDg
X-Gm-Gg: ATEYQzzT8OCvW6J6U2l5zcNrrGWZoh1myNQmkHPACJnEAxe19nr7GFvsKJ4/MhrLlOh
	y6Ts/RMmI7JcfWIHrN3QHFLvAqgTMiep2enS59xpSXOOiM7GzaFPGZXE/lMCsLpiY2Q98ptUFNO
	4LczbaIHU9tI/mNvmsUkSfFIn1bZZO1ylTVG0s7PrUhtS89hgVRi+BpfSAVSwJ3s4ZI4MLMMYpO
	cdxTXacP6UJ+a0tT4FBkb1Aneed0Rzg9l+Y0fvcw8lARNfg1ZG+DBkFZUnaTWBlgwnxNmYWfDlM
	K7NlXukaygn2g/pmfLyUYmUAcdU4EQLcmtTPBfSGwDjsVZZbn3yYix1ehfJGXUJDJnyNTRaW8ub
	KwrlJuxzkn+GYiWji5S/vEG67J7yXZancd6IQUBEHt3YoBvJtlCDtEBerAsGOFFcZyECCG27k9K
	sI9MogjSPpA/73kdzf2ESPt1UQLXkAUpPc6Ok=
X-Received: by 2002:a05:622a:153:b0:509:1e54:a501 with SMTP id d75a77b69052e-50d62614df9mr67424931cf.9.1775248125296;
        Fri, 03 Apr 2026 13:28:45 -0700 (PDT)
X-Received: by 2002:a05:622a:153:b0:509:1e54:a501 with SMTP id d75a77b69052e-50d62614df9mr67424531cf.9.1775248124765;
        Fri, 03 Apr 2026 13:28:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fa84b0sm15396251fa.2.2026.04.03.13.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 13:28:43 -0700 (PDT)
Date: Fri, 3 Apr 2026 23:28:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add monaco-evk-ac support
Message-ID: <zyarcaimg67uivssnm4uxqiwc2jadolf5kx6moycwlbzhg4gmv@xa75wcpotzpr>
References: <20260401-monaco-evk-ac-sku-v2-0-27b5f702cfba@oss.qualcomm.com>
 <20260401-monaco-evk-ac-sku-v2-1-27b5f702cfba@oss.qualcomm.com>
 <7baeajhlqv6ujiqzmknjw3h6qr4mdw6qdywhaczm3c42pzjiue@nsgcbd4jsba5>
 <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f2612b8-5c44-4934-a625-27a66eeb7bdd@oss.qualcomm.com>
X-Proofpoint-GUID: 3C9x3TQCsHFeXbRn3rrtgeFEeoz-Uzny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE4MyBTYWx0ZWRfXwxWOCr1SBgKG
 ZBGFk+qrlrb90qT4h3bRCE2DeAho/CPH5JP3YPTq+wYsTcfHRPJuj0d5KighBNcxKcx568AUsKy
 oYXX/nPBBh0vn4OCltE7ldpqJjuI7AMmggsCMKxaotU0K1/3nK62ZbAPUR7Mj9Ucj317x4zKgUE
 1KVF4QYE4IuBaYPHcNWoR9qD4IKk+96fGTSL7v705+fzxXqJxYioGYdVX2q1GeuBNZ+obL4M7H5
 9dG9kEwUNH+Fg4WInc62CMCJFbNrGJypt1p3HG96JG6RuT5O7mOtP6n4jQE8JjJbHQNzNH62eh3
 iP0gxcvnPLBlupWtfYoHiX7b+Rv8TAI8LmvhheZd58FEkGDORXQek1zITw7bPMDY9Tqo04qpa2x
 twEYoi2XMDpV/x85Uhuo8WZF9LnC1qJqSdnCWeers20Ik7v/ZXPDqek7WNF0D/j54/5yN2FSDZU
 0brJB/68s6leP6b3V1Q==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69d022fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=bypAB7O1tipGkwTwlEMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3C9x3TQCsHFeXbRn3rrtgeFEeoz-Uzny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030183
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101735-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 533BF39829E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 04:14:28PM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> On 4/1/2026 5:06 PM, Dmitry Baryshkov wrote:
> > On Wed, Apr 01, 2026 at 12:14:42AM +0530, Umang Chheda wrote:
> >> Introduce bindings for the monaco-evk-ac IoT board, which is
> >> based on the monaco-ac (QCS8300-AC) SoC variant.
> > 
> > If it is a different SoC SKU, should it be reflected in the SoC compat
> > strings?
> 
> Monaco‑AC does not introduce any S/W differences compared to Monaco SoC
> -- All IP blocks and bindings remain identical from S/W PoV, Hence
> haven't included the SoC SKU in the SoC compat strings.
> 
> Hope this is okay ? Your view on this ?

You are descibing -AC as the main difference between the kits, but then
you say that -AC doesn't bring new software interfaces. What is the
difference then between monako-evk and the -ac variant?

Also, from the naming point of view, it is monako-ac-evk, not the other
way.

> 
> > 
> >>
> >> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> index ca880c105f3b..c76365a89687 100644
> >> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> @@ -918,6 +918,7 @@ properties:
> >>            - enum:
> >>                - arduino,monza
> >>                - qcom,monaco-evk
> >> +              - qcom,monaco-evk-ac
> >>                - qcom,qcs8300-ride
> >>            - const: qcom,qcs8300
> >>  
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> Thanks,
> Umang

-- 
With best wishes
Dmitry

