Return-Path: <linux-arm-msm+bounces-93551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AiXRHEM/mmk6aAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 00:26:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B979216E38C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Feb 2026 00:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29C293013A8E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 23:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F23F286D73;
	Sat, 21 Feb 2026 23:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUBXOl+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeWwz8F+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078DC35957
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771716415; cv=none; b=jLaF25w9OSHbe2BaLud1wUXfZfz7ybXpSOkgICMdq/Wwt7h5yaiieQkZeiWVA8nPH/jvMkkPfO4zxU3zPWYYm06W6gtqHifDT9tof9naMX4ZboFoxhyixLHIJ9hx8SCPHddlGuUCcGtppx/q8T+2GxO35K8PvEkmS85X79tKyN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771716415; c=relaxed/simple;
	bh=rDe7YF/tR+7Ii08mtB9vhA6WdgxmSpQtv3gR6SzDfTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSrh9YZ9CdfdzCXWkkDRfONaeyrGpexAw5Q8hej1WqOwFkcxYs7MdZMLqkIUhZytIjr5esf9CYj0mycjHxT+wwACVt6978FM1EsffKkC4zVnTIKDOgt3KzAWuhvgB7wBqyWeJzTRWIztuMYbkIKIHXOAsHcz1gamQGokXGO6rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUBXOl+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeWwz8F+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61LNFJLK012011
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 23:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G0xQH78npZq9hBvhPuOfZ34cE2AhLVTkNfN8ncD330Y=; b=RUBXOl+hW+GaMTvw
	4UNuC6vK7FoEp6IYP8MqOXWSggFiQZPKCDBVdp/DmLhXQqKfzqpa8HyDItvfmi3E
	1COabzpo8qYph5st14TlDHA/3XeHSM33xk6BzXZIVzsscWv3eU+DvXLtvIEKebSJ
	Vj4qrT8Q1+1Gu1wsrMh95FYj7q4if5VHkXtvn1ZlhdGZpXTal+TTM5tHys0sudq2
	NWuzvQ8qfC+iwQ6t4Y3EI6JsPTMh7PbaYfblgrSH3Uobz5Uxd6eTCc7Iiscd2W6W
	JKLgQiNKZ1Lv1HMWOpuCZ3D31beuOpW96+NM/5ZX5lEFw1Hq46nSA060KQKgap7J
	5xxBPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgsf9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 23:26:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-821862cce23so2139877b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 15:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771716412; x=1772321212; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G0xQH78npZq9hBvhPuOfZ34cE2AhLVTkNfN8ncD330Y=;
        b=FeWwz8F+EPVV+oAhDsOCQjALKtKFmmfmhrY4kDZSZ5qKMrWHVm4RzqgsaTjeOXTmB4
         nx3h5iHpfc0ZY9xN2RYn2qHVPWrKTudVuN5g3AnvF7CFEJMHQB8dYA//pwdSkRbW2Ijm
         aCofuWIWXl6tfU+IStmm1Jxv/07xzLX1S5SD08/y5S+bB06+S61eXSpjFfP7kiEtZe0O
         1M49KD0Fgrq9kmK89yut/HDQpSXX21MLmPoy7laK5TtFizC114tJZUK0qq+KHkiVBge4
         IQ+ttH0XbTM4B7c3xZ7o6ZlarMDHvWByGCMxcN64aOnoknOODSu8L5HXXfHWr+MEEREV
         zsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771716412; x=1772321212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0xQH78npZq9hBvhPuOfZ34cE2AhLVTkNfN8ncD330Y=;
        b=FU/w62Eca2TgUeHSr5kCbGLW52G6u8UqcRT4j0inUx620FP5FDRKO0J51jfChIc8a+
         slkqhyNnLmZCs2DNC7/hUDnoFUjfk1bDAVO6Q8dqzva23+8GqryPgfO6hPbU0DR9U8EK
         Kdoxj1rrFyjEafOFryNp4CeX80CtkdbpeRTwM7I8wxGeBEsAS1W9m5Y9bW7LPyqreWA/
         LjB4VoOqi1zXnPtJhgqKyHWyPTQLOzXjMQTvq0Bbn8uRgkgjkzcelXGSJAst3XLc5vuS
         uXU89UVBTlhIV/50RT2ni5be3SEyHxDplRBR2LVT4Ya8VVjrvhtpUwG5DjgVtkOixOkD
         OrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4oH4fL/Quc9n+HD7/3XhQujznU15/LBELMat+9L+pyyb5Nxtb+zpGt9vXAdq5HQ2WNZaWxtIo7XSNtzqm@vger.kernel.org
X-Gm-Message-State: AOJu0YxFv1nl0m6UthCuTkhDh/uEbozidNlL/lz4b+x1SlfxFSrazdEE
	9eQ29yfypVoxMZSpG41KMscGCHlScvU2Ls0Gx/qeeeKLTlvjKb99yiSCIylU9NL5CIfcTB1YJmy
	5blI2Luv7aW0oTnRudOGgotCAlhorOcgoUXn0lidaOOTMQqSlg3xgK3B5TZrsW/DvEBns
X-Gm-Gg: AZuq6aKAHT/3L53Z5nVXAeizOKeWwPlH6cOR8bzwfVFKj5Q4sw6+e6WxoulokFMXXtT
	ocL2nqIMQ/MjdbVICtCzBIpjKsG4dM0vDFgj5/1lnpEBnIviRJKzLkSp356ss6fjjTfIEFaT4fk
	WFZAl08OmhOCN83PfcLJdgGUwN397bBcA12rh3OZCmw+ZmHNMPeCMZukmRqdg7mclqIIrdKKbkN
	zsQoDNBLgC0/lDZJOp3ZtKLwxwXQjDsrY1SmUHnsGZxoXGAY/o8LxRe6OFocnhG7UPwQGWNImHk
	iIW7FS4zw4edsEapby5ef6U6+kcZBoa61RhNT6rB9rc/KMTtKtivcFgFz5w7aI5UMUGBd7W5Sf3
	bbTTYPHT1yMxCJi25rZc/A6/KWOEeD0zyZZKxS1RBOUW3lDZwluZsKjm8qrYeOEe6nw1M6CmDdR
	8HAz44VR5rC/Gg6Ido4HFjiFYUJukkEuvvxzE/iYZaYw==
X-Received: by 2002:a05:6a20:94c9:b0:356:3b05:2955 with SMTP id adf61e73a8af0-39545f8a998mr2519374637.6.1771716412298;
        Sat, 21 Feb 2026 15:26:52 -0800 (PST)
X-Received: by 2002:a05:6a20:94c9:b0:356:3b05:2955 with SMTP id adf61e73a8af0-39545f8a998mr2519365637.6.1771716411861;
        Sat, 21 Feb 2026 15:26:51 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm3026303a12.24.2026.02.21.15.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:26:51 -0800 (PST)
Date: Sun, 22 Feb 2026 04:56:45 +0530
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
Message-ID: <aZo/NRg3IxdyKZ6I@hu-vishsain-blr.qualcomm.com>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
 <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <z3y6wb6irac2ef3f55roy66wzyufel4vannfbynoivzgl2cuob@um5eomgvt5uc>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDIzMCBTYWx0ZWRfX39ImHlwudx8+
 7039Pba5cCtP25rk3jd9a9oi57kIVrssWLkQHykJDWAxD1MzTv/CAPX5C9z0UTO9Pkh5NIsD46b
 HsbPRVt66v8bvsRFOWP3mGMrAT/YFDfPvm1MryuLds5rqmTXWHQxehgaKQ5DZrUfWYxVNNBioPT
 0V80mGRsn+BDAc0P2c4IDNHrfMbMKYZ2yYF8dNOq5O5jv4tslxwMDArBfIVoY9KRmaUp9lv0O4G
 fu0xlDB4JGSWbzzEVmi57TcXndhJCtaNlkGMq84uA14Wiz3kwD0/p9mKqSFE+NVZkUFOQdayClD
 toqqoct5MhpWjQba9gmWQcvQhSNw2oxE+H6g6QvnHPtD1kNqyLZd9F7l7vWJka8GkpcELLx9W0y
 D5uJPFAIp8ktTyR4qIdRjyMAOg2teHXYuWh66Qf/iXVI5jLssNI7fLRIl7UKR/ICaAUhXGCsk9I
 iMgB/K5IMzGNN/LG2Yg==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699a3f3d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QUAWeQNgsNsq4eKhOgwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: m-h2CDBevbGYWhnfIH_XCLwxetd5cQYK
X-Proofpoint-ORIG-GUID: m-h2CDBevbGYWhnfIH_XCLwxetd5cQYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-21_06,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602210230
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,f100000:email,hu-vishsain-blr.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93551-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B979216E38C
X-Rspamd-Action: no action

On Sun, Dec 28, 2025 at 05:49:30PM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 28, 2025 at 07:10:38PM +0530, Vishnu Saini wrote:
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
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
> >  2 files changed, 95 insertions(+)
> > 
> 
> > @@ -396,10 +456,39 @@ expander6: gpio@3e {
> >  	};
> >  };
> >  
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp0 {
> > +	pinctrl-0 = <&dp_hot_plug_det>;
> > +	pinctrl-names = "default";
> 
> Is there a single HPD? How does it work? What happens if either of
> connected displays sends a HPD pulse signal?

Yes, from the SoC’s point of view there is a single HPD.
LT8713SX aggregates multiple downstream HPDs from connected displays into one upstream HPD to soc.
When any display is connected, the bridge firmware notices that one downstream port changed state and
It aggregates a single HPD to soc. The SoC treats this as a DP interrupt and AUX transactions start.
 
> > +
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp0_out {
> > +	data-lanes = <0 1 2 3>;
> > +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> > +	remote-endpoint = <&lt8713sx_dp_in>;
> 
> Does the bridge use DP signalling or does it use USB-C signalling here?
> And even if it is DP signalling, it should be correctly described as
> it uses signals coming from the QMP PHY. See how it's done for laptops
> with DP-HDMI convertors.
Yes, the LT8713SX is using native DP signalling, not USB‑C DP Alt‑Mode.
The QMP DP PHY is already implicitly part of the mdss_dp0 pipeline,
similar to other Qualcomm platforms where external DP bridges are connected. Because of that, I intentionally modeled the connection as:
MDSS DP controller -> LT8713SX bridge
This keeps the DT consistent with existing Qualcomm DP bridge descriptions, where the PHY is not represented as a separate graph endpoint unless there is external lane muxing or alternative signalling paths.
If you feel strongly that the DT should explicitly model:
MDSS DP controller -> QMP DP PHY → LT8713SX bridge
I can update the graph accordingly. Otherwise, please let me know if documenting this more clearly in the binding or commit message would be sufficient.

> > +};
> > +
> > +&mdss_dp0_phy {
> > +	vdda-phy-supply = <&vreg_l5a>;
> > +	vdda-pll-supply = <&vreg_l4a>;
> > +
> > +	status = "okay";
> > +};
> > +
> >  &iris {
> >  	status = "okay";
> >  };
> >  
> > +&qup_i2c0_data_clk {
> > +	drive-strength = <2>;
> > +	bias-pull-up;
> > +};
> > +
> >  &qupv3_id_0 {
> >  	firmware-name = "qcom/qcs8300/qupv3fw.elf";
> >  	status = "okay";
> > diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > index e44fd5c33816..7f6c681fb1b4 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> > @@ -5117,6 +5117,12 @@ tlmm: pinctrl@f100000 {
> >  			#interrupt-cells = <2>;
> >  			wakeup-parent = <&pdc>;
> >  
> > +			dp_hot_plug_det: dp-hot-plug-det-state {
> > +				pins = "gpio94";
> > +				function = "edp0_hot";
> > +				bias-disable;
> > +			};
> > +
> >  			hs0_mi2s_active: hs0-mi2s-active-state {
> >  				pins = "gpio106", "gpio107", "gpio108", "gpio109";
> >  				function = "hs0_mi2s";
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

