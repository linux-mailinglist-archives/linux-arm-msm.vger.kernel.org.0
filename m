Return-Path: <linux-arm-msm+bounces-105000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACzkOgW48GlwXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:37:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC29485FD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EEEE3076A13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F1A46AEEF;
	Tue, 28 Apr 2026 13:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IuenkFNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bksDP77K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594FE466B4A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381887; cv=none; b=Y/IavftGKaoLfOws1nc4MRUHk7xcedXLr6ZSI3jOBah1uSM4a+LxBSeBwjUe3f8Py2gLTq2qa0rYgPDpOz5icxzj7hVGheDBzOuzqMqby0ExYdswMSb0U2yP6J3a1o1peZSA0W4pbgL9sTBqGTqBDHsaYANHunf3wmQliFU0Gbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381887; c=relaxed/simple;
	bh=ZV7gQ+vFpTm462vRo27QptIK65cykKtJURR/0mqEpwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzNlHGBOd6EH9AC4WHk161cybRxC+q8TY65uF8ELNdFQ4b3ozWVFXGeiUI9YYHgfA80qoibzikmWKqPYfrxJAUqm3Fp1/OfZXwCUMYNhK4Wwx/OH4uq8e49zuP2bHrWUB9xfqRArDo6R9iTpp8uHgbQkfsU8VaNYEtjpPFXR5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IuenkFNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bksDP77K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hapI2045271
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=blI+99Sh7Qr7qWaUiHcHIJCf
	MzzoY5IQsQhu8lkmxlE=; b=IuenkFNs5yI+oKkt0osCDt0wUaVhV25n5hAcHF0V
	URW6M3IHAWQnh7kQQkqHs+a1V4UV0e+ts5XYjdYbDUhiDg8KfnKQ3t7zLdzR7XkJ
	9y27+IO7EoWvTVNwtaa33TRmedPPYbU0xSvMMdedStAImjXzh6ej66x+LOeZtYKo
	uJpBYAE4vGtXC6MvcDgFquPZ2GtDsyrayRy9M/e2EzIQiGWskScZ78idBw7FtOIB
	LNMnB0h7JX2CILYrhQu6+MoRFfPYhZLHU3Ry5mo2SMbrCLYZ+7mje46zDc2yT9Fq
	5469fIzGP2D0p2xksoI5P6FLbWQ6GKya5hJ3FDtJky7fbg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrs1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:11:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so13782115eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 06:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381885; x=1777986685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=blI+99Sh7Qr7qWaUiHcHIJCfMzzoY5IQsQhu8lkmxlE=;
        b=bksDP77KRrpxmsf9rtZRKlSmONfucuzxmfQMXAmCAnB8H9bXkwkYhfW00q+raQTsc/
         XdhA2Grf4dwRXSpuoJIIzSF5KdEFmdviBDVKdlAfA+Aix9Z5+w5ma7TYra4ZfLxMaPAj
         14mfr6YwSCjc+aCgjLdlhJNUg2SUIWf0CMxZcvrNpBSgWN3wb7a491Fu2gdQBze4p5mj
         tWYW/Yueq7JDuJBuJNmzPIBU3Lp25HIb5OOF6OokUYdgSaxGgcHpIqkK/hS+cb3K8Mfj
         9kjTHbr1y13pm+ZEb1BMuWKW4p/JzPVlqLbL8fcD8U10FttFhJRAfij/RtQYllDpgHCk
         Pk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381885; x=1777986685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blI+99Sh7Qr7qWaUiHcHIJCfMzzoY5IQsQhu8lkmxlE=;
        b=qz7CdbKvre6xMxPTj8s0vLuuCTh3dCq5wsmI2nSmOrfbE14jrWj4v2NZYweXzN610A
         I5dpLh/BcluEqGonJQ3LqWQcnUjQjpDJ7hLijNT8N8CKGyeQCHW/9WcOFmqnjev2hBr4
         +ZkU6UwVYr5AyRvzc9etniO99+DrgGxQCRb8Aablt9pCJ6RrlAVqOEhrIcjKaITqf0Os
         YqLADD1LIe6YJYvk0IhPgdWf2fDnhWxyy8+RH/nW2+EkArACxrJ589+tGebKpk3+/i59
         v/xfesx50bS4kQ/cg4Qlfvba5P6R1W5BoZy+PFt39ead9DvrtkzLahyTbYTbULWB/73Y
         VYIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3jXuXAiwF+aCyWTUuWmkKWNdt/+EVhPEkEGSRF4dNuGFPiqn0uqkUIN7fuDVtaUzNuOytdUPNC2A/7nGC@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGRPnmpDYUjB99GqacKh+6LGxCY6ggVNEDpl3dOBClAL0KAjy
	pFcfXLNLEuFzfdKOOEghTpHPGzSiK1qMGFm2KS5oqVi2cX3p0x3AaZ5SQE2X6Khzz76Z5oX6KrV
	goth1M/ZUWUnN/gIxetk3qE14faUaVxGVxJg3fR0hZElu3xzcrZ04V0l5v5ALXyKV2Vji
X-Gm-Gg: AeBDievMSq4zp6BkhW2TksgFF5NIP91HYjqeUBFIe1D2Y8vev8sdQUNbflZ0pJWNTj4
	C0NwEPc46uxDbTM9GuZRKxWwKjfVzKFM7522CZBTeuCZMC78Ojrb91G4oChWlERv2Aai+hpg0rp
	RqqIC20IWZ/zNqLiiUH7ASBfDzaFsRsvfgyItanYlS2Jyl+jiN3VtdJKwZ5z79KRdxAbQ8dnwcO
	vfqp8s/h6dxcpNZdBee3UQmyKeKgQj+f/dc32fkGSMKa0/7KEUoObNa5l61o9wpru92EEDBMlY/
	gBI0CTERbp7vpM8klXaXxqcx84zvcGdoQPCyjRYoqi6mLJ9TcAUi5OJuNY3q/4kw85FDD2uUvg5
	wchuJZeAKXdZT+jnw9JdyVNuLMVlitf5NbMlt4slilQyMPC2+bZ7EQw/MAib8zBqK7uKjSTAup9
	4=
X-Received: by 2002:a05:7300:e9c9:20b0:2e2:185b:87d9 with SMTP id 5a478bee46e88-2ed0a200d8amr1091275eec.20.1777381884646;
        Tue, 28 Apr 2026 06:11:24 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c9:20b0:2e2:185b:87d9 with SMTP id 5a478bee46e88-2ed0a200d8amr1091253eec.20.1777381883972;
        Tue, 28 Apr 2026 06:11:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce761sm2214447eec.15.2026.04.28.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:11:23 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:11:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Qualcomm
 Nord SoC
Message-ID: <afCx9Qwb9_gffTtK@QCOM-aGQu4IUr3Y>
References: <20260427011728.231026-1-shengchao.guo@oss.qualcomm.com>
 <20260428-tricky-magic-koala-b21fed@quoll>
 <afCus0_JslMgwdlg@QCOM-aGQu4IUr3Y>
 <b65fd25a-7175-4963-b623-7805979984b7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b65fd25a-7175-4963-b623-7805979984b7@kernel.org>
X-Proofpoint-ORIG-GUID: N20FwHX2Tp3_DA_lPA1wBT22o5rPR-sY
X-Proofpoint-GUID: N20FwHX2Tp3_DA_lPA1wBT22o5rPR-sY
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0b1fd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=nc39diHjlmVoUhwZKG0A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMyBTYWx0ZWRfX3iRm0P1zdMvO
 t+EHXW01du9Il1zpPcymKrmWqrZQ4IMXYS2rOg9KSap1x/EXiBWjvKxg5Wt4dSj0Xcsd0bdo7Vz
 BMLfZjso7UWYmAzgVCX3rJLOfWJRDd+CKTPQrQYBgjooaHf+HqrAX1ZW1GrNP7Ruf3BRb6Zjreh
 hl9oN35vdPsOF2ehxI1bLLh79J8IZMTx/WTCrMiWS+R7Z351dEdOyNH+VFH2k3SSvvZS+cspEId
 D9CSOhW4CeSSeCiLPEGoyalCjKLNSpNqM0xqTGc2dINcGYvdEa5wsZiW4XLogO4s1w85HubQibn
 sdXYx0keFRUfjTR5mnJvtZ1kKK6sQ3vGrcp92uOZEKeWLMIysMcHSgYJChWAL0IPHoOz7IjCux4
 O20+h9qkFeZ3O+vRDdIEDq+Z4lPtoXAQta06+T5kKNuc0V27G8u7rCNFDAxd4JUumeKKNnL4bjp
 5Q+6zgYIXNjjoNC3KgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280123
X-Rspamd-Queue-Id: 4AC29485FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105000-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

On Tue, Apr 28, 2026 at 03:02:13PM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2026 14:57, Shawn Guo wrote:
> > On Tue, Apr 28, 2026 at 08:20:35AM +0200, Krzysztof Kozlowski wrote:
> >> On Mon, Apr 27, 2026 at 09:17:28AM +0800, Shawn Guo wrote:
> >>> Document APPS SMMU on Qualcomm Nord SoC which is compatible with
> >>
> >> What is APPS?
> > 
> > Should be APSS.  Thanks for spotting it!
> 
> True, but what is APSS? Maybe you meant AP, which I think is known to
> most of the audience. Qualcomm names are not known outside of Qualcomm,
> so question stays.

Ah, I will expand it to Applications Processor Subsystem.

Shawn

