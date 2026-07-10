Return-Path: <linux-arm-msm+bounces-118219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GdMdB2DDUGrf4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E81739666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:03:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TCjeYyxt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="A/eGUARl";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118219-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118219-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E608B301B019
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2954A3F86E2;
	Fri, 10 Jul 2026 09:50:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963A3F823E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:50:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677016; cv=none; b=A53SZunuQGtj6fpbvulQKe/lQ88kSo87DZY7iQL+biv/9G71VGi3ssXlIGkNbsaA60ffpdBwJChSUfMK63vWZzLP2exluhuqepdm8ncly2BrDYDjWU8pCvjENMxR0dFLTufM0+whNlMz5cfeBcAO68eij/M0/2FtdkkmnWVcT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677016; c=relaxed/simple;
	bh=QKMu5NmGaOO2W0KX69/PxFjkByiQoEj+2qxAeN2oiLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q40lJTwbDcEXmJ1nF3/MPTUZ1s2rqiJ7dwDQzBxdaMpdsXkUgV332P0DgZvMn6IwLWNldDKiZFg0vkoebBDOSJ0DK/lVa2SBN9qERTlLpqHA5Dn2da1NZBwD7bUe0LDBNHpiPN5QzOm8OkMSUMrobD37S3hmX+gc3xtONJ2V+Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCjeYyxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A/eGUARl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dSej4156464
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=; b=TCjeYyxt2uUJ2vtw
	/UbmyqltkiGL0af9Zu9Gy6NDi2J8vmczKisc4AlHagWo7sIUOB+wwEu536JCwyGy
	LrQ/fFVJ3zj0XCvYkkFxvkMOwQMQyR50Lx5JZF+kJJvw8yEuB++TxqAvWDNaszJa
	Bh9Z7+8DQdSQX3UZ3Z8jU15d3RFkJWp99Cy84Qq8/9hLDWJaHhyiS6wo1G+AgdC0
	F/mCRQfN2Y1iu2m+5H5mU3INESUf7p4cMR6io2edev+3qc7N/9GKROOEVIfObAJZ
	M9Mv2JhXitdeNmyrPzKK11X307epV6K7F9HhoLG6b+qzk6AYYXuo2U8rEB19McZk
	rCoeQA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jq5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:50:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2322036d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677012; x=1784281812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=;
        b=A/eGUARlR8mZ5XolISG2ul4HPqND5iIor56MjEOxA6lTNTcRGHhmq9/nq7FDErjL2G
         OYYKKj+jDmjV3FtkH2XX4jGXoxkX70/YpNMACZYqm2ISjHCqPu5TttnsaTGsDvG72vuq
         AfH66hgP9ywqshZ2s3XjdKbRCRXYak7nRIBrq3hOmI+hnG2L2XdwMBFdozV0TAgsc+BG
         bDHdI77xaBaJ+zIwyP1wPYt9lkWGfvoF0o+MtH8YZu2uEWRycUXahEiiezLkX3CbRr8c
         eXuGH4qFC9e0KiM2EkXmMFjYU84MihgQ5MSmn1r4ABT06xXtz0pYva0xu9TvGZn35E4m
         wMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677012; x=1784281812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=;
        b=l0hB16f3C8VLoMpKzjjgk6aWCsdF2haQNJhDQAoKSGL1Uvbh4oQWRQ2RqmgD+0qOZA
         deU7R0AlfrqhSKr/xahIhDcPqrO/TRIYL3KgO4XSk2aEEQgHTo/IzHN66A71DgE2BOQe
         Z+M39i25WEIedeAFSnFOPPNoC1zFvTnNEVQh2cshvd5xy7Z3Ss7ejaPIAL0TWpC+FWT3
         wiGquE+D3bRMPwzCx8CRIZUWGYYFEf5c6r7UExVSFdMgbFFi8eYmUnYpHDNABT/jN2Vy
         ZsYW98wJ39hsPh4mvTQ2xf/7ytpZ1s4oHTeK9azyfEQsS+tXXeVD9Jb201eec5vGrq/H
         x/YQ==
X-Gm-Message-State: AOJu0YyKOt2t7MPi4YqoiNOhzEPOsAGIuS1DdHI5F5dczyOkh6Nb+3/B
	Jhw1/0TkOBKoy2ceCj+jMq7DF6/hLU1uNtRdgZm66ZvoafIo2p6/EhzOMy2dSTi+4lz3YoDD1Yx
	DFrRI1cq5vcr9kDAwv7Yx/8Alm8zvdSctFcZJMCBPTwfdjbRUJlekCFu2rkpj8Iu3TOF2
X-Gm-Gg: AfdE7ckwrtMgBIkUfgFlH+Fvwt9ZZ0OjslsXYJ3djv/aQFFnEZvmsNZ9Du8zSMUxgOG
	Iwl67/qeHSJPlQvsyGO/agAD6R0sxUeEJyfLZ8t3jIvC+L8MoD3/Kw6tVrJHr1RRMYqVHv6vJNL
	C8JAQ0NFegBl0zZ3V7as92RzUF2FWBLBgtuBjNYITwdtjnowsVC22rQ2qnKJEL6HzF9xxXiRchb
	51kfPqlvPsj2jdaLGYoz8LU7SWhygdeQIrWFik8zs/G/uHXulbCaxLcyR1u2XbNLsHb/gaoM3fs
	IBYUgBNUTZWMZ9VW/GEe9rtGOlnIK7hWhJyst4CXdNDzv5S5kX/p6yI8hZkY4W1TeVALsODCk93
	KNyl6uXY1d45MAeeX9BIniOtkW3KRcj1Ne48=
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr97535826d6.1.1783677012135;
        Fri, 10 Jul 2026 02:50:12 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr97535656d6.1.1783677011733;
        Fri, 10 Jul 2026 02:50:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:50:10 -0700 (PDT)
Message-ID: <31905a48-54eb-4693-8725-71f065a8bc92@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:50:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AriQGtrmE2VE-lhgKR5ENsIzUk0yY-m_
X-Proofpoint-ORIG-GUID: AriQGtrmE2VE-lhgKR5ENsIzUk0yY-m_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX9p2HPASTSpuC
 RxwELncUWxnm8dyiw38Ah1e62tRxgzaayV9x0uPyXbOc3SxRtqj03fyRO1F/nk08y/GnJPbahgi
 XixCCjMDlZP2y6tuoQLy0gsJX7TdxiE=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50c055 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=HHMlELgPwHXHAMwrrFEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX9K3W9K2XDwU1
 t421e7nNTw6L4k2zS68PxRyei986JKY8ykoje5RaYXEuCm/UsND2vgQOGYwBsP1rjpID2jUzmKf
 RbC7qjzoDUY5yHZZfl1DFzDX+bcqugMpOAnoxJe3cEvbWl5fp6lM0dIZxPEX2TZz3nneTlb0EsY
 M28n378dkUUCHX0C320rDVRUmfdYFBEkPfVGV3lYrQdBvIMzllUEg49S3hajvYPdT++BvuZbs6k
 WXaCB2+mO3XTCW629qn9LC4YAZtDeHVy0kGLXKVRP929V1gbgeIiI6QRZ5pefK3WrAOPIutIE0Z
 tPQavcb8+nDnO7lOAV2jhJmSORDNjylKpTClyxNVSQnJCgQrvJqF99GJ5ZCN9HcJaEq6tuBS/eW
 fqk1pGn3EVS6h6I0+BbP5ndPYO/KOxYuf1gZ+5HfgtN4QJ0WAzgtDEGgfGQAjER5PtiF578nwIw
 aPJZ/PxyAch78Db7pQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118219-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 14E81739666

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
> the ATB sources within its subsystem (TPDMs and other ATB masters) and
> forwards the combined stream to the system-level Aggregator TNOC. It
> carries no ATID of its own, because the Aggregator TNOC downstream in the
> path already owns the ATID.
> 
> Switch the node to "qcom,coresight-tnoc" so it is described as the
> Aggregator TNOC it is and is assigned a system trace ID. Rename the node
> to "tn" and use the "apb_pclk" clock name as required by the Aggregator
> TNOC binding.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

