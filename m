Return-Path: <linux-arm-msm+bounces-113189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f/D3Dj4IMGqQMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C0686F97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:12:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n13Wqe40;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ICQnQbKw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4F813038D0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE9D21C16A;
	Mon, 15 Jun 2026 14:11:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379463F661D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:11:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532694; cv=none; b=tgxgq08JE1dSC7BLD5wzh3q0uAeunIYwGADIj16J6OPU9TnIAbllPulUIRJa5OsJqVlc8bFEnr9qYVnqpH1AlrN0obbKif4ih0Og+eOIyAdA+VTFEkWdpnLBhInJZMWmxtTb81sYG+2d4FUwcppblWnVaRJ1kXv+xF2nzpZ0dXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532694; c=relaxed/simple;
	bh=skvGd6YlvxaIuF4YmVpLO7yCWWrcpj4DtUxM11rryI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR5SaVL7GRlLxJn8cBUH9n+gMMT1+MCJJrktteKk6eqpsiGu8oLKzoPVrPFSa65iL2FECGhi8YLp+TwuxxyYrNNiCv3wLj7LJkKIZ48Riim9ucigT9xMn8AP93oHyREBvWZmR8BH5JBMtVSP+HrFpa41uyFKtc1dz/2cWP+qCvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n13Wqe40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ICQnQbKw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCbmxK568230
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c9Ck0QD4Q7uF2y8iLxRHBejsWgQqF6dlYb0G+SA4o3w=; b=n13Wqe40NpJaY/ak
	DTxNJZqoge5BrEQkmweaAdchXrI4wNUyx0n80JFGavfuM8wYbx0dCQC2chxiaP0B
	fTUw7WhF7akYhF5wvtrt5a/pBoQoOHJFGaeF8MY7HvT7lKxb7g0vpCHdCq7T801E
	dt1ELbfU/P5dZhrlwZ3pak4ZvdmaP2VeYGUwvvzrYfkNyuiKJliXUG4nwiAYUlW1
	/q0LGfQMTyLWUPq4YitnF1WtQRz4C9KDS8ZuxiQ7njRp/yqHqBSwV5IGLPPEadr2
	3gYS7lci11+thh4+nzIwUI9stmeptYrvEIgUPMUYNH06wfRavxQrO8lpEGv9OHM9
	OjHpSg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhgjhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:11:32 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-69e3f2df5e4so4646303eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781532691; x=1782137491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c9Ck0QD4Q7uF2y8iLxRHBejsWgQqF6dlYb0G+SA4o3w=;
        b=ICQnQbKwCJVn7YFpVZYwasylS/81A/SZ4hIqgzsuQxZ929ap4SzQAWTiztaG5/lNlL
         LyvcjbyVSSf6Us+OI2IlbDnqnc/yUlAGxVgP9bnROT/OtCluwgSPJSnmN/ASGugN6wn0
         Yg3eb+stpFIn7V4jPWttfhbQmQDsZjImu5EUxBwlhBWxN7XED4SFxkMpXCpq+04E6LZh
         H0VpFu/QrwH9PSdVrI/x4z/YSMe5FFNRDin5x82R5rUB/YVFt582bde6YZmmLw0Gpzw0
         A039z5qgPkgjkfCGkOeolgSjnf1PC74aJzhtWzFTmX7Hjptq1/tkgqpAer+yvTUmz2jx
         MqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532691; x=1782137491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9Ck0QD4Q7uF2y8iLxRHBejsWgQqF6dlYb0G+SA4o3w=;
        b=W6cba5dPt80wGVu8BajyPK5Fp5/u+B64klpmfCNjNwYmrtdnqGYBKfao8ZwnXHTJXN
         hognnqG8I+3SrfiO9TEhp+3xQOMqHKZx1qBavOcXJZSJqiqyMQ7YhIlV0nIvnnpIMt7F
         79iRmW0UHYTR9ojry5KooGRdRMosDWih0LwA1ov8Y0ybDPXJ7BvmKWGw505vUcVgrbao
         KUDM46K/us3YvOiWgtOG8+ulhDoXTZmd4EPkLPwwKfroSDprKRIQw9qLR5W5CBrOTgRU
         Ubt6w3hvNnNWuo978tW1cftMnxRA3zZFDFb8PepQRf1y9p7F65WfZmYNvaik4f2QBbaY
         2yAw==
X-Forwarded-Encrypted: i=1; AFNElJ+Cme378VoL04WK+K6fvk8hU2TeDydxysOzfOOEcwXgOdppsA3s5lW345iZ8hAVbEWYLflpZ5+SUYqyaEOS@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdhyj5Zl1Xh7S0GSfpbsySjCHjKIJ1oBoAnByz+5qBP2hwZW+
	a0h5jcIIl48a7/eSwgI9MEG6Y39zyCIe/V/416VMQJMX0R+PWdo0acjWPd8CqBVw28POcQMc+Ne
	BtBoT5+O4E2yRPshgcNKNN2lSf8XdXBunIOmiMaBdQlqYuvYht+zROtiM+aJDp4GhF0VX
X-Gm-Gg: Acq92OEk7C0ShyWvu7BDefESf4bYz+/hVrnUuC8z0gCasKRSWIRn35WQt54XI+GhQ01
	M5kjJqYb4zsAs6mwTRGUwpeGfa/+mZSO3TSYPqrdqMtu3068Dnn5mBE/Q1OTHUvVXDQ4OJOMITj
	rgsFYi1sWIxazn/pMCOumg6rirWf5MgCbpy3ak3nQTK2+2Nj+n/xOieqfvzOITXMtKCREPc/AE1
	YFPKZxpF9W/QP3a8UnXQPwdOUU/Fq8CSu1fjpUvFC0JsqEAukcxl8LykUSLaJTmUxKnqxi4se0o
	JiW+0ThKshjdY6N1ShJZWvvl21/hfW7MdhXlP9zEF/m4LEFa+yXqVjMfuKVp9z5+I8CxGeaiFh6
	C1RiMJIlsiPccdHYqqwhihFeJglz8ireym15pissgXofL+PLiNWWd323ayEuQlGYMTPIoTqYMc6
	gWBereExc3UpVWmitVbTUcq4+gFbcUVbLRB7Q=
X-Received: by 2002:a05:6820:f021:b0:69e:3d6d:3757 with SMTP id 006d021491bc7-69eec9b0ecbmr6711427eaf.55.1781532691477;
        Mon, 15 Jun 2026 07:11:31 -0700 (PDT)
X-Received: by 2002:a05:6820:f021:b0:69e:3d6d:3757 with SMTP id 006d021491bc7-69eec9b0ecbmr6711408eaf.55.1781532691009;
        Mon, 15 Jun 2026 07:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1bb12csm2806235e87.84.2026.06.15.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:11:28 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:11:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
Message-ID: <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
References: <20260609-qmi-tmd-v3-1-291a2ff4c634@oss.qualcomm.com>
 <20260610-ocelot-of-stimulating-excellence-bcb0fe@quoll>
 <03d863ee-2caa-41f2-94b5-7332fc930b42@oss.qualcomm.com>
 <d81bc78e-2c1d-45fd-90c9-f7ec462183a0@kernel.org>
 <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE0OSBTYWx0ZWRfX9GIeJClxw5Qu
 0POeOn6DTulDxFQMp/7ltqNkT0B2OJicrJtWtZMrWEG9+si0qriRLKkLMCZbQbX6ktiuNt1YElq
 fEJEYd+rtKWFslhkDqFIbvX6OySbPy8=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a300814 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=f6XOEFucdkFPB0-045EA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: u6FLlKncqhstmI4U6o6ZS272AXoWSC1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE0OSBTYWx0ZWRfX6cySaIj6GwO1
 RTej84kKxyxAEA8SIiT/eU6R/fbVU/LeZOvgNuO/JyQGj1IV2+WyJEtyyjSPTBlPy+sIRO5bBvT
 zvIjtLHF0KFTZCHK42mPZcDv42FrlhR9bVdPbKlMtz+zHjzctQPM2w+OTIbunw8jrnzIuZiHkgR
 n7Mf3AnLO/Mm+eeiSX3F3HXSf4kzWaXVu11JqDQpYE9QamTOMR/dXejDarjTUIZAB4E2dExmQcE
 cI9YaBUpq2f99Xjp1ljrrBACJ7fSw9e2CBLXtpdso0fs8AnoJ4r+7U+AHpHU4tp79ZE7//FplSQ
 /l0xzvClFqgbsU2qL9jeUrx/OR2GHG7Hv8JXcf5ndoNQKYlSbfRB/mrTfMDqlVXYXhFuSu/8iaq
 bVuWpP1ziAViE+FKz4ji5kmQUlHfk1uLsaeNJW7dW2xhKKJdVBI7eQlodvqy0mljiHk63QTSAIk
 PQJ91wS2kwwjsuJ3z+w==
X-Proofpoint-ORIG-GUID: u6FLlKncqhstmI4U6o6ZS272AXoWSC1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113189-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,kngk2m5xum3x:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB2C0686F97

On Mon, Jun 15, 2026 at 02:30:49PM +0200, Daniel Lezcano wrote:
> Hi Gaurav,
> 
> Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
> > 
> > 
> > On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
> > > On 6/13/26 13:05, Gaurav Kohli wrote:
> > > > 
> > > > 
> > > > On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
> > > > > On 12/06/2026 15:52, Gaurav Kohli wrote:
> > > > > > 
> > > > > > 
> > > > > > On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
> > > > > > > On 11/06/2026 13:12, Gaurav Kohli wrote:
> > > > > > > > > Why? And where is this generic property defined? You cannot just
> > > > > > > > > sprinkle generic properties in random bindings.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > Ack, will add why part.
> > > > > > > > These names are matched with the thermal
> > > > > > > > mitigation device identifiers
> > > > > > > > populated by remote firmware over QMI and define
> > > > > > > > mitigation devices are
> > > > > > > > exposed as cooling devices.
> > > > > > > 
> > > > > > > No, -names correspond to values passed via DT, not
> > > > > > > some remote firmware.
> > > > > > > The remote firmware should give you interface which
> > > > > > > is explicit and does
> > > > > > > not need such properties.
> > > > > > 
> > > > > > thanks Krzysztof for review, We need tmd-names because
> > > > > > of following reasons:
> > > > > > 
> > > > > > Following Daniel's series [1], the thermal framework supports
> > > > > > mapping multiple cooling devices per remoteproc/device via indexed
> > > > > > cooling-cells.
> > > > > > 
> > > > > > 1) The thermal framework's cooling-maps reference
> > > > > > cooling devices by index (for #cooling-cells = <3>).
> > > > > > Without tmd- names,
> > > > > > there's no way to know which index corresponds to which
> > > > > > TMD, as firmware
> > > > > > may return tmd-names in any order.
> > > > > > 
> > > > > > below are the changes post new thermal mapping changes:
> > > > > > DT: tmd-names = "cdsp_sw", "xyz";
> > > > > > Firmware: ["cdsp_sw", "xyz1", "xyz2",]
> > > > > > Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
> > > > > 
> > > > > names property are not to instruct drivers to register or not to
> > > > > register something.
> > > > > 
> > > > > I don't understand the problem and explanation in the binding is
> > > > > basically non-existing.
> > > > > 
> > > > > Remember that all lists and indices ARE FIXED, so driver knows exactly
> > > > > which index means what.
> > > > > 
> > > > 
> > > > thanks for review, shall i use driver data, which is basically
> > > > pas data structure like below:
> > > > 
> > > > static const struct qcom_pas_data {
> > > >      .crash_reason_smem = 601,
> > > >      .firmware_name = "cdsp.mdt",
> > > >      .tmd_names = (const char *[]){"xyz", NULL},
> > > >      .num_tmds = 1,
> > > > 
> > > > Is something like above acceptable? and this will also help to
> > > > filter tmd names as well?
> > > 
> > > 
> > > How the thermal framework will bind the thermal zone with the TMD ?
> > > (node pointer, id) ?
> > > 
> > 
> > Hi Daniel,
> > 
> > thanks for review.
> > 
> > With id only, in this case instead of taking tmd names from device tree,
> > qmi_tmd will take tmd name from pas_data(driver) and register with the
> > cooling framework with id only. Please let us know if this looks fine.
> May be I'm missing something but:
> 
>  - The QMI TMD returns a list of names, not ids
>  - The QMI TMD may return the list in different order than assumed
>  - The cooling map index points to the name of the TMD in the DT
>  - This name is used to match the name in the aformentionned list
>  - The index in the list and the id in the DT can differ

Would it be better if we define standard indices for the standard names?
This way we decouple the actual firmware strings from the DT.

> Krzysztof , I don't get why having the TMD names as properties is wrong,
> they describes the existing TMDs on the system and the cooling maps index
> points to the one to be connected with thermal zone.

-- 
With best wishes
Dmitry

