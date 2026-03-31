Return-Path: <linux-arm-msm+bounces-101113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKGwCwcOzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:10:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D7136FBC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0BBE30BDE18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AC743D517;
	Tue, 31 Mar 2026 18:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1ytJ6ER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ahdk2/eU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D702D3ED1
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980106; cv=none; b=Fmw0baxkrndU5GPX8VsfwN58g627e8FA82D3Y/r1T41CuML9i3w8J+pzsyraNkfPkXprQ1Ma7qNHYfNz29mGpRLk80wUzvHgs4TxKQvG4esaQDGJcQGFWPzG44+L+BnVSXHJv2VOkmSPQo5GpG1Ukx/GTKxRKDwMUu34SuyBJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980106; c=relaxed/simple;
	bh=gKMKtEDMLOdhHXc4oHFpAxXH5SpuDkeTy/QWnFLjC3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNV1DapyoO5tsFzj32phkAKX7cjcqrmsxfift1E1WRnyFNRLWhBIZY6mLHBsK78t+u/jhVoPtiXlTRq59+uTfc/7UD99MmDF7Sm/EP0s22NnkhDn46bl7OmGWChNkHoYh7qws3PHJciivw/FB6qjDQvd/k5UI12peURtIA9P26A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1ytJ6ER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ahdk2/eU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdQis2724170
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0Kg745/1Ujz367/buEG7LsN9
	XQefJdYXPIpCEhaVjmU=; b=d1ytJ6ER7UvX1i9Xzwy/6IVC5zXheG8q9i6yon+g
	9cbIRRKAHlui0ss/KjcUCzyjuRmx7NFmHxIWox5WDfhi0g9xttZD0sm41aKaOP3f
	e7fTgQjvKWvW6gggvFAjZDffvNfw8eVhnX/JyZ2RuASSwBVbr7bXu1VJ9L/UW0gD
	8wS86wHdQlq1NunYmeqLJhYQIQm8K/TW9/WMCbsj6GBK4eRhsX3+8oLiewzrY1qc
	XME0/BlvmJp9Q/+1kaqDb54vr6vJPHqNcK/k6/TJjthWL/u0/dql7Z90TQZXYQhh
	qsrvHYgbvDEOfqNW2PhbOuSdl5xjg4giwWQyRKLpiU9i1g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfm0pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:01:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56cf1790811so3722677e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980101; x=1775584901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kg745/1Ujz367/buEG7LsN9XQefJdYXPIpCEhaVjmU=;
        b=Ahdk2/eUMwwylU/MgQPlLMdIFPwEhe0IZ8LC8Q14eQFUm+pJqniF0DWYB0Al5EWNVy
         b4x35ZRRIqWdFhwVN1cV3OJvEfnAg1FVL6ScE2smkJPIpNWfIw8BToQT2rPuoa1msSlX
         Yd5ap09gQMAEDNudEaleyKTLiC6ckE2GiISTklUVCvo2XLkuwfrc141VmfyFw2LaVb6f
         Tf/eaTK+QKuPuD2UeKOCr6u87VSYOf0/qUAYloWVDfqsil+xXNPHOXHvOhzVvDkHG0Rd
         3QNroHdJ3SJiGovfzMBtXmiz35LY7polq/wnsOchzk9nKRPEGruFgT7P9hf0L3vm2/p2
         hjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980101; x=1775584901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Kg745/1Ujz367/buEG7LsN9XQefJdYXPIpCEhaVjmU=;
        b=M/dleIxq8lQ8AkiBtXoZ1VIpM4eMGOtz+6tVUrCFLHmHDj6pzQDXLtZIC9b5+MXH7V
         APcNl88zHCYWQon0R0XbqN+PNDjaByTjHvWhpMmy9FYrCYXj3ePCIRUbtSCSZEFzq40z
         QEwYPw1wvrOUHpY9fMXpxI5FQ21wXEa9YhyxG+PN8J/AKprx1HExdppTb8Pyf2i9O2kA
         JElLjoBGKCJcQyS5IoUpOJi9oe5ztSZUXgGKakuBwb0laCUgBu4xUla3f4dkbh65wUcC
         JtLSBN0vglV+z/fsTXYbqIFPuU9NY87Ww3pEmboslERiJgt47XfQ+FUdn/fm1JhgqHtz
         jDRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR/GDd/6cV6vLoY85qekiTgzLORK1hoLd6e16aRY8ktbTiP9/rINDlzNz/ja2un7g73TFpKGDjMF8s0EQh@vger.kernel.org
X-Gm-Message-State: AOJu0YywSDR4gg8rLcTfdptL/ZXneOfYVXkGrCg3RuURpx/Y1m9MZJ3k
	NF0PobxvtR5HfO2hkqUezwJs7b5sHacMyvnpF80VPt8FXMToJqAL8kLTEsEZhVZAYHmSgiEFleI
	q59kaG1PdvkfUGRnPrXW3PD5skzSVKQKGwx9WeYOkftc8UtuCOmpyHkgsqyO1Lf3DmKe3
X-Gm-Gg: ATEYQzxOGHJ2iDa8guqGUt8Awx7YXiQMMbQKaIbwI0FCqJr7HdCswt3q/X6IIOt9ai6
	7N1Q56U4ZJo8MFdoYAVAYDjsCIbfmWWusPZ5FG5sqU1/b81Sc+UMXkOB+PV8L9JbSUj76X35gCE
	bP2NTnHY5vhFfHKcj1y4EFvedRL5UX2+S9Z3KkRy86G/2lzAhNKo03CRLhANLIKVt1kD3vi2nDO
	z8BkXo9ECybJEps2vry9Yxp5tMjLkZ5+KaR+Pglmjx+pEikWzCfUxH75/svSyceN8iMdOzEbxK6
	cX7U04xFy1Sb7B6r0tqHvbjBHsNK4UHMZvD1O0KoMT3FQ90SdQNTbU3kgJYCBjQPTwQwIhg0a0P
	tuVNFzpxALKIPQHoniLkhNBVOCAsktI23Hr3GM/O4Go8OsEtgs1nFYj38pNeo02oVM7vlt41K6k
	P9pCGjI0f9wrmjaJmLM0pHL3UEvyqG3IF7Yrk=
X-Received: by 2002:a05:6122:4d85:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56d8a8e7b14mr285122e0c.9.1774980100617;
        Tue, 31 Mar 2026 11:01:40 -0700 (PDT)
X-Received: by 2002:a05:6122:4d85:b0:56c:d757:a045 with SMTP id 71dfb90a1353d-56d8a8e7b14mr285038e0c.9.1774980100072;
        Tue, 31 Mar 2026 11:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c2233101sm52532e87.49.2026.03.31.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:01:38 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: eliza: Add display (MDSS) with
 Display CC
Message-ID: <24trlgjbu5vyd25afdtaxmih6cjara5yxzg2ya22lkk6w6bmhy@njfigpznndr5>
References: <20260331-dts-qcom-eliza-display-v1-0-856f0b66b282@oss.qualcomm.com>
 <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-dts-qcom-eliza-display-v1-1-856f0b66b282@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cc0c05 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jGNyBtTtLFTNQ0AnaLkA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfX4HWn4bbKSMuT
 OCCgzYDfJOQtQLFjuLUfCVGPWowJE2IK8hvAWiRjJmv9FlyUnfySHsQyqVMDqdYp7JX+w2rNmoW
 KaRkLVF/VMJSGhy8GNuqoQB61keVdYjo4KNQFj9pCpda2K9OOQaIMCxesNO8hFl3q0AVKnxSz2e
 po8ydP8TBwVokt3+HAfb3/bxvIdmNBpTa0ne9gL0/grrXitaEOh1ojW4cLiSijfu46ciLSEKL8z
 VLojW1DhO1JHvCE/1qX899Rds2Jegi+vYNDSvKAIX2I+6IflaUm1RlOpsabAJ95R2UlPyCO7aM0
 ccgu89JA3NBgbMMO0V05BCjTAHDfUj50ozzq8ZCwG8h/kvObGWWTWjDgOl72u/gKSo3pdcN0gjC
 lrquFYvTBKBziZRp8iRAXroRJfM4YtutDojLUhLZ/W4RrGo6vymWWZEpeI2EZKY+LiRjz6WYSKk
 x5Nl4V+K3+j1Ojk05Xw==
X-Proofpoint-GUID: 7-Rm0ryVKFT5T0tt8jOG2eAc7lljLgeT
X-Proofpoint-ORIG-GUID: 7-Rm0ryVKFT5T0tt8jOG2eAc7lljLgeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310173
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101113-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2D7136FBC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 04:02:49PM +0200, Krzysztof Kozlowski wrote:
> Add device nodes for almost entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Missing pieces are HDMI PHY and HDMI controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

