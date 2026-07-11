Return-Path: <linux-arm-msm+bounces-118431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dwNGF4iSUWpVGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 02:47:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A134773FDBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 02:47:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FZoeEOOm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I6bhVVye;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118431-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118431-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A389301F9B9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 00:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46A713E02A;
	Sat, 11 Jul 2026 00:47:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76640495E5
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 00:47:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783730821; cv=none; b=f1QzBaePKT/N+ZmTwrsQVLIEv8xWnbO95IsQonGM1tMilXRWeOQ4aGyctVRcqOvOWTxGibY3HaH+VvOzkJAHIOPCNU1hyTG8PlQ3p+RMLOoxMpcR0Myh6Fvdfquiwe5vm3OZ3u7ILRFDv7nu38pP5e6uiaVrn6hdKnAkElzVFcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783730821; c=relaxed/simple;
	bh=R4Rs7xhFZTU3mb0GIkP2MXoGgKeVejhFo/bw1Rws8YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBkLwr7/tHA4RsurjmZYnLJwdWGExNtQ9MMyB1FUbBRxLhCh5wyf2lRBjfxzMjMy3Kxxj9IxhDTA4doxeOar9TmsbEmcU7NzC+ejCFF2kDb3cYUyGGGlVitEd+HTJesc4CJKqbHhKKxskmUMBLJ0aFS+Gms7gmp0yDkxvWnXngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZoeEOOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6bhVVye; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ANINcR2106673
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 00:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=; b=FZoeEOOmNynVMum+
	nV4KrR2QfX2XayduYDoh4AhrWBCR1zJtO9RFpdaeSA7ME1r5dhzGLgyNRYe4RLxo
	NCXhRF1Aq6WZnMkiJOHgJsVAnMqNxkAUlTjLlTp7e1tksejD6TI3q2zLcE2eGWQg
	rOgYlG0Bmfr3bjCkGYtaMHiU7GH7koMu366I3QI0lz5WFKSDyGsqSZ7GHXFe3uZ/
	cfwfj0A7/pFEioUo15A6BPPf3aN5LfJcVJiq+N+EaJngGHSd/0/Nr/qcg1rP6HX4
	jBAZUoXgyrMqtG57GV7J4jjN0ZG3gtZ394lkDQR0Ku7sKOXpYZgB4vRYiui9QELT
	9siV8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djvrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 00:46:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc640dfde3so19535285ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783730819; x=1784335619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=;
        b=I6bhVVyePat+HzAUsEu1I8Aw2rw5QneesGI42AdwvoYY1XFuQQ+/SQqGmvqS3b6mg0
         SON5dZlmVKx01Wm8+3crtIuq49iUi5G4QcEQrFELjzM61FrDpaHAgaHA9pzs4CYVJe7H
         nvMogyEF79u26/H/XeWH4lMgwZFbb2n1UGcSUoYmmWFrRH+ZtPbvnZfIdRUJ73xPcJ77
         NQd/ITBX7U5ZT4vUBvQLp3LWsRXu3X/ee0w+huavLmjM3BLhSl6F2lxM3vJeXmv7hEy/
         vnoYCwU96EtKzPF0PedALs391qxb782Vm2U1XGWaCcBFUQbyzETHMcqU7ETW/FdRA1jR
         /PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783730819; x=1784335619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=;
        b=C/4kTxPY6EXoInIj07ZKlsoGyLKBg5GnQm5UlFUkK5Ol0xfLIB106l9DUyh3shRrfe
         h5++llK0j4sC13g/TQhV10IoasFYko1uV/K5zU82w1f93+w63uuriupXTlUodUPz95Hw
         ynk/UNG3MSRXeM1Je/a+O7edgC5cmICaMjumfUwj0rCYn4I1dtUw0uhZ6ohnxlvmAPiI
         uqOefk7RkNkN0Ruve1IG4idZVmFQpNPv2m8LW3bfoeRiDG7bStaQyF3vvqC/ZnkKPsKr
         chMhJUuPNF5JDmH+BBHpH9VcSZyV0UWEZF5i8HC2Wcf+EzYlNpfw0M1PBSD0+lNLMnRe
         E7Ig==
X-Gm-Message-State: AOJu0Yxx6CG+2/9jqybKn3VpdILDMxSctLyOUra7J+OLSumBZsYLEV/a
	Q74y7UshOQ5m5UJOcVPdp1WPjXEvKzM8MWqn9E2ogjjcmmHFvBccGksyAsPjUPQYVgN61LvbzB+
	COc73wx3UgY1mhGPgfI7wk1FZxorx9IMBk66BTAd6/mOX9ccdVE8LPOUPQikBBI95WRo7
X-Gm-Gg: AfdE7cn3oBi+YTiPZKn5bUiCGaOimt9W01ywkTTemPgA6pxfy/PV/IVeNbPmeGhM/ys
	FBHePT+wHyjmUr71U7x3wiGQcr0fwVCs/AOhPfWcBeDEHsYMj+H//SCBqB6yakIL6eW4DjnTOuj
	WZd+RZ8i6smHgyL/i4LHsnZ2xvGmiB8tC0qzblgNchSJHDiavQKx6QkXjGiVBvjcFEIjo92bE4s
	aPAJuG7Cq6u/OBjxj2UCakKE9fFp6fiOkMNoQl84F9tllxX1wxhr6xWrktdH264n7RT2xYmgP1X
	57gYlMd+9hul0+zLyNNp7LhzEhGafYzeTK0F5ydi55hFZshQxg/tByvNsFvkPRlY9UOePBdUe5z
	RX9t4YJEEvGVpzTdcfv7X1j5NBKusac6Jg0pbaLD3Ugzc0U/ipm1ijFJ0yQqXRMwHRKfUCAx80J
	Fr
X-Received: by 2002:a17:902:ef07:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2ce9eae29e5mr14108375ad.2.1783730819008;
        Fri, 10 Jul 2026 17:46:59 -0700 (PDT)
X-Received: by 2002:a17:902:ef07:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2ce9eae29e5mr14107995ad.2.1783730818551;
        Fri, 10 Jul 2026 17:46:58 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm67000665ad.28.2026.07.10.17.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 17:46:58 -0700 (PDT)
Message-ID: <a34905bf-7f93-46bc-a9b7-ec44f36aa0e6@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 08:46:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710080523.428548-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710080523.428548-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAwNCBTYWx0ZWRfX0bleTA/2LaGv
 +ZLYsQyih8G3/JCLtrs4RAD5jtrz4H/FTaB0YbrG8VNuHysDEOBDzk8mVknOX1POW3CQ0KDuuOn
 hN0bIpde+CFylD1W7uANOobteyf4ceA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAwNCBTYWx0ZWRfX/DOvaMp+TH6h
 UvJC9xlKM6n2lH1aLFhcwtVns+5TcxekKGC99CV/1OCiRe7zn40hOeYbs3yyUNLduxYHCvDYR8L
 gIU//7g9EIldtSYTGRmyZ/9gLnnwGP0AzL3YAt9YzHslnGbEUNbKXGYFx60IgQu/kRQznhtslqt
 BI18ZrBV2yhzVYAT5BrXTSD0G+ejgQAKZ0XH1PNxvNvmEfEWvGOLB9wObps6B5cT5lBKeF031bu
 QKtWJZfPSvPcDBuWnRhRA8s+ZRW26Ex1a8ZbQo1le/nr5O/GlQidYF5Go4sIKbd2SrdgDUOJbtB
 0II0cDm4jux817QZzLcsVBjHzQpn5RCITai04OfDWBlZZcK36eiPf7JSxp/JSqsEKn89rYohJfp
 YEQx1nzLzIRPY9Qcs9Ir0PJpr5ZkXFa7G5N8JXL1kFDJSSZM0OEICZEeXPgXP4c2Uiu4A/+4kPv
 0gijnyDE2xoEInZEV2A==
X-Proofpoint-GUID: IyDnDwHncGRfoGzhqGulH5GrawUJ4xa9
X-Proofpoint-ORIG-GUID: IyDnDwHncGRfoGzhqGulH5GrawUJ4xa9
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a519283 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8 a=tyIhYoOGzA4zFAWON2wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110004
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118431-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,mailbox.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jinlong.mao@oss.qualcomm.com,m:tao.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A134773FDBC



On 7/10/2026 4:05 PM, Manuel Ebner wrote:
> Remove needless '('.
> 
> Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Thanks for fixing the typo.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> index 152403f548c3..c7301f1b28c1 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> @@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
>   
>   description: |
>     The TPDM or Monitor serves as data collection component for various dataset
> -  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
> +  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
>     Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
>     Single Bit (DSB). It performs data collection in the data producing clock
>     domain and transfers it to the data collection time domain, generally ATB


