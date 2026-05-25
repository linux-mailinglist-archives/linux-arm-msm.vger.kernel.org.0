Return-Path: <linux-arm-msm+bounces-109640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNfGA+wvFGqUKgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:18:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954A5C9DB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF57130463B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10F937E2FE;
	Mon, 25 May 2026 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5Gfb5//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IB2Xj8pg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2D3112AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707635; cv=none; b=QvurNbO8OL+sCNYxSXIRS7pm36DegMXML89gsRcCK6bC7y6C+Gw8EEJWNDPkkBNYnaEINx4Z/UQqYvG+q/hlpRK2l6FvfivVx3JzMUK7rrCyZM2GY2BLq3KuuUsP2p2+7+Eap9FtzqfaPMtbZnI+o6HNZ0MHgMz+yM01malfQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707635; c=relaxed/simple;
	bh=FSL4P7O0X1xNtnH7ooNyT/DRDEXy9s/ZlSMFqEbPEDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gE5T4P72jtGxGC/AJ8Em/27YP7bxwuqyJu6odAYc6JO87WoGCwdFPDpmvgXZ+Vq4u+F7g6rQK/2RsJzD6zzRTShnwlOjgsVqR0zOwT6KoWRjVxTtraiunJOfYOcUlrCgA4QevtZtxg1rmN0hXuIN/EziuV8+7BIZMEiKtp993vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5Gfb5//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IB2Xj8pg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7J6mj2222127
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1c/8HKj+BHzZE5YaarXghzDZ
	Q9RCYcyLQSuiliCSSg8=; b=i5Gfb5//OFq2kUm54IF3leCGsAoRElFaOmqzTqHE
	4LdtnZmd/ImQSr30gS/SNbn+Dp/cUywi/+Mf7K1rMAcXzU1A7HLlx5cIpHhLn9pC
	JxGVl5a5sMslXTuiuyjFswNF1MZkMPGekUGZ+1QV+e1CtTprcBICJyMDHB29wlFV
	ZJUyLUt6oS1tVc6U5N7svrc/Aly3z8dgck8ZM7OR4t98HW9rAWStQsJrBGby+qog
	XimCGYGLkeFSXEg/Tk5FoqKe2If2mthXyPGkHsDv2DULtWBp1YThMgS3n3DijFHU
	Uyrhsq6iuadSl0OqK4daKp4OPCxaFv2BvA/dRaq7Er6cFA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7pcmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 11:13:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d6cf547bso68976341cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707632; x=1780312432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
        b=IB2Xj8pgYT2kWJYtAg9x9PfdUcQC0MiUOU9FrVT3nflY5KH5sLdyP3A3NXZKVZKQBj
         PmHK5NSBnYsM4Hr34YnfjoiI6ENlLfMN0tQMGDL1DZXOB9TJ0qUvMy+5TjVorg6smd1n
         LiYn1V4Wr1ERsw/vQhyAByiXcasNfitt3K6OelObHwAkezHlfzvBJF466HlIFa1O8PbS
         UH1BK6+N3ig+8GGx4BFBrJHLZ9UPDC6Mdzp4vzqMUG78Y7UhtQ5g5y4NriccwPAi9+CT
         GlZzAqpztRZ6kuofDvw7U41KVqvE0ZqlyJMBwdabbf322iDQ1x0y5ISF4cG+DRTTEZcV
         X8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707632; x=1780312432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
        b=rF9bDb8NcgdlMR88D7Rn42nZ4/o3mBwd5DRW0UuHkQHbw+coCTaPocc22OYfAKHsRe
         mWAxYTFecSUfsaPjTWHiXjBEB1PPCmh9EtbZgh4UZSJOYxsTtBQoBNLerM/kDTsaCtI8
         sxBebuyPnvCrhTkoaz09Y+wLE68nyAnsJ8xHotutC+2GghtSLvRU8yrjusj/JZZUZdy7
         6vE9oDIYVr8MZaUAM/3OzU4ZxN/iGXHfKnGB+PzqET7+8rdH8bER7qHj6479a+Kix1rh
         89CTgCmw1c6JT7siq14iojDk6ZQnxbGc6bSFIXmrpEYZ8n1hfyX9rz3toovqwXsAd/8W
         SUIg==
X-Forwarded-Encrypted: i=1; AFNElJ/DKxwn5oTS4NWkCxi4cV6/HOjEJ6o9Ou69TQYaNplfIVvnQksqbL4E9hW3HakRO7KOvScEFq6UdbbJO+KL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbth8zk1Kw30yMh7UqPJpGctw3yCblpSpul/x1FxP6zgCb/4pW
	lwaBYwfmLoYwcH6+zQFB2KB7HuXEbnlFFchvC4ZUEK2pX3BoTODTSxnBbgwDLbi1guyzmUb/EcO
	7wy7JS/pF8VMXoZ1TxcEbAY6ixH16boBPWK63Zw6slaLmjDkYvxKCWNRFvfP2zJ1x+ZsN
X-Gm-Gg: Acq92OHdWfIJVWtu2P5noIIrOEafpsMcVssfbmBZ0MqC7+7IXqdzUuoxWcNmozFJIiO
	KrgoKtKsXWu+5XsjdgVJkHkwFtU+rGHxIDtH+7gwduuHO3cGMGYWnU023vdpGW4xlikMMNDjaki
	bAx/wS+eRF+VcrucxonoLqowiMJcEQET1gezle/O5fkn1KwOqOpRDB5xENciYmamL3Iyd5dqRUc
	PTiWqo9EfmFjyzzgd83Rf5PCCMH9F1zhMCu6meEohzlrumzqBRxbcGYzaKmmZrl3rE7EUPdHpHV
	DUZpTiX4Am8fS9ubPIAbvYqjLGlc6ss1S859PIz38ZPRXqxPrinw09py3QsTOS0HgMVq9iyTTdQ
	PU6mJvWtiPtIijuHLVhCpsZBJ5sQfv5pHw/wptpRLvb3lq5WfE1K0VXhzKI6muZDkIhBAYsyuZD
	Kvq7oZ2iraVyV4rDb+uMFss5mVzGuS34EQx9s=
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id d75a77b69052e-516d4b14c3amr180285731cf.2.1779707632295;
        Mon, 25 May 2026 04:13:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id d75a77b69052e-516d4b14c3amr180285331cf.2.1779707631854;
        Mon, 25 May 2026 04:13:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7853esm22973391fa.14.2026.05.25.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:13:50 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Message-ID: <u42lv62h7ps35zwqzxxmk727rmnd4ql4zmhb65q4bkjfwhi4f2@ihis7lc7zm62>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-GUID: WuZmtMmDsAHFnSa2bJGkKIwxsZS1conC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX0e6jSJe7jlrD
 IxBK8rgb9BE3zrGG6kLLNY6zRxH+AuwCbst43Q5BhoVnmPPZl8FtjT+liKTCeVICXIiA0I3AfzF
 i1DpAvZ4QJH4cMXrUnEKyhOJ0COyLBBiv5uX9eufSEjDJccDTQB8SYMX5GJm68DwAN5WEk8eg6T
 g4gJmOci0uRyPMBCz4kIzUjntvUz4RprdTPtF9s4C6M/eZTZ4N6EbcarSnmCwrN/Uu9RWH68zFV
 Cb5SfW9JOuhoCNPHcQDaKK6+x0NQOJoipDwTOTRNPglEaOGEUS+Z/c5ueridBeRX+ydE7rOgr3W
 I3+7TXmQvB3GV75rTV6IDEcCDvK/Z1C8Bwro+qrM24TOCVy1X/tgRs29YjGXsdjSzU8WfUku4FB
 Lj6AyKqNwWVR6ENo1K3yeFbf1TvaylA6dmhdE/0D+ITVTiRwhRTSax0rYeVvPGsmSWUCSx8h/dN
 GYNq61YIyg/61y166aw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a142ef0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=h40nfcmH4B8cT1TSTS0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WuZmtMmDsAHFnSa2bJGkKIwxsZS1conC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250115
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109640-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com,oss.qualcomm.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7954A5C9DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 04:16:09PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

