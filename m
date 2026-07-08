Return-Path: <linux-arm-msm+bounces-117564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qTelAj8dTmr5DQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:49:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632F723E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 11:49:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Xmr/u2CV";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ajf60TrZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117564-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117564-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6C4F3044288
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 09:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81A6377EA9;
	Wed,  8 Jul 2026 09:48:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919881991CB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 09:48:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504138; cv=none; b=m+ouz3s+B6oLncscXizRyuyvnE77k0LrzmKt3qfGCNkjoXcR5JiJNtVJLvdJNRqMkcpeMmx3GwFLkjAA9fI/qeMPH4efn6NLqRmQHCYaomvEVT3xphGiLoJJ32aF7t5X4fWGIWgTw6Im9LKU/ufHYzHfVNv1oaiDiQBC+6MkceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504138; c=relaxed/simple;
	bh=DUCkIYN7PQkTM1Z9PLNYL/td1wrOWsEdF8BGqnRG1II=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHlcrGiA8WAQZTSJK/pwBgEAJhoyfx0wuHkjnHE8BSPA9KtWRDYw2Z75LxrwVXeE5tY4yS24q9EclM9CDOHr9y6RwHLFujkKqm06BXMC78EAlXdURnCl8TjMh3yLyaTUx/CsI8QEuPPqUKhCGbK8M+jSVN1J89OC+BVXC1u7Cr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xmr/u2CV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajf60TrZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889EvA2007689
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 09:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=; b=Xmr/u2CV7AYMxoIO
	NcpABX5ooZNdazgBQQgNK7M7obN3e7QUPg45MfKpiczO3QKeRrVvsji04B0RJc3g
	aaZSQzoKIiJFT0uaFbsRNUSn5sbgCmj+qxCbEThpUeurFltPLJzNj8gW0G74XOrO
	Sub8Me9gtv3WQY01yyI5uuKOIgPmI4b/439iL7hJUO6/2Kz9ObX2yoWowABmVKiP
	hcODWJRUBsWHKCGNbUqyoHs0Tx8w5rWGJQ29LKMmgDn+o2Q8jeMcj09hm8x/9jFl
	WtI2VHgDImivocqr330lcRVpWpZoAD5FY1KaXlJShcvmP+lW6fTfpnZIrSGKq77B
	RQDZtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u12tkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:48:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1ada6c43so7229421cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504136; x=1784108936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=;
        b=Ajf60TrZD2Hxn0Mz75+QDLODyOVIOChlaTO1WkIRFewhHLuWjuMxGs/e+gR3siAaxK
         Nr7pE35LxzZFN6OzyCNj5T0ATfwiOBn6JFA3/Tm0jA7ga2mK86m+Rc9boCoeg7YYiwG6
         jxNuaJWwDheDDrLICXie3Yxy8KM+P9jPDtOK8rZ0W/lvtbYCxsAFDemljKu2OW8PhWSb
         M2vEVrA4vUIjbJuNfGS76Q8Wj0rRJ3v7J9uxHEOAGr/erpVmtknSLw9uBxRzKZT82Blf
         bzjuOo40XzAd5yGWklVUOxSJZ6ksvSJzO5j7wWFVStn0mmgo9IFe+zjSim6D1egbxv4v
         S+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504136; x=1784108936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NfrOlsB1y8lyJQu9e9mmNVo0JQXdK5wllEvg99o1ksg=;
        b=Y0XOKgzBtSlCu2YrD4ARdWpIQEircOdkG/a1cUn5RtaU0Ssvz6M0flb5OwnXLcyH7+
         r1CbM0lPxoeG4z1LPXIwruKxMSpemxvi43btX/9IkM7S3W2aRVs9mL+mWy3svyisf2Jk
         hibZy5RL2SfWd7BwviW2+z/ltyTYuJV0ChOB9FTkbc94E1VMZai9TsJtk1oHgydGm7FR
         R6TfCmT1arwgCC2j2cClqRVX307cLXpPUvfTT/BooBILaQdhCh2F93LucyBsMY8HUXSv
         q7IcQM67dz7oprJxjzOxako8Kl6Kiri6nElmKFcoL2rsulOxSk0RzAE334uQZS4WOwHM
         dO/Q==
X-Gm-Message-State: AOJu0YyHuVdNdFvitSXgDRwPhm2M9YY0IPc1OaxlqhdYGpBFqgmzrZi7
	ogyFq1g0QO0fFQ0krk/vhraRjwosI+GD3NoniR7YMZCpehc+WMDNAXS3+C52uFjHfs43D+Cpupf
	CvJo9gFpS0CdvrmyQaIEnZvGEgdY27R/7rq7A8koUQYUjhYh7ed+siuVCmxOp+kGcKvNV
X-Gm-Gg: AfdE7ckX8/XU0LmmPOnkN3BNTt6gfR9NTm9dDzhJQa6zb2dJvIj9HD5h6HkyS3h58nT
	Sy6urywiAFWk26+2pKWWPJDRkjR85aNrbJRIiABHFHXsFqfUoObdeMA8kahjeqyyXRqn1dq+R2i
	ZIilkRkWehLikxz1ikg+Etv6jcfte/vlk7rvCFWzYO21XHTwUKWJgz3bQV0lorQWoIWTvRa4LHb
	D6KS5PgfKbyEPYb/m0tutwRVQ94yaUHG00nLX55yK6BaZ9sObFj85acEC1mNIiFWFDsOoiIL008
	eTZ/aO+c03oSw/HW0rLGMrfriLYmFBzSxQOJTeNUfrVh90Xzfkng0TRpSAPs0WeulUviKbAA3R4
	384C9HRDpHktQS2cs6YziBNuhbOerM6mGAlo=
X-Received: by 2002:ac8:7d8b:0:b0:51c:7b12:5fd7 with SMTP id d75a77b69052e-51c8b438724mr17568171cf.83.1783504135632;
        Wed, 08 Jul 2026 02:48:55 -0700 (PDT)
X-Received: by 2002:ac8:7d8b:0:b0:51c:7b12:5fd7 with SMTP id d75a77b69052e-51c8b438724mr17567941cf.83.1783504135213;
        Wed, 08 Jul 2026 02:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:40 +0200
Subject: [PATCH 2/3] dt-bindings: clock: qcom,sm8450-camcc: Require
 required-opps on SM8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-2-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUCkIYN7PQkTM1Z9PLNYL/td1wrOWsEdF8BGqnRG1II=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz84lfe5YIROdN1BkCabPVaylWxdjZk8huJk
 GAQiw4ed7OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/AAKCRDBN2bmhouD
 10LqD/9EmH31v0Aydhx1ojz+rGogtFufmKVPX/qiw0CFJ55LtN32yqnEPTdkMLzMWby6WXtuof4
 6ANqHckjMiE5xQVQEG3KjhBWSLGhkyle821xM+L4GhLZux1g53gs5lxNntEEy3WN052nifX+MDJ
 +A/AbvEr89rsUyrp2A/v0UMzcZdLGC8z6PFgkPhDnCKzwixPl+aBeqenIbGWo5iq6/9QcjDbeP1
 UUL+w7VBd7SUMpyu50Q2Kix/DxSZk8NfgHZ+iGQuh+sC3ojzwG4N4ymMi7rhx3Bqpq99bwx/wBc
 S1LObrsa5TxLxHjNluGIVRjEyR463uQyRFSgbr/JPpL3Q/QI8SrGMVCnSnsv7eppkCWrxzlGQWh
 oJd5EK5wQ0kr6FqdwzSfq1WodACqhqiFnZQY6FRpg9D5L0J8xMfFh8TJIMQeegS0OPKDKuORXcC
 KTxX836gN3R/t8t9vAUl2ONdiBlSQY6ML5Fa9jqSpZuW9Zews2dl/9COaDFAIZAmepxdPqWyD+5
 iVZU9qFmBLbdOprBOk9nDxYb7MW69RFe0/y/CAnLy9WZ6EZ5c9v0/kY7iq5y9YBqmIeVNfbmJo0
 D3DHQSlAojj8USu89YqOfeFzb3qhhtbqmFoemr9mOsRDmElHIbT4Tj/vQ4F6Z72T52BaaLLI0Bp
 WjOGkvm0Z2rZHyw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: -LD41pnSWKsjqroUfDPOlIu4zLXQtTuz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX+sZhjqTbzJCO
 XfP+RKEG1QbpXu5WjVC/+81/N6u57Wcot1KT49vofmKRxbg9Sd/L0LHKfCGSH49Jg9/cjpjGi7N
 2gyEBbSUAw+HMuEpYbgaVAHOn8mcrYc=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e1d08 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-4LXpn4-ZKuGKnfTux4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -LD41pnSWKsjqroUfDPOlIu4zLXQtTuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX4C0wAZtaDvcv
 ASQzunsNeI7frmShfjRk+omqpGr5ONwp93BpoUoJhKlOCZblhbN7dBurNQqW5lITyW7WQkFD8ux
 MYR2cjOmicKmPcqv7N567rnw/tSryl37r1rGA5uMiYaVbU+BG1DPYrbgrEZyAmmLNf0Fr6MudVf
 Ro04hZW9yaE3r7o7S4e5qAZPdQWgdXUcuk/pquTrdqjYSpNusYx82x7yKMfP03JkiZ4Jq1C3r8/
 znpYrwtA+SkveQzFgN/xQ7NKArsB0QiUeR7QpXmBeWDcpw4hUtjrdGTU2ea9xQsn33fTi3EkbKm
 53CtPUhrZ6Y0SmLcfb19NMaYpWaQNsMCoueLW76KqnO382goxtMGcpoFH2ba6+q69hIGKUuvHK6
 44lzKFVTr3XwkuTlDIP6eADGNHoccTW2ozQ+KbR2pRaxCDCL28LMZDb0j8E6sp4zyOkn5O4TtGH
 sRWis1s4Dhn3pFziVYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117564-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vladimir.zapolskiy@linaro.org,m:quic_jkona@quicinc.com,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7632F723E1D

Reverse the logic within "if:then:" when expecting "required-opps"
property to have negative list of only variants which do not require
these.  CAMCC on SM8650 does not need "required-opps" as explained in
the commit db30c1160ca5 ("dt-bindings: clock: qcom: Drop required-opps
in required on SM8650 camcc").  Requirement on CAMCC on SM8475 is not
known.

Reverting the logic in "if:" part has two impacts:

1. Adds requirement of "required-opps" on CAMCC on SM8750 to match
   hardware expectation, because it needs minimum voltage levels of MMCX
   rail (already expressed in DTS).

2. Reduces the chances of forgetting to update constraints when adding
   new compatibles (like for SM8750).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index e6ffacc81d0a..b41247b257b1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -70,12 +70,11 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,kaanapali-cambistmclkcc
-              - qcom,kaanapali-camcc
-              - qcom,sm8450-camcc
-              - qcom,sm8550-camcc
+          not:
+            contains:
+              enum:
+                - qcom,sm8475-camcc
+                - qcom,sm8650-camcc
     then:
       required:
         - required-opps

-- 
2.53.0


