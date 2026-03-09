Return-Path: <linux-arm-msm+bounces-96111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PlGvOrlWrmmbCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 06:12:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41237233DBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 06:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C39F1300D330
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 05:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519B42D5C74;
	Mon,  9 Mar 2026 05:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hllbChy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb3Wfjcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116C72010EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773033143; cv=none; b=n3pvZJCv5h78zklyUOFOFfW/QM8pUrE4bIXYHHYUtJLi73/W0li5pqFBNdUhZEVs8feFQzFSG4QM6sNGnlEY/0+YhYbaGhhspE25XahfWoY0J4KIEcG80BYKAxBo+Wan48uKuOaDoOrCrAxrNqm8u1ftg6NrV5SfQnvoxRY2+gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773033143; c=relaxed/simple;
	bh=h8jSNkOBnQ+GylGQE3LqQLFkNywKdIbN4DUr0Uyrirk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7yQWFn09MBW/C+PEUfwF4jLsc4FrTBuEpB5BsTFHuWtPkpvh2VSrrmCsr43cNX836kGrdQ0ZWmFlPr/M2Qkfgk4S6sansfvx/IcQgLZHfNX6PZ7XPgQOcdeNOIRWnBFeuM4/coSdVwS3r6rHtVpLToXQwnzpk0Igk/ElH/2FPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hllbChy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lb3Wfjcl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628LfDGS2506635
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 05:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hr78HlUmGdHP31zlQxyj/wEv
	oINm0CJ5zfAaDu212cw=; b=hllbChy3UZMTRxQUZobuvrgFysQIGINoS7GIbDsz
	NBN/IlAairjrNAx7aEmj6hIlCyefyDJhgkfjDefDfxTmIhU9MTjbUpGj9aFO6MjO
	+dK2E1iQxpHePjxHNFb9Bc65C/MU579ExFl9RCeWNIn8PP9Eg+v+6qjzx8TUhDKW
	AW7CWy1VZM1sNCxp3UXRyJRBKnNS2HKjC8b/wBQq4nwbzu1Am6aQBNzkpUrXO1yh
	W1LxUnMR3o/BBRyIlZt+p77VW2RMR8tyf4hOZ5GTXZNA9arniE4qIn37SNa+Lsy7
	x/FYK9w3zuJjuBbzTjB3IJsBEabHxguOCgzawSgddAUcRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpm7jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 05:12:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091dfe4263so39219481cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 22:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773033140; x=1773637940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr78HlUmGdHP31zlQxyj/wEvoINm0CJ5zfAaDu212cw=;
        b=Lb3WfjcltY2H0KMWqiDmt2ew87FEJwm8oLWmHG8Of9ciEI6jUmqHCRpLUyZSlfbZmx
         Ch2j5RDoMVkHw5T/mkgolfrOInEUA+JPpZlBCzg5MEI0zLe3KSjPCeqPgNAdxRvFqHmV
         1Z32aGHOI7nQh1iPs1yPdUjcV6BxaSy/m3ZdsAXV0CyOvm8QvVHIw+d6iduzqgX9QJKc
         zt0Y5n8l1WA4zdP3S6B1s/qKardXOfRx+gQ1kNcG7BvhqToThyswAH9MsCvnHiGgHAE6
         OXPvpgy128AfomyJd97NoRjfiaxuqcH/fm/05r/fAh6Du0FIG/myps8RheB1IE5LFoPh
         SFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033140; x=1773637940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr78HlUmGdHP31zlQxyj/wEvoINm0CJ5zfAaDu212cw=;
        b=QHIEB1/LRRAVFFLVgGtz4rQiR6MWT38sOA70sAU7T8fyMM6w5jkAROvTlquuwsxHeB
         uEUtQfNLNmyFVrDjhV/oX/lqJcFdLs7r2ZzIDoAS/RMjfIK0LO6DS/on6EBhqO/JbJpH
         AweN1u3q5VLjWB0doGUohvX/UwQVB9vgo3f15pg/F2RICQ6aEHXl3Qvnkfqj7IUg9N73
         MkQTHV3DgbBsAxB+nbCmbBZXARe2aGLS0ArNXcKCBh8KhaGPGuxTwkOiLT4F5Hj1kbzQ
         cnZy6iGJNO07lFORoS3tSjBuiA3GkHQafJSwqgkR1qtqw46PmKBB6fN9oNoUW54NfBcT
         bCvA==
X-Forwarded-Encrypted: i=1; AJvYcCVQLu3houFAYuektUGYKRN5rCdNuXoOC+MAmqDjUO/QdSnnUNI21/ZQE0rWJodM6EJACC1z3tUxIj373dvn@vger.kernel.org
X-Gm-Message-State: AOJu0YwijuHLqlMTuXVKH1MLdQqiI5k782xF8IsTyCd117jep9BqjS2e
	IpAV1m/a2gFqMvYZsjbkoxuizzFNq/ZeclPL7L6sooA4aULL/n2Tg5zMyNvn1PaMc7fxJNtfsUp
	E6brT31LrhnqSTvN7hlvZlKDCe/owrehhLhmjyWcaSCnc42thdwy6y2yAGWx15CuTCeCI
X-Gm-Gg: ATEYQzwzjD4bNd8EkluLiOrixtFyMqH//wettC155iWVV3/14iJekjIntOOKeruWFMZ
	bJ+RKc3IIDsbpUpzWSyyRRI8QzdB7uDOuA76XuygDBfZLYnbtq374megUAMMQk4gSu0ewavyxT0
	pJSyQO9gIA4Q2Jj3XDnES2pZiQMG4A+Yi6saPqriEITWrmDGt9KOG/8k6a9Lt6dGYEEbQB4Zllj
	oJu4ZxQog4h0XqcRbNHza4C+WCG2Z6qbPlZZ9CctKr8CDKCcTwn4zRzCUoQo27ERgfD0+XSll0V
	UX5ogUH+5lUzeFZ7XtzX+jbny16hXj5Q47t//JLxDOCR4VvaRids6CHxDHb6MiPvLbD0IbmbNWv
	FsPu1CwYAXUANLkKFNnvlAUBvhZnp8JbbqNZjlVYaJSXdfMk0kvFPKz/o40VWK3WA1pbvNUhMXn
	P55Ts7Nl99ZvkCEnaQL4sX8IdU9L/zAW0XwEo=
X-Received: by 2002:a05:620a:711a:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cd6d3f0ad6mr1264444285a.9.1773033140388;
        Sun, 08 Mar 2026 22:12:20 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cd6d3f0ad6mr1264441985a.9.1773033139936;
        Sun, 08 Mar 2026 22:12:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a42074f3bsm12865931fa.44.2026.03.08.22.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:12:18 -0700 (PDT)
Date: Mon, 9 Mar 2026 07:12:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: milos: Add fastrpc nodes
Message-ID: <wxsormh4e5iplfa4vlamflwi7ye2qbn2v6hlpy35iegbinhuxn@ozrftvtgj3iy>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA0NSBTYWx0ZWRfX3fctPYZ7Tn+9
 QgDMSut3m1wsE+4YDzOt0enTOC3IjgsUQgHIaqe880VD36e7biP8QuKtJCeJHk8Kr7x+2O517Yv
 1M6L1yB0ayi/is7XRuhHhPCZlyYY+LDkMLGiU+UqwVnZHDCPIRZunfSl/9aKi+NzWStztK1dc52
 lWoBQEED4ND7Y1W+QhM/D9JTwWLDKxp1KZzR2XQCkuehRGxxrAEqHUuuSivRrKqQD6luKekLgXH
 czXAf8w1DjtaYXGXQQ5E+51HLU6iOpWwozP8KT5nGoLEgziPE4AIMUGRAaDA/SxUjI0gokQ5ok8
 86qhgt8fX/Iyyp+eO2ztTv36VY9SzJgk0M03x8YN4rrYiSFP30fF8hMsIAdHbA9iSQmTvrT9xZw
 Xrit+nfh7HA3fCodQB/pJaBoH/UZYmqEdnuxArWsE3J2caPTQhmhN/R7Y0oseWTS6py8yjDXmCS
 hLo9rozqBGF9Ku03E+w==
X-Proofpoint-ORIG-GUID: GeP8oPoapPMqXMNVZi3m05ROUbyu8RKO
X-Proofpoint-GUID: GeP8oPoapPMqXMNVZi3m05ROUbyu8RKO
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae56b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=lN0czBGB9QGq1imfh90A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090045
X-Rspamd-Queue-Id: 41237233DBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96111-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:01:19PM +0100, Luca Weiss wrote:
> Add fastrpc nodes for both ADSP and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 144 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

