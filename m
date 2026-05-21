Return-Path: <linux-arm-msm+bounces-108979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIh5IYHNDmpoCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:16:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DC5A2181
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6079131669D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4A5364941;
	Thu, 21 May 2026 08:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0aSMIMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR40Xbpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E657363C50
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353893; cv=none; b=XUTGsKW+GCSqvolswjGVTOkn0tuUQfHsqRo8bBMsgvjtP8hOydNxpRPFVwXEZSPCqSbf1CPvw9W71ivwuxZ/K+P1J9dXBkLQf/rV3RQ4GEpirxFKzzyOMS9WN1ICyzY0OHFHraU9xl7m8aDAzgvwIc9jDaT6FYZQsnOzcRZQkyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353893; c=relaxed/simple;
	bh=6XFUb3/twcNZ1CNboKAKsiYfNaaeTtaB26fJ9eMVTos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smEQdhtaOL8uzFf0Mp4IOondmz/uG7jRO/+ifQ4A3y2GDJe7hJXvKcYSDMmboCwEv9PUQfFWC7rSxWp1hV2KL5E7RZDMC+z1qcPCoPkB0KJdzKkUeeHc4rSz+27KMvyWY06+dODARo3nnJSd2XlPkOV7dJPWUWpmIXeW2x/D3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0aSMIMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR40Xbpr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L72Wg13049749
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2ELpQpiGiJmyB1W7gZ91Qyf
	Imdf5eHSJna1tTboEro=; b=W0aSMIMGBzj/Q8Mkn2hZIP881oKHONBLx14IWXwU
	ds4xuRwwqaIAPzjMiMCL/UHunajKCHBV0IthvtZippoJkxnlWY8e7Rd7UdZAl+/W
	te+/iH3Ao8rNihNXTVtzAKi42pJoCkMg4Cnqp1g42qA/qUCTV69tbP6y0EqXUJUz
	PIFj337xHX8p7P8DAlIen58haO+e01eMWZl9twwE2a//C89OZsYwEXl9NDXrXuAy
	y9Ym/aJHk5A7STYHCsyxbGV/9OIJXTgfXCvB3SYq6UzBJt/iCyPAKIOkHgOA0Odm
	C281/CJLihMjzVWvh2jRBPrrlJi9D4wWXB8TWNsY8fhXMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrf8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:58:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso183264961cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353891; x=1779958691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2ELpQpiGiJmyB1W7gZ91QyfImdf5eHSJna1tTboEro=;
        b=GR40Xbpr9zVHsL2hkznTbzHccry1Q8AjEYc++/vXjWsdkp9ZKhav0ZJ1FUVsI5Ynos
         vG31Hwo/stuu1kAItCQ4H40oHGE9tiQd6j/24CpOVXREHv/EbihR9Ij0GzJQLz71nLcR
         EMnoKTXz6RMmcvFxZeJeUAOcky7tMH6zE5E5M64Qt/YM3L9cZpM2b3OSVvp5EHQ6otzB
         omfALbtK+2EkLlPUiV7Dmcwb+tdmcNoORK63TBiXM/hc+S7qYQ3LsDsrozp8aVSvXuAh
         fbl/yW+X8vUkKDRz0A8kSE9Lls0rMBrV/c5/VGSuHMn6A+nVQtCyUf8fpZlBCwA0RvbZ
         qaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353891; x=1779958691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2ELpQpiGiJmyB1W7gZ91QyfImdf5eHSJna1tTboEro=;
        b=qP1TwcsiqpUYtrWEtAN19otfvifXqV6dODl8wl+jqm5Uum6leX8CI9XexeleojgPu1
         mwI/FsofBw6lfNft5ewbUyyZH2L3lmYbuC8h92PzBm/t4oKppOlQPIfXYSirwLbaCWL4
         +w37cZQETl16vQAGvDDmieua5OdcH5VVqzCQ6ejSF3a41+CmVnLohEx7zUh3fgXDihms
         EvztBwlPWLnqn1QX7IPVjphEvewhU28W2agvTbk3DGRwdc1Xh53/PlapGc/HVb5lno67
         aGsDizjEXUWLOwPOTekBoyn5kq68AQ+1JA19tlANouJsjZa8DQyD9AKflKzM0+Cu0A7M
         2sMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/N7wZDzeSYah2iauzkoCRXDre/7QX2wG9fOwMXBuNSnon4M91IkYdn/V16euQJShbpDHfN1lRX0P6g5U13@vger.kernel.org
X-Gm-Message-State: AOJu0YymrOi/ptlir0Pkp9+uu1jZ2gv4FXU5WDwwDoP6d/jvlMRscuhr
	F+kcuXgVLfYi3DVJNuZzRTTequ0mySNSHZ4EU+W1Pf5/RTv3X1Jbv+fhFa2eW87nW3ZviUL2m8G
	NpHoLzyIyH0AHBM7Mek7jBm+KtcSj5nR5HzVIQTEGbHGauwHMEb8jU1G/phEUuFK18wFk
X-Gm-Gg: Acq92OFFPnp7gR/0DSfOUgUHB5jwlOVCutT9SU6atmDTWc9uBmN3whwZ0wyv/TQE3F6
	udtjLHyvsIPrw1verUIMFxy5snLw7AR2RPnDbpIJq83i/P/q6hFvt31wrCk6LRZ6xp+U7d5vALf
	KBm5GmwdLGXM0hs44RydGjUwM5dz/bWVytrnX6NaPCr6B8/iGvvaop8GPSm+buggtRasiPQdHsg
	f/mXFU0D0f+5NpeVtTYpWgqG8DL1BMbSAdVXbjmIS7ipuhJ+ASuHDHAylZu2KHBXQYHZ1VWSxoS
	sXSONsFtY4X/UMgrgDJTK2wGpkrTph8jYEMDzM4BMrO709F0gVqS7l48EyaFyE4xfo9GbvNG9IY
	d7ZExlyTA+t7HSk6K5gr2hjjKNP2ic5FT33U=
X-Received: by 2002:ac8:5e0f:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-516c555a206mr25643681cf.31.1779353890756;
        Thu, 21 May 2026 01:58:10 -0700 (PDT)
X-Received: by 2002:ac8:5e0f:0:b0:50f:b3d2:6ee1 with SMTP id d75a77b69052e-516c555a206mr25643271cf.31.1779353889971;
        Thu, 21 May 2026 01:58:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7da46esm1333971f8f.14.2026.05.21.01.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:58:09 -0700 (PDT)
Date: Thu, 21 May 2026 11:58:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: eliza: Fix debug UART and add
 more support
Message-ID: <c4lsfgomgq2fia7vigfftx264yqzqfypvc3rvsbqzj3o2727rz@pvf5cbmjjxih>
References: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-eliza-dts-fix-debug-uart-and-more-support-v2-0-5ad3da81b9d3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfX3XjhGVnHSDjB
 DZr9SLyGZhCyYcW0hfCedfPTxfRNHKr4IkWPYEvDIpQkIkBzqY9BGUaG2GH76dLWfFqv7xpTBdg
 TpyT7+AnTdVuhDYLsnOhOjnvQinQ5iQRxE9zhHMJbqkzdfsPP1Du+Re+sN8S3wqDozEW7mToDOH
 su5gESuvSNm5nmWW92rkNqOtn3LtQ0W+4thcSY+zHdo/87PjB8TYcGGpbq72YsQRdp8+8xgTpOz
 qHyLsi+EeuXsnB351WDUeJU2nZh4jkx4mImHJm9ocbJ47P4WURIppkIFP7UjX30/wf73syFfvLs
 7pecXXc48X5kvQbFrL0pWLRDeh8MVzaQ19erviU9uF+r80cKe+EP9MhfmuLD32owygACmArPDsG
 LEEgCpODBLE2+TvGxgO/wILYv+JeCWckP1FEi0ssdADUlzOKNJ6570C2pgaZ1nrvQ9Mfp6Dap0K
 6KN8faI9Nq9YT6Q2PGw==
X-Proofpoint-ORIG-GUID: TkZrbnEi96gIbGaUjniJxjNReCj5fPqN
X-Proofpoint-GUID: TkZrbnEi96gIbGaUjniJxjNReCj5fPqN
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ec923 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mi2VHuaznWBw4ReCaL0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210087
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108979-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 397DC5A2181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-05-15 16:22:37, Abel Vesa wrote:
> Fix the Eliza MTP debug UART index and then add the missing
> QUPv3 WRAP1/WRAP2 serial engines, the matching GPI DMA controllers,
> SDHCI controllers, their pinconf state and the LLCC system cache
> controller.
> 
> This series depends on the following Eliza binding updates:
> https://lore.kernel.org/all/20260513-eliza-llcc-v2-1-27381ae833d5@oss.qualcomm.com/
> https://lore.kernel.org/all/20260515-eliza-gpi-dma-v2-1-1255b43d5ca9@oss.qualcomm.com/
> https://lore.kernel.org/all/20260513-eliza-bindings-sdhci-v1-1-b2cae44163c1@oss.qualcomm.com/
> https://lore.kernel.org/all/20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-phy-eusb2-v2-1-fa3a1fd65ab1@oss.qualcomm.com/
> https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-1-ebb630de0dcf@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-aoss-v2-1-c3628ca79a25@oss.qualcomm.com/
> https://lore.kernel.org/all/20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com/
> 
> It also depends on the following patchset in order to build successfully:
> https://lore.kernel.org/all/20260515-eliza-tlmm-group-qup1-se4-lanes-v2-2-ebb630de0dcf@oss.qualcomm.com/

This is the wrong link. It actually depends on:
https://lore.kernel.org/all/20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-1-b1edf81bac3b@oss.qualcomm.com/

But it is already in -next.

