Return-Path: <linux-arm-msm+bounces-116194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9r9SNYFlR2q7XgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:32:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 322976FF93C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:32:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=U0ct8c+B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VcUx6eIA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55C3B3042E72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25131A56C;
	Fri,  3 Jul 2026 07:30:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8C626A1AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:30:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063829; cv=none; b=BPEG6dl/1cy9QYU9LjrHbYctmuNBNRBc50X1IT4U/aHC8xgNYA3OWCmCBJzSt+Eh/iJRRraIhBLWkZYNXYjRhqLCy7E5gRe869tKqCSMdfbbA72CHQRWb0S7DPxLyzqcKoY4CPjSgoZtSYeav4UWLASQXD8eHg3lkjuzf0I9DPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063829; c=relaxed/simple;
	bh=NxIOBQqw4GdqqNxy+UV7RTjAVLmJJi/DZMe8MQDibEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwXgvKQynPn+f8a7FFq+/t9XByfhFUC9yqJMCGhvCNMXFx+0XkhiWSbI9MyTFaQUT38Zt9FK3KFnMZVsdmH/tJm5GSYEliZrHZprHgoTFkK9Bz9Xv1J5JSxkr14qs35kVC4ondlD3NjC31DePOC2xJEayHvfPor6KqHvigLuYDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0ct8c+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VcUx6eIA; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663683BQ3053231
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=; b=U0ct8c+B1MJi1uA0
	ClE0GxQezzCpIccuZz++Wn7yxkjl5c9H08TnNZ+ucENTp5SrvaFU3KJ3Y27mwPEw
	O9YI3ZMwmgaMooo53oXetMbeKI0rnx9ujFVgNeWpE3XD3Ckh1gQOlZwOQCVU5GJT
	voCxbbU7r9EqKIPHLkZSQv3N3wzuxyPLetnMmPatwCaH5wbCkyr9KvZVWRovF6Fn
	jifX+Ct9jqODj31Ql40pn785y8cdL5htgiKE8Wb/Byi69MPAYrNTWJH49mEyHA9n
	epIpjEjZswyS/EyCmfgGGEsZREdjS8EPYwtSnV8bTF32iLcPswu84Zt+b+t+/4DF
	TN5s/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00ace-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:30:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso1894511cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063825; x=1783668625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=;
        b=VcUx6eIA08TXZmZH2h1nH/ofW9LHXumLguI2BD5QRzvaB+6LUmtFU0LiHPH2638uds
         uQSvrtCq70WOJN1v+FQCP4WtoX9PDoOsrwblP6o65dIwdGJH+SlFihFvRFvTaWerIxZF
         pUzgtILor7PS03QxR8M2aZnazV2UhyI70v4PG3NGMk9Ddbb6wKq54AHlL8gUKSXac7Wy
         RH+Op9PbeXFNz2tXeGnhO9OcEe7SvetNvwPv28SCfxcQbCW1oY+IlAxm2rQwJ1mg7shW
         69NtlERU3RXAgdpMk95w+kN5oMU/C/yVTgIR1J2KiaXTcmFRfGHipm/hT8cOs5n9FGBp
         kAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063825; x=1783668625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbmjKhc7zOTfSEw06CDNOZpVsSHHj1w1jZrWO2sW5KE=;
        b=Er8mA0zgy4BHBJwSJpP3y4bkIQM1MDDT1SwvB43Cah8WChszAFmsIVpSsykfAaeVSM
         hJ8tU4htmxo1vo8AP9QDtV4qgGD+W0zkRv/pTcP9wZA3uhNlbkYZQKk6leatpNPkF4r5
         yjFeYnT6FP8qP1bUVAZKtGuvZkXppKFILEqvGs/m+XqkbygBqfJsi0ctuReoqq1ZQaRe
         MUYtp0qxhSg0ANA5RqJ95e/j3L7C+LNHADsCQGZdhyAhgNM4thWnDRH2gN07abNFKLH+
         7WVaUIWzDxBVE8hC8u8BGwJez7g16bhIZYEjjawRSkDhrXX/oSaz2OKtjggeg+JcLzmg
         MKzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1IKrCo4KcLj5q3IXny00eTP0KBz5eVLT6Kjj4PuN0umkDVrAzyFvp5VrJoCTLkKkjzDuygHL6xfST1Y9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmp+6SMA1UASZP8neXWnUhcM24T29ILUruK9V1WPtICCd3HkSV
	g0LvUYWLAtDsb3qbdKNdESvvmQZu4UrKEWx5EiL5iWatTFYxKH8wcDKHOU/cxd7YJfoYaG2o/sG
	PBpiIcLK0eCaGYVMOq/UA834gg1Rj9Ae21vaf5k/gNvQQfwhadJEUyOMmbDnIsQH2ca4f
X-Gm-Gg: AfdE7ckcSkEcovfwJsXQGqidAtsdC4gNSAvDwYld2mg5UUP6q4iue7+XSskCLyvFcnw
	CshJ9WbIZHD3l/36c5DmnFFBd8Ksig0iaGQv44LCOxX1zQ4Nl1RlGJg0XXJ3hiCkDdiLdZYv/Up
	xgR7rK9cBmfzE/qkV58jekkxJs5oMUxktWXiQtkKbanEHR4UIRbULJSqhZd6UjCk4Ftu+t8+93Y
	UugVjNR6uUp1lniQoexYnoskHlxBM+Nu+bfg1dV/NIYb71FXSByZVWpqrkUqa8lBN/EUf2fHrju
	EdqhFYci3KDGUI7HSLknNhbV8+uc7CN3a6tqj7EWvn4kml/gtJyMgqO7XAfyxEMAZ++0TlFd0r2
	NpFPGUQT41m+BgT341+udfwLyXV4oQ4rcEWA=
X-Received: by 2002:a05:622a:487:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c2690658amr70423711cf.0.1783063824871;
        Fri, 03 Jul 2026 00:30:24 -0700 (PDT)
X-Received: by 2002:a05:622a:487:b0:51a:8d32:f796 with SMTP id d75a77b69052e-51c2690658amr70423371cf.0.1783063824331;
        Fri, 03 Jul 2026 00:30:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm239906366b.19.2026.07.03.00.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:30:23 -0700 (PDT)
Message-ID: <221133d2-758a-4dd0-90d4-ac3f3525ab42@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Am7O_W5BwTzxTvWcftZn8-aU8FWYmaDB
X-Proofpoint-ORIG-GUID: Am7O_W5BwTzxTvWcftZn8-aU8FWYmaDB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX2R9gRV7gsZsu
 LFG7AB1JKpFUlE91iVykoua2mSAc4ljSixSzNujRdr+3xMFCoFMSfHREL6Z6LqMrWSodu0H9YFP
 rMa0I7St387sHSe38GhyquhvZShXAlE=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a476511 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GABpISGgAy3S5f3vv6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OSBTYWx0ZWRfX+XmYlQqMunRE
 zzzUgaDi7KjtXYbVounT+GwngmaP2g9hNb7wiGdUkAJG14/Yaz7R1LNHxBXv8j9SHVT889FS8Pn
 h6Cu8asr741zpDPzCLEWH4+75/+zWkVZTSIPYMfB4Fu12mQ/w0gCNoo49GFfbllp204GwC2LifR
 ab3seXq7iCcg98S9ZFDpY/eMArFKRknnlmby+pGeSeRA7EG1gD+NyZz4Akz8dazdorekZWyorzt
 5KoC/Hm5bqv8ENiB1Jyy1ByR0W9Iz/Q9aUSLEDRmvkF7iXkQVS8W+E+ry9WLT/qeJuRhPmuAqoz
 43vCQMbfYQxBuVZfTP96ofPiIRLYRt/SEua5OdyVk5C73oRUVs7F6jqFvZO/ifZxQVeQY+07ey7
 jtwpSOrfwoIQlUQjXrXlvyUPeORodTUeYskhR6l/WXOWoTsiLcRPqyrm+mY8ZDW9Gne1wzY/6Tl
 oD5tKCrpsi3BwkloE6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 322976FF93C

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
> similar to other critical clocks, since marking it as CLK_IS_CRITICAL
> causes the clock framework to invoke clk_pm_runtime_get() during prepare,
> which prevents the associated power domains from collapsing.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

