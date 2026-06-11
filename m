Return-Path: <linux-arm-msm+bounces-112801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GSJ0N48QK2pT2AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 21:46:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85F674D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 21:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NsgxwsD3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ChWt09wZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112801-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112801-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5305F324CFA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 19:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D9E379ED4;
	Thu, 11 Jun 2026 19:45:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329043783AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:45:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207105; cv=none; b=tECtwRJqxDAxeYb46ox2kn57UwbENjiqWLMpMp+odL3nuI2ioQrN+FfzSY/UAaXoayYrBSDzGMLukoah7YezIUpJUT5zBrUJBQNQerNkpngvA4d0a+DTTYXgJJhzY+Pu0XB5JOJzHqgaNwmG/o5N+Z57d5Z1mGqgvAxR9J+Tx9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207105; c=relaxed/simple;
	bh=01ioWAHb5nCsaIc11XbExlYS4Qk3/qMPjNMVsOpw1as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+drvFKSH6uAUnVhaqAZTVmTrlN1DLxlvgt7MuXCTBds65wgWKmLG7Gb8v1hyeLXZhaii0WFwJdyoFxEOid2Raiuo1iB52qdJyd1hbsCVma3jbfqr/fNLYDWOmdWHwp61rt87Wl2vDMhG35Ns3eoTex0kG3ScnVx+3F1hhAqdEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsgxwsD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChWt09wZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3S0S1479563
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ET6MuyER7wxqL0ASDlEV4k/M
	QK1DNFn9BvrzLC069vE=; b=NsgxwsD3g9/tq9EhZ6i+/tcISCfFF7/04AjnxCFQ
	Ml6KjDCaTQdVQ7/O+jrLiaCqhWqWALIh+4xScFrNXEJjaxa1e99uVeRza6pIO8kS
	6hcsGgFXizRuscbj97lpaijwrWQV32/x0QIgBLPfPHqms3EOJ/heK1CG59rjJks8
	XV6fgwZKlJCHBOm0dRHCYTgP9E+a8EAYjLoul37S9v7b3hIxpOEZW8RMrrxqWjId
	vv3NZrNwStAj/Ls5lRcxQqAhDm2KQ4s1hfuEc5mXEJ+IjcJuAYgagI1a3Cklagkc
	U/PqeV6jk8kaHrttj5udUw1psw4Zas8zGTIZ5y9LooMAnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbgn1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 19:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517d766e05aso5181641cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207102; x=1781811902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ET6MuyER7wxqL0ASDlEV4k/MQK1DNFn9BvrzLC069vE=;
        b=ChWt09wZlxE5j1/g37hBp5uXGbKO3DITbM5UEWqcp6HjvCdkXcxW5JJ/yGswHUFnoh
         KMICONwmJTHsYjM7qc3gaPB38fzQjhrX8fHA/Gjt2ptoMqQPskck/aLvrF9RdDasNT98
         t6EdtAkki3lZq7TRTvJZ6Yicazt7hDL72Amutc2l2QvGf4zrlx8ScuV6lyhIYP3yJr7h
         gxnNqHzXgTZDW8DNipL5C99ueaWKlMXQbPFdgyzme26GPweMdfDe3uCp7c0R/ZJUF9Ek
         YlAebBhW9AFwK9EMfmBCpwkhYYRkWhOCIfjOhBlmNe4FVrvwuLzk5LkgMgodpnoKpQqX
         ntrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207102; x=1781811902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ET6MuyER7wxqL0ASDlEV4k/MQK1DNFn9BvrzLC069vE=;
        b=lm2KvJI9VBmXLu0OtNdJdVhnxQ16vmTkIMeNOLZUHvfJ5fEwMJ9S5DyZjmyQfC9OGw
         fMcicbO1U5kn//iK3xsWnErF7lyzLr2CWwuipo9dj4LG1oEyJyC/piISBjBYvm+OCa8m
         UJQwJUcUyeljILSceilQ2+pyTDL+ujhB0WrA1GRkpLY+Zk2X3IvFqu9BwtqTe4GBgvGP
         pOiRBMm0E4sJRcmarD0PMy95s+9gB2zzyijeOJz7fAL/XJaodqvPf3NpzgnBdd09jC9V
         NJhdnT43a87SZfhmasJxdZ7HUeMCOy3hutuCNMRjcEoqTt9gBjHgNbiQEHhYD2KF0nZC
         UOLw==
X-Forwarded-Encrypted: i=1; AFNElJ93bEtKaCf6e2T9beFPboWQZksJhkcCIIkfXLT908MVkR9A2GKagtgrn03ExsiZiHFGajOhCTfPTDQQ3RgE@vger.kernel.org
X-Gm-Message-State: AOJu0YwqcyYhx3S/dodr9VDVpmzOHsddBTI6okzWrhMCiT+k5CzqTStj
	CW3+KgjMbFPXU0rx78HmX5aWDL/uJ9Nvaq3Fn1CJ3uKhnmHcOR+UhJnwiLy5Q+NN4+ys3nRzkfA
	9m/MRpB++4YeEAlD3vmm19rHnS1a7QcV7573CF/APX8L19Piph5tlCzF5y6Ua9uam9QdK
X-Gm-Gg: Acq92OES1X2iXPRyWHlNRuoTsdYzKnn0RVJ0ipjw3BZynk67v2kcYH6zZAv4DnE+D1g
	BKnc5xtKCusACEPAupFsxBbNDmWdle7SGjl/Rfp+eY/SnE0yGrjh9GJ8pqzh9AUw9VuPEOt4laS
	VSXyz/V51/z5kd6ir5z9Kv0F4BwulrH6dVaBdC1ZnwN0oUPX0H22yZ0XiDDmBz7VDP5n2BsVXCA
	UAdixoyfJeRfe5ydNtCDmsOT6OUNFky9JLHXoy7Il5L8wuL9aJ6bsd0eKC7WgYcOQmdUmahy6+m
	g/Dqwp4+km6ia+AwbhTMLIVWa69lmegma6NsnQw6mvU+Rs1Xc7vo0JBwpuHEbBHRanPT7Q2D3/g
	TEHywKdTUZ7FkDdvylj5ycpn2DK2iF1y32HCs4daE4jBfWDBzJbElW2zdaTFHC1Tk9yynFNJbOk
	YTXIr7qe9WMUa2a9CCecJA3cVYMuLjwfGvqhw=
X-Received: by 2002:a05:622a:14c8:b0:516:ddfa:b6b9 with SMTP id d75a77b69052e-517fbe619e8mr1984831cf.23.1781207102429;
        Thu, 11 Jun 2026 12:45:02 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:516:ddfa:b6b9 with SMTP id d75a77b69052e-517fbe619e8mr1984411cf.23.1781207101976;
        Thu, 11 Jun 2026 12:45:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cb46b25sm103098e87.34.2026.06.11.12.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:45:00 -0700 (PDT)
Date: Thu, 11 Jun 2026 22:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
Message-ID: <dz4qovpquxgynnzviqg6g23oa2o3trlkznremnmlqfnlj3b62x@oqgcuvalfcph>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
 <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
 <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <955691e1-e40d-4584-861e-8f29db4ba8a9@oss.qualcomm.com>
X-Proofpoint-GUID: zJXMRaNzJftlfg-njfh7qfYEQgilu9_f
X-Proofpoint-ORIG-GUID: zJXMRaNzJftlfg-njfh7qfYEQgilu9_f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfXwtkyzXoy23vs
 pHDpDLdW81Prq3GefZftrIMwAEfE6utTx8D6tv4kh6BKte5qzsj1DVbu5IxmyiSTMIdmVWDCI35
 QJlMYoc/VPmr/rP9nglp91tDsJEEQ8s=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b103f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NvgA2eVT_OJx7K5CLicA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OCBTYWx0ZWRfX1JwiIogINS+L
 4shQNwPIsnJr7G7736e1xh9b1KFElwVmtDdAPg4ymsepSIUpwliHiBGChTGBmNYJVvCKcIVOztw
 2whRP0P8NPuKzJGOghXG59H4WIFBox5Ryr761y1YCzau2bSS7vOEAT5kCG+DE27Q83GlwACG/Ak
 PzsT+Jco4dNxaThaIDbFxe935CiqGLxbMlww0/BGsd+vWsGUU/OPihEhu0nAOC0QPpqeK3imj9X
 qMj5wH49t961eHeAAa5BsemQTbC/LIt/fxIVHuZZSOoRAxsSV59im55XEjFJ7UmpWdFNFTfTVUe
 GQY/oNvzwuffJmuSP3fFlOuYkABjkZ3YXCvXaa/kAZBKjQ4531ZyMDIDyjmtGCy/ChRfZwUY4Gs
 WJh57g2fiUF1jVFzWDNieBWga3ZJsA4f96UPdOdwcUgyp4brvV5VPuse3tdLi2EIEWVWB6tNwAW
 t61Hic175qk8JJoTwZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110198
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:qiang.yu@oss.qualcomm.com,m:jjohnson@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:devicetree@vger.kernel.org,m:brgl@bgdev.pl,m:linux-bluetooth@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[kernel.org,google.com,oss.qualcomm.com,gmail.com,holtmann.org,quicinc.com,vger.kernel.org,lists.infradead.org,bgdev.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oqgcuvalfcph:mid,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F85F674D7A

On Thu, Jun 11, 2026 at 02:09:27PM +0200, Konrad Dybcio wrote:
> On 6/1/26 11:46 AM, Dmitry Baryshkov wrote:
> > The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
> > version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
> > parts of the device.
> 
> [...]
> 
> > +	wcn6855-pmu {
> > +		compatible = "qcom,wcn6851-pmu", "qcom,wcn6855-pmu";
> > +
> > +		pinctrl-0 = <&bt_en>, <&wlan_en>, <&swctrl>;
> > +		pinctrl-names = "default";
> > +
> > +		wlan-enable-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> > +		bt-enable-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
> > +		swctrl-gpios = <&tlmm 153 GPIO_ACTIVE_HIGH>;
> > +
> > +		vddio-supply = <&vreg_s10b_1p8>;
> > +		vddaon-supply = <&vreg_s11b_0p95>;
> > +		vddpmu-supply = <&vreg_s11b_0p95>;
> > +		vddpmumx-supply = <&vreg_s2e_0p85>;
> > +		vddpmucx-supply = <&vreg_s11b_0p95>;
> > +		vddrfa0p95-supply = <&vreg_s11b_0p95>;
> > +		vddrfa1p3-supply = <&vreg_s12b_1p25>;
> > +		vddrfa1p9-supply = <&vreg_s1c_1p86>;
> > +		vddpcie1p3-supply = <&vreg_s12b_1p25>;
> > +		vddpcie1p9-supply = <&vreg_s1c_1p86>;
> 
> [...]
> 
> > @@ -373,6 +437,13 @@ vreg_l7e_2p8: ldo7 {
> >  			regulator-name = "vreg_l7e_2p8";
> >  			regulator-min-microvolt = <2800000>;
> >  			regulator-max-microvolt = <2800000>;
> > +
> > +			/*
> > +			 * This is used by the RF front-end for which there is
> > +			 * no way to represent it in DT (yet?).
> > +			 */
> > +			regulator-boot-on;
> > +			regulator-always-on;
> 
> msm-5.4 maps this to bt-vdd-asd-supply (asd being a keyboard smash,
> perhaps?) - what is its actual use?

WiFI/BT RF front-end, a separate chip containing amplifiers, couplers,
etc.

It is a separate chip (or a module), it is not powered on by the PMU,
etc.

-- 
With best wishes
Dmitry

