Return-Path: <linux-arm-msm+bounces-114634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHOTGSNiPmruEwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:27:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0DD6CC6DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 13:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jhm6enFn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AfqTiGam;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114634-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114634-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26602309DEE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B494A3F39FC;
	Fri, 26 Jun 2026 11:26:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CBE3F1AD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:26:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473180; cv=none; b=qXipAJVzypQ1IwcH/kSz7+P9mgK0HwjIG5bcYPtf22NQ51ymZ7rVZQ6jEDj1pwsaxCSlvkQOal7qf267EcdBLcPnRZ/jh/xXskzXsyFltq5BjJMC+cO9beetrWcT96jgtwjFqCDOrGhblHgt+mnvsHYd4ZtoHUkowHS4zVqIcws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473180; c=relaxed/simple;
	bh=W1Ih8jNWQ5ERX4DCHAykcTcyM4AQM8TjlVlPwDmSVaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgoRZnRIji2NsT2vNzVLu7Fymj3NK6UVP2eWvu2rKvv5JQEChHY2QoDFmaImxydSlirgJXeSM56LMKSEbHLmpgaD9Ey82LoeEyX2vfZ96IjvrMOAqG2hfv0T01Dl/sVEuh10aiBKjaFpddT/kl/uI6BObV88Xa9dtvIzpbZqpas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhm6enFn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfqTiGam; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAclw61190030
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9WVpuERVGCGY3+HjGLXL+TTPCsSSyLWS1hk7uKHeGM=; b=Jhm6enFnzQDViS4w
	WNcDwnYHfyPzCiM4goR5wyU/40P7A5q6PZ8m5KcQ/dp0akMFf2YHt2+KSZHui+KB
	B7V6z7oGOOCYxokBiq4AOmxVx+5vgKTWLKmoPb2DuWq6jLlegzLPGMY/mIVn7zPo
	R/WsJOp/5EmOKh13mEuTGhn3W5XYV9q8bkM8K7KSPwVcDDp328bB9YMxPfuztskM
	xGqJEMUj1K53z4BpF71X1hT88ETBuroPjUlVDDXv2mFLjCCBOjE/KxDH43Xbbw9Q
	j3QsU7ct6zg4G+MtQOxpKWDHRaByYr4AbqGdNsP+6YYd+5YbzZ+u7sh2hJE17iS4
	1YNWlw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asku8rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 11:26:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178a632a12so1397021cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473178; x=1783077978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9WVpuERVGCGY3+HjGLXL+TTPCsSSyLWS1hk7uKHeGM=;
        b=AfqTiGam4QHKZ/Wn90yjjDhLJINBhBsaspYqpLvJqveQlg6xLDgUYGwysd6NQMns6Q
         34Wd3Z/M2lHXxtCc1jGWH/umR05k7loM78/SU/grVpFygpz3UW84WL1Xh1vMb8abqQ5I
         ANuDaXG8JyJ5sQJFHyntO7nh44XSUzDodiq5+LQnq2WxzpXlj8hQ9QMa8h/mVICpew0p
         P8IZwCZdJNQnyfV/4BoPctDaW2FNhLFShvqBkXFFKp3zUYN2PYUKfXxm2tcQPe9TFHA2
         OtFYrEayATV0Y4Fyqt5tgQpn7CyAc8BfSfdimQp4CxDChp0v/0Qx/KX3SbBUtwY3k6qx
         QQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473178; x=1783077978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9WVpuERVGCGY3+HjGLXL+TTPCsSSyLWS1hk7uKHeGM=;
        b=btcMxlFuceEz5dCnSAz6Ckhac3F9GxVdU/bzbFY2+k77vkayztmL6G6nMKb0l1c5oT
         mWUyspZtQ20VvfMWSOlWo/AEsLKuhSOMV5xZ8WAM3jkw7MyfM70g0qXVyZkZeCTkjcqx
         jBtYHg1f8fVcBBxveGJvOQbJ48QLkkUYxiqEr0ZJV5EySRL25cNRYn2b52FG3FGnqZ63
         1yXSlMPqe9F7wvgoI7VrtmpYRrXFcgTPBZM6iqi07DrQCLdGmflKWCCl9l/sCO1gwxvm
         E27p7JvWqQ5CAY+nzKNBAvL4mCvvXZ+VvR4P6+Ci/qI8MGYShyiuwe1y9azUrnhWWDpb
         5pMA==
X-Gm-Message-State: AOJu0YyazEc344R1Xhmv8hd/Q9kNQOilejVqeXcBGq0WPphL+gqLIbzH
	1q9FiavUMyqPvHSS+87xbTtud3MNPjHUUjcgvqDjTMTSy2pIIOrj1h0KD5h5pwcgWIynOMUj82Z
	pQluMd5U1fb4pMcrnwkotFcM+daU7B51/CS9RLQ/vyXSO8yX3Kovujd9Fgl02fYPIyLxj
X-Gm-Gg: AfdE7cnu7XVYcRn9H7E34WOp4NB6dRapznfHTWCbQaQAXEZtmk8B2VwZ9YAJ7MgN6Qz
	h62XGBgpRgaU38Dtti35upKdotIscwExlQ3oRxp+OBq4fplTcYgzKmVs8XTrifwfcEjRyBpOxaG
	5R98sR9blRfPuwNsL4iN6efo4s5vOCz90ku+klERbhqivpEVh4VfjDhP8TDRaJ00Tokdd2tpeaf
	hjcTO0qsjfNyrKMW3bOu3UEGYbqno4zPjZ80LipabVpz0+iJ8Iaw0Hx63d8XBkLlAKSvPBe9Zwo
	gdkrGeHkbMOqiknwi5uQO0arbk/4zZ+fsVhwFJ4hmrkTkvnrzr+gK89kmtuTIPZNdasLGNfOprz
	HwZR4GH+SkqLckel8rQpjbajKTBV5YGA8+0s=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr604758185a.5.1782473177754;
        Fri, 26 Jun 2026 04:26:17 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr604754985a.5.1782473177249;
        Fri, 26 Jun 2026 04:26:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbedf971sm336308266b.62.2026.06.26.04.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:26:16 -0700 (PDT)
Message-ID: <e6c95342-b3a9-46bd-aeb2-a1384234476d@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:26:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
 <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-2-00905324ffbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX/0P9jw/asGHx
 Lmppenz0xto0nZW6rm22lnlh9mK6FPGp2qJ2YwlmsyeSd7EVQAjB2//gLVNI7oK2Q0cTr7jRXs+
 DXeipaZQ1mvK6oR0rk/Y+WfE/kj1/Fw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX5pfO1ChFTm7x
 z4t9Ym89voQSwoJo8LfTPA7jPByDeglvCL1CztaoOV1adERsQuREyTVILMjs35UKj8vvuMFzo7s
 9XBxYreSAFTebUAtutJQ9lxMSk3JHJ2LETGb2kzDVeZ+LwMXVI1qx7f4WPzYJTrwRbchROLBxEe
 n2Jq2Lt3hif3NQ20IPpLc7bi2jpF6b+2ibLebTKog4XbR+veJYcOI6AD3wYu82IbNuxecjCXR3o
 gPJ+T47whEN6HC4SX1VPXBMU5SgCz30xXYct0ZzZcA3B5brIfy9ZYXxVuNXGuAAw8Cw3XOOPVAz
 ICsDphSxmPAxFyics3j8pPaDBbYUDlHl0kfAWC2uIkbeAaGqYVRZkMcNCbEBFEsdmQKCmwiJssn
 ks6UsK7zfgKtizDff+gxA1Zph7NjZEZz9wG9hoxkeLFFLtEYbPL5OPlg2YmCQkvfyt+btdFb7RF
 ziqHQzKDB4t0yOCXJ2g==
X-Proofpoint-GUID: S4IG2elzAsqUceoBKbXzOX8psa7moV0-
X-Proofpoint-ORIG-GUID: S4IG2elzAsqUceoBKbXzOX8psa7moV0-
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e61da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bU9JLcj44ShPMj4K6xMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114634-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jason.pettit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0DD6CC6DC

On 6/26/26 7:47 AM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.

[...]

> +/*
> + * usb_2 is a fixed DP-to-HDMI bridge; its SID-11 eUSB2 repeater is
> + * firmware-gated and never probes, so leave smb2370_l disabled.
> + */
> +&smb2370_l_e2 {
> +	status = "disabled";
> +};

I would assume it's simply not present (as every SMB2370 is a separate
physical chip) - perhaps we should just add status = "disabled" in the
DTSI file and enable the nodes on an as-needed basis

Konrad

