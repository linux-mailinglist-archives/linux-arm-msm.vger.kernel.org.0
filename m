Return-Path: <linux-arm-msm+bounces-104024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHfUMtJo6GlZKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E54425BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E5033037D70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6BB1F151C;
	Wed, 22 Apr 2026 06:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnA4b+hW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UakllVGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343CA22259F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776838770; cv=none; b=O4NmM0eQRlEbICEs5s6mje552h39iUaswsWthRlXFc5ApuB/W3VgDWlsflXNNmXhPV0+i6GNy4pNi7DBTda/+IzUhMEex/3XIMzNLjanOQ7yZzNrfQd3NS4kxH6iVrZkP3aUAkYH71hVhUEmBe10PhW6urcFVpm/dSt883QiLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776838770; c=relaxed/simple;
	bh=ZWJ8Ef6AbesvoB5+xOJ5iH6ZutkR4jctdzADniNUbpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bcn7n+lFQGdnbiA2M+HDOKHtnUJckbiBNueThMTSc/qrpNbAuOcNPUbu4F89FA4r2DJrYfSDTagCHQnhXIUgRGvNHIAKyb+CvwFicSMAMW81YHfxaSVbaPzvEaQFd/Ma/eVagovIc17/cipbNfxsc974+gTE/aZpw4O7KS3450k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnA4b+hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UakllVGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5KTKU2965873
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IZDqBmsRSxFLnbIPiI9lg3ef
	yggUSYIXImGxQoi+iYI=; b=jnA4b+hWcSUhbaXH28EHm7gEnsNNpTKwBUVj+XQw
	F+MMsinf8sJaWxhnCo0/lY5f6PnJPjNXkI51UHyY+nS56GxBtncGmtfoxHmi2UWb
	1+GVCnSkM964UcuXJ8j0z7K0xaVw2lIWT17BVOI5R4Cobj5YIMF7uSAdi4zDirvg
	m9bEveEHKBP1F9zvQbS8Uoilyjh2I4cnbcZC/LyaVGYG4oXTKiQXs0cPvrtzQsKe
	mfCvZhDsPTjdmwkZjTcbjbnCyxiZ03RgNKWKAq8T0s3L/lrndtWKqOplP4Idykin
	WzPS4bQx8ZoEzO9rPA4ua81K26HVsnVX4xkqZLdBLVa9Sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfhxck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:19:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso6143836eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776838768; x=1777443568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZDqBmsRSxFLnbIPiI9lg3efyggUSYIXImGxQoi+iYI=;
        b=UakllVGGAGnMI1bnp9ehUeKx9zZyXsWPy+aAcaX0tTUhlu07dLg88lmriXdaU7kR5B
         cADsrtPp1sOZejVkkm98TraYtg2a0QRgn4Gi1tmybT2Nj7E4sWaycgF+6g7WFVGbJ5Vh
         gyV4/dx7nvM+FqsXyeApSbgFIhKF34qMFS5F46RIOENpMY1mPCA6o7X0KBQRC6cE9L09
         CropoOXAGxP37D5mYG9kFRkOt+5/GeryUbVsZVhIqx/wD2IK7T/mD2hNDSIk9mqGNsgf
         mLeiII9vb/i7n2D87xl7Bf6pkT2hplkbsrT00/2NvRK9aj3PaS0ZCeReiR18dNmLoXyG
         TCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776838768; x=1777443568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZDqBmsRSxFLnbIPiI9lg3efyggUSYIXImGxQoi+iYI=;
        b=cJFXz7sArOgs6wSvCESaJaWcpJF4DXuosNuGPEAA1T/B8mTqZLg/XOhefrJuK9XCiT
         b5802OLtfSYGRt2Ia6m4UmGXnVfeabxWCiSkf+8AgP4KDrKQaQ4JrJwkmITYVPnLQyLP
         KwDuA25LiXwsQAELimtZDc42ldxvqXGEcKRoQMGFZqWffzTppXCE2MbTEnfBgC0xEuVH
         nbDdnWimjiaeo6l1Qrjqfn6to7C7WqCGWWoymbKF1LY0/qQrQIB3JNE+UYCOdPaoLSDn
         +ZGyTRVhXVRq6uNEJhddBJbGBskQSNXuxkY1eRjHgyj3o8hPkGCnIOnDZXAZPwCnTbu7
         ZS3w==
X-Forwarded-Encrypted: i=1; AFNElJ8NITZjZktiiKOO3GSzmrU8mbBUN71/UH1ctzpdN4FR4voruRkgzHFCnW5IqRoGBIiJmdko2rFN0RpyR2zC@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSf1HX71g1XscKBJxZcUB74HIYS/meIRxJd3fYpXWtnILtwh2
	f58vJ2igriibSF0u1oeWK4qOFKaa2MHu89WAsp9oXv1wr0w7cXnEmpt7GOXjBkPufO3e8G8On/Q
	/9wAo5BXip34oJ9U8qMuatdMTrwMD/oQTKclTURd8OYuLgZ1DsuhnD7ebKxllnMxrFEso
X-Gm-Gg: AeBDiesXIs2Z+KBcuiooTnOI736YvGk4xDvP6I9tnvQ2SONdfm2ydhJVoTzEhduWD8c
	HFSFcAz3ZaFYxU39zSabBJmUfsLtm+nlnAFGmUSYbsTEY0CuZEIlshV1sPgwDkSNoVTPS50gOr4
	YQrsST2Gur6hyyWLn2S5A7uhWaLbK5GLtc0uIGV9LSoo4B5kmkmiptURav6IilY8Rj9p+m1/sAR
	f1mPY1RC7LFXDR+9YCZwpUQPrkBYWTwt6HpvVErK9b0lupkjLYPE1VPKhzY4QKvq1n21ONserIa
	HeacAG2A3IwHyKCvzR7ytha04QoJKlyXUiCSHmTK89dA4SNz6TgiHeZequC44JC1Y2+zSFC3Oiy
	XtCeF//wwIVzCc0I8BqjQnDFYLp+bGrwlNQR1hYKYz+x4AQ/RJBMCtm7CHKhVrih8cXrk1wsTDF
	4QUKU=
X-Received: by 2002:a05:7300:1352:b0:2dd:6937:79c3 with SMTP id 5a478bee46e88-2e479210772mr12236271eec.25.1776838767658;
        Tue, 21 Apr 2026 23:19:27 -0700 (PDT)
X-Received: by 2002:a05:7300:1352:b0:2dd:6937:79c3 with SMTP id 5a478bee46e88-2e479210772mr12236241eec.25.1776838766937;
        Tue, 21 Apr 2026 23:19:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a80c7sm27395199eec.10.2026.04.21.23.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:19:26 -0700 (PDT)
Date: Tue, 21 Apr 2026 23:19:24 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Message-ID: <aehobKDsh3XGOmsw@hu-qianyu-lv.qualcomm.com>
References: <20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com>
 <20260412-glymur_gen5x8_phy_0413-v3-1-affcebc16b8b@oss.qualcomm.com>
 <20260415-wooden-prawn-of-lightning-dc1ddc@quoll>
 <aeBQRStG3imY0cOe@hu-qianyu-lv.qualcomm.com>
 <20260417-awesome-tacky-coot-e59a30@quoll>
 <aeXUZ1uSEJ9InUtw@hu-qianyu-lv.qualcomm.com>
 <20260420-optimistic-unnatural-stingray-80da35@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-optimistic-unnatural-stingray-80da35@quoll>
X-Authority-Analysis: v=2.4 cv=Y6rIdBeN c=1 sm=1 tr=0 ts=69e86870 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TH_F0qHjsvcmixwPkT0A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NyBTYWx0ZWRfXzlflXvnUiUgU
 McJ3BQ3qZJFfKJKdAS/d42DL/g0ifrFgtoWoBtO9avFr/Sg/+vgZbmDqjQksPnx+BWdMU2gO5a3
 nPEujGqUciNCe3Qlc/yDQ4O49IXoQCOkhHJ6qTlLKSkHyFMKcIzDuxPiAcaYYCf2/5/rPVr6CB2
 bamVhmmi6l6ozCME9OCheZyCnnXDCIo6qfhEHjlTEEJrkYWYdKy1o+QivrA3zm4LqYIzcrVIpmn
 OzEVQq5ra483ELBrjQor0xIDFEqPYlL6x/K2GDxlQj3pvkxUBKsl0Xi3MpZYUco9/1D0dbu08mC
 TEsx+LO3Qs+UYfswuRql91fE7IJyEsmC1ArGhu5BRQI8rTCfnbVecmeLqkE16qvriqw8OuwYwf5
 QV2+PuoN7nGaQav+VknCK78dQuNe/HwCYMv58P+O6RjYdg+jR3dEZx1eTzX4fDST0CccqA8K8lh
 TtU2N1b+stNyDnYm32w==
X-Proofpoint-GUID: 3k4XYlPloZ8g8jLTi_UJ7oD_aOcJWyds
X-Proofpoint-ORIG-GUID: 3k4XYlPloZ8g8jLTi_UJ7oD_aOcJWyds
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104024-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,hu-qianyu-lv.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 3B5E54425BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 03:23:43PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 12:23:19AM -0700, Qiang Yu wrote:
> > On Fri, Apr 17, 2026 at 11:18:08AM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, Apr 15, 2026 at 07:58:13PM -0700, Qiang Yu wrote:
> > > > On Wed, Apr 15, 2026 at 09:50:28AM +0200, Krzysztof Kozlowski wrote:
> > > > > On Sun, Apr 12, 2026 at 11:25:56PM -0700, Qiang Yu wrote:
> > > > > > The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:
> > > > > > 
> > > > > > 1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
> > > > > >    4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
> > > > > > 2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
> > > > > >    follower to form a single 8-lane PCIe Gen5 interface
> > > > > > 
> > > > > > In bifurcation mode, the hardware design requires controlling additional
> > > > > > resources beyond the standard pcie3a PHY configuration:
> > > > > > 
> > > > > > - pcie3b's aux_clk (phy_b_aux)
> > > > > > - pcie3b's phy_gdsc power domain
> > > > > > - pcie3b's bcr/nocsr reset
> > > > > > 
> > > > > > Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
> > > > > > 8-lane bifurcation configuration.
> > > > > 
> > > > > Do you describe PCI3A or PCI3B or something combined PCI3?
> > > > 
> > > > I describe a single x8 PHY with resources from both the pcie3a and pcie3b
> > > > PHY blocks for x8 operation.
> > > > 
> > > > > 
> > > > > > 
> > > > > > The phy_b_aux clock is used as the 6th clock instead of pipediv2,
> > > > > > requiring the clock-names enum to be extended to support both
> > > > > > [phy_b_aux, pipediv2] options at index 5. This follows the existing
> > > > > > pattern used for [rchng, refgen] clocks at index 3.
> > > > > > 
> > > > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > > > ---
> > > > > >  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 53 ++++++++++++++++++----
> > > > > >  1 file changed, 45 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > > index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..14eba5d705b1956c1bb00cc8c95171ed6488299b 100644
> > > > > > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> > > > > > @@ -18,6 +18,7 @@ properties:
> > > > > >      enum:
> > > > > >        - qcom,glymur-qmp-gen4x2-pcie-phy
> > > > > >        - qcom,glymur-qmp-gen5x4-pcie-phy
> > > > > > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > > > > 
> > > > > That's the same device as 5x4, no? One device, one compatible and this
> > > > > suggests you will have three PCI phys in the DT - two 5x4 and one 5x8?
> > > > > 
> > > > 
> > > > It is not the same as the 5x4 PHY. In DT, we model three PHY nodes:
> > > > phy_3a (1x4), phy_3b (1x4), and a separate phy_1x8 node for x8 mode.
> > > 
> > > OK, that's what I wanted to hear. And that's what should not be done,
> > > 
> > > You should not have a separate node for the same hardware. First, DTC
> > > will give you a W=1 warning, although warning itself should be moved to
> > > W=2.
> > > 
> > > Second, the warning tells important story - same hardware is described
> > > twice.
> > > 
> > > You only need phy_3a and phy_3b, so only two in total.
> > 
> > We can keep only phy_3a and phy_3b, but still add new compatible
> > qcom,glymur-qmp-gen5x8-pcie-phy in binding, right?
> > 
> > For boards that support pcie3a(1x4) + pcie3b(1x4), DTS would be:
> > 
> > pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> > pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> > 
> > For boards that support 1x8, we would override pcie3a_phy with:
> > 
> > pcie3a_phy { compatible = "qcom,glymur-qmp-gen5x8-pcie-phy"; /* additional resources */ };
> > pcie3b_phy { compatible = "qcom,glymur-qmp-gen5x4-pcie-phy"; };
> > 
> > This still uses only two PHY nodes and DTC will not report warning.
> 
> IMO, you do not need another compatible. Device is exactly the same. If
> wiring on the board differs, e.g. you have 8x instead of 4x, you:
> 1. disable unused 3B phy.
> 2. Add to 3A missing resources or the phandle to companion node.
> 
> At least that is what I tought till now, when I opened the HPG/manual
> for Glymur phy.  Someone skipped important information when PCIe PHY was
> upstreamed first and glymur.dtsi already got PHY 3B described.
> 
> Reminder: writing bindings asks you explicitly to post COMPLETE
> bindings.
> 
> If you posted COMPLETE bindings we would question all this and you would
> have to check in user manual that this is actually ONE device.
> 
> There is no 5x4 phy 3A and 3B, at least HPG is pretty clear here.

PHY_A and PHY_B are two sub PHYs that can act independently. I thought we
can describe them. And for previous target eg Hamoa, we also descibed like
this.

> 
> And you should start with that.
> 
> But you posted first incomplete binding, hiding the rest and now you
> have 5x4 merged into DTSI.
> 
> So let's rephrase based on manual:
> You have only one PCIE phy3. Not 3A + 3B. That one phy3 can be
> configured by consumers (board) differently, e.g. by requesting 8-lane
> or twice 4-lane phys.
> 
> Let me send correction note for glymur.dtsi.
> 

So we can have only one compatible "qcom,glymur-qmp-gen5x8-pcie-phy" and
one phy dts node?

- Qiang Yu

> Best regards,
> Krzysztof
> 

