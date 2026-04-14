Return-Path: <linux-arm-msm+bounces-103061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCpfGKDt3WlLlQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:32:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDC13F6AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95937300DDC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B9B37DEB6;
	Tue, 14 Apr 2026 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6JKWFAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXorfyqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E7333ADAC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151623; cv=none; b=uVRuD3RS3Pm9J7wa8GocoqpniL3dMm4WJg66/jS/JdKH+imGCRDgqjKEvXUH+upNWj3D+BNMIXZlDrgcqvylIV7TyCwdAN/s85bhBuYPb+fUG/zzksA8/BLXU9eXkidV3HLnlx+Hu3ntiopvNb16mhU44wUsMb3wZOTtEUuMaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151623; c=relaxed/simple;
	bh=VlOPumkEPe6xgDVYpZcw7DU1aGOMfsdrGmOGQW7lkY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8jaiw3NFdwcNt/3+Ht7AZoU6iiCKFqOD10LL6DcbDfYWTGLSmG2lu8BJa4UUYK9QbksV2xllIv6cqfs1psC10xAEbzjI5CWwMBsWgnO5Pw1hFhQojsEYHmePD+4i455csrZ0fE+kKlBTq1xq9sra19/OzvDiVVSM+SReJpEVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6JKWFAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXorfyqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6d3s62510011
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Fh/Xh8l/oeNuFIZkbzGwlje
	L3nLi+plIjkSOdRxDHg=; b=S6JKWFAEa35g3mpWwBvpeSgFt11psAcwIviIGOn7
	RD80oKxQXNCzODxVb1mZSO8MZiJnXkRTnxv6vJjUUx/G9M5xh2XRyB64Ul8y76q+
	mTj6fdu+zj2kIxnxX0K3FLHH/Rv5Gan3gRuFBd+HXc/JYyRZ/tndQz/eZMsVV+vY
	uensluLylC9MtDkz4CnYD/7le4VgMLn+23yVCMCDjWK4PkIkqueUrYP+cdrk3lm4
	Vm+sVVG9QRT28Ajgomqe9OtFOqNrwFPGzam+DY8b1hRMe6AjWy9dHK/OiAWJ8Z9B
	XJ2ub9MivQ0h6vopXb2WxnbvhkiKXh3xBbHDhcsyfGTAsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867shec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 07:27:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a77f807e4so5400203b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776151620; x=1776756420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Fh/Xh8l/oeNuFIZkbzGwljeL3nLi+plIjkSOdRxDHg=;
        b=FXorfyqb/KiGIcTWrjK42DZKGHrp82Jf1b/mS8gKSRIG5NdbFhNYkmsq6QnRmzGFFS
         KfQrDWkLE1fxgI7WWQDdEKrpP//Avo4fj9cKo8VCI3RRYDTwt/ID917x4YI6FV9l1LCS
         tKqT3hRqUnlSfEul0QTeJ8wLA1uuiJ8Rp5wBPTygFALUBJFBoRck8yl3ZFWdh4TiReDQ
         7o9SS6eVtsvGDfCKi6JuDrq0ZPivAVeYBpzgGG/DHh94Sc/2PsCa1DJY63+m9OAQg6uY
         nekiHIyKFZ9DOTR2vhKVbykBXn9vjKZ0Ex6hWs2XhgKIqa0FNZoe4YMOmJjhM+tZZamI
         akag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776151620; x=1776756420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Fh/Xh8l/oeNuFIZkbzGwljeL3nLi+plIjkSOdRxDHg=;
        b=AIH8I1kG0DiuRtkzTL5WTqv98LW2xPCCO2orf5upESDje820MnPK9XKHL+D5XqPQQs
         1HdSyB+xCCaz/yz35eFJEk8ODV2c6+yD6gWLRfscMe6moPCOAzOJm0TA0ZpWbVJNioEZ
         DVqQEputcmpeXZUyzK3TegBWsE9cWGUc474F8e9CgML3qTjUVYnojNdyDrSTz55A2KzV
         gzQLeF8lCLD0hL/AAAWBiCS762wx5Dsc8wsGG1Ngs3yIr/wV2Dc0C7bOKkKFaFwIAOk9
         X5F9DPwS8Kb1M6PDe5oEPrtEkgVpndjns7xPA1lgZ71MdH7KZcTcNjTBxtUhmfvGzktP
         hSzA==
X-Forwarded-Encrypted: i=1; AFNElJ/9ZL8tI96dLHzEGiCrCnwud4QHD+ov+69+OYYkqo4Bu4RqqAfHiKq2li6ebHfvAM5hyy2+uyHKbUt/Tne3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1WHLDjmTcp72LXoxCseu+2LdDGrpMLFgsSbFXMNEhCs91cSx
	zD26AaUKbBFiYZcEMGrGZPzOtkdePy6jn1f3iv5A1DfGoUNQqt0o4Ey7LTeouSysP4HQXFmV9N6
	RRhVtv2nv1kOIew4N2Hb1feP4wf4RQOeXBY69Q0ieud6tAFI5X30nrrgGVkDrqXCcLpEX
X-Gm-Gg: AeBDieuorSNH/6T79JI/E3unVv3/XdGa2h87A9oOjKNDxnOjG2Pa7mKyIGYomK9vQKN
	CSIPCskkAbGISKXtroSFaTwHLa9tqEDTNQErs8oYkvIFL+hlblfye1Efw35Z6I2X242w9faCx9a
	BNSInm64mET9TkMoOEZkMT1nq4CR1qtBJf2noHiC72nrycGfqqov65l7J473xLDcva+Gx9sXe7O
	EyGhdfOOilZ9JrmkrCmxyw6tDJTRkamBwgs5I1qh60v7SEwmTMQHfuObs9YTLzlF6SGAXnoG/el
	uftGvKUFdxl5UD9UEnX88v87T1uN1+MRTGuZ+UVT6ACyCYvV97bzCvbzM0BMx14d7uCClAD+/bv
	lhoU8Ms/EzhHIVQeEXu5vvZtKYKrxPjK5CeV4n5ZpmypxN/7G
X-Received: by 2002:a05:6a00:2d84:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-82f3a1e58fdmr7479891b3a.22.1776151619807;
        Tue, 14 Apr 2026 00:26:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d84:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-82f3a1e58fdmr7479857b3a.22.1776151619250;
        Tue, 14 Apr 2026 00:26:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30e5f1sm14297189b3a.11.2026.04.14.00.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 00:26:58 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:56:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/35] dt-bindings: qcom,pdc: Tighten reg to single APSS
 DRV region
Message-ID: <20260414072652.yfedude6lvqltcsm@hu-mojha-hyd.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-2-mukesh.ojha@oss.qualcomm.com>
 <20260413-delectable-fair-nautilus-ccabcc@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-delectable-fair-nautilus-ccabcc@quoll>
X-Proofpoint-ORIG-GUID: dNciR9nsMn2Svajz68OjZDB74WfjFRUz
X-Proofpoint-GUID: dNciR9nsMn2Svajz68OjZDB74WfjFRUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2NiBTYWx0ZWRfX31kxHXTp1INS
 AR7aYHFxCo2LNFHHrdEy8GF/oPJOiy0HbqsJ/qOsNHMdsVzidqHOBzM1jr6TFpeYyAdmR9ZYP/m
 DEQVOXSeitAUYLrunTS2MmtrzakWu9/gWkbht0bSsl5Jzg8Bh13PDcqyHIv878iUALjb208DS75
 YsGZxJ2TX+Fd+AVbXXujDUsJxqsgizpJMO0rS6p1XAERiWo3mpIfud8te4UXrm5OFpjyYu4QSWl
 x+ogGpqw2LP4/OlKzltjRi78ZFp/zz2YXkVGN+6773Nm0UnrviLFPOl56sfkRKMfDC6COhg1Cfv
 XjEPtO5TK5rVZ/g8vphaDU2EoQnC0dTRYBLMQSKTkKQMn5snpc0jRKY9PVDBoW3eDWOVBOsLb7Z
 oqu+TEafAw26G20tOKmv1gp8dI5JD9iJlx1xa6EG7fa4jVmKjTCvHthBo9SqCb9pOl3qD5ep/XX
 HGubXlnRBA8+h/9yTmA==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddec44 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pElVEfBAvB5jv3hcb-wA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140066
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103061-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DDC13F6AB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:10:15AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Apr 11, 2026 at 12:10:38AM +0530, Mukesh Ojha wrote:
> > The PDC has multiple DRV regions, each sized 0x10000, where each region
> 
> Here and in subject - add "example". You are not tightening anything
> relevant. This is just an example, it can contain whatever "reg" value.
> It's nice that value is real and correct, but now your subject creates
> impression you are actually fixing something relevant, but in fact it
> has zero impact.

Ack, will fix the subject or if this patch is not useful, can drop it ?

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

