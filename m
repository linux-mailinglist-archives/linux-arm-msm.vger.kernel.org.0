Return-Path: <linux-arm-msm+bounces-98194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKeGGWdiuWlsCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:17:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 076102ABA2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF47F305F92E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 14:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05BA3E2743;
	Tue, 17 Mar 2026 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pw30oC6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I54j2MOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0B23E1D0E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756619; cv=none; b=XNWgBofOB0vq/tsWFagvkBbXqixsFwk7azciid5qKTYA7gu97UANZEN+dfAyaV2E9r+eejjOg8abS68PtIXXBcEbtLwrGYTM4aLZ3RZBQDHIjU+JjcVJSpypqmfEsqnt0vVYsySWOay5PwJ8AU7+sXNR+UqGjtG89StdbgFAGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756619; c=relaxed/simple;
	bh=X1Zbz+sEXU6c+/0lCIpKvPzLbkm8HzvkrrdgWdXOF3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlhyOydHXiJegVGoAq3FBjSUIp1D7N4T3xPSCsMWokPCDK/mqJeVyfW6FSVoa2yUfZt3OjSVzsAApaOd+mnj7o/2CtS1p5dAkYFAqIWD/l2gsmOrkyrEycb1GjVL0HdBXsWLuoQdXWD2oGgU4nmVbhbO0zgQnjKzmIyx+JZvo1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pw30oC6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I54j2MOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBlp8l1026285
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qm2Jw4oJG2l1RShStElAyz0+
	zTZdhOV1PGtvykJsfig=; b=Pw30oC6ET/PJTZFWO1LtlaHUumkQhaQ/32oKxBrN
	tHOWMd9DECJ0qMBUBdF509GtJvLX3KybTHUSv3IY6ixrz7nb5dYZEKGWKi+kipS+
	g9oyw8LWLnsJVislDyHGxxY5uK/vCLlTNMXlX6guoITBDdy3EsyCbEm523yN385v
	4fpMSG0KJNmT3kvrvMZxBWfM+BpYyq1p4c+Lmp3dM10FWHyYRZ0RBL1M62YPeqIi
	ks4eTmLsXqLRNCw5Lnqj+8tRz251XRd9GqgOTJJs5ue07kNKuha7AEFhJDXkw/Ge
	Dme4Jf+5c4PXTRVGy74y7fhafb3G1wS+/xpFD+86x2VaTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6gfh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 14:10:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso31731475ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756617; x=1774361417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qm2Jw4oJG2l1RShStElAyz0+zTZdhOV1PGtvykJsfig=;
        b=I54j2MOB1nuzBi+OV7jLhUqtB+ovi1P11e0u7uXP45kfSY/d4XZFpGqHsldIzd1SCz
         iHGOf6pXV0VEXhO8HKxLB432pkn9h8/5w+gV4Fva+4NkMLsVnOWPaPvvZRd5gU/dCmfy
         w/l7JEIjNUzbSZqAEvqFy8jv4xZMFi7RjWb7/hfEtWayfWgiMAIjRqkc+3CIs/ygBEzI
         EvnJmrLSEtpqgHr3xd9ve8t1S/MQEm/LAtyvypF9c/hHuaWtk2i8462fm/WwokYtQkGT
         ZAnAK1rtdQOfBuo316FJCIINlOY571tanvmR+XQc+NyBL5kXLUAnNxZffxigs1TVCCfj
         bDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756617; x=1774361417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qm2Jw4oJG2l1RShStElAyz0+zTZdhOV1PGtvykJsfig=;
        b=oe2VElP1xtpRP1zK8ZCNEEDnfZIugl9EEbiU9cBamxuXJedlKo/QSL0tu4W2Fcotnr
         L0/01tqkX8gTvA+if0EKZE2VXEYpaeNty+6m0QtlS8+5iiEZPi4cvrPDyMelae2+0oe0
         2RnmAC2H+V7y6O3UPqKifsMNhyOG1RpveWK3oJFxwyiIkS3gs0shSNVZJGxXaeaNeU2D
         MznAtyI4ESiTfa5/EpsQwHL6brAq6v3fuFvHuOF0kqOKOlVMzE0gjTjj9PPbjyr7+eGP
         kbpXWF+IU5XU8iLqutoXGYuc2uUUvpSXcpYc2r9uRwoc3sSkmol7Tlllr1B2OaCxu/f8
         4ZdA==
X-Forwarded-Encrypted: i=1; AJvYcCXQPw7vjjHmbkW39CDB9ShqCUoV/HIa7dty37dLDGRiG6E+IZSclo3WCLag0ZnykVv1IIm4naDtuQX+5suk@vger.kernel.org
X-Gm-Message-State: AOJu0YxEEM21JN7/2C7tfZjnK0AexmyZrUMRAk1uP4LTehPVzfhLnfqD
	AoaqOU49cd4ntkt9QcBXKL7mc8NEE9z+VfkfBAyLF2h71d8wEoEZnsor5lGcq0rQZ7lO++lgdqz
	S1R6wcgG1m1qJVWNpAAbwMqiphGw9XQeNdfk6tfgB4oZPxOvsoGdGwIS2KclKwIflhOiB
X-Gm-Gg: ATEYQzybHZ3f/jJnyxtDvwEVM1u2hHZcj3QPwQiy86olnuHmvKNmwCSQYbdDAfafhAL
	tXYccciXf4TUjN+Q63+UgdkHhJ3ocLrtIUUfzJ/Zs3sMn1XSrLk5zGiS5XIKu86njI0KKgOdh0N
	zEqM7VHX1xyvRSBLDP/DxLucUug+y7wFNKOGLFCIYH13qYXDiZgliin+83WBc/crX6QFE/5sS6W
	d7Pn+2iFSrRk9ezaC+YpdQmfXbr0KrrNGhH7BptVEKJkIYkUIhMlU/z11Tq6WWhozZToV/xNsHS
	PxVknETnDLB7IHuyNDlud7gX7O24efka8UQHIA2qGpj1iRffnwd6TuloArzV/Hts7zQBvBa+gZp
	m2PNGkEko2AGxck6BmIRtWHNLa+7KXM7npJsx4DqUzIp/UWin/Xyb6zrPSsOMJwDIGsAJurGq7I
	m6qJV7JrRrgwZV9qojLbZ9YV+3GfS76BhqnOdvjSKUGw==
X-Received: by 2002:a17:902:d549:b0:2b0:6a3f:7003 with SMTP id d9443c01a7336-2b06a3f71b8mr9209835ad.0.1773756616827;
        Tue, 17 Mar 2026 07:10:16 -0700 (PDT)
X-Received: by 2002:a17:902:d549:b0:2b0:6a3f:7003 with SMTP id d9443c01a7336-2b06a3f71b8mr9209505ad.0.1773756616157;
        Tue, 17 Mar 2026 07:10:16 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8453cdsm136752165ad.84.2026.03.17.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:10:15 -0700 (PDT)
Date: Tue, 17 Mar 2026 19:40:09 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Message-ID: <ablgwa53EVBD9HIO@hu-vishsain-blr.qualcomm.com>
References: <20260317-lt8713sx_dt_for_next-v1-0-8195fa931ff1@oss.qualcomm.com>
 <20260317-lt8713sx_dt_for_next-v1-1-8195fa931ff1@oss.qualcomm.com>
 <617cc5dd-9012-407c-8579-2c08fc629047@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <617cc5dd-9012-407c-8579-2c08fc629047@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNSBTYWx0ZWRfX9u/yercCzWlk
 FpjbSsT6begeBQYtQkChuvlQPFXiv0jFl/TjMFlzPPth6RqTZqyTSIdak3XNg+xHl3vksHzKW8m
 FutSHWqphjtgUMcsVPrONTS0p2aKUpSzWOjAgdv3JeR6WDVS4n2VOq6wiuWOt88gBbKdcdMR3HR
 TG9lfEzwfagAHUsXThjY8QictbkB5XikXvULSql8gOYIialGL+mW4rtQXQE1kp0ii7VtlBAb8zJ
 U1qiAaO5Of2pJLeB8S4wGMOb6R5paMN1gVSEZuq2cqGDcRlrR29VWrGxP/LOsz2f9ATH3FI+he8
 4j595AJ+9i7AtCujz1o5uxFTJMKUUSbW7uWjNi/n1OgmuwHxmD6DbDi1l5qyGRzpJnfEUim92+W
 lDQrGXen/TOvjrqEz3GkKiZ9ld2/YnxBN9ayJSgNQkt1oYMuR8X0rpHvhjopI6eMs2ZpMFCV+/0
 JBe97FesJbr1dsUIL8g==
X-Proofpoint-GUID: a8hOaGkooOAb0mAKvZrthMbBgnKtfcRo
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b960c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U0Tr2J7SxeM8VPz3M-MA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: a8hOaGkooOAb0mAKvZrthMbBgnKtfcRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170125
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,hu-vishsain-blr.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 076102ABA2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:42:24PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2026 07:03, Vishnu Saini wrote:
> > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > converter. Edp PHY from monaco soc is connected to lt8713sx
> > as input and output of lt8713sx is connected to 3 mini DP ports.
> > 
> > Two ports are available in mainboard and one port
> > is available on Mezz board.
> > 
> > lt8713sx is connected to soc over i2c0 and with reset gpio
> > connected to pin6 of ioexpander5.
> > 
> > Enable the edp nodes from monaco and enable lontium lt8713sx
> > bridge node.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> How v1 could be reviewed already? v1 is the first posting.
This series was reviewed previously, https://lore.kernel.org/all/20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com/
Maintainer asked to submit a new series once dependent patches are merged.
> 
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> >  2 files changed, 95 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > index 0b26cc334a69..0ca5615c996d 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> > @@ -52,6 +52,30 @@ dmic: audio-codec-0 {
> >  		num-channels = <1>;
> >  	};
> >  
> > +	dp-connector0 {
> 
> dp-connector-0
> 
> > +		compatible = "dp-connector";
> > +		label = "DP";
> > +		type = "mini";
> > +
> > +		port {
> > +			dp0_connector_in: endpoint {
> > +				remote-endpoint = <&lt8713sx_dp0_out>;
> > +			};
> > +		};
> > +	};
> > +
> > +	dp-connector1 {
> 
> 
> dp-connector-1
> 
> > +		compatible = "dp-connector";
> > +		label = "DP";
> > +		type = "mini";
> > +
> > +		port {
> > +			dp1_connector_in: endpoint {
> > +				remote-endpoint = <&lt8713sx_dp1_out>;
> > +			};
> > +		};
> > +	};
> > +
> >  	max98357a: audio-codec-1 {
> 
> And here you have example. Write code consistent with the rest.
>
> 
> Best regards,
> Krzysztof

