Return-Path: <linux-arm-msm+bounces-95538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDVcDi5AqWkJ3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:34:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B88220D81C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DBBB3044820
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 08:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D81372B30;
	Thu,  5 Mar 2026 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xd4JtwtL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWvEexZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0190338586
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699664; cv=none; b=JUDSO/w6T3BE+glWOR4PiCxe628OULW8RCNHlfZPybdaf/JdmQhJGAUH0HCYdV7CWTembWZO13vY+5o7XrWECXpTzr/jb2+A9D260RaJio23YE8HikldE97q478DyBjeEUszrTXMsRNISdPsZpAv3f2exob7HBa2x1/hq6FImjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699664; c=relaxed/simple;
	bh=qr6zoGpigiCrwF/a4fQHKsyKh9SZlnx7pJ/wJx0PE9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pxin0V/gabKS/cf07vP5mUHQy4Jq4+sN5bVqZ2m0u1nkIONZQWsgqCgOeTWfiQusNg2sCymUVjcEkj44B5+ArL7vklGMR0t2U3vC9+2F7X2D+q23Ww/FjUUpM+q5fcVE0WCFvVtKxG7/+Vau9nppx04aedZkg5A2GcSo1rYfjoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xd4JtwtL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWvEexZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251CGPT3473705
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 08:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xgPF5mrXZiRtnuYdJWQCtfN2
	u5HZVuJy0vAXYlPlAEM=; b=Xd4JtwtLdHzJNx6jwgBDma8S08pljO+QZUHBC5ZU
	oBa6fw9UUF4CjKhDiOiaoFw0jCQ/k5lt97vvbXQGLy0+N+WHz3df9hETcqCiRD/e
	yJDwcU55Vh9oqqlcMjQjCja5Uj5VpYlRVYVHxo0a5c54Klog7JsSGHIJa+eiNUQS
	c81N9RMtl0vOhjKnqy3GYjrWS51eYTPPlm5gi4JtlrQnUSRPWQiOwZe2v4r3yIot
	b2Mu8LSteGMnC2WXfsefE3LCDTH61OWvP1mXN8lxXcdj56ZDyUluSlwJQGpRNp6D
	+MOlsaOeK/L2K87hDA/ZNRraAqfT+8BSuQbXcJAfMm4vnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj183xg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 08:34:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be07cafe1cso60196133eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699661; x=1773304461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xgPF5mrXZiRtnuYdJWQCtfN2u5HZVuJy0vAXYlPlAEM=;
        b=OWvEexZKoxhzndTkwFLHuKj1kmzlF79Aj4RlBRvZ9PyY+LwAOm2EsjhM8xsYw8BX0J
         0Ap4RsEiI8ymWjr/O0lledSOxIe6SzOBUKjoaH5pCsqT/d859jOInG4OErF05pMQOp3F
         tugz5DwL7tU3H8C2L/m4PrcgXaWXo0eU1U54/plj2QZp3OPt+F1x30AxH4GV6+zrucvE
         BDZpu1l4N6fxSegpZTvT1PKwGNrv67y8KZ6J20kb242EwrB/Gf50whSfDmqo1sZdv1fH
         ridZwPKsI19nQPObSfnr5fiQEaYZlLaeR4k+FiSMMU4pjaOsph0ATCy73NdxkcgDwx59
         BNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699661; x=1773304461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgPF5mrXZiRtnuYdJWQCtfN2u5HZVuJy0vAXYlPlAEM=;
        b=dpEIoofSoeRf94kBUpKio9ipT8n5gbTFTfAp+4w00dYHnBupEUR2Ite0Ek733HHdDb
         9vMpsWNohqVlPGUG0YySx2E4+rCm5MFtCZRq47wizk9dgypLzb6ee7h9x8ACTe7wMGk9
         A5Wf3fd2mmE+EsVZP+R7/Jb/9TKwGn4i1i264I0CP1kvigL0bbkscHw98EOSePyfVRAK
         0LI/YU1ccFTbQWFhAN/K7IqW9+WpgCTxlc7V3V52pR35T4oSUQ2MU40KGh+7CQ3GmmCL
         icpZ7Aa833ZnfXVeRP61MHsGK1s+JOMdBY0ZhEtCp3K0WBCaNht1UZeCPP+RdH8l5Y8k
         6Fkg==
X-Forwarded-Encrypted: i=1; AJvYcCV+jkQ+NJP+jTB/4RtDAfSOZ+0vo0dmb+HXZl5XYMozqSKWWdA1mVI7BDn7CtrUXniHfjK8sT1puOkMej8p@vger.kernel.org
X-Gm-Message-State: AOJu0YwajuDvItE7SUccHZy6G32018N5cjQix9j1ndHt5jEw8h6dbvbM
	ZbK0OpyP1DNqCNf6YHw/a1erQQL4EM29YuCyOkC4tC3aw8sV6AxcTWOBUf4Izqw2fKp3oQjQjnw
	Fu1gwPn+KCRc6K5pJtzWZc8SzRrTejYnucvcgps9AwE/fH4ipaS++PX7IeTp1pYGA3InH
X-Gm-Gg: ATEYQzxxviDa1VhUwTYIezDSmtaccI7p0tYZKPm5+qZy4n33XDHf8fxgPMyLcOjhyZV
	0SuaSJQpGttK7VXFRgipWgcuEhtyeJeK0t8PjiGO4wdzZSrcFM1R7XRAT9nLIE5+tC6tCuY5FQC
	7eQeksrOwrh2TrrKAfEOmclcoBihKefKrAqM+viF/FWDTcBYYytKVuTXy0/myoPMHqh1WOO2pB+
	pjLV/TxmtUn2XrQRMaRCjiJppUGah1ZITVzdd0ZcVoQqAcj+TiopRM9tkhPvkRxCrgtWGE8yROy
	nlMNhF8j5+ch7h13yIm6ZEG82yjoQBuCbJ8rqLiL6w5JcMpyqFEdJ0vjLC8s2I4+YbV8d8ZjmNb
	7BPAgJvOfKsqvaxht9L4p00UpfdlL5mD4AO7Y+t/0/9FOCJyBcYJtj7GxBGFylvRaFt7f
X-Received: by 2002:a05:7300:6c1f:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be30fbca17mr2208194eec.1.1772699661068;
        Thu, 05 Mar 2026 00:34:21 -0800 (PST)
X-Received: by 2002:a05:7300:6c1f:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2be30fbca17mr2208177eec.1.1772699660514;
        Thu, 05 Mar 2026 00:34:20 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1281ff70sm9670998eec.14.2026.03.05.00.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:34:20 -0800 (PST)
Date: Thu, 5 Mar 2026 00:34:18 -0800
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
Subject: Re: [PATCH 2/5] phy: qcom: qmp-pcie: Add multiple power-domains
 support
Message-ID: <aalACsSBWtiMYacx@hu-qianyu-lv.qualcomm.com>
References: <20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com>
 <20260304-glymur_gen5x8_phy-v1-2-849e9a72e125@oss.qualcomm.com>
 <duny3mu3vx75m5ik7xkqotdajomkpj5udg7x2gcyj6pho2ybv7@w3q3pru35p45>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <duny3mu3vx75m5ik7xkqotdajomkpj5udg7x2gcyj6pho2ybv7@w3q3pru35p45>
X-Proofpoint-GUID: I05ZO6vbnhTYuNDkrhXWlWwgJWR4Q6Ye
X-Proofpoint-ORIG-GUID: I05ZO6vbnhTYuNDkrhXWlWwgJWR4Q6Ye
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a9400e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-udo5FGDkBk8TPX1unEA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2NyBTYWx0ZWRfX1daMV846lmtW
 rjYBlFRgaIyGHJsHP6UfW8hWx4pIzhR9S9suHnzAy2dWiWrqVccs+VUOkC7C+GkCPIyAFUrhqK3
 ZKyGm9UuRVpztk+BVAfMplWRfhR0MdvauUdKhv7Clf+sbhLFoGvYc37XyCZr+tOrj68Xvy4LWzP
 7ppQqxGwxfrGaVdXIWr50IHK3ibW+omM6Qub+DzXT4YxxsVqgENQOmVHuDkh4EXNXUBX3yM9kHY
 C7ihf4k4WuEYfQDCbIH4MDus7AzcC68DPtFNuHEBkAcppenQ/DE4DJeffInbYB9Rai99UVirkXb
 hxEPYntLVx7qoNv+nlFfvA8MPsWmYLtn95T+0ZTt7oaM38UQ2nYWilgZ89xOniTHe2fTv6pgwAt
 y5kuOs+7JTE4YBS6B7GkDkIHr/RpG+MKOKrkRhpCPn7tLpEvCBjlOYpoy5u5rXDNfkT5EZOUuZh
 9B4Idfr5MrRiWfF0J7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050067
X-Rspamd-Queue-Id: 7B88220D81C
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
	TAGGED_FROM(0.00)[bounces-95538-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
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

On Thu, Mar 05, 2026 at 01:58:34AM +0200, Dmitry Baryshkov wrote:
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
> 
> These two should be separate commits.

IIUC, dev_pm_domain_attach_list doesn't turn on power domian during
attaching, which is different to dev_pm_domain_attach called in
platform_probe for single power domain.

- Qiang Yu
> 
> > +
> >  	ret = qmp_pcie_clk_init(qmp);
> >  	if (ret)
> >  		return ret;
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry

