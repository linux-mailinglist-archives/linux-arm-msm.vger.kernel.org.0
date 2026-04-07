Return-Path: <linux-arm-msm+bounces-102211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CKTHb4u1WmU2AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1393B1B9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 18:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6A61305DA6C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 16:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209183C4562;
	Tue,  7 Apr 2026 16:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBbbzXQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3Z+Ioh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E93B27D5
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578732; cv=none; b=PXiqA2Zu4qVr/m1oqFALavEKEv2QnJHIVErKobvmgTA4w1j30hpo0rdNJxCKjFfFV9xun/+hT/f6sWYH3dmGy3YMLPRnpJb/bHO34GOmhd8DNZRedk2XkT7I/H6QtaiMz7WaPLkRvGHIr0zjiNAjhF3hEeUlb5MLokCDB8N0yoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578732; c=relaxed/simple;
	bh=RAtJyF66DhDwL+sw/f/kcnSJ32b5ywZ3vaEShno/lgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+BZmVU/4qNKhBIPZw+Zrh+lk6xPLl9OZGRI5H4s28mAOh3gZuVdi4gTmqA3DZ2PbF55V0Fiyfz6z1Bo7ZXopjlfLTbAL9/qSVrJAnQRxB/PrBmhMQgL6yuvK9giXIkjHaFtl/jA/47yT9EIO6LBNeOSsyD3sN7qS/o6Sad2Abc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBbbzXQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3Z+Ioh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D69u22327993
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 16:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6jK8XeAJDMVoLv4UiVwoG8oc
	0Pxfohm6+YSS7sOvVz4=; b=YBbbzXQT1/foTsk4PrQGIVEEtm+zaDQ6yLZafME2
	tf5h0EPNIjmEgweLUwkPJaCpu1hTcEi18kl28lk+GuJPGv2p9SWuyD2tpAc8eRGO
	mScubiMg0xUBrn4YyoNLaUMKDZM6ufhEapFsBxPexf7BCmUAJhuxWP2ad1UC/f0a
	hMlMiaZBRgMs7q6xOLE5H6ouUs0vqcWClcE7MJjTxO5S557cyTWfcoioeoGgulOe
	2T0DEjNqdbQIvcMlLbxv4KUPIiQTWThXDDNhFd0pD8GHTtoonOU3by4z9e/uZ52o
	1MFf9Y2/iobTzlofv839oYQQGOqJP41wqpPWoVtbbyPPXQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4ujf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 16:18:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127337c8e52so25538601c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775578729; x=1776183529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jK8XeAJDMVoLv4UiVwoG8oc0Pxfohm6+YSS7sOvVz4=;
        b=L3Z+Ioh5bjnUpZZnuRnA/4ryoEffpmS9ffqWMIb/aIjCFPZ0sUJj7u6FkoJ9FEYK+h
         iNiTsaEYuuPmiFAkoRPuFDqnK7a7TOb3dWcCiLFZ7W2ogjU6KSEfWx/ca5c3CPT10NUj
         IJtC/7A+AxjZJu1zHoRRX+0ciErx12iSeTabpOiAEwntSsChPibEAIdfoHKu/8rltThE
         uMaB0wB8cow5kZYlEPEW7X/YcHhLwLr2cbZnV6fkZ51rxfXbm3JxKI2c6+BBin76p+Ap
         Jae+XDv/wkh3JUQgsn4oiGjUxHqSQieizUpCfoPHbS0XyDkEAWr7F3+LnWLHj0EBnzIr
         qKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578729; x=1776183529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jK8XeAJDMVoLv4UiVwoG8oc0Pxfohm6+YSS7sOvVz4=;
        b=mXRbAikQQhUQfncmm9VJz3K9Ei4BAiThFmYSN6wakStwAdcAzCb0VERT9XousnjBDN
         Se9rnnshC8h30HRjbORYvQvPqtgwc5hwCH8m8XkT4bH9CZKI74YeIFALxRVuCTxz8Uoc
         BgakO9HbvcDd598rN1OA8LBPPadk3OT5HfcJjaUz2UllgovwpkkdeJAsOQA73vejsKmV
         WA1cEL7nY5cGFhJiCWesPYB1Suh03XyfKC2TYAT4as0NyHa7fBWLGYln1avclVCTqrXu
         KajiJnQEJkOxrjbDpqTkLckEt2c/NdUC5gx6msYtDFDP2VukTD55h0BzhufP9ose/c8G
         Pa0w==
X-Forwarded-Encrypted: i=1; AJvYcCVYmbmHjsSK7A5gckcnmbNbMDMKgqyH32KFRSivQFg7KxUmGHmkIVgp744pMwD8WMnvPR9wKNL9fkneaTFO@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkCPSIGsd3vbArvxd63RqeW604+9Ppav1wxXAhk8qRB+zKliR
	2XQrY/EsRFZK3NSQYLJleH0CzpTqlXcJ229kJhymgOd4oHFjIrEMdeREkry0OHO6ILMBSKJyoeI
	DE6DSNohqnj1xpJs5FWo4WfK8bifgpimPtOaBNmHBFKh2MkvQUCpus7Hj4CEAHW0Jmcc35Gy126
	at
X-Gm-Gg: AeBDietCK8D8SxI6BmCDOvOpThNQI5McXn9Lv9QULA3fiIUx54b0KRGT3nTmv3pURbr
	CXVIfk8JOZSWZ9VhF6xfpPHWJoxujDqvz+fZ5lKos8Td59k66wTMwds499JvpBSQwNL7mdtPE2O
	IcO5P5XighbV5I2bGcx/kA6YVrnqI7kX4XosdyGTu/iQXPRMq51zzQMrV70UHHajFhur2HUZOeX
	ppUwuSTGQPQuO3Nt7YkYVB0UnC8Z74gbBzd3IdGk/X3H15t4ajI1qNhMNsVoGKvZyg9nK3fCSRI
	pefN3Q0Ic6Qh0cUk7u9UpnVF3lvEX8/Kxl/SnmpV+0V9DQY5zB93vJAu1aR90NXl3UACFJWa+bR
	kvqO9l59meZvWRGordtj+rqUM1O+0BWH3sfdNhA/5cRV8+5THrOo01fYG2kzcIInPTM5l1oHDEO
	8=
X-Received: by 2002:a05:7022:43a8:b0:12b:ee7b:51e9 with SMTP id a92af1059eb24-12bfb6eb3aamr9511971c88.4.1775578727891;
        Tue, 07 Apr 2026 09:18:47 -0700 (PDT)
X-Received: by 2002:a05:7022:43a8:b0:12b:ee7b:51e9 with SMTP id a92af1059eb24-12bfb6eb3aamr9511943c88.4.1775578727292;
        Tue, 07 Apr 2026 09:18:47 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c14a371b1sm4339123c88.13.2026.04.07.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:18:46 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:18:45 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Hawi interconnect
 provider driver
Message-ID: <adUuZYmI/avXdsPJ@hu-mdtipton-lv.qualcomm.com>
References: <20260406-icc-hawi-v2-0-6cfee87a1d25@oss.qualcomm.com>
 <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-icc-hawi-v2-2-6cfee87a1d25@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0NiBTYWx0ZWRfX90T0YVKTD74H
 k/O6M5RpP+qD7WEJswwEYxIaEIKF0RvndJ97Iisg733zD5J3Rw+9hs3oabbnWVC+6JAiFZUHcox
 NuNsB8+AlRIyVQEfJ1H49GmBxhWXeKVl11DMsABX5iSXxMV1Xmote3Q393UHe3rTSftwZ9PkctY
 cf2Vj8O87jdowWdQIMUQJWHAbg6PYSa7xMQORBvOKEbyQT17inL7W3nSemYE5Q9QpRLqkC92HLl
 ++nPjb/t8aRD3JfoZi/ePyGwWsoc4CZqyPziis4DO3AGzX5icyDNEEFgXdBsuIQij04RM5FpoYQ
 NoRd825BuRhmh5YcJd0UdoEU2PTOofI3RQ9vDYA5DAqeOuUcSn+i9h7yrX0ttsAYpctLasN1EqM
 UcnW+D4csaAMF+RYt7dqoNYIuRym1EIUSYb2Yt9+tBvmz5moNT6uvkNQvP4OC2MOrntBzlx5uFe
 xwQwDdkiWYAJfTb9ucg==
X-Proofpoint-ORIG-GUID: xWk21cKRiJ67WWEOHE0Mti1uGLfUJMeM
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d52e6a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X2bA-DTC1ecWuKQBpGMA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: xWk21cKRiJ67WWEOHE0Mti1uGLfUJMeM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070146
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mdtipton-lv.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102211-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F1393B1B9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 04:04:42PM -0700, Vivek Aknurwar wrote:
> Add driver for the Qualcomm interconnect buses found in Hawi
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pair.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

