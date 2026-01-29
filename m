Return-Path: <linux-arm-msm+bounces-91170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF+4Dv9Me2n9DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:05:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A350EAFDE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 13:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74FA3301CC49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E3C37F0EE;
	Thu, 29 Jan 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZEpzTeJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNAaFUoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88B385516
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688316; cv=none; b=JOCvZKbiSaHNnbhTsQMUYqqRyoibtaUk16T7ZzT0/m0Uj2hTJf2f1rMxnNNYe4SbhSsy1rfqtgkfwNIOlJMbDUe+W6GM8OGKMZf0E3uxXzAEqLjP6eVoFis48TIZvTfPZ48hVL18SNsT9Ey4mLduyjrxwIVnTBIk40VijGencyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688316; c=relaxed/simple;
	bh=4mHNhaPIlb7UUmfgXn0d9AFO6TsCdw5bQkas3EfCx9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoauuhoIxFOT3V1a2M3d4uDAL/mXVha3oqrL7F+S8lzTtxm4MY1y9NY/tXQqRix3qrbNBQzrIalaDJIs6j0XgNZTQccomLvLiogenL/cFPz3n0nlB2SchcwkOYJyI6IxVJCqKYljnuDSEPfCpKSoxJikcc5AjcFFchLkyovJ4aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZEpzTeJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNAaFUoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9o6Nx2150373
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b/0YyG56TS4fQWi/QGK00uUp
	NAeNtPJ1SeJHjmGAWc0=; b=ZEpzTeJ8ApH6Cn+8KjqgBI/D3+HDhncJZqCAqyPx
	ms81Rzhs7E3B68vWBSFvnBNcH93HK7FnX29HUr2lz0L3+Pv+fJDUcthrqYI46mHR
	Zp1kXRfxnzD1ufMfVW8+rcjtgdOIh2gXyaQBI3wn1T2l6JnJ1OqULRBNYT3ryx98
	fGxsMfGBqVg9G3WLhrVInafresKNXkmYoLwVRqeltDKTmXjAPtTRUd4ebQmSjqlD
	2hs95KSycaflhBXITQyjyaKb9MWIhxHPhl+9dUof2f1B1X2M7n2lt7EQVoXLeHoF
	aDsh2QDY6ykadzw38hHg8C8YcJoXuxAZuWZDc9UIWZFS9Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3bb04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 12:05:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b708fa4093so4857655eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 04:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769688314; x=1770293114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b/0YyG56TS4fQWi/QGK00uUpNAeNtPJ1SeJHjmGAWc0=;
        b=bNAaFUoINibQs6SvVeqV+7Tf2oYvpUxhurHLn0BoMUFh4UHnGWuvJo4XVGg08yB4KW
         Fm/qKrQ/PKq76xEJa/N6TLijR33RCDCp84V+/pIGnfHtYHRxcdqrIkTtYVq39Exuq1Jy
         e5z28Lz/guOnUZisprXc0kTqdtsPW86N4XwpfUFUhQ9ePS3Z5pbbycZSrMeBUdvbM/0V
         DfnpqamW++VgV202q/mbVpR9PLFrYV0eqprKgy/2WzQ6p2WubtRuLvNaJdj33ectyDuC
         yrq4lbKzZQp7tT7eEzS3GbLZZYnD/DpwFbHlISSn0sqdTmGscnm59vRbtf4oB2ARV1Mw
         DlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688314; x=1770293114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/0YyG56TS4fQWi/QGK00uUpNAeNtPJ1SeJHjmGAWc0=;
        b=rqfjOjN/0qI6g6fzXc7QLYCqGhtsp9upmkPHyItDb1IZeHQ8HM442pUn8+ksvT/Y0U
         1E8SZdQzx5PB/14MF4Zy/17VnjUL6dYjaC1xXU7TR4yeP75WLcE2/pfHRoKb3P6jMkKC
         NzZZd7KD0itvT89loRD2T6Bx8YsAuCTxsc3Ehoq2vNftAfKLRPgwlamptIqWum++OKnw
         eUtBb6c6ZP9932XbXxPGXhX3dxqZYHZ9q+w2GYtMWxc7Exeh3sT4amN5hnTZQRiePnFA
         0fbQSKXDOAQbwrzF6/WbFGxqgm1kZENw0mZPJydxOfPWxn/SbA5+niwGXiTMK9zRoVlc
         sF1g==
X-Forwarded-Encrypted: i=1; AJvYcCV5FbJ2rr3ME47mOl+TrHFsAqh+dLJwMLjdBSSTNFeUPp7egQliefnvHRE8suj4wCCIwHH3OR8T8UQiWIwU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/qVHU2SSASGZj7WssgA7nr5t3iMz/KtJVSINx7e/5seeKqJkU
	wwwIKUEJUHSy7MBlssobx60qCYTB2byxtAo8HyK9nGpg/ShnkxjJGLJQQzxBVL2U79mD5DH2BZ5
	2C4gcEIV7E86pSaR7m6IWOpTeXX7wJ0cCTZWMXZfSZeIiIt5aFBCpd9IfpooQZTD7LTmK
X-Gm-Gg: AZuq6aJ13fgOziQ6D0ehhzv3MsWeP4B30lSrrErf1f4ZiDk+6tZx2gdJcYL3dDTBhUI
	Yqul+xHWyQuORGPwvezyfmTpqOcnA8DUhd7U6vSHBhFEZlt28WCllPFtmB5RGB0HR74sfERAPp0
	mwt4JxEZQtOVn76nXn+YZeBuU4xvD2AL9cw17F7UPxH9EwilCNXc2QIhPzwWVhAu/1P3XdVm06K
	0qyLczoRuzfs0dmKCBWdIgdOPgqCdUbE15LmGu+R/DAJdzT8rgR8sCb2hbdRvZUDsLIWDbOUUi0
	DaID5ujqXycMgZb0cjQYTCjf5BfXL3I2GP6nqflyinYq0kOxcBy7zPhmiL2/nSEscr4maARYc8P
	R2hA4oU/32QA10Txe6W656beLwGKaeeBDXG/o40OhCEvoVGbQs0cDzbsj
X-Received: by 2002:a05:7301:6086:b0:2b6:ffb9:9633 with SMTP id 5a478bee46e88-2b78d918e15mr5616989eec.15.1769688313534;
        Thu, 29 Jan 2026 04:05:13 -0800 (PST)
X-Received: by 2002:a05:7301:6086:b0:2b6:ffb9:9633 with SMTP id 5a478bee46e88-2b78d918e15mr5616946eec.15.1769688312749;
        Thu, 29 Jan 2026 04:05:12 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adc60dsm6407856eec.23.2026.01.29.04.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 04:05:12 -0800 (PST)
Date: Thu, 29 Jan 2026 04:05:10 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
Message-ID: <aXtM9vE9y73vnVeA@hu-qianyu-lv.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75lzykd37zdvrks5i2bb4zb2yzjtm25kv3hegmikndkbr772mz@w2ykff3ny45u>
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b4cfa cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=gEfo2CItAAAA:8 a=f8Cf7bV1bybJpCVOFBUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=fsdK_YakeE02zTmptMdW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mw_Pylt4U7q-8i6qGmsXrhaNUxAY4KS4
X-Proofpoint-GUID: mw_Pylt4U7q-8i6qGmsXrhaNUxAY4KS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MSBTYWx0ZWRfX1pgMdHi8czAY
 fLScQaaSp3BOwev8GDiijm6ruochcaOvUsvOs17JhW8wwWH/v9oqwSWWISY7Ex+8oDQR2/gtbPB
 pDKIyZ4yD5kSKCFE2EE2d3JL2EzKy1UgBlGIAbz9FFuVhYf3QORS1Z9v8BT3RTwPpk1m5vSkPWK
 qlzaMuSSSp1F3S5FgJdWHjuxTY8tCwPtH/ebnA6QA+30JskKru6BKyuvwU5QEynyA0dQFW3dir3
 wN9mJHgCAXtTFdpelXYh75+H1sZKHBEw33lGrFO0nEtkRyHtmEu7318mlRc96vZR0kf0P6PcCDa
 O+cgPbRJlnjNk9C/5DWxYQMTuqUH/KPljbcyjO+f3nQvbYvV9mgB3wfr8+8b0JZafl7Vl5ILhyt
 UKJ49EzKEvYFP9qMRYYwZAxPrVmzbYLeFyk823yRNCN3s+woEO6ZfpLaXW6eEwVi58JYbKdXEiw
 QQwUxP7DxfIv7jK9muw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A350EAFDE2
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 07:21:04PM -0600, Bjorn Andersson wrote:
> On Thu, Jan 22, 2026 at 08:53:57PM +0530, Pankaj Patil wrote:
> > Introduce dt-bindings and initial device tree support for Glymur,
> > Qualcomm's next-generation compute SoC and it's associated
> > Compute Reference Device (CRD) platform.
> > 
> > https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> > https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> > 
> > The base support enables booting to shell with rootfs on NVMe,
> > demonstrating functionality for PCIe and NVMe subsystems.
> > DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> > TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> > thermal management. The platform is capable of booting kernel at EL2
> > with kvm-unit tests performed on it for sanity.
> > 
> > Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
> > SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
> > 
> > For CPU compatible naming, there is one discussion which is not specific
> > to Glymur, Kaanapali and Glymur use the same Oryon cores.
> > https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
> > We've kept the "qcom,oryon" compatible
> > 
> > Features enabled in this patchset:
> > 1. NVMe storage support
> > 2. PCIe controller and PCIe PHY
> > 3. RPMH Regulators
> > 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> > 5. Interrupt controller
> > 6. TLMM (Top-Level Mode Multiplexer)
> > 7. QUP Block
> > 8. Reserved memory regions
> > 9. PMIC support with regulators
> > 10. CPU Power Domains
> > 11. TSENS (Thermal Sensors)
> > 12. DCVS: CPU DCVS with scmi perf protocol
> > 
> > Dependencies:
> > 
> > dt-bindings:
> > 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
> > 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
> > 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
> > 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
> > 
> > Linux-next based tree with Glymur patches is available at:
> > https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/b4/v6_glymur_introduction
> > 
> 
> FWIW, I applied these patches onto next-20260128 to see if things has
> improved since Rob's report and I get:
> 
> $ make qcom/glymur-crd.dtb CHECK_DTBS=1
>   DTC [C] arch/arm64/boot/dts/qcom/glymur-crd.dtb
> qcom/glymur-crd.dtb: dma-controller@800000 (qcom,glymur-gpi-dma): interrupts: [[0, 588, 4], [0, 589, 4], [0, 590, 4], [0, 591, 4], [0, 592, 4], [0, 593, 4], [0, 594, 4], [0, 595, 4], [0, 596, 4], [0, 597, 4], [0, 598, 4], [0, 599, 4], [2, 129, 4], [2, 130, 4], [2, 131, 4], [2, 132, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: dma-controller@a00000 (qcom,glymur-gpi-dma): interrupts: [[0, 279, 4], [0, 280, 4], [0, 281, 4], [0, 282, 4], [0, 283, 4], [0, 284, 4], [0, 293, 4], [0, 294, 4], [0, 295, 4], [0, 296, 4], [0, 297, 4], [0, 298, 4], [2, 124, 4], [2, 125, 4], [2, 126, 4], [2, 127, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: dma-controller@b00000 (qcom,glymur-gpi-dma): interrupts: [[2, 76, 4], [2, 77, 4], [2, 78, 4], [2, 79, 4], [2, 80, 4], [2, 81, 4], [2, 82, 4], [2, 83, 4], [2, 84, 4], [2, 85, 4], [2, 86, 4], [2, 87, 4], [2, 88, 4], [2, 89, 4], [2, 90, 4], [2, 91, 4]] is too long
>         from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): led-controller@ee00:compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> qcom/glymur-crd.dtb: pmic@1 (qcom,pmh0101): pwm:compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>         'qcom,pm8150l-lpg' was expected
>         'qcom,pm8916-pwm' was expected
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> qcom/glymur-crd.dtb: led-controller@ee00 (qcom,pmh0101-flash-led): compatible:0: 'qcom,pmh0101-flash-led' is not one of ['qcom,pm6150l-flash-led', 'qcom,pm660l-flash-led', 'qcom,pm7550-flash-led', 'qcom,pm8150c-flash-led', 'qcom,pm8150l-flash-led', 'qcom,pm8350c-flash-led', 'qcom,pm8550-flash-led', 'qcom,pmi8998-flash-led']
>         from schema $id: http://devicetree.org/schemas/leds/qcom,spmi-flash-led.yaml#
> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/led-controller@ee00: failed to match any schema with compatible: ['qcom,pmh0101-flash-led', 'qcom,spmi-flash-led']
> qcom/glymur-crd.dtb: pwm (qcom,pmh0101-pwm): compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm'] is too long
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm660l-lpg', 'qcom,pm8150b-lpg', 'qcom,pm8150l-lpg', 'qcom,pm8350c-pwm', 'qcom,pm8916-pwm', 'qcom,pm8941-lpg', 'qcom,pm8994-lpg', 'qcom,pmc8180c-lpg', 'qcom,pmi632-lpg', 'qcom,pmi8950-pwm', 'qcom,pmi8994-lpg', 'qcom,pmi8998-lpg', 'qcom,pmk8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm6150l-lpg']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8550-pwm']
>         'qcom,pmh0101-pwm' is not one of ['qcom,pm8937-pwm']
>         'qcom,pm8150l-lpg' was expected
>         'qcom,pm8916-pwm' was expected
>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
> qcom/glymur-crd.dtb: /soc@0/arbiter@c400000/spmi@c426000/pmic@1/pwm: failed to match any schema with compatible: ['qcom,pmh0101-pwm', 'qcom,pm8350c-pwm']
> 
> So, we're still missing a few dependencies.
> 
> 
> Booting the system I get a ton of errors from PCIe in the kernel log:
> 
> debugfs: 'opp:5000000' already exists in 'soc@0-1c00000.pci'
> 
> # dmesg | grep -E 'debugfs: .+ already exists' |wc -l
> 508
> 
> The system does eventually boot, and I was happy to see that we do end
> up finding the PCIe devices after all.
>
I enabled dynamic debug logs and observed that each PCIe platform device
probe was deferred approximately 10 times. The probe deferrals resulted in
additional OPP debugfs warnings being printed.

The PCIe platform device probe was deferred because the PHY driver was not
ready - either because the PHY driver was not yet loaded, or because the
PHY driver's own probe was also deferred due to its dependency (e.g.,
1fd5000.clock-controller) not being ready. This is normal behavior,
correct? I also observed that other driver probes were deferred.

But I'm not sure why there are more than 300 times probe deferrals on
your setup.

- Qiang Yu

> Regards,
> Bjorn

