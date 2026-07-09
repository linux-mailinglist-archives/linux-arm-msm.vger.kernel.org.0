Return-Path: <linux-arm-msm+bounces-118063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bdjaOIPNT2pFogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:34:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18631733811
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gJK+cjCB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fpt0Ge61;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118063-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118063-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E899A302E7C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 16:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD01395273;
	Thu,  9 Jul 2026 16:33:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AA36EA99
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 16:33:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614839; cv=pass; b=eRlOmroPnihqhjOi00mM/A4JaxszzZi5aMIl5MugkQsqwwS36wJs22mseh1yAPe+1vXEazmg/5Kr5dK2JHxSM91PaVq5SreruPqGxTq7gD/lb2XqhjmpUxF8RhnmT9NbE1J/jDRRuI50cLc10XDDm4y5jfhE9lU9cX7J21NhNhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614839; c=relaxed/simple;
	bh=xeFfrz6h8yMo4SlaHzqhiMDslcgOYLX/u46LE+HL1N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3qYO2OhjoJNI90GFhPwC8XOMjQJ4jbL5wBo9HjUQ8Qve+oZ3sqUdwDuCao1X4e93cqVrhq7P4wkbfAiozeZvStTi80AjXvm6vnz+OfTxw4vtkTR/IOaMI5z7rVte/dSxGvR6Vg8Tm7R+Wp1gkBo8CGJWp54MdZw4zfuCW39Gtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJK+cjCB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpt0Ge61; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EwPjT2062315
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 16:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=; b=gJK+cjCBtngOV7iC
	igPGm0DUQGrCJ4j6Nf3o2zSH+gzpMxI2RKaRYq2YIFHKLcoslxd26PqvM049n4rD
	w4QcL9+BsLOFQt2iXsHoiyqhZLl+JrY+L+CszR+J8Ijs69uPXjd1FCfV1PmLnkvb
	+DTac5yISgY+QT0jLVZPpRJTfJM9zH2DvrgCQSZD4Li3h1HB0DfU7KOOLyqzA6Mj
	03iGCkAbIeJqHP1VD40uzx7rQ9aP+PgEyQWaoVAx7DvvZvAY8AhSXbDZeV64BgeH
	jA6M72Q/Ac4jzxMz8MlDnxeX35icerG0uAnsT2Y0zGVT/NFko+kGNXnXNy8peEf4
	S0nXRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvj8gv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 16:33:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6a2f5995so163552385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 09:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783614836; cv=none;
        d=google.com; s=arc-20260327;
        b=a5bWA0gHgQZ9NSj7t3lLeQweIxqTvP9Izwq6jzkm5WF4IY2yUS7sW5SeF7yhFoGaXe
         h0lI6J0tVjUkr7koA5n6FJLypGVMqWRrn9woamL8Q1fkQJQjwkfppXZlJLxF5r7+j8By
         VJppnwHT58jqdzCrWCOj6k7kF4u/ZVXWRI43DYOKUYY8rL9hpKuwZZBhXDXpTnQMSYCx
         RP6kZ30I3hnE7F+DUT5P++pekhq8bj4EDdoL4Q7nDAnBknG5FfeZ1YOajOtdXvyNGFzX
         h8L1i4J478rfbMCFQ9cka4sF+pF+RrgORqe0IonNU3JVehmOosBz15ci/yfnhwEbpKe5
         Ptrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        fh=Rv8InWugMQvPHDXtaOl6a8AC8zABf8SPQjBmncDHRbI=;
        b=ZD0eqFiWloDDwrFPFV0P/MpUSkfFufq6whCPVViqKuX0S1L+HHXvcxbsf2GB/QsIiP
         oa0mJYRDlVrP7FvzQ1IdRNvTxkiUsD407//pJnSpbZmL5OwBnzrBdntp56IwY0m6m+Xh
         l3pLlE3iXAHHf463xrfQX1yAIWyhQsPBQ56Dj7MGFFAYsva9qWDJrlszNoNXNCuoXpTG
         H7oJiPCXKcEuu5Ry/ptvI3C6UH/AIChvdDnP/+6pcffqU/UnV9tXsMGLCm/MhIG9mu4/
         Co7YHoNji4VnH19AUUjx5w1g1lGsGbVZiBU+h3sSxe7GDwzuwZZJiESpCoK9/V/cUAuj
         CSfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783614836; x=1784219636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=fpt0Ge61k5eCyN9EOd3N/vQYe1fzWqSuCP/YYZPD/aFxIGX2YRsVyaAUtnzEi8MYgu
         2FjfEotctKoJ9D4aeitc+mUcMEOchaYZNOYMn9JDxUgfpYkwGZHwIU+5mOlqdXaIaEP8
         1L3AcgYdI2Gjfbv36p8hT5FrGdUzHj/E3yoV618uY1seH4pCotPsGrhAVI9OP70M7G68
         CyAbz/m5UOLEPCL0cLym2skivYF3sV/Fr0K3vOCoZaxGNrzF5XrlA+nuHOhy/ErQmAsS
         GtGAHWvnGXFqdu0po/7VzbVtipFMY5yLGrqObJbWaUqlcdnXFam9QFAIgpxGaMqriq0S
         rVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783614836; x=1784219636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd9eNrOSCFFAWaQdLSMEnWBSlqv0nUO4Pn2WJ4es7Z4=;
        b=QNRVpevyrpuFyZXLcjlpuaOUHxjHhiYAcCeSOwfkx4j/jphL1QDanF+XRs5TeroeWM
         H+RwYNVAy0Dq3BaWKB+et98IqYnIx6vbvZDv/DD4XF/Jm/+Up5E87O/yS8XnWtBfbnN/
         WHR/8GFiElWOSkJsFr+RoorKCiP4DqrB/D6i8X6jI4ZSbW785JkIfnKRTn8Cg6FVuL6b
         PWLuwZegM0gs8unoK2TQRtNTqOnRjqP811+ZNvCF1gQC7RBXAgvNiuCKvwSu385EAjAV
         kJ//eU+NLisli74Me8xj25t21hob5Kan6g8ynAMLqD2YSJWIwj6pGNNnEZs07UGEY6BS
         CA5w==
X-Forwarded-Encrypted: i=1; AHgh+RrHRSwq9FV5rqof86e5QB9p+nNzR3smCllMUXs0pGMJvYLyZLGSTeU0XgNKy5mbed9aDC8V+PDHuCqrSD+q@vger.kernel.org
X-Gm-Message-State: AOJu0YxTEb1m4Cs3q6QTZ5TtFtwCJe4Hy9Q+jc6GLstglj5um7uIdXlp
	dDAxtxctWfNeVMJb4xGtq8Sh0H502ALZaM2lGwYiovS3IEcnzpHSRAfeSTA/SEkHciOCBoNm8XW
	AFSo3fMzn4ZXtXvOHnlGi8EHEYtt0Xo7AkEGqpbA9smiSSe7U4iy26h5s/LV6liLnEWMKv6kwbZ
	wNco5y0BraKoQS8dLm1Ks/09lY+OQfoHaWStIhBb3Ql28=
X-Gm-Gg: AfdE7cmO2On1CTgkjiNyET/AZO8Zj/owAuvmoHDtUX/kfGFOaBwNBxFXWvezatszevA
	fcgA9lOm8H0e0SKRq03/SNMS1A4kQVZ8/84ijGnWwovb+A/kgXkWloujwfEHOa4gzSr4S6ys0E7
	JOuOmWMqTz0ndB7z14+PfhykVDGTbmD/15dM9krlI4tbORY7DJOulqHeUCrdmoMZbHWQ1SlW77Q
	RUcBKTNZoNJndQs4pUO6cuNw8i4Y9CCXbgzdR8t0rcjJepSmcp54KfN6tZd4eJ/aIjgOfNKhCLe
	sWgo8WAytQ==
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id af79cd13be357-92ecf8edac8mr795069585a.80.1783614836278;
        Thu, 09 Jul 2026 09:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc5:b0:92e:c117:9ea2 with SMTP id
 af79cd13be357-92ecf8edac8mr795063985a.80.1783614835839; Thu, 09 Jul 2026
 09:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 18:33:44 +0200
X-Gm-Features: AUfX_mxrvMsfVaIuwsAqRlu-SiIqeRWjw3dsC18UJ-fCRtJqc3yI7XzxXZWCYk4
Message-ID: <CAFEp6-00rJSrOCyHnCQ-VkSWLYHA6C-MCGNt2oMwAA6ngi=Dxw@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX/M34IV3UzOFA
 WHGkGZiX0URccyZSI95m7dbGqdn7YSa3Hz7YxqXBIKwNII5aLdwcz0GP0NPxFjCwfF+JjzWLcWM
 bDgHn570ZwXm1w2N7ATfimrMN/VZ0EcF9F1NvBtqmSj9MJ43LbE8JNV4OOPYv5+IaT8bYLGxA0H
 fuX+wdoh6Vv1PSb2E/J/l0MbcDizXK7ewvj0MWUn/KJOCYLMoUFjYT6iRZCqVjKqEx8XAP0F/AR
 vBKdRootQMQVmLdOMQWWpjpsUzYN9MlLY3PROdhJuj3jUimSPOmzqvsMH5vIo5EiNRehodF6NMn
 dUhPSZOZN9xlpaZjUtu/uL2SPJxEdbq22CnE/lmHgKGyBJcZDXDcB2edD4ZIVR2RE6FgJ8pqJbG
 LjxIkb/QUaQPFwDwfFEqgrhgcEz8eD20NnuTkw3jvt5CsnaDrDgmdzAU8SGIIidT0jNd0xs2pEc
 UZvx9yPv+sBLqhXm6fg==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a4fcd75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LRu0fTMIKIkxnFiMMFwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lHTwfcj4AIcaGsViUUrVuldWwhGI_j_6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE2MiBTYWx0ZWRfX82aTu2dPI4kb
 GEpHMVwKHL1GcRhaJDXKruC4G0f+Z7Hr6F0VrvOy3ihgd9m+19/9pK42c5NXisSPaWnprKrjhBO
 Pa9PpqaSSLZCO7ieDvFuB4ytI5HTys0=
X-Proofpoint-ORIG-GUID: lHTwfcj4AIcaGsViUUrVuldWwhGI_j_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118063-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18631733811

On Wed, Jul 8, 2026 at 2:07=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Flag which SoCs have legacy - builtin PHY code. This will be useful in
> subsequent patches to inform PHY bringup logic if legacy bindings are
> available.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 95e655a8b6aa0..e814a96953b1b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pd=
ev)
>
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x16,
>         .csid_res =3D csid_res_8x16,
>         .ispif_res =3D &ispif_res_8x16,
> @@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resourc=
es =3D {
>
>  static const struct camss_resources msm8939_resources =3D {
>         .version =3D CAMSS_8x39,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x39,
>         .csid_res =3D csid_res_8x39,
>         .ispif_res =3D &ispif_res_8x39,
> @@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resourc=
es =3D {
>
>  static const struct camss_resources msm8953_resources =3D {
>         .version =3D CAMSS_8x53,
> +       .legacy_phy =3D true,
>         .icc_res =3D icc_res_8x53,
>         .icc_path_num =3D ARRAY_SIZE(icc_res_8x53),
>         .csiphy_res =3D csiphy_res_8x96,
> @@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resourc=
es =3D {
>
>  static const struct camss_resources msm8996_resources =3D {
>         .version =3D CAMSS_8x96,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8x96,
>         .csid_res =3D csid_res_8x96,
>         .ispif_res =3D &ispif_res_8x96,
> @@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resourc=
es =3D {
>
>  static const struct camss_resources qcm2290_resources =3D {
>         .version =3D CAMSS_2290,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_2290,
>         .csid_res =3D csid_res_2290,
>         .vfe_res =3D vfe_res_2290,
> @@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resourc=
es =3D {
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8300,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resourc=
es =3D {
>  static const struct camss_resources sa8775p_resources =3D {
>         .version =3D CAMSS_8775P,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8775p,
>         .tpg_res =3D tpg_res_8775p,
>         .csid_res =3D csid_res_8775p,
> @@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resourc=
es =3D {
>
>  static const struct camss_resources sdm660_resources =3D {
>         .version =3D CAMSS_660,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_660,
>         .csid_res =3D csid_res_660,
>         .ispif_res =3D &ispif_res_660,
> @@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resource=
s =3D {
>
>  static const struct camss_resources sdm670_resources =3D {
>         .version =3D CAMSS_845,
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_670,
>         .csid_res =3D csid_res_670,
>         .vfe_res =3D vfe_res_670,
> @@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resource=
s =3D {
>  static const struct camss_resources sdm845_resources =3D {
>         .version =3D CAMSS_845,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_845,
>         .csid_res =3D csid_res_845,
>         .vfe_res =3D vfe_res_845,
> @@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resource=
s =3D {
>  static const struct camss_resources sm6150_resources =3D {
>         .version =3D CAMSS_6150,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm6150,
>         .csid_res =3D csid_res_sm6150,
>         .vfe_res =3D vfe_res_sm6150,
> @@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resource=
s =3D {
>  static const struct camss_resources sm8250_resources =3D {
>         .version =3D CAMSS_8250,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8250,
>         .csid_res =3D csid_res_8250,
>         .vfe_res =3D vfe_res_8250,
> @@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resource=
s =3D {
>  static const struct camss_resources sc8280xp_resources =3D {
>         .version =3D CAMSS_8280XP,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sc8280xp,
>         .csid_res =3D csid_res_sc8280xp,
>         .ispif_res =3D NULL,
> @@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resour=
ces =3D {
>  static const struct camss_resources sc7280_resources =3D {
>         .version =3D CAMSS_7280,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_7280,
>         .csid_res =3D csid_res_7280,
>         .vfe_res =3D vfe_res_7280,
> @@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resource=
s =3D {
>  static const struct camss_resources sm8550_resources =3D {
>         .version =3D CAMSS_8550,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_8550,
>         .csid_res =3D csid_res_8550,
>         .vfe_res =3D vfe_res_8550,
> @@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resource=
s =3D {
>  static const struct camss_resources sm8650_resources =3D {
>         .version =3D CAMSS_8650,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_sm8650,
>         .csid_res =3D csid_res_sm8650,
>         .csid_wrapper_res =3D &csid_wrapper_res_sm8550,
> @@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>         .version =3D CAMSS_X1E80100,
>         .pd_name =3D "top",
> +       .legacy_phy =3D true,
>         .csiphy_res =3D csiphy_res_x1e80100,
>         .tpg_res =3D tpg_res_x1e80100,
>         .csid_res =3D csid_res_x1e80100,
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..698694d3064ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -107,6 +107,7 @@ enum icc_count {
>  struct camss_resources {
>         enum camss_version version;
>         const char *pd_name;
> +       const bool legacy_phy;
>         const struct camss_subdev_resources *csiphy_res;
>         const struct camss_subdev_resources *tpg_res;
>         const struct camss_subdev_resources *csid_res;
>
> --
> 2.54.0
>

