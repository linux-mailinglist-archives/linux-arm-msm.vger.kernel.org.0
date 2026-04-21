Return-Path: <linux-arm-msm+bounces-103944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO5eFZt052lc9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:59:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A27DD43B053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EC90306EB48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFC83C457D;
	Tue, 21 Apr 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/UOdA+i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N6MAun9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4435D3D6CB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776058; cv=none; b=CpqjiXBXwnLBwOe1U7oy1AUDD3PbiqXcLqF3hHMOpAJiYEW/TN+kvz9WFXhVKn2+HcohtsdneSZbx2OoXZMFeRpKtqcCByNcx9+dzcvxnQC6jdlE/6R0C2fvFDReO1GaY5QGfM7ODAsiyka7MKb22GL41GWUqTaEf7NVOPWBeS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776058; c=relaxed/simple;
	bh=uFGmd0NgS3Gb4WO3dlidZD4uKw75wCW6ySr7In9/XnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcEsTGoDtcrPv557Eu2Nd5OAf9IYt5EhTuKpvDSP05EtDOvnKb5xNtuqjrUEZ5aIgNIK6LhwEai7vj+CjzmaD0n6UpgD4TMeugG6lLNnODV8TZCGifco09iNTKbA+IJxr2Z0Pdd7vN40erNbFTo09b2QUJyYlFv3lvcbTW/nlPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/UOdA+i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N6MAun9/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA2kQc1809742
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rvgwzwNCsr0kVCgZCO0b8Gan
	6uAfHoY1Q2EdivY2g1U=; b=F/UOdA+idDNgOsgLkGkvfkksajla126tXrb04fwe
	ThVX7Vi2+OwDb+N2DJ7J/PyUOATs6NFVIcHP9mQthJEPDy6lKOeBOmGaYNQ8T1JR
	/okemA1rpivOi5egf6aGNLgluHvnpZ9v7u6K0q9iIHttvkSV106A4yH6n0fQo44q
	21h+hEdXqx85PAgPOswsjdar4lKEpDhdTUHZg0t4P2AV9dVFhSwBkjjsNU2rJHiE
	OMWlOgFQDIpKCjxNbdYXa0BjTLeTcdqFVyXY1QRTC3uy6lskOeMk77AyvWDd5zbc
	Y5Su6Fn/p+tyng7OOY3cIZd79nh2sp1Hu9YamH93GPrKMw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp74xrgjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:54:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd1c74508cso7091944eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776776053; x=1777380853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rvgwzwNCsr0kVCgZCO0b8Gan6uAfHoY1Q2EdivY2g1U=;
        b=N6MAun9//6U1Lt7or6TLEjl5m2mtfM64Cz7z/qOr2TuSqblwtJhTB9U1h2hDwipfWz
         IeOuXxsm45mLybfecZmm/Bmpns28egEDywcIhIPnZN33/tzIElju6mhXpMwxy8/CuXCv
         K/xYGyxVpqmjakl9IT+jxNlaJwWNHjLw4qgY8TIcWFwBQz68nc1coML0kH0pv0v4UuN8
         MgkrenPWZMyRG39g3Jwl51TgJIzJJ7ySUJW/dFt5u5e16lLet8PmTRrZBZSshfGAtXjG
         iUYgcTVQNy0VCNXzgALDUySgnhS7vvPWcgH9Mc16yXmuhgro77gEgbL0BskZCBy9UYmK
         KQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776053; x=1777380853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvgwzwNCsr0kVCgZCO0b8Gan6uAfHoY1Q2EdivY2g1U=;
        b=Z90ZMFmgNB7oeJq/EUTeUh0naBogPXe1si/6VEFVv34Hj0T1XJ95dzDnubsLIjyF66
         ZGLmvHrdoLsvk/V0KA+WMO3tRHhR+E+5aHO6FiSUuLvRwJhGPteJmuwDqj/qUPpauEIl
         weSqmUZoSSLuPB92zguqMe1BZEZd3yovfg8Rw5A1wRDwdGtp7cAuc8EiOoiMnvTSoJYX
         j5VqSZ6CnDy4k3NA2k8E4VmU5ApDGSAzNDw3fybY3KMzEvzGK2xWw/D+4/PmUfXLpmxr
         6XhBgSQ8es4xDU6IzkJZ4EWosiEWa3hL23vRUul+kP2AHAdytAnQOBAvqy5z41rkKh+L
         Qolw==
X-Forwarded-Encrypted: i=1; AFNElJ9FDDydIoYtNcqo/OFo1e3ad44yW21g0IwpJkBSg2iY+QYTgvG+BYhHMJuwLi6rn+LFamfpVHHKhRs0DXCf@vger.kernel.org
X-Gm-Message-State: AOJu0YyHXVpfa5lAr0yEi8dtwzcQ1cP+yorFXhfeiqByT25VBCpzJ359
	rd7B5efkxvPVYnPsYGEXRESZOg1WSm8ZVQm2uUxgoRO86fyWcmhPkfac0In6BG2Hz/PQ9FGu9UE
	KtzYIw07FOxr8OTm4+eTLZHwUihxdJR9XCEA4T/ZnJWDBcJ9beQt+gqzQQuTSEpjQg7nz
X-Gm-Gg: AeBDieuMpOxBuNv+t/YL0QxzRk9RziZpc/lw9uQFA3tudyYgT+f04elGrmLTRbzgSxf
	/GefdXjfjnNE3gBdFPQA3IQNNg/2FXjvSwqCDjCRsEkxo+x2543lOxHbrVmuGDHyf03UcOHU9cf
	SU07v18nGW7nO6N7Ul5lSGqrV2axVvOpk+2jVVG3XcEq5iu/+6MItefzRA8ynW3Vtvu9SkYfj+7
	1oCzYUz35JOhWeIC8W6bW6WZjO3WoTa+2nSrSxcacPB6OUaiXf2Migx4U2wMTpgJ+M+97oSawZi
	pW65EjADVVd0IDa6jaNC+j3OjbfX+eMGdmSwBSgTw2ziOjTt1TdgUX9pN61YgwvfzjHrGjFO2pP
	LRfYM3agpQSBsneYVdm/dGdBtqC1EzZlpq4rQ8Z0LzNrD0Djvc0wvpHNLY3zpHSHfINBVTtU4Vx
	s=
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr8237840eec.11.1776776053040;
        Tue, 21 Apr 2026 05:54:13 -0700 (PDT)
X-Received: by 2002:a05:7300:fd09:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2e464dad10cmr8237816eec.11.1776776052469;
        Tue, 21 Apr 2026 05:54:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm18748491eec.17.2026.04.21.05.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:54:12 -0700 (PDT)
Date: Tue, 21 Apr 2026 20:54:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for Nord
Message-ID: <aedzbg6sg2t12gCJ@QCOM-aGQu4IUr3Y>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
 <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vq8Txe2n c=1 sm=1 tr=0 ts=69e77376 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6n_0llUhAYeFIU8IND8A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 6yDuyRGExrhtJ_4ci1INtr4K7E7zpnOw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEyOCBTYWx0ZWRfX/EUikKj9Tn/W
 VAoTN8ydptyrAxdc5XRh9ve1o7iDcMmTb0KFiJc36E7z30+PlG7paD2Frj1VKQb8Ch4ckRVNlTj
 pH2+UW9a7CbtLh6NvUvPCf3OXtRJw/mBhfqxYQwvC1afZNrdew+DYb733ijUEUVAGTIpA6drz/K
 Bf44aI1o0UU6EXetnIQUeQS3NSAgOzEL25cZ99ePwb18/ZsEMF22qFFz0onDDyDrtm9NCgMmHFZ
 DfDLZQ2fuDqGDYYIvPG3qziQQUmEexCDiaObxoxvZsKkHE2MnUgbbbKrYypibArlwkn06dEcROf
 hbc1bbK4EnvUvpaDqOVbo8F/VdOLVG8lR+8f5LeVrl1tKXVJb73yW5OhrRUm+Dqh6wn/yQYn4WZ
 UP7DvBI8Ip+xkDC7UToAFFiWhgrBVMx5MQMU4q22uP+PMg1U6En9zvstpTuYPRx7Z0YadfTdILV
 TuGHUk06DCJqa7kLURQ==
X-Proofpoint-ORIG-GUID: 6yDuyRGExrhtJ_4ci1INtr4K7E7zpnOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210128
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103944-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A27DD43B053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 11:21:23AM +0200, Konrad Dybcio wrote:
> On 4/20/26 9:26 AM, Shawn Guo wrote:
> > From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > 
> > Add support for PMAU0102 PMIC voltage regulators which are present on
> > Nord boards.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/regulator/qcom-rpmh-regulator.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> > index 6e4cb2871fca..9545300d7b03 100644
> > --- a/drivers/regulator/qcom-rpmh-regulator.c
> > +++ b/drivers/regulator/qcom-rpmh-regulator.c
> > @@ -1100,6 +1100,21 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
> >  	{}
> >  };
> >  
> > +static const struct rpmh_vreg_init_data pmau0102_vreg_data[] = {
> > +	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
> > +	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
> > +	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
> > +	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
> > +	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
> > +	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
> > +	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
> > +	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
> > +	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    NULL),
> > +	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    NULL),
> > +	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, NULL),
> 
> Any reason for the NULL supplies?

We thought it's fine to not model LDO supplies, as they may not always
follow PMIC.  But that might be even a good reason for modeling, so that
we can have a better DT description for the supplies.  I will change it
to:

	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),

Thanks for asking!

Shawn

