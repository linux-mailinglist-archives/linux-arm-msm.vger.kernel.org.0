Return-Path: <linux-arm-msm+bounces-101808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPlwAQh90WmHKQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:05:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 988D239C83B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E1C203004935
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705E6346FAE;
	Sat,  4 Apr 2026 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVN9E8hO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctDqQa76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C1034029E
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336709; cv=none; b=k1qwNc+NLq0ywGLmdX1YjQGeb1UdkyyhYHcCTTtWpA33/F1D4d8DvRO3lFEDyN6bv3oXzsZbuAuxgxDiFFzlnQoMOit9nUyPDC8lPldzHciZncSV3zcrA6+xXplN22zAwFy1JzYsfm2ZuZMufAgGc5opQkza37U++ZENpNViRbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336709; c=relaxed/simple;
	bh=43aB3Yxbi0z90zDEUpqs9121Cxv4GK2culeC3+AvvS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lA9PTwVaBoml9igjnaMehCYHEBcudI/4E14KoP9igECZ6sPRHf2SeyUgS+n2yXPhSpOglteBx1oE4CYFddLEu65JtLFtPVQ8u7gjqRQUZ6HscZCgBBeG4lndngq7vSoKo5YhJZkYqBli5XGkZU1qMrGuDiDqeJVY8kSuntFdBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVN9E8hO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctDqQa76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Jkghj2408615
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NMHRND1WF2PTszeMkEbK4Rv7
	Is+/ycLti+5TAZCpHVk=; b=iVN9E8hOZa1RpoD7WTkr9/Jv2ORtanHvGTjhxD8F
	tPX57WsNdzxs7dfX1UN8+X1zaDOmNRe0cYihUBRnXEkIcWASaDCx3XbqdxTYkzID
	yvzJMb2c57ipLNLdPxOMuWjt04GmtM2i5zglJNBkdfodKt9Fp0+5ReuhCZoqUnPF
	d7E7JvFXQvPSOBzyt+UOu8cS6TBEnVYqyhwzMK+LUyoue8ylf3W4TgLEN+MwsV3F
	Rf2/4Ey3cHmU5NXClg/n108G9/kIrcVeSaYE/S2HLtvtQ+GbANadnN1ZPWQA+xcR
	Bnl/ded3OHT8neY3MaLHhEtHD+qLh1t6kjqXzNEINS+7Gg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daskrhm5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:05:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5e32bd79so49493281cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336706; x=1775941506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NMHRND1WF2PTszeMkEbK4Rv7Is+/ycLti+5TAZCpHVk=;
        b=ctDqQa76lC5JfoGAvQkmgje+gikqBdzyvtAkMTESH4Abdmw6BJ7tcqwqvAiF7cDRt0
         rjJPG6nFz3we+CpjxGuB9HDRe1GsiffmYgK7RbLKuGHC029vrENkhmDv4MtGUsCCxpDr
         Dro8Hjl5xKt/w9mVkKqgxaaC2xWsxU8nIFCnT4K7oB5BNR5U9ufopkkgWA1xXWZfSSzs
         UF/EU27/Nc2EDfgq04DtpIYfSXAQn/bx47fbthEqgAxHXvQSw9UV92yIxJv53ab/VqP3
         z3ms6OYx0mJtXLLwmY4kyu/udzUu46mf8VrvmEIF4CnkL9MxTaND4nmDuon6SJ8+fhT8
         z/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336706; x=1775941506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMHRND1WF2PTszeMkEbK4Rv7Is+/ycLti+5TAZCpHVk=;
        b=rmlc2ghu84/T5+0nu5isIlASW6clDydgn5ceyAs6GDwt5YCWHlZ/YigpsrADixDjBr
         PmUZVQoUP/0jaHe7xlRfayQMttbmgHVa+CIG7b/NpNvqVPBfxLjIf/U7GwSgbM3IYKhd
         4mvFcVRlEaH1v4044qJCzKs6eDlgwYiHRs2t/KbbhBjnTAooAVA/W58xd1xTfqhErxc3
         7zBxlKihw0yGRkqr+yg2xWr8ta06YHdsu6nk3Po2kAvWAzZxVM7K+ytT+Uyv42N1tHDW
         3f2XQqEyNl7FBAioqdMlDaLmG/fZs2YjzM6bSYlK8bNory9IqDWIcCFxPQrJGvs1VrJH
         L70A==
X-Forwarded-Encrypted: i=1; AJvYcCXl1sA3E7rMyeiVHGaSXIDi0MD3g+QbT6sOYT0KUW/S3y73elkDmxUD8tIUT3HkpL6LVI8pXDJOnR2QAVHF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PRMACtKTd83VdkrxHwm4K/CD1hEpEaf5Dzm0FiaMOD0iwGNz
	aOsQNMC9QdtKsTgE/zU6FBsAYwx/vsg8/HfnTEHhCDO6cqRxeazp2n8f0F85RDVxp+ocaemYxTW
	icYhFD3f7Xb5v2B9+QS6qpaFdJzUCI9eum2ZuqBpT0zPN0Cch7sZDJX9hJcY6oWMxtQj/
X-Gm-Gg: AeBDieujDhDpIGtSySBTI9RKdYxqZE6ETBuY7qG6rdra6imaFC064yJruSWVo2yGzj+
	2uKpqwhXy5BPyQKKSCO/56/NGD0E+Ms4uNU7RPfWoB8uLkQuMeSO+hB2+tQb4MWSVnrMvFg8mwf
	abl8x7XHabd6uw/4P/J3pLHsqLZRXDdEwLaCwDIgb243BSvZAPxsBxtbfhXljSz7g7SR7Ul52oG
	mF04vmzIgHzkAOR+RJaJy2vc0XHMm7zxEHTtuAsuBkxyjgUfFASX89AX4BRHxpOQQmxcGYTXaQH
	4FYkOzxi6J8ZFrk7kz3ZpRJiAqCL5B7TEsgPAjyZlwh+Ms6NH2yJFKI+UrjulAq1FnUqLWgfu1/
	zBtmWKZCua9XsjSI6nlH2EmNXhaqBcNNnNVFQWYHkks4TJDOUip2jtko6VNEVr2meEnr0Z+uQq8
	WIbQF+Cr4SungEnYjiVhh20v1GRQveLnyBfhQ=
X-Received: by 2002:a05:622a:6852:20b0:50b:8689:bd4b with SMTP id d75a77b69052e-50d62c327d0mr91009471cf.39.1775336706532;
        Sat, 04 Apr 2026 14:05:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6852:20b0:50b:8689:bd4b with SMTP id d75a77b69052e-50d62c327d0mr91009181cf.39.1775336706180;
        Sat, 04 Apr 2026 14:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c9810044sm2030981e87.26.2026.04.04.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:05:03 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:05:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: sdm845-oneplus: Enable NFC
Message-ID: <44qdi3uvm6qcsjnhgepuuxbxukcqu6if2dxeyyar2rqewksgzq@lwha2jpvpic6>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
 <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
X-Authority-Analysis: v=2.4 cv=Xpv3+FF9 c=1 sm=1 tr=0 ts=69d17d03 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wuwE3jySQvoYGrhSQ40A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fz-H8roBi3kdbJqUCsCNhEscVaQQYVB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX+NnF8Ba+kua0
 KJWP0vbSmQanznsZapbAoWv8QzCs6G24Se+AXgNK12137HgW9CT8Et3KEq2MRt4xXud+jJQCTcF
 XSJOdY3Nu7VkyMvbsg+rK85IBA6xLENguuly0AmhtFx1onIvZp5fIiUMDn2UxmRvkBCXDqecMOX
 0gayYhzfgyHw/m0b+3RAXTUjJ510YnDoXP3kT2xLKWv7ce/I4bpbaherue+ji+Enk37wlKuGQHr
 sUk31kvJACZsb5hM/5tlaLafW2joLcLJzAoa8ZGj9Yrairftc7Oox8fVqbIVTxkZNaCd4RxlzhD
 jYsKR8Wh5lpfMKzkWfheGjXq767NtwwMxRaI4mxZe4XYGZ0HZyNAzhGBF0VHr2lRzm6ucz6MizC
 BCHai3pZCR2cQcp4HM2Bqxu1uh5H5eEET0Q4JEPTnj7HU92B47dBNFW80mZ1bICq2yY1pp5v98A
 Az6Btwta1o19C4vtI9Q==
X-Proofpoint-GUID: fz-H8roBi3kdbJqUCsCNhEscVaQQYVB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040200
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
	TAGGED_FROM(0.00)[bounces-101808-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,shift.eco,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,shiftphones.com,protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,ixit.cz:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 988D239C83B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:58:47PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable NFC controller NXP PN553, which is part of the package NXP NQ330
> (NFC + eSE).
> 
> Based on work of biemster <l.j.beemster@gmail.com>.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

