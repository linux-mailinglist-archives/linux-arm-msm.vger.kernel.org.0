Return-Path: <linux-arm-msm+bounces-90545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN0FCA1Yd2lneQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:03:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 893F787F74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 13:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFFB3300A135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 12:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B733314B6;
	Mon, 26 Jan 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BDAlDbq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cey0unHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478079DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428972; cv=none; b=FlqUBCh5Va77h2rUSQTXyDZC4CelGFlkE1EROHPOws9wJwjxmiCiUO3Ea6HfUpVfo6IhLgDnY9bAniJvQsbyZMcUk+usu8EC3sKsQSOkBcyBuCEo2kf49/81ZVrlZZitrrq1uU47SOBg7Abh816qKCFNEUUUxmTPadIBHBuBdm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428972; c=relaxed/simple;
	bh=Zr9/lK+lqH/dlYBNGUDyD1YlHdw/OSIidrcCR0qTB/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/TYNwFXOMb1o774lOks9IjQsrU9B3obrKdVWYqCXRtNkpK/Nq+/c+JWFBCjAG0idB+cq3USbwca02Ncjl2A38Cfb4gd8w/fAgaGQFCgppI/svv7+EecjjjZ7G6Bhobhl5Y7BE/WUTIClVSZInwbJERP+fr9i2KwNK3Ciu6lfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BDAlDbq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cey0unHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q6T93K054682
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wVnwxuOZaOHta0A75QJAogWz
	m5E0vtekDQ75FA4zYNs=; b=BDAlDbq4Q0QNQ6J9r33xeFWamKdRNfIctUo1ASr6
	SvQAjR5vnMPmXzCztlwp24lFhDcfkGJJJm2pBo5yo/XzrkkgQm7kWw/G7WrTqmOn
	j5RkGXa/SvnsLeYPJqHGZFhRdDsfXwWWFWdFsC6PLDdWC13u0jwNNfm+onakiBqM
	kDVKehSyTmig13sY8HSiPR0e3mymMJ8jabPPI/9x8e+5B7HzdMvkbP00tCqb5+z7
	Dkyy9SyrnF802nxHHoktCXugrCcGcXJF++xgSpqi4vmF82rO/lQUopuentLcPMBI
	91Y39wu/eHSe4AKxfyx9eYcogv/7BlEjZdWkizNo6kuCGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3hcdt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 12:02:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c538971a16so465848385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769428969; x=1770033769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wVnwxuOZaOHta0A75QJAogWzm5E0vtekDQ75FA4zYNs=;
        b=cey0unHQ4rM6od1euJcR/leZQ7LhP944MMouWsyJ0YqzVQTUc0+eKStn3ytfuikb6O
         LlHQbBlpHXycAY7ZauFbkDa+hL6ueo3XGLMWLRC5fkyNc6W3maYYlN4SD4Q0cOzqZTzm
         mTm8/d36g8lx7qeJDM+wNNyP7BpSpTyn0B6KkIJ0T6Vyb/iqu197NXKBZhdBCqj/cgFA
         HEAnj7XuBNBm6IL6zaYBrbnAyI8z+p2ZGipTGjjaz+6wMtNyoAGTbz3o1rsIzvuwSU+7
         bU4f3NbEibaKjKfqcNCVaZ98CJWOkw8WE3fOr0JJ9Qm9ZzGGA/MECyys1B10zJIJciaK
         jPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428969; x=1770033769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVnwxuOZaOHta0A75QJAogWzm5E0vtekDQ75FA4zYNs=;
        b=UBerWKDAJ9cCPGYlS2fHdZkJZxVVp7Ktd+wu4rm6VlfLwIkpo/80/QfHYGSFjVsjQ4
         p6uC6Pl8FzeaK35+Y0CprmwIK6rgeC+Sx/Wzc0ObesO2yhmYdYt1sW4Yrh/C5kVWQAeV
         VhSMzgoaJ0eGq2udH/Nnxj01pbdxuFYo0Ar300gMgrCdi1dKerL/oR/7MxhvsR2O5JoL
         Tbuug4AF25H7zriwpVOBEGdqmi3NivhLcjo0/mNlaQ4vBwO598ItBF13dT9wz285tSnS
         gI0D8kqMMHtCv2Z3DK1ej4WibRyjZGvzqOQgo/Mf/CNLFY4O+Ihf/1UDbku+pXqSBKaD
         g6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXbwDMc9Nu0NNgkSSaQ7nB6aGPovnoOf1rtlcF5NoyfuLEbvaQSWah5ObFI/03/Y+kVgylsYjCKao4ZSQh/@vger.kernel.org
X-Gm-Message-State: AOJu0YyCFXJe6Dp0h9AnxniXTy/EznPlqazH1xKQlLvSenKr6Xr/Sj0j
	Npu7EV5CFRC9e87bsnbmxL05YRg215fdHyLz7MjDCAxIJv6eWBhf9oF+v7DtHPp0Lo16RySQJxe
	ecsiPLv1MArQJDVmK//8f3KArJmV5bdzj5uJMDK4qvE6XjZgSsMycCAKybTwEPX+iH1PH
X-Gm-Gg: AZuq6aIEgPD7RSp0d7bF6zXS0LA2Xdq0+sk8AWq6LbNy4hKcWZd1gZFKJtUzPkNeyIK
	hRD5S8Z8SaYlokZEC+8L12T5agxl8kGU2k7Ixkp0rnTpC/qhJkedWj8ptYWn7D9e3VEWl9dipsW
	fpOmN6o2hERX0Isybt81UzN0234HiMbORqCjGIuV0BDCXpmFCvEq4CjOGwHKBjVpFYiVekUUva1
	mB/vgU8pdj6eN2zRw2M9XCNZxPbPoaM/fnnvIr2MtPZoT96cfYsAjXhUN+QUsH1HlVEpBgl5q7X
	Qqwn86E85JeIgcR6607TfLN9ZqVe6Or0rbxtc2FG1P1v067itkwJssnya32WkseoNKPi3CYYgZD
	U5ZkBot6zjGwSl48l7dVO1nu6
X-Received: by 2002:a05:620a:450f:b0:8c6:f76e:c6f1 with SMTP id af79cd13be357-8c6f9590c67mr445918885a.26.1769428969397;
        Mon, 26 Jan 2026 04:02:49 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8c6:f76e:c6f1 with SMTP id af79cd13be357-8c6f9590c67mr445913285a.26.1769428968855;
        Mon, 26 Jan 2026 04:02:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm328942655e9.11.2026.01.26.04.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:02:48 -0800 (PST)
Date: Mon, 26 Jan 2026 14:02:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 4/6] phy: qcom: qmp-usb-legacy: Fix possible
 NULL-deref on early runtime suspend
Message-ID: <kkfqvtrb65e4orn3bnrwzbrepy6zrhanzfpdkfxyijizgj23gv@fyclbsutyekw>
References: <20260121142827.2583-1-loic.poulain@oss.qualcomm.com>
 <20260121142827.2583-5-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121142827.2583-5-loic.poulain@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDEwMiBTYWx0ZWRfX2u4DYL3T4o5O
 93SpmZgTO+CabyFCLsdo1h5GCBFX9mQ5HkzY9Khrmz0WPUFHviGFualajnPdKl+oqJuCAioLNS6
 V8w0UwNBaYs493NhtP3pgr7loMuOAxJTd+AMA5gJLuKrLi3zQaXQb7Uk5i6pRICHwOU1scHuc8l
 V52ARRD03EWOu1Ia0RaeExoCMJWxoKG2RsyxwvZ4Aewa28bjyFB+swNuDWjczmZowJjwZP1C2gw
 XCBAgiiqwfBCBSUrphEvQt1GsGGGMPR4byTlHKiq7SYezFgPnpasdSiTl/1HHB4g0Z6Oa6oyVkN
 jBWUIP+Rl3VfyfOYM2Evadf4Cy5vsazk1FZKILYqWxYxHRedGLka+86n1TDlgRpHXNI3T57mS9x
 nubROhFyW3jph6CqSBvA8XEV177QDnDzW+i74zO7cScS77cZ2Schj8B+LqFDup5mr7ZANefH2XU
 MaqSV5pc12Juj84SgOA==
X-Proofpoint-ORIG-GUID: evImrOsveebdi4qup8roDwY3_zATxgdj
X-Proofpoint-GUID: evImrOsveebdi4qup8roDwY3_zATxgdj
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=697757ea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90545-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 893F787F74
X-Rspamd-Action: no action

On 26-01-21 15:28:25, Loic Poulain wrote:
> There is a small window where the runtime suspend callback may run
> after pm_runtime_enable() and before pm_runtime_forbid(). In this
> case, a crash occurs because runtime suspend/resume dereferences
> qmp->phy pointer, which is not yet initialized:
>         `if (!qmp->phy->init_count) {`
> 
> This can also happen if user re-enables runtime-pm via the sysfs
> attribute before qmp phy is initialized.
> 
> Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
> variable that can be used to avoid relying on the possibly uninitialized
> phy pointer.
> 
> Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

