Return-Path: <linux-arm-msm+bounces-119238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X8s3BeB8V2qtGgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:28:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23575E1BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:28:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gUlhy41E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YiDiEOpn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC2830937B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF134508F8;
	Wed, 15 Jul 2026 12:22:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB8436BC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:22:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118155; cv=none; b=CNYJG5ulXOk+SEngDNHG16XsfiRYG5B0UP/WYCwE5L55MV7gQQn1jtitXORdt8mmNO1NJpBACUlIqs3vH1w0d5OwXvlHo7gP++/BTzgFckbAO59MG4TS6alCUBnqQ+NjUuGTqEayg6mf3siWL4xWazY/NnhG2XJ55iMvXvqVfr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118155; c=relaxed/simple;
	bh=PZa+it5ln/dZYcDQVhHQXLPvxKtKTwctIopAUS1NAD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MirpBB5cAHi3LWx4bKMlrsO1ha/Tc37o7XTKmecl62RZZgyDoB7UOJs7mRu1wF1SLjq/z46QjAFIF2H+9M/W0enMIenIgHnz/vZmD5pzR0wQ3zJC5ePPqBjP4iX3ifF79GtZLHkpHNIx9P2+0zYUpYUiUNrDYqk9sHPn4zrTg68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUlhy41E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiDiEOpn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBclpV3678369
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9uVtnp4ftgJs/XKrszPRlmmg1Es/wCizqUifj6MXDo=; b=gUlhy41E5kpGea3a
	BB/5TjJubdLBbShBspxaioRA3zRpyuDaKtkVR/wpGTPVFOFfmDQ5VJnluUXqLBoM
	oNWPHNhzq2VZK1v0u5HynxX+G7Pk0W96tCUXdZdLLFcPtERI5rZiY0nCPJj4Txon
	wGIfNPgYbygwq4ldkVQlvR77PLCsywATtUe7pTGRY5kVZdDewvsUVQQBM8lcqFs7
	aQlBBPIXbxL5X0AMHKVOaS2yyHVcMkRjkAB9rtJ26gQLEdMvY9sa90T9+7+aH43t
	ehYUjxSrz7oFz8oCmJV9TgrS5o9mvj9JFTgZN8utN/faivcBtBnhDb5SK1xRbtuQ
	RZrx/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe65292u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:22:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso98542585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118153; x=1784722953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9uVtnp4ftgJs/XKrszPRlmmg1Es/wCizqUifj6MXDo=;
        b=YiDiEOpnIX6kUmKqJ6UeCTr31JEQPSPMobQYrqFC8yvrQzLIKtWk2X/GrAjTiQPY3k
         i6vIFkQ6miRAIBpQjlZKQtGha7V5vfsBIAx1+zHGdxliaCmjUBnZhAErOz0XLhdfi4QM
         Le/wwF/870k7kEdZBd6rWM6SNOlllMcpnJhaXYGKcVZVeF5woImzVYJzW8u7W535+2BF
         TLKq103haV8/8Qs+e91yc7SaRNhGMwqrCCon62FU54K1xnzvY454lnzCmP1jsfkZbubb
         EaNAHdBL4ph8wiB7NYTFPNS50WsFoQvQOaqBYZkIhDIcgeANg8MOLjs46H5oVwf1Sm3A
         wwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118153; x=1784722953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9uVtnp4ftgJs/XKrszPRlmmg1Es/wCizqUifj6MXDo=;
        b=U9y6DMSdtF4sc70X1zjFmTdrUgHS+rpebGP3/ehDg0xWPouj/DjxVYF1Q2zarL1lvR
         fGF/A7TbB2hdpgPMIHbyVGmoBvKWZRIoZ00g+dPG+l7y3gy6lPZ6/XIxUtSjWS+vZTvj
         6d1AMuVhxkPoSufBlZxdr9F6jp6jXrHLC3J+5oxKYi0pVldB1UqJhH0nLFNcZg5kKCvS
         s0bsSoqubQZW3Ep9CdJ2EIuJwn9HhwnU9zs5S7tF5sP9EpNiskL60QBOZJ/Cyfyp3WsR
         278jvk7vdQnpICCi6JNYFtY4qrGWiRvoy9Z8+sLD2cv37C2XTu1XyWBIkcDIXITzmFbE
         L6Cg==
X-Forwarded-Encrypted: i=1; AHgh+RqDKND2N7mExKbbJJyKFh5Rnv7zkOfH7lbcz0C9x4CPTBfNoOqVP+mQuCfSrf5UNFdSsD2cWZMZNX9NHpEc@vger.kernel.org
X-Gm-Message-State: AOJu0YyMIQtEPp1h8QjEZ6MkdrXd0oqrq7lVd2Qx0wrIkMrtu/U/ED/K
	FupvLGN/wlshNd8sAg9090ULkPc1roixP5k5J0Ni8wEGmBXoW5dSEdXUdLb2Xz7Fmo8qYRZrlje
	mHAoJLuvpxxAxgc/kojVVrq6Ug1+Pee83fP1CbMs6eSpmlTuUrvxpzLzeErzmQ0NCc685
X-Gm-Gg: AfdE7cmK4KUF5vmqCCyw45VVjHB9TESmFBC2qSZoDa6297QNz4rHQQ8GCtdrQqF6Sli
	ZLfN6ghSHJWARS2Joao19ShxlWBwIEfdcQG+NAnabmHG+GOudMmHG2aOTF8piL0TiG3F4AnhD0M
	CACh+7rFwI5UWBh4b6mXKdhzehMssciKPEz4Td4LVxX63JAyPW8OOMeuNHZ04TZxV/UXDQIrFRs
	TasjRbbdY3EqiSbo6gekSIe0VqnLFWz9/J2SMKXlQjFYf3qjfpFRmz54bTAb4stY+jWMgUKKChx
	JBamacg/r6YvDw9tNVUTSmxf9lnVjxO1Ntqac5MoOBzNH+0a4RJckx5XVgMT7CnkVo9F70NNRzj
	aqgJ05hgDcaBpdBYl2nteopkCbDf9Xdwgy4I=
X-Received: by 2002:a05:620a:458a:b0:92e:46cd:7299 with SMTP id af79cd13be357-92ef2c7f24fmr1309037185a.8.1784118152925;
        Wed, 15 Jul 2026 05:22:32 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:92e:46cd:7299 with SMTP id af79cd13be357-92ef2c7f24fmr1309032085a.8.1784118152346;
        Wed, 15 Jul 2026 05:22:32 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm15401266b.48.2026.07.15.05.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:22:31 -0700 (PDT)
Message-ID: <c9ea2930-d12a-4445-a2ef-3907597ccd86@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 14:22:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for
 multi-owner I2C transfers
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        vkoul@kernel.org, Frank.Li@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        linmq006@gmail.com, quic_jseerapu@quicinc.com, zhengxingda@iscas.ac.cn,
        kees@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: krzysztof.kozlowski@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
References: <20260708051023.2872304-1-mukesh.savaliya@oss.qualcomm.com>
 <20260708051023.2872304-3-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708051023.2872304-3-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX/+VW5tZyhym3
 ShJbA3xOETmG9RJR+UlXBaAXYk+31rmf8x1diwv+cd0HlqDImab65pl6OZ8cW1ZHs4eBFfLPXtk
 fBp4OGkP19EvAY3B5eKz/N5uUz/G6OS8vN2nRNJEuxpKXjRTd0FGRk7+owgCsGRsOMf+CoANqWd
 H+ys1pl/pf/uWzpYXBDZBdWK8rpIbDN39tbZaWtucFNEAGQq8vkL/2ajhyGJvQn0BCiFFPxWDR/
 DFPNuKPyi1FUMq9xkKseAd1cliVwXTnBYqX13UIGgwxWCw+5KO18YsrJ6/sjU1XZwF2RMCvxPoe
 /ouNfXGkIF/0UkouwkdUBhaQB7U+b3fv1vtPhU+c9t6jOWLkcpDtR9lHB495J3ynI9nK39Vj8Du
 lJ7F3x0XEdvSz9ZPaoQDGvFpvLqDoMZkHcB8L+m6BIRnIbTGH7v3ONl23+CbmvKFPDqOcwoQmk4
 097mlnb10wfh6Bhwy0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMiBTYWx0ZWRfX6IodtQRbS+h4
 K+uLVfzA60U+UUTMi+q8Gld9L3Jn1Oj/5DRY3c1J9J7tNA9gd1z6t9AJLcgFjO073NE52KdDS/j
 Wivtol86iyzAiTHgRhf9fxNET3AEa+Y=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a577b8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s1zqTiH2bahLR0COYxoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vK74Ye_VFsOSc1N0JT7mhi78L9cHax5r
X-Proofpoint-GUID: vK74Ye_VFsOSc1N0JT7mhi78L9cHax5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150122
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linmq006@gmail.com,m:quic_jseerapu@quicinc.com,m:zhengxingda@iscas.ac.cn,m:kees@kernel.org,m:agross@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,quicinc.com,iscas.ac.cn,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DNSWL_BLOCKED(0.00)[178.235.128.140:received,209.85.222.198:received,172.234.253.10:from,100.90.174.1:received,205.220.168.131:received];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RECEIVED_SPAMHAUS_PBL(0.00)[178.235.128.140:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,205.220.168.131:received,209.85.222.198:received];
	DWL_DNSWL_BLOCKED(0.00)[qualcomm.com:dkim];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E23575E1BC
X-Rspamd-Action: no action

On 7/8/26 7:10 AM, Mukesh Kumar Savaliya wrote:
> Some platforms use a QUP-based I2C controller in a configuration where the
> controller is shared with another system processor (described in DT using
> qcom,qup-multi-owner). In such setups, GPI hardware lock/unlock TREs can be
> used to serialize access to the controller.
> 
> Add support to emit lock and unlock TREs around I2C transfers and increase
> the maximum TRE count to account for the additional elements.
> 
> Also simplify the client interface by replacing multiple boolean fields
> (shared flag and message position tracking) with a single lock_action
> selector (acquire/release/none), as the GPI driver only needs to know
> whether to emit lock/unlock TREs for a given transfer.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

