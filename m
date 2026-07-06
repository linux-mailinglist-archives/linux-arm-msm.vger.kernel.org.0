Return-Path: <linux-arm-msm+bounces-116996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GACjDHDxS2q9dQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:18:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCD71466B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:18:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=er6gkWWu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fIW381cV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2961930291D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8DDC41DEDC;
	Mon,  6 Jul 2026 18:03:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2C414A18
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:03:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360985; cv=none; b=eSJCDfSNtKIRDj7t4z0KGufV21Fd7WtdACRf4KcnfRf3aiKJFhp0TW7qOIKhKQCpoZe/0H20NhWaObqaoaGF7u2n7QTq2PXTNRzSnMEbmclL8aawvvb0bYv53c79RWULOLelN0LMidn86hgkJ8I2aju8hqsL+Nmz+EVxJfzzb8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360985; c=relaxed/simple;
	bh=M5oCKwyIlPq7r/Ou714ZeG/wMj+UdXi2bZRWxkpUj30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOgizD8fttE6k70yQsru3O7Xe/2KtshfK0PtCApdY+m78pHh4U4GtiU72BoBZbHr1BK8kKIsCMLcoxa8p4gB32AIOLKAlcb7otdIG+Jpbuy7KvKRtGU7LmNj+t5/TCZ5orLfLtVs4zyJ04GTWrjKETeKC+rSpqxZ/RcWuIokvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=er6gkWWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIW381cV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFF3p762456
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wg8vkZtQ7pGNETfyMWbWWL7/
	TDivSN0s6sicKMDYPCA=; b=er6gkWWuWV7UPpqMguVXgPhaYCavuC9SO1n/q3ad
	g5Zn09yoqILwoLIc/Bj2Lrzf8YzkK6OoSf4NzAvRdTGFoD4hGumPlxjcJ7DcMLq1
	nfQQ3HuiiuTAVge+clUIk5SnAW8u417zHFIl7pRsXLZaGUQscBKEZgJH9hNG7cOT
	MdYORiEguGBHVb9Pq5qnDRmOGrb+PTKz/BNL/xAhdXAY+mKfUybFerDZvYh5zAdC
	7vrJcBheKaGgWTLgfk9QTkYJBNH7Qs0PD0WMhA/jq1iYK0NSzCmQ8iDVVNRHHDBK
	kkjBYVBWKG+x1iIXKRq6fQM3k+MmHSXeIEFqBLDBS9guVA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtw7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:03:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bdc4fc26b8so107010e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783360982; x=1783965782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg8vkZtQ7pGNETfyMWbWWL7/TDivSN0s6sicKMDYPCA=;
        b=fIW381cVKzFE47zDqtJ2CnFb2CVGYKjJ/TSV/Da7c3zkmkkPl1lpVYcJnrmq12PSMS
         rHE8qnaQmFPulkni+hcdhVsYSLrGWREz//d8XnrLZJhBsNZdPuAiGT33Z4XSc2R2NZus
         fNBJHNbXmloEcIst31z1W44LynKVo/8rl3n0i8uMq99faKvdDJovN/zqDa8kne0X0FCx
         TLr3iDrrCippUDzXmnt98kHL6QULi7KJyYT7v+1dnJot1INQGtj9AiPL2VAHRYMIIJ9Z
         Ntl6xj/4R1AT9PecjZrp2DfUSz3ro0F3G+3IG9GPTrR5qvohR4rlwUIET4CW3gDDUHHY
         tbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360982; x=1783965782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wg8vkZtQ7pGNETfyMWbWWL7/TDivSN0s6sicKMDYPCA=;
        b=ofU+zzOmet6+KXP4TZkTxtndsJxPGJsdDuVgNqyrNY6fTNdZR51Db4OTYelVfjjZYQ
         95zB8C13qimSb5VL/rooozj/wLCYIdatBASdrHSqAizLBqVa+gRWVguFwM6n57m1vxUP
         Xqf2B5HVvB/CPctGLhoXolczao4Ywgu7tqIj+jg7kIHUNrTBYgAk0Wrm0OZscVSRMZ78
         T1i7J0x+eJTTAxpVUwxGoRhfrBXX5Bzpd5oUiafUCInkpD+CJAfSSSmDi0JVXvrALPhB
         plbSuehMmqalHN4Sx3xnM78y58g0SLpUtHRdLFu/534wqbPSssc7kh4oNq0yZvGFl+cy
         0kzA==
X-Forwarded-Encrypted: i=1; AHgh+RqI7RTiZSjtzEUfcO61aaYyzXtkDUlOsfkb+lPpcd3LhQRVr5xH+hj4P0eigryDrtfP33FDxrcueTypoJHM@vger.kernel.org
X-Gm-Message-State: AOJu0YwiuI191dT6L/31Y/V5USdlYvDgEWrckooJCxajBj+4rS2NE2TH
	IWVhtT1ET6Mzob48Iu7fZo86UZfEUYfCEckRJXVOJO7ytBRC/fcZnaz4CrdEFDsCikFmfvGsjwZ
	T/NnlYno9efYH7w0n7GPPHkBaS31oUL6DfQIQV47Ilgz3a5N3k9xLAcoMqvATsV77Jyc2
X-Gm-Gg: AfdE7cmAVst+qTrn4Uh5OVlvRo8J54OdDFfL4CtuEfqxWDXveZt6g3wQ0WprHdBXO+E
	proebZp22gEMATp0uVuD4qgfLjaRm7UCXigdOpVqDt9X2UrqaFLC4xba6xZl9gj1O4JHTQFnDH8
	x+i5LzzFgtp3gSty014ed2GN94uw3nDZFubBIYlA+ycKw79/lV2nx0m3+BUmwrD8FeNKAwyWXsF
	uiA9QL2HRv1WN3JyY8/8sFBd+ApwH2ziRpx2CjQWDSyDEz+ayUNMDOOTzv7EG3ZjxFC9LBcecK2
	R15nimVVCUacZIWc5m27KdXajB5jhzOU9pp219HpAAOWaydtIvUe04scCRxkgD0IV6HQRrKy+cd
	+IchytpzwNsGN9bDilnyC5Jq+sbxV4sFOxqJl7drp4clDiZNz2S7idsKqMzvun72b4NZQ9Ujep8
	BybHp+PBn9uobxyA0WMPvWdfkl
X-Received: by 2002:a05:6122:1696:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5be9076a42emr517281e0c.1.1783360982279;
        Mon, 06 Jul 2026 11:03:02 -0700 (PDT)
X-Received: by 2002:a05:6122:1696:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5be9076a42emr517264e0c.1.1783360981779;
        Mon, 06 Jul 2026 11:03:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm3006551e87.44.2026.07.06.11.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:02:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:02:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] remoteproc: qcom: pas: Fix the PAS context
 creation placement
Message-ID: <ux262i3he5ieqlr34pizq6au6sfihbvkczpgqbt5skhe2um5ld@v4ukyw4w3y4z>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4TTK8Rhl1B-6mC8JXm6-La74Ll-cwRrp
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bedd7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mq4L24Qaxw1z5iCuomcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX5jYMT2pqU+GE
 MToqkW2N1a06Y6M5kg8PPE3zwcl2m3yD+wvtyRVjiZ9BGMYqe/52RHiSheQoPyioMCsGnBf1+Ng
 aT4E7tKcLrG/QRUTQWSmxPBMwwE93uA=
X-Proofpoint-GUID: 4TTK8Rhl1B-6mC8JXm6-La74Ll-cwRrp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfX7SeRK4ReUqWf
 m1v5OgxTlhErL6RrPI9qFKxi94ln6EhV97WMj7y73E/er3J557a6vBpWpq3h4PcR04v3uDX9CN3
 /FWw280WUXheTeC1EYcnletnn97TWlFuMM4uEPDyGBQOC6sO2xB9QLBKq1NQqOXC+d4niqz1W1T
 A2JYWdhR9Bzsky4L7YmjzKh39Dt1DcBnqczYPQCp0K5uSJJrixTeHveEwLgd48D7SVu7S7haL1N
 XA92HZqm+EGlLx6FHSTEi94rKn9zDDPnfhYeOgcyYPYNrvxRCSRQWl5DHtpSMvHXIksUCfAW9Gk
 u2qKM3WaaMiilLlq5sN0dIgM65LG4RqwHqe0vBIdcgrY2VHQCJ87fCv/f2A5/50PG/B65UPvQWz
 W23CEdgYQ5sHQw7mVBZKzV6lm/7w2c861WLmS86+wH7Uu18IanAIdYwnTa+QZOEGsOQOt97gcuX
 DVcp2ltCpJY6CyWfzMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,v4ukyw4w3y4z:mid];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29BCD71466B

On Fri, May 01, 2026 at 12:42:50AM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 32 ++++++++++++++----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

