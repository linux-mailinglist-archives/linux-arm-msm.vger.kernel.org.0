Return-Path: <linux-arm-msm+bounces-85713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C2DCCC638
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 16:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E79430C19D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0AC2E7F3E;
	Thu, 18 Dec 2025 14:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhmfQyw/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAudjjoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1A2E7621
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766069012; cv=none; b=alcRZStCY7yOMcYOhW1RQvsbbkN44+oPySfVvlrVPUsICHAkpeYjsES/WSpQBTgjL2MyGze6kwBwHMg/zk+f+UBFjSh6Ppy2AHUOJwdKVY1juQcf/UVbSKYrRnBUYWINjHcc09W+EA/lMMiHoLW8BLUnysoZc61jC1WizGTAYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766069012; c=relaxed/simple;
	bh=u1Vvamo0fP1X1uQgT6kmBj5ORx0m7TZCiIN2eI4q1Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/O8R4Tqc2Tk9/0WvTgTy6ypfmzUoAKBa/tYwjNvhOv1f96fbsuoJQXo7Xpt3Sw1JeZ4rugTEYApFp74j1mWrTZI1NS3PkrjvUGVdk/CwvmwJu0Ole2vaxWI62HmVCmP8WABy5ESPMAr6pYA3QRgxtBNJuMz1iDZa/1fIgvRU80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhmfQyw/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAudjjoA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIB5RnJ1334929
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cl4v0oEPk0Fzc67kkLwDXNvT
	S+8R7nFDTHzGx6wYMJ8=; b=ZhmfQyw/JXNNvoQLaqIzCtrDzdR00aSVZ9TKxagW
	t5m9yzpBTyOi1hTIVW/SjpjPuEwN27otyVRDbUJXzAUVIUGHT4htGIUX96XJ6osK
	dFBuiRxUaLdtZQlsKjFyMB/urMXZrBx252zF9jQ7l2P7GLLt1HFcZVPrUABYQCYp
	bcIL2PORFygZUQWYIbKn7DAvCWaqU+ELhzVli16CMePq6VlfnQzRcPzYaglFhBka
	FSn1dtBccjS5NmUBMBIreURLDMToKgmeiLAukeW9w6MPj7w/0eFF9DVAT3s7bTNe
	AvrO9ntkJdBAm/nOPP1JJhKEeC/SEVgvL50AmiYlwiHkcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4gec0n0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:43:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so17980581cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766069009; x=1766673809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cl4v0oEPk0Fzc67kkLwDXNvTS+8R7nFDTHzGx6wYMJ8=;
        b=EAudjjoANxlhME/mZrpu4EX7p2eBWJzZV80FdMwkqXh/0B+XG47cYqanw5TX9a8HMH
         m3ITBzS8gwK+vYr3C5GVuiCcpaM7BnpnrT7Vo4zztSwZQzsV6CDJXH9UlC/fKmgDsowH
         ZqGlADP+Wj6t1U8Q3XEZGEHqiulNGDdiqB+PUmYyFf0hUryqe1e8UlySH5X+DP4JQ2YP
         xqGvmcjhaITrYen2dqMfiSYQQ3aGdQUntd6hNpbGeTlMj13OpsbA2FtxnYLIydDIjt0y
         k8cSzqprhbGkDhmofO3/0yOq8N4bL+3wzdotF0k95c17h6IcwPhfccMI8XH3YeA+ICs0
         ZzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766069009; x=1766673809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl4v0oEPk0Fzc67kkLwDXNvTS+8R7nFDTHzGx6wYMJ8=;
        b=FInwLv5CHxZhdPK3XZgPOyRxi3ROlKXRwIsRPZRIg3g3FdDK5KRlj0dDo0YmkzfzX6
         OK80vEHaPDoqeL1c9WY7qP/CTIgowLA0QiQ0bdTCyDIzrtafAG5IRV3tbeQJZeVovVCh
         LvSeUmYy6oJCpWO1jona5kPOfLq7gWWf0bGvM5SLmdrMnNM5sW8ZRt09I1+9y//EDHsZ
         8NgCvxxMHKFWRfFlKq5OeuE4k+gvbIrs+p1IUMyJgVhZNLdSBuCPSaOIhIPVtP5CbO0v
         psQMgyMLIzSDPgb32FZxDL/RUkbk5X2hIsc6ZU/M2Wxa40W+whrsAR3oY57GTnSKvYbY
         VSGA==
X-Forwarded-Encrypted: i=1; AJvYcCW1yuww5GoU6o+3Mh5JCnkuuA0i+1JHODQLshuNJRCjf1z1fdC66LoyYhV1VBZ/ArcK1eh5wXqEJOkLoZtE@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjFj40SplwL47PSOlb+qG6v7sEAf7Fz9n4QvWlhmpyyesXAxT
	wIUkMumwuJpmRU8mxkIs+bRa97B9aAX1zxutxJvY+ocmyfy01hP4jCXBuHKPNDIKBc0EzVCJzeT
	9W4ljFmdughGY5dDqWx+fogI/r2ZBrNYEBKfImtERmtHJ8CGBvnUrmPiUeyv6MLFL030w
X-Gm-Gg: AY/fxX6GEsMAF+STsKPcNajqvgnm3MiidggKsqF2LqtQtr/cY44+VOFs2cTgFIYnuxY
	ClVgbY3bqheTZZgk1hm30tMs+uzJ3fEz7k9b9mL4hskXbCespX7AowwwgSgSUmNmsz7Gx+exJR2
	wT0hRq5Oov8Pwj30Pt2oo0YsrRB6SQlKYSJgfhquwOb6U8SAScnWrxG/Vof+1pnMPiTr80AqC23
	bmKJAnyPOhkLVFzFLGQcTkoogPHYQ1xklJ9E+NAOVMIMj7Nh7HLAEkvhTtkbnIE3mGQwLbjIM7T
	IwIVWp8fxGzlW+0hq2uXmYmyBAIh11CLcfQiJkjAFs4akz70mkx2qEZpYbq14+72Ugwe1iS/nU/
	ybINH/SO1ygP45F+IN/5CX3K/ydsVBgQOT9viRdFjdW/1u9RO30gLvBQ7lPepUYymgbabGpYySF
	n50HIwWRZvJBvZw1gpm3Ea7+M=
X-Received: by 2002:a05:622a:4acb:b0:4ee:13d0:d02b with SMTP id d75a77b69052e-4f1d059e61cmr284139781cf.50.1766069008855;
        Thu, 18 Dec 2025 06:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL6dB+1hj86WlzrKc5tiatChh9pmm+26BpKCuaMLqUN4WCKyyEtSQwL9D+XULfFU0r7F5lig==
X-Received: by 2002:a05:622a:4acb:b0:4ee:13d0:d02b with SMTP id d75a77b69052e-4f1d059e61cmr284139561cf.50.1766069008428;
        Thu, 18 Dec 2025 06:43:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381134f39aesm10852521fa.14.2025.12.18.06.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:43:27 -0800 (PST)
Date: Thu, 18 Dec 2025 16:43:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Message-ID: <e2lg4eanhotbvauhfaq6z6d22ptwn5g5rfpvblpuegobdybtv2@f4qfelzzrymq>
References: <20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com>
 <20251124-kaanapali-pcie-phy-v4-5-d04ee9cca83b@oss.qualcomm.com>
 <mudq7gmqs62osuarvflmemt2a2gnuloywabtr4w5oyyddp4b7v@eynaurtfrnyt>
 <aUDywpWf+gpEH4Uw@hu-qianyu-lv.qualcomm.com>
 <ulsst7k4meqq5psv577pqapnsrehvvpk3oijp5usxtxdwoxunb@6mxjmpigkwk7>
 <aUPYk6VuFUFrtUDI@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUPYk6VuFUFrtUDI@hu-qianyu-lv.qualcomm.com>
X-Proofpoint-ORIG-GUID: JgC4MiNQd10l9-RqhfmGHu83IVMzS1fh
X-Authority-Analysis: v=2.4 cv=V51wEOni c=1 sm=1 tr=0 ts=69441311 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Zsci5tvq42nDwCYANM4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMiBTYWx0ZWRfXxoiZrrJbmyCV
 JYYbTDGWFrIgaMjlE9/JbnSUVfKp1ty3Fk9BylL8VmkUQi1eFZqfV6SjJ+5ayqFuv86GenretNC
 +GFH/LLV7A7jKQ6jAoH+d0nXDn5ljSFdLUREiib60f3Efz5EMeZJdBvgcqQRHQfvHZZMo1CndGr
 fGqtnqBR76w3IewtTapaLZWssqhT6+ijJlBwFWLiIgDIcKKGxOIqLrotQseohZlXB4LtvAHKWsi
 tkdQU3sbP6xnVxmVKjAALSqVT4QrYDf+olpIdKGMQNmwkUlzZu9HdjIMYxKmF/OQdo2EKtX3E0K
 beU5BS9pK1z6L+Z4UTNg/u99QSZkWs/PurzyCA/DuPzn0ssjqfC9/Yso+eOSYA36cvCCPAi1niL
 qHwCqea2ptqhiRPpd+A3EJHK5DQpwA==
X-Proofpoint-GUID: JgC4MiNQd10l9-RqhfmGHu83IVMzS1fh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180122

On Thu, Dec 18, 2025 at 02:33:55AM -0800, Qiang Yu wrote:
> On Thu, Dec 18, 2025 at 03:26:26AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Dec 15, 2025 at 09:48:50PM -0800, Qiang Yu wrote:
> > > On Wed, Dec 10, 2025 at 03:51:15AM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Nov 24, 2025 at 02:24:38AM -0800, Qiang Yu wrote:
> > > > > Add QMP PCIe PHY support for the Kaanapali platform.
> > > > > 
> > > > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
> > > > >  1 file changed, 194 insertions(+)
> > > > > 
> > > > > @@ -3363,6 +3516,16 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
> > > > >  	.ln_shrd	= 0x8000,
> > > > >  };
> > > > >  
> > > > > +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_0 = {
> > > > 
> > > > Is it really 8.0 or 8.20?
> > > 
> > > I double confirmed the version, it is really 8.0.
> > 
> > This is really strange. The SERDES offset not equal to 0, te
> > PHYSTATUS_4_20 bit instead of PHYSTATUS -- all of that has always been a
> > characteristic of N.20 PHYs.
> 
> Yeah, seems your theroy is correct on previous target such as sm8550 and
> sm8450. But for kaanapali, the fact is the version is 8.0, SERDES offset
> is 0x1000 and the status bit is bit 7.
> 
> We can also cross check the status bit with downstream devicetree:
> 93 		qcom,phy-status-bit = <7>;


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> - Qiang Yu
> > 
> > > 
> > > - Qiang Yu
> > > > 
> > > > > +	.serdes		= 0x1000,
> > > > > +	.pcs		= 0x1400,
> > > > > +	.pcs_misc	= 0x1800,
> > > > > +	.tx		= 0x0000,
> > > > > +	.rx		= 0x0200,
> > > > > +	.tx2		= 0x0800,
> > > > > +	.rx2		= 0x0a00,
> > > > > +};
> > > > > +
> > > > >  static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
> > > > >  	.serdes     = 0x8000,
> > > > >  	.pcs        = 0x9000,
> > > > > @@ -4425,6 +4588,34 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
> > > > >  	.phy_status             = PHYSTATUS_4_20,
> > > > >  };
> > > > >  
> > > > > +static const struct qmp_phy_cfg qmp_v8_gen3x2_pciephy_cfg = {
> > > > > +	.lanes = 2,
> > > > > +
> > > > > +	.offsets		= &qmp_pcie_offsets_v8_0,
> > > > > +
> > > > > +	.tbls = {
> > > > > +		.serdes			= kaanapali_qmp_gen3x2_pcie_serdes_tbl,
> > > > > +		.serdes_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_serdes_tbl),
> > > > > +		.tx			= kaanapali_qmp_gen3x2_pcie_tx_tbl,
> > > > > +		.tx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_tx_tbl),
> > > > > +		.rx			= kaanapali_qmp_gen3x2_pcie_rx_tbl,
> > > > > +		.rx_num			= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_rx_tbl),
> > > > > +		.pcs			= kaanapali_qmp_gen3x2_pcie_pcs_tbl,
> > > > > +		.pcs_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_tbl),
> > > > > +		.pcs_misc		= kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl,
> > > > > +		.pcs_misc_num		= ARRAY_SIZE(kaanapali_qmp_gen3x2_pcie_pcs_misc_tbl),
> > > > > +	},
> > > > > +
> > > > > +	.reset_list		= sdm845_pciephy_reset_l,
> > > > > +	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
> > > > > +	.vreg_list		= qmp_phy_vreg_l,
> > > > > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > > > > +	.regs			= pciephy_v8_regs_layout,
> > > > > +
> > > > > +	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> > > > > +	.phy_status		= PHYSTATUS_4_20,
> > > > > +};
> > > > > +
> > > > >  static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
> > > > >  	.lanes = 4,
> > > > >  
> > > > > @@ -5209,6 +5400,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
> > > > >  	}, {
> > > > >  		.compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy",
> > > > >  		.data = &ipq9574_gen3x2_pciephy_cfg,
> > > > > +	}, {
> > > > > +		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
> > > > > +		.data = &qmp_v8_gen3x2_pciephy_cfg,
> > > > >  	}, {
> > > > >  		.compatible = "qcom,msm8998-qmp-pcie-phy",
> > > > >  		.data = &msm8998_pciephy_cfg,
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > > 
> > > > > -- 
> > > > > linux-phy mailing list
> > > > > linux-phy@lists.infradead.org
> > > > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

