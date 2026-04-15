Return-Path: <linux-arm-msm+bounces-103273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMimNnhn32lSSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:24:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CF403414
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15E3D3013797
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6DB33EAF9;
	Wed, 15 Apr 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNUySnu1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D533FE1F;
	Wed, 15 Apr 2026 10:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776248694; cv=none; b=Eo5AszHrYa1m66O43Xqm6tMRhYBuf+f8AxEC4NpEwPWrDVNSvLENlJVxJGs7W6AtIXhxvsVKGVFYY1rldNPdNaAkinE+Np4Oa1Kxzpx4xk0OCAIusLSoG6Ao6ZTumQBh+5xVjswQDRHQoMzhEJ8Yy1hedVzLClhNN3NctLiLL74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776248694; c=relaxed/simple;
	bh=o3omhYtUd7kYLOv7zgEmq8OsZq1iQeyyUd68OqMvtwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTiP0tAeMnnSEXB3gFdMBBWRaNLqkQlrm3crDNu8O5CZvbzChmudY7t563Tf8jrvq+nCLvMGUyQ5Fjz9JnCI3OM/QlFKrbZiXQyEHzgywki63RwLTs+IsAG40BVU0equTYEKFUKUFPimTFTq2+0BWPqZe3Di6oyEADRAccDbAII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNUySnu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xFvQ2772603;
	Wed, 15 Apr 2026 10:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vhupy7saDfIPCy9CP3NY1dRE
	4Ta33hb+ZXxZNnbAc0Y=; b=QNUySnu1eS3wrcaYPKU2VVX9BrK85wZtVxJto4c4
	FK4y817YZWObyWWJKEqtW/k6cnsZx042XMQJQtXZ0NixO2HAPEzpDJ8vOSkUXxKm
	uIDcxIz8Q8aQu/DZjPMx+PMkHs+XPjQ+UW7/ge7oBswLtTIVsh3l3lt4CNqzTtL1
	0+WJVIcpaNEAyTO/R/IFwLBf+42L8DnqIecYlRuSuVfAJl/+ktTlLGtt28/4op5a
	fIAd4/+xY8bwfzX1DL7u+GVUlX5nPPfdVRNCwBkiiDkHdY7AgRtWRKXSW2DUrjdg
	oxkX7XcL4l0981xYrSr59c5b91EpoDq9Mj+jk4ZNSytcFA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v0y3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 10:24:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63FAOlaV019532;
	Wed, 15 Apr 2026 10:24:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d114sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 10:24:47 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63FAOlI1019525;
	Wed, 15 Apr 2026 10:24:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63FAOkYh019524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 10:24:47 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 21801577; Wed, 15 Apr 2026 15:54:46 +0530 (+0530)
Date: Wed, 15 Apr 2026 15:54:46 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, rakesh.kota@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco-pmics: Add PON power key and
 reset inputs
Message-ID: <ad9nbsBKCLyQ0tI/@hu-kotarake-hyd.qualcomm.com>
References: <20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com>
 <0b4ac3c1-11b3-4991-83c2-0c39a81baa8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b4ac3c1-11b3-4991-83c2-0c39a81baa8f@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: VWMIfAycnuGW-169kzILGTlomxZtT5Cb
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df6772 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kmUTBoKvMs90t2vTBL0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5NSBTYWx0ZWRfXx9QiA9LsS5IY
 CDEeNQJ/qOADKikj/fq6PASM2wD6LsZIOe0by1+kvkMH+Ap4DfCOLdMAcgW2xPIWzIDTSBNWa9d
 cQqPff9Ws0fnkKFV3KtAAuWCGDccq3lsdu4XwSq8Qz9Tn3oEaWNwnqG9HGMJ2uajyEhhTakVxMo
 zB+xNlTGwni6hZcmVAmtkMqlx2tNb75bY//RDQLfDZPnyyRcEsp+5oN6Hl7WmrkslyUR71P4jc6
 DdDLdn200j7YZK0cnMzbEwQ7Nv5zvykyThglOwZH+d6dHBExl6Eo9y5QAK13hkymg9NeB19lS28
 6U5iNgynNjK1X+emHiiJ9W08aEKuMJemMjer/qkHxcVO2E509Irz/BeQWD6uECBGe+ic8NC1FNw
 upKVy/1fgxNp6zuw9hP7qOcmxyMde/fGtU8wdXs9JG38ppEYxAFfZf9a/jinlVAYECrvTtLB1Z5
 HfMxwRMZaM/tCMo+cww==
X-Proofpoint-ORIG-GUID: VWMIfAycnuGW-169kzILGTlomxZtT5Cb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150095
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103273-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,hu-kotarake-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.4.176:email];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.371];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 560CF403414
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 30, 2026 at 12:18:53PM +0100, Konrad Dybcio wrote:
> On 1/22/26 7:59 AM, Rakesh Kota wrote:
> > Add the Power On (PON) peripheral with power key and reset input
> > support for the PMM8654AU PMIC on Monaco platforms.
> > 
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> > index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..051407cd83eef8eace8521084b1ad012a5192ace 100644
> > --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> > @@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> >  
> > +		pmm8654au_0_pon: pon@1200 {
> > +			compatible = "qcom,pmk8350-pon";
> 
> I see pmm8655x has some slight changes vs pmk8350 (more configs but
> generally backwards compatible if we don't use them), let's add a
> separate compatible in bindings so that we can maybe handle these
> differences down the line:
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> index 979a377cb4ff..14b85b0d97da 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
> @@ -17,12 +17,16 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8916-pon
> -      - qcom,pm8941-pon
> -      - qcom,pms405-pon
> -      - qcom,pm8998-pon
> -      - qcom,pmk8350-pon
> +    oneOf:
> +      - enum:
> +          - qcom,pm8916-pon
> +          - qcom,pm8941-pon
> +          - qcom,pms405-pon
> +          - qcom,pm8998-pon
> +          - qcom,pmk8350-pon
> +      - items:
> +          - const: qcom,pmm8654au-pon
> +          - const: qcom,pmk8350-pon
> 

Hi Konrad,

Based on the below discussion:
https://lore.kernel.org/all/872faa80-d323-4625-ab8f-50ab2e0e8e0f@kernel.org/

I understand that introducing new compatibles without a corresponding driver
change is not acceptable per upstream community guidelines. As Krzysztof pointed out,
neew compatibles must be accompanied by the necessary driver support.

so,shall we use the old compatible in the current patch series for now ?
And Resume the patch series at https://lore.kernel.org/linux-arm-msm/9c7521fe-5008-4daa-945b-ce3f5c0f6dc0@kernel.org/
once the driver changes are ready and upstreamed ?

reagrs
Rakesh Kota
> 
> 
> Konrad

