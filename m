Return-Path: <linux-arm-msm+bounces-104297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cElQFKQB6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:25:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA334513E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A7C930058E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E323E8673;
	Thu, 23 Apr 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T72AYGGF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRgtJvp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2B83E717E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943522; cv=none; b=OVPndVrw7OwGyIq1qlUPTK0jSjMIv6lVC6mmcELwMUPlRFbvcEpeBNzw55NRG2mXDhTYHGczxHty51ZROhpAUdwR+xS07G72CC5wfTYlhO+ySL3s4MaYPlL5V9qCl30eCaPcIRg0sG+Sw1LS7mzEOPe0ex2D97Dm8vbhwI6HWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943522; c=relaxed/simple;
	bh=3e/Bukqld3/AhQcxvSC4Dm1DjhyBv1SR72paHIoNeH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDzTMsxHjuebCHpXkX9GDzKYlNaOJknlBXLdpMzmfM9EOEA1yIaxFxA4X8DvORqGNHkvnUtXUMfio3nFOi26pxoRhKPJrmGhuamB5quCcG5rkoUm6EFiv+P9HPgeC7xMp5+uLQlijxlVLfwhKQ9ohbjcJBtx/VEmCNKzLVZjtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T72AYGGF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRgtJvp/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u4KD3769008
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kG3o5KtIoxE/ghJwc3oea4PG
	h8esBtSee1qVGzcAX0I=; b=T72AYGGFpOClFeIfc2rDVXqOeRjVq76g7cGCoAGE
	IGCvjE2ZksdMdeq44l4r6BfOE5lnCJlauAX6CHxNaod3uDiUT/gdGHQwedpyoFF8
	fFkKQnEzSDcCDOWsCRVNQcyhGDjky1v4/rDbG5HaBA0+zyqxhQRcxcChfzvyFclN
	eqkdimN4Ew9/OqjbVexY7G7Z8NhMucQXm/3nCCyZuqOSj98jTIkPjjoDItyjhkyp
	RlN+BPU+ngSjKiL0Byz/938gPI2z35v4LH28b0HBs3JXCtpEuHNZOqb0wZGAIv5N
	bfzRC/KWd/1Fuw31qkGgyaif1OgPWro6Z/H1zJw1c/wpgw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq3jxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:25:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so6779515eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943519; x=1777548319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kG3o5KtIoxE/ghJwc3oea4PGh8esBtSee1qVGzcAX0I=;
        b=cRgtJvp/PCoxbNK7grmtQLHB8b7fr7tkK4m3mOAxq5Fh/cEzwizC/InEZ+3xXL7Z02
         XBdD9jzn4FSWZFii58QLS/kEDhC73wy77E8DLmCY+sbDX/0r/pXt25quGmAq/jcvSesD
         07FsicFRuZmpasffavpZwUXBgcm7EWID5mPQvngc+QNQfbD7U22/Xk+KLvUwYU91YdCh
         YErvdeRXWDFy6TnTZ0laulpzm7pd3G0DKy8K6Pfv3CDjXkWpCXXkd7NKIimbvGAvNb9Z
         lnKsuGNnfwF6vrbla4ulBQ5KLGtPWzx/Gyy01I2RvBUt+MT/Tjqg5cA/dDFcCHWd4WMZ
         SvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943519; x=1777548319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kG3o5KtIoxE/ghJwc3oea4PGh8esBtSee1qVGzcAX0I=;
        b=QMFbaBKkP4S5dFhSNrOlMWhPoeWX4tIFq7Us5mbOq203gWyZIXB4qYmou+8DNOryx/
         PVE4sL0KgIS6/zUakm9QcGyOPrQ9PysFV1Mba0XyCPCmitzBq4N5PC4CxmXuMxk1d0Yu
         1oiYGSEl9blOHkuIKzzEFdBegfRUuTEtcoVNHC/TSuhCxMKDO/uYkoxuNXgkU/RoBMbI
         ilzMtPR+9gXJQPG4972RYU8TDOCBkqsmvA3njbBc/o8tvZ1ysbqc7UVjqji3kslQ7F2G
         255vgEmcv1s5zHG3jLPdtN721B4+tRNXbO7iX/hpE6EYfHf+rLX9Kgb2eDMraVll3egH
         wstw==
X-Forwarded-Encrypted: i=1; AFNElJ8sJ6YP6YL+QsWhEOT0Gb0J17JMJNRUOf3zwSsfCOGYAvG5Z5EGn8KVrqRflEv13V77J2+K6Nc9eViLlI+y@vger.kernel.org
X-Gm-Message-State: AOJu0YxtsVP0lsI4WkOkOqD/Nr3S5JWkntIaarJ8MbTI2MRJ03oHZCLY
	AKne/tIY9Fv6QlI6d2I232G2vyxXlYK8p1vRY7TQBC2W14WTYuX4rXOavmIGTW/8YWh/NFNiJKU
	cUGXWTE+ZN9T/Q7DvpEJI00XqNGXFyR+EhAN/XVg46/df0RKgntoR3iQ6egy/NIyym/2J
X-Gm-Gg: AeBDieuadyy2nKoz8Ku55gdhv34vTF+c/CsqqMOMTnU5CUwmfe1FxdWQ1yWB16dwdE0
	JVYhahy0Gd3cvB8KOehJN5+gIoEshzg05RowyigF3vT+gTkzbbcH41fKoWExYbqtnJba8mGu+X/
	I9SFEQmtdMK657gqD9Mno4X+LsaJ+BJJACpdbbMZk/RPil94N+6Meh6e9cehQSlCScYPkEJNoqo
	QMP+tZYWGcPqAdN6jxhsKykHNxVuPLncHhpSGlKs4y+ciwlUYExIxS2CddOWU0tvd6oqNmC2b6k
	nhkHAWJdehGy51ttV9uF9gLi7VNX4PNTZCFoI7N1hX3fEkjtHly2we+iINoLOlhBK1hoebo9MiZ
	zygDICd+srf48StjCZCjXD0XH47MmWkjpLAdUmUMt8IyFSPupUz9KgA1glj5hArx4aNduEChSrZ
	/ywgbL6w==
X-Received: by 2002:a05:7300:d706:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2e479d07dcamr16549656eec.20.1776943518983;
        Thu, 23 Apr 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a05:7300:d706:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2e479d07dcamr16549631eec.20.1776943518396;
        Thu, 23 Apr 2026 04:25:18 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53dcb487bsm27489855eec.31.2026.04.23.04.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:25:18 -0700 (PDT)
Date: Thu, 23 Apr 2026 04:25:16 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arch: arm64: boot: dts: qcom: add IMEM and PIL
 regions for glymur
Message-ID: <aeoBnJ0ddy6dxhw2@hu-anancv-lv.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-2-8fe0f20ad9fd@oss.qualcomm.com>
 <f087dfbc-ec6a-44f9-a119-2255f49d4bc4@oss.qualcomm.com>
 <aedHuu3Ouro5jPcj@hu-anancv-lv.qualcomm.com>
 <77111d7c-4f18-4c6b-a3fd-b5e2981939dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77111d7c-4f18-4c6b-a3fd-b5e2981939dd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMiBTYWx0ZWRfX3cJLUfG9gXHh
 dzF12Fv3xJRzZj4zlF9JWt7Mm4ncDCVdBmG9ahDELk4VEtxxhg3JuEkCpW7VQw9fwIheIVSY1p5
 9KmAdOKZmehmw4fhgoz/TvJ9Q+m5NCYwtS67ISKke7TB7UbVkKfpFYyBPEmd6znVbAA6CP68NNU
 +NI02a+J6wUssYMjk3Zqj7hjK5vB6sVXzOfntWehlWGNOUH580wkjrfLkjrbDgB0GVJNy7JZ6Ic
 McFyaNBvUmhcPsPaFZSyBcwLdvT7PHt1GAn8PUWDtyNbskQTsSTpA90dyOBiuhDlT+fm6fnPRxS
 yLSQNvBn+mmOyCLRk/gFMhsQtlnSR6WTsTjQ2kEtlwJeNVq3fIe/bpy9NRxWnxkQg7BZT3jAEVQ
 gUZlt9T2DNaQap2BpEZo8sqSxdJQZkaN1qHUJD55bMvnsK4RX5N7R+7jnhdn27jwdcuf9zbDosv
 S06BP2xEAEvPT/RJJLA==
X-Proofpoint-ORIG-GUID: I6WVz3QlFxh0J7uAceQxAZjoaHG75Oam
X-Proofpoint-GUID: I6WVz3QlFxh0J7uAceQxAZjoaHG75Oam
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea01a0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UrVpMDgfXf5DSJTZeJIA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-anancv-lv.qualcomm.com:mid,0.223.255.192:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104297-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCA334513E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 01:07:46PM +0200, Konrad Dybcio wrote:
> On 4/21/26 11:47 AM, Ananthu C V wrote:
> > Hi Konrad,
> > 
> > On Wed, Apr 08, 2026 at 11:42:14AM +0200, Konrad Dybcio wrote:
> >> On 3/27/26 11:24 AM, Ananthu C V wrote:
> >>> Add an IMEM on glymur which falls back to mmio-sram and define the
> >>> PIL relocation info region as its child, for post mortem tools to
> >>> locate the loaded remoteprocs.
> >>>
> >>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
> >>>  1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> index 4886e87ebd49..21ae05f0ee17 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> >>> @@ -6457,6 +6457,22 @@ rx-pins {
> >>>  			};
> >>>  		};
> >>>  
> >>> +		sram@14680000 {
> >>> +			compatible = "qcom,glymur-imem", "mmio-sram";
> >>> +			reg = <0x0 0x14680000 0x0 0x1000>;
> >>> +			ranges = <0 0 0x14680000 0x1000>;
> >>
> >> size=0x2c_000
> > 
> > on glymur the imem region is a 4kb region of size 0x1000.
> 
> No.. that's the "shared" slice of it

Indeed, I missed out on mentioning the "shared" word. The size of the whole
imem region is indeed 0x2c_000. I used kaanapali, which only mentions the
shared imem region, as a reference before. I'll make a revision to reflect
the whole imem region size. Thanks for the review.

Best,
Ananthu

