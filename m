Return-Path: <linux-arm-msm+bounces-99152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GcPMLoHwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB12EF103
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66187304812F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D534638837E;
	Mon, 23 Mar 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMmfaJhJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5u8qKjl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C50C3876D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257624; cv=none; b=oCkJWVN21ikGnkokhAgRzIWSjsbYzvW2CkzrI7cusxzpLI9dTeJoTwsYGiMiIeQcEJtdvukmzYZT4APdiTol5glkxwberd+g9lG70OHfVe07b0enuoP8A0fWAnHdNRav2CPVNSvLiAQBPf9QoqVw1MF9jumuGXJ5KDMr1jdI3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257624; c=relaxed/simple;
	bh=VVj3okNTlePIGig5k7YzN8fdhlKG52AGUhCX0tuh8rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmXG2eP0hfmG2bnxN0EgWkOITT3NiSzlV05DnLt/IoG6oZIP4U0IHWTeqVoiSgKGlLsFBAalbI5ty16eNAv+ftdc+htckfqaYOfbmSrQo8xRyfuBGp5NgmQH+rglE4jUYYh49RAl5ZK2YRvTQtjttM++3gQu7Uq3Mt+LtgPXSXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMmfaJhJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5u8qKjl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ABDw3588156
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Le3dsLCweuKduJ+IqHrXfj64
	YU/2qmjfq2MzgIVID30=; b=EMmfaJhJK0tFSK+TTcCRevRcdc8waHXeu/zA0a/q
	yhku4lNpS/Ar9IhW/mi1+ZNm52qyYdsDeAtwispxJesWqihud3oNXI/5HofOGnqH
	YAT3ICj265s9PfD7UakkdWY7SZ4dk6a4UhjZawUIIzdtIe53hB+EMP5dGHayoy2M
	VLFrrADxZmoZjmb9XQInA+VPZj2osMeaM0Dh01nr58uOaCr1lWEIFnKuWQKe74DU
	xi9yUjI160Ca868qf6GhzDcBOeH4YmgoFl/SXYv8cWKv8fX8i10S0j+SXDupCmPg
	8TteS9QEoqm1a2spWPr/Bi9ScXNL0DNWfKdyR2vz01SL6Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jmjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:20:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354be1b25c3so2651100a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257622; x=1774862422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Le3dsLCweuKduJ+IqHrXfj64YU/2qmjfq2MzgIVID30=;
        b=V5u8qKjl6k/2EX1+OMALmKXi78tYFjt7B4uVQyC6Sc9lOkahUzzVEY2JzVVT0EsFw4
         p4/mZEg2KFt5xt7P9VZRgXVQ4BURlS5kNwgVFNWeA0d7PK7WnFAeeDpbMJiNzW+k5rw1
         z89c8f18F6bqonRC/wNTvUy2xpq14FWNRVB2OMIX4V5dmR2MjuDTjFC0qVApjpGrh9iG
         HHRkSQXgUcNwrU2f+RpAnRjkmUlFZL45dhWKbT7AlhWe/5Ptiumd7dvf2tagkquTwS1s
         n8NNnjc94XSLOyGopvsMiKZ5gFlzI9i3sRR92UwXLPe0Chk/6wXutpBLYjBV+diObbBa
         rpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257622; x=1774862422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le3dsLCweuKduJ+IqHrXfj64YU/2qmjfq2MzgIVID30=;
        b=nEZgyOwjUSe5PIxxv2KEFnj+xBYs9wH1kq0zaiKTDi5e92bkhHzVd6PgF/AHWKlT8y
         LYq/66YHYllOL/ft+pZaNBOdTpdoBr/2PifKgiIeA3wdbmgb67yYolZt0U55nJjIolqH
         TvnkyGHzH2A9Ivwj143OzW9f+cFvPxABnnw7ZletFteqoKtC/LdcVtyp9DMM2soatAMy
         MbI2iXZhImqgBQ+QHpEdjgRAmDuRTmjOdam/92R3UUd8DScobIe8qwxRBN/h3hXQq7gm
         96VEfgSG1FZyagnv3ixmQMSje346mTX3eIXEM28NFt87HIBr4SrDe+M9w2x26VsuCJaJ
         9gHA==
X-Forwarded-Encrypted: i=1; AJvYcCVDoUFsLRw8eHjLAJ2yuB79ag1LFjn8nWDqJBfG9SJaL8eODAuhMZhwX6xUhdvTlnaylCak8TLyx39J4Yop@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8aRDxkUxd1CZwiOgJH84efag835331mik/8vbbqYMfJDuGzZz
	V0xHsSsbyeNqExIBrXvK6M5BpVQhL1IBXOz2ERUh4AEo+0BLUiMSk1QxJVOPhHOQH1U/6nPYM0X
	js2yChy8beEDLQh5FjXobvc01J1VlGCTwihSH1R5AG4NKyIBYZfIZ+YgnwbFfRGQE8zBA
X-Gm-Gg: ATEYQzyxOCOV9ttlcBcPRx+UstXOvFDIHHVr+hL0uSzsd7xapq5BQpAIdpDROW9X3lv
	skErcz7hkVQWvO/oHb7eASwR8ptq/YmRZAeSGqJOLjlTWw4pXMwf9bARvtD9zpJ8gexHPKxs/3c
	Hp6Jk+auNqRmfqX1em9AmD5HTp+g3lGdrQDFjo32xEqqfhwsulRyhqisdSU8i+7DTJ3uFvFRBvL
	LMX2+kxSmNmY9dr/7mltSKusBAWdEY4KhZzZmDiTSMfHjHoBrMhm/PmhgUTaYM/HpDfrpgmNg/r
	62iKJjeEpG0DQ/zXeA+guz7zwE3lpIXyrUMhsSiKxKOMnACue9zob/Ik74RljSULWmwiSKZA3Gj
	YLJbLoO6SUalJLLeUa2bfg5w6ilM2OI+NIXTDfYPdIVc21QzFmsvhicnO+OmDMiDU4ocbqQD7fo
	fOD1cG4vWGyvZx1idpW7KraLLNK7nBHu6ThYLuVN0gcQ==
X-Received: by 2002:a17:90b:384a:b0:35b:e4f6:3a4c with SMTP id 98e67ed59e1d1-35be4f63c05mr3253860a91.0.1774257622165;
        Mon, 23 Mar 2026 02:20:22 -0700 (PDT)
X-Received: by 2002:a17:90b:384a:b0:35b:e4f6:3a4c with SMTP id 98e67ed59e1d1-35be4f63c05mr3253848a91.0.1774257621692;
        Mon, 23 Mar 2026 02:20:21 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ed0777sm12093180a91.0.2026.03.23.02.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:20:20 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:50:15 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: monaco-evk: add lt8713sx bridge
 with displayport
Message-ID: <acEFz2wF0CWJ2x1h@hu-vishsain-blr.qualcomm.com>
References: <20260319-lt8713sx-bridge-linux-for-next-v4-0-da886ec78fe3@oss.qualcomm.com>
 <20260319-lt8713sx-bridge-linux-for-next-v4-1-da886ec78fe3@oss.qualcomm.com>
 <c2b89cb3-dfc0-4793-8b0c-8ada5e535207@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2b89cb3-dfc0-4793-8b0c-8ada5e535207@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX0nqsDyK/kxe0
 6glyGbU0lBoOCjh0tgzjoyGihsLAcml8rX59/8o4rjEiYbQ2BAGB2PZEszmOD3Zr5zrb8Og8oRY
 J85nyR4i2xUaAONMxGftwKOucB7KS6GWSwOX1oYf1DBHaWSOP8zRz0D/odEvVqgGwsqTv9c2vhe
 yS49eJHxP5CwiDoCVn0EnT3L1cykUATMxRWRDsNnBYmzKnSN4A1ozZMWVC//o6fxBiV9PBZUqD6
 HTbTdvnGxzf+pkqCV7ANMKiyzldxWtkMmrtqoamLe3AZbYLHv1CWmCRfOs3Xeyii9wcmoZd9OIU
 tTBKkVYZLTlXDsLFcWG6xMSglMGm/IkBM8aHoZ2hc1S5GXJTzWzsN5NksO8OeVMWuKsyEqbUFPa
 pvCXEKKOeT3yJJ5eTuvveRQrWZI2/ld4Uf3mlLIjAfQVk6UQA8QskvJmj2UFsD1Cp61NcKZhiN8
 +6DS4EIobGYPMxIJ4yw==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c105d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9lST3B_NRd4_nVoNR2gA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: asZkL_LDsf435Q9wJ2JPVoKu4u2EyEKe
X-Proofpoint-GUID: asZkL_LDsf435Q9wJ2JPVoKu4u2EyEKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99152-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,0.0.0.0:email,hu-vishsain-blr.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36DB12EF103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:11:20AM +0100, Konrad Dybcio wrote:
> On 3/18/26 8:08 PM, Vishnu Saini wrote:
> > Monaco-evk has LT8713sx which act as DP to 3 DP output
> > converter. Edp PHY from monaco soc is connected to lt8713sx
> > as input and output of lt8713sx is connected to 3 mini DP ports.
> > 
> > Two ports are available in mainboard and one port
> > is available on Mezz board.
> > 
> > lt8713sx is connected to soc over i2c0 and with reset gpio
> > connected to pin6 of ioexpander5.
> > 
> > Enable the edp nodes from monaco and enable lontium lt8713sx
> > bridge node.
> > 
> > Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +			port@0 {
> > +				reg = <0>;
> > +				lt8713sx_dp_in: endpoint {
> 
> nit: it'd be neat to have a \n before the property and the following
> subnodes

sure, will add a blank line between reg property and lt8713sx_dp endpoint subnodes in next revision.
 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

