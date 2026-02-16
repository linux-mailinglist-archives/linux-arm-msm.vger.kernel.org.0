Return-Path: <linux-arm-msm+bounces-92913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIIIC+PrkmlSzwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:05:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763814236E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDDC0300C58F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458C62EBDEB;
	Mon, 16 Feb 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOi8KFGe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmJIAvPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFEE2E62DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236319; cv=none; b=ATvehWBw9G1zmjqBXbiWubE0/40oV4B+0Ezb/E/8gLBiqBl0pUiVllb3JgP16qcu8ibTQykUmoVCs1TCT8o9hvUPwwWcPvsJZDcQNPnr1+LlOprS+rXUslOrAYA86p9YmyxdqmUPyVrctVUDjB2qp7/tutl7ayTwBBDulJvWPIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236319; c=relaxed/simple;
	bh=h9Br9YS3XInvcC5sO9r9RZvv1U/+jyqG6ZbzxKQnX+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtPmNB80cSFWomkt+e8MH2YlmtJ+chXRJLbhEcPPaVNBSYoBiSsc9ehQpjyXFdfDY7HHUS33NE62CtoOh3m/HXRkcm5qdSEhY7usQgVO1G3d8nd6+I0ssGIQChJ61Ke4qFWeXsEtQGx/0tEmASuF1uPZCeqk/pNC7L41oh0YqbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOi8KFGe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmJIAvPf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FLEIIg1921279
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FjF6r3afnuhXg0DwSK6GZ1us
	vzZbMW2fPMTY0Q9u+sM=; b=TOi8KFGei0IP9/N0La/GHhO4Yg2QMhsaHHJt+h3k
	BrKgTlt0oD9VrK3uj04vEFWtJHsDSZMX2zssLG5B5H8CmMcvHGb8wqenfo0av2Z4
	0WC+ddoFb0pTSecqvXlUOSIipNTQy7U1exZ3GOqLFEfDUzUvk9Ule8qRqy1DZrmG
	6Tsh+BSPjz1mJvP2bG1ELjCw9wGTP29L+HCDNpCReJi+y/HftRmmZJpXc5NuK6+V
	BbsecfIZmAxk8od4LqeLLUH2yfKG10aVjj0Fgbw0M/rbHxzAaSEEnZ2Ho0tTohHy
	Z/cMxBeYHgH7NGQH4OjaJ7wu4JqS37N6DRueH8WYYtPvqA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caerc4dra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:05:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f8dde688so228661086d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 02:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771236316; x=1771841116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjF6r3afnuhXg0DwSK6GZ1usvzZbMW2fPMTY0Q9u+sM=;
        b=BmJIAvPf7F08eHcI8jArHiS1q7l/pzuVRctEdK0ysAhrp2tUK8y0RUdsQWG9U3OqsI
         IszTlSJB46hpenYP5vLrH1SCrRbKFQwzArsdFn5ZSvt9D9d3nNmgF0xut0IEJ91E/lVm
         nMXjupIUwgjpaWM1Cxm2+WfkaA4B9nO5B+S+IcpvPvwQZ6ENdqfwaw4Okqvyoq/PQUsb
         NA0y31Az7JzcfznhbCDLLSBSAc3wUZE6gPOUaq2WZt8Q26IfqTKl8AMdaNbit0AOq97v
         fb6R7avD+Nw5ieO/snUPOtTwz5E+93frVn8b+2TqJxoydo94GZxd/72Qk0ABGHA8fxgC
         jGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771236316; x=1771841116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjF6r3afnuhXg0DwSK6GZ1usvzZbMW2fPMTY0Q9u+sM=;
        b=SMngrUtgxwjFZXPW7SHwRnNre/iEJRx4ElKZyVJQt1Atvm2vLviONbY8BHyqm6ovSv
         U5qYJQcl/3dlYx49DeQiQwBFHcTsfkfQ03YwNJx676da2Ngc7IP10YEw9/hbWMw30rBB
         WdjY41RzBVCHR+9iOnaIwkLxhmt6nqujwiWUGGs8goc2y/zTbFQcJ6H56T4ElCCkRpSe
         jxCJUNosXQko8bliakCW2w6qDF/oajj9zJuXRe8WvnE2xDxb3CLfoJlBVI9POqpZ83po
         p+69wPv8znLfeKiPHWDiM5tWiGKUD1GYaFZDw1JZT6qD9z//UCy2o5rpNQhWR34gASrZ
         ObqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfNEBWnSUIrhM52TrRwMGfAaoPpE3zOIT84M3PkTfvxhX+EFkxrQ5Gmtf+5T87jyWhDU85EKaPOuoU2z10@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Rsq0/WQcGBsfZR2BzlWYeFUrMOx1R2CgRMITsSmVULfrWZ2L
	aYAu8TaGqyaBWGwOIc0qyvjR6h+/HvlA6OfXo9kGyDPspReMx2ISkP+OwTYMMIFpLAYlBdTrDvH
	+TQt3f5o3W0aw6bUlkkN6U2Tyn/jmGnSlevnq0FNEl9rcAfDWxcttN28mfokYefdsL+K8
X-Gm-Gg: AZuq6aLVewEqFo21sjLGNH2lVu7o589S37kegC1UBu61B2eR2LPOyGyECMghVXLI1QK
	XXF/I9JtWye5KrsJpuPOI/aAy8H2TIynZRJwOWJJOLHv5jmjeU14L9COgY7na7qkIjOvre/ErfE
	bv9kO5j9pnCk8U+ej2v5MZVKYzh33/B/Ut+a/WrGQ/Dcii+78tAqgpRmaK2+7cO929UZ2OLc5xJ
	8d9b6/vvBrPlfqb4eO4E+q9s6arpvTRG5wCstoUv6UYAGvo6y5/rV9WaVISbq0rLEJiULwWkSxN
	5ckAjS5d5xxYroxGi/VSSMZxXzKBr4jKgxWT8NbOxcqinCmPmJctF+/pEBqsTjLXbhIhc07Hrxc
	mShtU06yG58rRtiQ+CXkv+0L+i9WYY9RalQ8N
X-Received: by 2002:a05:620a:370f:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cb424ae497mr1084296585a.77.1771236316120;
        Mon, 16 Feb 2026 02:05:16 -0800 (PST)
X-Received: by 2002:a05:620a:370f:b0:8c7:140a:7dbf with SMTP id af79cd13be357-8cb424ae497mr1084291685a.77.1771236315339;
        Mon, 16 Feb 2026 02:05:15 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad0166sm25953547f8f.35.2026.02.16.02.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 02:05:14 -0800 (PST)
Date: Mon, 16 Feb 2026 12:05:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos: Add UFS nodes
Message-ID: <wtlu65ohpv2e23uozjq7b5jl7kzhyggpmji35enpahay3nlr2v@nuc7f4mt27oa>
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-5-d3ce4f61f030@fairphone.com>
 <zvagnaxqgrpm6bagw6zuov4oi6o4b7vmy673oh5st22tec2swl@abvblxgray2s>
 <7zdyb2wnojudnrnomnx4aiwvni3e6i52kfioflb3gslztsizkw@ofvvkvrv5f3s>
 <lvaxthcmqvjit4hnofqikxog3vi557elctiqc3nj3ere7rs47v@xcnwzrzc6koy>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lvaxthcmqvjit4hnofqikxog3vi557elctiqc3nj3ere7rs47v@xcnwzrzc6koy>
X-Authority-Analysis: v=2.4 cv=ZJraWH7b c=1 sm=1 tr=0 ts=6992ebdd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=g50hcL_z2kQj7WSxxyAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: SZNCgMWPk8mDHpungRMP9t3v7pRCeWTL
X-Proofpoint-GUID: SZNCgMWPk8mDHpungRMP9t3v7pRCeWTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA4MyBTYWx0ZWRfXzkDRa3vlQgLA
 mlJcmjw3LuMSDXKde62K1MtC7OMK4uNuZUcfRDepT6r7AuXC9ZFWbAZqSsbeleXFuJENzjmMSMr
 PTonSkdZbvMpxWHrwQvNtSgDfBYUv5vz+CrCdbbDMOj3Kkn1qZnZGS3ooLMgA2KG+oenTLLoni4
 awoHJ49pTJcIP0VcY9alQhF5EUbp3CxkeJcJCS1RLS3Fp80jSSRwfA9NOvAbTVgnape0FhBnHah
 4okmW+ELctsTwvkQd5gZmshttCz26XZPS5/TEEXUUhHlcwL6e+FAuy8oFZdcBp+OlZ/Ywsft6c1
 KKzALctIiR/or1BgrkPu5yPTpmMOh8A2DJ4kc8yWXMzRXIu1KqPU/rPF3FkJSynenitfQ4M9Dam
 6E74yZRRrbH4YiHKammXPKlHsyC9K25Yz5V6SVS4yO2aq5+a2Dai0Y+J3tXoiKJOTEkdcZPBEww
 Y0zFifKCdDueucgAkDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,1d84000:email,fairphone.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.25.240.160:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7763814236E
X-Rspamd-Action: no action

On 26-02-13 23:06:51, Dmitry Baryshkov wrote:
> On Tue, Jan 20, 2026 at 04:52:43PM +0200, Abel Vesa wrote:
> > On 26-01-20 16:49:26, Abel Vesa wrote:
> > > On 26-01-12 14:53:18, Luca Weiss wrote:
> > > > Add the nodes for the UFS PHY and UFS host controller, along with the
> > > > ICE used for UFS.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/milos.dtsi | 129 +++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 126 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
> > > > index e1a51d43943f..7c8a84bfaee1 100644
> > > > --- a/arch/arm64/boot/dts/qcom/milos.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
> > > > @@ -1151,6 +1151,129 @@ aggre2_noc: interconnect@1700000 {
> > > >  			qcom,bcm-voters = <&apps_bcm_voter>;
> > > >  		};
> > > >  
> > > > +		ufs_mem_phy: phy@1d80000 {
> > > > +			compatible = "qcom,milos-qmp-ufs-phy";
> > > > +			reg = <0x0 0x01d80000 0x0 0x2000>;
> > > > +
> > > > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> > > > +				 <&tcsr TCSR_UFS_CLKREF_EN>;
> > > > +			clock-names = "ref",
> > > > +				      "ref_aux",
> > > > +				      "qref";
> > > > +
> > > > +			resets = <&ufs_mem_hc 0>;
> > > > +			reset-names = "ufsphy";
> > > > +
> > > > +			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
> > > > +
> > > > +			#clock-cells = <1>;
> > > > +			#phy-cells = <0>;
> > > > +
> > > > +			status = "disabled";
> > > > +		};
> > > > +
> > > > +		ufs_mem_hc: ufshc@1d84000 {
> > > > +			compatible = "qcom,milos-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> > > > +			reg = <0x0 0x01d84000 0x0 0x3000>;
> > > > +
> > > > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> > > > +
> > > > +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> > > > +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> > > > +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> > > > +				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
> > > 
> > > Maybe I'm looking at the wrong documentation, but it doesn't seem to exist
> > > such clock on Milos. It does exist on SM8650 though. So maybe the TCSR CC
> > > driver is not really that much compatible between these two platforms.
> > > 
> > > I take it that the UFS works. Maybe because the actual TCSR UFS clkref
> > > is left enabled at boot?
> > 
> > Oh, nevemind. I think I was looking at the wrong SoC.
> 

Sorry, my bad. Yes. There you go:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

