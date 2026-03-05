Return-Path: <linux-arm-msm+bounces-95535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIHbAuA8qWkd3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:20:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D7820D611
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D15FA300FC79
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815C6372B40;
	Thu,  5 Mar 2026 08:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsGUHSeJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASRjMsBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD7A372B55
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698674; cv=none; b=RQDYgZ7ZU9SOvsQu+C0wAXNI752EauDk3bT2O8dLpVf6Hw1u5EXQBHPTGWft94sKNOfhSDm0GYjzv9L0QcFUxGDG7KwjZk3gsfVBXC+jYbUO20Fq0NbdIt7X9KCXJ9Z78CF3ZJBqZqKBe1fn7jLKGKcQa5/fi51tC1fsSLFgNuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698674; c=relaxed/simple;
	bh=WRZLFG+RVdOf4OFvX5feKep4K50fCWaJEMHMD5rzrzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNc7XK19ok250VGb2p87J4jfO6PFs5z8cmB7en+ob/u1j3gDbio80r0zFn/BLvHyoQEFcpmrB4vKAJadApbcZgbcH9ldFyeq/xxAhwfkVT6SxE7WxXfl3ULxV2xtM1NQJNKv/1dQvarT3BVNcuNq61hpAhR133vIEdKcTaLd1mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsGUHSeJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASRjMsBB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BlkX628790
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q4sUrbxHy2pMOYEs+LSTZiBd
	Zk/ji3z+RNUVNHVIhhw=; b=UsGUHSeJ2RRCGjK/0qyLbT1eImVu4HIo3GdgngQv
	4N14c2vIsnysb2Y3QWY1Nldaza+6Vio6sS/yhBtFBbggydlR7FgBDf1h38JEWwCf
	oBhcLcmotyjpAD85dvbfFqJC1mfg2ZMg7UChjZZ8s744Ws/85yy/L4kaOl5Fjed1
	Pk7RTJCBfV6Ep1LY20BeGDWYCCh/JuVXiSOH3T/WhgJtnD2ogGKVDOn5pGHzzinC
	T1Lnt6s00KOCqhTJOFrDYO6tyLLDJAKW7Ok04nOu9SfF8fRSUC7IWySQkzP4KL6v
	txs+wUyeps5KFciBKGMw4/f8lnX0hgTF7xPHVjJ0YAbRiw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2exc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:17:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so6767397eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772698667; x=1773303467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4sUrbxHy2pMOYEs+LSTZiBdZk/ji3z+RNUVNHVIhhw=;
        b=ASRjMsBBO5YDf875rzTs51W29mVOvFIpqA5ZVolyi1771hOT2k70VZbxMN2FmXI5FW
         o6s93HD9a8F5VMmGjsc5VzSMWKs6D5G5yqzLfF71D0P5VjA4JHaIsRv3mkeBRjsN1FPT
         XoZIAVAX+HOC2Ov3+VluflAxm5sBl4iEsbzo3htu1/TlxmmGI/K0IpdQnkTYKP4Z+/yx
         /7agtyxq2w0b5BHPTQpU3Ymwwa+Kx01Qs5nqRRwbh2ZKzFInogbvOA11wc8U8LL/eHvH
         faYazYCy9a9YhwWjfZxv/+Vpi61GdeXaWr3I7UOEBMXHNi7/LV96Xvj4H+NOPQ7Bqb4o
         stHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772698667; x=1773303467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4sUrbxHy2pMOYEs+LSTZiBdZk/ji3z+RNUVNHVIhhw=;
        b=gagyjbwMpEOP6ENRAylUWbl+ISzQp5oFQK16zm3cgHDx/RY4bu2duB1yVu7K56xkcR
         1VXaFjuka1kPtDKuQq6Xh1Qco1s3oNHZSHFWwqVyRGku5JreL53M1W6NfHQj0+JFElsX
         yoD5BaO6nT4zJolMlyUxmOZqxjtukbA7YFoquV3bKLqebkRtPjXruW0u426iPGEyAlaj
         kp66ntACRLMo6uCyMU8bD9jLuTwYargGDGZu7valQRANaegAg/EIvWKlm+GKaEoTAuVe
         Gz/y3s02iKkSHqYAshgkgynl9MPWN+2mauaKeMGMauvyp8JwPsJKuVyZPKeWZ6MmiyTw
         C/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVTsbRzpYcVEWxbg6IEx8nmbpgcEfe2Bw7uM3tDvXArcsq+PU02/4p1Ff1Bp+XInR0xUyvx9wK3VXBhKEoJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1wP5+EIEwaMOJ5DhPbf+McZ8U769jtssNPRg7/RVpupfZW4P+
	8sw0pQbjZR/JQtNif6FE49nlFfxykW/hIjh85oW+CzQi7Twj7cEfnyVBMEZT8rqXKWLNjaXHJ5L
	jgOfRIJdWq8HxJDdiE3OrFMwIxPQp4QXINVpxdUbFRDLw+orDcij7fiNHJ3n9mOPN4F4g
X-Gm-Gg: ATEYQzzX5TS+muATE/B0T3cCjfiEA+nULLnKxTKPGdarwxV/sgd3X/6Sk0qZRP1rfX1
	ziRml4/DaN5jPeu4OJPQzqwwq+jKu2gKSNY4s6TI7wCAmsMf2jqmSnnFSgiabyObE2V7bKX6Bbq
	HDGVtpNnvJpaSb9XOBNRxp30U5bDoPg7IZ6wD9nGaYqN4SIMEBrvsxz77CZ6ZIynWIJxyD/i00m
	I2IG6xwA6ppayov0dQIAU3ZHEmg8CtbCIaOdXFYtju91dpnbnh2NdkR/zkToQKh+yssyo9T9FKC
	RHiklHJAZlUyaij43OBIza1xL5tX2MlFaOmnc2JJWirSHTvvXfCECw2NMq3xBszO3S8y7uA51ui
	ByBD0RuzCsTzQVqE7UC50Bl+bqyyiTwKK6u1ivLiHzsIsDIyHZmyQ5EeLCy6zvbHqepo1
X-Received: by 2002:a05:7300:72d5:b0:2b7:35c8:32cf with SMTP id 5a478bee46e88-2be311c3691mr1682126eec.28.1772698667411;
        Thu, 05 Mar 2026 00:17:47 -0800 (PST)
X-Received: by 2002:a05:7300:72d5:b0:2b7:35c8:32cf with SMTP id 5a478bee46e88-2be311c3691mr1682100eec.28.1772698666798;
        Thu, 05 Mar 2026 00:17:46 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2800c89asm4204838eec.31.2026.03.05.00.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:17:46 -0800 (PST)
Date: Thu, 5 Mar 2026 00:17:44 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Message-ID: <aak8KGKjD8/Hsndp@hu-qianyu-lv.qualcomm.com>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
 <qmtl3j7czisocywmkwgaxxuzhc6e6zzvaqmqjs5p2phcpk2q3x@rocbjxeguv4g>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qmtl3j7czisocywmkwgaxxuzhc6e6zzvaqmqjs5p2phcpk2q3x@rocbjxeguv4g>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a93c2c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=E1WQ5AqD19wTCYbunv0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: JasDiCg_rs_iyOtEFEiGb-Gnii6lbky0
X-Proofpoint-GUID: JasDiCg_rs_iyOtEFEiGb-Gnii6lbky0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2NSBTYWx0ZWRfXwwqhRs8zuGH6
 xuWYQnHFD1EyK8NfkvT3NjHe2k9Tt6M8bKLcDZ0pnxDB7g+bLqpLegBQenJjP3ceHUBcOr7Yuih
 w+8xosApsQY3PuaAvDL7/cvgLvUa+BlvPNZwALTjMDWto9o7S5uJzoHxuy31czBLsrXCaX8WAV/
 72wnGCA/MZpKYVtT2Qb8imCO33dT74avOYbZGShrS2z0ng4VlJaTP6YMju9BUosjFI3n4t+tvYL
 vJkUazIOBY0IM2tsDmdqqPiPiIiGcDFewAtnZHMQr2T0+iRGjdT2rvCWf12oRxRA4/KrKrnlXgm
 4oAeaBoFKNI9j3wxw1dOwkEmDdziuUABJ9KX/ZdAC5Q4qFvEjBocqHLJnik0NvU33j21xKkK8Vy
 NsWEgJahsGvsbnCsKc94J4prXsPJdXBuuYL1nbNpYcunusKKcjSFslCyOTvkOiqX8zYbeev9+o/
 f8MreiyPREO1eU1eNhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050065
X-Rspamd-Queue-Id: A5D7820D611
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95535-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:46:22PM -0600, Bjorn Andersson wrote:
> On Wed, Mar 04, 2026 at 12:21:56AM -0800, Qiang Yu wrote:
> > The Glymur SoC's 3rd PCIe instance supports 8-lane mode using two PHYs in
> > a bifurcated configuration. Each PHY has its own power domain (phy_gdsc)
> > that must be powered on before initialization per hardware requirements.
> > 
> > Current PHY power management assumes a single power domain per PHY,
> > preventing proper setup for this dual-PHY scenario. Add support for
> > multiple power domains by using devm_pm_domain_attach_list() to attach
> > power domains manually, while maintaining compatibility with single
> > power domain PHYs.
> > 
> > Enable runtime PM to allow power domain control when the PCIe driver
> > calls phy_power_on/phy_power_off:
> > 
> 
> Enabling runtime PM seems like a separate change that impacts all
> existing targets, while adding multiple power domains should only affect
> the specific ones.
> 
> I'm not sure if it's too picky, but it would be nice to separate this -
> so that any issues that might arise can be bisected down to one or the
> other of these two changes?

The devm_pm_domain_attach_list() function calls genpd_dev_pm_attach_by_id,
which in turn calls __genpd_dev_pm_attach() with power_on=false. This
means the attached power domains are not powered on during attachment.

> 
> > - Single power domain: QMP PHY platform device directly attaches to
> >   power domain and controls it during runtime resume/suspend
> > - Multiple power domains: devm_pm_domain_attach_list() creates virtual
> >   devices as power domain suppliers, linked to the QMP PHY platform
> >   device as consumer
> > 
> > This ensures power domains are properly attached and turned on/off
> > for both single and multiple power domain configurations.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index fed2fc9bb31108d51f88d34f3379c7744681f485..7369c291be51aa1ad7a330459dcb857f5a1988f6 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/phy/pcie.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> > @@ -3334,6 +3335,8 @@ struct qmp_pcie {
> >  
> >  	struct clk_fixed_rate pipe_clk_fixed;
> >  	struct clk_fixed_rate aux_clk_fixed;
> > +
> > +	struct dev_pm_domain_list *pd_list;
> 
> This is just an pointer to the list allocated inside
> devm_pm_domain_attach_list(), as far as I can tell you don't need to
> keep this in the qmp_pcie struct - as you're not using it anyways.

Okay, will remove this part in next version.

- Qiang Yu
> 
> Regards,
> Bjorn
> 
> >  };
> >  
> >  static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
> > @@ -5348,6 +5351,16 @@ static int qmp_pcie_probe(struct platform_device *pdev)
> >  	WARN_ON_ONCE(!qmp->cfg->pwrdn_ctrl);
> >  	WARN_ON_ONCE(!qmp->cfg->phy_status);
> >  
> > +	ret = devm_pm_domain_attach_list(dev, NULL, &qmp->pd_list);
> > +	if (ret < 0 && ret != -EEXIST) {
> > +		dev_err(dev, "Failed to attach power domain\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = devm_pm_runtime_enable(dev);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = qmp_pcie_clk_init(qmp);
> >  	if (ret)
> >  		return ret;
> > 
> > -- 
> > 2.34.1
> > 

