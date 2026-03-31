Return-Path: <linux-arm-msm+bounces-101018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH/5Mz+cy2loJgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:04:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFA3678CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 12:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5AB30916A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63BF3ED5A4;
	Tue, 31 Mar 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2fZHeKf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VmPALYMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A703ECBF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951160; cv=none; b=OR1Hhn9VXDPDUVdFImGqtpVjnCUW9MzsO9KGkg0wPpSz25H1du8kX2crAJ37Pa3itBnxFyo7gMJAVQFBL+uv8koyXlhf1FnTxsBJXgCOKHqH+RyBjXHifUjEEpT8BdmiI/VXdDL1gQJ0udG0odRPHCsy55h9FLbiBGEgrsMFDlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951160; c=relaxed/simple;
	bh=K67fp/R3crNHryaqNc/qaMyLhGOxVzxXxCmNqZMjqKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epIu3iggrwcUNt7/phDvPfNFtmOkc5v5WU9uTdtF8Jk/T54w+E1t0IRsaQUE98ua32ZgO7wWwKjiJ7/U2DBOIp8MaUDk5CXpHdVTMFkPvLQJz8uzT8MNERTB2CLEjHAZ2kGSV+lcHvN6/I+s5KBZHHEKNDVQ2Sojn+Mfny0C1Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2fZHeKf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VmPALYMD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OVKJ2465275
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tYVdhzyN/PgBq2nHkZ289xfo
	K00phIoatD6dXYcn2sM=; b=N2fZHeKfG5auWv2C0vp9w8f1qmx9IzwqdS/6uh0U
	OBBdLq2V+cjwOLuCLrXIJGPDKXjzCpeAh8335To92rTc+o39RmEYuto2GO8hIpwh
	LyoLlWWhOGtrR0VfQL5Cvaojb0HoUO0e7KWBb5Kp8CyJIc1/Q34RXME3Fq5PBVmj
	HQYD4XKV7KAaN4fwbZtojCXpEBSaCilTJa3+MX/ZHUtH5UAZUv6CCYllnreIrP49
	lRAsjEB14XVj5h1gj6govHOzbR4U8noRvNLn1wbs/H76gPdqTbQ2HfIzkamj+fje
	KmYsRogvClMEVCs214bSueHvuRGUDHi+Mw1wRjHHggU6TA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8ns6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:59:16 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso2302433c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774951156; x=1775555956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tYVdhzyN/PgBq2nHkZ289xfoK00phIoatD6dXYcn2sM=;
        b=VmPALYMDuWZ1BramO6QIklApf0ABOzh1vO+qgmXhdhunNcnsTG8L5PTpWk5qDX3m4I
         6r2dCxynF3qA2k5NX5fG2k0qUWDcqWS0OwTa7pslTPk13JjHY+HccOSJMZvdaV45zhmw
         0L2x5mNHBscCMnPe78US/K3yQpnoSZFIjusYhl4SnJk6SRthP7GfeUUqd+Xzilyp8jh1
         zi1mvrKVaiPfyYDbTmd330iBiXNdMWy+RFxZtRUzz9IjpuPh1ZVEBXpcbuJBz9+6eG12
         373jyqZCzgLuGdl3SlOpLovg/P582iLoyeTlXvZI4wYg1vm8MqSjbOJFbNPUt4WqA8vh
         VnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951156; x=1775555956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYVdhzyN/PgBq2nHkZ289xfoK00phIoatD6dXYcn2sM=;
        b=om/ALD4Ug39Al5cXjVNo/O+xKWqfz3sImBWfVPXwCPz72ySDKv5JbVrv/vYSGWHD4K
         seqVZwwKLIeiNzV7i3YuhBJEKVK6YhpAYPTNEnXmmW9L6R203SUfuSeCDzqtoLYvH97k
         k8ZZaabdLag57EcJOUjiDJ2ruhtvX6Wr9XPFMl7qH2KfDVcLYnZt1ZmIKpQWSx5hUtIS
         v/VxbUhyxBd+TLJVAik0QOyN7T3Le7gzOO9dpy/ge1popTfyQ/7NoUli+B35o5e7gs+/
         CYgQPxfnkrr+a+utlB/mitZXcRoWcYRsMmNdhyeQYoRtd4looClewlLbQbTyOs117ai+
         mIbw==
X-Forwarded-Encrypted: i=1; AJvYcCVbvOAf2vMRQvN7DVhUwF+YeuVHPwMsA1SVTn+wGIqslkZ1KXjGCGiHxmLFLxN0ivoRXr/zmydPal+aavGo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6itfScmTfwdnDTjDXeoRacsRnECbNk1d3BQTFyILLQUkC2if
	HchJs/dgbd9H8hYoFIrVLOo8YlrAjmsXS4suJ7rZ6SGy3IQ9HoRkibg/Sc7P9J6LsarvJ/Wc5QL
	NjvFzmVYaIwoy9JXB1z1EHMv6aMVZriFlRACBtFWSKdnEz0cyQfC26PSLaR4YzYrnYqyS
X-Gm-Gg: ATEYQzy1TYbw/l5j6Zv1JDj38Q8AP2Ega0KDldiSw0tsjdUa5g9ZlUC5B3gi0KDNo1B
	GA65E6KpV26UuSjMwkaRlLqBd8I8/wGb4pB9tVOe7fraerATz3uGnMJ2JhyBNv1ZmFmdQSGcCq8
	JwQIImyAUv8IsyPcqOXEMuo3JPk5H2xX/kH11wW7KEORRu9FRUwHy+rpFmLl28UqDRS7HRGt1Mb
	a+6Z3DnZuvlzyx9c8zFes07KuejSj55OwrcbsW+iXEwchrhLUWrK1HeXmjS+8n3JI3I7rzudSz8
	F3rANoSDEKg+K6qzlHLR0NHyI4i+pex5oB8gXMb+traIMwqpdB7ErPWyUoMhn4ronA/b2XNPMOX
	BCdWfzFvM+ep/3cXlCpfaJRi8KRvHca1CKlBjoCLP1ffn76xIMNaDTuPs8P6G/ww3zd4w
X-Received: by 2002:a05:7022:914:b0:11d:f440:b743 with SMTP id a92af1059eb24-12ab28451acmr9612921c88.7.1774951155484;
        Tue, 31 Mar 2026 02:59:15 -0700 (PDT)
X-Received: by 2002:a05:7022:914:b0:11d:f440:b743 with SMTP id a92af1059eb24-12ab28451acmr9612897c88.7.1774951154745;
        Tue, 31 Mar 2026 02:59:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm15063809c88.4.2026.03.31.02.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:59:14 -0700 (PDT)
Date: Tue, 31 Mar 2026 02:59:12 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for
 Glymur
Message-ID: <acua8Me0zo3v/CBi@hu-qianyu-lv.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-4-ce0fc07f0e52@oss.qualcomm.com>
 <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x3ts7to7c4qnorloahe7cgup3uekn4wolmmorqa3b3bjfslqfn@eijnzdp2ops3>
X-Proofpoint-ORIG-GUID: 3l98onXO3w480IwPskUMBpgNZw3KE9Eh
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cb9af5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=56H2F1Fm8OXBRpAn5E4A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 3l98onXO3w480IwPskUMBpgNZw3KE9Eh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5NSBTYWx0ZWRfX/iNH7xda6/Mk
 t0gNSqTv47s1lkqUZi1CaDxDX59KoAEs061Z6wRQcswMZMos9IruUUyIcCW9sTg31SLvGDPZz0Z
 VvGX7jacUvpSAYrX1mVVPkT/gEM2LXrxlcZCpO81y0kZRd+QZunIw9mtH4W7bX7kQ8kyfPcJKtk
 N43DjOweGpRplIp1Ck8SDDxeuPkAth/DBPmQzF2D5DRS2mXxYCVofxOgOsIyGuDCFCN8AYvTJGD
 nDGtpJb10VhhfoSbI3gTRvK5SVXodFDDb6lnOQh8Cc89jU+ykKcK4rms8ZFOIQ1LE7guChscMV6
 AImsCPQJWWBtntBj09mrLz8vTLQQms2IlQavfrBJqCqk8YTEd45YkUCyaQXDKM+pw0LrOZysb3E
 6piAqzziCR58uTwTWT83pwRnY3NiPwPQ2CfyFoKq0mxOeOkoiWcejLTTVvAI3ilGE3lsn8EKSn5
 v9/o2aGzXhRKCoWlJcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101018-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7AFFA3678CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:23:19PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 12:15:31AM -0700, Qiang Yu wrote:
> > The third PCIe controller on Glymur SoC supports 8-lane operation via
> > bifurcation of two PHYs (each requires separate power domian, resets and
> > aux clk).
> > 
> > Add dedicated reset/no_csr reset list ("phy_b", "phy_b_nocsr") and
> > clock ("phy_b_aux") required for 8-lane operation. Introduce new
> > glymur_qmp_gen5x8_pciephy_cfg configuration to enable PCIe Gen5 x8 mode.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > @@ -4705,6 +4713,23 @@ static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
> >  	.phy_status		= PHYSTATUS_4_20,
> >  };
> >  
> > +static const struct qmp_phy_cfg glymur_qmp_gen5x8_pciephy_cfg = {
> > +	.lanes = 8,
> > +
> > +	.offsets		= &qmp_pcie_offsets_v8_50,
> > +
> > +	.reset_list		= glymur_pciephy_reset_l,
> > +	.num_resets		= ARRAY_SIZE(glymur_pciephy_reset_l),
> > +	.nocsr_reset_list	= glymur_pciephy_nocsr_reset_l,
> > +	.num_nocsr_resets	= ARRAY_SIZE(glymur_pciephy_nocsr_reset_l),
> 
> Just for my understanding. If it was not the NOCSR case and had to
> program the registers, would we have needed to program anything in the
> PCIe3B space?

The PCIe3B PHY registers need to be programmed.
But we don't need to do it explicitly because there are also broadcast
registers: writing to these registers will automatically write the same
offset and value to both PHY ports simultaneously.

- Qiang Yu
> 
> > +	.vreg_list		= qmp_phy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +
> > +	.regs			= pciephy_v8_50_regs_layout,
> > +
> > +	.phy_status		= PHYSTATUS_4_20,
> > +};
> > +
> >  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> >  {
> >  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > @@ -5483,6 +5508,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> >  	}, {
> >  		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> >  		.data = &glymur_qmp_gen5x4_pciephy_cfg,
> > +	}, {
> > +		.compatible = "qcom,glymur-qmp-gen5x8-pcie-phy",
> > +		.data = &glymur_qmp_gen5x8_pciephy_cfg,
> >  	}, {
> >  		.compatible = "qcom,ipq6018-qmp-pcie-phy",
> >  		.data = &ipq6018_pciephy_cfg,
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

