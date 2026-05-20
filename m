Return-Path: <linux-arm-msm+bounces-108718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDy7GTefDWqC0AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:47:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B98A58CE5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 853C430DA35D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB7D3A4528;
	Wed, 20 May 2026 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODOpsVXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3E2BE7C6;
	Wed, 20 May 2026 11:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276128; cv=none; b=MqlEBRId6aZyDGUb410khrJ2diQshvTfDeFr6PnQnxTMNMUHUtdrHD6O5wFpTZvniqrGxZmdvwxcD58hIuEkgYBrN1EljWetmLeTczAOlDsv4e7IgJ3VFP5iquMqhx/tQ6iuGeEtArUU55k3WeGDtXvV1fe1SM2O08JyboVDEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276128; c=relaxed/simple;
	bh=i5cEeky9vzuSilPkdzYZW80Ti4646kkrWEkdoqGt8XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0MYMjhkslKdGajbcAMKTzGIbGCYVlOh1aVLq44Qm9jjOMhv8gEh9uN/wwKL836RCzL87h2eJHokjFgsXG6r2fOZiF4zulNtu7JrdLPjcQ5E6DA9O37pNFHWO0pBFZfPfqoWp1BbeCkklBI12CMztjzPgDjwkCMMhLYnzgbjWYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODOpsVXE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nQWn446597;
	Wed, 20 May 2026 11:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5p/SnGWGxmFc54b+LFGyQzpr9SmVlt+zL3lpibG+ap4=; b=ODOpsVXEk14yhKLW
	ByqyjUgxkfNUDLA1jJCpV7LmanEMckxhj/7OD4srfr7UbOs8u71+XVSS+leMrgLn
	8PLTUtyFZhfhnEx2pUbFXFcGwDWAZxZdBziF8W413jkWyQjWqzquufCFzcuOWDKR
	r6A8qK8wt8B3B3VU5uAfH+iUGXu8xC/o3qaep854XVN0QmchncHyvdD32sO6AaMi
	C2iGdXQLnoeI51a8IeVC6326HgVgYAj6pdoLhkRNzhzn7W/3gY0sYOrBLnx1MnLZ
	xrxIqSWZeo8gE8CMdA5/d5Ae9D+7ZbU2XZfkH1/x25V2mmUgSwFtItHErR6hXxXY
	cBgV5w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrgap5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:22:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64KBM0MQ031146;
	Wed, 20 May 2026 11:22:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4e712fyn6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:22:00 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64KBM0GY031141;
	Wed, 20 May 2026 11:22:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64KBLxbr031140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:22:00 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 3A1E7B31; Wed, 20 May 2026 16:51:59 +0530 (+0530)
Date: Wed, 20 May 2026 16:51:59 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH 2/2] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Message-ID: <20260520112159.o2p7gyfnwowhxgfp@hu-kotarake-hyd.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
 <20260520-add_pm4125-vbus-reg-v1-2-f6d15d7dbbe8@oss.qualcomm.com>
 <7b47ca4e-dc20-4155-881a-b1849cc000c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b47ca4e-dc20-4155-881a-b1849cc000c7@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: lVKBYDqEYarZfzzEe19c3FgvP-_rCLC9
X-Proofpoint-ORIG-GUID: lVKBYDqEYarZfzzEe19c3FgvP-_rCLC9
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0d995b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5hu5nYuTp7SrDqNDHFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwOSBTYWx0ZWRfXxLlRGnQ/whCe
 HF8q62H/uutxsTw/wtAXxoKjGorZIRIL4KNW93X2vs7SehPMwnIxzhtas4hWX4/w9UHK/TZ+kEE
 +3i65JutNwVFkrOfwB7QTltKMFtWAXu5YS2aSdRvy26S2EnPJjUB0YDrrCU+v3t8L+Ll0OI9E72
 vFBXdIxnSz1ZUfqniqHmfzYuwzV5+9UhUFmVAHggoEhSgvZ1jfVF/g+1GNVSNW51du1H/twuRal
 WplwTs8pgk9hxNFexcKSLlccLgprrF8OggCsotqRY1dBxtrhH4mvPZOHTweJNaQWgQyt0EURCCE
 T3eD96MWF0zprraxB9JEHDnTuCkcOtMD3iVlRf7uXvnnGRP0INp5SPJW+pMTXsGuMlvwjDyjPs3
 55SrmHK+lr3h9PHbcXvzkbDvsJVvkKjliH+YfZrDd7dpkXOY4BvMR3zImo3aTQdywsCIXJ4nQ8d
 jh7T0ZJ8aoEDCOTfl4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108718-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,hu-kotarake-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0B98A58CE5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 11:51:49AM +0200, Konrad Dybcio wrote:
> On 5/20/26 11:07 AM, Rakesh Kota wrote:
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
> >  drivers/regulator/qcom_usb_vbus-regulator.c | 102 ++++++++++++++++++++++++----
> >  1 file changed, 88 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> > index cd94ed67621fee9f6d7a0327054db0ebab6cc7ee..3d425452a0b35b35c4b454f84eb28e87cc8ba4f8 100644
> > --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> > +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> > @@ -20,10 +20,35 @@
> >  #define OTG_CFG				0x53
> >  #define OTG_EN_SRC_CFG			BIT(1)
> >  
> > +#define PM4125_CMD_OTG			0x50
> 
> This register is named differently
Ok, i will update name to PM4125_VBOOST_EN in next version.
> 
> > +#define PM4125_VBOOST_CFG		0x52
> > +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> > +#define PM4125_OTG_CFG			0x56
> 
> And so is this one
update name to PM4125_VBOOST_CFG in next version
> 
> 
> > +#define PM4125_OTG_EN_SRC_CFG          BIT(0)
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
> 
> And because they're so different, keeping them in a single driver starts to
> look a little odd

You are right, they differ in control mechanism — one uses current
control and the other uses voltage control for VBUS in host mode.
Since the functional purpose is the same (VBUS regulation in host
mode), I felt a single driver made sense to avoid code duplication.

But open to suggestions — should I split this into separate drivers
or is there a better way to handle this cleanly?
> 
> > +
> >  static const unsigned int curr_table[] = {
> >  	500000, 1000000, 1500000, 2000000, 2500000, 3000000,
> >  };
> 
> And I think there's current-limiting on this PMIC too, except in a differnt
> peripheral (@1300)
> 
The @1300 peripheral is for ICL (Input Current Limit) in device mode
charging — not for host mode VBUS regulation.

Could you share the register you're referring to for further clarity?

regards
Rakesh
> Konrad

