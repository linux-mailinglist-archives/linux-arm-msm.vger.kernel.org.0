Return-Path: <linux-arm-msm+bounces-100356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DDIHcOgxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:22:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9910346A64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6322530143F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D68A303CAE;
	Fri, 27 Mar 2026 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hh7JEq1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZK5XRc5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69B306D2A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624870; cv=none; b=GuyqCltxFSJUPE4YjfTsWskKfVpPM9p09bXuRI4E4OrLCSNiBDZs+h9xWCAcAHN4Blnm3YsH1CAoB6ml5leae58RmMa7FatIpm2wQpy2hFrBY07OLVUS/fYCdUuf2bZkmOGYCq8ClUyCN9FdHkGfsrHmbcL/oUOxO0snMshq3fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624870; c=relaxed/simple;
	bh=OUkdd3FsY8pSLTu9L8PhXPFB2C77lKRWlD5dQwZEYZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfiwKZehaS/RCN1Cbw2uRytopqWt6sMyypRFSqSof+efFx8EFFM9sTpUXL9mlNy0wyEVUr/r4QUVidhS9J4cj1xgfeT2h3xmjbdlm+D+gidghIkc5OKQe01RTs3IiD9ybEDZyTmm7+D31BAvq+nS7wfG/9/2jkBycv67Wgg5/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hh7JEq1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZK5XRc5D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhqR2430624
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8mQQxrbSpET6jZjLTO1tLAfR
	MRT0UqK3qc+kbKk98Gs=; b=hh7JEq1dEo8JpoDI7ETNXUFoNDtp3KkHbQax43uD
	3u67Dqvxrpiv4rLKckyGYEKNHFQPa2Cxk+wGN/MTymi9JWdvmupMO5NdiBOexNo5
	nmm5vj4I95xAoii1Ypw/UbIOn7OBmrnNHUt+TAuPBeQ4xQrhabfhLc9UGzo3nol0
	sl85Q+k22WuI1JbbIYpMCuOqNJAIv2bz+ZGAyAtg6CNhBBSGuExrCksBbjpPRjdq
	uXzyOW9dnu0KMW782FYNI8ALtQsNG9e/jhV28cZ/8SIm8GyegqDxptDMIkM4z1Pz
	3G+9lg4SwQ2w5vAiAWPbl1HNPGzpYulXdgKhSBwWrwHelw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5haptnd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:21:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56b953b965dso5201899e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774624867; x=1775229667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mQQxrbSpET6jZjLTO1tLAfRMRT0UqK3qc+kbKk98Gs=;
        b=ZK5XRc5DDvcvnC7VVnaybukrStGVxFz/qDtMecFJGE0foIefbTpPKUMv4HYHQEd9ZD
         R37RPy6WuQ5NGUCuQCt31AZb+TIagzl1Sw+6fatKNEcYncCE/KNeIYvAkzuV4rWGkLWd
         drhS8y8grdviqq9sSSQ4a5dS4CpSC+xj9NQ7gp0bDc/rZbu0KC4+OvniccCEwJ8XKwBM
         2H5dCliygQzQHPY0dz0PagzMcvVlN3+wMzoz9DCN/gtaWlnv0utJmEwO11gTNxswEPxx
         N41BxvrBF+tD7Bt+iVWW/jB7QKyz9skOWBYmVMWx8qXaStdDzsFD8byKO1OFMHZ0eJT9
         d/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624867; x=1775229667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mQQxrbSpET6jZjLTO1tLAfRMRT0UqK3qc+kbKk98Gs=;
        b=hzEvDycPGV2xWKyNN6ZrrNDRoXvdySTeBnpLFX4BxgMPcNDdgjKSPeXYgUu1Ich/JD
         /rIB2wAeF4Up+kVwt9Jf1hApTBr8RI5VC5mOQx04+r/ikJmkGcR+kqkCD+cs/htT817Q
         nWN1Cx6591Jsq4qVhvgUTaIFc5D9DU+1YzleJNRhH1QLavYHNPZVVswOtWNQpH5rhzgQ
         d/3DC+4QI0Me8S5Vfy/qo4+hMdIuGiw5HvOx2z+s10Gx5i4nNhHsFlsOrG9qdiC1Vse+
         t/xEYH58mIEI8CLNgGXz2fjCNtLO4LvKM1AyjArtfRW13DzJWe3WuLZ8kgO/Qc8oGaRK
         nf6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXr/VmEp7CofuEXwN7fwDu+/devpe+D5rNDnwCZ7/XHVWZP521tDDZgQToPBGVZ63lDIz7vHEVm0+JMxzj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4NdcvDXK470m8dgI2aREGfOZvrDLwhPku0iPs36zIWxzzNGov
	/dFdLi2LIxGve72QJdPSuUpDbx5QoQQML0oeVZjqCYonyWp/KVLnHhLnh0IAvUR0vQ4LcmVRHLx
	aHLVNZDDXzGAWTE9EILplB0mtWk3KdwS8lEyAMHzucj0cVDJ5HPXjjbfWHUGtJqVL6G+M
X-Gm-Gg: ATEYQzyGCasC7FafwCtKif08inb2sL0D55W5vApDqr45W1CrhLeLJMIfhY3JCHoycOR
	/jKdSpR5P8CrDjN1iQxKmg02BcQHRFoUu/h9fVrsVDeuUptZNLSlV13VbpYVLemgRrwADZud6Rg
	ILE5lAEqL/E5GABpVb0pspKEU+j5FZnESXqdJyRUD+PuRIJCHYpNkqH0A3bb5Zp3JE+pyZsKmgd
	Vkzp7POvEVHARI3jLsCJtbnGxhSHBL6LChL0pXfVtgdG8KEGaWcgIS+Si9aCTxkB8J4Zjg/zdV6
	KBzJdkEW6JH10iQ1EH11PmH99khzIW+LBVH+2sjvtAS1gtqCJyxpU67YTjqYtkZFqU7KvF0aQvP
	8K0EDOjlckQ5T9ro//ZS/xliVXqEulZG9TA==
X-Received: by 2002:a05:6102:41a8:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-604f903dc36mr1370690137.6.1774624867204;
        Fri, 27 Mar 2026 08:21:07 -0700 (PDT)
X-Received: by 2002:a05:6102:41a8:b0:5f7:2568:abb2 with SMTP id ada2fe7eead31-604f903dc36mr1370669137.6.1774624866644;
        Fri, 27 Mar 2026 08:21:06 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c8ca60sm86797115e9.7.2026.03.27.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:21:05 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:21:04 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
Message-ID: <p5soauqkqe46zt3ejtpxckvqrfymudvl7kpbjrh6mlmvkrbahm@she7lps7mlfi>
References: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6a064 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX6IU6LXVq8FnH
 Hyj7AA08C8SMjS+DjWAcQb3DoAq+bsjLdNiHmcel1xra8FA2SLOX2M+E5pJoxNWZD3EzQo7ojUE
 rXpa4cLoEhiYxVlNhtuFBtyFns8adwot2Hv+CuiSd1iwS5vGv99xrdyqdoFG/ic8Q2Rq2bl1sSv
 gEz0hbbvO7VPuopz/kAzZSQ6jj7AtjRMD2EOMm6zH/5z7FtoX34FlTSrjnNZ/ec9lcDQTZg47zT
 9EH/YVQfar8mAz4+Nt/G7mTJlxQfNDJh7pmJEk4njNkgypXhLLr92CgzYR/bfhXs9Ty5wW7IIyt
 Mkdq/p2GBSftAJ2lJ5mLLOovRndg/IPlN5nY/sGzNydgrBBnXHsjL7S9DlLCjzdS1kjgO11esPI
 pdNNuSsy3Iry80eZjYZ/sc6BBZc1OGow74n3/O2XcxmCKhxkawemFwAL01+jJA3k1zxCPvkTksU
 QCQT6Mj5ftVVZpwyfvg==
X-Proofpoint-GUID: aFwAxTjlv92_2b2Ej9VaACWAqWfaDpBC
X-Proofpoint-ORIG-GUID: aFwAxTjlv92_2b2Ej9VaACWAqWfaDpBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100356-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9910346A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-27 16:53:17, Xueyao An wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>

Hopefully, there is a DT binding schema update that goes with this...

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

