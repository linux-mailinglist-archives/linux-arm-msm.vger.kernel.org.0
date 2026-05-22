Return-Path: <linux-arm-msm+bounces-109341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI6qAs5qEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:40:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCC5B64DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6525F303454A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCFD425CD4;
	Fri, 22 May 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lC/qTYdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeXBEt02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CE0425CF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459523; cv=none; b=gjw+IyjU/gQ3A049hcQtDhguMKgEwRbEY9ysw6+dI4y3mUlriPZMlOKcXZ6jZ1ITOdWpEP0fdZf5Q9wg0JREr5g34byXTpHrRvIRe8YSVR0WWpNVutJrWdbolPg9NmZwBboTlIdtFXRZRDNK2ZJyr9EtO6edsPG8pJJYgHWpWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459523; c=relaxed/simple;
	bh=rKk5kOKOEdac4MZDYNoEU/rAZHIAOQAi0IZqIe6ALQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmNtkPPF1IKXLB4cQ0OZeemBHBUHOxQyXtMoiMMjkFoAVFlePTCj1LzJ4nvm/W2ZsYqlB4+jtfoY9ppEZvs/BJaiTb+33uefhmTnts7Q3BtwEXqKP7zCPBRd+uMgN0JCtnY0lIxIbbZomAkGZ2QgMARXu3Rii3XH5bW5cWK2YB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lC/qTYdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeXBEt02; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M98emN3005817
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyDl8BgAmZhuooaEQjQQKYRZ
	WgOcTk7HRhEVqKAFQSI=; b=lC/qTYdH8wki0e42+wogfuum9zXKCwai2CHMwcKw
	PJ+cH5tx1IwjNH8N0iw1HEX8AlA+0Nu9wGx5TCFKI544nCNM+Mr/jn9XxWhbuY2G
	SnyYUN2NHc3yXEkaVmG1T/LV7Iv/6rafb9c6Q8gcbB5ARKkKC89Aw8mFfhYgQJiZ
	maCfjHbu/4k76yapW2UbxDr3awRSrYdIDxMk6g8UN4FvRt6EpuclhdzT4YyYjTqx
	zLGh7YX5US3MgII4n3K60mM2dOiOqdYZjJKY02pKLFy+/AqkadlPKkIMwZvVpt4O
	/CDmcNLt6gzxE7HKNMUsxWTMxT27C1pfnadWFMVeqUI9yg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtaayh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:18:35 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d1fd7dce7so2789279241.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459514; x=1780064314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WyDl8BgAmZhuooaEQjQQKYRZWgOcTk7HRhEVqKAFQSI=;
        b=LeXBEt02HZSYEe7i2x+zIUub+62caNQExGmDpEA60faVSpgKUx15ZKLhcwaF9Z077u
         Xi2adR/8wqxN46ZffvNvyLfzddmAM/jnSChT1R3lbf3Smu3Rr0C5HteBQJgsNtBYZhWe
         LjyQXpKzU+0Ty3RM0aaGeNTES87Byvn+KA7oKmfNOPzIAsjTlshNeq6G86OCYRNGsX+/
         1G7EK6kP+M4CkT9a83HP9HxnNifEE4aGPXgC3jfGRXTtvyMQ+unDEfOaW91dseLNHWnV
         3TLfjRkwW7SCs7Nu0bjtxf7Po5HLGI8GTZOdgRSEEKnvqMsYK8Hb0U1VSe5wTl8CN7mZ
         XW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459514; x=1780064314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyDl8BgAmZhuooaEQjQQKYRZWgOcTk7HRhEVqKAFQSI=;
        b=WckU5hcZYJRAaLLAi9SeVBXbauBop0RG3K5jJnL2cNVotkuJvMY+AJfar2Tvk+KZRz
         vTUqUhihSoyVdoM0ipXa0JfI1xWenIlU9NqMOL66pgC3qZ0/z2wxBV2CFIEqwpkeloYb
         alllxjjseoOGJt7k8ZVoF5mjAx+oYu3pw2lv7FihijhHo0l2GDpXDFnYWApKrbAjCRIh
         i4gv1MX9Rl/9VvEnaMtxVEPdmKiifi543OW17C5fqfTV7pwhKYGU0gx0Wzq5MN4D2brN
         0ZCPd5+xEiuWReyffO8shaY18FIJuOQoYJRSAyMz6AvA7xgH07ho89srIbs2R7nrCn6K
         TrkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xwNgxCxreWfYL8a8mc19rJCQj3DBGNMmXjcNZ6okIa4z2RYChfynGgEDku0U/nRJNIeK962qAtm1AUamu@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGSKETItCYUNqYaQVvNFGDx6551tXYomnlOKh/nwYMrfyck4n
	EYUe4QFhmzTZsnAjh8dLpxHigufRnUUz/fm20T72LhmltUzvtp1Ey1Oe8nMG4o6teFSA5FQjjph
	WhKerjkiTsMrMjpk5r95c828d7TK1xNJF27qyAOLyqcGV8McNqubWs2K+6j6aNwPMWPlZ
X-Gm-Gg: Acq92OEgeURMHG0rqhecGGdeYFOeLrIMsrKcDcXwXXoX2A++2a42UdMe0rjtQV4OTHX
	ftXI8TcprbeBw+4Ypei8CPXYBmhVnT4tMoR5Ohsd9YHzFVNX3PFVPLq1KYzsyw1ZIyeLiljHPq1
	2u72pDQd37ClkxY+gNpR0r5oF7BAVJX/QFHd8z44XLtXSChc9BP4NK0vDi6QFX/xaPhmRcyfFMv
	7yUA2qe3chpRe0pRacXGT/vjKQknGn99UIkGbnJU2XqYT891Ep+vl8LlPQuq2E907LSkObYsb+2
	zO0WRd3IpcAO8psAtBlS1VVdcVQ0QSbZ73WptermYY0+ncViJ/nMUQoCLv5BrAoewSxF+/aK+7s
	x8vhVMMAnLy+07XmNZBdpy14sHs35zGC0JOv3Ugu/Uz7R5yoLo4Mt24C8r9Ku6wxeayiUBAb60i
	xTz67/KE2bmHohHFwb6nnSIYNMlbYpgVb3p3Y=
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1838987137.15.1779459514015;
        Fri, 22 May 2026 07:18:34 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1838915137.15.1779459513473;
        Fri, 22 May 2026 07:18:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca031d5sm3900271fa.9.2026.05.22.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:18:32 -0700 (PDT)
Date: Fri, 22 May 2026 17:18:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Message-ID: <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
 <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a1065bb cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jH77VO39CjRCDWMup1EA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MiBTYWx0ZWRfXzLIGR2Ogr8+e
 /ta+IJe1fR4BLZdFxe0rREe6XeRANUX1iQokejdBA3IDyxbg4DRkMKD11OazMNazhU1Daejrgiw
 QbDnNO7tcaGLswcwEl2DEj44M6EYS55KByQIYpe5d07QJOTp6l/oVpUiy7E5dDJ5bEzzuyLYvmj
 KtBSCmKbXEkFdo/lxdgh/kMhag2acUbTBrr9xs+nT7aJKuigqvjb5+rxSwlLruStzJxMXaDp/Ee
 nGqt+WM7WSuf/bSJ7s+cTTobU+MIPyByBXNclH5PUybgLXBifhRnwTH7fpGk+RKsVVA6HAifib0
 2t1A8qcHTVjr0m9LWTGPKCQ5mklDjZ376UpZubljNN2avb73qyx2TJXnKQbLE0+06c34lpaMRv2
 64ao227V8B2zH77oB+Kgk5YkVJUPeOC4P/6XX1w+j5soPJfcRRCjlPAxoaTr5X+hshBPzQE0jOy
 iVweXGdQlvELONE+ZBw==
X-Proofpoint-GUID: u8RfcsmimjWEhXbvVXUiFcAwJfmPaHbd
X-Proofpoint-ORIG-GUID: u8RfcsmimjWEhXbvVXUiFcAwJfmPaHbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220142
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109341-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DBCC5B64DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:13:08PM +0200, Konrad Dybcio wrote:
> On 5/19/26 5:03 PM, Komal Bajaj wrote:
> > On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
> >> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
> >>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> >>>
> >>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> >>> for the Qualcomm Shikra SoC.
> >>>
> >>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> >>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> > Ack, I'll address it in next revision.
> > 
> >> point you can use sc8180x_mpss_resource instead.
> > 
> > minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
> > For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>
> 
> Is there a chance the same ID would be applicable to 8180 as well,
> just that we missed it in the past?

Do we know, which platforms were the first to support minidump at all?

> 
> Konrad

-- 
With best wishes
Dmitry

