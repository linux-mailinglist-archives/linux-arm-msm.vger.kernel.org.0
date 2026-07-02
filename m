Return-Path: <linux-arm-msm+bounces-115858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mxpFK24cRmqWKAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:08:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B246F494A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:08:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ErjrKFCP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0357B306B7B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80903CFF68;
	Thu,  2 Jul 2026 07:52:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C973A71BE;
	Thu,  2 Jul 2026 07:51:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978721; cv=none; b=LtP9FTmTRS4+9YUg/EeVDcsjvLYVRV5qvPVJcbdNiV5J63uHLm2nl6AOyvyh2O+yceMIs2KV1ProsLf8r8iDDagoCZOL9pgtWExRLiah3Uyq4UNQL5FmNqQ4lRdERu/oo9s3ZF1oZ8xO6lU9QqpGXqglvZ/sVLebwkiTEocabXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978721; c=relaxed/simple;
	bh=YjdmxOp4NGBI5oWsjrwQ/j2T4nx5AWNmqP5rJ+8rR8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtNYy53KTbRcAFAeiiMnM9H2V0yHX0PbvBXsZjQragFv4jh8xSFD0ncfqxTn6sAaJlnuSY+MCw6JYBbs7FSn7zCTMbIRt7gEU+G4xUo6RE7hKoY5uI6She9+qI4Mg4H3zE+A2icGmlBiLZ+/8C39Apu5g9gK1ENAPwUTH7Idf+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErjrKFCP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KXih2957733;
	Thu, 2 Jul 2026 07:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I6EnenllWsde146bQpsnNj6S
	RigXJBgGgosJtcDNrg4=; b=ErjrKFCPlk+Rn2NeLqYr53kEui4LzdILRoj1b+1W
	vUG13832gyKaLiW65SURSHUMo0KxDlUacZcB+aPAJ+BAt/noSNGor+1BPaK5iob/
	YvcqYnEVu5ROTvD0KsFG79Jmf3NBfNMiP3a00rI4DwHwojJJ8/ldS3cjDv28ijVW
	ACHjWckOV7zPvXWsQqxdMQ29BEFRcXKWavGKqH5F2ZW7/DQ54LCiT4mR8KMDFOPh
	DRCmqieioINfvumfvqwaUaELm+nT7WhKribQSzaXwksSeDkm1gKuKjsOQmLr+vUK
	7LAMznlx934SfjmtZuaPsC9/2v/6NldknujNt3Ysk+MW+w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630b3m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:51:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6627nIBQ016474;
	Thu, 2 Jul 2026 07:51:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kke0qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:51:34 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6627pXO3019932;
	Thu, 2 Jul 2026 07:51:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6627pXuX019930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 07:51:33 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id EE395B2B; Thu,  2 Jul 2026 13:21:32 +0530 (+0530)
Date: Thu, 2 Jul 2026 13:21:32 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Message-ID: <20260702075132.voj66dc7ya7hlvq7@hu-kotarake-hyd.qualcomm.com>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <ZkhgnHpgeMHGG5XXFho_yGMh29vJq4gi3Q3c3whfUfY96JLxZVFJtAbHAATuBl1PecwYh3BS9VAhZfv2biT2Fg==@protonmail.internalid>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
 <0e2c6127-0150-4cad-b602-078d499be6c5@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e2c6127-0150-4cad-b602-078d499be6c5@nxsw.ie>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a461889 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=yZeVziLO47tUfnGlDe0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3OSBTYWx0ZWRfXxbzDV8tcNkUb
 1Vr1qOd6PDRpGRIcDOw7QvUP+8IX7FlORJ1frEVsLq0VdaPNImaAcLInAjvQEuz5Mr9GFUBqLXh
 coipFGRvrMDiRH/sPTyDGq6B3LYDfFM=
X-Proofpoint-ORIG-GUID: pXV-7xrey69OSbJvbMna4P7rBBthDPsJ
X-Proofpoint-GUID: pXV-7xrey69OSbJvbMna4P7rBBthDPsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3OSBTYWx0ZWRfX6vIT2YwCgXcy
 r0Yx8gwTCGzW4t4iDmFA7+PJQAauymv7cM5jQBbpYOcm7USA5rBjEKWtf9rR6s4Rt5fZfterBKC
 r2x0grrsIRIK4CyZKZONIYBEycVoGNDBZ14i2FdwRZXljPJ2/RowJ68jzH4nPxqLlN2y613BG14
 2g0VGiABrb4xQLjgbflnxXbt9d2k0RYWDsa1Y10FN/hVfkm7O83m98Cx03mxvxBoimeo5I13UoW
 achiLdDRzvvOBdv86U9c1yxgCvSrlb3iCqOhp3Ra2Xf9xOZkj+YWDPzSx02y80gdhKQ1YbOPYxx
 AVw8C1yO821zec3jSbphOHhSYZS/O0zHccRSk3IEwy533H3MVDHjKDRm0Ev/oj5AOF4U4EMkD6I
 Nl2huUYN0Dq+8BHG9/8FGcj2eHpfhDnkY10aMxdOOSBGvsr3hMLwsip1bRZrS594VWVSPEbiD68
 2g//PEVnhyXhlBaWyzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115858-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-kotarake-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp,config.dev:url,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0B246F494A

On Wed, Jul 01, 2026 at 12:28:00PM +0100, Bryan O'Donoghue wrote:
> On 01/07/2026 11:28, Rakesh Kota wrote:
> > The PM4125 PMIC uses a different register layout for USB VBUS control
> > compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> > at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> > a current-limit selector.
> > 
> > Introduce per-compatible regulator descriptor data to accommodate these
> > differences. This keeps the existing PM8150B current-limit logic intact
> > while adding a dedicated voltage-selector path for PM4125.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >   drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
> >   1 file changed, 88 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> > index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..40e7e5589d5b499b2e84a00b2cfa754fba7e2f0f 100644
> > --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> > +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> > @@ -20,10 +20,35 @@
> >   #define OTG_CFG				0x53
> >   #define OTG_EN_SRC_CFG			BIT(1)
> > 
> > +#define PM4125_VBOOST_EN		0x50
> > +#define PM4125_VBOOST_CFG		0x52
> > +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> > +#define PM4125_VBOOST_CFG		0x56
> > +#define PM4125_OTG_EN_SRC_CFG		BIT(0)
> > +
> > +struct qcom_usb_vbus_reg_data {
> > +	u16 cmd_otg;
> > +	u16 otg_cfg;
> > +	u8  otg_en_src_cfg;
> > +	u16 csel_reg;
> > +	u8 csel_mask;
> > +	const unsigned int *curr_table;
> > +	unsigned int n_current_limits;
> > +	u16 vsel_reg;
> > +	u8 vsel_mask;
> > +	const unsigned int *volt_table;
> > +	unsigned int n_voltages;
> > +	const struct regulator_ops *ops;
> > +};
> > +
> >   static const unsigned int curr_table[] = {
> >   	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
> >   };
> > 
> > +static const unsigned int pm4125_vboost_table[] = {
> > +	4250000, 4500000, 4750000, 5000000,
> > +};
> 
> Should vboost_table be absent for pm8150b ?
>
Yes, vboost_table not supported for pm8150b.

> > +
> >   static const struct regulator_ops qcom_usb_vbus_reg_ops = {
> >   	.enable = regulator_enable_regmap,
> >   	.disable = regulator_disable_regmap,
> > @@ -32,19 +57,43 @@ static const struct regulator_ops qcom_usb_vbus_reg_ops = {
> >   	.set_current_limit = regulator_set_current_limit_regmap,
> >   };
> > 
> > -static struct regulator_desc qcom_usb_vbus_rdesc = {
> > -	.name = "usb_vbus",
> > -	.ops = &qcom_usb_vbus_reg_ops,
> > -	.owner = THIS_MODULE,
> > -	.type = REGULATOR_VOLTAGE,
> > +static const struct regulator_ops qcom_usb_vbus_pm4125_reg_ops = {
> > +	.enable = regulator_enable_regmap,
> > +	.disable = regulator_disable_regmap,
> > +	.is_enabled = regulator_is_enabled_regmap,
> > +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > +	.list_voltage = regulator_list_voltage_table,
> > +};
> > +
> > +static const struct qcom_usb_vbus_reg_data pm8150b_data = {
> > +	.cmd_otg = CMD_OTG,
> > +	.otg_cfg = OTG_CFG,
> > +	.otg_en_src_cfg = OTG_EN_SRC_CFG,
> > +	.csel_reg = OTG_CURRENT_LIMIT_CFG,
> > +	.csel_mask = OTG_CURRENT_LIMIT_MASK,
> >   	.curr_table = curr_table,
> >   	.n_current_limits = ARRAY_SIZE(curr_table),
> > +	.ops = &qcom_usb_vbus_reg_ops,
> > +};
> 
> I think you should split this patch up
> 
> #1 introduces the abstraction for the existing device
> #2 introduces the new PM4125
>
Splitting sounds clean, but the issue is that PM4125 currently falls
back to PM8150B in existing DTS. If we split, patch #1 would break
existing PM4125 DTS users before patch #2 lands. We also can't split the
.yaml changes across two patches. So keeping it as one patch avoids any
intermediate breakage.

If you have a specific suggestion on how this could be split cleanly
while avoiding the above concerns, we would be happy to consider and
incorporate your feedback.

regards
Rakesh kota

> > +static const struct qcom_usb_vbus_reg_data pm4125_data = {
> > +	.cmd_otg = PM4125_VBOOST_EN,
> > +	.otg_cfg = PM4125_VBOOST_CFG,
> > +	.otg_en_src_cfg = PM4125_OTG_EN_SRC_CFG,
> > +	.vsel_reg = PM4125_VBOOST_CFG,
> > +	.vsel_mask = PM4125_VBOOST_CFG_MASK,
> > +	.volt_table = pm4125_vboost_table,
> > +	.n_voltages = ARRAY_SIZE(pm4125_vboost_table),
> > +	.ops = &qcom_usb_vbus_pm4125_reg_ops,
> >   };
> > 
> >   static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
> >   {
> >   	struct device *dev = &pdev->dev;
> > +	const struct qcom_usb_vbus_reg_data *data;
> >   	struct regulator_dev *rdev;
> > +	struct regulator_desc *rdesc;
> >   	struct regmap *regmap;
> >   	struct regulator_config config = { };
> >   	struct regulator_init_data *init_data;
> > @@ -57,27 +106,51 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
> >   		return ret;
> >   	}
> > 
> > +	data = of_device_get_match_data(dev);
> > +	if (!data)
> > +		return -EINVAL;
> > +
> >   	regmap = dev_get_regmap(dev->parent, NULL);
> >   	if (!regmap) {
> >   		dev_err(dev, "Failed to get regmap\n");
> >   		return -ENOENT;
> >   	}
> > 
> > -	init_data = of_get_regulator_init_data(dev, dev->of_node,
> > -					       &qcom_usb_vbus_rdesc);
> > +	rdesc = devm_kzalloc(dev, sizeof(*rdesc), GFP_KERNEL);
> > +	if (!rdesc)
> > +		return -ENOMEM;
> > +
> > +	rdesc->name = "usb_vbus";
> > +	rdesc->ops = data->ops;
> > +	rdesc->owner = THIS_MODULE;
> > +	rdesc->type = REGULATOR_VOLTAGE;
> > +	rdesc->enable_reg = base + data->cmd_otg;
> > +	rdesc->enable_mask = OTG_EN;
> > +
> > +	if (data->curr_table) {
> > +		rdesc->curr_table = data->curr_table;
> > +		rdesc->n_current_limits = data->n_current_limits;
> > +		rdesc->csel_reg = base + data->csel_reg;
> > +		rdesc->csel_mask = data->csel_mask;
> > +	}
> > +
> > +	if (data->volt_table) {
> > +		rdesc->volt_table = data->volt_table;
> > +		rdesc->n_voltages = data->n_voltages;
> > +		rdesc->vsel_reg = base + data->vsel_reg;
> > +		rdesc->vsel_mask = data->vsel_mask;
> > +	}
> > +
> > +	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
> >   	if (!init_data)
> >   		return -ENOMEM;
> > 
> > -	qcom_usb_vbus_rdesc.enable_reg = base + CMD_OTG;
> > -	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
> > -	qcom_usb_vbus_rdesc.csel_reg = base + OTG_CURRENT_LIMIT_CFG;
> > -	qcom_usb_vbus_rdesc.csel_mask = OTG_CURRENT_LIMIT_MASK;
> >   	config.dev = dev;
> >   	config.init_data = init_data;
> >   	config.of_node = dev->of_node;
> >   	config.regmap = regmap;
> > 
> > -	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
> > +	rdev = devm_regulator_register(dev, rdesc, &config);
> >   	if (IS_ERR(rdev)) {
> >   		ret = PTR_ERR(rdev);
> >   		dev_err(dev, "not able to register vbus reg %d\n", ret);
> > @@ -85,13 +158,14 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
> >   	}
> > 
> >   	/* Disable HW logic for VBUS enable */
> > -	regmap_update_bits(regmap, base + OTG_CFG, OTG_EN_SRC_CFG, 0);
> > +	regmap_update_bits(regmap, base + data->otg_cfg, data->otg_en_src_cfg, 0);
> > 
> >   	return 0;
> >   }
> > 
> >   static const struct of_device_id qcom_usb_vbus_regulator_match[] = {
> > -	{ .compatible = "qcom,pm8150b-vbus-reg" },
> > +	{ .compatible = "qcom,pm8150b-vbus-reg", .data = &pm8150b_data },
> > +	{ .compatible = "qcom,pm4125-vbus-reg", .data = &pm4125_data },
> >   	{ }
> >   };
> >   MODULE_DEVICE_TABLE(of, qcom_usb_vbus_regulator_match);
> > 
> > --
> > 2.34.1
> > 
> > 
> 

