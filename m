Return-Path: <linux-arm-msm+bounces-114608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bgqCrgYPmo5/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 08:14:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 707146CA946
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 08:14:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jc4YnbZj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NEh5XjFi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 322FC303C4EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 06:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073113D348C;
	Fri, 26 Jun 2026 06:13:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C673D3329
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 06:13:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454434; cv=none; b=cbBVO9IIZgJZr2+WeZixgtKZtcyqpIg8b7l3Iv95eO0Dhj0cSFW5J55B9G49xmBD6QVVECobdwHyU9fGvxDZkTpUum51/U1mp8zayUYiAs4jvOPOlTFUFEaRo4rdlsYUGratm5581fxkdj0HPSfTldhdb0qjtL9gTe7uQzNj8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454434; c=relaxed/simple;
	bh=ptQk8L8RA2taHR7/ACa9KdK3UZh3scbqr6ODN/ehC7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYDPkB+4YGKvE71Wf4JDhKjm9K0qi2joZJUcpfl7pe8UU17Ht0igTe2kf5wNekgbjsoz4dQncKjjI2FFgxMZpV9+78MvVvsSdMw6uFJRztmGayijoCX0OoYYirzkEPq20tLKYj+Tmf6t2zdX6ZqWxyDSO4j6FObdWTPvfvLgpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc4YnbZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEh5XjFi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2irkl2313136
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 06:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5oaO6nlU8yDgoxuX+c2jtK0nD634i/BWQxbqSO1tKcc=; b=jc4YnbZjP2CjuRnd
	0UoHCGpJlm++bQFF+SQmmGbcHMPgeIeHbhh+cFhoSBoD6dZp3ZzO4VM/ZvPjPANq
	uW43i8pdk05Mb3G9+RlRiahKEc7x3zIeGmYGZD3d9DcH9czuuL3cEpHJ8fzr8y00
	m5Kogkqszc9YaAEW/ri59D8ZqtyPHRkq3n45D46jBrRhzlkRwOM9V79k7lTIBCxG
	lfkkBZgzgnBRRzZtO7ePF6n5rTe7equ2vdlRrA7OjYQUO0T44MGarAu3rWVkSsva
	5qILNaE3RdQPP7UEGp20uQIgG20BmkBhIYnW7+KIdFrSjl3AmmWfcXLOul95Q8AS
	AO4heA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f19m3tcc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 06:13:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca1f74cacso163188eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 23:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782454432; x=1783059232; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5oaO6nlU8yDgoxuX+c2jtK0nD634i/BWQxbqSO1tKcc=;
        b=NEh5XjFi56xfEkRFcSFKwyNbNDHd38c7Nu6OXnm2YOtfzR+05yffUWJVf72xN4QWfi
         JORYoWoY4mi53rPg9NbC35xxxu0VKYHEDnIPq7Xm5YgmHaNRdQ0rVLoK2eMdc+CYlPeG
         W6Y1AxPbbH+KO8YAk9g6c18pyCdlaJm1kyLOZWI73mH+G0J1m8P5OvciSjP9akx3Tlzi
         lb5KcWfdQtUiwUSey0XKCsrM8SrvI2/G3dpzXBO3Dflq/j6cpmM7T0dc0L8etA1cFXQ3
         2n/BLJoELI4JEm+hN9id8yFLKH7Hycm5rz3+7W3Yad2w3dfABwrsF4a8pgZ3bqJ0m8DL
         QsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454432; x=1783059232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oaO6nlU8yDgoxuX+c2jtK0nD634i/BWQxbqSO1tKcc=;
        b=dGybwWtgKLGMvXFCnQAQg4h6682FmhQxuCzAb2GSBn07SWzEy5i5hsHamBkW42etKy
         mzafWWDhwyLr808b1l5fte8+SLTRKpghloE8VfuJ7XedfaDZp1vKm55Vzp4myNm8RTrs
         xhqrip2w9ZDTs8HmlJpUhHhsnxzj1qGb4Nd4uVuBdeouPAF6H1SPmfDEe1Je5m65WpEb
         Aueabid2JMubrdBwOqOI1vNxxsYnFJrJDfazZDJT25gtWT+WANcAIEnQCH3pkc8npeD9
         tGmrRPbfd+vmI6dBXbZZSCzoQVc6GgtVYZJG4a8Ex+ggH8s+D3uwNDen9MkL8n6u46vq
         Xp1g==
X-Forwarded-Encrypted: i=1; AHgh+RrlWJsq/IW+SvmzP+Ga7I6ukBVBU/NNQZ9fuSppJTJmA4sLkVhwHbFmX8bT6Ys4toFaCJ+nP+nzbkxLJNWm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu5OYA3/QyycUebQr6Azg6AKJgOkcAb4yLsTTuC8J7x4KJ+YeC
	foqV2EmYh6ODuBd7ExIdJ8LkpjSAcRN+C+1csYl81YpvoxOhMrkYmQUqI0QBqArCksQcYdkHp2C
	sJDH7PrDVPEr1Sw+9FXakXv9D+d0EnU8NPgWzc0aZPy2GLChWbap7QIg96DpGmOxgX1hQ
X-Gm-Gg: AfdE7cmLi0eK1kt7mW2tqHqTEPy4Qc9peQKhQXyU3MDy4tPtLVDb4XOobOSDoqAif1z
	0ODtSPoy6pyS7BPum4IIJGhr44RRIT7rAjcBGSxo6pn20hREU0m9SP9LhhSz4eSrnZqh/tx469g
	IP6nem/KSWunCEjeTggQa0sI/VyscEf1yS/skTVomSuhyMFIHl0FX/J/nUVOtCPYrttEbfN4elX
	Suj8qPHagyrfQK8B4f79cDXXQJW26p+50iG6H6J9r27g1T0znJmOd02aQRVXapYFYy+G0ZYfR7m
	rWap09Nsi5u23/BbbuVMfPWcdlZB6D7EGDLZyqNxbtyf0WrvA1h9FLzETUVFIZjx0baQwr13TDo
	S/JTfslYytuEjAkGMADph/yF9
X-Received: by 2002:a05:7300:1488:b0:30b:ff0d:1efa with SMTP id 5a478bee46e88-30c84d9b4c8mr4532525eec.24.1782454432178;
        Thu, 25 Jun 2026 23:13:52 -0700 (PDT)
X-Received: by 2002:a05:7300:1488:b0:30b:ff0d:1efa with SMTP id 5a478bee46e88-30c84d9b4c8mr4532498eec.24.1782454431566;
        Thu, 25 Jun 2026 23:13:51 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9c456cf5sm3782007eec.2.2026.06.25.23.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:51 -0700 (PDT)
Date: Fri, 26 Jun 2026 11:43:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] Additional regulator support for the Qualcomm SGMII
 SerDes PHY
Message-ID: <aj4YlxJDvIsaJF1R@oss.qualcomm.com>
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <CAFEp6-3De6r3XwSmnKpMSSf8KK3K-esDAhTRKN41Bng-Yf8dXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3De6r3XwSmnKpMSSf8KK3K-esDAhTRKN41Bng-Yf8dXg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0NyBTYWx0ZWRfX12zIhieYD2op
 tFYz5NcYfuIPCTkZE5hn0Ge1M+cvhBwtwrbu4lhcwe/Rwud2b2eDqIFCOAlQlDYVXWCIyczi4Zx
 OMrE2WD4raLCAsbP8p5VrivzOVz7D08=
X-Proofpoint-GUID: 16bAR2eyH3DHe2i5PyIzf9UD3pCiX8GY
X-Proofpoint-ORIG-GUID: 16bAR2eyH3DHe2i5PyIzf9UD3pCiX8GY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0NyBTYWx0ZWRfX+qPy215ekqx7
 mm46kbat8D5xuy4f/qw5Wg4WjIV34BKHavZJ+Wzwle/yXic0HhbtfRDgXorux2JmDN4YqLNqv31
 v7i2Xv2c+vgdfgDx9ilYmcu6Afsieq7Lyv3rxlrkRwiPikoOmkvQRdBRMNNU4GmRVmYrRXA3eZs
 RAeKwu+mt5GDPYQuH//w5a3o6PNffI4doHQJKpsD3bQCOdjqkJXSwMVEXzRM+EJqk/nI0U6uSEF
 hyc/Ap4G58+23GaAIwR0ZHpG5Em7zV6annmeWrXqGqi6L7bo5jPgcE7zAVeORk08ksoAjGcg7Sn
 nAHJEXLUidjOPkkQKoW4B9Lx4qcg34FAOaPK7E2D/22b0eS+6eTJU3iPxKNrWpizhoejYB1uv7W
 8ipWWprypHq+oFvdeN5BT1nwuP/1LbHp2kAilsv8fAc7m7R9PxZ62HHAWFgPsPNY1/OOVNH9LcK
 yyKZ8+RuDM7uUGd1H9w==
X-Authority-Analysis: v=2.4 cv=Vv0Txe2n c=1 sm=1 tr=0 ts=6a3e18a0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=evnvvmh2EKmFMqWf2KwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260047
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
	TAGGED_FROM(0.00)[bounces-114608-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bartosz.golaszewski@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:wasim.nazir@oss.qualcomm.com,m:quic_mohdayaa@quicinc.com,m:quic_yijiyang@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 707146CA946

On Mon, Jun 22, 2026 at 04:08:55PM +0200, Loic Poulain wrote:
> Hi,
> 
> On Mon, Nov 24, 2025 at 10:26 AM Mohd Ayaan Anwar
> <mohd.anwar@oss.qualcomm.com> wrote:
> >
> > This patch series addresses a SerDes power-up failure observed on the
> > QCS8300 Ride board using the phy-qcom-sgmii-eth driver. The issue occurs
> > because the SerDes PHY requires both L5A and L4A regulators to be
> > enabled during initialization. If either one of them is disabled, the
> > status register does not reset, and the Ethernet interface fails to come
> > up due to a timeout:
> >
> > [   77.105651] qcom-dwmac-sgmii-phy 8909000.phy: QSERDES_COM_C_READY_STATUS timed-out
> > [   77.113447] qcom-ethqos 23040000.ethernet eth0: __stmmac_open: Serdes powerup failed
> >
> > Presumably, the issue is not seen on all users of this PHY because both
> > regulators are often shared with other peripherals. However, the power
> > rail schematics for boards using this SerDes PHY show that it is
> > supplied by both L5A (1.2V) and L4A (0.9V) regulators.
> >
> > This series has been tested on the QCS8300 Ride board, and the reported
> > issue was resolved. All Monaco and Lemans derivative boards require this
> > new configuration as they use the same SerDes PHY.
> >
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> This appears to be a real issue, but I haven’t seen a new version of
> the series or any response to the feedback so far. Could you please
> follow up on this?
> 

I will shortly send out a v2. I got access to more details about the
hardware, and it has two dedicated regulators which need to be enabled.
The same requirements are there on all Lemans/Monaco-based boards.

	Ayaan

