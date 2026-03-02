Return-Path: <linux-arm-msm+bounces-94778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMCNEwAGpWn9zAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 04:37:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 482691D2B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 04:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 157033008C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 03:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3C02D837C;
	Mon,  2 Mar 2026 03:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwBDcgwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AczxR5P5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE71E1E12
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 03:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772422639; cv=none; b=P8/ovEsbTzaaPkM6pxJ2icCKP4isJlMC8PnDr9pYMnp0i38I11+8SIF0mBFcmQZK/fG2C5CHl+8IAJenPO+pLIgWNdynAYWv1vOUQ9wjwqDlRep9S3j0JVvuuUJWKivf8soDBResM3/CJqNbNUteOo6NNkYPocVw0fxyJBCIZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772422639; c=relaxed/simple;
	bh=Km0XZppyhKFAYHU7tnd3Tat2vlNPO2+dozqCa1t8EHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI99tW1BNfQ/r7Rpq7Ajn0nD2rxGYgbBaog0LrpMZxQGlajHKe2LfQH0vEQyXORGF7L+0xJfvchRTaPJqueQ2njB7Dk7TdA1r/NgbRW7IGZsGM/ZS4pq+WkoqG9bYNr0bBXToYQreX3Gb7JbWE4SOht8D7AxFaBlULa2svZlDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwBDcgwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AczxR5P5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621MaHSS1952593
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 03:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B4GTjokSFJILP32w/FE5dmq7
	r/adkdlDF7ttrd2vI7Y=; b=KwBDcgwWtkSrfLiezy5PG7TsRicJt8JPTRsNzXxm
	WwOPiPs5ZMXDJlXMPpSPgKumbxCtEcmracbebzsgdqRfelOKe1idx8yaL3j719ly
	uoUDuDIu9KDM3bgz1t71sveVXKziNFGoEhe20wTiYRdhPM2IR1G/yUEDjJ0VQgFo
	7rlj/Og9Xi4oshwmeK4+4IjyduY4iFHPWyyznrFyZAUnJDx9XRyChoU7CyOQFg1y
	Vl/L9oMz7xd5kjN2IImDpcGgCn0lD9bUcPddFj5m7dFTvhyLxZFRtRGbZqDvTvfJ
	k+/Kdw3lKW9ovFRaqujlXLZ00O8DR+M1PFKjOb7UAeoLxA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkus4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:37:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f619264fso62442496d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 19:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772422635; x=1773027435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4GTjokSFJILP32w/FE5dmq7r/adkdlDF7ttrd2vI7Y=;
        b=AczxR5P57jBnuvD8Mh5zRuOglzacWPeM0qRIozKzUX1xDm6XVKlxzTjqKcys+5wv6N
         N3UBioZeP9mx61Tsx1dU3Y+bYPzarxvl1COld50DY4QTtLR3DJcyj+49czBaNVurdChm
         Qc3p+QuCRqLITQ2MoTC3Nh7XyTKSwYYnpx3lMmgBdJN6fQEV0ZAGH3PBaZtBVjG/1uNk
         0DwVP9WyCwcihO6cTj0VDRSTdwIrhOVdZih0wCpvE5cvCdzHyi33BP8lAqqtsdRfuMdM
         ArArvRwjLUyln0Alrlt3SZg1Bi6CfEUUKAHpFrYIRgr49TFiM7AWpixaZ0PneIvSsCnq
         jrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772422635; x=1773027435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4GTjokSFJILP32w/FE5dmq7r/adkdlDF7ttrd2vI7Y=;
        b=iOU+MBMb6FcV9EMVL+UQjW86DIbuD0npR+iOG85DqlY1a+sYujGQZARBWqPdBzJRIL
         i0AfP0VTj8n/FiwDMxwrv6aROlZhIihlHGMmqdHpQ+gfKPlYivhj0JrtKEqVOZmefWFI
         pd3jye+b6XtSqrrW79PgrwA+efc4ru+kRS02e/7qAKaNF7aFPZIQegIN1nKPWJoH79Sf
         FpZpW2WmwK4gkWUEI1QaGscUHXkCwtYZXdUZzt5JfiU4x4t4DlqfTc2tQA2nyzgtXZ1o
         +iYKHYUs3zLuKJxjjoZ2BpCIFYt8bc7Hn8UTU0mWlkb3aXpYIEP4UPg99t+U56xS6v8w
         YIzw==
X-Forwarded-Encrypted: i=1; AJvYcCXU+9RaUUYjeOOxEC2ClJOVxh9uSw0rvAj/MMwmjG2ZR4R78t34LKV9sjcy85vrpyIE5TjidsGy0ItRijiE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4m2H5oELYcv55pfAt8OnDIj99defpn9NN0G+W02GAwBrxF0jF
	Gu6qHQ7IqPrglLa8I3FKydWkwdzwmbdbmreBNo5m8njvKxqpaxlMN1qRVoA+fdhpFVPKDVQIQTw
	Lvlp89FL0WIQP8bV+4f/HNUa/Q9OswHd4Zau7+nNa6RpUNLlf1yqll5mWtjsXVq+HJca3
X-Gm-Gg: ATEYQzwuy+lY7PdqghDw9KTQglRHBRP/57ZInEel3ueitFuk1R/HYh1oTMtURdYzxP7
	rAkRL98j93/WAS4aKAr6X2tEKlFpkZN88IlDcGJ7vevE3ZVTh7K0P138Vin7AXzLAmdTkHH3JPg
	YuyI+va9J3gpTAS1bErnevkcwf4qgJF/GIIe2Ry3fLFhOcfdUHynBJfeWx6/cODPUGI9GZiEk3g
	rAkCmqOvq2IL60NB7XdupNnefMYZJhlLK9h0DDU5BHieMH6ezS9PIYh1fFgOts/unoucayRjyje
	2lBB4u9HyBM4FEG3gPQ89dZ07+9KHPcP4SC31iToVwnyOaOx5+mta5TxSyciRU803SWOvuux78/
	idpRrN9ziCVvM0QQACfnDJzZUZXg4NtGyeMrPY9lFpO+ez/1f48Snr+eUzLfJUYibnZhz+EFIeD
	8Pqwm4Yr7qGZLKQb4INjaTN5zqMVRgavpFdMM=
X-Received: by 2002:a05:620a:d85:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cbc8e1afe4mr1234203685a.67.1772422635310;
        Sun, 01 Mar 2026 19:37:15 -0800 (PST)
X-Received: by 2002:a05:620a:d85:b0:8cb:43a3:8b6f with SMTP id af79cd13be357-8cbc8e1afe4mr1234201885a.67.1772422634805;
        Sun, 01 Mar 2026 19:37:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd5a7csm1350913e87.37.2026.03.01.19.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 19:37:14 -0800 (PST)
Date: Mon, 2 Mar 2026 05:37:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-pm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4] arm64: dts: qcom: qcs8300-ride: Enable Bluetooth
 support
Message-ID: <muqlhuorantvzml5xx6vrsoe4ufxlwtd2yhyxnbyaye2c5iqwt@ucitw425ghtz>
References: <20260302024658.2836798-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302024658.2836798-1-wei.deng@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAyOSBTYWx0ZWRfX/VMZ3WsGLw6a
 Ys9UwREcFBV8c6tvv1FeBysjxgWKNvuCUhV0+wUysie4ncFblofqaB+gYqnltoI49EOwc3UNzHk
 E7fbKi21bhChHLlcSbnC2VvNL4P6FZiAxrp4gfs6fn5TOXgkdPm27lp1U3jq4N9xGHav8Y+PKWM
 Ri8Dj/8pRcTmflvTjQqBU9UR2qtJvlEBioMO/k0RcCK9GisY96fqLDEyc5tqmi74njmveayrUna
 OWOjS4Pprxqbmyx7xj/xTYEY9daA0JhPZGDmTi3NRLVpedTBG6u20pT5FdeKTLQZga16/3C0CZ5
 ECnP66LBgCbU9PKOd6oPtL0a2fWkakwuUjc9YCAfaU9A33iKJwsclS7yAM5/V8DlAvmXPgTG+2K
 LnaI2hsbfsw5A4zwHHgQpMrU33gnAuiUEsVqVtEH679IGj7pLZHHjjR3x8hztqZnSM17SjI625n
 TynUxhE45kPO27MLKag==
X-Proofpoint-ORIG-GUID: TvigCercGAqKIsd4CHmUkHKauGQGNW4X
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a505ec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dDEM-9S5bOE7Kyg1U10A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: TvigCercGAqKIsd4CHmUkHKauGQGNW4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020029
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94778-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 482691D2B63
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:16:58AM +0530, Wei Deng wrote:
> Enable BT on qcs8300-ride by adding a BT device tree node.
> 
> Since the platform uses the QCA6698 Bluetooth chip. While
> the QCA6698 shares the same IP core as the WCN6855, it has
> different RF components and RAM sizes, requiring new firmware
> files. Use the firmware-name property to specify the NVM and
> rampatch firmware to load.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

