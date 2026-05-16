Return-Path: <linux-arm-msm+bounces-107998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9gYsKt9RCGq4jQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:15:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5C55B685
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 13:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B18DF30087EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE293D5656;
	Sat, 16 May 2026 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgyPtbhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7VX1NfS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A635A3D47DD
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778930139; cv=none; b=sYVepb320yo8h5wyW2tz+CO2sUf3oiyJSJSlJ4eZRYAvseeXbtKXhDuEi8axKApqNvCyBkPJJ58VH7TrYaCBazbLhUy3sANwBv+Keq3p0FFUQ9IYe3KgDfxZQiseSq54KxqXeL9mBOZNqlRl7Ds7VMGXRUb8a7l90e6iui2bDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778930139; c=relaxed/simple;
	bh=h6TiMIw6ffg0MD2ukyCED/lkvFtHTR493oVJXc5NIC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSsSnbUn+DChW66HCwOdOsZMxHN8oPAwaLmYx3wSlxP4QvbpOvK2VUsBrUqzogeF9uKOwAdaeW/uoKDh5T0FXOX6iZRS1n+0nUPg8Cf5LezJSFKVjk1wI+WPixA+CHEtSK3tesiMTlPFgfVlRAlIUzrtBJnrsHRHw0obREIJ7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgyPtbhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7VX1NfS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3n8mx3269592
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vfGZR2NQ7loseczJC3X8TovR
	tXW5i8l1FMHSYkU5UAw=; b=OgyPtbhhYHWwvZEyPwh+7+OBXDCXHElNIS4lYBqb
	FxIyHddNkYMs34Nmml2iKgsTjOLcw2G4io3Ji9/DlFK7YPhoEx5dMUcvH1sDZJhv
	J4FYH+6gPngG8qAqPIUZRO4LPMr7ECV1eDXt9dGDHRNVGj5bmVc1Mu95PX6QvhG3
	d5UthjmW/FlDaa1cXN7i1GFII6IM0YrdII2GxLxfipRAZCMlBnvU2rf4An5k0B4E
	mWfLf5EL7pou8H/EapNOxs998l4RpANYSYsDS5G+xTn9+5CqWebxNtXJf5hssZvs
	8CGw6Prmwy45AKF29rH/y8pCpDuwHT0lOQhgLuWCoTU3Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g0q94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 11:15:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90d7b3406b2so213147285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 04:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778930136; x=1779534936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfGZR2NQ7loseczJC3X8TovRtXW5i8l1FMHSYkU5UAw=;
        b=i7VX1NfSqEpaSigHXsf6LWm9K098GeIWD23p3I5J89dzkmc5Sq4fl9poMaZVESsAiu
         A+l3AejcDWfzhlP4E9yRJeNz76JaDT0gnrxRkPX7f9npZD4TyUl10HvSReu/81wn3BAl
         U14nQSxcL9wdL1JYpzsKPENWkhbyEst6TFSDWOHCgoTG66XqCjyiSPPVpmDNPAtnV7gV
         Ka77ZY7NQKQWZDGWzHJFFe9orZOYgKmyct/5JGv2WL7JHO9skFckIUEPY74qelnevqQA
         TU1L+5BGutQSCHxePCp0+tjIoUd2leHtae9csReLriaTz3UyywOWQHaQ2grBB+cETagD
         FTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778930136; x=1779534936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfGZR2NQ7loseczJC3X8TovRtXW5i8l1FMHSYkU5UAw=;
        b=anAqvfwVecf+FtS6haYE9jvIztd6+d3IxOEZ8/WR334CrGU5nSFCbSplGryAcOyTMj
         qtPrm7MqLP/HE0nTIx83iw+E0PjP5E3TfSq8JmfTM99Z9GRxDi0DirtWns3SFgDAWZNo
         EDS3ir6DTe+ruUcgRHSEMEzbwIwG+1ZQTpr6JrusbifNk4ZYgbD0tSvWrKI/eFmkyoUk
         YbKFutGwNeS4J9s5LVdCl0ZiGHy3OYLXPQrRn5/hbhrXFMd+v0wWMpoEuJGgdKopMq/C
         w6KffFW4Zp9mmMjUW/C8maKKCr6xVKl9Fb6JbEHTpgF8u35HFAih1+wmVGYiWrEKxA7P
         cFyw==
X-Forwarded-Encrypted: i=1; AFNElJ/dnl/YN6PsLhRIhh/azukvMY/TYh+UxOY1MNu1TxyAUjc1j7+0GNn4mEsoc7k6ha9Gqq7djBCQDyu8bZXz@vger.kernel.org
X-Gm-Message-State: AOJu0YxvG5E3XmU8BKfYtz17fxwBrMA6ei/fo2S8ywe06m/WjpNYFLlu
	RlclVEcnKjPqC1RheTJpH9lTUgazLo5rTHSsjkn1ft6Vw56CgNZwlrIwI75ey/sM1QptNiQONVH
	LhY3ljZgzivI7OV/fNN4FU6vr9l8V8z3hxpJBhARi+HVjuLKPzSsNDxhMYpWVYX/EgNcZ
X-Gm-Gg: Acq92OHkesz3/pXg/Oka3pBwOGrozsTcW1pcFZm0xB5epr2//AuFjUull9UZDBPjnYb
	bOfBfniYztfCa3t0VIi7An1Sx5pCr4A5XLExR5696zcAYCMfQaysaEGCkoqiZE9LnZMJByNTLgL
	k4CmPEyZ/YtZGdKk/g1iYpOV8EypyZafXR9XOQpHJD2fGJNLhTDlT9FZuaf745mo+aDQeaEAaeS
	sVTOebADB31u2WZONFXacZaHvfKIGI9turJq+YheBjPn7WcconIEa19ygajl2Bu4DzDuv3oZIDK
	1uUIx5/X5bnol0tMr3EdkPoR+l1aLs3DsFszUHKKLTsVUhfn5JMFC9X+HtUHc0t60OY/ZfWyWnf
	W4xhBP32GxNCDCcgDCcsDFqQLhhVIoeUlNEU=
X-Received: by 2002:ac8:5fd2:0:b0:50e:60d7:b272 with SMTP id d75a77b69052e-5165a1ec436mr116729341cf.41.1778930135725;
        Sat, 16 May 2026 04:15:35 -0700 (PDT)
X-Received: by 2002:ac8:5fd2:0:b0:50e:60d7:b272 with SMTP id d75a77b69052e-5165a1ec436mr116728711cf.41.1778930135133;
        Sat, 16 May 2026 04:15:35 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm19598825f8f.15.2026.05.16.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:15:33 -0700 (PDT)
Date: Sat, 16 May 2026 14:15:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Message-ID: <zkiuqa5u5e72np7vkv64cngx3szrm43bl4q6lvi6ywnqqwt7ev@okrdnmbcvysr>
References: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
 <20260516-sheep-of-radical-popularity-d0cdc5@quoll>
 <mxgc3iogd2z5m44xffvqc23cdg4mregw73vslujcdr3ff5hyvi@zqgseqplhoey>
 <daa10a6e-7122-4133-9040-2a5de204283e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa10a6e-7122-4133-9040-2a5de204283e@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDExMCBTYWx0ZWRfX7crqfK/2QgBr
 qV9OWkWl7DplHctTg0KILqyfaffgUDGbok1mbhSK1A/RIw161mEgI3TogS/s5hdPhRCyNVySPOh
 n5Tdoigi1GJfnJzl4JMOzCvQtwPgpFlknte3cb0XVq4DUY/6gIC6hCVCpl+M1EuCLGGiJUUZXJr
 7qLmXcKTf79IzRMsvpJ19pUvQ6SEMVIpenQQd2aoTfCwdZXm6m0kLWaIiVSn3L7U1qYIiOKQ2I0
 4N8/95pqdIniapV2phXASy/tStGSHJ1dJFzfc+MjGNC1vmJ/9Hc1YSCT8bpMph+Y7raP+3UBjJ8
 X+J8mjwoPXirStTz4+FkqnPp0phyEsyZhnFV/E9WVaExkXONodQyHu+/lxRmZ29WfT+RTII8Lwb
 59PFfYwQVvFijepIvS5e8K7w8BPmpWsrAYoNvyITP0SWEHKwdThq0b5BXhURt7A3MlKPgYD2fxB
 f4msJM8/eSkLmKr478Q==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0851d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=21epgW_-x8FTEKUuaMAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DMutbveS_eLYxpG2ZbaiyiROsfyx2_9R
X-Proofpoint-ORIG-GUID: DMutbveS_eLYxpG2ZbaiyiROsfyx2_9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160110
X-Rspamd-Queue-Id: 48A5C55B685
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107998-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-16 12:30:41, Krzysztof Kozlowski wrote:
> On 16/05/2026 12:27, Abel Vesa wrote:
> > On 26-05-16 11:58:56, Krzysztof Kozlowski wrote:
> >> On Fri, May 15, 2026 at 02:13:31PM +0300, Abel Vesa wrote:
> >>> Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
> >>> boards. Both boards are built from a base board paired with a SoM which
> >>> is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
> >>> LPDDR, eMMC and UFS.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>> index 2741c07e9f41..28a18254b4b7 100644
> >>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>> @@ -63,6 +63,8 @@ properties:
> >>>  
> >>>        - items:
> >>>            - enum:
> >>> +              - qcom,eliza-cqm-evk
> >>> +              - qcom,eliza-cqs-evk
> >>
> >> When we talked privately, I asked to mirror Shikra approach. But you did
> >> not - it's different from what Shikra sent.
> > 
> > Because I think it is wrong to describe the SoM since it can't be used
> > without a base board. Listing SoMs is useless, IMO. But maybe I'm wrong.
> > 
> > So my reason for doing this is basically reducing the list to only
> > describe entire setups: MTP, CQM EVK and CQS EVK. No SoMs.
> 
> That's really unique statement. All or most of other vendors, including
> the most popular for SoMs - NXP, use it. But of course existing practice
> is not the sole reason.
> 
> The reason is that it is the same useful as having SoC compatible. You
> cannot use SoC without base board, then why do you have SoC compatible?
> To allow quirks for the SoC. And here to allow quirks for the SoM, since
> it is a dedicated and specific hardware component.

Yeah, makes sense.

