Return-Path: <linux-arm-msm+bounces-96163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAkLKCyOrmnlFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:09:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB6235E68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A4203012230
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3494376479;
	Mon,  9 Mar 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gf0WTYOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcC+RXIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88821374E46
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047331; cv=none; b=D3yEDy7cyyTnGtLF0DnXWqWJflMG2GtOhwEiQCZtHKYEPUuKyPFO6MKunKmhV1qaqATzO0iyu/WIIj55ROgu7yES9oOzNyZLU115TFfCLXQ6wLF3s2erW+vVJQIfvfHV3DAblGK4AzQGLTM/U2yAMpQWvuIbi1EY7Ko8iOukIro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047331; c=relaxed/simple;
	bh=fPVEgHq4JKeg3MOf7UiuxJlPzIMXslEUcTAQgbVVTRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPuBU62Et7gJ4ZzyIJa/cof5ctljNQTY/a7nG4CNAhFglivSXtva3K6KqmZ5REDIvBWTX1O0aRCN2urJyg+da4g8JK8Jka6YgLXAotEGF5Gq8vgTP06xfiY62YoXIOHq4SiCr5gHLAwBjYrUNpZXLPpEKng32iu194533U1ReEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gf0WTYOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcC+RXIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298S8r93462862
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 09:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ATVHJyN8oUZVKPvfG5baXeatcuRBrY2sTyPMln5bmro=; b=Gf0WTYOobz+VIZ9E
	GZdYagAulQ2atta7oo2MajmEcVSGyucSmh//Gj+Flbcc4/k5pqrmDS+hxeO+0Kcg
	awPeGyDPulNO8FcMt3NMOUq8pQPHGZ/g8qvQ2rtY240c/JMHwy/6kk89XCU87ECk
	5qZBna0Uw/WXi14iaDruEjhch5CnAxDlSzH/PofDDJPzxjeRcj/QFVM3CGQccB+1
	mhLifOV2EVDTXAVbkCsVMjMSC7wrql5WzOl39TY4Tmf1o0iRuQNeCJ9jML8MC0qN
	rHuRxkWVP0Qwq9BjXb0oPylTSvZtPivCAsB1jwUYnSj/LwKgtMx2KuGFcTq6U0In
	NZyZ9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8ckw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 09:08:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso47498555ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047328; x=1773652128; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ATVHJyN8oUZVKPvfG5baXeatcuRBrY2sTyPMln5bmro=;
        b=gcC+RXIhPoTJZaifS0xEzXI7SBUtw8JHHwyLdrqW1P54Da4gkkqX8OzCwVHcSB3n2d
         lq+RIWpqinkzDTwxGQv1uNJpyC10ZFEmOReWHnrMzrv18e5SQ/MW/myHiQCG18rndYdM
         fL980C1UYZ36n3qCVoSS9DiHUZF73kUqOIDUzQkkalL0ItjpUr8le5/jAqcYLqi8sm7j
         MTZfH5O3B0zHDyc1pSaS9dIO8mKKniyp+yWeK6RqusKMcIyr0cpVbqqeOViO7+QTKgKP
         uWzkfec3aN33yreHZOfZeUaVmWXFmTCoH5JQgyeKSuvHqULPQEiHJPpIqKzr0NZQpeHL
         RO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047328; x=1773652128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATVHJyN8oUZVKPvfG5baXeatcuRBrY2sTyPMln5bmro=;
        b=r5lMjjwpicEtD3BnGTjaKa26FKT5YYPg9YZpGErUvJF5z0DMWeVwyO75CCi4tMeZ8/
         /G1gs9Ar8yukT1sOg6zZZu1FkfMa9iizrW+4Bq7snfrKszmr8aH9wVbfwWb4NM1djvVv
         J0JDm8WvguWkYJ4NjtLPlJeldUQRebemQapDiGvWB5brDnah0CyAWVN4Dy2CfPmoT8HS
         AqGdF9eK5QeHV+XvH/OX7jAIdnhI10QZMOIfgat1aCksmfWOK3iRa3MYEHCob1skWxnS
         CuGR/m0V3IjnP/bBZMNd7yqn6trVoZU32zIF2lUx92HfDPSojHXB1VEvyH/S+YE5mZMV
         KGOw==
X-Forwarded-Encrypted: i=1; AJvYcCVAmIQcrmiPM+Nk/3q6L5RDBkBuoOr/StfHcdWC7J1kWkmzgbowlmLnlyj3luLPXrvjoBVXW7ZVGzojoXQs@vger.kernel.org
X-Gm-Message-State: AOJu0YzucKHMTJL+kBHXCzN3l0DStN+xIYAigY8bXdEZRH0MgusAD2dJ
	oGPQ4OZHHBaQ58VLlBOBRaBaf4jGrEcilX9lstG5LMmiR/SjRHx8IdnJ8j1nh1/ACcMeOSTURi9
	2wX65sK+MyVI6bP1aijYgv8+f8dGh9fIbyvTPiDuTb3BlJWs8ouxnH2YZkCknbOl5/ocQ
X-Gm-Gg: ATEYQzy75eEUbEwUP/S75wd++PIQyvp+V8tTDDtpnIz00wQlOX9EACWWFGM1P/OANT3
	WOkzvoQK5TEo+GFitV8n8wvS9oGp9rHVIkYMUc4oqn53b/jGDovzXMTjviO7/E185jJYbUxLE6F
	OGGfWYjvv02Ih69gcoaDe27G73Hmqs9lNA52IGznDJ7K+UAqDBPgYEP+vJcOtT0oKglOjae2/Ru
	ZUSky5bWqxSjaDZ1IGmrsMCWYll4vp3seoaZ89on3PqCbvm3gqpz0Q9xa/MgZ9hW3GY0nyL6OtU
	HJ+TPjxXda8Pt21BwR+mG7KA1ZjA93jGnV8h5EJsovPK+Ek8rlsR7IvY0W64OMoZ47Mc/KC2xqn
	QIXJ0oo1sMeiL0tLD3IOlIXFYw+8Oz7cj8l+om3wjglMjBrDtT4Ou/dL81t0s+2XOm77TtyjYhk
	6KdrBudEHebdxlXG0/4br0c6yVoFQnhONgBe2fOBTyzw==
X-Received: by 2002:a17:902:e801:b0:297:f3a7:9305 with SMTP id d9443c01a7336-2ae824801c0mr80835375ad.6.1773047328391;
        Mon, 09 Mar 2026 02:08:48 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:297:f3a7:9305 with SMTP id d9443c01a7336-2ae824801c0mr80835175ad.6.1773047327903;
        Mon, 09 Mar 2026 02:08:47 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f7837bsm109166685ad.48.2026.03.09.02.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:08:47 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:38:41 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge
 with displayport
Message-ID: <aa6OGbZjT2SdTxJL@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
 <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
 <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
 <wvjfla4rk2qxzayloov6ofna73kl22nls2a6h5uzvap4kasfh2@nqvpdsassfcx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wvjfla4rk2qxzayloov6ofna73kl22nls2a6h5uzvap4kasfh2@nqvpdsassfcx>
X-Proofpoint-ORIG-GUID: 1R4M3PNbWZYHIeTdE7CgiKD0pKBRa-qW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NCBTYWx0ZWRfXwaZeh3d0dS8n
 EoWX3ecPJsb6CJYU7k7jyqR4CsgLOkBPt4iiqcdXXgA4TnJ7bHtvcfNZgM8Kut8aeyMeVjlr29C
 uAr2Q5kPZCQDJIGM5FFhF/kCOONOqFeiEByKeqCMcihm5wCks+baI5rud1K7H/7QnxWiAZs6sMv
 MbmsqT3ENmGT7ae1XZTwYiwTJaSPpnaA4YOlOPiHEO1kx/ODSWQrYM2oiiOuLGJ7O7cozrc37ih
 3urU12/l/z9htPWImtrjHKq3ycxmvaBHEd/ms9azBYxoOG74vpFvihz2rFX0hpiMXatO8eknT1n
 P1pmLdq+2E+ci4+uS0tW+tRGZFTCrJX4Ct8CKdSj1mM//uMcpC1G69Xx8TJNLxe9814yJG3AV2t
 NNTByyW2495oF1cKHAUWPF2UHnov1L6dBJT6ot46U3RsKcmNDKiuwhYyDHZeWWYIMZOe2XU1SDu
 cNaGUnZixFXEkOKJKvQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae8e21 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kx1GuS1i06gOX_RaChsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1R4M3PNbWZYHIeTdE7CgiKD0pKBRa-qW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090084
X-Rspamd-Queue-Id: 3DBB6235E68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,3e:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96163-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 09:16:54PM +0200, Dmitry Baryshkov wrote:
> On Sun, Feb 22, 2026 at 04:56:45AM +0530, Vishnu Saini wrote:
> > On Sun, Dec 28, 2025 at 05:49:30PM +0200, Dmitry Baryshkov wrote:
> > > On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
> > > > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > > > converter. Edp PHY from monaco soc is connected to lt8713sx
> > > > as input and output of lt8713sx is connected to 3 mini DP ports.
> > > > 
> > > > Two ports are available in mainboard and one port
> > > > is available on Mezz board.
> > > > 
> > > > lt8713sx is connected to soc over i2c0 and with reset gpio
> > > > connected to pin6 of ioexpander5.
> > > > 
> > > > Enable the edp nodes from monaco and enable lontium lt8713sx
> > > > bridge node.
> > > > 
> > > > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> > > >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> > > >  2 files changed, 95 insertions(+)
> > > > 
> > > 
> > > > @@ -396,10 +456,39 @@ expander6: gpio@3e {
> > > >  	};
> > > >  };
> > > >  
> > > > +&mdss {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&mdss_dp0 {
> > > > +	pinctrl-0 = <&dp_hot_plug_det>;
> > > > +	pinctrl-names = "default";
> > > 
> > > Is there a single HPD? How does it work? What happens if either of
> > > connected displays sends a HPD pulse signal?
> > 
> > Yes, from the SoC’s point of view there is a single HPD.
> > LT8713SX aggregates multiple downstream HPDs from connected displays into one upstream HPD to soc.
> > When any display is connected, the bridge firmware notices that one downstream port changed state and
> > It aggregates a single HPD to soc. The SoC treats this as a DP interrupt and AUX transactions start.
> 
> Are HPD Pulse IRQs also combined?
yes, HPD Pulse IRQs are also combined. The bridge behaviour is similar to DP MST dongles.
When any display is asserted, SOC will receive a short IRQ pulse and performs AUX/DPCD transactions
to determines SST/MST topology.

> >  
> > > > +
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&mdss_dp0_out {
> > > > +	data-lanes = <0 1 2 3>;
> > > > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > > > +	remote-endpoint = <&lt8713sx_dp_in>;
> > > 
> > > Does the bridge use DP signalling or does it use USB-C signalling here?
> > > And even if it is DP signalling, it should be correctly described as
> > > it uses signals coming from the QMP PHY. See how it's done for laptops
> > > with DP-HDMI convertors.
> > Yes, the LT8713SX is using native DP signalling, not USB‑C DP Alt‑Mode.
> > The QMP DP PHY is already implicitly part of the mdss_dp0 pipeline,
> > similar to other Qualcomm platforms where external DP bridges are connected. Because of that, I intentionally modeled the connection as:
> > MDSS DP controller -> LT8713SX bridge
> > This keeps the DT consistent with existing Qualcomm DP bridge descriptions, where the PHY is not represented as a separate graph endpoint unless there is external lane muxing or alternative signalling paths.
> > If you feel strongly that the DT should explicitly model:
> > MDSS DP controller -> QMP DP PHY → LT8713SX bridge
> > I can update the graph accordingly. Otherwise, please let me know if documenting this more clearly in the binding or commit message would be sufficient.
> 
> Please check how (and why) other boards handle the similar usecase of
> DP-to-HDMI bridges. To put it short, in your DT there is no notion that
> it is a native DP rather than USB-C signalling.

Sorry i couldn't find any good reference for DP-HDMI bridges to check signaling. I checked these
DP-HDMI bridges PS175, PS176, PS186, PS195, PS196, RTD2171, RTD2142, TI DP159, VM5200 but none of them 
wire DT graph endpoints, Please let me know if there are any specific DP-HDMI bridge you are referring to.

I looked for other references where USB‑C signaling is used, in those case the datapath always involves a
USB‑C controller/Type‑C mux/switch explicitly represented in the DT.
For native DP signaling, the common pattern is that the DP controller output is wired directly to a
DP connector/bridge, without any UCB‑C components in the path.


> > 
> > > > +};
> > > > +
> > > > +&mdss_dp0_phy {
> > > > +	vdda-phy-supply = <&vreg_l5a>;
> > > > +	vdda-pll-supply = <&vreg_l4a>;
> > > > +
> > > > +	status = "okay";
> > > > +};
> > > > +
> 
> -- 
> With best wishes
> Dmitry

