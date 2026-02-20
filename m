Return-Path: <linux-arm-msm+bounces-93533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OdCDwCpmGmvKgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 19:33:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C731416A13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 19:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 22CD4300D4C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 18:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1328436605D;
	Fri, 20 Feb 2026 18:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9Y5cBt/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oe2SscA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F223C4F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 18:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612414; cv=none; b=rTSSn7fvAIplIUcX8aJVk2tWLIQbabnDFwayonP8DeHVIQTRijlv0TdgDx/xSPAenzSolcNapbiy84x76/J5PgEZzcEv5FjOurrss/DRXo0FIm/8wuxe69Ygcbq8ko6TxCM3q9TBxM+aGGeUi5/UZNdRHEzNFyl86o3P140HlKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612414; c=relaxed/simple;
	bh=LFvspGi/tDefWyw+nsksXELhmNOcoI/OtvzWfss2OOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep/ttEfrCX+KwCjB9klbG1cay8dxH+UWaGfgT0Qidqnx7o+/MT4ykVI7i/gjCy3s9/Fi51g5VIxxZgQd1n1Frtb0MP9Q+cG5hKQAMRjY54FgsBY/8/ROO4zzEluX033kYfHjZ4qzjmehX9Bj5HmHbcipWLXGjZAR5Mfoc4b+KY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9Y5cBt/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oe2SscA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KFwn3Z3699734
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 18:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DM3O2EdgdrNeeO/4bZRoyWeS
	ODIoky6PAKkJTTshZjw=; b=J9Y5cBt/7J7mlj7jpYs6s8gGoguW2AA49oAxLVmr
	HdEGpQV8GmUhi/vrLhSiO12jiG3dXR9xB2wFJ2OQ+22gsPzLwtPBhWE5g249N9Y0
	RFMz4fTXLVSvMU57Mrqk8hlAUSBX+XQ0xqWFfTTVEXfaC2Q7ImGYs6a5NT1GmE4k
	jCsX5ID/2DYKqBe1K0/jcNo7Q1UptWyHrlvd0seaMuYdvJwxdge4+uZ/8ex01G/V
	YZ3egvophfiFES2fQM8hyHdmPwlsbjJXgXOFTgpoxNRMuE+bzz1AootW/TBcehxx
	15yIIFV7CbLdTpZ99S7qpz2uhrc91DtTInUKS6rx3b2cow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jj0db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 18:33:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89467edcd21so325324566d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771612411; x=1772217211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DM3O2EdgdrNeeO/4bZRoyWeSODIoky6PAKkJTTshZjw=;
        b=Oe2SscA402aLuPJCvjo+HoxVe3kXrOVjLEQgRjz8Px90qWfX+35AfyB47eK/dGlr+N
         8P6ypQmFDTAhVdVWcRb0XW1nxlfG2Jk0cKC5HgXCfGNvU7ct0Y1wMU5n487KHkK23qG2
         bE+qcKxeidrogS38F9YZvtz21BWLGnf3JKExufcpye0GBw5/+fcgxJikb4TqJets5+BY
         ISSqq10BqbtoK4hUoa5bBCuflDXsRcAbCDc5QrNfLpRjBbqT6BV2U55rxHXy5c0RZIcz
         SH6gZj3fU06yT5Q5W+KFyMwSKAOKIJ6wQlhQsp8bGPFPgBfzm19fbP3djkX2kTK0kvgc
         8CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771612411; x=1772217211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DM3O2EdgdrNeeO/4bZRoyWeSODIoky6PAKkJTTshZjw=;
        b=LT8AZYVOuHDlXeUH3JQpShdSdI16Guv3x5cyxQlngerzlsUwfAQ8zbIgdnOtyTluDN
         Sh+yB/SK6mbQPqVNw+/pFU3f5Fu/gEJCj+hpgqyntrmP7d5xmzLXNhPLQY+H7iWeUt2V
         1alz43ItjyAIZstFE3LHlvorcmEAlx4E+mOn3VKhoJGJIExu3TwyZvkCBpLC2CRLPO7U
         VpXaOnoEbaPNY0QW+aHCAAliPdWaIhtBnUDdYOO95ztPvalxCWwiYbz+WwluzPU5ud2F
         zz7gehuep0r2nhl/JUnI6ObYfRclBnqzyK4YwKBo6CaJSBq/Sul7ToB04YB7CeghUVwd
         57yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrEwwEttiUHOdjK2078Y3fj6GBY9keWkQivYpA3PoiekOo6UsIpmHXA+c++8sZimS0cXUPclLC2jymNgMg@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoqBl0X89rk1bcG9QeM4KAfBC0S7DfaVgbd9iFwFucY16Dzc9
	0J2PIPVCCysiA8b+Vy2C5B4YvOyol1NXyowmD5C9/Z4r27myLuSNc0xV3lvK99DyAkAntFbmhjo
	Niq/0O2N7J/aUUIgkHgGp+gYt1/b2NWQvqUVNaddH7pDuprT/kIjUVVLQj3Tk1PM7MxVf
X-Gm-Gg: AZuq6aIk943JPzYzf1feANQssF6RqBkJe2z1jWCqsh1Q04dij8q6bYsf8TUG5LX0FR2
	hk4cLeNK+cQt7Lc6/y4xyiNXuc5mHubO3OKbhdGFpPQMoGgEr9KANhWqt0PjS3VEiAUxz++WeQf
	mMZ6chbNuZxwMVYuN0DYDXP9SuFovKQ/UAPQDPA1ImtMSnnDuXS7t7LIKd6EIWEyswfHhgPwlbR
	+LYW+ipMokRicNvjnRJSmH67iDW+uMUcmO6LqhyALG36quHtu0JVb61dOR2qpJEvgBfgGTMvsbO
	VHWowMzt5sN8Vo93Us5XrE4yga1V+MHtaVVP1usCrKN+unEVtjlW8CjBZfJsdf4674JFXk2DykY
	uGOLAIwWpJrWhE1vRJk5kpH7cCogUsAXCeamSifUFHnfAHHQk0vdjFdp2VclVK4N0KoNHVUVd74
	haJhZLFM4plGvjEQOyVG634w5HKk+yX7FPloo=
X-Received: by 2002:a05:620a:4627:b0:8c7:f79:bd7d with SMTP id af79cd13be357-8cb8ca7e3d6mr66616685a.62.1771612411175;
        Fri, 20 Feb 2026 10:33:31 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8c7:f79:bd7d with SMTP id af79cd13be357-8cb8ca7e3d6mr66612685a.62.1771612410668;
        Fri, 20 Feb 2026 10:33:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f570709sm6201805e87.41.2026.02.20.10.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:33:29 -0800 (PST)
Date: Fri, 20 Feb 2026 20:33:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: Add device tree and enable clocks for
 Glymur
Message-ID: <wfn6e44uohxgcvs6z2kx4mqbq3hyhoispdqugwvr2hinsbwkmy@o72xvfw7medk>
References: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-glymur_mmcc_dt_config-v1-0-e0e2f43a32af@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=6998a8fb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xYJxznMSnqBdsboExPsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE1NiBTYWx0ZWRfX8JnT48kjy+BT
 tkt122/xqr1VnsXOKqS+gykWP0ZXO/rALhIAUmzVzGohy0WXA8Sp9cySp6n3ek/rnqHLEOq9HnV
 NcoF7F3f45aAqk5MoUYUtReTX1xZH69IEfnrO0vEIdkNjtJib7l/cB05gyrbbVjUkqU0PMFFp2b
 t6F20K3McnkpDJrrGzAiniNVrE90ay5yNS4I27DZbqiO4/ekS8ettNUZl49/sWeAOWXCvYFnd7X
 7F35XBfW1Jo317uhWb+TWRbueXkcXTK/ZmrpJ2RW4ewWKsBUpXc4bE+izpDsj7yooiMbnmV//5u
 e3LcSyKsGuNQE6cjy4sSeg1Rb7D3WUImHTVlkONCxFdU8IhzCkAjIyjiyqB/UviLOWpq7Q7sadu
 ImY+n78HRTwXI+BYy38yR9OJmn0CQYojL5+FG1KDGhigA6t+XAWEFe8M6MmFgN3STqhOUhACaUV
 n1vaT87e/6tehGOPyWg==
X-Proofpoint-GUID: QyrEDwuUfp3-rGEMGGzMwLEAttAGY8td
X-Proofpoint-ORIG-GUID: QyrEDwuUfp3-rGEMGGzMwLEAttAGY8td
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_02,2026-02-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93533-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C731416A13F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 03:46:56PM +0530, Taniya Das wrote:
> Add the Video clock controller and GPU/GX clock controllers for Glymur.
> Enable the clock controllers for Glymur CRD boards.
> 
> Dependencies(Glymur DT):
> https://lore.kernel.org/all/20260219-upstream_v3_glymur_introduction-v8-0-8ce4e489ebb6@oss.qualcomm.com/
> 
> Video Clock controller:
> https://lore.kernel.org/all/20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com/
> 
> GPU clock controller:
> https://lore.kernel.org/all/20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com/
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Nit: the subject for the cover letter is misleading.


-- 
With best wishes
Dmitry

