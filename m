Return-Path: <linux-arm-msm+bounces-99373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IZSB4uPwWmuTwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:07:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A772FBE5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 953873242192
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 18:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA0A3CA483;
	Mon, 23 Mar 2026 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvlAzOrN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mspe0otL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C763CF695
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290617; cv=none; b=BG31O1Zg7LtjwEfBNHFhtInLlLZyDtTdhN8/brlKBtpQV1PTyc3ylPi3gsAeblWjePSDtFZIKTOH6Yy1r3KwPrxlypHT2MR72zBSzbFdEdORXdqGnH1V12n8mEG+vsVlcVr9lYHHP/OqrOU/9btDMeyfmy6ZZJUskZJrQotwF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290617; c=relaxed/simple;
	bh=/QpbKk+m+xNgBaPIA/3F6E+U0IN7dn4Y18GlHssyWow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjtWIGmkuMET1Rqul9Tzk+7rwJf8RRmM5FS/H9IkgeCQQaMnDACjjb0dGywEhIojBPX5iIZ7hsWtbFIFNLU33uIWPOcsibx2rtzW8iq/BSLuK8VBRaK+1d06AFo0YVn+Gw0csAxYunq+m7ArczqIC3wdvfSfOjGsAPfBka3TLBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvlAzOrN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mspe0otL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqX5O3817469
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hE87YDM346xY0/c4ihSjXEFC
	rD0qY3InktQDxghWLY8=; b=mvlAzOrNjNF02R2JMfX7YYaSshNlxY/sVJ5rkfn0
	YJysB+Y9kEFud3GcIJ+p+thLkBX7t5guqqVlrIShGS81SCdGQxa7ODgDWtw2puJO
	EF17X8f4HNl3hg+LdfLT6kdyAxNW75eTiUACb/JQo5rofXSMuuYL2bE1MJZJ1iJr
	sakcXFkBVSYUlgqqv5hEg8YTl0Wv2fhvRyakKea2D0I9MqL69BD2hdOcQ8xojVAG
	FKsozZUt6tJaw1kYHHxKUbhD9SydUamlI6T7V1IBK8smQp8p6uDsarzXr9xPvAb1
	SGMKie3jS+HNOuugUhtvFvqLT9LpvAIkv1QtAvw/qhZGoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w1ca9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 18:30:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b469e5543so5182241cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774290612; x=1774895412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hE87YDM346xY0/c4ihSjXEFCrD0qY3InktQDxghWLY8=;
        b=Mspe0otL18jGLDxecA18QsMD3uO/yK2aT+RX1hCpN2okk5pVW3/+WUP9lKsPa9uz8O
         7KtEtaUiq+BY+ZWhwLhAV/RdONrKEIOKeALuRuwOLc21kLo3g820loXkd4wfdIBj5hNj
         yIrQxuVZilLDwvpCQDy5iv1KwBvbSTuqFMF4UjYx30pDn7qgO4Bb7yBM7eMQvP4kE+VN
         3r7hHh04VE2fXMTm8L3HUYW1Due9EL9/HGoHwhzvbrI0HMSDjxEeUrUnnKDEKAiiJxbj
         3SSur1uM6iXV1ipWeHQ2rLrFuhoPWLSiL7BObtbCWr/wlEGu5zkN0YK2kNg2OVW+Mi07
         0KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290612; x=1774895412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hE87YDM346xY0/c4ihSjXEFCrD0qY3InktQDxghWLY8=;
        b=c5NzLy4vPb2ONwVtHWO+44bIClx3YrX/T8wG3EUzelg7itiT9kDS6i979duwOQD6od
         OzADGGJYkqt9J/PU3K/Y0xyl9TMUXrrKpq/p3pPHVZDIBU+9VkAO+sQKyup+xkhIU5/k
         yakEyg3fdL/vbzvOQdAXN0OZI/eHNvNm1vlYkJAEYx5aXRn3AFZPMULxSEJpKk91htCG
         reBVHeL5Y9xHSeUkUlieC+Lst3P/ITgQ2oghLtPCKQyurDWpOQeCSh0oJGPYPhGs3+UO
         OGLNE0unF4YS3W0F4nCbV051Byra2k4C4VpsOzXRP/d/mBtLaYlpHZCzUK3wSZNU7UHM
         +A0g==
X-Forwarded-Encrypted: i=1; AJvYcCU/QcbO24B21ZT/xTMlYop5r8NNHz3q8FQbQydrIU/+doq1gUSYjwDagl7I7OViMY1aZha4tXDncaK/vPe0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YZxmd/phmqF4Y7i7PHMTQQMKPeEx68ssqv3zP9MmurHGhulM
	vh6inuSPWe2oKkHb5G0TZ/brMGZaH404fu8nOVXV42CLuy69xLWfSBjqsPSo+Zk/I4p7nvCbGsY
	ddieWNM5FMPgu1riQH1zsD+A9QZQVWdaDH80lZx+JQxp1EgBaRGZhzw41kPC1JXCgd24Y
X-Gm-Gg: ATEYQzzef7mDhq7c5NbFvpU/Ys7RRojKrC4jSaVx3/aJQ0mXejYFy+6MDeB65Vd6OzI
	6cK9fA7jmIml1wyTWIKPV5/cNrThWRYW29DwAf0u5sxrCZpPePBATQ3FkTwUsDMkBWEjkZLTBwN
	kuzGoHu8O6xSkA5ceT9GxKqPwxo57Arc7pV2NfCu9ZW8zn19jR05GV1n1B69QogGwGh6MqBxO74
	WLlex5c0aSi3FKfYPL7nDsKuN1GA1ia9HWVLBJtecZuLEW0hZ/AFQEU6I/LOY/gtMlTuaPoZO7Z
	stZY+NtSpRojLmPkc/gAYLP+aCnccZ8nd3umTL8Dc9Lp0pQ4LhtiC85aN6WjflY7+pf+WEjQLGP
	xhnkKVf34R8Kj0ek+R6kuTkXQNKiHWDOJ9A==
X-Received: by 2002:ac8:5dd4:0:b0:50b:3e14:47f5 with SMTP id d75a77b69052e-50b3e14497fmr180906301cf.44.1774290612070;
        Mon, 23 Mar 2026 11:30:12 -0700 (PDT)
X-Received: by 2002:ac8:5dd4:0:b0:50b:3e14:47f5 with SMTP id d75a77b69052e-50b3e14497fmr180905481cf.44.1774290611370;
        Mon, 23 Mar 2026 11:30:11 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm31537345f8f.18.2026.03.23.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:30:10 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:30:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza: Disable UFS MCQ mode
Message-ID: <y3yh35ksfxhpkddy4hmaykcvfriktgrpr2mrphjbnwfqqibvrg@iaav4fzdmk2o>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-3-c633a6064a24@oss.qualcomm.com>
 <f213a0ac-e978-4d4a-8f1f-d8dba1522b80@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f213a0ac-e978-4d4a-8f1f-d8dba1522b80@kernel.org>
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c186b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qMdXunIOMe4fcqbnUisA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: e04zK1K6HwG5889Q7G1bjSFZ6Cog4AgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEzNiBTYWx0ZWRfX0ogOpAVMQjEv
 nTN5seTTgNK9yc/Xj+a9Vt+l/8gE84Qv5qHuuNAh5HLVM3dzHDhlckFzDyVmxa7GhwulrBt/Ucs
 tzjYaIWOnX/zJglyisheOWfTj1kQB2v460Lu9Ho5kk7yRXKXOy5zQSCruf/3zeahW3g2XNgy3En
 DA8CUasbG20wvC0f/ort3Do8Q8mRopCm/1xLVoeDQQH3Ky2dG4ddBzHw3BiyFRnFS+d9i8IRHs3
 lNVW9ACBwpt0Q3nI/G04kFeVETIEu3p26AUB7UGR6pmHgsWf3LDHtqziOq0+YEwUFW3BzqLtexY
 w1zZaki2SwWyvNcODCQLZ2D7EwKQTcTbk6wT5/p61D49BWvyVg3Fg0kRspgttvQpAnNH9SjWNes
 ECn+3gQii5vKzm0z9oMYAoxmnzeSLF0ioZiL8lzV3O4GoEaNUeCccDF0RUlQV3fj6NDeOQyAcTy
 qShmxHG9KEkFRaMXEvQ==
X-Proofpoint-GUID: e04zK1K6HwG5889Q7G1bjSFZ6Cog4AgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230136
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
	TAGGED_FROM(0.00)[bounces-99373-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97A772FBE5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-22 20:43:01, Krzysztof Kozlowski wrote:
> On 22/03/2026 17:08, Abel Vesa wrote:
> > The UFS MCQ mode is currently not functional in the driver. Eliza is
> > the first platform enabling it, which results in UFS failures at runtime
> > with errors such as:
> > 
> >   ufshcd-qcom 1d84000.ufshc: ufshcd_abort: Device abort task at tag 4
> >   ufs_device_wlun 0:0:0:49488: tag#4 CDB: opcode=0x1b 1b 00 00 00 10 00
> > 
> > The failures occur when accessing the UFS device, while the controller
> > and PHY initialize correctly.
> > 
> > Disable MCQ mode by removing the corresponding register range. This can
> > be reverted once MCQ support is fixed in the driver.
> > 
> > Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/eliza.dtsi | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> 
> MCQ should be disabled in the driver, not via DTS. You have specific
> eliza compatible for exactly this purpose.

Actually, MCQ support is working, See my reply to Nitin. there is an issue
with the GCC driver for which I'll send a patch soon.

