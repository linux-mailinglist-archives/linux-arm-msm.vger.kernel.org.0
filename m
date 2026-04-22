Return-Path: <linux-arm-msm+bounces-104010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE7bOtsy6GmeGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:30:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B807441758
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 04:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 039EA307D4CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 02:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D674034846E;
	Wed, 22 Apr 2026 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpEQTx/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Br1lHTot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2EB33688E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776824717; cv=none; b=MICjmfNGjwzTiMO1mKT7cnWNloDBJgQYWz0J9zz0UeSibbAVB4iL27dwLahwhqPEacBMP4Z2ItQWUh/r81IQ3cW4ITtsVtKYLSk/XfrdA3x79HbG+VgZ0/I8OptIwbjbM5lk8ZtRotL7QiHgwcTrhO5nkrHeNu+DHwsCk7vSYPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776824717; c=relaxed/simple;
	bh=vxvUnp6NUYUAW3Nvyx17vcJF3c6FCDDzqctMBoOPfwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmcuAsXnmpiPXbLnSJe9plBjcdGnJw5IiSTMjgP3ZgFZ2U4vChnmd7ZMHE3iewIfIex0llR2FzfKY2J4fn4Bqdhzn3eqZy23/Cv8VKJ5tfy+xd3B5hUsZKjQsV0LEd2LxddipGxNwZ6RhcQIPtf5+ki8nq82rUG40wUHs3W3/fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpEQTx/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Br1lHTot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIZkWM2000979
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t6onLGBT5Y19GIecCruwVrTD
	w4sZhZvJCOdzHqpw2Nk=; b=ZpEQTx/shxB/ORFYPVqHmq3LYqinhCtnE8uMxVeI
	a66TIx2936NYduAsqQ7Mgupm5HECbn+HgSjO0OYUOjhHYz2vhl7DgzN0wk15sQgg
	gqS5EwAvRQ1SmTRi5fAbD42zFUle8gWJJiu75YzzjYrXds74AuYV5AHk+KHWTXEK
	iRbjad8dvJv68r2Q+wkLOpO8qgc2qDY1cOumAQqtDBLrMRdLfLcq7tgYR/teCiJx
	3U5iyLhkC0ijhLKfLXrT4fb4eWj6zBIGRX6kAz7rgOLuTQ5VI9F1GGgSzkWWBN+v
	dG6U6eg1xcsGV+I5o8pzcj9prHtQj/bcDE1A+2tPaqVddQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenf99j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:25:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2d8c521be48so3942259eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776824710; x=1777429510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6onLGBT5Y19GIecCruwVrTDw4sZhZvJCOdzHqpw2Nk=;
        b=Br1lHTotaAi9HiU3S/AEGj1sv1SZ0DnKqECY44anUe+/oHWYOGt8nMuH6rQxu89QOL
         qPx/jKC11aN7dmeAJokWFvm4lrrfP0dQMEUVc3+e1tKIA1z0du8unQ1O4QgwLfAEyssk
         DcORrEtAy1m0Oq6P/J9dFz/UcWMe2/AkbiFCLTRU3mKV8PG8ocw9yDCsEXAG0v68Ahfi
         dR8Z/asn+F7Ep80kX1YPs2J8sEz3YIgQmxUmG9blMHqS+T7wW2RDQDoQte2zb1Zqwzkl
         XpAlU0Z0GkMcOIdcM7EKkSHqseeXwciiX5QYVLy+ukEfpY64+TmbeScsJawfVNYYwsbE
         KlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776824710; x=1777429510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6onLGBT5Y19GIecCruwVrTDw4sZhZvJCOdzHqpw2Nk=;
        b=e7XEY0pl/pRQW2d9zF6HMkxtohJYn9qT+9F+au6Y2wO+jZn4jM+rpIzaWZUcWi9xLm
         nOn+cpeU9Yw6T7eoVf527DXDfEke1+7BKYLRqrEIBqbPipLm8G0Dn2kNwy5zvBt4vyHn
         vOBOEJpDcJG0jWQg23n+tvLXPhpgMce/jg9uvjOeQ3ofriuFkhM09xNV+nPk0nrqmkaF
         1LfVSIt2NUnYvgufoRBMWQk5ZPS+4B652QftkLX0p6dkH1a/+IXJWaGAUDgxINrwxmLS
         tvuJxXZnQwzjnlY9tZ5NQ/UNJMNc98KfSkUxj/fiiVJlxYRIUFToAPHTGhViRMO3jq/b
         0NKA==
X-Forwarded-Encrypted: i=1; AFNElJ/T2XGWy3QFKso2BNalZWVjwrWUaZ1Be2p0nNAeHEE8u0DDvF13SJLYYbKluZN9QTHp3bfqThqwTQdgqev7@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9Aj04SiCcZq5d0PlaPFFsjtXc8JW9bpGekszbiCs/lTz8LyC
	n2S52sr60ETMO6f5FuwetWkFMiR1CrrrnWYtaTQNnAA9aETh5IP8KR9ErpYGFhebdLDOQGD2AVP
	q3lWPVCh5f+O5u5M15QTAlM4FyqdXs350rsUEZORXvquL+3dIPPS1dlao4ftoYlNaqSRG
X-Gm-Gg: AeBDievgyAFzmOT26DZq78chbRn4fVnVgk62tkGb67LNDUdFBjiGaVR2GsqDxgOspc5
	Z33dceu7diTInYozli59KX9E738AL6VppV7nP0QXhaq3/O16vAJaVkorXrhuiKrv8unJu2C+3cS
	XcA68eDlnAFzmjZqFa39lzzDaLIJbaiCKjY5VmBLBatW9oOZB+BFY2ypKqCq2dC58q+JHhMpG7W
	URZbRplaIS4OsNAjskJFeFACwAWG2GK8VBBUgUoCsf08K7vclVDAIdiA9sV6V8oes8bFNMq/WNd
	+PSImE+Al71x7qFYVvRDfIyxYf5C5TFdckDw1aerT5qCQFe77lySK69vNwRQApWFypwmxpdBScb
	L1C8852yk+KJAa08akDr+9KSYHlbSGZvjoXABfYrDi+fY0Nwxivs/2SKQWBHcK4F0qUXPOcyqUD
	0=
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr8837255c88.1.1776824709822;
        Tue, 21 Apr 2026 19:25:09 -0700 (PDT)
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr8837242c88.1.1776824709277;
        Tue, 21 Apr 2026 19:25:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c831d5b29sm21142754c88.8.2026.04.21.19.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:25:08 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:25:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <aegxfxPKE0CGnwqU@QCOM-aGQu4IUr3Y>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
 <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
 <aedzbg6sg2t12gCJ@QCOM-aGQu4IUr3Y>
 <pakludkmnvnvywmnn4dzl5j6euba3yjgy4zcmpmtmuxjvpg3so@arobndaolbpw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pakludkmnvnvywmnn4dzl5j6euba3yjgy4zcmpmtmuxjvpg3so@arobndaolbpw>
X-Proofpoint-ORIG-GUID: n-yEseQtZpPcftVonQ_Q3ubdTmsn0Wi8
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e83186 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=J9CYmNFF5y-jpvcVHycA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAyMSBTYWx0ZWRfX5jeWrIG+Go79
 RZrB1MlywltkxfvF3kgGyQOO/oqJnC3FJ7Rxnt9yGLIgpAL6/6ONoP7x3TeKTLRCieXsK4nEN/L
 l/DdOq2udpLc/eMAAyCF2m14COwUm2fr6NDAJ2hF4ZdRFxraoi1UlRyIRD4BF7eSZaXMY70cZe8
 5GcjZQrIRPxEf4fJnV3i60+Xe9JNmrstS5L6WDsmjC8sDZ4PlNAG+XEZIBhnIOeF9Z1O1ZAxz++
 BderGlGXl5hS1lQwSbA62UJhTgtg2BeHp7IRtBFCSNhMYH5XhlZvE3VHo3WOpdIHDwjWtqhp6B5
 6oVCuwyVX6VdZXPnmw4M58UmolxjK6YOtSkk4cw29Ylh+kJQ/AkMZsPLhg70Yodm2TZmNJmD1TL
 OoiwoUd9Mtm70UE9FmE/KAnHaL4kcVkph4mlKz1yp0fV1ChvU+NilrOp8obkKis9huq3zIqDslQ
 23Laexr1MmmC4ZoIi1w==
X-Proofpoint-GUID: n-yEseQtZpPcftVonQ_Q3ubdTmsn0Wi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220021
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104010-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 6B807441758
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 03:56:20AM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 21, 2026 at 08:54:06PM +0800, Shawn Guo wrote:
...
> > We thought it's fine to not model LDO supplies, as they may not always
> > follow PMIC.  But that might be even a good reason for modeling, so that
> > we can have a better DT description for the supplies.  I will change it
> > to:
> > 
> > 	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
> > 	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
> > 	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),
> 
> Are those the actual supply pins?

From what I can see from schematics, yes, those are supply pins.

Shawn

