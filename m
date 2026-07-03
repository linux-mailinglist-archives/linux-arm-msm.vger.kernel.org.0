Return-Path: <linux-arm-msm+bounces-116429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0m9DJhZHSGrRoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:34:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF97061D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 01:34:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=o8GwrdaX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b/jbr81m";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116429-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116429-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C8873024516
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 23:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FBB33F367;
	Fri,  3 Jul 2026 23:34:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D22D97B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 23:34:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121676; cv=none; b=IGSEWD/xsGzXIule6IRdlF4bw2omwY6Uksv94TY+EsM4Rly11UA2Tbv14n2a9huZKPXj7kVqCgT9Zvb63NH/6+048ZLkD68e5Ye2rJbRz5NNVtxO3r5uYgfF4uccLrOD5SRVqB7dcRN6atGQPXA+XWai118KoBNb5koEQxGJvKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121676; c=relaxed/simple;
	bh=nazfFnHvjjbt8KBJZZtfugY+QOWghPItE/9y9KgBmUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc0ev857+Ha6pzDmBJQKMwfsBE1yTEUKhNvAbpZ030+11QeekapmzfAJYsbjsLEZjT4yHnwRQ/CwmG6iHJLAEAJs7Bf0BM+vrMZaYg+9qJzMV6pH9At04boMSDU9hrhdjqdykMQhg/nVYbA6nY404jAH3CFKi6zWmZgMdgOIhhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8GwrdaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/jbr81m; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPjS31031220
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 23:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=prcMmke1zFQfB/qFnU+ojBqY
	3z/+3aFN+aeWXEDa/JI=; b=o8GwrdaXroxpP8fDqcYUhFyfbjbZCvHQ7bNPfRBI
	ty3TkeFOuXlSfdPhc+BzGUG7Yh8j2DKFZ9J32M4j3wk6lRud52Q6B5c1nVhCaKae
	vNdoCVrvXhe5EpA4UZxIDNRWx/ZwrwSX8QpfPhlDN0S2ym+605AfKwlf4JEvhrBB
	nZXMXKBLG+tl8NVr/fDsp5ePwpr/ZzPnQBYyRwiIHyaiezzxiR4CTdWxFWwJvIgr
	QK7qMOK6CR+fS1gUEauyrAo9z5VrXPs3jKG75FQ8HBKi3guckXPl2kmIWIMiY7fU
	6fisp9crFiuSFPzZH1ioOwffuP6diED0nadxkT3PoE+whg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5c822-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 23:34:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so107251585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783121673; x=1783726473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=prcMmke1zFQfB/qFnU+ojBqY3z/+3aFN+aeWXEDa/JI=;
        b=b/jbr81mdpWd/yBkIyV/wKadYRBl0ZJ8obpRscmdiI2aaAg2Vbddw/M1nAL2KV+Kzz
         UfxkOVQDyuPNnjsUgXbjVh6svhLpGXYWw7Awy7ggXBdUqR7wALPf2AuGxegRDqhMmy/b
         DtjSSiQsPxk2S+NkFitm0OV0lTioFRQEpEbSb5GHHQCfTq0zNZbhJqM+iKLJoBJ7N5X0
         f/1KT6uHdi6p1oMai5jTnJseKC7kRlqkDIfxHFadfcp/pGKBnzxh9w6rQcl6GvNRLs2h
         yZcVgXl5WGog7in+A2MlPiu4wt1lli55jUsJXrZUfvNhMfIGLtIWRra4EQH3DvGu0PrS
         CJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783121673; x=1783726473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prcMmke1zFQfB/qFnU+ojBqY3z/+3aFN+aeWXEDa/JI=;
        b=MXlvKcGd6+GF7ZDwZTZocT+J7WbSQRjgCjp0wpcsu2u7fl3oUjVeM6FyrYiv3kK0T9
         OJ8gdaH0EDTul0MqrpN1ek9uCYXOgtAuqEKN+rK8q+61IAfr37zqKumfuEeNQbv0F8VM
         sKf27vGUQRNSfo7zfkJIlMzpkwzN0TqMlvEr5AeG/ivpBCUyTw9N8J3M5+Tr8fet5Cao
         hC/WEzPLh/gkVyos6qZbbj1QTcphCE4W4gFSsjnh7Zqd1UKdLzHGaPFaNo80nf5//HD9
         eGVsf+0A/S+YCNr4Eu4Uw8ZxQG7WQBAUrR0o2X6tbtP9OsDGyoHu54TIXaenW9f9GHmn
         jZ1g==
X-Forwarded-Encrypted: i=1; AFNElJ9349d2GIFEIcpynD8j3uFfuh12vRLvstBPUworNu7di5ovcpIaTYG4KifGJv/EcUu6TrGD9CKdV+z0yTbd@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/PY5Pc/eCC9NT6QA42OVzUudKOetugA0IosnJkXWJecq7/vD
	qMwMcNrkY7QyOeIg/o+Xo9Y1SvZWEiNirBJ0AlrJyB3RJ5sUSlTjQZfOn0c8EmFpFj84EFQgOTH
	R/Yj9Mt3rk5HlPXIkiu8sNBjhfqaECBDeNBVQXKCYZ2ZG2mdY9FLEYRkBa0r2bKIpBcHN
X-Gm-Gg: AfdE7clYPWpOM7diKYjDp35sYNKEalZzM2U3ZNouxZbGBnY9eOXLICj2MgFzpaPFt+y
	t4Eyxto3dU/lVcdZUQ/2TdMR0fuhvepWNwfJIpYS5Tsy3IXkyYkEv/oWqnJ2SGcOk8gPZUWFO6o
	qKVmNNX1uTlTnqrpeMv5+e7E39EAnzo8udYsJ6YbCI9ekQkpOruYvMtbIbdFvwx9Hwyo0eSKGNK
	Is9JqXRx3SlKtVlRM18YVzuxstJCMWneLLltr+8OuevMPtdARNRK6wsnLAOpUQMw0ZkaHmSjtym
	Ajv8tRFGOqVS2s4Rm3R/nSUHNmplLydKZTjaHJ6+fE4nMC9PNDx+IdQhodMoNYvE0owoOesj2Rx
	242tOpehgcChjz/Y9UKpNsIIUpRJEADN3eN+84x7ZcZOQrFbgSvrDFIAjQ5b8IHNr+jSsj5zi++
	rIzKp7mCaz875XKn2/8hxCVICw
X-Received: by 2002:a05:620a:288f:b0:92b:f1ba:5fad with SMTP id af79cd13be357-92e8b58da9amr730706185a.37.1783121673393;
        Fri, 03 Jul 2026 16:34:33 -0700 (PDT)
X-Received: by 2002:a05:620a:288f:b0:92b:f1ba:5fad with SMTP id af79cd13be357-92e8b58da9amr730703485a.37.1783121672979;
        Fri, 03 Jul 2026 16:34:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c4acdsm836984e87.76.2026.07.03.16.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:34:30 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:34:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
Message-ID: <twncu55nou3r4ediipddc5unpnkhvllaj5ac2ayrryk75orucq@vtt7bremuqzv>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzOCBTYWx0ZWRfXzv6rfHous5HF
 EVb4N4TXMc5dz4X29YMQgfPGQb+n8Y1AboZO30KafowO/+hExweUnebkWmCCPH3n2ezAp/pisdX
 6AwMXEFZQ+G8Mk+/7/OHNZiY/VIg514=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a48470a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=z01RItMgd9csqulRoWYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1u-yoJzmfw9iJc5gln8lR-VB2c_caaIr
X-Proofpoint-GUID: 1u-yoJzmfw9iJc5gln8lR-VB2c_caaIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzOCBTYWx0ZWRfXymRgfCrCim5F
 3ohAd0C9ImRcKHxZpWXrYZOMEFiDnyyNXtlIk6t+7d0mUr8leAkHof6ZnIaCUMofk3dE9uHjHx4
 QrRUDSsr5UBWPvaGJTAV4hAgdjUStCoUWVPPnTVyP76XX24dZtOpHaVPDGZtMpuzNavEfKVxfsy
 Xf7FG3MwGRiGhel/gkYnon+85/MyksUYPdy7OIpOGqUAeIfOHSfoFZDRuLwB/3AQPrsP8+oOkyJ
 egfBm3myJucLrbTWXK6JFNIxifVsXKfQQc4HG+QhH/IkcByV8cWkdRQDDZq9cpTos1xQIH4WK8k
 8S92lzbDaLszxi/39JrImJ8tTLb5ysArUmD5vLpJLXKPlrie7ZytIqtCdN3vFtLjHJMVMjQHwG0
 wUMlYHe26qLGRtu92K++ranZSQs4VHwnyq3XXap7Ptk930vY613Hdh9jGEnxPFHznSpj+96s9GB
 9w/vi7nH3XgLDps1dMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030238
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116429-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,vtt7bremuqzv:mid];
	FREEMAIL_TO(0.00)[outlook.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38DF97061D8

On Fri, Jul 03, 2026 at 09:01:51AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are required to be configured through a Secure Channel
> Manager (SCM) call to TrustZone. However, not all Trusted Execution
> Environment (QSEE) images support this call, so first check if the call
> is available.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 44 ++++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |  1 +
>  include/linux/firmware/qcom/qcom_scm.h |  1 +
>  3 files changed, 46 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

