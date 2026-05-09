Return-Path: <linux-arm-msm+bounces-106766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDDfBea3/mmzvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 06:28:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8C34FE0FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 06:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 904903010162
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 04:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C126F2BDC2A;
	Sat,  9 May 2026 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM5L8nbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzfvGZGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2E318EDC
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 04:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778300896; cv=none; b=qzvX+IMd8FsRFZ1SbHzswUD8kwxfMZkQzkwsbwB0gTxWKWwdWqhK5Vr0FNCJXdBtABR7JtQmR7dxGQVB33gtqNoHPb8ilEtMbUyqsE645EX8+E3TDyd81vI1SCPDUNZpgfsXKwPUFpA1o/5g0o81CN9iZ5nbyR6jlPxt/37nX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778300896; c=relaxed/simple;
	bh=lH56q4JFas0JYn6KEZjtVCEh+1cdQmJoEz76ASZMq44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OX2lSLR/0c/CYnSy/EbcawcfJLOr2ZejoGY/vJYwXEYsbOSF4vevtJQCQzgfBcuuIW+UOz16JuGXBEQ+hQYdtq5lIBm8KCQ6iHL8XbZtqz5U4HWcUps8c9LahV9aHgyWMPVdfAbwqWLENFI1O+E8NG42OnGyXyjSkDzajvGpVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM5L8nbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzfvGZGa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492BsVU656761
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 May 2026 04:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oeQVFdzspTdGZ8kTnotfv2Cm
	F2zsoti19Tmhiiv7Yak=; b=cM5L8nbx53y4q7l3eniWE0tFnv3TmJSjXZA9rRwm
	O8dBN2D5vd51jTSqV5XJhVOXLaGSBkvQh1IIQR/AzqctrDDxWe2EEU0XoXWJhV4q
	Jn/Epim/54JuKiQvBvA4lI+3akvzsDXRUH9dXkjLRbgdkS9dn1BE94UzurKQHAO9
	BqEeSQm76vfKA+TeRc9whkrSG/6WwL/kxZdu36b+RjRuYJF7MqV1QIPgfzBm3AEL
	Q3xW5N6OXK6l2Entd2oGLEhGi0pNbjvF09rR21JEW2j43fP/U5L7Sb6jxLAzJe3A
	ykGHOfMqPZXVoVI6SnMZb5eyv7XkVfL2gEe8RvLRLYTzlw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1ux6r7td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 04:28:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2988782eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778300893; x=1778905693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oeQVFdzspTdGZ8kTnotfv2CmF2zsoti19Tmhiiv7Yak=;
        b=TzfvGZGarj6Z+vB810CDPE8Z+ziBpL0MSvH6KDuWzrufgXBhi/pdy4jzHX8b9z4lD9
         PO76u1O5wxkg10OaqW8iRK+SLbys8iTdN9uxtUXcfKw0dvFuXJ/NEV7lw9CCGHzfEvND
         pQCQJE0UXHncPCjRC4xbHNC2znGwLqsHeUBuByy9yxUkuBnUWBR++uf7uZSchXFxEITv
         qW2oHRM32BEvKbfG73ULiom/byJ/eydd5zc/lfaOXXFqNb1Zet9Pwdi0DVyE2j/R2ClT
         ghEIIbovHPV5HK8/ATEiq2LdTW9SCfrYcm2jGEHirfBLYQ2qtkr/P4Had7bo1aWMSg4N
         Basw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778300893; x=1778905693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeQVFdzspTdGZ8kTnotfv2CmF2zsoti19Tmhiiv7Yak=;
        b=Xg6HILhupAbzKJ35uf5dK7YKVkDeNqa1OsAHKiKpc/RxPzGap+ofAkUTLPLv/wzxf5
         LVLmeNFDUURYCRVfxN29tbfSfzB6diQqpXXLdsRnpeFNfI0sJePJugve24adCjGgbG+9
         s6kvHoFSHyj7Hr303yP+ieyVRN7WMn0eBE4fJ0k8MxGTes1I6P3WT3Kj4frrBOioM5e8
         onw3kONn70wFKnbqbwIstpgw1hLzEtqFJRTDEssQ7WplWwcKI1U0/aBRoFfpuNlOL0kd
         Q3I3jB0O9bw5VaIaqQ2KGvs1kYMTEscSb3H2Pr3QnZAdFre9/1Dc8DOHZM5dKyEoezUo
         fXtg==
X-Forwarded-Encrypted: i=1; AFNElJ+5d9+ZGbMmIbME/hyhdqnQT1JOp1dw1ydxVnxPERxCBWI4jn/Pv/9kNHHZwc/SAJbbaKSTPgeWImaSg+Pk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jEm7jCJSbVa8oK7r4S+sS0KRKxQ1fq89CT7l8qz+an6nC+XV
	+TAqJfoZ5ipFodS/mETkYdv/LIDaFqh5Vz0A8bJd+KAbeVajgxYIJVbeP478RkgXiXNISdskrQj
	VHpffJuEnGHGuu/w/PgOQtpjp14mWeNla3IzmhwBNrejO5X9CAnOWNLY2EQpypOQCpfnF
X-Gm-Gg: Acq92OH/24BpoHtonD4dU+YQARaPGqpngexARO26+6khT/GRSrhxl5Eg5AtbRbaCi+3
	QzaCEkGUoPKRTq0AYFNifel8uUl7+rzZcqT/XFrAArmgiohVFvIZ3lQCJyFJaEpajEbnIzLWBNp
	JDXeqQdM8qqnjvZYNBDyDWr4TPH0aqejCW3PeTs0knnFRA3ZvVeAGS0EsL0hXMJWC/xxZDVb3M8
	gqUM+NUZLgw/dHrAaB0MECxo4fjvN/GtcxCIgp/zir9iFS+EcmwE0kQmcsz8gWdeFHjl1Mccoek
	Yrf4uusXySppO9Br+O1/dqLNmMlp+Hs+xt+3HaRW5NZ5Xille6FPfVVv2uefnE/lZsMoU3Kx9aa
	7zFk/0lvBSWpd4lgM17B1HwWwr3VMytYojYDkhNiI3StYzkOlr/CvNCsa6kRUG5U0
X-Received: by 2002:a05:7300:b919:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2f54a87e845mr8084033eec.22.1778300893036;
        Fri, 08 May 2026 21:28:13 -0700 (PDT)
X-Received: by 2002:a05:7300:b919:b0:2dd:c066:c02 with SMTP id 5a478bee46e88-2f54a87e845mr8084023eec.22.1778300892454;
        Fri, 08 May 2026 21:28:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm6553109eec.31.2026.05.08.21.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 21:28:12 -0700 (PDT)
Date: Sat, 9 May 2026 12:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for Nord SoC
Message-ID: <af631l0SBTv_SG0-@QCOM-aGQu4IUr3Y>
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
 <27a2c0aa-ca50-4bdf-a735-f4375ffdc8bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27a2c0aa-ca50-4bdf-a735-f4375ffdc8bb@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA0MiBTYWx0ZWRfXwDnpRmQw25va
 1Ck2Sf9unOU3LVt+ptOGs6o8/fQFmAcOV77dn45tc7D4ncw/6KsfexGEM3bIBCE0dsb4gpk76NP
 GqeBRUP/50DoAZbK8jR5Kjmt1hzmxXkpDi0S1uFdLkI3NdlKVwEj72PfJP1pRtWt8Vy+LptWYHH
 xAG6Xpu1LrjHBK598QaJx3WSFrFjCLDii1AcNtWipHU7Cjhq6kCty9QCm54rPdl08qOnu8JdSbZ
 ghr5IWzeQlDcLUwurrfW+iiuEO5gfDl/8VY0IUTY03EVhmWw/W6OSbPgOdCf1xdLQtTm5HpExtQ
 3vYHTDDgQvOlDIlxzMyYIIsB2J2en5JPnGho1d7uexmq1ChAQtGSGlNi/Je2vEtLUQuYp4jSIbg
 Lj8gQg4hBkCdD+tSCErNMlu2bKoVThmaLESe9qjj1kg7EUR14E1H7e2CDyMHrnQDBqhyEn/NnTm
 cZw2/D25SK63vx0QE+Q==
X-Authority-Analysis: v=2.4 cv=QJZYgALL c=1 sm=1 tr=0 ts=69feb7de cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_ycruYcDSZZNFFtkL0EA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: t4OZAreQ3iidIxkoBGpthGG8eaWyx_eY
X-Proofpoint-GUID: t4OZAreQ3iidIxkoBGpthGG8eaWyx_eY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090042
X-Rspamd-Queue-Id: 6F8C34FE0FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106766-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 11:41:01PM +0300, Georgi Djakov wrote:
> On 4/20/26 5:13 AM, Shawn Guo wrote:
> > From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> > 
> > Add driver for the Qualcomm interconnect buses found on Nord SoC.
> > The topology consists of several NoCs that are controlled by
> > a remote processor that collects the aggregated bandwidth for each
> > master-slave pair.
> > 
> > Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >   drivers/interconnect/qcom/Kconfig  |   11 +
> >   drivers/interconnect/qcom/Makefile |    2 +
> >   drivers/interconnect/qcom/nord.c   | 2682 ++++++++++++++++++++++++++++
> >   3 files changed, 2695 insertions(+)
> >   create mode 100644 drivers/interconnect/qcom/nord.c
> > 
> [..]
> > +static struct qcom_icc_node * const aggre1_noc_nodes[] = {
> > +	[MASTER_QSPI_0] = &qhm_qspi,
> > +	[MASTER_SAILSS_MD1] = &qnm_sailss_md1,
> > +	[MASTER_QUP_3] = &qxm_qup02,
> 
> Maybe this should be qxm_qup3 ?

Yes, it makes more sense considering QUP_0/1/2 naming.

  [MASTER_QUP_0] = &qhm_qup0,
  [MASTER_QUP_1] = &qhm_qup1,
  [MASTER_QUP_2] = &qhm_qup2,

> 
> > +	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
> > +};
> [..]
> > +static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
> > +	[MASTER_CNOC_CFG] = &qsm_cfg,
> > +	[SLAVE_PS_ETH_0] = &ps_eth_0,
> > +	[SLAVE_PS_ETH_1] = &ps_eth_1,
> > +	[SLAVE_SHS_SERVER] = &ps_shs_server,
> > +	[SLAVE_AHB2PHY_0] = &qhs_ahb2phy0,
> > +	[SLAVE_AHB2PHY_1] = &qhs_ahb2phy1,
> > +	[SLAVE_AHB2PHY_2] = &qhs_ahb2phy2,
> > +	[SLAVE_AHB2PHY_3] = &qhs_ahb2phy3,
> > +	[SLAVE_AHB2PHY_ETH_0] = &qhs_ahb2phy_eth_0,
> > +	[SLAVE_AHB2PHY_ETH_1] = &qhs_ahb2phy_eth_1,
> > +	[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
> > +	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
> > +	[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
> > +	[SLAVE_CRYPTO_1_CFG] = &qhs_crypto1_cfg,
> > +	[SLAVE_CRYPTO_2_CFG] = &qhs_crypto2_cfg,
> > +	[SLAVE_DISPLAY_1_CFG] = &qhs_display_1_cfg,
> > +	[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
> > +	[SLAVE_DPRX0] = &qhs_dprx0,
> > +	[SLAVE_DPRX1] = &qhs_dprx1,
> > +	[SLAVE_EVA_CFG] = &qhs_eva_cfg,
> > +	[SLAVE_GFX3D_CFG] = &qhs_gpuss_0_cfg,
> > +	[SLAVE_GFX3D_1_CFG] = &qhs_gpuss_1_cfg,
> > +	[SLAVE_I2C] = &qhs_i2c,
> > +	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
> > +	[SLAVE_MCW_PCIE] = &qhs_mcw_pcie,
> > +	[SLAVE_MM_RSCC] = &qhs_mm_rscc,
> > +	[SLAVE_NE_CLK_CTL] = &qhs_ne_clk_ctl,
> > +	[SLAVE_NSPSS0_CFG] = &qhs_nspss0_cfg,
> > +	[SLAVE_NSPSS1_CFG] = &qhs_nspss1_cfg,
> > +	[SLAVE_NSPSS2_CFG] = &qhs_nspss2_cfg,
> > +	[SLAVE_NSPSS3_CFG] = &qhs_nspss3_cfg,
> > +	[SLAVE_NW_CLK_CTL] = &qhs_nw_clk_ctl,
> > +	[SLAVE_PRNG] = &qhs_prng,
> > +	[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
> > +	[SLAVE_QSPI_0] = &qhs_qspi,
> > +	[SLAVE_QUP_0] = &qhs_qup0,
> > +	[SLAVE_QUP_3] = &qhs_qup02,
> 
> qhs_qup3 maybe?

Indeed!

> > +	[SLAVE_QUP_1] = &qhs_qup1,
> > +	[SLAVE_QUP_2] = &qhs_qup2,
> > +	[SLAVE_SAFEDMA_CFG] = &qhs_safedma_cfg,
> > +	[SLAVE_SDCC_4] = &qhs_sdc4,
> > +	[SLAVE_SE_CLK_CTL] = &qhs_se_clk_ctl,
> > +	[SLAVE_TCSR] = &qhs_tcsr,
> > +	[SLAVE_TLMM] = &qhs_tlmm,
> > +	[SLAVE_TSC_CFG] = &qhs_tsc_cfg,
> > +	[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
> > +	[SLAVE_USB2] = &qhs_usb2,
> > +	[SLAVE_USB3_0] = &qhs_usb3_0,
> > +	[SLAVE_USB3_1] = &qhs_usb3_1,
> > +	[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
> > +	[SLAVE_COMPUTENOC_CFG] = &qss_computenoc_cfg,
> > +	[SLAVE_PCIE_NOC_CFG] = &qss_pcie_noc_cfg,
> > +	[SLAVE_QTC_CFG] = &qss_qtc_cfg,
> > +	[SLAVE_QDSS_STM] = &xs_qdss_stm,
> > +	[SLAVE_SYS_TCU0_CFG] = &xs_sys_tcu0_cfg,
> > +	[SLAVE_SYS_TCU1_CFG] = &xs_sys_tcu1_cfg,
> > +	[SLAVE_SYS_TCU2_CFG] = &xs_sys_tcu2_cfg,
> > +};
> [..]
> > +static const struct regmap_config nord_hscnoc_regmap_config = {
> > +	.reg_bits = 32,
> > +	.reg_stride = 4,
> > +	.val_bits = 32,
> > +	.max_register = 0x45080,
> 
> Is this value correct? The qosbox offsets for some nodes go beyond this.

The HSCNOC max port_offset is 0xa45000, so the correct max_register
should be 0xa45080. I appreciate that you spot this error!

> > +	.fast_io = true,
> > +};
> > +
> 
> The rest looks good!

Thank you for the review, Georgi!

Shawn

